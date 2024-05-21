<%@ Page Title="Women" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="women.aspx.cs" Inherits="women" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <main>
        <br />
        <div class="container text-center">
            <h3>It started with a simple idea: Create quality, well-designed products that I wanted myself.</h3>
            <h2><span style="color: #ff0000;">W</span>omen's Collection</h2>
            <br>
            <div class="row">
                <asp:DataList runat="server" ID="viewproduct" RepeatDirection="Horizontal" RepeatColumns="4">
                    <ItemTemplate>
                        <div style="width: 270px; text-align: center; padding:0px 10px 0px 10px;">
                            <a href="product_details.aspx?id=<%# Eval("p_id") %>">
                                <img src="../UPLOADS/<%# Eval("image") %>" alt="Product Image" style="width: 100%; height: 200px; object-fit: fill;" />
                            </a>

                           
                        </div>


                        <h4><%# Eval("pname") %></h4>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>

        <br />
        <div class="container text-center">
            <h3>Trusted Partners</h3>
            <br>
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-2">
                    <img src="images/brand-1.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                </div>
                <div class="col-sm-2">
                    <img src="images/brand-2.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                </div>
                <div class="col-sm-2">
                    <img src="images/brand-3.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                </div>
                <div class="col-sm-2">
                    <img src="images/brand-4.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                </div>
                <div class="col-sm-2">
                    <img src="images/brand-5.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>


    </main>
</asp:Content>

