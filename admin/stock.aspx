<%@ Page Title="Stock" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="stock.aspx.cs" Inherits="admin_stock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script>
        $(document).ready(function () {
            $('#tblstock').DataTable({
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
    Stock Details<span style="float: right;">

                <a href="addstock.aspx" class="w3-button w3-black">Add Stock</a>
            </span>
</p>
        </div>
   
<table class="w3-table w3-striped w3-centered" id="tblstock">
    <thead>
        <tr>
            <th>No</th>
            <th>Image</th>

            <th>Product Name</th>
            <th>Color</th>
            <th>Quantity</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <asp:Repeater ID="viewstock" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%# Container.ItemIndex + 1 %></td>
                    <td>
                        <img src="../UPLOADS/<%# Eval("image") %>" alt="Product Image" width="50" /></td>
                    <td><%#Eval("pname") %></td>
               
                <td><%# Eval("color") %></td>
                    <td>
                        <%#Eval("quantity") %>

                    </td>
                    <td><i class="fa fa-trash"></i></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </tbody>
</table>
</asp:Content>

