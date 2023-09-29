using BackExamen.Data;
using Newtonsoft.Json.Linq;
using serverTenis.Models;
using System.Data.SqlClient;
using System.Net;
using tenis.Models;

namespace tenis.Data
{
    public class ETLData
    {
        public static JArray ventasPorCliente()
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon1))
            {
                try
                {
                    oConexion.Open();

                    string consulta = "SELECT result FROM Graphic " +
                                      "WHERE type = 'ventasPorCliente' " +
                                      "AND YEAR(date) = 2023 " +
                                      "AND MONTH(date) = 6;";

                    using (SqlCommand comando = new SqlCommand(consulta, oConexion))
                    {
                        using (SqlDataReader lector = comando.ExecuteReader())
                        {
                            if (lector.Read())
                            {
                                string jsonResult = lector["result"].ToString();
                                JArray jsonArray = JArray.Parse(jsonResult);
                                return jsonArray;
                            }
                            else
                            {
                                return null; // No se encontró ningún registro
                            }
                        }
                    }
                }
                catch (Exception e)
                {
                    // Manejo de excepciones
                    throw new Exception("Error al consultar: " + e.Message);
                }
            }
        }
    }


    }

