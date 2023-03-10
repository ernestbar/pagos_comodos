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
        public string mensaje { get; set; }
        public string tipo_operacion { get; set; }
        public long id_usuario { get; set; }

        #region Constructores
        public Productos(long id_producto_)
        {
            id_producto = id_producto_;
            RecuperarDatos();
        }
        public Productos(string tipo_operacion_, long id_producto_, long id_categoria_, string nombre_, bool activo_, string url_imagen_,long id_usuario_)
        {
            this.id_producto = id_producto_;
            this.id_categoria = id_categoria_;
            this.nombre = nombre_;
            this.activo = activo_;
            this.url_imagen = url_imagen_;
            this.tipo_operacion = tipo_operacion_;
            this.id_usuario = id_usuario_;
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

        public static DataTable producto_lista_admin()
        {
            try
            {
                DbCommand cmd = db1.GetStoredProcCommand("producto_lista_admin");
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

        public static DataTable lista_productos_recientes()
        {
            try
            {
                DbCommand cmd = db1.GetStoredProcCommand("lista_productos_recientes");
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



        public void ABM()
        {
            try
            {
                // verificar_vacios();
                DbCommand cmd = db1.GetStoredProcCommand("producto_abm");
                db1.AddInParameter(cmd, "tipo_operacion", DbType.String, tipo_operacion);
                db1.AddInParameter(cmd, "id_producto", DbType.Int64, id_producto);
                db1.AddInParameter(cmd, "id_categoria", DbType.Int64, id_categoria);
                db1.AddInParameter(cmd, "url_imagen", DbType.String, url_imagen);
                db1.AddInParameter(cmd, "activo", DbType.Boolean, activo);
                db1.AddInParameter(cmd, "nombre", DbType.String, nombre);
                db1.AddInParameter(cmd, "id_usuario", DbType.Int64, id_usuario);
                db1.AddOutParameter(cmd, "mensaje", DbType.String, 30);
                db1.AddOutParameter(cmd, "idProducto", DbType.String, 250);
                db1.ExecuteNonQuery(cmd);

                mensaje = (string)db1.GetParameterValue(cmd, "mensaje");
                id_producto = Int64.Parse(db1.GetParameterValue(cmd, "idProducto").ToString());
            }
            catch (Exception ex)
            {
                mensaje = ex.ToString();
                id_producto = 0;
            }
        }

        #endregion
    }
}