using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Database_Manager
/// </summary>
public class Database_Manager
{
    public Database_Manager()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string getConnectionString()
    {
        return "Data Source=DESKTOP-9N2P6J0;Initial Catalog=Sports_Management;Integrated Security=True";
       // return "Data Source=DESKTOP-9N2P6J0;Initial Catalog=Sports_Management;Persist Security Info=True;User ID=sa;Password=welc0me@123";
    }

    public DataSet getDataset(string query)
    {
        SqlConnection con = new SqlConnection(getConnectionString());
        con.Open();

        SqlCommand cmd = new SqlCommand(query, con);

        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ad.Fill(ds);
        con.Close();

        return ds;
    }

    public int executequery(string query)
    {
        SqlConnection con = new SqlConnection(getConnectionString());
        con.Open();

        SqlCommand cmd = new SqlCommand(query, con);

        int result = cmd.ExecuteNonQuery();
        con.Close();

        return result;
    }
}