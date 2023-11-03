using BackExamen.Data;
using BackExamen.Models;
using System;
using System.Data.SqlClient;
using System.Net;
using System.Security.Cryptography;
using tenis.Models;

namespace tenis.Data
{
    public class ProductoData
    {
        public static dynamic RegistrarProductoNuevo(Producto P)
        {


            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_productoNuevo", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@nombre", System.Data.SqlDbType.VarChar)).Value = P.Nombre;
                    cmd.Parameters.Add(new SqlParameter("@precio", System.Data.SqlDbType.Float)).Value = P.Precio;
                    cmd.Parameters.Add(new SqlParameter("@descripccion", System.Data.SqlDbType.VarChar)).Value = P.Descripcion;
                    cmd.Parameters.Add(new SqlParameter("@image_name", System.Data.SqlDbType.VarChar)).Value = P.ImageName;

                    int rowsAffected = cmd.ExecuteNonQuery();
                    return new HttpResponseMessage(HttpStatusCode.OK)
                    {
                        Content = new StringContent("Se ha agregado el nuevo producto")
                    };


                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al registrar el nuevo producto")
                    };
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }


        public static dynamic MostrarProductosActivos()
        {

            List<ProductoE> pro = new List<ProductoE>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostarProductosActivos", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            ProductoE PE = new ProductoE()
                            {
                                idProducto =Convert.ToInt32(dr["idProducto"]),
                                nombre=dr["nombre"].ToString(),
                                precio = Convert.ToDouble(dr["precio"]),
                                descripccion = dr["descripccion"].ToString(),
                                image_name = dr["image_name"].ToString(),
                                estatus = Convert.ToInt32(dr["estatus"])


                            };

                            pro.Add(PE);
                        }
                    }

                    if (pro.Count >0)
                    {
                        return pro;
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                        {
                            Content = new StringContent("Error en la consulta de los productos")
                        };
                    }

                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar los productos" + e.Message)
                    };
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic MostrarProductosInActivos()
        {

            List<ProductoE> pro = new List<ProductoE>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_mostarProductosInactivos", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            ProductoE PE = new ProductoE()
                            {
                                idProducto =Convert.ToInt32(dr["idProducto"]),
                                nombre=dr["nombre"].ToString(),
                                precio = Convert.ToDouble(dr["precio"]),
                                descripccion = dr["descripccion"].ToString(),
                                image_name = dr["image_name"].ToString(),
                                estatus = Convert.ToInt32(dr["estatus"])


                            };

                            pro.Add(PE);
                        }
                    }

                    if (pro.Count >0)
                    {
                        return pro;
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("Error en la consulta de los productos")
                        };
                    }

                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar los productos" + e.Message)
                    };
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic CambiarEstatusProducto(ProductoId id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {
                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_estatus_producto", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@idProducto", System.Data.SqlDbType.Int)).Value = id.idProducto;

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        return new HttpResponseMessage(HttpStatusCode.OK)
                        {
                            Content = new StringContent("Se ha cambiado el estatus de este producto")
                        };
                    }
                    else
                    {

                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("No se pudo modificar el estatus de este producto")
                        };
                    }
                }
                catch (Exception e)
                {

                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al cambiar el estado del producto: " + e.Message)
                    };
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }


        public static dynamic RegistrarPuntosProducto(ProductoDetaPuntos P)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {
                try
                {
                    int existe = 0;
                    ProductoId id = new ProductoId();
                    id.idProducto = P.idProducto;
                    dynamic MDP = MostrarDetalleProductos(id);

                    if (MDP is HttpResponseMessage)
                    {
                        oConexion.Open();
                        SqlCommand cmd = new SqlCommand("sp_ProductoDetalle", oConexion);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add(new SqlParameter("@idProducto", System.Data.SqlDbType.Int)).Value = P.idProducto;
                        cmd.Parameters.Add(new SqlParameter("@punto", System.Data.SqlDbType.Float)).Value = P.punto;

                        int rowsAffected = cmd.ExecuteNonQuery();
                        return new HttpResponseMessage(HttpStatusCode.OK);
                    }
                    else
                    {
                        foreach (ProductoDetaPuntosIds PDP in MDP)
                        {
                            if (PDP.punto == P.punto)
                            {
                                existe = 1; // el punto ya existe
                                break;
                            }
                            else
                            {
                                existe = 2; // el punto no existe
                            }
                        }

                        if (existe == 2)
                        {
                            oConexion.Open();
                            SqlCommand cmd = new SqlCommand("sp_ProductoDetalle", oConexion);
                            cmd.CommandType = System.Data.CommandType.StoredProcedure;

                            cmd.Parameters.Add(new SqlParameter("@idProducto", System.Data.SqlDbType.Int)).Value = P.idProducto;
                            cmd.Parameters.Add(new SqlParameter("@punto", System.Data.SqlDbType.Float)).Value = P.punto;

                            int rowsAffected = cmd.ExecuteNonQuery();
                            return new HttpResponseMessage(HttpStatusCode.OK);
                        }
                        else
                        {
                            return new HttpResponseMessage(HttpStatusCode.Conflict);
                        }
                      
                    }
                }
                catch (Exception e)
                {
                    // Si deseas devolver el mensaje de error, puedes usar una cadena o una clase personalizada
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al registrar el nuevo punto del producto"+  e.Message)
                    };
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }


        public static dynamic MostrarDetalleProductos(ProductoId ProID)
        {

            List<ProductoDetaPuntosIds> products = new List<ProductoDetaPuntosIds>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    int activo = 0;
                    oConexion.Open();

                    dynamic ProAct = MostrarProductosActivos();
                    foreach (ProductoE PE in ProAct)
                    {
                        if (PE.idProducto == ProID.idProducto)
                        {
                            activo=1;
                            break;
                        }
                        else
                        {
                            activo=2;
                        }
                    }


                    if (activo == 1)
                    {
                        SqlCommand cmd = new SqlCommand("sp_mostrar_puntosProducto", oConexion);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add(new SqlParameter("@idProducto", System.Data.SqlDbType.Int)).Value = ProID.idProducto;
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                ProductoDetaPuntosIds PDPI = new ProductoDetaPuntosIds()
                                {
                                    idProductoDetalle =Convert.ToInt32(dr["ProductoDetalleID"]),
                                    Producto=new ProductoE()
                                    {
                                        idProducto =Convert.ToInt32(dr["idProducto"]),
                                        nombre=dr["nombre"].ToString(),
                                        precio = Convert.ToDouble(dr["precio"]),
                                        descripccion = dr["descripccion"].ToString(),
                                        image_name = dr["image_name"].ToString(),
                                        estatus = Convert.ToInt32(dr["estatus"])
                                    },
                                    punto = Convert.ToDouble(dr["punto"]),
                                    cantidad = Convert.ToInt32(dr["cantidad_STOCK"]),


                                };

                                products.Add(PDPI);
                            }
                        }
                        if (products.Count >0)
                        {
                            return products;
                        }
                        else
                        {
                            return new HttpResponseMessage(HttpStatusCode.NotFound)
                            {
                                Content = new StringContent("Error en la consulta del detalle del producto")
                            };
                        }

                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("No se pudo consultar la informacion porque el producto esta dado de baja, dalo de alta e intenta nuevamente")
                        };
                    }



                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al consultar el detalle del producto" + e.Message)
                    };
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic RegistrarDetalleMateriaDelProductoPorPunto(ProductoMateriaDetallePuntos PMDP)
        {


            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    dynamic MPCP = MateriaPrimaPuntosData.MostarComprasMateriaPrimaPunto();
                    int existe1 = 0;
                    int existe = 0;
                    double punto = 0;
                    int idProducto = 0;
                    ProductoDetalleId pd = new ProductoDetalleId();

                    pd.idProductoDetalle = PMDP.idProductoDetalle;
                    dynamic MDMP = MostrarDetalleMateriaProductosPorPuntos(pd);

                    if (MPCP is HttpResponseMessage)
                    {
                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("Compra materia prima por puntos primero")
                        };

                    }
                    else
                    {
                        foreach (MateriaPrimaPunto MPP in MPCP)
                        {
                            if (MPP.materiaPrimaId == PMDP.materiaPrimaId)
                            {
                                existe1=1;
                                punto=MPP.punto;
                                break;
                            }
                            else
                            {
                                existe1=2;
                            }
                        }
                    }

                    if (existe1==2) { 
                    if (MDMP is HttpResponseMessage)
                    {
                        oConexion.Open();

                        SqlCommand cmd = new SqlCommand("sp_DetalleMateriaProducto", oConexion);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add(new SqlParameter("@idProductoDetalle", System.Data.SqlDbType.Int)).Value = PMDP.idProductoDetalle;
                        cmd.Parameters.Add(new SqlParameter("@materiaPrimaId", System.Data.SqlDbType.Int)).Value = PMDP.materiaPrimaId;
                        cmd.Parameters.Add(new SqlParameter("@cantidadUsoMateria", System.Data.SqlDbType.Float)).Value = PMDP.cantidadUsoMateria;

                        int rowsAffected = cmd.ExecuteNonQuery();
                        return new HttpResponseMessage(HttpStatusCode.OK)
                        {
                            Content = new StringContent("Se ha agregado la materia prima a este punto")
                        };
                    }
                    else
                    {

                        foreach (ProductoMateriaDetallePuntosID PMDPI in MDMP)
                        {
                            if (PMDPI.materiaPrima.materiaPrimaId == PMDP.materiaPrimaId)
                            {
                                existe=1;//La materia ya existe
                                break;
                            }
                            else
                            {
                                existe=2;//La materia no existe
                            }
                        }

                        if (existe == 2)
                        {
                            oConexion.Open();

                            SqlCommand cmd = new SqlCommand("sp_DetalleMateriaProducto", oConexion);
                            cmd.CommandType = System.Data.CommandType.StoredProcedure;

                            cmd.Parameters.Add(new SqlParameter("@idProductoDetalle", System.Data.SqlDbType.Int)).Value = PMDP.idProductoDetalle;
                            cmd.Parameters.Add(new SqlParameter("@materiaPrimaId", System.Data.SqlDbType.Int)).Value = PMDP.materiaPrimaId;
                            cmd.Parameters.Add(new SqlParameter("@cantidadUsoMateria", System.Data.SqlDbType.Float)).Value = PMDP.cantidadUsoMateria;

                            int rowsAffected = cmd.ExecuteNonQuery();
                            return new HttpResponseMessage(HttpStatusCode.OK)
                            {
                                Content = new StringContent("Se ha agregado la materia prima a este punto")
                            };
                        }
                        else
                        {
                            return new HttpResponseMessage(HttpStatusCode.Conflict)
                            {
                                Content = new StringContent("Esta materia prima ya se encuentra en este punto")
                            };
                        }
                    }
                }
                    else {
                        oConexion.Open();
                        ProductoId ProID = new ProductoId();
                        string query = "SELECT TOP 1 productos.idProducto " +
                      "FROM productos " +
                      "INNER JOIN ProductoDetalle ON productos.idProducto = ProductoDetalle.idProducto WHERE ProductoDetalle.ProductoDetalleID ="+PMDP.idProductoDetalle;

                        using (SqlCommand command = new SqlCommand(query, oConexion))
                        {
                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    idProducto = Convert.ToInt32(reader["idProducto"]);

                                }
                            }
                        }
                        
                        ProID.idProducto = idProducto;
                        dynamic VP = MostrarDetalleProductos(ProID);
                        int coinciden = 0;

                      

                            foreach (ProductoDetaPuntosIds pdp in VP)
                        {
                            if (pdp.punto == punto && pdp.idProductoDetalle==PMDP.idProductoDetalle)
                            {
                                coinciden=1;//La materia ya existe
                                break;
                            }
                            else
                            {
                                coinciden=2;//La materia no existe
                            }
                        }

                        if (coinciden == 1)
                        {
                            oConexion.Close();

                            if (MDMP is HttpResponseMessage)
                            {
                                oConexion.Open();

                                SqlCommand cmd = new SqlCommand("sp_DetalleMateriaProducto", oConexion);
                                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                                cmd.Parameters.Add(new SqlParameter("@idProductoDetalle", System.Data.SqlDbType.Int)).Value = PMDP.idProductoDetalle;
                                cmd.Parameters.Add(new SqlParameter("@materiaPrimaId", System.Data.SqlDbType.Int)).Value = PMDP.materiaPrimaId;
                                cmd.Parameters.Add(new SqlParameter("@cantidadUsoMateria", System.Data.SqlDbType.Float)).Value = PMDP.cantidadUsoMateria;

                                int rowsAffected = cmd.ExecuteNonQuery();
                                return new HttpResponseMessage(HttpStatusCode.OK)
                                {
                                    Content = new StringContent("Se ha agregado la materia prima a este punto")
                                };
                            }
                            else
                            {



                                foreach (ProductoMateriaDetallePuntosID PMDPI in MDMP)
                                {
                                    if (PMDPI.materiaPrima.materiaPrimaId == PMDP.materiaPrimaId)
                                    {
                                        existe=1;//La materia ya existe
                                        break;
                                    }
                                    else
                                    {
                                        existe=2;//La materia no existe
                                    }
                                }

                                if (existe == 2)
                                {
                                    oConexion.Close();
                                    oConexion.Open();

                                    SqlCommand cmd = new SqlCommand("sp_DetalleMateriaProducto", oConexion);
                                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                                    cmd.Parameters.Add(new SqlParameter("@idProductoDetalle", System.Data.SqlDbType.Int)).Value = PMDP.idProductoDetalle;
                                    cmd.Parameters.Add(new SqlParameter("@materiaPrimaId", System.Data.SqlDbType.Int)).Value = PMDP.materiaPrimaId;
                                    cmd.Parameters.Add(new SqlParameter("@cantidadUsoMateria", System.Data.SqlDbType.Float)).Value = PMDP.cantidadUsoMateria;

                                    int rowsAffected = cmd.ExecuteNonQuery();
                                    return new HttpResponseMessage(HttpStatusCode.OK)
                                    {
                                        Content = new StringContent("Se ha agregado la materia prima a este punto")
                                    };
                                }
                                else
                                {
                                    return new HttpResponseMessage(HttpStatusCode.Conflict)
                                    {
                                        Content = new StringContent("Esta materia prima ya se encuentra en este punto")
                                    };
                                }
                            }
                        }
                        else {
                            return new HttpResponseMessage(HttpStatusCode.Conflict)
                            {
                                Content = new StringContent("El punto de la materia no coincide con el del producto")
                            };
                           
                        }
                    }
                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al registrar la materia prima para este punto"+e.Message)
                    };
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic MostrarDetalleMateriaProductosPorPuntos(ProductoDetalleId prid)
        {

            List<ProductoMateriaDetallePuntosID> pro = new List<ProductoMateriaDetallePuntosID>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    SqlCommand cmd = new SqlCommand("sp_MostrarDetalleMateriaProducto", oConexion);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    
                    

                    cmd.Parameters.Add(new SqlParameter("@idProductoDetalle", System.Data.SqlDbType.Int)).Value = prid.idProductoDetalle;
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {

                            ProductoDetalleId id = new ProductoDetalleId();
                            
                            ProductoMateriaDetallePuntosID PE = new ProductoMateriaDetallePuntosID()
                            {
                                idDetalleMateriaProducto =Convert.ToInt32(dr["idDetalleMateriaProducto"]),
                                cantidadUsoMateria = Convert.ToDouble(dr["cantidadUsoMateria"]),
                                materiaPrima = new MateriaPrimaE(){
                                    materiaPrimaId =Convert.ToInt32(dr["materiaPrimaId"]),
                                    provedoresId=Convert.ToInt32(dr["proovedoresId"]),
                                    nombreMateriaPrima = dr["nombreMateriaPrima"].ToString(),
                                    cantidadTotal = Convert.ToInt32(dr["cantidadTotal"]),
                                    costo = Convert.ToDouble(dr["costo"]),
                                    image_name = dr["image_name"].ToString()
                                },
                                ProductoDetalle = new ProductoDetaPuntosIds()
                                {
                                    idProductoDetalle =Convert.ToInt32(dr["ProductoDetalleID"]),
                                    Producto=new ProductoE(){
                                        idProducto =Convert.ToInt32(dr["idProducto"]),
                                        nombre=dr["nombre"].ToString(),
                                        precio = Convert.ToDouble(dr["precio"]),
                                        descripccion = dr["descripccion"].ToString(),
                                        image_name = dr["image_name"].ToString(),
                                        estatus = Convert.ToInt32(dr["estatus"])
                                    },
                                    punto = Convert.ToDouble(dr["punto"]),
                                    cantidad = Convert.ToInt32(dr["cantidad_STOCK"]),
                                }
                                
                            };

                            pro.Add(PE);
                        }
                    }

                    if (pro.Count >0)
                    {
                        return pro;
                    }
                    else
                    {
                        return new HttpResponseMessage(HttpStatusCode.NotFound)
                        {
                            Content = new StringContent("Error en la consulta del la materia de este punto")
                        };
                    }

                }
                catch (Exception e)
                {
                      return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                         {
                             Content = new StringContent("Error al consultar la materia de este puntoo" + e.Message)
                         };
               
                    throw;
                }
                finally
                {
                    oConexion.Close();
                }
            }
        }

        public static dynamic CrearProductos(CrearProducto c )
        {


            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaCon))
            {

                try
                {
                    oConexion.Open();

                    int crear = 0;
                    string? nombreMateria="";

                    ProductoDetalleId prid = new ProductoDetalleId();
                    prid.idProductoDetalle= c.ProductoDetalleId;
                    dynamic MDMPPP = MostrarDetalleMateriaProductosPorPuntos(prid);

                    foreach (ProductoMateriaDetallePuntosID p in MDMPPP)
                    {
                        if ((p.cantidadUsoMateria*c.CantidadACrear) > p.materiaPrima.cantidadTotal)
                        {
                            crear=1;//no hay materia suiciente
                            nombreMateria=p.materiaPrima.nombreMateriaPrima;
                            break;
                        }
                        else
                        {
                            crear=2;//si hay esa materia, pregunta por la que sigue 
                        }
                    }

                    if (crear==2) {
                        SqlCommand cmd = new SqlCommand("sp_CrearProductos", oConexion);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.Add(new SqlParameter("@ProductoDetalleID", System.Data.SqlDbType.VarChar)).Value = c.ProductoDetalleId;
                        cmd.Parameters.Add(new SqlParameter("@cantidadCrear", System.Data.SqlDbType.Float)).Value = c.CantidadACrear;

                        int rowsAffected = cmd.ExecuteNonQuery();
                        return new HttpResponseMessage(HttpStatusCode.OK)
                        {
                            Content = new StringContent("Se ha creado la cantidad de productos indicada")
                        };

                    }
                    else {
                        return
                            new HttpResponseMessage(HttpStatusCode.Conflict)
                        {
                            Content = new StringContent("Falta materia prima de este producto: "+nombreMateria)
                        };

                    }
                }
                catch (Exception e)
                {
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError)
                    {
                        Content = new StringContent("Error al crear productos"+e.Message)
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