using BackExamen.Data;
using serverTenis.Models;
using System.Net;
using System.Data.SqlClient;

namespace tenis.Data
{
    public class RegistrarseData
    {

        public static dynamic Registrar(Usuario usuario)
        {
          

            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd1 = new SqlCommand("sp_verificar_correo_existente", oConexion);
                    cmd1.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd1.Parameters.Add(new SqlParameter("@correo", System.Data.SqlDbType.VarChar)).Value = usuario.Correo;

                    int correoExistente = (int)cmd1.ExecuteScalar();

                    if (correoExistente != 1)
                    {

                        SqlCommand cmd = new SqlCommand("sp_registrar_usuario", oConexion);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add(new SqlParameter("@estado", System.Data.SqlDbType.VarChar)).Value = usuario.Domicilio.Estado;
                        cmd.Parameters.Add(new SqlParameter("@municipio", System.Data.SqlDbType.VarChar)).Value = usuario.Domicilio.Municipio;
                        cmd.Parameters.Add(new SqlParameter("@codigoPostal", System.Data.SqlDbType.Int)).Value = usuario.Domicilio.CodigoPostal;
                        cmd.Parameters.Add(new SqlParameter("@colonia", System.Data.SqlDbType.VarChar)).Value = usuario.Domicilio.Colonia;
                        cmd.Parameters.Add(new SqlParameter("@calle", System.Data.SqlDbType.VarChar)).Value = usuario.Domicilio.Calle;
                        cmd.Parameters.Add(new SqlParameter("@numeroExt", System.Data.SqlDbType.Int)).Value = usuario.Domicilio.NumeroExt;

                        if (usuario.Domicilio.NumeroInt == null || usuario.Domicilio.NumeroInt == 0)
                        {
                            cmd.Parameters.Add(new SqlParameter("@numeroInt", System.Data.SqlDbType.Int)).Value = DBNull.Value;
                        }
                        else {
                            cmd.Parameters.Add(new SqlParameter("@numeroInt", System.Data.SqlDbType.Int)).Value = usuario.Domicilio.NumeroInt;
                        }

                        

                        cmd.Parameters.Add(new SqlParameter("@referencia", System.Data.SqlDbType.VarChar)).Value = usuario.Domicilio.Referencia;
                        cmd.Parameters.Add(new SqlParameter("@nombre", System.Data.SqlDbType.VarChar)).Value = usuario.Nombre;


                        cmd.Parameters.Add(new SqlParameter("@correo", System.Data.SqlDbType.VarChar)).Value = usuario.Correo;


                        cmd.Parameters.Add(new SqlParameter("@contrasenia", System.Data.SqlDbType.VarChar)).Value = usuario.Contrasenia;


                        if (usuario.IdRole == null || usuario.IdRole == 0)
                        {
                            cmd.Parameters.Add(new SqlParameter("@idRole", System.Data.SqlDbType.Int)).Value = 3;
                        }
                        else { 
                            cmd.Parameters.Add(new SqlParameter("@idRole", System.Data.SqlDbType.Int)).Value = usuario.IdRole;

                        }


                        int rowsAffected = cmd.ExecuteNonQuery();
                        // Si se realizó correctamente, devolver un código de estado 200 OK
                        return new HttpResponseMessage(HttpStatusCode.OK)
                        {
                            Content = new StringContent("Usuario insertado correctamente")
                        };
                    }
                    else
                    {
                        // Si el correo ya existe, devolver un código de estado 409 Conflict
                        return new HttpResponseMessage(HttpStatusCode.Conflict)
                        {
                            Content = new StringContent("Este correo ya está en uso")
                        };
                    }
                }
                catch (Exception e)
                {
                    // Si ocurrió una excepción, devolver un código de estado 500 Internal Server Error
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al registrar, ponte en contacto con el guapo: " + e.Message)
                    };
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic ActualizarUsuario(DomicilioI DomI)
        {


            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

               

                        SqlCommand cmd = new SqlCommand("sp_atualizar_usuario", oConexion);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add(new SqlParameter("@idUsuario", System.Data.SqlDbType.Int)).Value = DomI.IdUsuario;

                        cmd.Parameters.Add(new SqlParameter("@estado", System.Data.SqlDbType.VarChar)).Value = DomI.Estado;
                        cmd.Parameters.Add(new SqlParameter("@municipio", System.Data.SqlDbType.VarChar)).Value = DomI.Municipio;
                        cmd.Parameters.Add(new SqlParameter("@codigoPostal", System.Data.SqlDbType.Int)).Value = DomI.CodigoPostal;
                        cmd.Parameters.Add(new SqlParameter("@colonia", System.Data.SqlDbType.VarChar)).Value = DomI.Colonia;
                        cmd.Parameters.Add(new SqlParameter("@calle", System.Data.SqlDbType.VarChar)).Value = DomI.Calle;
                        cmd.Parameters.Add(new SqlParameter("@numeroExt", System.Data.SqlDbType.Int)).Value = DomI.NumeroExt;

                        if (DomI.NumeroInt == null || DomI.NumeroInt == 0)
                        {
                            cmd.Parameters.Add(new SqlParameter("@numeroInt", System.Data.SqlDbType.Int)).Value = DBNull.Value;
                        }
                        else
                        {
                            cmd.Parameters.Add(new SqlParameter("@numeroInt", System.Data.SqlDbType.Int)).Value = DomI.NumeroInt;
                        }
                        cmd.Parameters.Add(new SqlParameter("@referencia", System.Data.SqlDbType.VarChar)).Value = DomI.Referencia;


                        int rowsAffected = cmd.ExecuteNonQuery();
                        // Si se realizó correctamente, devolver un código de estado 200 OK
                        return new HttpResponseMessage(HttpStatusCode.OK)
                        {
                            Content = new StringContent("Usuario actualizado correctamente")
                        };

                                  }
                catch (Exception e)
                {
                    // Si ocurrió una excepción, devolver un código de estado 500 Internal Server Error
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al actualizar, ponte en contacto con el guapo: " + e.Message)
                    };
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic RegistraEmpleado(Usuario usuario)
        {


            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd1 = new SqlCommand("sp_verificar_correo_existente", oConexion);
                    cmd1.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd1.Parameters.Add(new SqlParameter("@correo", System.Data.SqlDbType.VarChar)).Value = usuario.Correo;

                    int correoExistente = (int)cmd1.ExecuteScalar();

                    if (correoExistente != 1)
                    {

                        SqlCommand cmd = new SqlCommand("sp_registrar_usuario", oConexion);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add(new SqlParameter("@estado", System.Data.SqlDbType.VarChar)).Value = usuario.Domicilio.Estado;
                        cmd.Parameters.Add(new SqlParameter("@municipio", System.Data.SqlDbType.VarChar)).Value = usuario.Domicilio.Municipio;
                        cmd.Parameters.Add(new SqlParameter("@codigoPostal", System.Data.SqlDbType.Int)).Value = usuario.Domicilio.CodigoPostal;
                        cmd.Parameters.Add(new SqlParameter("@colonia", System.Data.SqlDbType.VarChar)).Value = usuario.Domicilio.Colonia;
                        cmd.Parameters.Add(new SqlParameter("@calle", System.Data.SqlDbType.VarChar)).Value = usuario.Domicilio.Calle;
                        cmd.Parameters.Add(new SqlParameter("@numeroExt", System.Data.SqlDbType.Int)).Value = usuario.Domicilio.NumeroExt;

                        if (usuario.Domicilio.NumeroInt == null || usuario.Domicilio.NumeroInt == 0)
                        {
                            cmd.Parameters.Add(new SqlParameter("@numeroInt", System.Data.SqlDbType.Int)).Value = DBNull.Value;
                        }
                        else
                        {
                            cmd.Parameters.Add(new SqlParameter("@numeroInt", System.Data.SqlDbType.Int)).Value = usuario.Domicilio.NumeroInt;
                        }



                        cmd.Parameters.Add(new SqlParameter("@referencia", System.Data.SqlDbType.VarChar)).Value = usuario.Domicilio.Referencia;
                        cmd.Parameters.Add(new SqlParameter("@nombre", System.Data.SqlDbType.VarChar)).Value = usuario.Nombre;


                        cmd.Parameters.Add(new SqlParameter("@correo", System.Data.SqlDbType.VarChar)).Value = usuario.Correo;


                        cmd.Parameters.Add(new SqlParameter("@contrasenia", System.Data.SqlDbType.VarChar)).Value = usuario.Contrasenia;


                        if (usuario.IdRole == null || usuario.IdRole == 0)
                        {
                            cmd.Parameters.Add(new SqlParameter("@idRole", System.Data.SqlDbType.Int)).Value = 3;
                        }
                        else
                        {
                            cmd.Parameters.Add(new SqlParameter("@idRole", System.Data.SqlDbType.Int)).Value = usuario.IdRole;

                        }


                        int rowsAffected = cmd.ExecuteNonQuery();
                        // Si se realizó correctamente, devolver un código de estado 200 OK
                        return new HttpResponseMessage(HttpStatusCode.OK)
                        {
                            Content = new StringContent("Empleado insertado correctamente")
                        };
                    }
                    else
                    {
                        // Si el correo ya existe, devolver un código de estado 409 Conflict
                        return new HttpResponseMessage(HttpStatusCode.Conflict)
                        {
                            Content = new StringContent("Este correo ya está en uso")
                        };
                    }
                }
                catch (Exception e)
                {
                    // Si ocurrió una excepción, devolver un código de estado 500 Internal Server Error
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al registrar, ponte en contacto con el guapo: " + e.Message)
                    };
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

    }
}
