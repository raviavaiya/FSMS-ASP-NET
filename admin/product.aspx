<%@ Page Title="Product" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="admin_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script>
        $(document).ready(function () {
            $('#tblproduct').DataTable({
                "paging": true,         
                "searching": true,      
                "ordering": true,      
                "info": true            
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="w3-container">
        <p style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
            Product Details<span style="float: right;">

                <a href="addproduct.aspx" class="w3-button w3-black">Add Product</a>
            </span>
        </p>
    </div>
    <br />
    <table class="w3-table w3-striped w3-centered" id="tblproduct">
        <thead>
            <tr>
                <th>No</th>
                <th>Image</th>
                <th>Product Name</th>
                <th>Model no</th>
                <th>Price</th>
                <th>Brand</th>
                <th>Subcategory</th>
                <th>Category</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="viewproduct" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Container.ItemIndex + 1 %></td>
                        <td>
                            <img src="../UPLOADS/<%# Eval("image") %>" alt="Product Image" width="50" /></td>
                        <td><%#Eval("pname") %></td>
                        <td><%#Eval("model_no") %></td>
                        <td><%#Eval("price") %></td>
                        <td><%#Eval("brand") %></td>
                        <td><%#Eval("subcategory") %></td>
                        <td><%#Eval("category") %></td>
                      <td><asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>' />
                          <a href='<%# Eval("p_id", "product.aspx?statusid={0}") %>' onclick="return confirm('Are you sure you want to update the status?');">
    <i class="fa fa-toggle-on" style="color:green"></i>
</a>
                      </td>

                        <td>
                            
                            <a href="<%# Eval("p_id", "updateproduct.aspx?catid={0}") %>" >
                            <i class="fa fa-edit"></i></a>&nbsp;
                            <a href="<%# Eval("p_id", "product.aspx?deleteid={0}") %>" onclick="return confirm('Are you sure you want to delete this product?');" >
                            <i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>

</asp:Content>

