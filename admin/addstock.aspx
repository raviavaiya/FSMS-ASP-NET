<%@ Page Title="Stock" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="addstock.aspx.cs" Inherits="admin_addstock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(document).ready(function () {
            $('#form1').validate({
                rules: {
                    ctl00$ContentPlaceHolder1$DropDownproduct: {
                        required: true

                    }

                },
                messages: {
                    ctl00$ContentPlaceHolder1$DropDownproduct: {
                        required: "Select Your Product Name"

                    }

                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="w3-container">
        <p style="font-size: larger; font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">
            Stock Details <span style="float: right;">
                <a href="stock.aspx" class="w3-button w3-black">Show Stock</a>
            </span>
        </p>
        <div class="w3-row">
            <div class="w3-col s4"></div>
            <div class="w3-col s8">

                <h2 class="w3-center">Add Stock Details Here</h2>
                <table id="tblstock" class="w3-table">

                    <tr>
                        <td runat="server" class="w3-center">Product Name</td>
                        <td>
                            <asp:DropDownList runat="server" ID="DropDownproduct" Class="w3-input w3-border">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        </tr>
                </table>
                <table class="w3-center">
                    <tr>
                       <td>

                            <asp:Panel runat="server" ID="panel1" CssClass="">

                                <asp:PlaceHolder runat="server" ID="placeholderTextBoxSets"></asp:PlaceHolder>

                            </asp:Panel>
                       </td>
                    </tr>

                </table>

                           
                       <table class="w3-table">
                           <tr>
                               <td></td>   <td></td>   <td></td>
                               <td> <asp:Button runat="server" ID="btnadd" Text="+ Add More" OnClick="btnadd_Click" CssClass="w3-button w3-black" /></td>
                           </tr>
                           <tr>
                               <td></td>   <td></td>   <td></td>
                               <td>

                           <asp:Button runat="server" ID="btnsave" Text="Save" OnClick="btnsave_Click" CssClass="btn btn-success mt-3 ml-2" />
                               </td>

                           </tr>

                       </table>
                        


              <asp:Label runat="server" ID="Label3" CssClass="text-success mt-3"></asp:Label>

            </div>
            <div class="w3-col s2"></div>
        </div>
    </div>
</asp:Content>

