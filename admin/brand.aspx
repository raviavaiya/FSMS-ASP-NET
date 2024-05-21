<%@ Page Title="Brand" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="brand.aspx.cs" Inherits="admin_brand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('#tblbrand').DataTable({
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
            Brand Details <span style="float: right;">
                <a href="addbrand.aspx" class="w3-button w3-black">Add Brand</a></span>
        </p>
        <br />
        <table class="w3-table w3-striped w3-centered" id="tblbrand">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Brand Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="viewbrand" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.ItemIndex + 1 %></td>
                            <td><%#Eval("b_name") %></td>
                            <td>
                                <a href="">
                                    <i class="fa fa-edit"></i></a>&nbsp;
                             <a href="<%# Eval("b_id", "brand.aspx?brandid={0}") %>" onclick="return confirm('Are you sure you want to delete this Brand?');">
                                 <i class="fa fa-trash"></i></a>
                            </td>
                        </tr>
                    </ItemTemplate>

                </asp:Repeater>
            </tbody>
        </table>

    </div>
</asp:Content>

