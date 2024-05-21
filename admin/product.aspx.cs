using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IdentityModel.Protocols.WSTrust;

public partial class admin_product : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
           

            string statusIdStr = Request.QueryString["statusid"];
            if (!string.IsNullOrEmpty(statusIdStr))
            {
                int statusId;
                if (int.TryParse(statusIdStr, out statusId))
                {
                    UpdateStatus(statusId);
                }
            }


            if (!string.IsNullOrEmpty(Request.QueryString["deleteid"]))
            {
                int productId;
                if (int.TryParse(Request.QueryString["deleteid"], out productId))
                {

                    DeleteProduct(productId);
                }
            }



            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_product", con);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            viewproduct.DataSource = dt;
            viewproduct.DataBind();
            con.Close();

        }


        
    }


    private void UpdateStatus(int productId)
    {
        // Connect to your database and execute an UPDATE command
        string query = "UPDATE tbl_product SET status = CASE WHEN status = 1 THEN 0 ELSE 1 END WHERE p_id = @ProductId";

        using (SqlConnection con = new SqlConnection("Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True"))
        {
            using (SqlCommand command = new SqlCommand(query, con))
            {
                command.Parameters.AddWithValue("@ProductId", productId);

                try
                {
                    con.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        // The status was updated successfully. You can redirect the user to the same page to refresh the data.
                        Response.Redirect("product.aspx");
                    }
                }
                catch (Exception ex)
                {
                    // Handle the exception (e.g., log the error)
                }
            }
        }
    }


    private void DeleteProduct(int productId)
    {
        
            con.Open();
            using (SqlCommand cmd = new SqlCommand("DELETE FROM tbl_product WHERE p_id = @ProductId", con))
            {
                cmd.Parameters.AddWithValue("@ProductId", productId);
                cmd.ExecuteNonQuery();
            }
       

        // Redirect back to the product page after deleting
        Response.Redirect("product.aspx");
    }
    
}