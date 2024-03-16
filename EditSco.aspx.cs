using StudentMmt.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class EditSco : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // 从 Session 中获取学号
            string studentId = (string)Session["StudentIdToEdit"];
            // 使用学号获取要编辑的学生信息
            Student student = GetStudentById(studentId);
            if (student != null)
            {
                string 姓名 = student.Name;
                string 专业 = student.Major;
                string 学号 = student.StudentID;
                string a = student.a.ToString();
                string b = student.b.ToString();
                string c = student.c.ToString();
                string d = student.d.ToString();

                // 将学生信息填充到表单中
                Label7.Text = 姓名;
                Label3.Text = 专业;
                Label2.Text = 学号;
                if (Convert.ToInt32(studentId) > 20000)
                {
                    Panel2.Visible = true;
                    Label1.Text = "数据结构";
                    Label4.Text = "操作系统";
                    Label5.Text = "计算机网络";
                    Label6.Text = "计算机组成原理";
                    TextBox7.Text = a;
                    TextBox2.Text = b;
                    TextBox3.Text = c;
                    TextBox8.Text = d;
                }
                else if (Convert.ToInt32(studentId) < 20000)
                {
                    Label1.Text = "高等数学";
                    Label4.Text = "线性代数";
                    Label5.Text = "概率论";
                    TextBox7.Text = a;
                    TextBox2.Text = b;
                    TextBox3.Text = c;
                }
            }
        }
    }
    private Student GetStudentById(string id)
    {
        int studentId = Convert.ToInt32(id);
        Student student = new Student();
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con.Open();
            string sql = "SELECT * FROM [Studentsmath] WHERE [学号] = @StudentId";
            if (studentId > 20000) { sql = "SELECT * FROM [Studentscomputer] WHERE [学号] = @StudentId"; }

            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("@StudentId", studentId);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        student.StudentID = id;
                        student.Name = reader["姓名"].ToString();
                        student.Major = reader["专业"].ToString();
                        if (studentId < 20000)
                        {
                            student.a = Convert.ToInt32(reader["高等数学"]);
                            student.b = Convert.ToInt32(reader["线性代数"]);
                            student.c = Convert.ToInt32(reader["概率论"]);
                        }
                        else if (studentId > 20000)
                        {
                            student.a = Convert.ToInt32(reader["数据结构"]);
                            student.b = Convert.ToInt32(reader["操作系统"]);
                            student.c = Convert.ToInt32(reader["计算机网络"]);
                            student.d = Convert.ToInt32(reader["计算机组成原理"]);
                        }
                    }
                }
            }
        }
        return student;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Label2.Text) < 20000)
        {
            Response.Redirect("Scomath.aspx");
        }
        else
        {
            Response.Redirect("Scocom.aspx");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            // 创建SqlCommand对象
            using (SqlCommand cmd = new SqlCommand())
            {
                int 学号 = Convert.ToInt32(Label2.Text);
                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                if (学号 < 20000)
                {
                    int a = Convert.ToInt32(TextBox7.Text);
                    int b = Convert.ToInt32(TextBox2.Text);
                    int c = Convert.ToInt32(TextBox3.Text);
                    int all = a + b + c;
                    cmd.CommandText = "UPDATE Studentsmath SET 高等数学=@高等数学, 线性代数=@线性代数, 概率论=@概率论, 总成绩=@总成绩 WHERE 学号=@学号";
                    cmd.Parameters.AddWithValue("@学号", 学号);
                    cmd.Parameters.AddWithValue("@高等数学", a);
                    cmd.Parameters.AddWithValue("@线性代数", b);
                    cmd.Parameters.AddWithValue("@概率论", c);
                    cmd.Parameters.AddWithValue("@总成绩", all);
                }
                else
                {
                    int a = Convert.ToInt32(TextBox7.Text);
                    int b = Convert.ToInt32(TextBox2.Text);
                    int c = Convert.ToInt32(TextBox3.Text);
                    int d = Convert.ToInt32(TextBox8.Text);
                    int all = a + b + c;
                    cmd.CommandText = "UPDATE Studentscomputer SET 数据结构=@数据结构, 操作系统=@操作系统, 计算机网络=@计算机网络, 计算机组成原理=@计算机组成原理, 总成绩=@总成绩 WHERE 学号=@学号";
                    cmd.Parameters.AddWithValue("@学号", 学号);
                    cmd.Parameters.AddWithValue("@数据结构", a);
                    cmd.Parameters.AddWithValue("@操作系统", b);
                    cmd.Parameters.AddWithValue("@计算机网络", c);
                    cmd.Parameters.AddWithValue("@计算机组成原理", c);
                    cmd.Parameters.AddWithValue("@总成绩", all);
                }
                cmd.ExecuteNonQuery();
                con.Close();
                if (学号 < 20000) Response.Redirect("Scomath.aspx");
                else Response.Redirect("Scocom.aspx");
            }
        }
    }
}
