<%@ Page Title="My Order" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br />

<h1 class="text-center" style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif">My Orders</h1>
   
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
                    <th>No</th>
                    <th>Customer Name</th>
                    <th>Contact No</th>
                    <th>Amount</th>
                    <th>Payment Type</th>
                    <th>More Details</th>
                </tr>
            </thead>
            <tbody>
                  <asp:Repeater ID="vieworderlist" runat="server">
      <ItemTemplate>
                <tr>
                     <td><%# Container.ItemIndex + 1 %></td>
                    <td>
                       <%# Eval("fname") %>
                    </td>
                    <td><%# Eval("contact") %></td>
                    <td>&#8377;
                       <%# Eval("amount") %>
                        .00
                    </td>
                    <td><%# Eval("pay_type") %></td>

                 <td><a href="orderdetail.aspx?order_id=<%# Eval("order_id") %>"><span class="glyphicon glyphicon-eye-open"></span> </a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="billprint.aspx?order_id=<%# Eval("order_id") %>"><span class="glyphicon glyphicon-print"></span></a></td>
                </tr>
                    </ItemTemplate>

</asp:Repeater>
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

