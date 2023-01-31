﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="requisitos.aspx.cs" Inherits="pagos_comodos.requisitos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- BEGIN #about-us-content -->
		<div id="about-us-content" class="section-container bg-white">
			<!-- BEGIN container -->
			<div class="container">
				<!-- BEGIN about-us-content -->
				<div class="about-us-content">
					<h2 class="title text-center">Que necesitas para tus minicuotas?</h2>
					<p class="desc text-center">
						Nuestra evaluacion es simple.<br />
						Lee los requisitos o solicita un promotor. 
					</p>
					<!-- BEGIN row -->
					<div class="row">
						<!-- begin col-4 -->
						<div class="col-md-4 col-sm-4">
							<div class="service">
								<div class="icon text-muted"><i class="fa fa-truck"></i></div>
								<div class="info">
									<h4 class="title">Boletas de pago</h4>
									<p class="desc">Para las personas dependientes, solo necesitan las 3 ultimas papeletas de pagos, si tu no eres dependiente necesitas algun documento que demuestre tus ganancias mensuales.</p>
								</div>
							</div>
						</div>
						<!-- end col-4 -->
						<!-- begin col-4 -->
						<div class="col-md-4 col-sm-4">
							<div class="service">
								<div class="icon text-blue"><i class="fa fa-universal-access"></i></div>
								<div class="info">
									<h4 class="title">Carnet de Identidad</h4>
									<p class="desc">Fotocopia simple de tu carnet de identidad vigente.</p>
								</div>
							</div>
						</div>
						<!-- end col-4 -->
						<!-- begin col-4 -->
						<div class="col-md-4 col-sm-4">
							<div class="service">
								<div class="icon text-info"><i class="fa fa-assistive-listening-systems"></i></div>
								<div class="info">
									<h4 class="title">Factura de luz o agua</h4>
									<p class="desc">Fotocopia simple de tu factura de luz o agua, para verificar tu domicilio.</p>
								</div>
							</div>
						</div>
						<!-- end col-4 -->
					</div>
					<!-- END row -->
					<hr />
					<!-- BEGIN row -->
					<div class="row">
						<!-- begin col-4 -->
						<div class="col-md-4 col-sm-4">
							<div class="service">
								<div class="icon text-danger"><i class="fab fa-cc-discover"></i></div>
								<div class="info">
									<h4 class="title">Croquis de domicilio</h4>
									<p class="desc">Coordenadas de google maps o fotografia del croquis de tu domicilio.</p>
								</div>
							</div>
						</div>
						<!-- end col-4 -->
						<!-- begin col-4 -->
						<div class="col-md-4 col-sm-4">
							<div class="service">
								<div class="icon text-dark"><i class="fab fa-connectdevelop"></i></div>
								<div class="info">
									<h4 class="title">Croquis de tu trabajo</h4>
									<p class="desc">Coordenadas de google maps o fotografia del croquis de tu lugar de trabajo.</p>
								</div>
							</div>
						</div>
						<!-- end col-4 -->
						<!-- begin col-4 -->
						<div class="col-md-4 col-sm-4">
							<div class="service">
								<div class="icon text-success"><i class="fa fa-braille"></i></div>
								<div class="info">
									<h4 class="title">Aportes de AFP
									</h4>
									<p class="desc">Extracto de tus aportes a las AFPs si aplica.</p>
								</div>
							</div>
						</div>
						<!-- end col-4 -->
					</div>
					<!-- END row -->
				</div>
				<!-- END about-us-content -->
			</div>
			<!-- END container -->
		</div>
		<!-- END #about-us-content -->
</asp:Content>