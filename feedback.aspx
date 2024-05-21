<%@ Page Title="FeedBack" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

      <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

    <script type="text/javascript">
    $(document).ready(function () {


       $('#form1').validate({
           rules: {
               ctl00$ContentPlaceHolder1$txtusername: {
                   required: true,
                   email: true

               },
               ctl00$ContentPlaceHolder1$txtmessage: {
                   required: true,
                   minlength: 3
               }
           },
           messages: {
               ctl00$ContentPlaceHolder1$txtusername: {
                   required: "Please Enter Your Email",
                   email: "Please enter a valid email address"
               },
               ctl00$ContentPlaceHolder1$txtmessage: {
                   required: "Please provide a Message",
                   minlength: "Your Message SHould be aleast One Word!!"
               }
           }
       });
   });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                  <br />
              <br />
     <main>
         <br />
         <div class="container text-center">
    <h2 class="text-center" style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif"><span class="glyphicon glyphicon-user"></span>&nbsp;Customer Care</h2>
    <br>
    <div class="row">
        <div class="col-sm-6">
            <br /><br />
            <h2 class="text-center">Feedback</h2>
            <br />
            
            <asp:Table runat="server" CssClass="table">
    <asp:TableRow runat="server">
        <asp:TableCell runat="server">Email </asp:TableCell>
        <asp:TableCell runat="server">
            <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="txtusername"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>
    <asp:TableRow runat="server">
        <asp:TableCell runat="server">Message</asp:TableCell>
        <asp:TableCell runat="server">
            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtmessage" CssClass="form-control"></asp:TextBox>
        </asp:TableCell>
    </asp:TableRow>

    
    <asp:TableFooterRow runat="server">
        <asp:TableCell runat="server"></asp:TableCell>
        <asp:TableCell runat="server">
            <asp:Button runat="server" ID="btnfeedback" OnClick="btnfeedback_Click"  Text="Send Feedback" ForeColor="White" Width="150px" Font-Size="Medium" BackColor="Black" Font-Bold="True" />
        </asp:TableCell>
    </asp:TableFooterRow>
</asp:Table>
                
        </div>
        <div class="col-sm-4">
            <br />
           <img src="images/profile.png" alt="CoverImage" width="500" style="background: no-repeat" />
            </div>
    </div>
</div>

     </main>
</asp:Content>

