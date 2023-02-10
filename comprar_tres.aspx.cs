using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagos_comodos
{
    public partial class comprar_tres : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["id_usuario"] == null)
                {
                    lblIdUsuario.Text = "3";
                }
                else
                {
                    lblIdUsuario.Text = Session["id_usuario"].ToString();
                }
                lblIdProducto.Text = Session["id_producto"].ToString();
                lblIdCategoria.Text = Session["id_categoria"].ToString();
                Clases.Productos obj_p = new Clases.Productos(long.Parse(lblIdProducto.Text));
                lblTitulo.Text = obj_p.nombre;
                lblPrecio.Text = obj_p.precio;
                Image1.ImageUrl = obj_p.url_imagen;
                lblFechaHora.Text = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
            }
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            Response.Redirect("producto_detalle.aspx?ID=" + lblIdProducto.Text +"&cat="+lblIdCategoria.Text);
        }
    }
}