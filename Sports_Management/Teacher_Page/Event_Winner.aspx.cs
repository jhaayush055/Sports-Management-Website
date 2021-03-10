using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Teacher_Page_Event_Winner : System.Web.UI.Page
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

    private void bind_DropDownList2()
    {
        DataSet ds = new DataSet();
        ds = db.getDataset("select a.Student_Id,c.first_name + ' ' + c.last_name as Student_Name from tbl_Student_Participate_Event as a inner Join tbl_sports_round as b On a.Event_Id=b.event_category inner join tbl_student as c on a.Student_Id=c.id where ISNULL(Mark_Attendance,'A') = 'P' And ISNULL(Round_In,'0') = b.no_of_round And ISNULL(Winner_No,'0') = '0' And a.Event_Id = '" + DropDownList1.Text + "'");

        DropDownList2.DataSource = ds.Tables[0];
        DropDownList2.DataValueField = "Student_Id";
        DropDownList2.DataTextField = "Student_Name";
        DropDownList2.DataBind();
        DropDownList2.DataSource = ds;
        DropDownList2.Items.Insert(0, new ListItem("None", ""));
    }

    private void bind_DropDownList3()
    {
        DataTable dt = new DataTable("Winner");
        dt.Columns.Add("Id");
        dt.Columns.Add("Name");

        for (int j = 1; j <= 3; j++)
        {
            dt.Rows.Add(j, "Winner_" + j);
        }

        DropDownList3.DataSource = dt;// ds.Tables[0];
        DropDownList3.DataValueField = "Id";
        DropDownList3.DataTextField = "Name";
        DropDownList3.DataBind();
        DropDownList3.DataSource = dt;
        DropDownList3.Items.Insert(0, new ListItem("None", ""));
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        try
        {
            bind_DropDownList2();
        }

        catch (Exception ex)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
        }
    }

    protected void Add_Winner_Click(object sender, EventArgs e)
    {
        Boolean bln_Suscess = false;
        int update = db.executequery("update tbl_Student_Participate_Event set Winner_No='" + DropDownList3.Text + "', Winner_Declare_On=getdate() where Event_Id='" + DropDownList1.Text + "' And Student_Id='" + DropDownList2.Text + "'");
        if (update > 0)
        {
            bln_Suscess = true;
        }

        if (bln_Suscess == true)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Winner Added Successfully...')</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
        }
        bind_DropDownList2();
        DropDownList3.ClearSelection();
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bind_DropDownList3();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
        }
    }
}