<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="contactanos.aspx.cs" Inherits="pagos_comodos.contactanos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- BEGIN #checkout-info -->
		<div class="section-container" id="checkout-info">
			<!-- BEGIN container -->
			<div class="container">
				<asp:MultiView ID="MultiView1" runat="server">
					<asp:View ID="View1" runat="server">
						<!-- BEGIN checkout -->
						<div class="checkout">
							<form action="checkout_payment.html" method="GET" name="form_shipping" class="form-horizontal">
								<!-- BEGIN checkout-body -->
								<div class="checkout-body">
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Nombre completo <span class="text-danger">*</span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtNombre" class="form-control" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtNombre" Font-Bold="True"></asp:RequiredFieldValidator>
										</div>
									</div>
									
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Telefono Celular <span class="text-danger">*</span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtCelular" class="form-control" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCelular" Font-Bold="True"></asp:RequiredFieldValidator>

										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Correo Electronico<span class="text-danger">*</span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmail" Font-Bold="True"></asp:RequiredFieldValidator>
											<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="* Direccion de correo incorrecta" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
										</div>
									</div>
									<%--<hr />
									<div class="mb-5px"><b>Shipping Policy</b></div>
									<ul class="checkout-info-list">
										<li>Signature may be required for delivery</li>
										<li>We do not ship to P.O. boxes</li>
										<li>Delivery estimates below include item preparation and shipping time</li>
										<li>We do not ship directly to APO/FPO addresses.</li>
									</ul>--%>
								</div>
								<!-- END checkout-body -->
								<!-- BEGIN checkout-footer -->
								<div class="checkout-footer d-flex">
									<%--<a href="checkout_cart.html" class="btn btn-white btn-theme me-auto">BACK</a>--%>
									<asp:Button ID="btnEnviar" class="btn btn-dark btn-theme ms-10px" runat="server" OnClick="btnEnviar_Click" Text="Enviar" />
								</div>
								<!-- END checkout-footer -->
							</form>
						</div>
						<!-- END checkout -->
					</asp:View>
					<asp:View ID="View2" runat="server">
						<div class="checkout">
						<!-- BEGIN checkout-message -->
							<div class="checkout-message">
								<h1>Gracias! <small>Su contacto fue registrado en breve nos comunicaremos con usted.</small></h1>
								<%--<div class="table-responsive">
									<table class="table table-payment-summary">
										<tbody>
											<tr>
												<td class="field">Transaction Status</td>
												<td class="value">Success</td>
											</tr>
											<tr>
												<td class="field">Transaction Reference No.</td>
												<td class="value">REF000001</td>
											</tr>
											<tr>
												<td class="field">Bank Authorised Code</td>
												<td class="value">AUTH000001</td>
											</tr>
											<tr>
												<td class="field">Transaction Date and Time</td>
												<td class="value">05 APR 2021 07:30PM</td>
											</tr>
											<tr>
												<td class="field">Orders</td>
												<td class="value product-summary">
													<div class="product-summary-img h-150px w-100px d-flex align-items-center justify-content-center">
														<img src="../assets/img/product/product-iphone-12.png" class="mw-100 mh-100" alt="" />
													</div>
													<div class="product-summary-info">
														<div class="title">iPhone 12 Pro Max 128GB (Blue)</div>
														<div class="desc">Delivers Tue 26/04/2021 - Free</div>
													</div>
												</td>
											</tr>
											<tr>
												<td class="field">Payment Amount (RM)</td>
												<td class="value">$999.00</td>
											</tr>
										</tbody>
									</table>
								</div>
								<p class="text-silver-darker text-center mb-0">Should you require any assistance, you can get in touch with Support Team at (123) 456-7890</p>--%>
							</div>
							<!-- END checkout-message -->
							</div>
					</asp:View>
				</asp:MultiView>
				
			</div>
			<!-- END container -->
		</div>
		<!-- END #checkout-info -->
</asp:Content>
