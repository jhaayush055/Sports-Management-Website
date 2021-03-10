using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Page_assign_event_teacher : System.Web.UI.Page
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
            bind_DropDownList();
            bind_DropDownList2();
            bind_Gridview();
        }
    }

    private void bind_DropDownList()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select * from tbl_event");
        DropDownList1.DataSource = ds.Tables[0];
        DropDownList1.DataValueField = "id";
        DropDownList1.DataTextField = "event_name";
        DropDownList1.DataBind();
        DropDownList1.DataSource = ds;
        DropDownList1.Items.Insert(0, new ListItem("None", ""));
    }

    private void bind_DropDownList2()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select * from tbl_teacher");
        DropDownList2.DataSource = ds.Tables[0];
        DropDownList2.DataValueField = "id";
        DropDownList2.DataTextField = "teacher_name";
        DropDownList2.DataBind();
        DropDownList2.DataSource = ds;
        DropDownList2.Items.Insert(0, new ListItem("None", ""));
    }
    private void bind_Gridview()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select * from tbl_Assign_Event_Teacher");
        dgv.DataSource = ds;
        dgv.DataBind();
    }

    private bool isSubmit()
    {
        int submit = db.executequery("insert into tbl_Assign_Event_Teacher (Event_Id,Teacher_Id) values('" + DropDownList1.Text + "','" + DropDownList2.Text + "')");
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
        int update = db.executequery("update tbl_Assign_Event_Teacher set Event_Id='" + DropDownList1.Text + "', Teacher_Id='" + DropDownList2.Text + "' where id='" + txtid.Text + "'");
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
        int delete = db.executequery("delete tbl_Assign_Event_Teacher where id='" + txtid.Text + "'");
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
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Assignment Of Event Added Successfully...')</script>");
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
        DropDownList1.ClearSelection();
        DropDownList2.ClearSelection();       
    }

    protected void Update_Click(object sender, EventArgs e)
    {
        try
        {
            if (isUpdate())
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Assignmnet Of Event Updated Successfully...')</script>");
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
            Label ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblid");
            Label Event_Id = (Label)dgv.Rows[e.RowIndex].FindControl("lblEvent_Id");
            Label Teacher_Id = (Label)dgv.Rows[e.RowIndex].FindControl("lblTeacher_Id"); ;

            txtid.Text = ID.Text;
            DropDownList1.Text = Event_Id.Text;
            DropDownList2.Text = Teacher_Id.Text;
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
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Assignment Of Event Deleted Successfully...')</script>");
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