<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="productos.aspx.cs" Inherits="pagos_comodos.productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Label ID="lblIdUsuario" runat="server" Text="" Visible="false"></asp:Label>
    <!-- BEGIN #page-header -->
		<div id="page-header" class="section-container page-header-container bg-dark">
			<!-- BEGIN page-header-cover -->
			<div class="page-header-cover">
				<img src="../assets/img/cover/cover-12.jpg" alt="" />
			</div>
			<!-- END page-header-cover -->
			<!-- BEGIN container -->
			<div class="container">
				<h1 class="page-header"><b>Apple</b> Product</h1>
			</div>
			<!-- END container -->
		</div>
		<!-- BEGIN #page-header -->
		
		<!-- BEGIN search-results -->
		<div id="search-results" class="section-container">
			<!-- BEGIN container -->
			<div class="container">
				<asp:Label ID="lblAviso" runat="server" ForeColor="Blue" Text=""></asp:Label>
				<!-- BEGIN search-container -->
				<div class="search-container">
					<!-- BEGIN search-sidebar -->
					<div class="search-sidebar">
						<h4 class="title">Filtros</h4>
							<div class="mb-3">
								<label class="form-label">Palabra Clave</label>
								<asp:TextBox ID="txtKeywords" class="form-control input-sm" placeholder="Ingrese su palabra clave" runat="server"></asp:TextBox>
							</div>
							<div class="mb-3">
								<label class="form-label">Precio en $us.</label>
								<div class="row row-space-0">
									<div class="col-md-5">
										<asp:TextBox ID="txtPrecioDesde" class="form-control input-sm" placeholder="Precio desde" runat="server" Text="10"></asp:TextBox>
									</div>
									<div class="col-md-2 text-center pt-5px fs-12px text-muted">hasta</div>
									<div class="col-md-5">
										<asp:TextBox ID="txtPrecioHasta" class="form-control input-sm" placeholder="Precio hasta" runat="server" Text="5000"></asp:TextBox>
									</div>
								</div>
							</div>
							<div class="mb-30px">
								<asp:Button ID="btnFiltro" class="btn btn-sm btn-theme btn-dark w-100" runat="server" Text="FILTRO" />
								
							</div>
						<h4 class="title mb-0">Categorias</h4>
						<asp:ObjectDataSource ID="odsCategorias" runat="server" SelectMethod="lista_categorias" TypeName="pagos_comodos.Clases.Categorias">
					</asp:ObjectDataSource>
						<ul class="search-category-list">
							<asp:Repeater ID="Repeater1" DataSourceID="odsCategorias" runat="server">
                                        <ItemTemplate>
											<li><asp:LinkButton ID="lbtnCategoria" CommandArgument='<%# Eval("id_categoria") %>' OnClick="lbtnCategoria_Click" runat="server"><%# Eval("nombre") %></asp:LinkButton></li>
                                        </ItemTemplate>
                                     </asp:Repeater>
						</ul>
					</div>
					<!-- END search-sidebar -->
					<!-- BEGIN search-content -->
					<div class="search-content">
						<!-- BEGIN search-toolbar -->
						<div class="search-toolbar">
							<!-- BEGIN row -->
							<div class="row">
								<div class="col-lg-6">
									<h4>Entontramos los siguientes productos</h4>
								</div>
								<!-- END col-6 -->
								<!-- BEGIN col-6 -->
								<div class="col-lg-6 text-end">
									<ul class="sort-list">
										<li class="text"><i class="fa fa-filter"></i> Ordenar por:</li>
										<li class="active"><a href="#">Populares</a></li>
										<li><a href="#">Nuevos</a></li>
										<li><a href="#">Descuentos</a></li>
										<li><a href="#">Precio</a></li>
									</ul>
								</div>
								<!-- END col-6 -->
							</div>
							<!-- END row -->
						</div>
						<!-- END search-toolbar -->
						<!-- BEGIN search-item-container -->
						<div class="search-item-container">
							<!-- BEGIN item-row -->
							<div class="item-row">
								<asp:Label ID="lblIdCategoria" runat="server" Text="" Visible="false"></asp:Label>
								<asp:ObjectDataSource ID="odsProductos" runat="server" SelectMethod="lista_producto_categoria" TypeName="pagos_comodos.Clases.Productos">
									<SelectParameters>
										<asp:ControlParameter ControlID="lblIdCategoria" Name="id_categoria_" Type="String" />
									</SelectParameters>
								</asp:ObjectDataSource>

								<asp:Repeater ID="Repeater2" DataSourceID="odsProductos" runat="server">
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
							<!-- END item-row -->
						</div>
						<!-- END search-item-container -->
						<!-- BEGIN pagination -->
						<ul class="pagination justify-content-center mt-0">
							<li class="page-item disabled"><a href="javascript:;" class="page-link">Previous</a></li>
							<li class="page-item active"><a class="page-link" href="javascript:;">1</a></li>
							<li class="page-item"><a class="page-link" href="javascript:;">2</a></li>
							<li class="page-item"><a class="page-link" href="javascript:;">3</a></li>
							<li class="page-item"><a class="page-link" href="javascript:;">4</a></li>
							<li class="page-item"><a class="page-link" href="javascript:;">5</a></li>
							<li class="page-item"><a class="page-link" href="javascript:;">Next</a></li>
						</ul>
						<!-- END pagination -->
					</div>
					<!-- END search-content -->
				</div>
				<!-- END search-container -->
			</div>
			<!-- END container -->
		</div>
		<!-- END search-results -->
</asp:Content>
