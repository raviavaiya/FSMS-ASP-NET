using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_subcategory : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["subcatid"]))
        {
            int subcatid;
            if (int.TryParse(Request.QueryString["subcatid"], out subcatid))
            {
                Deletesubcategory(subcatid);
            }
        }

        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_subcategory", con);
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        viewsubcategory.DataSource = dt;
        viewsubcategory.DataBind();
        con.Close();

    }

    private void Deletesubcategory(int subcatid)
    {

        con.Open();
        using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_subcategory WHERE sb_id = @subcatid", con))
        {
            cmd.Parameters.AddWithValue("@subcatid", subcatid);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deleting
        Response.Redirect("subcategory.aspx");
    }
}