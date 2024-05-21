using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection.Emit;
using Label = System.Web.UI.WebControls.Label;


public partial class admin_addstock : System.Web.UI.Page
{
    private int _textBoxSetCount;
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CascadeDropDownproduct();
            ViewState["TextBoxSetCount"] = 0;

        }
        else
        {
            _textBoxSetCount = (int)ViewState["TextBoxSetCount"];
            for (int i = 0; i < _textBoxSetCount; i++)
            {
                CreateTextBoxSet(i + 1, placeholderTextBoxSets);
            }
        }
    }

    protected void CascadeDropDownproduct()
    {
        String cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        SqlConnection conn = new SqlConnection(cs);
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_product", conn);
        cmd.CommandType = CommandType.Text;
        DropDownproduct.DataSource = cmd.ExecuteReader();
        DropDownproduct.DataTextField = "pname";
        DropDownproduct.DataValueField = "p_id";
        DropDownproduct.DataBind();
        DropDownproduct.Items.Insert(0, new ListItem("-- Select Product --", "0"));
    }

   

    private void CreateTextBoxSet(int setIndex, Control container)
    {
        PlaceHolder placeholder = new PlaceHolder();
        container.Controls.Add(placeholder);

        string[] labels = { "Size", "Color", "Quantity" };

        for (int i = 0; i < 3; i++)
        {
           Label lbl = new Label();
            lbl.Text = labels[i] + ":";
            lbl.CssClass = "control-label";
            lbl.AssociatedControlID = $"txtbox{setIndex}_{i + 1}";

            placeholder.Controls.Add(lbl);

            TextBox txt = new TextBox();
            txt.ID = $"txtbox{setIndex}_{i + 1}";
            txt.TextMode = i == 1 ? TextBoxMode.SingleLine : TextBoxMode.Number;
            txt.CssClass = "form-control";

            placeholder.Controls.Add(txt);
        }

        Literal lt = new Literal();
        lt.Text = "<br />";
        container.Controls.Add(lt);
    }


    protected void btnadd_Click(object sender, EventArgs e)
    {
        int newTextBoxSetCount = _textBoxSetCount + 1;
        ViewState["TextBoxSetCount"] = newTextBoxSetCount;

        CreateTextBoxSet(newTextBoxSetCount, placeholderTextBoxSets);

        _textBoxSetCount = newTextBoxSetCount;

    }

    private void SaveData(string pname, string size, string color, string quantity)
    {
        String cs = "Data Source=RAVIAVAIYA\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";
        string query = "INSERT INTO tbl_stock (pname, size, color, quantity) VALUES (@pname, @size, @color, @quantity)";

        SqlConnection con = new SqlConnection(cs);
       
            con.Open();
                 SqlCommand cmd = new SqlCommand(query, con);
            
                cmd.Parameters.AddWithValue("@pname", pname);
                cmd.Parameters.AddWithValue("@size", size);
                cmd.Parameters.AddWithValue("@color", color);
                cmd.Parameters.AddWithValue("@quantity", quantity);
                cmd.ExecuteNonQuery();
           
        
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        foreach (PlaceHolder placeholder in placeholderTextBoxSets.Controls.OfType<PlaceHolder>())
        {
            String name = DropDownproduct.SelectedValue.ToString();
            TextBox sizeTextBox = placeholder.Controls.OfType<TextBox>().ElementAt(0);
            TextBox colorTextBox = placeholder.Controls.OfType<TextBox>().ElementAt(1);
            TextBox quantityTextBox = placeholder.Controls.OfType<TextBox>().ElementAt(2);

            SaveData(name, sizeTextBox.Text, colorTextBox.Text, quantityTextBox.Text);
        }
        Response.Redirect("stock.aspx");
        Label3.Text = "Data Has Been Saved Successfully";
        Label3.CssClass = "text-success mt-3";
    }
}