<%@ Page Title="Order" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="admin_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
     $(document).ready(function () {
         $('#tblorder').DataTable({
             "paging": true,         
             "searching": true,      
             "ordering": true,      
             "info": true            
         });
     });
     </script>
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
            <th>No</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Amount</th>
            <th>Payment Type</th>
            <th>Payment Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <asp:Repeater ID="vieworder" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%# Container.ItemIndex + 1 %></td>
                    <td>
                        <%# Eval("fname") %></td>
                    <td><%#Eval("lname") %></td>
                    <td><%#Eval("amount") %></td>
                  
                    <td><%#Eval("pay_type") %></td>
                    <td><%#Eval("order_status") %></td>
                    <td><a href="orderdetail.aspx?order_id=<%# Eval("order_id") %>"><i class="fa fa-eye"></i></a>   <a href="genratebill.aspx?order_id=<%# Eval("order_id") %>"><i class="fa fa-print" style="width:5px"></i></a></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </tbody>
</table>

</asp:Content>

