using BackExamen.Data;

using System.Data.SqlClient;
using System.Text;
using System.Net;
using tenis.Models;
using serverTenis.Models;
using Microsoft.VisualBasic;

namespace tenis.Data
{
    public class ComprasData
    {
        public static dynamic Comprar(Compras oCompra)
        {

            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {
                try
                {
                    StringBuilder query = new StringBuilder();
                    foreach (DetalleCompra dc in oCompra.Detalles)
                    {
                        query.AppendLine("insert into detalleCompra(idCompra,idDetalleProducto,cantidad,costo) values (¡idcompra!," + dc.IdDetalleProducto +","+dc.Cantidad+","+dc.Costo+")");
                        query.AppendLine("update ProductoDetalle set cantidad_STOCK = cantidad_STOCK -" +dc.Cantidad+"where ProductoDetalle.ProductoDetalleID="+ dc.IdDetalleProducto);

             
             }

                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_registrarCompra", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@IdUsuario", System.Data.SqlDbType.Int)).Value = oCompra.IdUsuario;
                    cmd.Parameters.Add(new SqlParameter("@TotalProducto", System.Data.SqlDbType.Int)).Value = oCompra.CantidadTotalTenis;
                    cmd.Parameters.Add(new SqlParameter("@Total", System.Data.SqlDbType.Float)).Value = oCompra.Total;

                    cmd.Parameters.Add(new SqlParameter("@estado", System.Data.SqlDbType.VarChar)).Value = oCompra.Domicilio.Estado;
                    cmd.Parameters.Add(new SqlParameter("@municipio", System.Data.SqlDbType.VarChar)).Value = oCompra.Domicilio.Municipio;
                    cmd.Parameters.Add(new SqlParameter("@codigoPostal", System.Data.SqlDbType.Int)).Value = oCompra.Domicilio.CodigoPostal;
                    cmd.Parameters.Add(new SqlParameter("@colonia", System.Data.SqlDbType.VarChar)).Value = oCompra.Domicilio.Colonia;
                    cmd.Parameters.Add(new SqlParameter("@calle", System.Data.SqlDbType.VarChar)).Value = oCompra.Domicilio.Calle;
                    cmd.Parameters.Add(new SqlParameter("@numeroExt", System.Data.SqlDbType.Int)).Value = oCompra.Domicilio.NumeroExt;
                    if (oCompra.Domicilio.NumeroInt == null || oCompra.Domicilio.NumeroInt == 0)
                    {
                        cmd.Parameters.Add(new SqlParameter("@numeroInt", System.Data.SqlDbType.Int)).Value = DBNull.Value;
                    }
                    else
                    {
                        cmd.Parameters.Add(new SqlParameter("@numeroInt", System.Data.SqlDbType.Int)).Value = oCompra.Domicilio.NumeroInt;
                    }

                    cmd.Parameters.Add(new SqlParameter("@referencia", System.Data.SqlDbType.VarChar)).Value = oCompra.Domicilio.Referencia;


                    cmd.Parameters.Add(new SqlParameter("@QueryDetalleCompra", System.Data.SqlDbType.NVarChar)).Value = query.ToString();

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        return new HttpResponseMessage(HttpStatusCode.OK)
                        {
                            Content = new StringContent("Compra realizada correctamente")
                        };

                    }
                    else {
                        return new HttpResponseMessage(HttpStatusCode.BadRequest)
                        {
                            Content = new StringContent("La compra no se realizo")
                        };
                    }



                }
                catch (Exception ex)
                {
                    // Si ocurrió una excepción, devolver un código de estado 500 Internal Server Error
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al comprar, ponte en contacto con el guapo: " + ex.Message)
                    };
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }


        public static dynamic CambiarEstatusCompra(EstatusCompra EC)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {
                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_CambiarEstatusCompra", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@estatus", System.Data.SqlDbType.Int)).Value = EC.estatus;
                    cmd.Parameters.Add(new SqlParameter("@idCompra", System.Data.SqlDbType.Int)).Value = EC.idCompra;

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        return new HttpResponseMessage(HttpStatusCode.OK)
                        {
                            Content = new StringContent("Se ha cambiado el estatus de la compra")
                        };
                    }
                    else
                    {

                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("No se pudo modificar el estatus de esta compra")
                        };
                    }
                }
                catch (Exception e)
                {

                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al cambiar el estatus de la compra: " + e.Message)
                    };
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic MostrarComprasPorUsuario(ComprasUser CU)
        {

            List<MostarCompras> compras = new List<MostarCompras>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostarComprasPorUsuario", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@idUsuario", System.Data.SqlDbType.Int)).Value = CU.idUsuario;
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            MostarCompras MC = new MostarCompras()
                            {
                                IdCompra =Convert.ToInt32(dr["idCompra"]),
                                fecha = Convert.ToDateTime(dr["fechaCompra"]).ToString("dd-MM-yyyy"),
                                CantidadTotalTenis =Convert.ToInt32(dr["CantidadTotalTenis"]),
                                IdUsuario =Convert.ToInt32(dr["idUsuario"]),
                                Total = Convert.ToDouble(dr["Total"]),
                                Domicilio = new Domicilio()
                                {
                                    Estado = dr["estado"].ToString(),
                                    Municipio = dr["municipio"].ToString(),
                                    CodigoPostal = Convert.ToInt32(dr["codigoPostal"]),
                                    Colonia = dr["colonia"].ToString(),
                                    Calle = dr["calle"].ToString(),
                                    NumeroExt = Convert.ToInt32(dr["numeroExt"]),
                                    NumeroInt = dr.IsDBNull(dr.GetOrdinal("numeroInt")) ? (int?)null : dr.GetInt32(dr.GetOrdinal("numeroInt")),
                                    Referencia = dr["referencia"].ToString(),


                                },
                                estatus = Convert.ToInt32(dr["estatus"]),
                                descripccionEstatus = dr["descripcionEstatus"].ToString()



                            };

                            compras.Add(MC);
                        }
                    }
                    if (compras.Count >0)
                    {
                        return compras;
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("Error en la consulta de las compras")
                        };
                    }



                }
                catch (Exception e)
                {
                    return e.Message; /*new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar las compras" + e.Message)
                    };*/
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }

        }
        

        public static dynamic MostrarComprasDetalles(idCompra id)
        {

            List<MostarDECompras> compras = new List<MostarDECompras>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostarDetalleCompras", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@idCompra", System.Data.SqlDbType.Int)).Value = id.idCompras;
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            MostarDECompras MC = new MostarDECompras()
                            {
                                cantidad =Convert.ToInt32(dr["cantidad"]),
                                subtotal = Convert.ToDouble(dr["subtotal"]),
                                punto =Convert.ToDouble(dr["punto"]),
                                nombre =dr["nombre"].ToString(),
                                precioUnitario = Convert.ToDouble(dr["precioUnitario"]),
                                descripccion = dr["descripccion"].ToString(),
                                image_name = dr["image_name"].ToString()



                            };

                            compras.Add(MC);
                        }
                    }
                    if (compras.Count >0)
                    {
                        return compras;
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("Error en la consulta del detalle de las compras")
                        };
                    }



                }
                catch (Exception e)
                {
                    return e.Message; /*new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar las compras" + e.Message)
                    };*/
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }


        public static dynamic MostrarComprasAdmin()
        {

            List<ComprasAdmin> compras = new List<ComprasAdmin>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostarComprasADMIN", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            ComprasAdmin MC = new ComprasAdmin()
                            {
                                IdCompra =Convert.ToInt32(dr["idCompra"]),
                                fecha = Convert.ToDateTime(dr["fechaCompra"]).ToString("dd-MM-yyyy"),
                                CantidadTotalTenis =Convert.ToInt32(dr["CantidadTotalTenis"]),
                                Total = Convert.ToDouble(dr["Total"]),
                                nombre = dr["nombre"].ToString(),
                                correo = dr["correo"].ToString(),

                                Domicilio = new Domicilio()
                                {
                                    Estado = dr["estado"].ToString(),
                                    Municipio = dr["municipio"].ToString(),
                                    CodigoPostal = Convert.ToInt32(dr["codigoPostal"]),
                                    Colonia = dr["colonia"].ToString(),
                                    Calle = dr["calle"].ToString(),
                                    NumeroExt = Convert.ToInt32(dr["numeroExt"]),
                                    NumeroInt = dr.IsDBNull(dr.GetOrdinal("numeroInt")) ? (int?)null : dr.GetInt32(dr.GetOrdinal("numeroInt")),
                                    Referencia = dr["referencia"].ToString(),


                                },
                                descripccionEstatus = dr["descripcionEstatus"].ToString()



                            };

                            compras.Add(MC);
                        }
                    }
                    if (compras.Count >0)
                    {
                        return compras;
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("Error en la consulta de las compras"),
                            Version = new Version(1, 1),
                            ReasonPhrase = "Not Found"
                        };
                    }



                }
                catch (Exception e)
                {
                    return e.Message; /*new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar las compras" + e.Message)
                    };*/
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

