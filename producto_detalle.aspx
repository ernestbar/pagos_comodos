<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="producto_detalle.aspx.cs" Inherits="pagos_comodos.producto_detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Label ID="lblIdUsuario" runat="server" Text="" Visible="false"></asp:Label>
    <!-- BEGIN #product -->
		<div id="product" class="section-container pt-20px">
			<!-- BEGIN container -->
			<div class="container">
				<asp:Label ID="lblAviso" runat="server" ForeColor="Blue" Text=""></asp:Label>
				<!-- BEGIN breadcrumb -->
				<%--<ul class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item"><a href="#">Mobile Phone</a></li>
					<li class="breadcrumb-item"><a href="#">Apple</a></li>
					<li class="breadcrumb-item active">iPhone 6S Plus</li>
				</ul>--%>
				<!-- END breadcrumb -->
				<!-- BEGIN product -->
				<div class="product">
					<!-- BEGIN product-detail -->
					<div class="product-detail">
						<!-- BEGIN product-image -->
						<div class="product-image">
							<!-- BEGIN product-thumbnail -->
							<div class="product-thumbnail">
								<ul class="product-thumbnail-list">
									<asp:Label ID="lblIdProducto" runat="server" Visible="false" Text="Label"></asp:Label>
									<asp:ObjectDataSource ID="odsCaracteristicasImg" runat="server" SelectMethod="lista_caracteristica_producto" TypeName="pagos_comodos.Clases.Caracteristicas">
										<SelectParameters>
											<asp:ControlParameter ControlID="lblIdProducto" Name="id_producto_" Type="String" />
											<asp:Parameter Name="id_tipocaracteristicas_" DefaultValue="2"  />
											<asp:ControlParameter ControlID="lblIdUsuario" Name="id_usuario_" Type="String" />
										</SelectParameters>
									</asp:ObjectDataSource>
									<asp:Repeater ID="RepeaterImg" DataSourceID="odsCaracteristicasImg" runat="server">
                                        <ItemTemplate>
											<li><a href="#" data-click="show-main-image" data-url="<%# Eval("img1").ToString().Replace("~","") %>">
												<asp:Image ID="Image1" ImageUrl='<%# Eval("img1") %>' runat="server" /> </a></li>
                                        </ItemTemplate>
									</asp:Repeater>
								</ul>
							</div>
							<!-- END product-thumbnail -->
							<!-- BEGIN product-main-image -->
							<div class="product-main-image" data-id="main-image">
								<%--<asp:Image ID="Image1" ImageUrl='<%# Eval("img1") %>' runat="server" />--%>
								<img src='@("/Imagenes/caracteristicas/" + lblIdProducto.Text + "/img/1.jpg")'  alt="" />
							</div>
							<!-- END product-main-image -->
						</div>
						<!-- END product-image -->
						<!-- BEGIN product-info -->
						<div class="product-info">
							<!-- BEGIN product-info-header -->
							<div class="product-info-header">
								<asp:Repeater ID="RepeaterTitulo" runat="server">
                                        <ItemTemplate>
											<h1 class="product-title"><span class="badge bg-primary"></span> <%# Eval("[3]") %></h1>
                                        </ItemTemplate>
									</asp:Repeater>
								
								<%--<ul class="product-category">
									<li><a href="#">iPhone</a></li>
									<li>/</li>
									<li><a href="#">mobile phone</a></li>
									<li>/</li>
									<li><a href="#">electronics</a></li>
									<li>/</li>
									<li><a href="#">lifestyle</a></li>
								</ul>--%>
							</div>
							<!-- END product-info-header -->
							<!-- BEGIN product-warranty -->
						<%--	<div class="product-warranty">
								<div class="pull-right">Availability: In stock</div>
								<div><b>1 Year</b> Local Manufacturer Warranty</div>
							</div>--%>
							<!-- END product-warranty -->
							<!-- BEGIN product-info-list -->
                            <ul class="product-info-list">
                                <asp:Repeater ID="RepeaterCheklist" runat="server">
                                    <ItemTemplate>
                                        <li><i class="fa fa-circle"></i><%# Eval("[3]") %></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
							<!-- END product-info-list -->
							<!-- BEGIN product-social -->
							<div class="product-social">
								<ul>
									<li><a href="javascript:;" class="facebook" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-title="Facebook" data-bs-placement="top"><i class="fab fa-facebook-f"></i></a></li>
									<li><a href="javascript:;" class="twitter" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-title="Twitter" data-bs-placement="top"><i class="fab fa-twitter"></i></a></li>
									<li><a href="javascript:;" class="google-plus" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-title="Google Plus" data-bs-placement="top"><i class="fab fa-google-plus-g"></i></a></li>
									<li><a href="javascript:;" class="whatsapp" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-title="Whatsapp" data-bs-placement="top"><i class="fab fa-whatsapp"></i></a></li>
									<li><a href="javascript:;" class="tumblr" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-title="Tumblr" data-bs-placement="top"><i class="fab fa-tumblr"></i></a></li>
								</ul>
							</div>
							<!-- END product-social -->
							<!-- BEGIN product-purchase-container -->
							<asp:Repeater ID="RepeaterPrecio" runat="server">
                                    <ItemTemplate>
										<div class="product-purchase-container">
											<%--<div class="product-discount">
												<span class="discount">Precio</span>
											</div>--%>
											<div class="product-price">
												<div class="price">Precio en Bs.: <%# Eval("[3]") %></div>
											</div>
											<asp:Button ID="btnComprar" class="btn btn-dark btn-theme btn-lg w-200px" OnClick="btnComprar_Click" runat="server" Text="COMPRAR" />
										</div>
                                    </ItemTemplate>
                                </asp:Repeater>
							
							<!-- END product-purchase-container -->
						</div>
						<!-- END product-info -->
					</div>
					<!-- END product-detail -->
					<!-- BEGIN product-tab -->
					<div class="product-tab">
						<!-- BEGIN #product-tab -->
						<ul id="product-tab" class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active" href="#product-desc" data-bs-toggle="tab">Descripción del Producto</a></li>
							<li class="nav-item"><a class="nav-link" href="#product-info" data-bs-toggle="tab">Información Adicional</a></li>
							<li class="nav-item"><a class="nav-link" href="#product-reviews" data-bs-toggle="tab">Evaluaciones y comentarios</a></li>
						</ul>
						<!-- END #product-tab -->
						<!-- BEGIN #product-tab-content -->
						<div id="product-tab-content" class="tab-content">
							<!-- BEGIN #product-desc -->
							<div class="tab-pane fade active show" id="product-desc">
								<asp:ObjectDataSource ID="odsCaracteristicasCar" runat="server" SelectMethod="lista_caracteristica_producto" TypeName="pagos_comodos.Clases.Caracteristicas">
										<SelectParameters>
											<asp:ControlParameter ControlID="lblIdProducto" Name="id_producto_" Type="String" />
											<asp:Parameter Name="id_tipocaracteristicas_" DefaultValue="1"  />
											<asp:ControlParameter ControlID="lblIdUsuario" Name="id_usuario_" Type="String" />
										</SelectParameters>
									</asp:ObjectDataSource>
									<asp:Repeater ID="Repeater1" DataSourceID="odsCaracteristicasCar" runat="server">
                                        <ItemTemplate>
											<!-- BEGIN product-desc -->
											<div class="product-desc">
												<div class="image">
													<img src="<%# Eval("img1").ToString().Replace("~","") %>" alt="" />
												</div>
												<div class="desc">
													<h4><%# Eval("titulo") %></h4>
													<p>
														<%# Eval("descripcion") %>
													</p>
												</div>
											</div>
											<!-- END product-desc -->
                                        </ItemTemplate>
									</asp:Repeater>
							</div>
							<!-- END #product-desc -->
							<!-- BEGIN #product-info -->
							<div class="tab-pane fade" id="product-info">
								<!-- BEGIN table-responsive -->
								<div class="table-responsive">
									<!-- BEGIN table-product -->
									<table class="table table-product table-striped">
										<thead>
											<tr>
												<th>Atributos</th>
												<th>Descripcion</th>
											</tr>
										</thead>
										<tbody>
											<asp:ObjectDataSource ID="odsCaracteristicaAdi" runat="server" SelectMethod="lista_caracteristica_producto" TypeName="pagos_comodos.Clases.Caracteristicas">
												<SelectParameters>
													<asp:ControlParameter ControlID="lblIdProducto" Name="id_producto_" Type="String" />
													<asp:Parameter Name="id_tipocaracteristicas_" DefaultValue="3"  />
													<asp:ControlParameter ControlID="lblIdUsuario" Name="id_usuario_" Type="String" />
												</SelectParameters>
											</asp:ObjectDataSource>
											<asp:Repeater ID="Repeater2" DataSourceID="odsCaracteristicaAdi" runat="server">
												<ItemTemplate>
													<tr>
														<td class="field"><%# Eval("titulo") %></td>
														<td>
															<%# Eval("descripcion") %>
														</td>
													</tr>
												</ItemTemplate>
											</asp:Repeater>
										</tbody>
									</table>
									<!-- END table-product -->
								</div>
								<!-- END table-responsive -->
							</div>
							<!-- END #product-info -->
							<!-- BEGIN #product-reviews -->
							<div class="tab-pane fade" id="product-reviews">
								<!-- BEGIN row -->
								<div class="row row-space-30">
									<!-- BEGIN col-7 -->
									<div class="col-md-7 mb-4 mb-lg-0">
										<asp:ObjectDataSource ID="odsCaracteristicasRat" runat="server" SelectMethod="lista_caracteristica_producto" TypeName="pagos_comodos.Clases.Caracteristicas">
												<SelectParameters>
													<asp:ControlParameter ControlID="lblIdProducto" Name="id_producto_" Type="String" />
													<asp:Parameter Name="id_tipocaracteristicas_" DefaultValue="4"  />
													<asp:ControlParameter ControlID="lblIdUsuario" Name="id_usuario_" Type="String" />
												</SelectParameters>
											</asp:ObjectDataSource>
											<asp:Repeater ID="Repeater3" DataSourceID="odsCaracteristicasRat" runat="server">
												<ItemTemplate>
													<!-- BEGIN review -->
													<div class="review">
														<div class="review-info">
															<div class="review-name"><%# Eval("titulo") %></div>
														</div>
														<div class="review-title">
														</div>
														<div class="review-message">
															<%# Eval("descripcion") %>
														</div>
													</div>
													<!-- END review -->
												</ItemTemplate>
											</asp:Repeater>
									</div>
									<!-- END col-7 -->
									<!-- BEGIN col-5 -->
									<div class="col-md-5">
										<!-- BEGIN review-form -->
										<div class="review-form">
											<form action="product_detail.html" name="review_form" method="POST">
												<h2>Envia tus comentarios</h2>
												<div class="mb-3">
													<label for="name" class="form-label">Nombre <span class="text-danger">*</span></label>
													<asp:TextBox ID="txtNombre" class="form-control" runat="server"></asp:TextBox>
												</div>
												<div class="mb-3">
													<label for="review" class="form-label">Comentario <span class="text-danger">*</span></label>
													<asp:TextBox ID="txtComentario" TextMode="MultiLine" Rows="8" class="form-control" runat="server"></asp:TextBox>
												</div>
												<asp:Button ID="btnEnviar" class="btn btn-dark btn-theme btn-lg" OnClick="btnEnviar_Click" runat="server" Text="Enviar" />
												
											</form>
										</div>
										<!-- END review-form --> 
									</div>
									<!-- END col-5 -->
								</div>
								<!-- END row -->
							</div>
							<!-- END #product-reviews -->
						</div>
						<!-- END #product-tab-content -->
					</div>
					<!-- END product-tab -->
				</div>
				<!-- END product -->
				<!-- BEGIN similar-product -->
			<asp:Label ID="lblIdCategoria" runat="server" Text="" Visible="false"></asp:Label>
								<asp:ObjectDataSource ID="odsProductos" runat="server" SelectMethod="lista_producto_categoria" TypeName="pagos_comodos.Clases.Productos">
									<SelectParameters>
										<asp:ControlParameter ControlID="lblIdCategoria" Name="id_categoria_" Type="String" />
									</SelectParameters>
								</asp:ObjectDataSource>
				<h4 class="mb-15px mt-30px">También podría interesarte</h4>
				<div class="row gx-2">
					<div class="col-lg-2 col-md-4">
						<asp:Repeater ID="Repeater4" DataSourceID="odsProductos" runat="server">
							<ItemTemplate>
								<!-- BEGIN item -->
								<div class="item item-thumbnail">
									<a href="producto_detalle.aspx?ID=<%# Eval("id_producto") + "&cat=" + Eval("id_categoria") %>" class="item-image">
										<asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("url_imagen") %>' />
										<%--<div class="discount">15% OFF</div>--%>
									</a>
									<div class="item-info">
										<h4 class="item-title">
											<a href="producto_detalle.aspx?ID=<%# Eval("id_producto") %>"><%# Eval("nombre") %></a>
										</h4>
										<p class="item-desc">Precio en Bs.</p>
										<div class="item-price"><%# Eval("precio") %></div>
									</div>
								</div>
								<!-- END item -->
							</ItemTemplate>
						</asp:Repeater>
						
					</div>
					
				</div>
				<!-- END similar-product -->
			</div>
			<!-- END container -->
</asp:Content>
