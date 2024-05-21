using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ragister_otp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["useremail"] != null)
        {
            Response.Redirect("Default.aspx");
        }


        if (Session["otp"]==null)
        {
            Response.Redirect("register.aspx");
        }
    }

    protected void btnverify_Click(object sender, EventArgs e)
    {
        String fname = (string)Session["fname"];
        String lname = (string)Session["lname"];
        String contact = (string)Session["contact"];
        String email = (string)Session["email"];
        String password = (string)Session["password"];
        String gender = (string)Session["gender"];
        String city = (string)Session["city"];
        String otp = (string)Session["otp"];
        string userotp = txtotp.Text;


        SHA256 sha256 = SHA256.Create();
        byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hashedBytes.Length; i++)
        {
            sb.Append(hashedBytes[i].ToString("x2"));
        }

        String hashedPassword = sb.ToString();


        if (otp == userotp)
        {

            String query = "insert into tbl_user (fname, lname, email, password, contact, gender, city, role) values('" + fname + "' , '" + lname + "','" + email + "','" + hashedPassword + "','" + contact + "','" + gender + "','" + city + "',1 )";
            String mycon = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Registeration Successfully');</script>");
            Response.Redirect("login.aspx");
        }
        else
        {
            Response.Write("<script>alert('OTP NOT MATCHED!!!!');</script>");
            Response.Write(otp);
        }
    }
}