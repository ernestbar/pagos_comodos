using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagos_comodos
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                txtContraseña.Text = "";
                txtEmail.Text = "";
                SetCaptchaText();
            }
        }

        protected void btnResgistrarse_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Clases.Usuarios obj = new Clases.Usuarios(txtEmail.Text, txtContraseña.Text);
            if (obj.id_usuario > 0)
            {
                Session["id_usuario"] = obj.id_usuario;
                Session["id_rol"] = obj.id_rol;
                Session["usuario"] = txtEmail.Text;
                lblAviso.Text = "";
                Response.Redirect("home.aspx");
            }
            else
            {
                lblAviso.Text = obj.mensaje;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        private void SetCaptchaText()
        {
            Session["Captcha"] = string.Empty;
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Session["Captcha"].ToString() != txtVerificationCode.Text.Trim())
            {
                SetCaptchaText();
                txtVerificationCode.Text = string.Empty;
                lblCaptchaMessage.BackColor = System.Drawing.Color.White;
                lblCaptchaMessage.Text = "Codigo incorrecto !";
                lblCaptchaMessage.ForeColor = System.Drawing.Color.Red;
                txtVerificationCode.Focus();
            }
            else
            {
                lblCaptchaMessage.Text = "";
                txtVerificationCode.Text = string.Empty;
                lblCaptchaMessage.Text = string.Empty;
                Clases.Usuarios obj = new Clases.Usuarios("I", 0, txtEmailR.Text, txtEmailR.Text, txtClave.Text, txtCi.Text, "", txtPaterno.Text, txtMaterno.Text, txtNombres.Text, txtCelular.Text, txtTelefono.Text, txtDireccion.Text, 2);
                obj.ABM();
                lblAviso.Text = obj.mensaje;
                MultiView1.ActiveViewIndex = 0;
            }
          
        }
    }
}