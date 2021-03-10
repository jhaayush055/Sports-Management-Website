using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Student_Page_Participate_In_Event : System.Web.UI.Page
{
    Database_Manager db = new Database_Manager();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["student_email"] != null)
        {

        }
        else
        {
            Response.Redirect("~/login.aspx");
        }

        if (!IsPostBack)
        {
            bind_Gridview();
        }
    }

    private void bind_Gridview()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select * from tbl_event");
        dgv.DataSource = ds;
        dgv.DataBind();
    }

    protected void dgv_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            Label ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblid");

            DataSet ds = new DataSet();
            ds = db.getDataset("select * from tbl_Student_Participate_Event where Student_Id='" + Session["student_email"].ToString() + "' And Event_Id='" + ID.Text + "'");

            if (ds.Tables[0].Rows.Count > 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('You allready Participate in this event...')</script>");
            }
            else
            {
                int submit = db.executequery("insert into tbl_Student_Participate_Event (Student_Id,Event_Id) values('" + Session["student_email"].ToString() + "','" + ID.Text + "')");
                if (submit > 0)
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Participate in event Successfully...')</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
                }
            }
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
        }
        bind_Gridview();
    }
}