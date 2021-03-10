using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Page_sports_round : System.Web.UI.Page
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
        ds = db.getDataset("select * from tbl_sports_round");
        dgv.DataSource = ds;
        dgv.DataBind();
    }

    private bool isSubmit()
    {
        int submit = db.executequery("insert into tbl_sports_round (event_category,no_of_round) values('" + DropDownList1.Text + "','" + DropDownList2.Text + "')");
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
        int update = db.executequery("update tbl_sports_round set event_category='" + DropDownList1.Text + "', no_of_round='" + DropDownList2.Text + "' where id='" + txtid.Text + "'");
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
        int delete = db.executequery("delete tbl_sports_round where id='" + txtid.Text + "'");
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
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Sports Round Added Successfully...')</script>");
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
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Sports Round Updated Successfully...')</script>");
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
            Label Category = (Label)dgv.Rows[e.RowIndex].FindControl("lblecat");
            Label Round = (Label)dgv.Rows[e.RowIndex].FindControl("lblrnd");

            txtid.Text = ID.Text;
            DropDownList1.Text = Category.Text;
            DropDownList2.Text = Round.Text;
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
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Sports Round Deleted Successfully...')</script>");
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