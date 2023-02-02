using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagos_comodos
{
    public partial class contactanos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                txtNombre.Text = "";
                txtCelular.Text = "";
                txtEmail.Text = "";
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            Clases.enviar_correo obj = new Clases.enviar_correo();
            if (obj.enviar(txtEmail.Text, "Solicitud de informacion: " + txtNombre.Text, " Estimado Cliente: <br /> Recibimos su solicitud de informacion. En breve nos comunicaremos con usted. <br /> Saludos coodiales.", "") == "OK")
                MultiView1.ActiveViewIndex = 1;
        }
    }
}