<%@ Page Title="Profile" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="admin_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="w3-container">
     <h3 style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
         <%= Session["profilename"] %>'s Profile

     </h3>

         <div class="w3-row">

              <div class="w3-col s4"></div>
              <div class="w3-col s8">

                                  <asp:Label ID="lblerror" runat="server"></asp:Label>

                <h2 class="w3-center">Update Profile Details Here</h2>
               
                  <table id="tblprofile" class="w3-table">
    <tr>
        <td>First Name </td>
        <td>
            <asp:TextBox runat="server" ID="txtfname" CssClass="w3-input w3-border"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Last Name</td>
        <td>
            <asp:TextBox runat="server" ID="txtlname" CssClass="w3-input w3-border"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Email </td>
        <td>
            <asp:Label runat="server" ID="txtemail" CssClass="w3-input w3-border"></asp:Label>

        </td>
    </tr>
    <tr>
        <td>Contact No</td>
        <td>
            <asp:TextBox runat="server" ID="txtcontact" TextMode="Number" CssClass="w3-input w3-border"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Gender</td>
        <td class="w3-center">
            <asp:RadioButton ID="radiomale" runat="server" Text="Male" GroupName="gender" />&nbsp;&nbsp;
             <asp:RadioButton ID="radiofemale" runat="server" Text="Female" GroupName="gender" />&nbsp;&nbsp;
             <asp:RadioButton ID="radioother" runat="server" Text="Other" GroupName="gender" /></td>
    </tr>
   
    <tr>
        <td>City</td>
        <td>
            <asp:Label ID="DropDowncity"  runat="server" CssClass="w3-input w3-border">
            </asp:Label></td>
    </tr>
    <tr>
        <td>Password</td>
        <td>
            <asp:TextBox runat="server" TextMode="Password" ID="txtpassword" CssClass="w3-input w3-border"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Confirm Password</td>
        <td>
            <asp:TextBox runat="server" ID="txtconfpass" TextMode="Password" CssClass="w3-input w3-border"></asp:TextBox></td>
    </tr>
 
    <tr>
        <td><a href="changepassword.aspx" forecolor="White" width="150px" font-size="Medium" backcolor="Black" font-bold="true">Change Password ?</a></td>
        <td>
            <asp:Button runat="server" ID="btnupdate" Text="Update Profile" OnClick="btnupdate_Click"  ForeColor="White" Width="150px" Font-Size="Medium" BackColor="Black" Font-Bold="True" /></td>
    </tr>
</table>
              </div>

         </div>
 </div>

    

 


</asp:Content>

