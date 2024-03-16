using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button3.Visible = true;
        if (DropDownList1.SelectedValue == "计算机")
        {
            Panel1.Visible = true;
            Panel2.Visible = true;
            Label2.Text = "数据结构";
            Label3.Text = "操作系统";
            Label4.Text = "计算机网络";
            Label5.Text = "计算机组成原理";
        }
        else
        {
            Panel1.Visible = true;
            Label2.Text = "高等数学";
            Label3.Text = "线性代数";
            Label4.Text = "概率论";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            // 创建SqlCommand对象
            using (SqlCommand cmd = new SqlCommand())
            {
                string 姓名 = TextBox1.Text;
                string 专业 = DropDownList1.SelectedValue;
                string 性别 = DropDownList2.SelectedValue;
                int 年龄 = Convert.ToInt32(TextBox4.Text);
                DateTime 出生日期 = Convert.ToDateTime(TextBox5.Text);
                string 家庭住址 = TextBox6.Text;

                int maxID = 0;
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                if (专业 == "数学")
                {
                    cmd.CommandText = "SELECT MAX(学号) FROM [Studentsmath]";
                    con.Open();
                    Object result = cmd.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        maxID = Convert.ToInt32(result);
                    }
                    maxID++;
                }
                else if (专业 == "计算机")
                {
                    cmd.CommandText = "SELECT MAX(学号) FROM [Studentscomputer]";
                    con.Open();
                    Object result = cmd.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        maxID = Convert.ToInt32(result);
                    }
                    maxID++;
                }


                if (专业 == "计算机")
                {
                    int 数据结构 = Convert.ToInt32(TextBox7.Text);
                    int 操作系统 = Convert.ToInt32(TextBox2.Text);
                    int 计算机网络 = Convert.ToInt32(TextBox3.Text);
                    int 计算机组成原理 = Convert.ToInt32(TextBox8.Text);
                    int 总成绩 = 数据结构 + 操作系统 + 计算机网络 + 计算机组成原理;
                    cmd.CommandText = "INSERT INTO Studentscomputer (学号, 姓名, 专业, 性别, 年龄, 出生日期, 家庭住址, 数据结构, 操作系统, 计算机网络, 计算机组成原理, 总成绩) VALUES (@学号, @姓名, @专业, @性别, @年龄, @出生日期, @家庭住址, @数据结构, @操作系统, @计算机网络, @计算机组成原理, @总成绩)";
                    cmd.Parameters.AddWithValue("@学号", maxID);
                    cmd.Parameters.AddWithValue("@姓名", 姓名);
                    cmd.Parameters.AddWithValue("@专业", 专业);
                    cmd.Parameters.AddWithValue("@性别", 性别);
                    cmd.Parameters.AddWithValue("@年龄", 年龄);
                    cmd.Parameters.AddWithValue("@出生日期", 出生日期);
                    cmd.Parameters.AddWithValue("@家庭住址", 家庭住址);
                    cmd.Parameters.AddWithValue("@数据结构", 数据结构);
                    cmd.Parameters.AddWithValue("@操作系统", 操作系统);
                    cmd.Parameters.AddWithValue("@计算机网络", 计算机网络);
                    cmd.Parameters.AddWithValue("@计算机组成原理", 计算机组成原理);
                    cmd.Parameters.AddWithValue("@总成绩", 总成绩);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                else if (专业 == "数学")
                {
                    int 高等数学 = Convert.ToInt32(TextBox7.Text);
                    int 线性代数 = Convert.ToInt32(TextBox2.Text);
                    int 概率论 = Convert.ToInt32(TextBox3.Text);
                    int 总成绩 = 高等数学 + 线性代数 + 概率论;
                    cmd.CommandText = "INSERT INTO Studentsmath (学号, 姓名, 专业, 性别, 年龄, 出生日期, 家庭住址, 高等数学, 线性代数, 概率论, 总成绩) VALUES (@学号, @姓名, @专业, @性别, @年龄, @出生日期, @家庭住址, @高等数学, @线性代数, @概率论, @总成绩)";
                    cmd.Parameters.AddWithValue("@学号", maxID);
                    cmd.Parameters.AddWithValue("@姓名", 姓名);
                    cmd.Parameters.AddWithValue("@专业", 专业);
                    cmd.Parameters.AddWithValue("@性别", 性别);
                    cmd.Parameters.AddWithValue("@年龄", 年龄);
                    cmd.Parameters.AddWithValue("@出生日期", 出生日期);
                    cmd.Parameters.AddWithValue("@家庭住址", 家庭住址);
                    cmd.Parameters.AddWithValue("@高等数学", 高等数学);
                    cmd.Parameters.AddWithValue("@线性代数", 线性代数);
                    cmd.Parameters.AddWithValue("@概率论", 概率论);
                    cmd.Parameters.AddWithValue("@总成绩", 总成绩);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        Response.Redirect("Main.aspx");
    }
}
