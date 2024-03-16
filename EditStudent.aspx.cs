using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentMmt.Models;

public partial class EditStudent : System.Web.UI.Page
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
                string 性别 = student.Gender;
                string 年龄 = student.Age.ToString();
                string 出生日期 = student.Birthday.ToString("yyyy-MM-dd");
                string 家庭住址 = student.Address;
                string 学号 = student.StudentID;
                // 将学生信息填充到表单中
                TextBox1.Text = 姓名;
                Label3.Text = 专业;
                DropDownList2.SelectedValue = 性别;
                TextBox4.Text = 年龄;
                TextBox5.Text = 出生日期;
                TextBox6.Text = 家庭住址;
                Label2.Text = 学号;
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
                        student.Gender = reader["性别"].ToString();
                        student.Age = Convert.ToInt32(reader["年龄"]);
                        student.Birthday = Convert.ToDateTime(reader["出生日期"]);
                        student.Address = reader["家庭住址"].ToString();
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
            Response.Redirect("Studentmath.aspx");
        }
        else
        {
            Response.Redirect("Studentcom.aspx");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            // 创建SqlCommand对象
            using (SqlCommand cmd = new SqlCommand())
            {
                string 姓名 = TextBox1.Text;
                string 专业 = Label3.Text;
                string 性别 = DropDownList2.SelectedValue;
                int 年龄 = Convert.ToInt32(TextBox4.Text);
                DateTime 出生日期 = Convert.ToDateTime(TextBox5.Text);
                string 家庭住址 = TextBox6.Text;
                int 学号 = Convert.ToInt32(Label2.Text);
                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                if (学号 < 20000) cmd.CommandText = "UPDATE Studentsmath SET 姓名=@姓名, 专业=@专业, 性别=@性别, 年龄=@年龄, 出生日期=@出生日期, 家庭住址=@家庭住址 WHERE 学号=@学号";
                else cmd.CommandText = "UPDATE Studentscomputer SET 姓名=@姓名, 专业=@专业, 性别=@性别, 年龄=@年龄, 出生日期=@出生日期, 家庭住址=@家庭住址 WHERE 学号=@学号";
                cmd.Parameters.AddWithValue("@学号", 学号);
                cmd.Parameters.AddWithValue("@姓名", 姓名);
                cmd.Parameters.AddWithValue("@专业", 专业);
                cmd.Parameters.AddWithValue("@性别", 性别);
                cmd.Parameters.AddWithValue("@年龄", 年龄);
                cmd.Parameters.AddWithValue("@出生日期", 出生日期);
                cmd.Parameters.AddWithValue("@家庭住址", 家庭住址);

                cmd.ExecuteNonQuery();
                con.Close();
                if (学号 < 20000) Response.Redirect("Studentmath.aspx");
                else Response.Redirect("Studentcom.aspx");
            }
        }
    }
}
