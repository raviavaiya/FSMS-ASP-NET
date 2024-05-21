<%@ Page Title="Oder Details" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="orderdetail.aspx.cs" Inherits="admin_orderdetail" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="w3-container">
                        <p style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
    Order Details 
</p>
        </div>
    <table class="w3-table w3-striped w3-centered" id="tblorder">
    <thead>
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
    <img src="../UPLOADS/<%# Eval("image") %>" alt="Product Image" width="50" /></td>
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
            <td>Total Amount</td>
            <td><asp:Label runat="server" ID="lbltotal" /></td>
        </tr>
    </tbody>
</table>

</asp:Content>


