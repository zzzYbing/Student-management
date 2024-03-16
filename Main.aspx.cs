using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            string username = Session["user"].ToString();
            Label1.Text = username;
        }
        else
        {
            Label1.Text = "";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Studentcom.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
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
}
