<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="comprar_tres.aspx.cs" Inherits="pagos_comodos.comprar_tres" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Label ID="lblIdUsuario" runat="server" Text="" Visible="false"></asp:Label>
	<asp:Label ID="lblIdProducto" runat="server" Text="" Visible="false"></asp:Label>
	<asp:Label ID="lblIdCategoria" runat="server" Text="" Visible="false"></asp:Label>
    <!-- BEGIN #checkout-cart -->
		<div class="section-container" id="checkout-cart">
			<!-- BEGIN container -->
			<div class="container">
				<asp:Label ID="lblAviso" runat="server" ForeColor="Blue" Text=""></asp:Label>
				<!-- BEGIN checkout -->
				<div class="checkout">
					<form action="my_account.html" method="GET" name="form_checkout">
						<!-- BEGIN checkout-header -->
						<div class="checkout-header">
							<!-- BEGIN row -->
							<div class="row">
								<!-- BEGIN col-3 -->
								<div class="col-lg-4">
									<div class="step">
										<a href="#">
											<div class="number">1</div>
											<div class="info">
												<div class="title">Gracias por tu eleccion</div>
												<div class="desc">Verifica tu producto y precio.</div>
											</div>
										</a>
									</div>
								</div>
								<!-- END col-3 -->
								<!-- BEGIN col-3 -->
								<div class="col-lg-4">
									<div class="step">
										<a href="#">
											<div class="number">2</div>
											<div class="info">
												<div class="title">Datos inciales</div>
												<div class="desc">Identificate para procesar tu solicitud.</div>
											</div>
										</a>
									</div>
								</div>
								<!-- BEGIN col-3 -->
								<div class="col-lg-4">
									<div class="step active">
										<a href="#">
											<div class="number">3</div>
											<div class="info">
												<div class="title">Confirmación</div>
												<div class="desc"></div>
											</div>
										</a>
									</div>
								</div>
								<!-- END col-3 -->
							</div>
							<!-- END row -->
						</div>
						<!-- END checkout-header -->
						<!-- BEGIN checkout-body -->
						<div class="checkout-body">
							<!-- BEGIN checkout-message -->
							<div class="checkout-message">
								<h1>Felicidades! <small>Su solicitud fue recibida, pronto nos pondremos en contacto con usted para guiarlo en su compra por MiniCuotas.</small></h1>
								<div class="table-responsive">
									<table class="table table-payment-summary">
										<tbody>
											<tr>
												<td class="field">Estado de la solicitud</td>
												<td class="value">Enviada correctamente</td>
											</tr>
											<tr>
												<td class="field">Fecha y hora de la solictud</td>
												<td class="value"><asp:Label ID="lblFechaHora" runat="server" Text=""></asp:Label> </td>
											</tr>
											<tr>
												<td class="field">Orders</td>
												<td class="value product-summary">
													<div class="product-summary-img h-150px w-100px d-flex align-items-center justify-content-center">
														<asp:Image ID="Image1" runat="server" class="mw-100 mh-100" />
													</div>
													<div class="product-summary-info">
														<div class="title"><asp:Label ID="lblTitulo" runat="server" Text=""></asp:Label></div>
													</div>
												</td>
											</tr>
											<tr>
												<td class="field">Precio en Bs.</td>
												<td class="value"><asp:Label ID="lblPrecio" CssClass="form-label" runat="server" Text=""></asp:Label></td>
											</tr>
										</tbody>
									</table>
								</div>
								<%--<p class="text-silver-darker text-center mb-0">Should you require any assistance, you can get in touch with Support Team at (123) 456-7890</p>--%>
							</div>
							<!-- END checkout-message -->
						</div>
						<!-- END checkout-body -->
						<!-- BEGIN checkout-footer -->
						<div class="checkout-footer text-center">
							<asp:Button ID="btnFinalizar" runat="server" Text="SEGUIR COMPRANDO" OnClick="btnFinalizar_Click" class="btn btn-white btn-theme" />
						</div>
						<!-- END checkout-footer -->
					</form>
				</div>
				<!-- END checkout -->
			</div>
			<!-- END container -->
		</div>
		<!-- END #checkout-cart -->
		
		<!-- BEGIN #policy -->
		<div id="policy" class="section-container bg-white">
			<!-- BEGIN container -->
			<div class="container">
				<!-- BEGIN row -->
				<div class="row">
					<!-- BEGIN col-4 -->
					<div class="col-lg-4 col-md-4 mb-4 mb-md-0">
						<!-- BEGIN policy -->
						<div class="policy">
							<div class="policy-icon"><i class="fa fa-truck"></i></div>
							<div class="policy-info">
								<h4>Te lo enviamos gratis</h4>
								<p>Llevamos el producto para que lo veas gratuitamente y sin compromisos.</p>
							</div>
						</div>
						<!-- END policy -->
					</div>
					<!-- END col-4 -->
					<!-- BEGIN col-4 -->
					<div class="col-lg-4 col-md-4 mb-4 mb-md-0">
						<!-- BEGIN policy -->
						<div class="policy">
							<div class="policy-icon"><i class="fa fa-umbrella"></i></div>
							<div class="policy-info">
								<h4>Garantía de 1 año en equipos grandes</h4>
								<p>Todos nuestros productos tienen garantias. <br /></p>
							</div>
						</div>
						<!-- END policy -->
					</div>
					<!-- END col-4 -->
					<!-- BEGIN col-4 -->
					<div class="col-lg-4 col-md-4">
						<!-- BEGIN policy -->
						<div class="policy">
							<div class="policy-icon"><i class="fa fa-user-md"></i></div>
							<div class="policy-info">
								<h4>6 meses de garantias para accesorios</h4>
								<p>Todos nuestros productos tienen garantias.</p>
							</div>
						</div>
						<!-- END policy -->
					</div>
					<!-- END col-4 -->
				</div>
				<!-- END row -->
			</div>
			<!-- END container -->
		</div>
		<!-- END #policy -->
</asp:Content>
