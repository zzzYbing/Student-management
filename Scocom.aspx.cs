using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Scocom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // 获取要删除的行的ID
        int 学号 = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        // 在数据库中删除该行
        DeleteRow(学号);
        // 重新绑定数据源
        BindGrid();
    }
    private void BindGrid()
    {
        // 重新绑定数据源
        GridView1.DataSource = GetData();
        GridView1.DataBind();
    }
    private void DeleteRow(int 学号)
    {
        // 创建SqlConnection对象
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            // 创建SqlCommand对象
            using (SqlCommand cmd = new SqlCommand())
            {
                // 设置SqlCommand对象的属性
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "DELETE FROM Studentscomputer WHERE 学号=@学号";
                cmd.Parameters.AddWithValue("@学号", 学号);
                // 打开数据库连接
                con.Open();
                // 执行SqlCommand对象
                cmd.ExecuteNonQuery();
            }
        }
    }
    private DataTable GetData()
    {
        // 创建DataTable对象
        DataTable dt = new DataTable();
        // 创建SqlConnection对象
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            // 创建SqlCommand对象
            using (SqlCommand cmd = new SqlCommand())
            {
                // 设置SqlCommand对象的属性
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM Studentscomputer";
                // 创建SqlDataAdapter对象
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    // 填充DataTable对象
                    sda.Fill(dt);
                }
            }
        }
        // 返回DataTable对象
        return dt;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Studentcom.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Logon.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Studentmath.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Scomath.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Scocom.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add.aspx");
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        string studentId = ((Button)sender).CommandArgument;
        // 将学号保存到 Session 中
        Session["StudentIdToEdit"] = studentId;
        Response.Redirect("EditSco.aspx");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string studentNumber = txtSearch.Text;

        // 设置 SelectCommand 属性的 SQL 查询语句
        SqlDataSource1.SelectCommand = "SELECT * FROM [Studentscomputer] WHERE [学号] = @StudentNumber";

        // 设置查询的参数值
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add("StudentNumber", studentNumber);

        // 重新绑定 GridView 控件，以显示符合条件的数据
        GridView1.DataBind();
    }
}
