<%@ Page Title="Subcategory" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="addsubcategory.aspx.cs" Inherits="admin_addsubcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
         $(document).ready(function () {
             $('#form1').validate({
                 rules: {
                     ctl00$ContentPlaceHolder1$DropDowncategory: {
                         required: true

                     },
                     ctl00$ContentPlaceHolder1$txtsubcategoryname: {
                         required: true
                     }

                 },
                 messages: {
                     ctl00$ContentPlaceHolder1$DropDowncategory: {
                         required: "Please Enter Your Sub-Category Name"

                     },
                     ctl00$ContentPlaceHolder1$txtsubcategoryname: {
                         required: "Please Select Category"
                     }

                 }
             });
         });
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="w3-container">
    <p style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
        Sub-Category Details <span style="float: right;">
            <a href="subcategory.aspx" class="w3-button w3-black">Show SubCategory</a>
        </span>
    </p>
    <div class="w3-row">
        <div class="w3-col s4"></div>
        <div class="w3-col s8">

                <h2 class="w3-center">Add Sub Category Details Here</h2>
                <asp:Table runat="server" ID="tblsubcategory" CssClass="w3-table">

                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" CssClass="w3-center">Category Name</asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:DropDownList runat="server" ID="DropDowncategory" CssClass="w3-input w3-border">
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" CssClass="w3-center">Sub-category Name </asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:TextBox runat="server" ID="txtsubcategoryname" CssClass="w3-input w3-border"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server"></asp:TableCell>
                        <asp:TableCell runat="server">
                            <asp:Button runat="server" ID="btnaddcategory" OnClick="btnaddcategory_Click" Text="add SubCategory" ForeColor="White" BackColor="Black" />
                        </asp:TableCell>
                    </asp:TableRow>

                </asp:Table>
          
            <asp:Label runat="server" ID="lblsubcategory"></asp:Label>

        </div>
        <div class="w3-col s2"></div>
    </div>
</div>
    
</asp:Content>

