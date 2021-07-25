using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using CapaEntidades;
using System.Data;

namespace CapaDatos
{
    public class D_Estudiante
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conectar"].ConnectionString);
      


            public DataTable ListProducts()
            {
                DataTable table = new DataTable();
                SqlDataReader readRows;
                SqlCommand cmd = new SqlCommand("SP_LISTARESTUDIANTE", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                conexion.Open();

                readRows = cmd.ExecuteReader();
                table.Load(readRows);

                readRows.Close();
                conexion.Close();

                return table;
            }
        public DataTable SearchProducts(E_Estudiante estudiante)
        {
            DataTable tabla = new DataTable();
            SqlCommand cmd = new SqlCommand("SP_BUSCARESTUDIANTE", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            cmd.Parameters.AddWithValue("@BUSCAR", estudiante.Search);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(tabla);

            conexion.Close();
            return tabla;
        }

        public void DeleteProduct(int id)
        {
            SqlCommand cmd = new SqlCommand("SP_ELIMINARESTUDIANTE", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            cmd.Parameters.AddWithValue("@IDESTUDIANTE", id);

            cmd.ExecuteNonQuery();
            conexion.Close();
        }

        public void CreateProduct(E_Estudiante estudiante)
        {

            SqlCommand cmd = new SqlCommand("SP_INSERTARESTUDIANTE", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            cmd.Parameters.AddWithValue("@NOMBRES", estudiante.Nombres);
            cmd.Parameters.AddWithValue("@APELLIDOS", estudiante.Apellidos);
            cmd.Parameters.AddWithValue("@ESCUELA", estudiante.Escuela);
           
            cmd.ExecuteNonQuery();
            conexion.Close();
        }

        public void UpdateProduct(E_Estudiante estudiante)
        {
            SqlCommand cmd = new SqlCommand("SP_EDITARESTUDIANTE", conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            conexion.Open();

            cmd.Parameters.AddWithValue("@IDESTUDIANTE", estudiante.IdEstudiante);
            cmd.Parameters.AddWithValue("@NOMBRES", estudiante.Nombres);
            cmd.Parameters.AddWithValue("@APELLIDOS",  estudiante.Apellidos);
            cmd.Parameters.AddWithValue("@ESCUELA", estudiante.Escuela);
            

            cmd.ExecuteNonQuery();
            conexion.Close();
        }

    }
}
