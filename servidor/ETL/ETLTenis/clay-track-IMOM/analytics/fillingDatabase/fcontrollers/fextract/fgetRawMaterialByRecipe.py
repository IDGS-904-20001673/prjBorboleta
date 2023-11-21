from databases.databaseMain import DatabaseMain

def getRawMaterialByRecipe(month):
    try:
        db = DatabaseMain()
        query = f"""
           SELECT
            mp.nombreMateriaPrima,
            mp.cantidadTotal,
            dmp.cantidadUsoMateria,
            p.nombre AS nombreProducto,
            p.precio,
            p.descripccion,
            p.image_name AS imagenProducto
        FROM detalleMateriaProducto dmp
        INNER JOIN materiaPrima mp
            ON dmp.materiaPrimaId = mp.materiaPrimaId
        INNER JOIN ProductoDetalle pd
            ON dmp.ProductoDetalleID = pd.ProductoDetalleID
        INNER JOIN productos p
            ON pd.idProducto = p.idProducto
        {'' if month
            else "WHERE p.estatus = 1;"}
        """
        resultados = db.execute_query(query)
        lista_resultados = []
        for fila in resultados:
            resultado_dict = {
                "nombreMateriaPrima": fila[0],
                "cantidadTotal": fila[1],
                "cantidadUsoMateria": fila[2],
                "nombreProducto": fila[3],
                "precioProducto": fila[4],
                "descripcionProducto": fila[5],
                "imagenProducto": fila[6]
            }
            lista_resultados.append(resultado_dict)
        db.commit()
        return lista_resultados
    except Exception as e:
        print(f"Error - getMateriaPrimaPorProducto: {e}")
    finally:
        db.disconnect()
