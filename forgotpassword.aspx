<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forgotpassword.aspx.cs" Inherits="forgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

     <script>
         $(document).ready(function () {
             $('#form1').validate({
                 rules: {
                     ctl00$ContentPlaceHolder1$txtemail: {
                         required: true,
                         email: true

                     }
                 },
                 messages: {
                     ctl00$ContentPlaceHolder1$txtemail: {
                         required: "Please Enter Ragistered Your Email",
                         email: "Please enter a valid email address"
                     }
                 }
             });
         });
        
     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <br />
        <br />


             <main><br />
         <div class="container text-center">
    <h1 class="text-center">User Authentication</h1>
    <br>
        <br />

    <div class="row">
        <div class="col-sm-6">
    
            <h1 class="text-center">Forgot Password</h1>
            <asp:Table runat="server" CssClass="table">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Email </asp:TableCell>    
                                      <asp:TableCell runat="server"><asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="txtemail" onkeypress="return validateEmail(event)" ></asp:TextBox></asp:TableCell> 
                </asp:TableRow>
              
                <asp:TableFooterRow runat="server">
                    <asp:TableCell runat="server" ><a href="login.aspx">Already User?</a></asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Button runat="server" ID="btnsendotp"  OnClick="btnsendotp_Click"  Text="Send OTP" ForeColor="White" Width="90px" Font-Size="Medium" BackColor="Black" Font-Bold="True" />
                    </asp:TableCell>
                </asp:TableFooterRow>
            </asp:Table>
                
            <asp:Label runat="server" ID="lblemail" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
           
        </div>
        <div class="col-sm-6">
            <br />
        <img src="images/item-11.jpg" alt="CoverImage" width="500" style="background:no-repeat"/>    
        </div>
    </div>
</div>
     </main>
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

