using BackExamen.Data;
using serverTenis.Models;
using System.Data.SqlClient;
using System.Globalization;
using System.Net;
using tenis.Models;

namespace tenis.Data
{
    public class MateriaPrimaData
    {


        public static dynamic RegistrarMateriaPrima(MateriaPrima MP)
        {


            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    int siExiste = 0;
                    oConexion.Open();

                    string consulta = "SELECT proovedoresId, estatus FROM provedores WHERE proovedoresId = @idProveedor";
                    SqlCommand cmd1 = new SqlCommand(consulta, oConexion);
                    cmd1.Parameters.AddWithValue("@idProveedor", MP.provedoresId);

                    using (SqlDataReader reader = cmd1.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int idProveedor = Convert.ToInt32(reader["proovedoresId"]);
                            int estatus = Convert.ToInt32(reader["estatus"]);

                            if (estatus == 1)
                            {
                                siExiste = 1;
                                break;
                            }
                            else if (estatus == 0)
                            {
                                siExiste = 2;
                                break;
                            }
                            else
                            {
                                siExiste = 3;
                            }
                        }
                    }

                    if (siExiste == 1)
                    {
                        SqlCommand cmd = new SqlCommand("sp_nueva_materiaPrima", oConexion);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add(new SqlParameter("@proovedoresId", System.Data.SqlDbType.Int)).Value = MP.provedoresId;
                        cmd.Parameters.Add(new SqlParameter("@nombreMateriaPrima", System.Data.SqlDbType.VarChar)).Value = MP.nombreMateriaPrima;
                        cmd.Parameters.Add(new SqlParameter("@unidadMedida", System.Data.SqlDbType.VarChar)).Value = MP.unidadMedida;
                        cmd.Parameters.Add(new SqlParameter("@costo", System.Data.SqlDbType.Float)).Value = MP.costo; 
                        cmd.Parameters.Add(new SqlParameter("@image_name", System.Data.SqlDbType.VarChar)).Value = MP.image_name;

                        int rowsAffected = cmd.ExecuteNonQuery();
                        return new HttpResponseMessage(HttpStatusCode.OK)
                        {
                            Content = new StringContent("Se ha agregado el proveedor")
                        };
                    }
                    else if (siExiste == 2)
                    {
                        return new HttpResponseMessage(HttpStatusCode.Conflict)
                        {
                            Content = new StringContent("No se pudo agregar la materia prima porque el proveedor esta dado de baja, dalo de alta e intentalo nuevamente")
                        };
                    }
                    else {
                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("No se pudo agregar la materia prima porque el proveedor No existe")
                        };
                    }


                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al registrar la materia prima dile al leo:"+e.Message)
                    };
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }


        public static dynamic MostarTodaMateriaPrima()
        {

            List<MateriaPrimaE> mate = new List<MateriaPrimaE>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostrar_materiaPrima", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            MateriaPrimaE mp = new MateriaPrimaE()
                            {
                                materiaPrimaId =Convert.ToInt32(dr["materiaPrimaId"]),
                                provedoresId=Convert.ToInt32(dr["proovedoresId"]),
                                nombreMateriaPrima = dr["nombreMateriaPrima"].ToString(),
                                unidadMedida = dr["unidadMedida"].ToString(),
                                cantidadTotal = Convert.ToInt32(dr["cantidadTotal"]),
                                costo = Convert.ToDouble(dr["costo"]),
                                image_name = dr["image_name"].ToString()

                            };

                            mate.Add(mp);
                        }
                    }

                    if (mate.Count >0)
                    {
                        return mate;
                    }
                    else
                    {
                         return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                        {
                            Content = new StringContent("Error en la consulta de la materia prima")
                        };
                    }

                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar la materia prima, ponte en contacto con el guapo" + e.Message)
                    }; 
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic MostarMateriaPrimaNormal()
        {

            List<MateriaPrimaE> mate = new List<MateriaPrimaE>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostrar_materiaPrimaNormal", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            MateriaPrimaE mp = new MateriaPrimaE()
                            {
                                materiaPrimaId =Convert.ToInt32(dr["materiaPrimaId"]),
                                provedoresId=Convert.ToInt32(dr["proovedoresId"]),
                                nombreMateriaPrima = dr["nombreMateriaPrima"].ToString(),
                                unidadMedida = dr["unidadMedida"].ToString(),
                                cantidadTotal = Convert.ToInt32(dr["cantidadTotal"]),
                                costo = Convert.ToDouble(dr["costo"]),
                                image_name = dr["image_name"].ToString()

                            };

                            mate.Add(mp);
                        }
                    }

                    if (mate.Count >0)
                    {
                        return mate;
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                        {
                            Content = new StringContent("Error en la consulta de la materia prima")
                        };
                    }

                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar la materia prima, ponte en contacto con el guapo" + e.Message)
                    };
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }


        public static dynamic MostarComprasMateriaPrima()
        {

            List<ComprasMateriaPrima> CMP = new List<ComprasMateriaPrima>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostrar_comprasMateriaPrima", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            ComprasMateriaPrima mp = new ComprasMateriaPrima()
                            {
                                compraMateriaPrimaId =Convert.ToInt32(dr["compraMateriaPrimaId"]),
                                materiaPrimaId =Convert.ToInt32(dr["materiaPrimaId"]),
                                cantidadCompra=Convert.ToInt32(dr["cantidadCompra"]),
                                pagoTotal = Convert.ToDouble(dr["pagoTotal"]),
                                fecha = Convert.ToDateTime(dr["fecha"]).ToString("dd-MM-yyyy"),
                                materiaPrima = new MateriaPrimaE()
                                {
                                    materiaPrimaId =Convert.ToInt32(dr["materiaPrimaId"]),
                                    provedoresId=Convert.ToInt32(dr["proovedoresId"]),
                                    nombreMateriaPrima = dr["nombreMateriaPrima"].ToString(),
                                    unidadMedida = dr["unidadMedida"].ToString(),
                                    cantidadTotal = Convert.ToInt32(dr["cantidadTotal"]),
                                    costo = Convert.ToDouble(dr["costo"]),
                                    image_name = dr["image_name"].ToString()

                                }



                            };

                            CMP.Add(mp);
                        }
                    }

                    if (CMP.Count >0)
                    {
                        return CMP;
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                        {
                            Content = new StringContent("Error en la consulta de las compras de materia prima")
                        }; 
                    }

                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar las compras de materia prima, ponte en contacto con el guapo" + e.Message)
                    }; 
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }


        public static dynamic ComprarMateriaPrima(ComprasMateriaPrimaI CMPI)
        {


            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    int siExiste = 0;
                    oConexion.Open();

                    dynamic MP = MostarTodaMateriaPrima();

                    foreach (MateriaPrimaE MPE in MP)
                    {
                        if (MPE.materiaPrimaId == CMPI.materiaPrimaId)
                        {
                            siExiste=1;
                            break;
                        }
                        else
                        {
                            siExiste=2;
                        }
                    }

                    if (siExiste == 1)
                    {
                        SqlCommand cmd = new SqlCommand("sp_comprar_materiaPrima", oConexion);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add(new SqlParameter("@materiaPrimaId", System.Data.SqlDbType.Int)).Value = CMPI.materiaPrimaId;
                        cmd.Parameters.Add(new SqlParameter("@cantidadCompra", System.Data.SqlDbType.VarChar)).Value = CMPI.cantidadCompra;
                        cmd.Parameters.Add(new SqlParameter("@pagoTotal", System.Data.SqlDbType.Float)).Value = CMPI.pagoTotal;

                        int rowsAffected = cmd.ExecuteNonQuery();
                        return new HttpResponseMessage(HttpStatusCode.OK)
                        {
                            Content = new StringContent("Compra de Materia prima realizada con exito con exito")
                        };
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("No se pudo comprar la materia prima porque no existe, da de alta la meteria prima")
                        };

                    }


                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al comprar la materia prima dile al guapo:")
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
