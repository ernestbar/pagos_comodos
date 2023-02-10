using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagos_comodos
{
    public partial class productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblIdCategoria.Text = Request.QueryString["cat"].ToString();
                if (Session["id_usuario"] == null)
                {
                    lblIdUsuario.Text = "3";
                }
                else
                {
                    lblIdUsuario.Text = Session["id_usuario"].ToString();
                }
            }
        }

        protected void lbtnCategoria_Click(object sender, EventArgs e)
        {

        }
    }
}