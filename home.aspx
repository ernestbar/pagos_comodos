<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="pagos_comodos.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- BEGIN #slider -->
		<div id="slider" class="section-container p-0 bg-dark">
			<!-- BEGIN carousel -->
			<div id="main-carousel" class="carousel slide" data-ride="carousel">
				<!-- BEGIN carousel-inner -->
				<div class="carousel-inner">
					<!-- BEGIN item -->
					<div class="carousel-item active" data-paroller="true" data-paroller-factor="0.3" data-paroller-factor-sm="0.01" data-paroller-factor-xs="0.01" style="background: url(../assets/img/slider/slider-1-cover.jpg) center 0 / cover no-repeat;">
						<div class="container">
							<img src="../assets/img/slider/slider-1-product.png" class="product-img right bottom fadeInRight animated" alt="" />
						</div>
						<div class="carousel-caption carousel-caption-left">
							<div class="container">
								<h3 class="title mb-5px fadeInLeftBig animated">iMac</h3>
								<p class="mb-15px fadeInLeftBig animated">The vision is brighter than ever.</p>
								<div class="price mb-30px fadeInLeftBig animated"><small>from</small> <span>$2299.00</span></div>
								<a href="product_detail.html" class="btn btn-outline btn-lg fadeInLeftBig animated">Buy Now</a>
							</div>
						</div>
					</div>
					<!-- END item -->
					<!-- BEGIN item -->
					<div class="carousel-item" data-paroller="true" data-paroller-factor="-0.3" data-paroller-factor-sm="0.01" data-paroller-factor-xs="0.01" style="background: url(../assets/img/slider/slider-2-cover.jpg) center 0 / cover no-repeat;">
						<div class="container">
							<img src="../assets/img/slider/slider-2-product.png" class="product-img left bottom fadeInLeft animated" alt="" />
						</div>
						<div class="carousel-caption carousel-caption-right">
							<div class="container">
								<h3 class="title mb-5px fadeInRightBig animated">iPhone X</h3>
								<p class="mb-15px fadeInRightBig animated">Say hello to the future.</p>
								<div class="price mb-30px fadeInRightBig animated"><small>from</small> <span>$1,149.00</span></div>
								<a href="product_detail.html" class="btn btn-outline btn-lg fadeInRightBig animated">Buy Now</a>
							</div>
						</div>
					</div>
					<!-- END item -->
					<!-- BEGIN item -->
					<div class="carousel-item" data-paroller="true" data-paroller-factor="-0.3" data-paroller-factor-sm="0.01" data-paroller-factor-xs="0.01" style="background: url(../assets/img/slider/slider-3-cover.jpg) center 0 / cover no-repeat;">
						<div class="carousel-caption">
							<div class="container">
								<h3 class="title mb-5px fadeInDownBig animated">Macbook Air</h3>
								<p class="mb-15px fadeInDownBig animated">Thin.Light.Powerful.<br />And ready for anything</p>
								<div class="price fadeInDownBig animated"><small>from</small> <span>$999.00</span></div>
								<a href="product_detail.html" class="btn btn-outline btn-lg fadeInUpBig animated">Buy Now</a>
							</div>
						</div>
					</div>
					<!-- END item -->
				</div>
				<!-- END carousel-inner -->
				<a class="carousel-control-prev" href="#main-carousel" data-bs-slide="prev"> 
					<i class="fa fa-angle-left"></i> 
				</a>
				<a class="carousel-control-next" href="#main-carousel" data-bs-slide="next"> 
					<i class="fa fa-angle-right"></i> 
				</a>
			</div>
			<!-- END carousel -->
		</div>
		<!-- END #slider -->
</asp:Content>
