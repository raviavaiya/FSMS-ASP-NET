<%@ Page Title="Profile" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
     <script type="text/javascript">
         function preventBack() { window.history.forward(); }
         setTimeout("preventBack()", 0);
         window.onunload = function () { null };
     </script>
    <script>
        $(document).ready(function () {
            $('#form1').validate({
                rules: {
                    ctl00$ContentPlaceHolder1$txtfname: "required",
                    ctl00$ContentPlaceHolder1$txtlname: "required",
                    ctl00$ContentPlaceHolder1$txtemail: {
                        required: true,
                        email: true

                    },
                    ctl00$ContentPlaceHolder1$txtpassword: {
                        required: true,
                        minlength: 6

                    },
                    ctl00$ContentPlaceHolder1$txtconfpass: {
                        required: true,
                        equalTo: "#<%=txtpassword.ClientID%>"
                    },
                    ctl00$ContentPlaceHolder1$txtcontact: "required",
                    ctl00$ContentPlaceHolder1$gender: "required"
                    
                },
                messages: {
                    ctl00$ContentPlaceHolder1$txtfname: "Please Enter Your First Name ",
                    ctl00$ContentPlaceHolder1$txtlname: "Please Enter Your Last Name ",
                    ctl00$ContentPlaceHolder1$txtemail: {
                        required: "Please Enter Your Email",
                        email: "Please enter a valid email address"
                    },
                    ctl00$ContentPlaceHolder1$txtpassword: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 5 characters long"
                    },
                    ctl00$ContentPlaceHolder1$txtconfpass: {
                        required: "Please Re-Enter Password",
                        equalTo: "Passwords do not match"
                    },
                    ctl00$ContentPlaceHolder1$txtcontact: "Please Enter Your Contact Number",
                    ctl00$ContentPlaceHolder1$gender: "Please select a Gender"
                   

                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />


    <main>
        <div class="container text-center">



            <div class="row">
                <div class="col-sm-6">
                    <h1 class="text-center"><%= Session["profilename"] %>'s Profile</h1>


                    <table class="table">
                        <tr>
                            <td>First Name </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtfname" CssClass="form-control text-center"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td>
                                <asp:TextBox runat="server" ID="txtlname" CssClass="form-control text-center"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Email </td>
                            <td>
                                <asp:Label runat="server" CssClass="form-control text-center" ID="txtemail"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Contact No</td>
                            <td>
                                <asp:TextBox runat="server" ID="txtcontact" TextMode="Number" CssClass="form-control text-center"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td>
                                <asp:RadioButton ID="radiomale" runat="server" Text="Male" GroupName="gender" />&nbsp;&nbsp;
                                 <asp:RadioButton ID="radiofemale" runat="server" Text="Female" GroupName="gender" />&nbsp;&nbsp;
                                 <asp:RadioButton ID="radioother" runat="server" Text="Other" GroupName="gender" /></td>
                        </tr>
                       
                        <tr>
                            <td>City</td>
                            <td>
                                <asp:Label ID="DropDowncity"  runat="server" CssClass="form-control text-center">
                                </asp:Label></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td>
                                <asp:TextBox runat="server" TextMode="Password" ID="txtpassword" CssClass="form-control text-center"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Confirm Password</td>
                            <td>
                                <asp:TextBox runat="server" ID="txtconfpass" TextMode="Password" CssClass="form-control text-center"></asp:TextBox></td>
                        </tr>
                     
                        <tr>
                            <td><a href="changepassword.aspx" forecolor="White" width="150px" font-size="Medium" backcolor="Black" font-bold="true">Change Password ?</a></td>
                            <td>
                                <asp:Button runat="server" ID="btnupdate" Text="Update Profile" OnClick="btnupdate_Click" ForeColor="White" Width="130px" Font-Size="Medium" BackColor="Black" Font-Bold="True" /></td>
                        </tr>
                    </table>

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
    <div class="container text-center">
        <h3>Trusted Partners</h3>
        <br>
        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col-sm-2">
                <img src="images/brand-1.jpg" class="img-responsive" style="width: 100%" alt="Image" />
            </div>
            <div class="col-sm-2">
                <img src="images/brand-2.jpg" class="img-responsive" style="width: 100%" alt="Image" />
            </div>
            <div class="col-sm-2">
                <img src="images/brand-3.jpg" class="img-responsive" style="width: 100%" alt="Image" />
            </div>
            <div class="col-sm-2">
                <img src="images/brand-4.jpg" class="img-responsive" style="width: 100%" alt="Image" />
            </div>
            <div class="col-sm-2">
                <img src="images/brand-5.jpg" class="img-responsive" style="width: 100%" alt="Image" />
            </div>
            <div class="col-sm-1"></div>
        </div>
    </div>

</asp:Content>

