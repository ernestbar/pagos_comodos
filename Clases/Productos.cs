using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace pagos_comodos.Clases
{
    public class Productos
    {
        //Base de datos
        private static Database db1 = DatabaseFactory.CreateDatabase(ConfigurationManager.AppSettings["conn"]);

        public long id_producto { get; set; }
        public long id_categoria { get; set; }
        public string nombre { get; set; }
        public bool activo { get; set; }
        public string url_imagen { get; set; }
        public string precio { get; set; }

        #region Constructores
        public Productos(long id_producto_)
        {
            id_producto = id_producto_;
            RecuperarDatos();
        }
        public Productos(long id_producto_, long id_categoria_, string nombre_, bool activo_, string url_imagen_)
        {
            this.id_producto = id_producto_;
            this.id_categoria = id_categoria_;
            this.nombre = nombre_;
            this.activo = activo_;
            this.url_imagen = url_imagen_;
        }
        #endregion

        #region Métodos que NO requieren constructor
        public static DataTable lista_producto_categoria(Int32 id_categoria_)
        {
            try
            {
                DbCommand cmd = db1.GetStoredProcCommand("lista_producto_categoria");
                db1.AddInParameter(cmd, "id_categoria", DbType.Int32, id_categoria_);
                cmd.CommandTimeout = int.Parse(ConfigurationManager.AppSettings["CommandTimeout"]);
                return db1.ExecuteDataSet(cmd).Tables[0];
            }
            catch (Exception ex)
            {
                ex.ToString();
                DataTable dt = new DataTable();
                return dt;
            }

        }




        #endregion

        #region Métodos que requieren constructor
        private void RecuperarDatos()
        {
            try
            {
                DbCommand cmd = db1.GetStoredProcCommand("producto_recuperar_datos");
                db1.AddInParameter(cmd, "id_producto", DbType.Int64, id_producto);
                db1.AddOutParameter(cmd, "id_categoria", DbType.Int32, 250);
                db1.AddOutParameter(cmd, "nombre", DbType.String, 250);
                db1.AddOutParameter(cmd, "activo", DbType.Boolean, 1);
                db1.AddOutParameter(cmd, "url_imagen", DbType.String, 250);
                db1.AddOutParameter(cmd, "precio", DbType.String, 250);
                db1.ExecuteNonQuery(cmd);
                id_categoria = (Int32)db1.GetParameterValue(cmd, "id_categoria");
                nombre = (string)db1.GetParameterValue(cmd, "nombre");
                activo = (bool)db1.GetParameterValue(cmd, "activo");
                url_imagen = (string)db1.GetParameterValue(cmd, "url_imagen");
                precio = (string)db1.GetParameterValue(cmd, "precio");
            }
            catch (Exception ex)
            {
                
            }
        }



        public string ABM()
        {
            string resultado = "";
            try
            {
                // verificar_vacios();
                //DbCommand cmd = db1.GetStoredProcCommand("PR_SEG_ABM_MENUS");
                //db1.AddInParameter(cmd, "PV_TIPO_OPERACION", DbType.String, _PV_TIPO_OPERACION);
                //if (_PB_COD_MENU == "")
                //    db1.AddInParameter(cmd, "PB_COD_MENU", DbType.Int64, null);
                //else
                //    db1.AddInParameter(cmd, "PB_COD_MENU", DbType.Int64, _PB_COD_MENU);
                //if (_PB_COD_MENU_PADRE == "")
                //    db1.AddInParameter(cmd, "PB_COD_MENU_PADRE", DbType.Int64, null);
                //else
                //    db1.AddInParameter(cmd, "PB_COD_MENU_PADRE", DbType.Int64, _PB_COD_MENU_PADRE);

                //db1.AddInParameter(cmd, "PV_DESCRIPCIONMEN", DbType.String, _PV_DESCRIPCIONMEN);
                //db1.AddInParameter(cmd, "PV_DETALLE", DbType.String, _PV_DETALLE);
                //db1.AddInParameter(cmd, "PV_SISTEMAS", DbType.String, _PV_SISTEMAS);
                //db1.AddInParameter(cmd, "PV_USUARIO", DbType.String, _PV_USUARIO);
                //db1.AddOutParameter(cmd, "PV_ESTADOPR", DbType.String, 30);
                //db1.AddOutParameter(cmd, "PV_DESCRIPCIONPR", DbType.String, 250);
                //db1.AddOutParameter(cmd, "PV_ERROR", DbType.String, 250);
                //db1.ExecuteNonQuery(cmd);
                ////if (String.IsNullOrEmpty(db1.GetParameterValue(cmd, "PV_USER").ToString()))
                ////    PV_USUARIO = "";
                ////else
                ////    PV_USUARIO = (string)db1.GetParameterValue(cmd, "PV_USER");
                //PV_ERROR = (string)db1.GetParameterValue(cmd, "PV_ESTADOPR");
                //PV_ESTADOPR = (string)db1.GetParameterValue(cmd, "PV_ESTADOPR");
                //PV_DESCRIPCIONPR = (string)db1.GetParameterValue(cmd, "PV_DESCRIPCIONPR");
                ////_id_cliente = (int)db1.GetParameterValue(cmd, "@PV_DESCRIPCIONPR");
                ////_error = (string)db1.GetParameterValue(cmd, "error");
                resultado = "";
                return resultado;
            }
            catch (Exception ex)
            {
                //_error = ex.Message;
                resultado = "Se produjo un error al registrar||";
                return resultado;
            }
        }

        #endregion
    }
}