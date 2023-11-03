using BackExamen.Data;
using serverTenis.Models;
using System.Data.SqlClient;
using System.Net;
using tenis.Models;

namespace tenis.Data
{
    public class ProveedoresData
    {

        public static dynamic RegistrarProvedor(Provedor pro)
        {


            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_insertar_proveedor", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@nombreP", System.Data.SqlDbType.VarChar)).Value = pro.Nombre;
                    cmd.Parameters.Add(new SqlParameter("@telefono", System.Data.SqlDbType.VarChar)).Value = pro.Telefono;
                    cmd.Parameters.Add(new SqlParameter("@estado", System.Data.SqlDbType.VarChar)).Value = pro.Domicilio.Estado;
                    cmd.Parameters.Add(new SqlParameter("@municipio", System.Data.SqlDbType.VarChar)).Value = pro.Domicilio.Municipio;
                    cmd.Parameters.Add(new SqlParameter("@codigoPostal", System.Data.SqlDbType.Int)).Value = pro.Domicilio.CodigoPostal;
                    cmd.Parameters.Add(new SqlParameter("@colonia", System.Data.SqlDbType.VarChar)).Value = pro.Domicilio.Colonia;
                    cmd.Parameters.Add(new SqlParameter("@calle", System.Data.SqlDbType.VarChar)).Value = pro.Domicilio.Calle;
                    cmd.Parameters.Add(new SqlParameter("@numeroExt", System.Data.SqlDbType.Int)).Value = pro.Domicilio.NumeroExt;

                    if (pro.Domicilio.NumeroInt == null || pro.Domicilio.NumeroInt == 0)
                    {
                        cmd.Parameters.Add(new SqlParameter("@numeroInt", System.Data.SqlDbType.Int)).Value = DBNull.Value;
                    }
                    else
                    {
                        cmd.Parameters.Add(new SqlParameter("@numeroInt", System.Data.SqlDbType.Int)).Value = pro.Domicilio.NumeroInt;
                    }



                    cmd.Parameters.Add(new SqlParameter("@referencia", System.Data.SqlDbType.VarChar)).Value = pro.Domicilio.Referencia;
                    int rowsAffected = cmd.ExecuteNonQuery();
                    // Si se realizó correctamente, devolver un código de estado 200 OK
                    return new HttpResponseMessage(HttpStatusCode.OK)
                    {
                        Content = new StringContent("Se ha agregado el proveedor")
                    };

                }
                catch (Exception e)
                {
                    // Si ocurrió una excepción, devolver un código de estado 500 Internal Server Error
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al dar de alta el proveedor" + e.Message)
                    };
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }


        public static HttpResponseMessage BajaProvedor(int idProvedor)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {
                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_baja_proveedor", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@id", System.Data.SqlDbType.VarChar)).Value = idProvedor;

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Si se realizó correctamente, devolver un código de estado 200 OK
                        return new HttpResponseMessage(HttpStatusCode.OK)
                        {
                            Content = new StringContent("Se ha modificado el estado del proveedor")
                        };
                    }
                    else
                    {
                        // Si no se modificó nada, devolver un código de estado 404 Not Found
                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("El proveedor no fue encontrado o no se pudo modificar su estado")
                        };
                    }
                }
                catch (Exception e)
                {
                    // Si ocurrió una excepción, devolver un código de estado 500 Internal Server Error
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al cambiar el estado del proveedor. Ponte en contacto con el guapo: " + e.Message)
                    };
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic MostarProvedoresInActivos()
        {

            List<Provedore> prove = new List<Provedore>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostar_proveedores_inactivos", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Provedore pro = new Provedore()
                            {
                                idProveedor =Convert.ToInt32(dr["proovedoresId"]),
                                Nombre=dr["nombreProvedor"].ToString(),
                                Telefono = dr["telefono"].ToString(),
                                Estatus = Convert.ToInt32(dr["estatus"]),
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

                            };

                            prove.Add(pro);
                        }
                    }

                    if (prove.Count >0)
                    {
                        return prove;
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                        {
                            Content = new StringContent("Error en la consulta de provedores")
                        }; 
                    }

                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar los proveedores, ponte en contacto con el guapo" + e.Message)
                    }; 
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic MostarProvedoresActivos()
        {

            List<Provedore> prove = new List<Provedore>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostar_proveedores_activos", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Provedore pro = new Provedore()
                            {
                                idProveedor =Convert.ToInt32(dr["proovedoresId"]),
                                Nombre=dr["nombreProvedor"].ToString(),
                                Telefono = dr["telefono"].ToString(),
                                Estatus = Convert.ToInt32(dr["estatus"]),
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
                            };

                            prove.Add(pro);
                        }
                    }

                    if (prove.Count >0)
                    {
                        return prove;
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                        {
                            Content = new StringContent("Error en la consulta de provedores")
                        }; 
                    }

                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar los proveedores, ponte en contacto con el guapo " + e.Message)
                    }; 
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
