<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="comprar_dos.aspx.cs" Inherits="pagos_comodos.comprar_dos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Label ID="lblIdUsuario" runat="server" Text="" Visible="false"></asp:Label>
	<asp:Label ID="lblIdProducto" runat="server" Text="" Visible="false"></asp:Label>
	<asp:Label ID="lblIdCategoria" runat="server" Text="" Visible="false"></asp:Label>
    <!-- BEGIN #checkout-info -->
		<div class="section-container" id="checkout-info">
			<!-- BEGIN container -->
			<div class="container">
				<asp:Label ID="lblAviso" runat="server" ForeColor="Blue" Text=""></asp:Label>
				<!-- BEGIN checkout -->
				<div class="checkout">
					<form action="checkout_payment.html" method="GET" name="form_shipping" class="form-horizontal">
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
									<div class="step active">
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
									<div class="step">
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
					
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Nombres <span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtNombres" class="form-control" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtNombres" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Apellidos <span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtApellidos" class="form-control" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtApellidos" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Celular <span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtCelular" class="form-control" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCelular" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Direccion Domicilio <span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtDomicilio" class="form-control" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDomicilio" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Nombre de empresa(opcional)<span class="text-danger"></span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtEmpresa" class="form-control" runat="server"></asp:TextBox>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Direccion Trabajo (opcional)<span class="text-danger"></span>
								</label>
								<div class="col-md-4">
										<asp:TextBox ID="txtDireccionTrabajo" class="form-control" runat="server"></asp:TextBox>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Telefono oficina (opcional)<span class="text-danger"></span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtTelefonoOficina" class="form-control" runat="server"></asp:TextBox>
								</div>
							</div>
							<hr />
						<!-- BEGIN checkout-footer -->
						<div class="checkout-footer d-flex">
							<asp:Button ID="btnAtras" runat="server" CausesValidation="false" Text="ATRAS" OnClick="btnAtras_Click" class="btn btn-white btn-lg me-auto btn-theme w-250px" />
							<asp:Button ID="btnAdelante" runat="server" Text="SOLICITAR" OnClick="btnAdelante_Click" class="btn btn-dark btn-lg btn-theme w-250px" />
						</div>
						<!-- END checkout-footer -->
					</form>
				</div>
				<!-- END checkout -->
			</div>
			<!-- END container -->
		</div>
		<!-- END #checkout-info -->
		
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
