using BackExamen.Models;
using Newtonsoft.Json;
using System.Data.SqlClient;


namespace BackExamen.Data
{
    public class VentasData
    {
        public static dynamic MostrarVentas()
        {
            List<Ventas> listaVentas = new List<Ventas>();

            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {
                oConexion.Open();

                SqlCommand cmd = new SqlCommand("sp_listar", oConexion);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                try
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Ventas venta = new Ventas()
                            {
                                IDVentas = Convert.ToInt32(dr["IDVentas"]),
                                Producto = new Productos()
                                {
                                    IDProductos = Convert.ToInt32(dr["IDProductos"]),
                                    Titulo = dr["Titulo"].ToString(),
                                    Descripcion = dr["Descripcion"].ToString(),
                                    PrecioUnitario = Convert.ToDouble(dr["PrecioUnitario"]),
                                    Existencias = Convert.ToInt32(dr["Existencias"])
                                },
                                CantidadVendida = Convert.ToInt32(dr["CantidadVendida"]),
                                Fecha = Convert.ToDateTime(dr["Fecha"].ToString())
                            };

                            listaVentas.Add(venta);
                        }
                    }

                    return listaVentas;
                }
                catch (Exception e)
                {
                    Console.WriteLine("Error al obtener la lista de ventas: " + e.Message);
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic CantidadVenta_MasVendido_Existencias_Articulo()
        {
            List<Productos> listaP = new List<Productos>();

            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {
                oConexion.Open();

                SqlCommand cmd = new SqlCommand("sp_CantidadVenta_MasVendido_Existencias_Articulo", oConexion);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                try
                {
                    
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {


                            Productos producto = new Productos();

                            producto.Existencias = Convert.ToInt32(dr["Existencias"]);
                            producto.Titulo = dr["Titulo"].ToString();
                            producto.PrecioUnitario = Convert.ToDouble(dr["PrecioUnitario"]);
                            if (dr["CantidadVendida"] != DBNull.Value && dr["TotalVendido"] != DBNull.Value)
                            {
                                producto.CantidadVendida = Convert.ToInt32(dr["CantidadVendida"]);
                               
                                producto.TotalVendido = Convert.ToDouble(dr["TotalVendido"]);
                            }
                           
                                
                     
                            listaP.Add(producto);
                        }
                    }

                    return listaP;
                }
                catch (Exception e)
                {
                    Console.WriteLine("Error al obtener la lista de ventas: " + e.Message);
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

    }
}
