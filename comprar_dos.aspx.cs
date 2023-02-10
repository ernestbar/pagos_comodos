using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagos_comodos
{
    public partial class comprar_dos : System.Web.UI.Page
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
            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Session["id_producto"] = lblIdProducto.Text;
            Session["id_categoria"] = lblIdCategoria.Text;
            Response.Redirect("comprar_uno.aspx");
        }

        protected void btnAdelante_Click(object sender, EventArgs e)
        {
            if (Session["id_usuario"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                lblIdUsuario.Text = Session["id_usuario"].ToString();
                Clases.Solicitud obj_s = new Clases.Solicitud("I", 0, txtNombres.Text, txtApellidos.Text, txtCelular.Text, txtDomicilio.Text,
                txtEmpresa.Text, txtDireccionTrabajo.Text, txtTelefonoOficina.Text, long.Parse(lblIdProducto.Text), long.Parse(lblIdUsuario.Text));
                obj_s.ABM();
                if (obj_s.id_solicitud > 0)
                {
                    Session["id_producto"] = lblIdProducto.Text;
                    Session["id_categoria"] = lblIdCategoria.Text;
                    Response.Redirect("comprar_tres.aspx");
                    lblAviso.Text = obj_s.mensaje;
                }
                else
                {
                    lblAviso.Text = obj_s.mensaje;
                }
                
            }
            
        }
    }
}