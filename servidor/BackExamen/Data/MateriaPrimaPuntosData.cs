using BackExamen.Data;
using System.Data.SqlClient;
using System.Net;
using tenis.Models;

namespace tenis.Data
{
    public class MateriaPrimaPuntosData
    {
        public static dynamic ComprarMateriaPrimaPuntos(ComprasMateriaPrimaPuntosI CMPPI)
        {


            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    int siExiste = 0;
                    oConexion.Open();

                    dynamic MP = MateriaPrimaData.MostarTodaMateriaPrima();

                    foreach (MateriaPrimaE MPE in MP)
                    {
                        if (MPE.materiaPrimaId == CMPPI.materiaPrimaId)
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
                        SqlCommand cmd = new SqlCommand("sp_comprar_materiaPrimaPunto", oConexion);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add(new SqlParameter("@materiaPrimaId", System.Data.SqlDbType.Int)).Value = CMPPI.materiaPrimaId;
                        cmd.Parameters.Add(new SqlParameter("@cantidadCompra", System.Data.SqlDbType.VarChar)).Value = CMPPI.cantidadCompra;
                        cmd.Parameters.Add(new SqlParameter("@pagoTotal", System.Data.SqlDbType.Float)).Value = CMPPI.pagoTotal;
                        cmd.Parameters.Add(new SqlParameter("@punto", System.Data.SqlDbType.Float)).Value = CMPPI.punto;

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

        public static dynamic MostarMateriaPrimaPuntos()
        {

            List<MateriaPrimaE> mate = new List<MateriaPrimaE>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostrar_materiaPrimaPuntos", oConexion);
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
                                unidadMedida= dr["unidadMedida"].ToString(),
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

        public static dynamic MostarComprasMateriaPrimaPunto()
        {

            List<MateriaPrimaPunto> CMP = new List<MateriaPrimaPunto>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostrarComprasPuntos", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            MateriaPrimaPunto mp = new MateriaPrimaPunto()
                            {
                                materiaPrimaId =Convert.ToInt32(dr["materiaPrimaId"]),
                                punto=Convert.ToDouble(dr["punto"]),
                           

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

    }
}
