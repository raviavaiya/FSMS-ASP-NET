using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgot_otp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["forgototp"]==null)
        {
            Response.Redirect("forgotpassword.aspx");
        }
    }

    protected void btnverify_Click(object sender, EventArgs e)
    {
        String forgotemail = (String)Session["forgotemail"];
        String forgototp = (string)Session["forgototp"];

        String userotp = txtotp.Text;

       
        if (forgototp == userotp)
        {

            
            Response.Redirect("forgot_password.aspx");
        }
        else
        {
            lblemail.Text = "Your OTP Is Not Matched !!!";
            txtotp.BackColor = System.Drawing.Color.PaleGreen;

        }
    }

    protected void btnresendotp_Click(object sender, EventArgs e)
    {

        String forgotemail = (String)Session["forgotemail"];


        Random random = new Random();
        int otp = random.Next(10000, 999999);
        string userotp = otp.ToString();

        Session["forgototp"] = userotp;
        String fromMail = "raviavaiya03@gmail.com";
        String fromPassword = "ftjd nyzu ulxa mcxo";

        MailMessage message = new MailMessage();
        message.From = new MailAddress(fromMail);
        message.Subject = "FOOOTWEAR SHOP MANAGEMENT SYSTEM ";
        message.To.Add(new MailAddress(forgotemail));
        message.Body = "<html><body>Your Forgot Password OTP is " + userotp + "</body></html>";
        message.IsBodyHtml = true;

        var smtpClient = new SmtpClient("smtp.gmail.com")
        {
            Port = 587,
            Credentials = new NetworkCredential(fromMail, fromPassword),
            EnableSsl = true,
        };
        smtpClient.Send(message);

    }
}