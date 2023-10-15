using BackExamen.Data;
using System.Net;
using serverTenis.Models;
using System.Data.SqlClient;


namespace serverTenis.Data
{
    public class LoginData
    {

        public static dynamic login(string contrasenia, string correo)
        {
            List<UsuarioID> usuarios = new List<UsuarioID>();

            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                SqlCommand cmd = new SqlCommand("sp_consultar_usuario", oConexion);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@email", System.Data.SqlDbType.VarChar)).Value = correo;
                cmd.Parameters.Add(new SqlParameter("@pass", System.Data.SqlDbType.VarChar)).Value = contrasenia;

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            UsuarioID user = new UsuarioID()
                            {
                                IdUsuario=Convert.ToInt32(dr["idUsuario"]),
                                Nombre = dr["nombre"].ToString(),
                                Correo = dr["correo"].ToString(),
                                Contrasenia = dr["contrasenia"].ToString(),
                                IdRole =  Convert.ToInt32(dr["idRole"]),
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

                            usuarios.Add(user);
                        }
                    }

                    return usuarios;                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al iniciar sesion hablale al programador, pinche imbecil:" + e.Message)
                    }; 
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic consultarDomicilio(UsuarioIDDomi id)
        {
            List<Domicilio> domicilio = new List<Domicilio>();

            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_consultarDomicilio", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@idUsuario", System.Data.SqlDbType.VarChar)).Value = id.IdUsuario;

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            

                               Domicilio Domicilio = new Domicilio()
                                {
                                    Estado = dr["estado"].ToString(),
                                    Municipio = dr["municipio"].ToString(),
                                    CodigoPostal = Convert.ToInt32(dr["codigoPostal"]),
                                    Colonia = dr["colonia"].ToString(),
                                    Calle = dr["calle"].ToString(),
                                    NumeroExt = Convert.ToInt32(dr["numeroExt"]),
                                    NumeroInt = dr.IsDBNull(dr.GetOrdinal("numeroInt")) ? (int?)null : dr.GetInt32(dr.GetOrdinal("numeroInt")),
                                    Referencia = dr["referencia"].ToString(),


                                };

                            domicilio.Add(Domicilio);
                        }
                    }

                    if (domicilio.Count >0)
                    {
                        return domicilio;
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("Fallo en la consulta del domicilio")
                        };
                    }


                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar hablale al programador, pinche imbecil:" + e.Message)
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
