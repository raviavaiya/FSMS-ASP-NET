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

public partial class forgotpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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



    protected void btnsendotp_Click(object sender, EventArgs e)
    {
        if (checkemail() == true)
        {

            String email = txtemail.Text;
           


            Session["forgotemail"] = email;
          


            Random random = new Random();
            int otp = random.Next(10000, 999999);
            string userotp = otp.ToString();

            Session["forgototp"] = userotp;
            String fromMail = "raviavaiya03@gmail.com";
            String fromPassword = "ftjd nyzu ulxa mcxo";

            MailMessage message = new MailMessage();
            message.From = new MailAddress(fromMail);
            message.Subject = "FOOOTWEAR SHOP MANAGEMENT SYSTEM ";
            message.To.Add(new MailAddress(email));
            message.Body = "<html><body>Your Forgot Password OTP is " + userotp + "</body></html>";
            message.IsBodyHtml = true;

            var smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential(fromMail, fromPassword),
                EnableSsl = true,
            };
            smtpClient.Send(message);
            Response.Redirect("forgot_otp.aspx");

        }
        else
        {
            lblemail.Text = "Your Email Not Registered with Us";
            txtemail.BackColor = System.Drawing.Color.PaleGreen;
        }
    }
}