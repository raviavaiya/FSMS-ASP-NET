using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["useremail"] != null)
        {
            Response.Redirect("Default.aspx");
        }



        if (!IsPostBack)
        {
            if (Request.Cookies["txtusername"] != null && Request.Cookies["txtpassword"] != null)
            {
                txtusername.Text = Request.Cookies["txtusername"].Value;
                txtpassword.Attributes["value"] = Request.Cookies["txtpassword"].Value;
            }
        }
    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        con.Close();
        con.Open();
        SqlCommand selectUser = new SqlCommand("select * from tbl_user where email='" + txtusername.Text + "'", con);
        //selectUser.ExecuteNonQuery();



        SqlDataReader dr = selectUser.ExecuteReader();
        if (dr.Read())
        {



            String password = txtpassword.Text;


            SHA256 sha256 = SHA256.Create();
            byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashedBytes.Length; i++)
            {
                sb.Append(hashedBytes[i].ToString("x2"));
            }

            String hashedPassword = sb.ToString();
            if (dr["email"].ToString() == txtusername.Text.ToString() && dr["password"].ToString() == hashedPassword)
            {
                if (chekremember.Checked)
                {
                    String useremail = txtusername.Text;
                    String userpassword = txtpassword.Text;
                    Response.Cookies["txtusername"].Value = useremail;
                    Response.Cookies["txtpassword"].Value = userpassword;
                    Response.Cookies["txtusername"].Expires = DateTime.Now.AddMinutes(1);
                    Response.Cookies["txtpassword"].Expires = DateTime.Now.AddMinutes(1);

                }
                else
                {
                    Response.Cookies["username"].Expires = DateTime.Now.AddMinutes(-1);
                    Response.Cookies["password"].Expires = DateTime.Now.AddMinutes(-1);
                }
                Session["useremail"] = txtusername.Text;
                Session["userpassword"] = hashedPassword;
                Session["profilename"] = dr["fname"].ToString();
                Session["u_id"] = dr["u_id"].ToString();
                int role = (int)dr["role"];
                if (role == 1)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Redirect("admin/Default.aspx");
                }
                
            }
            else
            {
                lblemail.Text = "Your Password is Incorrect !!!";
                txtpassword.BackColor = System.Drawing.Color.PaleGreen;
            }
        }
        else
        {
            lblemail.Text = "Your Email Not Registered with Us";
            txtusername.BackColor = System.Drawing.Color.PaleGreen;
        }
    }
}