<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="producto_admin.aspx.cs" Inherits="pagos_comodos.producto_admin" %>
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
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            
						<!-- BEGIN checkout -->
						<div class="checkout">
							<form action="checkout_payment.html" method="GET" name="form_shipping" class="form-horizontal">
								<!-- BEGIN checkout-header -->
								<div class="checkout-header">
									<!-- BEGIN row -->
									<div class="row">
										<!-- BEGIN col-3 -->
										<div class="col-lg-6">
											<div class="step active">
												<a href="#">
													<div class="number"></div>
													<div class="info">
														<div class="title">Administrador de productos</div>
														<div class="desc">Listado de productos actuales.</div>
													</div>
												</a>
											</div>
										</div>
										<!-- END col-3 -->
										
									</div>
									<!-- END row -->
								</div>
								<!-- END checkout-header -->
								<asp:Button ID="btnNuevo" runat="server" Text="Nuevo producto" OnClick="btnNuevo_Click" class="btn btn-gray" />
								<!-- BEGIN checkout-body -->
									<div class="checkout-body">
										<div class="table-responsive">
											<table class="table table-cart">
												<thead>
													<tr>
														<th>Imagen</th>
														<th>Nombre del producto</th>
														<th>Categoria</th>
														<th class="text-center">Precio Bs.</th>
														<th>Estado</th>
														<th>Opciones</th>
													</tr>
												</thead>
												<tbody>

													<asp:ObjectDataSource ID="odsProductos" runat="server" SelectMethod="producto_lista_admin" TypeName="pagos_comodos.Clases.Productos">
													</asp:ObjectDataSource>
														<asp:Repeater ID="Repeater1" DataSourceID="odsProductos" runat="server">
															<ItemTemplate>
																<tr>
																	<td class="cart-total text-center">
																		<asp:Image ID="Image1" ImageUrl='<%# Eval("url_imagen") %>' Height="50px" runat="server" />
																	</td>
																	<td class="cart-total">
																		<asp:Label ID="lblNombre" runat="server" Text='<%# Eval("nombre") %>'></asp:Label>
												
																	</td>
																	<td class="cart-total">
																		<asp:Label ID="lblCatergoria" runat="server" Text='<%# Eval("categoria") %>'></asp:Label>
												
																	</td>
																	<td class="cart-total text-center">
																		<asp:Label ID="lblPrecio" runat="server" Text='<%# Eval("precio") %>'></asp:Label>
												
																	</td>
																	<td class="cart-total">
																		<asp:Label ID="lblEstado" runat="server" Text='<%# Eval("desc_estado") %>'></asp:Label>
												
																	</td>
																	<td class="cart-total">
																		<asp:Button ID="btnEditar" runat="server" Text="Editar" CommandArgument='<%# Eval("id_producto") %>' OnClick="btnEditar_Click" class="btn btn-gray" />
																		<asp:Button ID="btnEliminar" runat="server" Text="Activar/Desactivar" CommandArgument='<%# Eval("id_producto") +"|"+ Eval("desc_estado")  %>' OnClick="btnEliminar_Click" class="btn btn-gray" />
																	</td>
																</tr>
															</ItemTemplate>
													 </asp:Repeater>
													
												</tbody>
											</table>
										</div>
									</div>
									<!-- END checkout-body -->
								<div class="checkout-footer d-flex">
									
								</div>
								<!-- END checkout-footer -->
							</form>
						</div>
						<!-- END checkout -->
				
        </asp:View>
		<asp:View ID="View2" runat="server">
	
				<!-- BEGIN checkout -->
				<div class="checkout">
					<form action="checkout_payment.html" method="GET" name="form_shipping" class="form-horizontal">
						<!-- BEGIN checkout-header -->
						<div class="checkout-header">
							<!-- BEGIN row -->
							<div class="row">
								<!-- BEGIN col-3 -->
										<div class="col-lg-6">
											<div class="step active">
												<a href="#">
													<div class="number">1</div>
													<div class="info">
														<div class="title">Datos inciales del producto</div>
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
								Nombre del producto <span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtNombre" class="form-control" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtNombre" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Precio en Bs. <span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtPrecio" class="form-control" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPrecio" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Categoria <span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:ObjectDataSource ID="odsCategorias" runat="server" SelectMethod="lista_categorias" TypeName="pagos_comodos.Clases.Categorias">
									</asp:ObjectDataSource>
									<asp:DropDownList ID="ddlCategoria" class="form-select dropdown-brand-list" DataSourceID="odsCategorias" DataTextField="nombre" DataValueField="id_categoria" OnDataBound="ddlCategoria_DataBound" runat="server"></asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" InitialValue="SELECCIONAR" ControlToValidate="ddlCategoria" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Imagen principal <span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:FileUpload ID="fuFoto" CssClass="form-control" runat="server" />
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Resumen de caracteristicas <span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtResumen" class="form-control" ValidationGroup="resumen" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="resumen" ControlToValidate="txtResumen" Font-Bold="True"></asp:RequiredFieldValidator>
									<asp:Button ID="btnPlus" runat="server" Text="Agregar" ValidationGroup="resumen" OnClick="btnPlus_Click" class="btn btn-blue" />
									<asp:ListBox ID="lbResumen" class="form-control" runat="server"></asp:ListBox>
								</div>
							</div>
							
							<hr />
						<!-- BEGIN checkout-footer -->
						<div class="checkout-footer align-content-center">
							<asp:Button ID="btnAtras" runat="server" CausesValidation="false" Text="ATRAS" OnClick="btnAtras_Click" class="btn btn-white" />
							<asp:Button ID="btnAdelante" runat="server" Text="GUARDAR" OnClick="btnAdelante_Click" class="btn btn-dark" />
						</div>
						<!-- END checkout-footer -->
					</form>
				</div>
				<!-- END checkout -->
		</asp:View>
    </asp:MultiView>
		</div>
		<!-- END container -->
		</div>
	<!-- END #checkout-info -->
</asp:Content>
