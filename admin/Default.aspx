﻿<%@ Page Title="Admin" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script type="text/javascript">
         function preventBack() { window.history.forward(); }
         setTimeout("preventBack()", 0);
         window.onunload = function () { null };
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     
    <div class="w3-container">
        <div class="w3-row">
            <a href="customer.aspx">
                <div class="w3-col s3 w3-center">
                    <h3><span><i class="fa fa-user"></i>&nbsp;</span>Customer</h3>
                    <h2><%= Session["customercount"] %></h2>
                </div>
            </a>
            <a href="product.aspx">
                <div class="w3-col s3 w3-center">
                    <h3><span><i class="fa fa-product-hunt"></i>&nbsp;</span>Product</h3>
                    <h2><%= Session["productcount"] %></h2>
                </div>
            </a>
            <a href="stock.aspx">
                <div class="w3-col s3 w3-center">
                    <h3><span><i class="fa fa-stack-overflow"></i>&nbsp;</span>Stock</h3>
                    <h2><%=Session["stockcount"] %></h2>
                </div>
            </a>
            <a href="order.aspx">
                <div class="w3-col s3 w3-center">
                    <h3><span><i class="fa fa-sellsy"></i>&nbsp;</span>Order</h3>
                    <h2><%=Session["ordercount"] %></h2>
                </div>
            </a>
        </div>
    </div>
</asp:Content>

