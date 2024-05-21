<%@ Page Title="Category" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="admin_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script>
$(document).ready(function () {
    $('#tblcategory').DataTable({
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
        Category Details<span style="float: right;">
            <a href="addcategory.aspx" class="w3-button w3-black">Add Category</a></span>
    </p>

    <br />
    <table class="w3-table w3-striped w3-centered" id="tblcategory">
        <thead>
        <tr>
            <th>No</th>
            <th>Category Name</th>
            <th>Action</th>
        </tr></thead><tbody>
        <asp:Repeater ID="viewcategory" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%# Container.ItemIndex + 1 %></td>
                    <td><%#Eval("c_name") %></td>
                   <td>
     <a href="" >
     <i class="fa fa-edit"></i></a>&nbsp;
                         <a href="<%# Eval("c_id", "category.aspx?catid={0}") %>" onclick="return confirm('Are you sure you want to delete this Category?');" >
<i class="fa fa-trash"></i></a>
 </td>
                </tr>
            </ItemTemplate>

        </asp:Repeater>
            </tbody>
    </table>

</div>
</asp:Content>

