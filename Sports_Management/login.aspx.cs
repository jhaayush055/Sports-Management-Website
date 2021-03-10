using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    Database_Manager db = new Database_Manager();
    string user_id;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private bool isAdmin()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select id, admin_email,password from tbl_admin_login where admin_email='" + txtemail.Text + "'and password='" + txtpass.Text + "'");

        if (ds.Tables[0].Rows.Count > 0)
        {
            user_id = ds.Tables[0].Rows[0]["id"].ToString();
            return true;
        }
        else
        {
            return false;
        }
    }

    private bool isTeacher()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select id, teach_id,password from tbl_teacher where teach_id='" + txtemail.Text + "'and password='" + txtpass.Text + "'");

        if (ds.Tables[0].Rows.Count > 0)
        {
            user_id = ds.Tables[0].Rows[0]["id"].ToString();
            return true;
        }
        else
        {
            return false;
        }
    }

    private bool isStudent()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select id, email,password from tbl_student where email='" + txtemail.Text + "'and password='" + txtpass.Text + "'");

        if (ds.Tables[0].Rows.Count > 0)
        {
            user_id = ds.Tables[0].Rows[0]["id"].ToString();
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (isAdmin())
            {
                Session["admin_email"] = user_id;
                Response.Redirect("~/Admin_Page/dashboard.aspx");
            }

            else if (isTeacher())
            {
                Session["teacher_email"] = user_id;
                Response.Redirect("~/Teacher_Page/dashboard.aspx");
            }

            else if (isStudent())
            {
                Session["student_email"] = user_id;
                Response.Redirect("~/Student_Page/dashboard.aspx");
            }

            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Email Address and Password')</script>");
            }
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
        }
    }
}