using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addcategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private Boolean checkcategory()
    {
        Boolean categoryavailable = false;
        String mycon = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        String myquery = "Select * from tbl_category where c_name='" + txtcategoryname.Text + "'";
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
            categoryavailable = true;

        }
        con.Close();

        return categoryavailable;
    }

    protected void btnaddcategory_Click(object sender, EventArgs e)
    {

        if (checkcategory() == true)
        {

            lblcategory.Text = "Your Enter Category Already Exists";
            txtcategoryname.Text = "";
            lblcategory.BackColor = System.Drawing.Color.IndianRed;

        }
        else
        {


            string category = txtcategoryname.Text;
            String query = "insert into tbl_category (c_name) values('" + category + "')";
            String mycon = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            txtcategoryname.Text = "";
            Response.Redirect("category.aspx");
        }

    }
}