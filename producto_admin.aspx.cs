using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagos_comodos
{
    public partial class producto_admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                lblAviso.Text = "";
                string id = "";
                Button obj = (Button)sender;
                id = obj.CommandArgument.ToString();
                lblIdProducto.Text = id;
                Clases.Productos pro = new Clases.Productos(long.Parse(lblIdProducto.Text));
                txtNombre.Text = pro.nombre;
                txtPrecio.Text = pro.precio;
                ddlCategoria.SelectedValue = pro.id_categoria.ToString();
                DataTable dt = new DataTable();
                dt = Clases.Caracteristicas.lista_caracteristica_producto(int.Parse(id), 5);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        ListItem miItem = new ListItem();
                        miItem.Text = dr["descripcion"].ToString();
                        //miItem.Text;
                        //lbResumen.Items.Add();
                    }
                
                }
                MultiView1.ActiveViewIndex = 1;

            }
            catch (Exception ex)
            {
                string nombre_archivo = "error_clientes_" + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".txt";
                string directorio2 = Server.MapPath("~/Logs");
                StreamWriter writer5 = new StreamWriter(directorio2 + "\\" + nombre_archivo, true, Encoding.Unicode);
                writer5.WriteLine(ex.ToString());
                writer5.Close();
                lblAviso.Text = "Tenemos algunos problemas consulte con el administrador.";
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                lblAviso.Text = "";
                string id = "";
                Button obj = (Button)sender;
                id = obj.CommandArgument.ToString();
                string[] datos = id.Split('|');
                lblIdProducto.Text = datos[0];
                string estado = "";
                estado = datos[1];
                if (estado == "ACTIVO")
                {
                    Clases.Productos pro = new Clases.Productos("D", long.Parse(lblIdProducto.Text), 0, "",true,"",1) ;
                    pro.ABM();
                    lblAviso.Text = pro.mensaje; 
                }
                else
                {
                    Clases.Productos pro = new Clases.Productos("A", long.Parse(lblIdProducto.Text), 0, "", true, "", 1);
                    pro.ABM();
                    lblAviso.Text = pro.mensaje;
                }

                Repeater1.DataBind();
            }
            catch (Exception ex)
            {
                string nombre_archivo = "error_producto_" + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".txt";
                string directorio2 = Server.MapPath("~/Logs");
                StreamWriter writer5 = new StreamWriter(directorio2 + "\\" + nombre_archivo, true, Encoding.Unicode);
                writer5.WriteLine(ex.ToString());
                writer5.Close();
                lblAviso.Text = "Tenemos algunos problemas consulte con el administrador.";
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Limpiar();
            lblIdProducto.Text = "";
            MultiView1.ActiveViewIndex = 1;
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            Limpiar();
        }
        public void Limpiar()
        {
            txtNombre.Text = "";
            txtPrecio.Text = "";
            txtResumen.Text = "";
            lblIdProducto.Text = "";
            ddlCategoria.DataBind();
            //lbResumen.Items.Clear();
        }
        protected void btnAdelante_Click(object sender, EventArgs e)
        {
            string url_imagen = "";
            if (lblIdProducto.Text == "")
            {
                Clases.Productos obj_p = new Clases.Productos("I", 0, long.Parse(ddlCategoria.SelectedValue), txtNombre.Text, true, fuFoto.FileName, 1);
                obj_p.ABM();
                
                lblAviso.Text = obj_p.mensaje;
                MultiView1.ActiveViewIndex = 2;
                Repeater1.DataBind();
            }
            else
            { 
            }
            
            
        }

        protected void ddlCategoria_DataBound(object sender, EventArgs e)
        {
            ddlCategoria.Items.Insert(0, "SELECCIONAR");
        }

        protected void btnPlus_Click(object sender, EventArgs e)
        {
            if (lblIdCaracteristicas.Text == "")
            {
                Clases.Caracteristicas car = new Clases.Caracteristicas(0, 5, "Checklist", txtResumen.Text, "", true, int.Parse(lblIdProducto.Text));
                car.ABM("I");
                lblAviso.Text = car.mensaje;
            }
            else
            {
                Clases.Caracteristicas car = new Clases.Caracteristicas(int.Parse(lblIdCaracteristicas.Text), 5, "Checklist", txtResumen.Text, "", true, int.Parse(lblIdProducto.Text));
                car.ABM("U");
                lblAviso.Text = car.mensaje;
            }

            lblIdCaracteristicas.Text = "";
            txtResumen.Text = "";
            Repeater2.DataBind();

        }

        protected void btnResumen_Click(object sender, EventArgs e)
        {
            lblIdCaracteristicas.Text = "";
            lblAviso.Text = "";
            string id = "";
            Button obj = (Button)sender;
            id = obj.CommandArgument.ToString();
            lblIdProducto.Text = id;
            odsResumen.FilterExpression = "titulo='Checklist'";
            Repeater2.DataBind();
            MultiView1.ActiveViewIndex = 2;
        }

        protected void btnEditarRes_Click(object sender, EventArgs e)
        {
            try
            {
                lblAviso.Text = "";
                string id = "";
                Button obj = (Button)sender;
                id = obj.CommandArgument.ToString();
                lblIdCaracteristicas.Text = id;
                Clases.Caracteristicas car = new Clases.Caracteristicas(int.Parse(lblIdCaracteristicas.Text));
                txtResumen.Text = car.descripcion;
                txtResumen.Focus();
            }
            catch (Exception ex)
            {
                string nombre_archivo = "error_producto_" + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".txt";
                string directorio2 = Server.MapPath("~/Logs");
                StreamWriter writer5 = new StreamWriter(directorio2 + "\\" + nombre_archivo, true, Encoding.Unicode);
                writer5.WriteLine(ex.ToString());
                writer5.Close();
                lblAviso.Text = "Tenemos algunos problemas consulte con el administrador.";
            }
        }

        protected void btnEliminarRes_Click(object sender, EventArgs e)
        {
            try
            {
                lblAviso.Text = "";
                string id = "";
                Button obj = (Button)sender;
                id = obj.CommandArgument.ToString();
                string[] datos = id.Split('|');
                lblIdCaracteristicas.Text = datos[0];
                string estado = "";
                estado = datos[1];
                if (bool.Parse(estado) == true)
                {
                    Clases.Caracteristicas car = new Clases.Caracteristicas(long.Parse(lblIdCaracteristicas.Text), 5, "",txtResumen.Text,"", true, long.Parse(lblIdProducto.Text));
                    car.ABM("D");
                    lblAviso.Text = car.mensaje;
                }
                else
                {
                    Clases.Caracteristicas car = new Clases.Caracteristicas(long.Parse(lblIdCaracteristicas.Text), 5, "", txtResumen.Text, "", true, long.Parse(lblIdProducto.Text));
                    car.ABM("A");
                    lblAviso.Text = car.mensaje;
                }
                lblIdCaracteristicas.Text = "";
                odsResumen.FilterExpression = "titulo='Checklist'";
                Repeater2.DataBind();
            }
            catch (Exception ex)
            {
                string nombre_archivo = "error_producto_" + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".txt";
                string directorio2 = Server.MapPath("~/Logs");
                StreamWriter writer5 = new StreamWriter(directorio2 + "\\" + nombre_archivo, true, Encoding.Unicode);
                writer5.WriteLine(ex.ToString());
                writer5.Close();
                lblAviso.Text = "Tenemos algunos problemas consulte con el administrador.";
            }
        }

        protected void btnDescripcion_Click(object sender, EventArgs e)
        {
            lblAviso.Text = "";
            string id = "";
            Button obj = (Button)sender;
            id = obj.CommandArgument.ToString();
            lblIdProducto.Text = id;
            MultiView1.ActiveViewIndex = 3;
        }

        protected void btnEditarDesc_Click(object sender, EventArgs e)
        {
            try
            {
                lblAviso.Text = "";
                string id = "";
                Button obj = (Button)sender;
                id = obj.CommandArgument.ToString();
                lblIdCaracteristicas.Text = id;
                Clases.Caracteristicas car = new Clases.Caracteristicas(int.Parse(lblIdCaracteristicas.Text));
                txtTituloDesc.Text = car.titulo;
                txtDescripcionDesc.Text = car.descripcion;
                txtResumen.Focus();
            }
            catch (Exception ex)
            {
                string nombre_archivo = "error_producto_" + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".txt";
                string directorio2 = Server.MapPath("~/Logs");
                StreamWriter writer5 = new StreamWriter(directorio2 + "\\" + nombre_archivo, true, Encoding.Unicode);
                writer5.WriteLine(ex.ToString());
                writer5.Close();
                lblAviso.Text = "Tenemos algunos problemas consulte con el administrador.";
            }
        }

        protected void btnEliminarDesc_Click(object sender, EventArgs e)
        {
            try
            {
                lblAviso.Text = "";
                string id = "";
                Button obj = (Button)sender;
                id = obj.CommandArgument.ToString();
                string[] datos = id.Split('|');
                lblIdCaracteristicas.Text = datos[0];
                string estado = "";
                estado = datos[1];
                if (bool.Parse(estado) == true)
                {
                    Clases.Caracteristicas car = new Clases.Caracteristicas(long.Parse(lblIdCaracteristicas.Text), 1,txtTituloDesc.Text,txtDescripcionDesc.Text, fuFoto.FileName, true, long.Parse(lblIdProducto.Text));
                    car.ABM("D");
                    lblAviso.Text = car.mensaje;
                }
                else
                {
                    Clases.Caracteristicas car = new Clases.Caracteristicas(long.Parse(lblIdCaracteristicas.Text), 1, txtTituloDesc.Text, txtDescripcionDesc.Text, fuFoto.FileName, true, long.Parse(lblIdProducto.Text));
                    car.ABM("A");
                    lblAviso.Text = car.mensaje;
                }
                lblIdCaracteristicas.Text = "";
                Repeater3.DataBind();
            }
            catch (Exception ex)
            {
                string nombre_archivo = "error_producto_" + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".txt";
                string directorio2 = Server.MapPath("~/Logs");
                StreamWriter writer5 = new StreamWriter(directorio2 + "\\" + nombre_archivo, true, Encoding.Unicode);
                writer5.WriteLine(ex.ToString());
                writer5.Close();
                lblAviso.Text = "Tenemos algunos problemas consulte con el administrador.";
            }
        }

        protected void btnAgragarDesc_Click(object sender, EventArgs e)
        {
            if (lblIdCaracteristicas.Text == "")
            {
                Clases.Caracteristicas car = new Clases.Caracteristicas(0, 1,  txtTituloDesc.Text,txtDescripcionDesc.Text, fuImagenDesc.FileName, true, int.Parse(lblIdProducto.Text));
                car.ABM("I");
                lblAviso.Text = car.mensaje;
            }
            else
            {
                Clases.Caracteristicas car = new Clases.Caracteristicas(int.Parse(lblIdCaracteristicas.Text), 1,txtTituloDesc.Text, txtDescripcionDesc.Text, fuImagenDesc.FileName, true, int.Parse(lblIdProducto.Text));
                car.ABM("U");
                lblAviso.Text = car.mensaje;
            }

            lblIdCaracteristicas.Text = "";
            txtTituloDesc.Text = "";
            txtDescripcionDesc.Text = "";
            Repeater3.DataBind();
        }

        protected void btnLimpiarDesc_Click(object sender, EventArgs e)
        {

        }
    }
}