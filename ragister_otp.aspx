<%@ Page Title="Registration-otp" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ragister_otp.aspx.cs" Inherits="ragister_otp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#form1').validate({
                rules: {
                    ctl00$ContentPlaceHolder1$txtotp: {
                        required: true
                    }
                },
                messages: {
                    ctl00$ContentPlaceHolder1$txtotp: "Please Enter OTP"

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


            <div class="row">
                <div class="col-sm-6">
                    <h1 class="text-center">OTP VERIFICATION</h1>
                    <br />
                    <br />


                    <asp:Table runat="server" CssClass="table">
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">OTP : </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox runat="server" ID="txtotp" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">  </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:Button runat="server" ID="btnverify" Text="Verify" OnClick="btnverify_Click" CssClass="form-control" ForeColor="White" Width="80px" Font-Size="Medium" BackColor="Black" Font-Bold="True" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                    <asp:Label runat="server" ID="lblemail"></asp:Label>
                </div>


                <br />
                <br />

                <div class="col-sm-6">
                    <br />
                    <img src="images/item-11.jpg" alt="CoverImage" width="500" style="background: no-repeat" />
                </div>
            </div>

        </div>
    </main>
</asp:Content>

