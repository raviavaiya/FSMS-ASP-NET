using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addbrand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private Boolean checkbrand()
    {
        Boolean brandavailable = false;
        String mycon = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        String myquery = "Select * from tbl_brand where b_name='" + txtbrandname.Text + "'";
        SqlConnection con = new SqlConnection(mycon);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            brandavailable = true;

        }
        con.Close();

        return brandavailable;
    }

    protected void btnaddbrand_Click(object sender, EventArgs e)
    {
        if (checkbrand() == true)
        {

            branderror.Text = "Your Enter Brand Already Exists";
            txtbrandname.Text = "";
            branderror.BackColor = System.Drawing.Color.IndianRed;

        }
        else
        {


            string brand = txtbrandname.Text;
            String query = "insert into tbl_brand (b_name) values('" + brand + "')";
            String mycon = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            txtbrandname.Text = "";
            Response.Redirect("brand.aspx");
        }
    }
}