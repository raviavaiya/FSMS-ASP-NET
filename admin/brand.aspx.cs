using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_brand : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["brandid"]))
        {
            int brandid;
            if (int.TryParse(Request.QueryString["brandid"], out brandid))
            {
                Deletebrand(brandid);
            }
        }
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_brand", con);
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        viewbrand.DataSource = dt;
        viewbrand.DataBind();
        con.Close();
    }
    private void Deletebrand(int brandid)
    {

        con.Open();
        using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_brand WHERE b_id = @brandid", con))
        {
            cmd.Parameters.AddWithValue("@brandid", brandid);
            cmd.ExecuteNonQuery();
        }


        // Redirect back to the product page after deleting
        Response.Redirect("brand.aspx");
    }
}