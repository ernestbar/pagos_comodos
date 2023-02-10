<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="pagos_comodos.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- BEGIN #checkout-info -->
		<div class="section-container" id="checkout-info">
			<!-- BEGIN container -->
			<div class="container">
				<asp:Label ID="lblAviso" runat="server" ForeColor="Blue" Text=""></asp:Label>
				<asp:MultiView ID="MultiView1" runat="server">
					<asp:View ID="View1" runat="server">
						<!-- BEGIN checkout -->
						<div class="checkout">
								<!-- BEGIN checkout-body -->
								<div class="checkout-body">
									
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Correo Electronico<span class="text-danger">*</span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmail" Font-Bold="True"></asp:RequiredFieldValidator>
											<%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="* Direccion de correo incorrecta" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>--%>
										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Contraseña: <span class="text-danger"></span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtContraseña" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Olvidate tu Contraseña? <span class="text-danger"></span>
										</label>
										<div class="col-md-4">
											<asp:LinkButton ID="lbtnOlvideContraseña" runat="server">Presiona si olvidaste tu contraseña</asp:LinkButton>
										</div>
									</div>
									
								</div>
								<!-- END checkout-body -->
								<!-- BEGIN checkout-footer -->
								<div class="checkout-footer d-flex">
									<%--<a href="checkout_cart.html" class="btn btn-white btn-theme me-auto">BACK</a>--%>
									<asp:Button ID="btnResgistrarse" class="btn btn-white btn-theme me-auto" runat="server" CausesValidation="false" OnClick="btnResgistrarse_Click" Text="Registrarse" />
									<asp:Button ID="btnIngresar" class="btn btn-dark btn-theme ms-10px" runat="server" OnClick="btnIngresar_Click" Text="Ingresar" />
								</div>
								<!-- END checkout-footer -->
						</div>
						<!-- END checkout -->
					</asp:View>
					<asp:View ID="View2" runat="server">
						 <script type="text/javascript">
								function RefreshCaptcha() {
									var img = document.getElementById("imgCaptcha");
								img.src = "captcha/Captcha.ashx?query=" + Math.random();
								}
                         </script>     
						<!-- BEGIN checkout -->
						<div class="checkout">
								<!-- BEGIN checkout-body -->
								<div class="checkout-body">
									
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Correo Electronico<span class="text-danger">*</span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtEmailR" class="form-control" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtEmailR" Font-Bold="True"></asp:RequiredFieldValidator>
											<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailR" Display="Dynamic" ErrorMessage="* Direccion de correo incorrecta" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Contraseña <span class="text-danger"></span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtClave" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtClave" Font-Bold="True"></asp:RequiredFieldValidator>
										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Nro. de documento <span class="text-danger"></span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtCi" class="form-control" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCi" Font-Bold="True"></asp:RequiredFieldValidator>
										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Paterno <span class="text-danger"></span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtPaterno" class="form-control" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPaterno" Font-Bold="True"></asp:RequiredFieldValidator>
										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Materno <span class="text-danger"></span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtMaterno" class="form-control" runat="server"></asp:TextBox>
										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Nombres <span class="text-danger"></span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtNombres" class="form-control" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtNombres" Font-Bold="True"></asp:RequiredFieldValidator>
										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Celular <span class="text-danger"></span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtCelular" class="form-control" runat="server"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCelular" Font-Bold="True"></asp:RequiredFieldValidator>
										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Telefono <span class="text-danger"></span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtTelefono" class="form-control" runat="server"></asp:TextBox>
										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">
										Direccion <span class="text-danger"></span>
										</label>
										<div class="col-md-4">
											<asp:TextBox ID="txtDireccion" class="form-control" runat="server"></asp:TextBox>
										</div>
									</div>
									<div class="mb-2 row">
										<label class="col-form-label col-md-4 text-lg-end">Captcha de seguridad
										<asp:Image ID="imgCaptcha" ImageUrl="~/captcha/Captcha.ashx" runat="server" />
										<i class="fa fa-refresh" tabindex="1" onclick="javascript:RefreshCaptcha();return false;" style="color:blue"></i>
										</label>
										<div class="col-md-4">
											 <label>Escriba el codigo de seguridad</label>
												<asp:TextBox runat="server" ID="txtVerificationCode" CssClass="form-control"  Width="50%"></asp:TextBox> 
											<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtVerificationCode" Font-Bold="True"></asp:RequiredFieldValidator>
											<asp:Label runat="server" ID="lblCaptchaMessage"></asp:Label> 
										</div>
									</div>
								</div>
								<!-- END checkout-body -->
						
                              
								<!-- BEGIN checkout-footer -->
								<div class="checkout-footer d-flex">
									<%--<a href="checkout_cart.html" class="btn btn-white btn-theme me-auto">BACK</a>--%>
									<asp:Button ID="btnCancelar" class="btn btn-white btn-theme me-auto" runat="server" CausesValidation="false" OnClick="btnCancelar_Click" Text="Cancelar" />
									<asp:Button ID="btnGuardar" class="btn btn-dark btn-theme ms-10px" runat="server" OnClick="btnGuardar_Click" Text="Guardar" />
								</div>
								<!-- END checkout-footer -->
						</div>
						<!-- END checkout -->
						
					</asp:View>
				</asp:MultiView>
				
			</div>
			<!-- END container -->
		</div>
		<!-- END #checkout-info -->
</asp:Content>
