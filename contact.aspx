<%@ Page Title="Contact" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

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
    <h2 class="text-center" style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif">Contact Information</h2>
    <br>
    <div class="row">
        <div class="col-sm-3 text-left">
            <p>
                <span>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" style="width: 30px;" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                        <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z" />
                    </svg></span>
                19 ,Footwear Shop , Near Thane ,
            </p>
            <p>Navi Mumbai-410206</p>
        </div>
        <div class="col-sm-3 text-left">
            <p>
                <span>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" style="width: 30px;" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 0 0 2.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 0 1-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 0 0-1.091-.852H4.5A2.25 2.25 0 0 0 2.25 4.5v2.25Z" />
                    </svg>
                </span>
                +91 8799559020
            </p>
        </div>
        <div class="col-sm-3 text-left">
            <p>
                <span>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" style="width: 30px;" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5" />
                    </svg>
                </span>
                info@footwear.com
            </p>

        </div>
        <div class="col-sm-3 text-left">
            <p>
                <span>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" style="width: 30px;" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 21a9.004 9.004 0 0 0 8.716-6.747M12 21a9.004 9.004 0 0 1-8.716-6.747M12 21c2.485 0 4.5-4.03 4.5-9S14.485 3 12 3m0 18c-2.485 0-4.5-4.03-4.5-9S9.515 3 12 3m0 0a8.997 8.997 0 0 1 7.843 4.582M12 3a8.997 8.997 0 0 0-7.843 4.582m15.686 0A11.953 11.953 0 0 1 12 10.5c-2.998 0-5.74-1.1-7.843-2.918m15.686 0A8.959 8.959 0 0 1 21 12c0 .778-.099 1.533-.284 2.253m0 0A17.919 17.919 0 0 1 12 16.5c-3.162 0-6.133-.815-8.716-2.247m0 0A9.015 9.015 0 0 1 3 12c0-1.605.42-3.113 1.157-4.418" />
                    </svg>
                </span>
                www.footwear.com
            </p>

        </div>
    </div>
        <br />
    <div class="row">
        <div class="col-sm-6">
            <br /><br />
            <h2 class="text-center">Contact Us</h2>
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
        <asp:TableCell runat="server"><a href="register.aspx">Not A Member?</a></asp:TableCell>
        <asp:TableCell runat="server">
            <asp:Button runat="server" ID="btnlogin" OnClick="btnlogin_Click"  Text="Send Message" ForeColor="White" Width="150px" Font-Size="Medium" BackColor="Black" Font-Bold="True" />
        </asp:TableCell>
    </asp:TableFooterRow>
</asp:Table>
                
        </div>
        <div class="col-sm-4">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d120562.31417588616!2d72.9190582033788!3d19.213873535735033!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7b8fcfe76fd59%3A0xcf367d85f7c50283!2sThane%2C%20Maharashtra!5e0!3m2!1sen!2sin!4v1704891794640!5m2!1sen!2sin" width="600" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
</div>

     </main>
</asp:Content>

