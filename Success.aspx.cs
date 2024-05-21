using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net.Mail;
using System.Web.UI.WebControls;
using System.Net;

public partial class Success : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True;");
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            binddata();
            String pay_type = Session["pay_type"].ToString();
            if (pay_type== "Cash On Delivery")
            {
                String orderId = (String)Session["orderId"].ToString();
               
                String amount = Session["orderamount"].ToString();
                String profileFName = Session["payerfname"].ToString();
                String profileLName = Session["payerlname"].ToString();
                String profileEmail = Session["payeremail"].ToString();
                String profileMobile = Session["payercontact"].ToString();
                String deliveryaddress = Session["deliveryaddress"].ToString();
               
                String u_id = Session["u_id"].ToString();
                String order_status = "Pendding";

                lbl1.Text = "Payment type :" + pay_type;
                Label3.Text = "Order id :" + orderId;
              
                Label4.Text = "profile name :" + profileFName +" :: amount :: "+amount + " :: profile L name :"+profileLName+ "::: profile email :"+ profileEmail + "::: contact :"+profileMobile+"::delvery: "+deliveryaddress;
               
               
                try
                {

                    lbl1.Text = "Payment type :" + pay_type;
                    Label3.Text = "Order id :" + orderId;
                    
                    Label4.Text = "profile name :" + profileFName + " :: amount :: " + amount + " :: profile L name :" + profileLName + "::: profile email :" + profileEmail + "::: contact :" + profileMobile + "::delvery: " + deliveryaddress;

                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO tbl_order (order_id, fname, lname, email, contact, address, amount, u_id, pay_type, order_status) VALUES (@order_id, @fname, @lname, @email, @contact, @address, @amount, @u_id, @pay_type, @order_status)", con);
                    cmd.Parameters.AddWithValue("@order_id", orderId);
                  
                    cmd.Parameters.AddWithValue("@fname", profileFName);
                    cmd.Parameters.AddWithValue("@lname", profileLName);
                    cmd.Parameters.AddWithValue("@email", profileEmail);
                    cmd.Parameters.AddWithValue("@contact", profileMobile);
                    cmd.Parameters.AddWithValue("@address", deliveryaddress);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.Parameters.AddWithValue("@u_id", u_id);
                    cmd.Parameters.AddWithValue("@pay_type", pay_type);
                    cmd.Parameters.AddWithValue("@order_status", order_status);

                    cmd.ExecuteNonQuery();


                    lbl1.Text = "Oder is done";

                    lbl1.Text = "Payment type :" + pay_type;
                    Label3.Text = "Order id :" + orderId;
                   
                    Label4.Text = "profile name :" + profileFName + " :: amount :: " + amount + " :: profile L name :" + profileLName + "::: profile email :" + profileEmail + "::: contact :" + profileMobile + "::delvery: " + deliveryaddress;

                

                    // Insert each item into the orderitem table
                    foreach (RepeaterItem item in viewcartlist.Items)
                    {

                        int p_id = Convert.ToInt32(((Label)item.FindControl("p_idLabel")).Text);
                        string size = ((Label)item.FindControl("sizeLabel")).Text;
                        string color = ((Label)item.FindControl("colorLabel")).Text;
                        int quantity = Convert.ToInt32(((Label)item.FindControl("quantityLabel")).Text);


                        SqlCommand cmd2 = new SqlCommand("INSERT INTO tbl_order_item (order_id, p_id, size, color, quantity, u_id) VALUES (@order_id, @p_id, @size, @color, @quantity, @u_id)", con);
                        cmd2.Parameters.AddWithValue("@order_id", orderId);
                        cmd2.Parameters.AddWithValue("@p_id", p_id);
                        cmd2.Parameters.AddWithValue("@size", size);
                        cmd2.Parameters.AddWithValue("@color", color);
                        cmd2.Parameters.AddWithValue("@quantity", quantity);
                        cmd2.Parameters.AddWithValue("@u_id", u_id);

                        cmd2.ExecuteNonQuery();

                    }


                   
                    Label4.Text = "Stock complted";





                    // Remove the items from the cart table
                    SqlCommand cmd3 = new SqlCommand("DELETE FROM tbl_cart WHERE u_id = @u_id", con);
                    cmd3.Parameters.AddWithValue("@u_id", u_id);
                    cmd3.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    // Handle the exception appropriately, for example:
                    Response.Write("An error occurred while inserting data into the database: " + ex.Message);
                }
                finally
                {
                    con.Close();
                    String bill = "genrate";
                    Session["bill"] = bill;

                    String fromMail = "raviavaiya03@gmail.com";
                    String fromPassword = "ftjd nyzu ulxa mcxo";

                    MailMessage message = new MailMessage();
                    message.From = new MailAddress(fromMail);
                    message.Subject = "FOOOTWEAR SHOP MANAGEMENT SYSTEM ";
                    message.To.Add(new MailAddress(profileEmail));
                    message.Body = "<html><body>Order Placed Succesffuly <br> Order Number :"+orderId+ "<br> Payment Type is Cash On Delivery... </body></html>";
                    message.IsBodyHtml = true;

                    var smtpClient = new SmtpClient("smtp.gmail.com")
                    {
                        Port = 587,
                        Credentials = new NetworkCredential(fromMail, fromPassword),
                        EnableSsl = true,
                    };
                    smtpClient.Send(message);

                    Response.Redirect("bill.aspx");

                }

            }
            else
            {

                String orderId = Request.QueryString["orderId"];
                String payId = Request.QueryString["paymentId"];
                String amount = Session["orderamount"].ToString();
                String profileFName = Session["payerfname"].ToString();
                String profileLName = Session["payerlname"].ToString();
                String profileEmail = Session["payeremail"].ToString();
                String profileMobile = Session["payercontact"].ToString();
                String deliveryaddress = Session["deliveryaddress"].ToString();
                String pay_type1 = Session["pay_type"].ToString();
                String u_id = Session["u_id"].ToString();
                Session["orderId"] = orderId;
                String order_status = "Completed";
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO tbl_order (order_id, pay_id, fname, lname, email, contact, address, amount, u_id, pay_type, order_status) VALUES (@order_id, @pay_id, @fname, @lname, @email, @contact, @address, @amount, @u_id, @pay_type, @order_status)", con);
                    cmd.Parameters.AddWithValue("@order_id", orderId);
                    cmd.Parameters.AddWithValue("@pay_id", payId);
                    cmd.Parameters.AddWithValue("@fname", profileFName);
                    cmd.Parameters.AddWithValue("@lname", profileLName);
                    cmd.Parameters.AddWithValue("@email", profileEmail);
                    cmd.Parameters.AddWithValue("@contact", profileMobile);
                    cmd.Parameters.AddWithValue("@address", deliveryaddress);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.Parameters.AddWithValue("@u_id", u_id);
                    cmd.Parameters.AddWithValue("@pay_type", pay_type1);
                    cmd.Parameters.AddWithValue("@order_status", order_status);

                    cmd.ExecuteNonQuery();


                    lbl1.Text = "Oder is done";

                    // Insert each item into the orderitem table
                    foreach (RepeaterItem item in viewcartlist.Items)
                    {

                        int p_id = Convert.ToInt32(((Label)item.FindControl("p_idLabel")).Text);
                        string size = ((Label)item.FindControl("sizeLabel")).Text;
                        string color = ((Label)item.FindControl("colorLabel")).Text;
                        int quantity = Convert.ToInt32(((Label)item.FindControl("quantityLabel")).Text);


                        SqlCommand cmd2 = new SqlCommand("INSERT INTO tbl_order_item (order_id, p_id, size, color, quantity, u_id) VALUES (@order_id, @p_id, @size, @color, @quantity, @u_id)", con);
                        cmd2.Parameters.AddWithValue("@order_id", orderId);
                        cmd2.Parameters.AddWithValue("@p_id", p_id);
                        cmd2.Parameters.AddWithValue("@size", size);
                        cmd2.Parameters.AddWithValue("@color", color);
                        cmd2.Parameters.AddWithValue("@quantity", quantity);
                        cmd2.Parameters.AddWithValue("@u_id", u_id);

                        cmd2.ExecuteNonQuery();

                    }


                    foreach (RepeaterItem item in viewcartlist.Items)
                    {
                        Label2.Text = "stock  Is Doen";
                        int p_id = Convert.ToInt32(((Label)item.FindControl("p_idLabel")).Text);
                        string size = ((Label)item.FindControl("sizeLabel")).Text;
                        string color = ((Label)item.FindControl("colorLabel")).Text;
                        int quantity = Convert.ToInt32(((Label)item.FindControl("quantityLabel")).Text);
                        Label3.Text = size + color + quantity;


                        SqlCommand cmd4 = new SqlCommand("UPDATE tbl_stock set quantity=quantity-@quantity where pname=@p_id and size=@size and @color=@color", con);
                        cmd4.Parameters.AddWithValue("@order_id", orderId);
                        cmd4.Parameters.AddWithValue("@p_id", p_id);
                        cmd4.Parameters.AddWithValue("@size", size);
                        cmd4.Parameters.AddWithValue("@color", color);
                        cmd4.Parameters.AddWithValue("@quantity", quantity);


                        cmd4.ExecuteNonQuery();


                    }
                    Label4.Text = "Stock complted";





                    // Remove the items from the cart table
                    SqlCommand cmd3 = new SqlCommand("DELETE FROM tbl_cart WHERE u_id = @u_id", con);
                    cmd3.Parameters.AddWithValue("@u_id", u_id);
                    cmd3.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    // Handle the exception appropriately, for example:
                    Response.Write("An error occurred while inserting data into the database: " + ex.Message);
                }
                finally
                {
                    con.Close();
                    String bill = "genrate";
                    Session["bill"] = bill;
                    String fromMail = "raviavaiya03@gmail.com";
                    String fromPassword = "ftjd nyzu ulxa mcxo";

                    MailMessage message = new MailMessage();
                    message.From = new MailAddress(fromMail);
                    message.Subject = "FOOOTWEAR SHOP MANAGEMENT SYSTEM ";
                    message.To.Add(new MailAddress(profileEmail));
                    message.Body = "<html><body>Order Placed Succesffuly <br> Order Number :" + orderId + "<br> Payment type is Net Banking... </body></html>";
                    message.IsBodyHtml = true;

                    var smtpClient = new SmtpClient("smtp.gmail.com")
                    {
                        Port = 587,
                        Credentials = new NetworkCredential(fromMail, fromPassword),
                        EnableSsl = true,
                    };
                    smtpClient.Send(message);
                    Response.Redirect("bill.aspx");

                }

            }



            

        }
    }


    private void binddata()
    {
        con.Open();
        String u_id = (String)Session["u_id"].ToString();
        SqlCommand cmd = new SqlCommand("SELECT tbl_cart.c_id, tbl_cart.size, tbl_cart.color, tbl_cart.quantity, tbl_product.p_id, tbl_product.pname, tbl_product.price FROM tbl_cart INNER JOIN tbl_product ON tbl_cart.p_id=tbl_product.p_id where u_id='" + u_id + "'", con);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            DataTable dt = new DataTable();
            dt.Load(reader);
            viewcartlist.DataSource = dt;
            viewcartlist.DataBind();
            decimal totalAmount = dt.AsEnumerable().Sum(row => Convert.ToDecimal(row["price"]) * row.Field<int>("quantity"));




        }
        else
        {
            // No items in cart, display appropriate message
            ScriptManager.RegisterStartupScript(this, GetType(), "showToastdanget", "showToastdanget('Empty Cart !!!');", true);

            viewcartlist.Visible = false; // Hide repeater


        }

        con.Close();

    }
}