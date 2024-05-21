<%@ Page Title="Order Details" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="orderdetail.aspx.cs" Inherits="orderdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br />

<h1 class="text-center" style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif">My Orders Deatils</h1>
   
         <br />
    <%

        if (Session["useremail"] == null)
        {



    %>
    <p class="text-center">You Are Not Login In To System</p>
    <%
        }
        else
        {
    %>
    <asp:Label runat="server" ID="lblerror" />
    <div class="container">
        <table class="table align-middle mb-0 bg-white">
            <thead class="bg-light">
                <tr>
                    <th>Image</th>
                    <th>Product Name</th>
                    <th>Brand</th>
                    <th>Size</th>
                    <th>Color</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Sub Total</th>
                </tr>
            </thead>
            <tbody>
                  <asp:Repeater ID="vieworderproductlist" runat="server">
      <ItemTemplate>
                <tr>
                     <td>
     <a href="product_details.aspx?id=<%# Eval("p_id") %>">
     <span>
         <img
             src="../UPLOADS/<%# Eval("image") %>"
             alt=""
             style="width: 65px;"
             class="rounded-circle" /></span></a>
 </td>
                    <td>
                       <%# Eval("pname") %>
                    </td>
                          <td><%# Eval("brand") %></td>
                    <td><%# Eval("size") %></td>
                    <td><%# Eval("color") %></td>
                    <td>&#8377;
                       <%# Eval("price") %>
                        .00
                    </td>
                    <td><%# Eval("quantity") %></td>
                    <td><%# string.Format("&#8377;{0}.00", Convert.ToDouble(Eval("price")) * Convert.ToInt32(Eval("quantity"))) %></td>
           
                </tr>
                    </ItemTemplate>

</asp:Repeater>
                <tr>
                         <td></td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
     <th>Total Amount</th>
     <td><asp:Label runat="server" ID="lbltotal" /></td>
                </tr>
            </tbody>
           
        </table>

    </div>
    <%
        }

    %>

     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

 <script>
     function showToast(message) {
         toastr.success(message);

     }
     function showToastdanget(message) {
         toastr.error(message);

     }
 </script>
</asp:Content>

