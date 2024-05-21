<%@ Page Title="Cart" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Linq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />

    <h1 class="text-center " style="font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif">My Cart&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span></h1>
    <br />
    <%

        if (Session["useremail"] == null)
        {



    %>
    <p class="text-center">You Are Not Login In To System</p>
    <%
        }
        else
        {
    %>
    <div class="container">
        <table class="table align-middle mb-0 bg-white">
            <thead class="bg-light">
                <tr>
                    <th>Image</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Size</th>
                    <th>Color</th>
                    <th>Quantity</th>
                    <th>SubTotal</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>

                <asp:Repeater ID="viewcartlist" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <a href="product_details.aspx?id=<%# Eval("p_id") %>">
                                    <span>
                                        <img
                                            src="../UPLOADS/<%# Eval("image") %>"
                                            alt=""
                                            style="width: 65px;"
                                            class="rounded-circle" />
                                    </span>
                                </a>
                            </td>
                            <td><%# Eval("pname") %></td>
                            <td>&#8377;<%# Eval("price") %>.00</td>
                            <td><%# Eval("size") %></td>
                            <td><%# Eval("color") %></td>
                            <td>
                                <a href="<%# Eval("c_id", "cart.aspx?cartmid={0}") %>"><span class="glyphicon glyphicon-minus"></span></a>&nbsp;&nbsp;<%# Eval("quantity") %>&nbsp;&nbsp;<a href="<%# Eval("c_id", "cart.aspx?cartpid={0}") %>"><span class="glyphicon glyphicon-plus"></span></a></td>
                            <td>
                                <%# string.Format("&#8377;{0}.00", Convert.ToDouble(Eval("price")) * Convert.ToInt32(Eval("quantity"))) %>
                            </td>
                            <td>
                                <a href="<%# Eval("c_id", "cart.aspx?cartid={0}") %>" onclick="return confirm('Are you sure you want to Remove this Product?');">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </a>
                            </td>
                        </tr>
                    </ItemTemplate>

                </asp:Repeater>
            </tbody>
            <tfoot id="footer">
                <tr>
                    <td colspan="5"></td>
                    <td>
                        <h4><b>Total Amount:</b></h4>
                    </td>
                    <td>
                        <h4>
                            <asp:Label runat="server" ID="lbltotal" /></h4>

                    </td>
                    <td>
                        <asp:Button runat="server" ID="emtycart" OnClick="emtycart_Click" Text="Empty Cart" CssClass="btn btn-danger" /></td>
                </tr>
            </tfoot>
        </table>

        <div class="row">
            <div class="col-sm-8"></div>
            <div class="col-sm-2">
                <asp:Button runat="server" ID="checkout" OnClick="checkout_Click" CssClass="btn btn-success" Text="Proceed To Checkout" />


            </div>
        </div>
    </div>

    <%
        }

    %>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script>
        function showToast(message) {
            toastr.success(message);

        }
        function showToastdanget(message) {
            toastr.error(message);

        }
    </script>
</asp:Content>

