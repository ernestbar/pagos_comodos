using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace pagos_comodos.Clases
{
    public class Usuarios
    {
        //Base de datos
        private static Database db1 = DatabaseFactory.CreateDatabase(ConfigurationManager.AppSettings["conn"]);

        public long id_usuario { get; set; }
        public string nombre_usuario { get; set; }
        public string email { get; set; }
        public string clave { get; set; }
        public string ci { get; set; }
        public string nit { get; set; }
        public string paterno { get; set; }
        public string materno { get; set; }
        public string nombres { get; set; }
        public string celular { get; set; }
        public string telefono { get; set; }
        public string mensaje { get; set; }
        public string tipo_operacion { get; set; }
        public string direccion { get; set; }
        public int id_rol { get; set; }
        public DateTime fecha_creacion { get; set; }
        public bool activo { get; set; }

        #region Constructores
        public Usuarios(int id_usuario_)
        {
            id_usuario = id_usuario_;
            //RecuperarDatos();
        }
        public Usuarios(string email_,string password_)
        {
            email = email_;
            clave = password_;
            Ingreso();
        }
        public Usuarios(string tipo_operacion_,long id_usuario_, string nombre_usuario_, string email_, string clave_, string ci_, string nit_, string paterno_, string materno_, string nombres_, string celular_, string telefono_, string direccion_, int id_rol_)
        {
            this.tipo_operacion = tipo_operacion_;
            this.id_usuario = id_usuario_;
            this.nombre_usuario = nombre_usuario_;
            this.email = email_;
            this.clave = clave_;
            this.ci = ci_;
            this.nit = nit_;
            this.paterno = paterno_;
            this.materno = materno_;
            this.nombres = nombres_;
            this.celular = celular_;
            this.telefono = telefono_;
            this.direccion = direccion_;
            this.id_rol = id_rol_;
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

        private void Ingreso()
        {
            try
            {
                DbCommand cmd = db1.GetStoredProcCommand("usuario_ingreso");
                db1.AddInParameter(cmd, "@email", DbType.String, email);
                db1.AddInParameter(cmd, "@clave", DbType.String, clave);
                db1.AddOutParameter(cmd, "idRol", DbType.Int32, 30);
                db1.AddOutParameter(cmd, "nombre", DbType.String, 250);
                db1.AddOutParameter(cmd, "idUsuario", DbType.Int64, 250);
                db1.ExecuteNonQuery(cmd);
                mensaje = (string)db1.GetParameterValue(cmd, "nombre");
                id_rol = int.Parse(db1.GetParameterValue(cmd, "idRol").ToString());
                id_usuario = int.Parse(db1.GetParameterValue(cmd, "idUsuario").ToString());

            }
            catch { }
        }


        public void ABM()
        {
            try
            {
                DbCommand cmd = db1.GetStoredProcCommand("usuario_abm");
                db1.AddInParameter(cmd, "tipo_operacion", DbType.String, tipo_operacion);
                db1.AddInParameter(cmd, "nombre_usuario", DbType.String, nombre_usuario);
                db1.AddInParameter(cmd, "email", DbType.String, email);
                db1.AddInParameter(cmd, "clave", DbType.String, clave);
                db1.AddInParameter(cmd, "ci", DbType.String, @ci);
                db1.AddInParameter(cmd, "nit", DbType.String, @nit);
                db1.AddInParameter(cmd, "paterno", DbType.String, paterno);
                db1.AddInParameter(cmd, "materno", DbType.String, materno);
                db1.AddInParameter(cmd, "nombres", DbType.String, nombres);
                db1.AddInParameter(cmd, "celular", DbType.String, celular);
                db1.AddInParameter(cmd, "telefono", DbType.String, telefono);
                db1.AddInParameter(cmd, "direccion", DbType.String, direccion);
                db1.AddInParameter(cmd, "id_rol", DbType.Int32, id_rol);

                db1.AddOutParameter(cmd, "mensaje", DbType.String, 600);
                db1.AddOutParameter(cmd, "idUsuario", DbType.Int64, 250);
                db1.ExecuteNonQuery(cmd);
                
                mensaje = (string)db1.GetParameterValue(cmd, "mensaje");
                id_usuario = Int64.Parse(db1.GetParameterValue(cmd, "idUsuario").ToString());
                
            }
            catch (Exception ex)
            {
                mensaje = ex.ToString();
                id_usuario = 0;
            }
        }

        #endregion
    }
}