using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_stock : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT tbl_stock.s_id, tbl_product.pname, tbl_product.image, tbl_stock.quantity , tbl_stock.color FROM tbl_stock INNER JOIN tbl_product ON tbl_stock.pname=tbl_product.p_id", con);
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        viewstock.DataSource = dt;
        viewstock.DataBind();
        con.Close();
    }
}

