using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace pagos_comodos.Clases
{
    public class Solicitud
    {
        //Base de datos
        private static Database db1 = DatabaseFactory.CreateDatabase(ConfigurationManager.AppSettings["conn"]);

        public string tipo_operacion { get; set; }
        public long id_solicitud { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public string celular { get; set; }
        public string dir_dom { get; set; }
        public string nombre_empresa { get; set; }
        public string dir_trabajo { get; set; }
        public string telefono_oficina { get; set; }
        public long id_producto { get; set; }
        public long id_usuario { get; set; }
        public string mensaje { get; set; }

        #region Constructores
        public Solicitud(long id_solicitud_)
        {
            id_solicitud = id_solicitud_;
            //RecuperarDatos();
        }
       
        public Solicitud(string tipo_operacion_, long id_solicitud_, string nombres_, string apellidos_, string celular_, string dir_dom_, string nombre_empresa_,string dir_trabajo_,
            string telefono_oficina_,long id_producto_,long id_usuario_)
        {
            this.tipo_operacion = tipo_operacion_;
            this.id_solicitud = id_solicitud_;
            this.nombres = nombres_;
            this.apellidos = apellidos_;
            this.celular = celular_;
            this.dir_dom = dir_dom_;
            this.nombre_empresa = nombre_empresa_;
            this.dir_trabajo = dir_trabajo_;
            this.telefono_oficina = telefono_oficina_;
            this.id_producto = id_producto_;
            this.id_usuario = id_usuario_;
        }
        #endregion

        #region Métodos que NO requieren constructor
        public static DataTable lista_menu_rol_todos(int id_usuario_)
        {
            try
            {
                DbCommand cmd = db1.GetStoredProcCommand("lista_menu_rol_todos");
                db1.AddInParameter(cmd, "id_usuario", DbType.Int32, id_usuario_);
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
                //DbCommand cmd = db1.GetStoredProcCommand("PR_SEG_GET_MENUS_IND");
                //db1.AddInParameter(cmd, "PV_COD_MENU", DbType.String, _PB_COD_MENU);
                //db1.ExecuteNonQuery(cmd);
                //DataTable dt = new DataTable();
                //dt = db1.ExecuteDataSet(cmd).Tables[0];
                //if (dt.Rows.Count > 0)
                //{
                //    foreach (DataRow dr in dt.Rows)
                //    {
                //        if (string.IsNullOrEmpty(dr["COD_MENU_PADRE"].ToString()))
                //        { _PB_COD_MENU_PADRE = ""; }
                //        else
                //        { _PB_COD_MENU_PADRE = (string)dr["COD_MENU_PADRE"]; }
                //        _PV_DESCRIPCIONMEN = (string)dr["DESCRIPCION"];
                //        _PV_DETALLE = (string)dr["DETALLE"];
                //    }

                //}

            }
            catch { }
        }

        


        public void ABM()
        {
            try
            {
                DbCommand cmd = db1.GetStoredProcCommand("solicitud_abm");
                db1.AddInParameter(cmd, "tipo_operacion", DbType.String, tipo_operacion);
                db1.AddInParameter(cmd, "id_solicitud", DbType.Int64, id_solicitud);
                db1.AddInParameter(cmd, "nombres", DbType.String, nombres);
                db1.AddInParameter(cmd, "apellidos", DbType.String, apellidos);
                db1.AddInParameter(cmd, "celular", DbType.String, celular);
                db1.AddInParameter(cmd, "dir_dom", DbType.String, dir_dom);
                db1.AddInParameter(cmd, "nombre_empresa", DbType.String, nombre_empresa);
                db1.AddInParameter(cmd, "dir_trabajo", DbType.String, dir_trabajo);
                db1.AddInParameter(cmd, "telefono_oficina", DbType.String, telefono_oficina);
                db1.AddInParameter(cmd, "id_producto", DbType.Int64, id_producto);
                db1.AddInParameter(cmd, "id_usuario", DbType.Int64, id_usuario);

                db1.AddOutParameter(cmd, "mensaje", DbType.String, 600);
                db1.AddOutParameter(cmd, "idSolicitud", DbType.Int64, 250);
                db1.ExecuteNonQuery(cmd);

                mensaje = (string)db1.GetParameterValue(cmd, "mensaje");
                id_solicitud = Int64.Parse(db1.GetParameterValue(cmd, "idSolicitud").ToString());

            }
            catch (Exception ex)
            {
                mensaje = ex.ToString();
                id_solicitud = 0;
            }
        }

        #endregion

    }
}