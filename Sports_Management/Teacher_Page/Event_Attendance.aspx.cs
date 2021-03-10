using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Teacher_Page_Event_Attendance : System.Web.UI.Page
{
    Database_Manager db = new Database_Manager();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["teacher_email"] != null)
        {

        }
        else
        {
            Response.Redirect("~/login.aspx");
        }

        if (!IsPostBack)
        {
            bind_DropDownList();
        }
    }

    private void bind_Gridview()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select * from tbl_Student_Participate_Event where ISNULL(Mark_Attendance,'A') = 'A' And Event_Id='" + DropDownList1.Text + "'");
        dgv.DataSource = ds;
        dgv.DataBind();
    }

    private void bind_DropDownList()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("Select a.Event_Id, b.event_name from dbo.tbl_Assign_Event_Teacher as a inner join dbo.tbl_event as b On a.Event_Id=b.id where a.Teacher_Id = '" + Session["teacher_email"].ToString() + "'");
        DropDownList1.DataSource = ds.Tables[0];
        DropDownList1.DataValueField = "Event_Id";
        DropDownList1.DataTextField = "event_name";
        DropDownList1.DataBind();
        DropDownList1.DataSource = ds;
        DropDownList1.Items.Insert(0, new ListItem("None", ""));
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {
            bind_Gridview();   
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
        }        
    }

    protected void Mark_Attendance_Click(object sender, EventArgs e)
    {
        Boolean bln_Mark_Attendance = false;
        foreach (GridViewRow row in dgv.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {                
                CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                if (chkRow.Checked)
                {
                    string _id = dgv.DataKeys[row.RowIndex].Value.ToString(); //row.Cells[1].Text;

                    int update = db.executequery("update tbl_Student_Participate_Event set Mark_Attendance='P', Mark_Attendance_On=getdate() where id='" + _id + "'");
                    if (update > 0)
                    {
                        bln_Mark_Attendance = true;
                    }
                }                
            }
        }

        if (bln_Mark_Attendance == true)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Mark Attendance Successfully...')</script>");
            bind_Gridview();
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
        }
    }
}