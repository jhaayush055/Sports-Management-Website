using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Student_Page_Winner_List : System.Web.UI.Page
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
        ds = db.getDataset("Select a.id, b.first_name + ' ' + b.last_name as Student_Id,Event_Id,'Winner No - '+Winner_No As Winner_No,Winner_Declare_On from tbl_Student_Participate_Event as a inner join tbl_student as b on a.Student_Id=b.id Where ISNULL(Winner_No,'0') != '0'");
        dgv.DataSource = ds;
        dgv.DataBind();
    }
}