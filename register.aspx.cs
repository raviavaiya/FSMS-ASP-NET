using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["useremail"] != null)
        {
            Response.Redirect("Default.aspx");
        }


        if (!IsPostBack)
        {
            cascadingdropdown();
        }
    }

    protected void cascadingdropdown()
    {
        String cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_state", conn);
        cmd.CommandType = CommandType.Text;
        DropDownstate.DataSource = cmd.ExecuteReader();
        DropDownstate.DataTextField = "s_name";
        DropDownstate.DataValueField = "s_id";
        DropDownstate.DataBind();
        DropDownstate.Items.Insert(0, new ListItem("-- Select State --", "0"));
    }


    protected void DropDownstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        int StateID = Convert.ToInt32(DropDownstate.SelectedValue);
        String cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_city where s_id = " + StateID, conn);
        cmd.CommandType = CommandType.Text;
        DropDowncity.DataSource = cmd.ExecuteReader();
        DropDowncity.DataTextField = "c_name";
        DropDowncity.DataValueField = "c_id";
        DropDowncity.DataBind();
        DropDowncity.Items.Insert(0, new ListItem("-- Select City --", "0"));

    }

    private Boolean checkemail()
    {
        Boolean emailavailable = false;
        String mycon = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        String myquery = "Select * from tbl_user where email='" + txtemail.Text + "'";
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
            emailavailable = true;

        }
        con.Close();

        return emailavailable;
    }
    protected void btnregister_Click(object sender, EventArgs e)
    {
        if (checkemail() == true)
        {

            lblemail.Text = "Your Email Already Registered with Us";
            txtemail.BackColor = System.Drawing.Color.PaleGreen;





        }
        else
        {

            String fname = txtfname.Text;
            String lname = txtlname.Text;
            String email = txtemail.Text;
            String password = txtpassword.Text;
            String contact = txtcontact.Text;
            String city = DropDowncity.SelectedItem.Text.ToString();

            string gender = "";

            if (radiomale.Checked)
            {
                gender = radiomale.Text.ToString();
            }
            if (radiofemale.Checked)
            {
                gender = radiofemale.Text.ToString();
            }
            if (radioother.Checked)
            {
                gender = radioother.Text.ToString();
            }

            Session["fname"] = fname;
            Session["lname"] = lname;
            Session["Password"] = password;
            Session["contact"] = contact;
            Session["gender"] = gender;
            Session["email"] = email;
            Session["city"] = city;



            Random random = new Random();
            int otp = random.Next(10000, 999999);
            string userotp = otp.ToString();

            Session["otp"] = userotp;
            String fromMail = "raviavaiya03@gmail.com";
            String fromPassword = "ftjd nyzu ulxa mcxo";

            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromMail);
            message.Subject = "FOOOTWEAR SHOP MANAGEMENT SYSTEM ";
            message.To.Add(new MailAddress(email));
            message.Body = "<html><body>Your OTP is " + userotp + "</body></html>";
            message.IsBodyHtml = true;

            var smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential(fromMail, fromPassword),
                EnableSsl = true,
            };
            smtpClient.Send(message);
            Response.Redirect("ragister_otp.aspx");



        }
    }
}