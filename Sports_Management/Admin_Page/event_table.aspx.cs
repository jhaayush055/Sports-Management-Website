using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Page_event_table : System.Web.UI.Page
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
            bind_Gridview();
        }
    }

    private void bind_DropDownList()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select * from tbl_event_category");
        DropDownList1.DataSource = ds.Tables[0];
        DropDownList1.DataValueField = "id";
        DropDownList1.DataTextField = "event_category";
        DropDownList1.DataBind();
        DropDownList1.DataSource = ds;
        DropDownList1.Items.Insert(0, new ListItem("None", ""));
    }

    private void bind_Gridview()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select * from tbl_event");
        dgv.DataSource = ds;
        dgv.DataBind();
    }

    private bool isSubmit()
    {
        int submit = db.executequery("insert into tbl_event (event_name,event_category,description,start_date,end_date) values('" + txtename.Text + "','" + DropDownList1.Text + "','" + txtdesp.Text + "','" + txtstartD.Text + "','" + txtendD.Text + "')");
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
        int update = db.executequery("update tbl_event set event_name='" + txtename.Text + "', event_category='" + DropDownList1.Text + "', description='" + txtdesp.Text + "', start_date='" + txtstartD.Text + "', end_date='" + txtendD.Text + "' where id='" + txtid.Text + "'");
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
        int delete = db.executequery("delete tbl_event where id='" + txtid.Text + "'");
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
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Event Added Successfully...')</script>");
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
        txtename.Text = "";
        DropDownList1.ClearSelection();
        txtdesp.Text = "";
        txtstartD.Text = "";
        txtendD.Text = "";
    }

    protected void Update_Click(object sender, EventArgs e)
    {
        try
        {
            if (isUpdate())
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Event Updated Successfully...')</script>");
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
            Label Event = (Label)dgv.Rows[e.RowIndex].FindControl("lblename");
            Label Category = (Label)dgv.Rows[e.RowIndex].FindControl("lblecat");
            Label Description = (Label)dgv.Rows[e.RowIndex].FindControl("lbldesp");
            Label Start = (Label)dgv.Rows[e.RowIndex].FindControl("lblstartD");
            Label End = (Label)dgv.Rows[e.RowIndex].FindControl("lblendD");

            txtid.Text = ID.Text;
            txtename.Text = Event.Text;
            DropDownList1.Text = Category.Text;
            txtdesp.Text = Description.Text;
            txtstartD.Text = Start.Text;
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
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Event Deleted Successfully...')</script>");
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