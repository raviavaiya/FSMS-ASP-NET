<%@ Page Title="SubCategory" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="subcategory.aspx.cs" Inherits="admin_subcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('#tblsubcategory').DataTable({
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
            SubCategory Details<span style="float: right;">
                <a href="addsubcategory.aspx" class="w3-button w3-black">Add Subcategory</a>
            </span>
        </p>
        <br />
        <table class="w3-table w3-striped w3-centered" id="tblsubcategory">
            <thead>
                <tr>
                    <th>No</th>
                    <th>SubCategory Name</th>
                    <th>Category Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="viewsubcategory" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.ItemIndex + 1 %></td>
                            <td><%#Eval("sc_name") %></td>
                            <td><%#Eval("c_name") %></td>
                            <td>
                                <a href="">
                                    <i class="fa fa-edit"></i></a>&nbsp;
                             <a href="<%# Eval("sb_id", "subcategory.aspx?subcatid={0}") %>" onclick="return confirm('Are you sure you want to delete this Sub-category?');">
                                 <i class="fa fa-trash"></i></a>
                            </td>
                        </tr>
                    </ItemTemplate>

                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>

