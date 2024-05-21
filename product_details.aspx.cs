using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product_details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            
            // Retrieve category ID from query string
            if (Request.QueryString["id"] != null)
            {
                int productId;

                if (int.TryParse(Request.QueryString["id"], out productId))
                {
                    // Load category details based on the category ID
                    cascadingdropdown(productId);
                    LoadCategoryDetails(productId);
                   
                }
                else
                {
                   
                }
            }
            else
            {
                // Handle missing category ID in query string
                Response.Redirect("Default.aspx");
            }
        }
    }


   

    private void LoadCategoryDetails(int productId)
    {
        con.Close();
        con.Open();

        SqlCommand selectUser = new SqlCommand("select * from tbl_product where p_id='" + productId + "'", con);
        SqlDataReader dr = selectUser.ExecuteReader();
        if (dr.Read())
        {
            //string id = dr["p_id"].ToString();
            //Session["pid"] = id;
            txtpname.Text = dr["pname"].ToString();
            txtdescription.Text = dr["description"].ToString();
            //txtmodel.Text = dr["model_no"].ToString();
            txtprice.Text = dr["price"].ToString();
            txtbrand.Text = dr["brand"].ToString();
            //Dropdownsubcategory.Text = dr["subcategory"].ToString();
            //category.Text = dr["category"].ToString();

            string imagePath = dr["image"].ToString();

            imgProduct.ImageUrl = "../UPLOADS/" + imagePath;

        }
    }

    private bool CheckProductCart(int productId)
    {
        bool productCart = false;
        String u_id = (String)Session["u_id"].ToString();
        string connectionString = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        string query = "SELECT COUNT(*) FROM tbl_cart WHERE p_id = @ProductName and u_id=@userid";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ProductName", productId);
                command.Parameters.AddWithValue("@userid", u_id);
                connection.Open();

                int count = Convert.ToInt32(command.ExecuteScalar());
                if (count > 0)
                {
                    productCart = true;
                }
            }
        }

        return productCart;
    }

    private bool CheckProductSize(int size,int productId)
    {
        bool productCart = false;
        String u_id = (String)Session["u_id"].ToString();
        string connectionString = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        string query = "SELECT COUNT(*) FROM tbl_cart WHERE  u_id=@userid and p_id = @ProductName and size=@size";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ProductName", productId);
                command.Parameters.AddWithValue("@userid", u_id);
                command.Parameters.AddWithValue("@size", size);
                connection.Open();

                int count = Convert.ToInt32(command.ExecuteScalar());
                if (count > 0)
                {
                    productCart = true;
                }
            }
        }

        return productCart;
    }

    private bool CheckProductColor(int size, int productId,String color)
    {
        bool productCart = false;
        String u_id = (String)Session["u_id"].ToString();
        string connectionString = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        string query = "SELECT COUNT(*) FROM tbl_cart WHERE u_id=@userid and p_id = @ProductName and size=@size and color=@color";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ProductName", productId);
                command.Parameters.AddWithValue("@userid", u_id);
                command.Parameters.AddWithValue("@size", size);
                command.Parameters.AddWithValue("@color",color);
                connection.Open();

                int count = Convert.ToInt32(command.ExecuteScalar());
                if (count > 0)
                {
                    productCart = true;
                }
            }
        }

        return productCart;
    }

    protected void addtocart_Click(object sender, EventArgs e)
    {
        if (Session["useremail"] == null)
        {
            // User is not logged in, show a message to login
            ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Please login to add items to cart.');", true);
            return;
        }

        // Check if a size and color have been selected
        if (string.IsNullOrEmpty(ddlSize.SelectedValue) || string.IsNullOrEmpty(ddlColor.SelectedValue))
        {
            // Size or color not selected, show an error message
            ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Please select size and color.');", true);
            return;
        }

        // Validate quantity
        int quantity1;
        if (!int.TryParse(txtcartvalue.Text, out quantity1) || quantity1 <= 0)
        {
            // Invalid quantity, show an error message
            ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Please enter a valid quantity.');", true);
            return;
        }

        if (Request.QueryString["id"] != null)
        {
            int productId;

            if (int.TryParse(Request.QueryString["id"], out productId))
            {
                if (CheckProductCart(productId))
                {
                    int size;
                    if (int.TryParse(ddlSize.SelectedValue, out size))
                    {
                        // Now you can use the size variable safely
                        if (CheckProductSize(size, productId))
                        {

                            String color = ddlColor.SelectedValue.ToString();
                            if (CheckProductColor(size, productId, color))
                            {
                                // Update quantity in cart
                                con.Open();
                                String quantity = txtcartvalue.Text;
                                SqlCommand cmd = new SqlCommand("update tbl_cart set quantity=quantity+'" + quantity + "' where p_id='" + productId + "' and size='"+size+"' and color='"+color+"'", con);
                                int i = cmd.ExecuteNonQuery();
                                con.Close();
                                if (i > 0)
                                {
                                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Product add to Cart successfully');", true);
                                }
                            }
                            else
                            {
                                // Insert new item into cart
                                con.Open();
                                String u_id = (String)Session["u_id"].ToString();
                                String quanity = txtcartvalue.Text;
                                SqlCommand cmd = new SqlCommand("insert into tbl_cart (p_id, u_id, size, color, quantity) values ('" + productId + "','" + u_id + "','" + size + "','" + color + "','" + quanity + "')", con);
                                int i = cmd.ExecuteNonQuery();
                                con.Close();
                                if (i > 0)
                                {
                                    ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Product add to Cart successfully');", true);
                                }
                            }

                        }
                        else
                        {

                            con.Close();
                            con.Open();
                            String u_id = (String)Session["u_id"].ToString();
                            String color = ddlColor.SelectedValue.ToString();
                            String size1 = ddlSize.SelectedValue.ToString();
                            String quanity = txtcartvalue.Text;
                            SqlCommand cmd = new SqlCommand("insert into tbl_cart (p_id, u_id, size, color, quantity) values ('" + productId + "','" + u_id + "','" + size1 + "','" + color + "','" + quanity + "')", con);
                            int i = cmd.ExecuteNonQuery();
                            if (i > 0)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Product add to Cart successfully!');", true);
                            }
                            con.Close();

                        }
                    }
                    else
                    {
                        // Selected value couldn't be parsed to an integer
                        // Handle this case accordingly
                    }

                }
                else
                {
                    con.Close();
                    con.Open();
                    String u_id = (String)Session["u_id"].ToString();
                    String color = ddlColor.SelectedValue.ToString();
                    String size = ddlSize.SelectedValue.ToString();
                    String quanity = txtcartvalue.Text;
                    SqlCommand cmd = new SqlCommand("insert into tbl_cart (p_id, u_id, size, color, quantity) values ('" + productId + "','" + u_id + "','" + size + "','" + color + "','" + quanity + "')", con);
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Product add to Cart successfully!');", true);
                    }
                    con.Close();

                }
            }
        }
        else
        {

        }



        //  ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Product added to cart successfully.');", true);
    }


    private bool CheckProductExists(int productId)
    {
        bool productExists = false;
        String u_id = (String)Session["u_id"].ToString();
        string connectionString = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        string query = "SELECT COUNT(*) FROM tbl_wishlist WHERE p_id = @ProductName and u_id=@userid";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@ProductName", productId);
                command.Parameters.AddWithValue("@userid", u_id);
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

    protected void addtowishlist_Click(object sender, EventArgs e)
    {
        if (Session["useremail"] == null)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Login please !!!');", true);
            return;
        }
        else
        {

            if (Request.QueryString["id"] != null)
            {
                int productId;

                if (int.TryParse(Request.QueryString["id"], out productId))
                {
                    if (CheckProductExists(productId))
                    {
                         ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Already added wishlist');", true);
                    }
                    else
                    {
                        con.Close();
                        con.Open();
                        String u_id = (String)Session["u_id"].ToString();
                        SqlCommand cmd = new SqlCommand("insert into tbl_wishlist (p_id, u_id) values ('"+productId+"','"+u_id+"')", con);
                        int i = cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('Product add to wishlist successfully!');", true);
                        }
                        con.Close();

                    }
                }
            } else
            {

            }


                

        }
    }



    protected void cascadingdropdown(int productId)
    {
        String cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select DISTINCT size from tbl_stock where pname='" + productId+"'", conn);
        cmd.CommandType = CommandType.Text;
        ddlSize.DataSource = cmd.ExecuteReader();
        ddlSize.DataTextField = "size";
        ddlSize.DataValueField = "size";
        ddlSize.DataBind();
        ddlSize.Items.Insert(0, new ListItem("-- Select Size --", "0"));
    }

    protected void ddlSize_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (Request.QueryString["id"] != null)
        {
            int productId;

            if (int.TryParse(Request.QueryString["id"], out productId))
            {
                int sizeid = Convert.ToInt32(ddlSize.SelectedValue);
                String cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
                SqlConnection conn = new SqlConnection(cs);
                conn.Open();
                SqlCommand cmd = new SqlCommand("select DISTINCT color from tbl_stock where pname='"+productId+"' and size = " + sizeid, conn);
                cmd.CommandType = CommandType.Text;
                ddlColor.DataSource = cmd.ExecuteReader();
                ddlColor.DataTextField = "color";
                ddlColor.DataValueField = "color";
                ddlColor.DataBind();
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