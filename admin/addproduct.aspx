<%@ Page Title="Product" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="addproduct.aspx.cs" Inherits="admin_addproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <script>
        //function deleteTextBoxSet(setIndex) {
        //    if (confirm("Are you sure you want to remove this row?")) {
        //        var row = document.querySelector(`[id$=_${setIndex}]`);
        //        row.parentNode.removeChild(row);
        //    }
        //}

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

                    },
                    ctl00$ContentPlaceHolder1$Dropdowncategory: {
                        required: true
                    },
                    ctl00$ContentPlaceHolder1$Dropdownsubcategory: {
                        required: true
                    },
                    ctl00$ContentPlaceHolder1$Dropdownbrand: {
                        required: true
                    },
                    ctl00$ContentPlaceHolder1$pimage: {
                        required: true,
                        extension: "png|jpg|jpeg|gif",
                        filesize: 1048576
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
                    },
                    ctl00$ContentPlaceHolder1$Dropdowncategory: {
                        required: "Please Select Your Product Category"
                    },
                    ctl00$ContentPlaceHolder1$Dropdownsubcategory: {
                        required: "Please Select Your Product Sub-Category"
                    },
                    ctl00$ContentPlaceHolder1$Dropdownbrand: {
                        required: "Please Select Your Product Brand"
                    },
                    ctl00$ContentPlaceHolder1$pimage: {
                        required: "Please select a file to upload",
                        extension: "Please upload a file with a valid extension (png, jpg, jpeg, or gif)",
                        filesize: "Please upload a file with a maximum size of 1MB"
                    }

                }
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="w3-container">
        <p style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
            Insert Product <span style="float: right;">
                <a href="product.aspx" class="w3-button w3-black">View Product</a>
            </span>
        </p>
        <div class="w3-row">
            <div class="w3-col s4"></div>
            <div class="w3-col s8">
                <asp:Label ID="lblerror" runat="server"></asp:Label>

                <h2 class="w3-center">Add Product Details Here</h2>
                <table id="tblproduct" class="w3-table">
                    <tr>
                        <td>Product Category</td>
                        <td>
                            <asp:DropDownList runat="server" AutoPostBack="true" CssClass="w3-input w3-border" ID="Dropdowncategory" OnSelectedIndexChanged="Dropdownsubcategory_SelectedIndexChanged"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Product SubCategory</td>
                        <td>
                            <asp:DropDownList runat="server" CssClass="w3-input w3-border" ID="Dropdownsubcategory" AutoPostBack="true"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Product Brand</td>
                        <td>
                            <asp:DropDownList runat="server" CssClass="w3-input w3-border" ID="Dropdownbrand"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td>Product Name</td>
                        <td>
                            <asp:TextBox runat="server" ID="txtproductname" CssClass="w3-input w3-border"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Model No</td>
                        <td>
                            <asp:TextBox runat="server" ID="txtmodel" CssClass="w3-input w3-border"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Product Description</td>
                        <td>
                            <asp:TextBox runat="server" ID="txtdescription" CssClass="w3-input w3-border"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Product Price</td>
                        <td>
                            <asp:TextBox runat="server" TextMode="Number" ID="txtprice" CssClass="w3-input w3-border"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
     <td>Product  Image</td>
    
     <td>
         <asp:FileUpload runat="server" ID="pimage" CssClass="w3-input w3-border" />
     </td>
 </tr>
                    <tr>

    <td></td>
    
    <td>
        <asp:Button runat="server" ID="btnaddproduct" OnClick="btnaddproduct_Click" Text="add product" ForeColor="White" BackColor="Black" />
    </td>
</tr>


                </table>
                



            </div>

            <div class="w3-col s2"></div>
        </div>
    </div>
</asp:Content>

