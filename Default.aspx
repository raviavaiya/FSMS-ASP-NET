<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
   function preventBack() { window.history.forward(); }
   setTimeout("preventBack()", 0);
   window.onunload = function () { null };
     </script>
            
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br />
    <br />
     <main>
     <div id="myCarousel" class="carousel slide" data-ride="carousel">
         <!-- Indicators -->
         <ol class="carousel-indicators">
             <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
             <li data-target="#myCarousel" data-slide-to="1"></li>
             <li data-target="#myCarousel" data-slide-to="2"></li>
         </ol>

         <!-- Wrapper for slides -->
         <div class="carousel-inner" role="listbox">
             <div class="item active">
                 <img src="images/img_bg_3.jpg" alt="Image" style="height: 75vh; width: 100%;" />
                 <div class="carousel-caption">
                     <h1 class="head-1">Men's</h1>
                     <h2 class="head-2">Shoes</h2>
                     <h2 class="head-3">Collection</h2>
                     <p><span>New trending shoes</span></p>
                     <p><a href="men.aspx" class="btn btn-primary">Shop Collection</a></p>
                 </div> 
             </div>

             <div class="item">
                 <img src="images/img_bg_2.jpg" alt="Image" style="height: 75vh; width: 100%;" />
                 <div class="carousel-caption">
                     <h1 class="head-1">Women's</h1>
                     <h2 class="head-2">Shoes</h2>
                     <h2 class="head-3">Collection</h2>
                     <p><span>New trending shoes</span></p>
                     <p><a href="women.aspx" class="btn btn-primary">Shop Collection</a></p>
                 </div>
             </div>
             <div class="item">
                 <img src="images/img_bg_1.jpg" alt="Image" style="height: 75vh; width: 100%;" />
                 <div class="carousel-caption">
                     <h1 class="head-1">New</h1>
                     <h2 class="head-2">Arrival</h2>
                     <h2 class="head-3">Brands</h2>
                     <p><span>New stylish shoes for men</span></p>
                     <p><a href="men.aspx" class="btn btn-primary">Shop Collection</a></p>
                 </div>
             </div>
         </div>

         <!-- Left and right controls -->
         <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
             <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
             <span class="sr-only">Previous</span>
         </a>
         <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
             <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
             <span class="sr-only">Next</span>
         </a>
     </div>
     <br />

     <div class="container text-center">
         <h3>It started with a simple idea: Create quality, well-designed products that I wanted myself.</h3>
         <br>
         <div class="row">
             <div class="col-sm-4">
                 <a href="men.aspx">
                     <img src="images/men.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                 </a>
                 <h2>Shop Men's Collection</h2>

             </div>
             <div class="col-sm-4">
                 <a href="women.aspx">
                     <img src="images/women.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                 </a>
                 <h2>Shop Women's Collection</h2>

             </div>
             <div class="col-sm-4">
                 <a href="kid.aspx">
                     <img src="images/kid.jpg" class="img-responsive" style="width: 100%" alt="Image" />
                 </a>
                 <h2>Shop Kid's Collection</h2>

             </div>
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

