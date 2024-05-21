<%@ Page Title="Brand" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="addbrand.aspx.cs" Inherits="admin_addbrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
            $('#form1').validate({
                rules: {
                    ctl00$ContentPlaceHolder1$txtbrandname: {
                        required: true

                    }

                },
                messages: {
                    ctl00$ContentPlaceHolder1$txtbrandname: {
                        required: "Please Enter Your Brand Name"

                    }

                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <div class="w3-container">
            <p style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
                Brand Details <span style="float: right;">
                    <a href="brand.aspx" class="w3-button w3-black">Show Brand</a>
                </span>
            </p>
            <div class="w3-row">
                <div class="w3-col s4"></div>
                <div class="w3-col s8">

                   
                        <h2 class="w3-center">Add Brand Details Here</h2>
                        <asp:Table runat="server" ID="tblbrand" CssClass="w3-table">
                            
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" CssClass="w3-center">Brand Name</asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asp:TextBox runat="server" ID="txtbrandname" CssClass="w3-input w3-border"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                           
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server"></asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asp:Button runat="server" ID="btnaddbrand" OnClick="btnaddbrand_Click" Text="add Brand" ForeColor="White" BackColor="Black" />
                                </asp:TableCell>
                            </asp:TableRow>

                        </asp:Table>
                  
                    <asp:Label runat="server" ID="branderror"></asp:Label>
                </div>
                <div class="w3-col s2"></div>
            </div>
        </div>

     
</asp:Content>

