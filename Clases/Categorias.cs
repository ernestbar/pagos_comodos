using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace pagos_comodos.Clases
{
    public class Categorias
    {
        //Base de datos
        private static Database db1 = DatabaseFactory.CreateDatabase(ConfigurationManager.AppSettings["conn"]);

        public int id_menu { get; set; }
        public string nombre { get; set; }
        public bool activo { get; set; }
        public string url { get; set; }

        #region Constructores
        public Categorias(int id_menu_)
        {
            id_menu = id_menu_;
            RecuperarDatos();
        }
        public Categorias(int id_menu_, string nombre_, bool activo_, string url_)
        {
            this.id_menu = id_menu_;
            this.nombre = nombre_;
            this.activo = activo_;
            this.url = url_;
        }
        #endregion

        #region Métodos que NO requieren constructor
        public static DataTable lista_categorias()
        {
            try
            {
                DbCommand cmd = db1.GetStoredProcCommand("lista_categorias");
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