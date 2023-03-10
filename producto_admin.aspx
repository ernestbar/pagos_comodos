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
														<th>Opciones producto</th>
														<th>Opciones extras</th>
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
																		<asp:Button ID="btnEditar" runat="server" Text="Editar" CommandArgument='<%# Eval("id_producto") %>' OnClick="btnEditar_Click" class="btn btn-gray btn-sm" />
																		<asp:Button ID="btnEliminar" runat="server" Text="Activar/Desactivar" CommandArgument='<%# Eval("id_producto") +"|"+ Eval("desc_estado")  %>' OnClick="btnEliminar_Click" class="btn btn-gray btn-sm" />
																	</td>
																	<td class="cart-total">
																		<asp:Button ID="btnResumen" runat="server" Text="Resumen" CommandArgument='<%# Eval("id_producto") %>' OnClick="btnResumen_Click" class="btn btn-gray btn-sm" />
																		<asp:Button ID="btnDescripcion" runat="server" Text="Descripcion" CommandArgument='<%# Eval("id_producto") %>' OnClick="btnDescripcion_Click" class="btn btn-gray btn-sm" />
																		<asp:Button ID="btnInformacion" runat="server" Text="Informacion Adicional" CommandArgument='<%# Eval("id_producto") %>' OnClick="btnInformacion_Click" class="btn btn-gray btn-sm" />
																		<asp:Button ID="btnEval" runat="server" Text="Evaluaciones y comentarios" CommandArgument='<%# Eval("id_producto") %>' OnClick="btnEval_Click" class="btn btn-gray btn-sm" />
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
										<div class="col-lg-3">
											<div class="step active">
												<a href="#">
													<div class="number">1</div>
													<div class="info">
														<div class="title">Datos iniciales del producto</div>
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
		<asp:View ID="View3" runat="server">
			<!-- BEGIN checkout -->
				<div class="checkout">
					<form action="checkout_payment.html" method="GET" name="form_shipping" class="form-horizontal">
						<!-- BEGIN checkout-header -->
						<div class="checkout-header">
							<!-- BEGIN row -->
							<div class="row">
								<!-- BEGIN col-3 -->
										<div class="col-lg-6">
											<div class="step">
												<a href="#">
													<div class="number">1</div>
													<div class="info">
														<div class="title">Datos iniciales del producto</div>
														<div class="desc"></div>
													</div>
												</a>
											</div>
										</div>
										<!-- END col-3 -->
								<!-- BEGIN col-3 -->
										<div class="col-lg-6">
											<div class="step active">
												<a href="#">
													<div class="number">2</div>
													<div class="info">
														<div class="title">Checklist Resumen del producto</div>
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
								Resumen de caracteristicas <span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtResumen" class="form-control" ValidationGroup="resumen" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="resumen" ControlToValidate="txtResumen" Font-Bold="True"></asp:RequiredFieldValidator>
									<asp:Button ID="btnPlus" runat="server" Text="Agregar" ValidationGroup="resumen" OnClick="btnPlus_Click" class="btn btn-blue" />
								</div>
						</div>
							
							<hr />
						<asp:Label ID="lblIdCaracteristicas" runat="server" Visible="false" Text=""></asp:Label>
						<!-- BEGIN checkout-body -->
									<div class="checkout-body">
										<div class="table-responsive">
											<table class="table table-cart">
												<thead>
													<tr>
														<th>Descripcion</th>
														<th>Estado</th>
														<th>Opciones</th>
													</tr>
												</thead>
												<tbody>
													
													<asp:ObjectDataSource ID="odsResumen" runat="server" SelectMethod="lista_caracteristica_producto" TypeName="pagos_comodos.Clases.Caracteristicas">
														<SelectParameters>
															<asp:ControlParameter ControlID="lblIdProducto" Name="id_producto_" />
															<asp:Parameter Name="id_tipocaracteristicas_" DefaultValue="5" />
															<asp:ControlParameter ControlID="lblIdUsuario" Name="id_usuario_" />
														</SelectParameters>
													</asp:ObjectDataSource>
														<asp:Repeater ID="Repeater2" DataSourceID="odsResumen" runat="server">
															<ItemTemplate>
																<tr>
																	<td class="cart-total">
																		<asp:Label ID="Label1" runat="server" Text='<%# Eval("descripcion") %>'></asp:Label>
												
																	</td>
																	<td class="cart-total">
																		<asp:Label ID="lblEstado" runat="server" Text='<%# Eval("activo") %>'></asp:Label>
												
																	</td>
																	<td class="cart-total">
																		<asp:Button ID="btnEditarRes" runat="server" Text="Editar" CommandArgument='<%# Eval("id_caracteristicas") %>' OnClick="btnEditarRes_Click" class="btn btn-gray btn-sm" />
																		<asp:Button ID="btnEliminarRes" runat="server" Text="Activar/Desactivar" CommandArgument='<%# Eval("id_caracteristicas") +"|"+ Eval("activo")  %>' OnClick="btnEliminarRes_Click" class="btn btn-gray btn-sm" />
																	</td>
																</tr>
															</ItemTemplate>
													 </asp:Repeater>
													
												</tbody>
											</table>
										</div>
									</div>
									<!-- END checkout-body -->
						<!-- BEGIN checkout-footer -->
						<div class="checkout-footer align-content-center">
							<asp:Button ID="Button2" runat="server" CausesValidation="false" Text="ATRAS" OnClick="btnAtras_Click" class="btn btn-white" />
						</div>
						<!-- END checkout-footer -->
					</form>
				</div>
				<!-- END checkout -->
		</asp:View>
		<asp:View ID="View4" runat="server">
			<!-- BEGIN checkout -->
				<div class="checkout">
					<form action="checkout_payment.html" method="GET" name="form_shipping" class="form-horizontal">
						<!-- BEGIN checkout-header -->
						<div class="checkout-header">
							<!-- BEGIN row -->
							<div class="row">
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step">
												<a href="#">
													<div class="number">1</div>
													<div class="info">
														<div class="title">Datos iniciales del producto</div>
														<div class="desc"></div>
													</div>
												</a>
											</div>
										</div>
										<!-- END col-3 -->
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step">
												<a href="#">
													<div class="number">2</div>
													<div class="info">
														<div class="title">Checklist Resumen del producto</div>
														<div class="desc"></div>
													</div>
												</a>
											</div>
										</div>
										<!-- END col-3 -->
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step active">
												<a href="#">
													<div class="number">3</div>
													<div class="info">
														<div class="title">Descripcion del producto</div>
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
								Titulo<span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtTituloDesc" class="form-control" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="gDesc" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtTituloDesc" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Descripcion<span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtDescripcionDesc" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="gDesc" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDescripcionDesc" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Imagen<span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:FileUpload ID="fuImagenDesc" CssClass="form-control" runat="server" />
									<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="gDesc" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="fuImagenDesc" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>

						<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								<span class="text-danger"></span>
								</label>
								<div class="col-md-4">
									<asp:Button ID="btnAgragarDesc" runat="server" Text="Agregar" ValidationGroup="resumen" OnClick="btnAgragarDesc_Click" class="btn btn-blue" />
									<asp:Button ID="btnLimpiarDesc" runat="server" Text="Limpiar" ValidationGroup="resumen" OnClick="btnLimpiarDesc_Click" class="btn btn-blue" />
								</div>
						</div>
							
							<hr />
						<asp:Label ID="Label2" runat="server" Visible="false" Text=""></asp:Label>
						<!-- BEGIN checkout-body -->
									<div class="checkout-body">
										<div class="table-responsive">
											<table class="table table-cart">
												<thead>
													<tr>
														<th>Titulo</th>
														<th>Descripcion</th>
														<th>Imagen</th>
														<th>Estado</th>
														<th>Opciones</th>
													</tr>
												</thead>
												<tbody>
													
													<asp:ObjectDataSource ID="odsDescripcion" runat="server" SelectMethod="lista_caracteristica_producto" TypeName="pagos_comodos.Clases.Caracteristicas">
														<SelectParameters>
															<asp:ControlParameter ControlID="lblIdProducto" Name="id_producto_" />
															<asp:Parameter Name="id_tipocaracteristicas_" DefaultValue="1" />
															<asp:ControlParameter ControlID="lblIdUsuario" Name="id_usuario_" />
														</SelectParameters>
													</asp:ObjectDataSource>
														<asp:Repeater ID="Repeater3" DataSourceID="odsDescripcion" runat="server">
															<ItemTemplate>
																<tr>
																	<td class="cart-total"><asp:Label ID="Label1" runat="server" Text='<%# Eval("titulo") %>'></asp:Label></td>
																	<td class="cart-total"><asp:Label ID="Label3" runat="server" Text='<%# Eval("descripcion") %>'></asp:Label></td>
																	<td class="cart-total"><asp:Image ID="Image1" ImageUrl='<%# Eval("img1") %>' Height="50px" runat="server" /></td>
																	<td class="cart-total"><asp:Label ID="lblEstado" runat="server" Text='<%# Eval("activo") %>'></asp:Label></td>
																	<td class="cart-total">
																		<asp:Button ID="btnEditarDesc" runat="server" Text="Editar" CommandArgument='<%# Eval("id_caracteristicas") %>'  OnClick="btnEditarDesc_Click" class="btn btn-gray btn-sm" />
																		<asp:Button ID="btnEliminarDesc" runat="server" Text="Activar/Desactivar" CommandArgument='<%# Eval("id_caracteristicas") +"|"+ Eval("activo")  %>' OnClick="btnEliminarDesc_Click" class="btn btn-gray btn-sm" />
																	</td>
																</tr>
															</ItemTemplate>
													 </asp:Repeater>
													
												</tbody>
											</table>
										</div>
									</div>
									<!-- END checkout-body -->
						<!-- BEGIN checkout-footer -->
						<div class="checkout-footer align-content-center">
							<asp:Button ID="Button3" runat="server" CausesValidation="false" Text="ATRAS" OnClick="btnAtras_Click" class="btn btn-white" />
						</div>
						<!-- END checkout-footer -->
					</form>
				</div>
				<!-- END checkout -->
		</asp:View>
		<asp:View ID="View5" runat="server">
			<!-- BEGIN checkout -->
				<div class="checkout">
					<form action="checkout_payment.html" method="GET" name="form_shipping" class="form-horizontal">
						<!-- BEGIN checkout-header -->
						<div class="checkout-header">
							<!-- BEGIN row -->
							<div class="row">
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step">
												<a href="#">
													<div class="number">1</div>
													<div class="info">
														<div class="title">Datos iniciales del producto</div>
														<div class="desc"></div>
													</div>
												</a>
											</div>
										</div>
										<!-- END col-3 -->
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step">
												<a href="#">
													<div class="number">2</div>
													<div class="info">
														<div class="title">Checklist Resumen del producto</div>
														<div class="desc"></div>
													</div>
												</a>
											</div>
										</div>
										<!-- END col-3 -->
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step">
												<a href="#">
													<div class="number">3</div>
													<div class="info">
														<div class="title">Descripcion del producto</div>
														<div class="desc"></div>
													</div>
												</a>
											</div>
										</div>
										<!-- END col-3 -->
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step active">
												<a href="#">
													<div class="number">4</div>
													<div class="info">
														<div class="title">Informacion adicional</div>
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
								Titulo<span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtTituloInfoAdd" class="form-control" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="gDesc" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtTituloInfoAdd" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Descripcion<span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtDescInfoAdd" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="gDesc" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDescInfoAdd" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>

						<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								<span class="text-danger"></span>
								</label>
								<div class="col-md-4">
									<asp:Button ID="btnAgregarInfoAdd" runat="server" Text="Agregar" ValidationGroup="resumen" OnClick="btnAgregarInfoAdd_Click" class="btn btn-blue" />
									<asp:Button ID="btnLimpiarInfoAdd" runat="server" Text="Limpiar" ValidationGroup="resumen" OnClick="btnLimpiarInfoAdd_Click" class="btn btn-blue" />
								</div>
						</div>
							
							<hr />
						<asp:Label ID="Label4" runat="server" Visible="false" Text=""></asp:Label>
						<!-- BEGIN checkout-body -->
									<div class="checkout-body">
										<div class="table-responsive">
											<table class="table table-cart">
												<thead>
													<tr>
														<th>Titulo</th>
														<th>Descripcion</th>
														<%--<th>Imagen</th>--%>
														<th>Estado</th>
														<th>Opciones</th>
													</tr>
												</thead>
												<tbody>
													
													<asp:ObjectDataSource ID="odsInfoAdicional" runat="server" SelectMethod="lista_caracteristica_producto" TypeName="pagos_comodos.Clases.Caracteristicas">
														<SelectParameters>
															<asp:ControlParameter ControlID="lblIdProducto" Name="id_producto_" />
															<asp:Parameter Name="id_tipocaracteristicas_" DefaultValue="3" />
															<asp:ControlParameter ControlID="lblIdUsuario" Name="id_usuario_" />
														</SelectParameters>
													</asp:ObjectDataSource>
														<asp:Repeater ID="Repeater4" DataSourceID="odsInfoAdicional" runat="server">
															<ItemTemplate>
																<tr>
																	<td class="cart-total"><asp:Label ID="Label1" runat="server" Text='<%# Eval("titulo") %>'></asp:Label></td>
																	<td class="cart-total"><asp:Label ID="Label3" runat="server" Text='<%# Eval("descripcion") %>'></asp:Label></td>
																	<%--<td class="cart-total"><asp:Image ID="Image1" ImageUrl='<%# Eval("img1") %>' Height="50px" runat="server" /></td>--%>
																	<td class="cart-total"><asp:Label ID="lblEstado" runat="server" Text='<%# Eval("activo") %>'></asp:Label></td>
																	<td class="cart-total">
																		<asp:Button ID="btnEditarInfoAdd" runat="server" Text="Editar" CommandArgument='<%# Eval("id_caracteristicas") %>'  OnClick="btnEditarInfoAdd_Click" class="btn btn-gray btn-sm" />
																		<asp:Button ID="btnEliminaInfoAdd" runat="server" Text="Activar/Desactivar" CommandArgument='<%# Eval("id_caracteristicas") +"|"+ Eval("activo")  %>' OnClick="btnEliminaInfoAdd_Click" class="btn btn-gray btn-sm" />
																	</td>
																</tr>
															</ItemTemplate>
													 </asp:Repeater>
													
												</tbody>
											</table>
										</div>
									</div>
									<!-- END checkout-body -->
						<!-- BEGIN checkout-footer -->
						<div class="checkout-footer align-content-center">
							<asp:Button ID="Button5" runat="server" CausesValidation="false" Text="ATRAS" OnClick="btnAtras_Click" class="btn btn-white" />
						</div>
						<!-- END checkout-footer -->
					</form>
				</div>
				<!-- END checkout -->
		</asp:View>
		<asp:View ID="View6" runat="server">
			<!-- BEGIN checkout -->
				<div class="checkout">
					<form action="checkout_payment.html" method="GET" name="form_shipping" class="form-horizontal">
						<!-- BEGIN checkout-header -->
						<div class="checkout-header">
							<!-- BEGIN row -->
							<div class="row">
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step">
												<a href="#">
													<div class="number">1</div>
													<div class="info">
														<div class="title">Datos iniciales del producto</div>
														<div class="desc"></div>
													</div>
												</a>
											</div>
										</div>
										<!-- END col-3 -->
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step">
												<a href="#">
													<div class="number">2</div>
													<div class="info">
														<div class="title">Checklist Resumen del producto</div>
														<div class="desc"></div>
													</div>
												</a>
											</div>
										</div>
										<!-- END col-3 -->
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step">
												<a href="#">
													<div class="number">3</div>
													<div class="info">
														<div class="title">Descripcion del producto</div>
														<div class="desc"></div>
													</div>
												</a>
											</div>
										</div>
										<!-- END col-3 -->
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step">
												<a href="#">
													<div class="number">4</div>
													<div class="info">
														<div class="title">Informacion adicional</div>
														<div class="desc"></div>
													</div>
												</a>
											</div>
										</div>
										<!-- END col-3 -->
								<!-- BEGIN col-3 -->
										<div class="col-lg-3">
											<div class="step active">
												<a href="#">
													<div class="number">5</div>
													<div class="info">
														<div class="title">Comentarios</div>
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
								Autor<span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtTituloRating" class="form-control" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="rDesc" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtTituloRating" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>
							<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								Descripcion<span class="text-danger">*</span>
								</label>
								<div class="col-md-4">
									<asp:TextBox ID="txtDescRating" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="rDesc" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtDescRating" Font-Bold="True"></asp:RequiredFieldValidator>
								</div>
							</div>

						<div class="mb-2 row">
								<label class="col-form-label col-md-4 text-lg-end">
								<span class="text-danger"></span>
								</label>
								<div class="col-md-4">
									<asp:Button ID="btnAgrgarRating" runat="server" Text="Agregar" ValidationGroup="rDesc" OnClick="btnAgrgarRating_Click" class="btn btn-blue" />
									<asp:Button ID="ButtbtnLimpiarRatingon4" runat="server" Text="Limpiar"  OnClick="ButtbtnLimpiarRatingon4_Click" class="btn btn-blue" />
								</div>
						</div>
							
							<hr />
						<asp:Label ID="Label5" runat="server" Visible="false" Text=""></asp:Label>
						<!-- BEGIN checkout-body -->
									<div class="checkout-body">
										<div class="table-responsive">
											<table class="table table-cart">
												<thead>
													<tr>
														<th>Autor</th>
														<th>Descripcion</th>
														<%--<th>Imagen</th>--%>
														<th>Estado</th>
														<th>Opciones</th>
													</tr>
												</thead>
												<tbody>
													
													<asp:ObjectDataSource ID="odsRating" runat="server" SelectMethod="lista_caracteristica_producto" TypeName="pagos_comodos.Clases.Caracteristicas">
														<SelectParameters>
															<asp:ControlParameter ControlID="lblIdProducto" Name="id_producto_" />
															<asp:Parameter Name="id_tipocaracteristicas_" DefaultValue="4" />
															<asp:ControlParameter ControlID="lblIdUsuario" Name="id_usuario_" />
														</SelectParameters>
													</asp:ObjectDataSource>
														<asp:Repeater ID="Repeater5" DataSourceID="odsRating" runat="server">
															<ItemTemplate>
																<tr>
																	<td class="cart-total"><asp:Label ID="Label1" runat="server" Text='<%# Eval("titulo") %>'></asp:Label></td>
																	<td class="cart-total"><asp:Label ID="Label3" runat="server" Text='<%# Eval("descripcion") %>'></asp:Label></td>
																	<%--<td class="cart-total"><asp:Image ID="Image1" ImageUrl='<%# Eval("img1") %>' Height="50px" runat="server" /></td>--%>
																	<td class="cart-total"><asp:Label ID="lblEstado" runat="server" Text='<%# Eval("activo") %>'></asp:Label></td>
																	<td class="cart-total">
																		<asp:Button ID="btnEditarRating" runat="server" Text="Editar" CommandArgument='<%# Eval("id_caracteristicas") %>'  OnClick="btnEditarRating_Click" class="btn btn-gray btn-sm" />
																		<asp:Button ID="btnEliminarRating" runat="server" Text="Activar/Desactivar" CommandArgument='<%# Eval("id_caracteristicas") +"|"+ Eval("activo")  %>' OnClick="btnEliminarRating_Click" class="btn btn-gray btn-sm" />
																	</td>
																</tr>
															</ItemTemplate>
													 </asp:Repeater>
													
												</tbody>
											</table>
										</div>
									</div>
									<!-- END checkout-body -->
						<!-- BEGIN checkout-footer -->
						<div class="checkout-footer align-content-center">
							<asp:Button ID="Button6" runat="server" CausesValidation="false" Text="ATRAS" OnClick="btnAtras_Click" class="btn btn-white" />
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
