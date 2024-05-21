<%@ Page Title="Registration" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

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
                    ctl00$ContentPlaceHolder1$gender: "required",
                    ctl00$ContentPlaceHolder1$DropDownstate: "required",
                    ctl00$ContentPlaceHolder1$DropDowncity: "required"
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
                        minlength: "Your password must be at least 6 characters long"
                    },
                    ctl00$ContentPlaceHolder1$txtconfpass: {
                        required: "Please Re-Enter Password",
                        equalTo: "Passwords do not match"
                    },
                    ctl00$ContentPlaceHolder1$txtcontact: "Please Enter Your Contact Number",
                    ctl00$ContentPlaceHolder1$gender: "Please select a Gender",
                    ctl00$ContentPlaceHolder1$DropDownstate: "Please Select State",
                    ctl00$ContentPlaceHolder1$DropDowncity: "Please Select City"

                }
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <main>
        <br />
        <div class="container text-center">
            <h1 class="text-center">User Authentication</h1>
            <div class="row">
                <div class="col-sm-6">
                    <h1 class="text-center">Registration</h1>


                    <asp:Table runat="server" CssClass="table">
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">First Name </asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox runat="server" ID="txtfname" CssClass="form-control" onkeypress="return allowOnlyAlphabets(event)"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">Last Name </asp:TableCell>
                            <asp:TableCell runat="server">
                              <asp:TextBox runat="server" ID="txtlname" CssClass="form-control" onkeypress="return allowOnlyAlphabets(event)"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">Email </asp:TableCell>
                            <asp:TableCell runat="server">
                             <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="txtemail" onkeypress="return validateEmail(event)"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">Contact No</asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox runat="server" ID="txtcontact" TextMode="Phone" CssClass="form-control" onkeypress="return allowOnlyNumbers(event)"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">Gender</asp:TableCell>
                            <asp:TableCell runat="server">

                                <asp:RadioButton ID="radiomale" runat="server" Text="Male" GroupName="gender" />
                                &nbsp;&nbsp;
                        <asp:RadioButton ID="radiofemale" runat="server" Text="Female" GroupName="gender" />
                                &nbsp;&nbsp;
                        <asp:RadioButton ID="radioother" runat="server" Text="Other" GroupName="gender" />
                                <br />

                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">State</asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:DropDownList ID="DropDownstate" AutoPostBack="true" OnSelectedIndexChanged="DropDownstate_SelectedIndexChanged" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">City</asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:DropDownList ID="DropDowncity" AutoPostBack="true" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">Password</asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox runat="server" TextMode="Password" ID="txtpassword" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server">Confirm Password</asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:TextBox runat="server" ID="txtconfpass" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow runat="server">
                            <asp:TableCell runat="server"><a href="login.aspx">Already Register?</a></asp:TableCell>
                            <asp:TableCell runat="server">
                                <asp:Button runat="server" ID="btnregister" OnClick="btnregister_Click" Text="Register" ForeColor="White" Width="80px" Font-Size="Medium" BackColor="Black" Font-Bold="True" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>

                    <asp:Label runat="server" ID="lblemail" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
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

    <script type="text/javascript">
        function allowOnlyNumbers(evt) {
            // Get the key code of the pressed key
            var charCode = (evt.which) ? evt.which : evt.keyCode;

            // Get the current value of the text input
            var currentValue = evt.target.value;

            // Ensure only numbers (0-9) are allowed
            if (charCode >= 48 && charCode <= 57) {
                // Check if the length of the text is less than 10 characters
                if (currentValue.length < 10) {
                    // If the length is 0, allow any digit between 6 and 9
                    if (currentValue.length === 0) {
                        if (charCode >= 54 && charCode <= 57) {
                            return true;
                        } else {
                            evt.preventDefault();
                            return false;
                        }
                    } else {
                        return true;
                    }
                } else {
                    // Prevent further input if the maximum length is reached
                    evt.preventDefault();
                    return false;
                }
            } else {
                // Prevent input of characters other than numbers
                evt.preventDefault();
                return false;
            }
        }
    </script>
    <script type="text/javascript">
        function allowOnlyAlphabets(evt) {
            // Get the key code of the pressed key
            var charCode = (evt.which) ? evt.which : evt.keyCode;

            // Ensure only alphabetic characters (a-z, A-Z) are allowed
            if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode === 8 || charCode === 32) {
                return true; // Allow the input
            } else {
                evt.preventDefault();
                return false; // Prevent input of characters other than alphabets
            }
        }
    </script>


    <script type="text/javascript">
        function allowOnlyAlphabets(evt) {
            // Get the key code of the pressed key
            var charCode = (evt.which) ? evt.which : evt.keyCode;

            // Ensure only alphabetic characters (a-z, A-Z) are allowed
            if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || charCode === 8 || charCode === 32) {
                return true; // Allow the input
            } else {
                evt.preventDefault();
                return false; // Prevent input of characters other than alphabets
            }
        }
    </script>

<script type="text/javascript">
    function validateEmail(evt) {
        // Get the key code of the pressed key
        var charCode = (evt.which) ? evt.which : evt.keyCode;

        // Get the current value of the text input
        var currentValue = evt.target.value;

        // Check if the entered character is a valid character in the email format
        if (
            (charCode >= 65 && charCode <= 90) || // Uppercase letters
            (charCode >= 97 && charCode <= 122) || // Lowercase letters
            (charCode >= 48 && charCode <= 57) || // Numbers
            charCode === 46 || charCode === 64 || charCode === 95 || // Special characters: . @ _
            charCode === 8 || charCode === 32 // Backspace and space
        ) {
            // Check if the entered character is a valid character after '@'
            if (currentValue.indexOf('@') === -1 || charCode !== 64) {
                // Check if the first character is an alphabet or number
                if (currentValue.length === 0 && ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122) || (charCode >= 48 && charCode <= 57))) {
                    return true; // Allow the input
                }
                // Check if the first character is an alphabet or number and subsequent characters match the allowed ones
                else if (currentValue.length > 0) {
                    return true; // Allow the input
                }
            }
        }

        evt.preventDefault();
        return false; // Prevent input of characters that don't match the email format
    }
</script>




</asp:Content>

