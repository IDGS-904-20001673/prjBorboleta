from databases.databaseMain import DatabaseMain

def getVentasPorCliente(todosLosTiempos):
    try:
        db = DatabaseMain()
        query = f"""
        SELECT 
            c.idCompra,
            c.fechaCompra,
            c.Total,
            c.CantidadTotalTenis,
            u.idUsuario,
            u.nombre AS nombreUsuario,
            d.estado,
            d.municipio,
            d.codigoPostal,
            d.colonia,
            d.calle,
            d.numeroExt,
            d.numeroInt,
            d.referencia
        FROM compras c
        INNER JOIN usuario u
            ON c.idUsuario = u.idUsuario
        INNER JOIN domicilio d
            ON c.domicilioId = d.domicilioId
        {'' if todosLosTiempos
            else 'WHERE c.fechaCompra >= DATEADD(DAY, -30, GETDATE())'}
        """
        resultados = db.execute_query(query)
        lista_resultados = []
        for fila in resultados:
            resultado_dict = {
                "idCompra": fila[0],
                "fechaCompra": fila[1],
                "Total": fila[2],
                "CantidadTotalTenis": fila[3],
                "idUsuario": fila[4],
                "nombreUsuario": fila[5],
                "estado": fila[6],
                "municipio": fila[7],
                "codigoPostal": fila[8],
                "colonia": fila[9],
                "calle": fila[10],
                "numeroExt": fila[11],
                "numeroInt": fila[12],
                "referencia": fila[13]
            }
            lista_resultados.append(resultado_dict)
        db.commit()
        return lista_resultados
    except Exception as e:
        print(f"Error - getVentasPorCliente: {e}")
    finally:
        db.disconnect()
