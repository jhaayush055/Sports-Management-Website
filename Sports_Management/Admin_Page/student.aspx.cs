using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Page_student : System.Web.UI.Page
{
    Database_Manager db = new Database_Manager();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["admin_email"] != null)
            {

            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
        }
        if (!IsPostBack)
        {
            bind_Gridview();
        }
    }

    private void bind_Gridview()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select * from tbl_student");
        dgv.DataSource = ds;
        dgv.DataBind();
    }

    private bool isSubmit()
    {
        string address = txtadd.Text.Replace("'", "");

        int submit = db.executequery("insert into tbl_student (student_id,roll_no,class,division,first_name,last_name,address,mobile_no,email,password) values('" + txtid.Text + "','" + txtroll.Text + "','" + txtclass.Text + "','" + txtdiv.Text + "','" + txtfname.Text + "','" + txtlname.Text + "','" + address + "','" + txtmob.Text + "','" + txtemail.Text + "','" + txtpass.Text + "')");
        if (submit > 0)
        {
            return true;
        }

        else
        {
            return false;
        }
    }

    private bool isUpdate()
    {
        int update = db.executequery("update tbl_student set student_id='" + txtid.Text + "', roll_no='" + txtroll.Text + "', class='" + txtclass.Text + "', division='" + txtdiv.Text + "', first_name='" + txtfname.Text + "', last_name='" + txtlname.Text + "', address='" + txtadd.Text + "', mobile_no='" + txtmob.Text + "', email='" + txtemail.Text + "', password='" + txtpass.Text + "' where student_id='" + txtid.Text + "'");
        if (update > 0)
        {
            return true;
        }

        else
        {
            return false;
        }
    }

    private bool isDelete()
    {
        int delete = db.executequery("delete tbl_student where student_id='" + txtid.Text + "'");
        if (delete > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (isSubmit())
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Student Added Successfully...')</script>");
            }

            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
            }
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
        }
        bind_Gridview();
    }

    protected void Reset_Click(object sender, EventArgs e)
    {
        txtid.Text = "";
        txtroll.Text = "";
        txtclass.Text = "";
        txtdiv.Text = "";
        txtfname.Text = "";
        txtlname.Text = "";
        txtadd.Text = "";
        txtmob.Text = "";
        txtemail.Text = "";
        txtpass.Text = "";
    }

    protected void Update_Click(object sender, EventArgs e)
    {
        try
        {
            if (isUpdate())
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Student Updated Successfully...')</script>");
            }

            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
            }
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
        }
        bind_Gridview();
    }

    protected void dgv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            dgv.PageIndex = e.NewPageIndex;
            bind_Gridview();

            dgv.PageIndex = e.NewPageIndex;
            //BindResumeDetails();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
        }
    }

    protected void dgv_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            Label Stud_ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblid");
            Label Roll = (Label)dgv.Rows[e.RowIndex].FindControl("lblroll");
            Label Class = (Label)dgv.Rows[e.RowIndex].FindControl("lblclass");
            Label Division = (Label)dgv.Rows[e.RowIndex].FindControl("lbldiv");
            Label First = (Label)dgv.Rows[e.RowIndex].FindControl("lblfname");
            Label Last = (Label)dgv.Rows[e.RowIndex].FindControl("lbllname");
            Label Address = (Label)dgv.Rows[e.RowIndex].FindControl("lbladd");
            Label Mobile = (Label)dgv.Rows[e.RowIndex].FindControl("lblmob");
            Label Email = (Label)dgv.Rows[e.RowIndex].FindControl("lblemail");
            Label Pass = (Label)dgv.Rows[e.RowIndex].FindControl("lblpass");

            txtid.Text = Stud_ID.Text;
            txtroll.Text = Roll.Text;
            txtclass.Text = Class.Text;
            txtdiv.Text = Division.Text;
            txtfname.Text = First.Text;
            txtlname.Text = Last.Text;
            txtadd.Text = Address.Text;
            txtmob.Text = Mobile.Text;
            txtemail.Text = Email.Text;
            txtpass.Text = Pass.Text;
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
        }
        bind_Gridview();
    }

    protected void dgv_RowDeleting(object sender, EventArgs e)
    {
        try
        {
            LinkButton btndetails = sender as LinkButton;
            GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
            string Category_ID = dgv.DataKeys[gvrow.RowIndex].Value.ToString();

            txtid.Text = Category_ID;

            if (isDelete())
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Student Deleted Successfully...')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
            }
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
        }
        bind_Gridview();
    }
}