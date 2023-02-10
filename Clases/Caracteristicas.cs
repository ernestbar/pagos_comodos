using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace pagos_comodos.Clases
{
    public class Caracteristicas
    {
        //Base de datos
        private static Database db1 = DatabaseFactory.CreateDatabase(ConfigurationManager.AppSettings["conn"]);

        public long id_caracteristicas { get; set; }
		public int id_tipocaracteristica { get; set; }
		public string titulo { get; set; }
		public string descripcion { get; set; }
		public string img1 { get; set; }
		public bool activo { get; set; }
		public long id_producto { get; set; }

        public string mensaje { get; set; }

        public Caracteristicas(long id_caracteristicas_, int id_tipocaracteristica_, string titulo_, string descripcion_, string img1_, bool activo_, long id_producto_)
		{
			this.id_caracteristicas = id_caracteristicas_;
			this.id_tipocaracteristica = id_tipocaracteristica_;
			this.titulo = titulo_;
			this.descripcion = descripcion_;
			this.img1 = img1_;
			this.activo = activo_;
			this.id_producto = id_producto_;
		}

        #region Constructores
        public Caracteristicas(int id_caracteristicas_)
        {
            id_caracteristicas = id_caracteristicas_;
            RecuperarDatos();
        }
       
        #endregion

        #region Métodos que NO requieren constructor
        public static DataTable lista_caracteristica_producto(long id_producto_,int id_tipocaracteristicas_)
        {
            try
            {
                DbCommand cmd = db1.GetStoredProcCommand("lista_caracteristica_producto");
                db1.AddInParameter(cmd, "id_producto", DbType.Int64, id_producto_);
                db1.AddInParameter(cmd, "id_tipocaracteristica", DbType.Int32, id_tipocaracteristicas_);
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



        public void ABM(string tipo_operacion_)
        {
            try
            {
                // verificar_vacios();
                DbCommand cmd = db1.GetStoredProcCommand("caracteristica_abm");
                db1.AddInParameter(cmd, "tipo_operacion", DbType.String, tipo_operacion_);
                db1.AddInParameter(cmd, "id_caracteristica", DbType.Int64, id_caracteristicas);
                db1.AddInParameter(cmd, "id_tipocaracteristica", DbType.Int32, id_tipocaracteristica);
                db1.AddInParameter(cmd, "titulo", DbType.String, titulo);
                db1.AddInParameter(cmd, "descripcion", DbType.String, descripcion);
                db1.AddInParameter(cmd, "img1", DbType.String, img1);
                db1.AddInParameter(cmd, "activo", DbType.Boolean, activo);
                db1.AddInParameter(cmd, "id_producto", DbType.Int64, id_producto);
                db1.AddOutParameter(cmd, "mensaje", DbType.String, 30);
                db1.AddOutParameter(cmd, "idCaracteristica", DbType.String, 250);
                db1.ExecuteNonQuery(cmd);

                mensaje = (string)db1.GetParameterValue(cmd, "mensaje");
                id_caracteristicas = Int64.Parse(db1.GetParameterValue(cmd, "idCaracteristica").ToString());
            }
            catch (Exception ex)
            {
                mensaje = ex.ToString();
                id_caracteristicas = 0;
            }
        }

        #endregion
    }
}