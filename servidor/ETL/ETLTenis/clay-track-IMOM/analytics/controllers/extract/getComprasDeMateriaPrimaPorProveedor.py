from databases.databaseMain import DatabaseMain

def getComprasDeMateriaPrimaPorProveedor(todosLosTiempos):
    try:
        db = DatabaseMain()
        query = f"""
        SELECT
            cmp.materiaPrimaId,
            cmp.cantidadCompra,
            cmp.pagoTotal,
            cmp.fecha AS fechaCompra,
            mp.nombreMateriaPrima,
            p.nombreProvedor,
            p.telefono
        FROM compraMateriaPrima cmp
        INNER JOIN materiaPrima mp
            ON cmp.materiaPrimaId = mp.materiaPrimaId
        INNER JOIN provedores p
            ON mp.proovedoresId = p.proovedoresId
        {'' if todosLosTiempos
            else "WHERE cmp.fecha >= DATEADD(DAY, -30, GETDATE());"}
        """
        resultados = db.execute_query(query)
        lista_resultados = []
        for fila in resultados:
            resultado_dict = {
                "materiaPrimaId": fila[0],
                "cantidadCompra": fila[1],
                "pagoTotal": fila[2],
                "fechaCompra": fila[3],
                "nombreMateriaPrima": fila[4],
                "nombreProveedor": fila[5],
                "telefonoProveedor": fila[6]
            }
            lista_resultados.append(resultado_dict)
        db.commit()
        return lista_resultados
    except Exception as e:
        print(f"Error - getComprasDeMateriaPrimaPorProveedor: {e}")
    finally:
        db.disconnect()
