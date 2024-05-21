using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_addsubcategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CascadeDropDowncategory();
        }
    }


    //private Boolean checkcategory()
    //{
    //    Boolean categoryavailable = false;
    //    String mycon = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
    //    String myquery = "Select * from tbl_category where c_name='" + DropDowncategory.SelectedItem.Text + "'";
    //    SqlConnection con = new SqlConnection(mycon);
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.CommandText = myquery;
    //    cmd.Connection = con;
    //    SqlDataAdapter da = new SqlDataAdapter();
    //    da.SelectCommand = cmd;
    //    DataSet ds = new DataSet();
    //    da.Fill(ds);
    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        categoryavailable = true;

    //    }
    //    con.Close();

    //    return categoryavailable;
    //}

    protected void CascadeDropDowncategory()
    {
        String cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_category", conn);
        cmd.CommandType = CommandType.Text;
        DropDowncategory.DataSource = cmd.ExecuteReader();
        DropDowncategory.DataTextField = "c_name";
        DropDowncategory.DataValueField = "c_id";
        DropDowncategory.DataBind();
        DropDowncategory.Items.Insert(0, new ListItem("-- Select Category --", "0"));
    }
    protected void btnaddcategory_Click(object sender, EventArgs e)
    {

        //if (checkcategory() == true)
        //{

        //    lblsubcategory.Text = "Your Enter Category Already Exists";
        //    DropDowncategory.SelectedItem.Text = "";
        //    lblsubcategory.BackColor = System.Drawing.Color.IndianRed;

        //}
        //else
        //{


        String cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        string subcategory = txtsubcategoryname.Text;
        String category = DropDowncategory.SelectedItem.Text.ToString();
        String query = "insert into tbl_subcategory (sc_name, c_name) values('" + subcategory + "','" + category + "')";
        conn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = query;
        cmd.Connection = conn;
        cmd.ExecuteNonQuery();
        txtsubcategoryname.Text = "";
        //}
    }
}