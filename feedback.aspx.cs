using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class feedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Close();
        con.Open();
        String email = (String)Session["useremail"];

        // Use separate SqlDataReader instances for different queries
        SqlCommand selectUser = new SqlCommand("SELECT * FROM tbl_user WHERE email='" + email + "'", con);
        SqlDataReader userReader = selectUser.ExecuteReader();

        if (userReader.Read())
        {
            txtusername.Text = userReader["email"].ToString();
            string gender = userReader["gender"].ToString();
           
        }
        con.Close();
    }

    protected void btnfeedback_Click(object sender, EventArgs e)
    {
        String username = txtusername.Text;
        String message = txtmessage.Text;
        String query = "insert into tbl_feedback (email, message) values ('" + username + "','" + message + "')";
        String mycon = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        SqlConnection con = new SqlConnection(mycon);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = query;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        txtusername.Text = "";
        txtmessage.Text = "";
        Response.Redirect("Default.aspx");
    }
}