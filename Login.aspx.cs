using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataBind();
        }
        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM [Mmtuser] WHERE Username=@Username AND Password=@Password";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
            command.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                Session["user"] = txtUsername.Text;
                // 登录成功，跳转到另一个页面
                Response.Redirect("Main.aspx");
            }
            else
            {
                // 登录失败，显示错误消息
                lblError.Visible = true;
                lblError.Text = "用户名或密码错误！";
            }
        }
    }
}
