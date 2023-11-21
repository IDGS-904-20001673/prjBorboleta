from databases.databaseMain import DatabaseMain

def getProductosMasVendidos(todosLosTiempos):
    try:
        db = DatabaseMain()
        query = f"""
        SELECT
            dp.idProducto,
            p.nombre AS nombreProducto,
            SUM(dc.cantidad) AS totalVendido
        FROM detalleCompra dc
        INNER JOIN ProductoDetalle dp
            ON dc.idDetalleProducto = dp.ProductoDetalleID
        INNER JOIN productos p
            ON dp.idProducto = p.idProducto
        INNER JOIN compras c
            ON dc.idCompra = c.idCompra
        {'' if todosLosTiempos
            else 'WHERE c.fechaCompra >= DATEADD(DAY, -30, GETDATE())'}
        GROUP BY dp.idProducto, p.nombre
        ORDER BY totalVendido DESC;
        """
        resultados = db.execute_query(query)
        lista_resultados = []
        for fila in resultados:
            resultado_dict = {
                "idProducto": fila[0],
                "nombreProducto": fila[1],
                "totalVendido": fila[2]
            }
            lista_resultados.append(resultado_dict)
        db.commit()
        return lista_resultados
    except Exception as e:
        print(f"Error - getProductosMasVendidos: {e}")
    finally:
        db.disconnect()
