<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="product_details.aspx.cs" Inherits="product_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#form1').validate({
                rules: {
                    ctl00$ContentPlaceHolder1$ddlSize: "required",
                    ctl00$ContentPlaceHolder1$ddlColor: "required"
                },
                messages: {
                    ctl00$ContentPlaceHolder1$ddlSize: "Please Select Size",
                    ctl00$ContentPlaceHolder1$ddlColor: "Please Select Color"

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
        <div class="container">
            <h2 style="color: black; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', 'Arial', 'sans-serif';">Product Details</h2>
            <hr />
            <br>
            <div class="row">
                       <asp:ScriptManager runat="server" />
        <asp:UpdatePanel runat="server" ID="updatepanel1">
<ContentTemplate>
                <div class="col-sm-6">
                    <asp:Image runat="server" ID="imgProduct" Width="550px" BorderWidth="1" BorderColor="Black" BorderStyle="Solid" />
                </div>
                <div class="col-sm-6">
                    <br />
                    <h2 style="color: black; font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', 'Arial', 'sans-serif';">
                        <asp:Label runat="server" ID="txtpname"></asp:Label>
                        [<asp:Label runat="server" ID="txtbrand"></asp:Label>]</h2>
                    <hr />
                    <h4>
                        <asp:Label runat="server" ID="txtdescription"></asp:Label>
                    </h4>
                    <h3>&#8377;
                        <asp:Label runat="server" ID="txtprice"></asp:Label>.00</h3>
                    <hr />
                    <h5>Size :</h5>
                    <asp:DropDownList ID="ddlSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSize_SelectedIndexChanged" Width="200px" CssClass="form-control"></asp:DropDownList>
                    <h5>Color :</h5>
                    <asp:DropDownList ID="ddlColor" runat="server" AutoPostBack="true" Width="200px" CssClass="form-control"></asp:DropDownList>
                    <hr />
                    <span>
                        <button onclick="decrement()">-</button></span>
                    <asp:TextBox runat="server" CssClass="text-center" Text="1" ID="txtcartvalue" TextMode="Number"></asp:TextBox>
                    <span>
                        <button onclick="increment()">+</button></span>
                    <br />
                    <br />
                    <span>
                        <asp:Button runat="server" ID="addtocart" Text="Add To Cart" ForeColor="black" Width="130px" Font-Size="Medium" BackColor="green" Font-Bold="True" OnClick="addtocart_Click" />

                    </span>&nbsp;&nbsp;<span><asp:Button runat="server" ID="addtowishlist" Text="Add To Wishlist" ForeColor="black" Width="150px" Font-Size="Medium" BackColor="pink" Font-Bold="True" OnClick="addtowishlist_Click" /></span>
                    <br />
                </div>
                  </ContentTemplate>
</asp:UpdatePanel>

            </div>
        </div>
    </main>

         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
     <script>
         // Function to show toastr message
         function showToast(message) {
             toastr.success(message);
             
         }
         function showToastdanget(message) {
             toastr.error(message);

         }

     </script>
    
    <script>
        function increment() {
            var textBox = document.getElementById('<%= txtcartvalue.ClientID %>');
            var currentValue = parseInt(textBox.value);
            textBox.value = currentValue + 1;
        }

        function decrement() {
            var textBox = document.getElementById('<%= txtcartvalue.ClientID %>');
            var currentValue = parseInt(textBox.value);
            if (currentValue > 1) {
                textBox.value = currentValue - 1;
            }
        }
    </script>

</asp:Content>


