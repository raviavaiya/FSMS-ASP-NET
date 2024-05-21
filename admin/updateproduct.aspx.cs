using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_updateproduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Retrieve category ID from query string
            if (Request.QueryString["catid"] != null)
            {
                int categoryId;
                
                if (int.TryParse(Request.QueryString["catid"], out categoryId))
                {
                    // Load category details based on the category ID
                    
                    LoadCategoryDetails(categoryId);
                }
                else
                {
                    // Handle invalid category ID
                }
            }
            else
            {
                // Handle missing category ID in query string
            }
        }
    }

    private void LoadCategoryDetails(int categoryId)
    {
        con.Close();
        con.Open();
       
        SqlCommand selectUser = new SqlCommand("select * from tbl_product where p_id='" + categoryId + "'", con);
        SqlDataReader dr = selectUser.ExecuteReader();
        if (dr.Read())
        {
            string id = dr["p_id"].ToString();
            Session["pid"] = id;
            txtproductname.Text = dr["pname"].ToString();
            txtdescription.Text = dr["description"].ToString();
            txtmodel.Text = dr["model_no"].ToString();
            txtprice.Text = dr["price"].ToString();
            Dropdownbrand.Text = dr["brand"].ToString();
            Dropdownsubcategory.Text = dr["subcategory"].ToString();
            category.Text = dr["category"].ToString();

            string imagePath = dr["image"].ToString();

            imgProduct.ImageUrl = "../UPLOADS/" + imagePath;
         
        }
    }

   
    protected void btnupdateproduct_Click(object sender, EventArgs e)
    {


        

        

            if (pimage.HasFiles)
            {

                try
                {
                    String extension = Path.GetExtension(pimage.FileName);
                    if (extension == ".jpg" || extension == ".jpeg" | extension == ".png")
                    {
                        if (pimage.PostedFile.ContentLength <= 2100000)
                        {
                            String productname = txtproductname.Text;
                            String modelno = txtmodel.Text;
                            String description = txtdescription.Text;
                            String price = txtprice.Text;
                           

                            String image = Path.GetFileName(pimage.FileName);
                            pimage.SaveAs(Server.MapPath("../UPLOADS/") + image);
                            string cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
                            SqlConnection conn = new SqlConnection(cs);
                            conn.Open();
                        String pid = (String)Session["pid"];

                        SqlCommand cmd = new SqlCommand("UPDATE tbl_product SET pname=@pname, model_no=@model_no, description=@description, price=@price, image=@image WHERE p_id=@pid", conn);
                        cmd.Parameters.AddWithValue("@pname", txtproductname.Text);
                        cmd.Parameters.AddWithValue("@model_no", txtmodel.Text);
                        cmd.Parameters.AddWithValue("@description", txtdescription.Text);
                        cmd.Parameters.AddWithValue("@price", txtprice.Text);
                        cmd.Parameters.AddWithValue("@image", pimage.FileName);
                        cmd.Parameters.AddWithValue("@pid", pid);


                        int p = cmd.ExecuteNonQuery();
                            if (p > 0)
                            {

                                Response.Redirect("product.aspx");
                            }
                        }
                        else
                        {
                            lblerror.Text = "File has to be less than 2MB ";
                            lblerror.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblerror.Text = "Only JPG , PNG , JPEG Files Are Supported!!! ";
                        lblerror.ForeColor = System.Drawing.Color.Red;
                    }

                }
                catch (Exception ex)
                {
                    lblerror.Text = "Product Image is Not Upload Sucessfully!!" + ex.Message;
                }
        }
        else
        {
            string cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
            String pid = (String)Session["pid"];
            lblerror.Text = pid;
            SqlCommand cmd = new SqlCommand("UPDATE tbl_product SET pname=@pname, model_no=@model_no, description=@description, price=@price WHERE p_id=@pid", conn);
            cmd.Parameters.AddWithValue("@pname", txtproductname.Text);
            cmd.Parameters.AddWithValue("@model_no", txtmodel.Text);
            cmd.Parameters.AddWithValue("@description", txtdescription.Text);
            cmd.Parameters.AddWithValue("@price", txtprice.Text);
            
            cmd.Parameters.AddWithValue("@pid", pid);
            int p = cmd.ExecuteNonQuery();
            if (p > 0)
            {

                Response.Redirect("product.aspx");
            }
        }


        


    }
}