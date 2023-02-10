using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace pagos_comodos
{
    public partial class producto_detalle : System.Web.UI.Page
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
                lblIdProducto.Text = Request.QueryString["ID"].ToString();
                lblIdCategoria.Text = Request.QueryString["cat"].ToString();
                ////carga el titulo
                DataTable dt_t = new DataTable();
                dt_t= Clases.Caracteristicas.lista_caracteristica_producto(long.Parse(lblIdProducto.Text), 5);
                RepeaterTitulo.DataSource = dt_t.Select("titulo='Titulo'");
                RepeaterTitulo.DataBind();

                ////carga el precio
                DataTable dt_p = new DataTable();
                dt_p = Clases.Caracteristicas.lista_caracteristica_producto(long.Parse(lblIdProducto.Text), 5);
                RepeaterPrecio.DataSource = dt_p.Select("titulo='Precio'");
                RepeaterPrecio.DataBind();

                ////carga el precio
                DataTable dt_c = new DataTable();
                dt_c = Clases.Caracteristicas.lista_caracteristica_producto(long.Parse(lblIdProducto.Text), 5);
                RepeaterCheklist.DataSource = dt_c.Select("titulo='Checklist'");
                RepeaterCheklist.DataBind();
                SetCaptchaText();
            }
        }
        private void SetCaptchaText()
        {
            Session["Captcha"] = string.Empty;
        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Clases.Caracteristicas obj = new Clases.Caracteristicas(0, 4, txtNombre.Text + " " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString(), txtComentario.Text, "", false, long.Parse(lblIdProducto.Text));
            obj.ABM("I");
            lblAviso.Text = obj.mensaje;
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            if (Session["id_usuario"] == null)
            {
                lblAviso.Text = "Por favor ingrese con su usuario o registrese.";
            }
            else
            {
                Session["id_producto"] = lblIdProducto.Text;
                Session["id_categoria"] = lblIdCategoria.Text;
                Response.Redirect("comprar_uno.aspx");
            }
        }
    }
}