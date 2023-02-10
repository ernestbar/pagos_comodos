using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace pagos_comodos
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["id_usuario"] == null)
                {
                    lblIdUsuario.Text = "3";
                    Repeater1.DataBind();
                }
                else
                {
                    lblIdUsuario.Text = Session["id_usuario"].ToString();
                    lbtnLogin.Text = Session["usuario"].ToString();
                    Repeater1.DataBind();
                }

            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                 e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HiddenField id = (HiddenField)e.Item.FindControl("hfIdMenu");
                if (id != null)
                {
                    Repeater submenus = (Repeater)e.Item.FindControl("Repeater2");
                    DataTable dt = new DataTable();
                    dt = Clases.Menu_hijos.lista_menu_hijo_x_menu(int.Parse(id.Value));
                    if (dt.Rows.Count > 0)
                    {
                        submenus.DataSource = dt;
                        submenus.DataBind();
                    }
                   
                }
               
            }
        }

        protected void lbtnNombreMenu_Click(object sender, EventArgs e)
        {
            string id = "";
            LinkButton obj = (LinkButton)sender;
            id = obj.CommandArgument.ToString();
            if(id.Contains(".aspx"))
                Response.Redirect(id);
        }

        protected void lbtnNombreMenuHijo_Click(object sender, EventArgs e)
        {
            string id = "";
            LinkButton obj = (LinkButton)sender;
            id = obj.CommandArgument.ToString();
            if (id.Contains(".aspx"))
                Response.Redirect(id);
        }

        protected void lbtnLogin_Click(object sender, EventArgs e)
        {
            if (lbtnLogin.Text == "Ingresar")
                Response.Redirect("login.aspx");
            else
            {
                Session.Abandon();
                lbtnLogin.Text = "Ingresar";
            }
               
        }
    }
}