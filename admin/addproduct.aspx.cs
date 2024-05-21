using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;


public partial class admin_addproduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CascadeDropDowncategory();
            CascadeDropBrand();
           
        }
        
    }
    

    protected void CascadeDropDowncategory()
    {
        String cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_category", conn);
        cmd.CommandType = CommandType.Text;
        Dropdowncategory.DataSource = cmd.ExecuteReader();
        Dropdowncategory.DataTextField = "c_name";
        Dropdowncategory.DataValueField = "c_id";
        Dropdowncategory.DataBind();
        Dropdowncategory.Items.Insert(0, new ListItem("-- Select Category --", "0"));
    }

    protected void Dropdownsubcategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        String StateID = Dropdowncategory.SelectedItem.Text.ToString();
       
        String cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_subcategory where c_name = '"+StateID+"'", conn);
        cmd.CommandType = CommandType.Text;
        Dropdownsubcategory.DataSource = cmd.ExecuteReader();
        Dropdownsubcategory.DataTextField = "sc_name";
        Dropdownsubcategory.DataValueField = "sb_id";
        Dropdownsubcategory.DataBind();
        Dropdownsubcategory.Items.Insert(0, new ListItem("-- Select Sub-category --", "0"));
    }

    protected void CascadeDropBrand()
    {
        String cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_brand", conn);
        cmd.CommandType = CommandType.Text;
        Dropdownbrand.DataSource = cmd.ExecuteReader();
        Dropdownbrand.DataTextField = "b_name";
        Dropdownbrand.DataValueField = "b_id";
        Dropdownbrand.DataBind();
        Dropdownbrand.Items.Insert(0, new ListItem("---Select Brand---", "0"));
    }


    private bool CheckProductExists(string productName)
    {
        bool productExists = false;
        string connectionString = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        string query = "SELECT COUNT(*) FROM tbl_product WHERE pname = @ProductName";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ProductName", productName);
                connection.Open();

                int count = Convert.ToInt32(command.ExecuteScalar());
                if (count > 0)
                {
                    productExists = true;
                }
            }
        }

        return productExists;
    }

    protected void btnaddproduct_Click(object sender, EventArgs e)
    {
        string productName = txtproductname.Text;

        if (CheckProductExists(productName))
        {
            lblerror.Text = "Your Product Already Exists In System!!";
            lblerror.BackColor = System.Drawing.Color.PaleGreen;
        }
        else
        {
           
            if (pimage.HasFiles)
            {

                try
                {
                    String extension=Path.GetExtension(pimage.FileName);
                    if (extension==".jpg"|| extension == ".jpeg" || extension == ".png")
                    {
                        if (pimage.PostedFile.ContentLength <= 2100000)
                        {
                            String productname = txtproductname.Text;
                            String modelno = txtmodel.Text;
                            String description = txtdescription.Text;
                            String price = txtprice.Text;
                            String category = Dropdowncategory.SelectedItem.Text.ToString();
                            String subcategory = Dropdownsubcategory.SelectedItem.Text.ToString();
                            String Brand = Dropdownbrand.SelectedItem.Text.ToString();

                            String image = Path.GetFileName(pimage.FileName);
                            pimage.SaveAs(Server.MapPath("../UPLOADS/") + image);
                            string cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
                            SqlConnection conn = new SqlConnection(cs);
                            conn.Open();
                            SqlCommand cmd = new SqlCommand("INSERT INTO tbl_product VALUES(@ProductName, @ModelNo, @Description, @Price, @Category, @SubCategory, @Brand, @Image, 0)", conn);
                            cmd.Parameters.AddWithValue("@ProductName", productname);
                            cmd.Parameters.AddWithValue("@ModelNo", modelno);
                            cmd.Parameters.AddWithValue("@Description", description);
                            cmd.Parameters.AddWithValue("@Price", price);
                            cmd.Parameters.AddWithValue("@Category", category);
                            cmd.Parameters.AddWithValue("@SubCategory", subcategory);
                            cmd.Parameters.AddWithValue("@Brand", Brand);
                            cmd.Parameters.AddWithValue("@Image", pimage.FileName);

                            int p = cmd.ExecuteNonQuery();
                            if (p > 0)
                            {
                                
                                Response.Redirect("product.aspx");
                            }
                        }
                        else
                        {
                            lblerror.Text = "File has to be less than 2MB ";
                            lblerror.ForeColor=System.Drawing.Color.Red;
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
            

        }
    }
}