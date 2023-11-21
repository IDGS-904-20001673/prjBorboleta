
from databases.databaseAnalytics import DatabaseAnalytics


def savePurchasesBySupplier(json, allTime):
  try:
    db = DatabaseAnalytics()
    storedProc = "EXEC procedureGraphic @json = ?, @type = ?, @allTime = ?"
    params = (json, 'comprasPorProveedor', allTime)
    db.executeProcedure(storedProc, params)
    db.commit()
    print('Guardado Compras por proveedor ' + ('por todas las fechas' if allTime else 'por mes'))
  except Exception as e:
    print(f"Error - savePurchasesBySupplier: {e}")
  finally:
    db.disconnect()

