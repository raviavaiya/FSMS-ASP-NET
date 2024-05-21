<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="changepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

         <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#form1').validate({
                rules: {
                    ctl00$ContentPlaceHolder1$txtoldpassword: {
                        required: true,
                        minlength:6
                    },
                    ctl00$ContentPlaceHolder1$txtnewpassword: {
                        required: true,
                        minlength: 6
                    }
                },
                messages: {
                    ctl00$ContentPlaceHolder1$txtoldpassword: {
                        required: "Please provide Current password",
                        minlength: "Your password must be at least 6 characters long"
                       
                    },
                    ctl00$ContentPlaceHolder1$txtnewpassword: {
                        required: "Please provide New a password",
                        minlength: "Your password must be at least 6 characters long"
                    }
                }
            });
        });
       
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <br />
    <br />


    <main><br />
        <div class="container text-center">
            <h1 class="text-center">User Authentication</h1>
            <br>
            <br />

            <div class="row">
                <div class="col-sm-6">

                    <h1 class="text-center">Change Password</h1>
                    <asp:Table runat="server" CssClass="table">
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">Email </asp:TableCell>
                            <asp:TableCell runat="server"><%= Session["useremail"] %></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">Current Password </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtoldpassword"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">New Password </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtnewpassword"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableFooterRow runat="server">
                            <asp:TableCell runat="server"></asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:Button runat="server" ID="btnchange" OnClick="btnchange_Click" Text="Change Password" ForeColor="White" Width="155px" Font-Size="Medium" BackColor="Black" Font-Bold="True" />
                            </asp:TableCell>
                        </asp:TableFooterRow>
                    </asp:Table>

                    <asp:Label runat="server" ID="lblpass" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                    <asp:Label runat="server" ID="lblnew" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
                    <asp:Label runat="server" ID="Label1" Font-Bold="True" ForeColor="#CC0000"></asp:Label>

                </div>
                <div class="col-sm-6">
                    <br />
                    <img src="images/item-11.jpg" alt="CoverImage" width="500" style="background: no-repeat" />
                </div>
            </div>
        </div>
    </main>

</asp:Content>

