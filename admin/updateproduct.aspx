<%@ Page Title="Product" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="updateproduct.aspx.cs" Inherits="admin_updateproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <script>
     $(document).ready(function () {

         $('#form1').validate({
             rules: {
                 ctl00$ContentPlaceHolder1$txtproductname: {
                     required: true

                 },
                 ctl00$ContentPlaceHolder1$txtmodel: {
                     required: true

                 },
                 ctl00$ContentPlaceHolder1$txtdescription: {
                     required: true
                 },
                 ctl00$ContentPlaceHolder1$txtprice: {
                     required: true

                 }
                

             },
             messages: {
                 ctl00$ContentPlaceHolder1$txtproductname: {
                     required: "Please Enter Your Product Name"

                 },
                 ctl00$ContentPlaceHolder1$txtmodel: {
                     required: "Please Enter Your Product Model"
                 },
                 ctl00$ContentPlaceHolder1$txtdescription: {
                     required: "Please Enter Your Product Description"
                 },
                 ctl00$ContentPlaceHolder1$txtprice: {
                     required: "Please Enter Your Product Price"
                 }
                

             }
         });
     });
     </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="w3-container">
     <p style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
         Update Product Details
     </p>
     <div class="w3-row">
         <div class="w3-col s3"></div>
         <div class="w3-col s8">
              <asp:Label ID="lblerror" runat="server"></asp:Label>

             <h2 class="w3-center">Update Product Details Here</h2>
             <asp:Table runat="server" ID="tblproduct" CssClass="w3-table">
                 <asp:TableRow runat="server">
                     <asp:TableCell runat="server" CssClass="w3-center">Product Category</asp:TableCell>
                     <asp:TableCell runat="server">
                        <asp:Label runat="server" ID="category" CssClass="w3-input w3-border"></asp:Label>
                     </asp:TableCell>
                 </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell runat="server" CssClass="w3-center">Product SubCategory</asp:TableCell>
                     <asp:TableCell runat="server">
                         <asp:Label runat="server" CssClass="w3-input w3-border" ID="Dropdownsubcategory" ></asp:Label>
                     </asp:TableCell>
                 </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell runat="server" CssClass="w3-center">Product Brand</asp:TableCell>
                     <asp:TableCell runat="server">
                         <asp:Label runat="server" CssClass="w3-input w3-border" ID="Dropdownbrand"></asp:Label>
                     </asp:TableCell>
                 </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell runat="server" CssClass="w3-center">Product Name</asp:TableCell>
                     <asp:TableCell runat="server">
                         <asp:TextBox runat="server" ID="txtproductname" CssClass="w3-input w3-border"></asp:TextBox>
                     </asp:TableCell>
                 </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell runat="server" CssClass="w3-center">Model No</asp:TableCell>
                     <asp:TableCell runat="server">
                         <asp:TextBox runat="server" ID="txtmodel" CssClass="w3-input w3-border"></asp:TextBox>
                     </asp:TableCell>
                 </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell runat="server" CssClass="w3-center">Product Description</asp:TableCell>
                     <asp:TableCell runat="server">
                         <asp:TextBox runat="server" ID="txtdescription" CssClass="w3-input w3-border"></asp:TextBox>
                     </asp:TableCell>
                 </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell runat="server" CssClass="w3-center">Product Price</asp:TableCell>
                     <asp:TableCell runat="server">
                         <asp:TextBox runat="server" TextMode="Number" ID="txtprice" CssClass="w3-input w3-border"></asp:TextBox>
                     </asp:TableCell>
                 </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell runat="server" CssClass="w3-center">Product  Image</asp:TableCell>
                     <asp:TableCell runat="server">
    <asp:FileUpload runat="server" ID="pimage" CssClass="w3-input w3-border" />
  
                     </asp:TableCell>
                 </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell runat="server"></asp:TableCell>
                     <asp:TableCell runat="server">
                         <asp:Button runat="server" ID="btnupdateproduct" OnClick="btnupdateproduct_Click" Text="Update product" ForeColor="White" BackColor="Black" />
                        
                     </asp:TableCell>
                 </asp:TableRow>

             </asp:Table>
         </div>
         <div class="w3-col s3">
             <div class="w3-center">
                 <br /><br /><br /><br /><br />
                 <asp:Image runat="server" ID="imgProduct" CssClass="w3-image w3-margin-left"  BorderStyle="Groove"/>
             </div>
         </div>
     </div>
 </div>
</asp:Content>

