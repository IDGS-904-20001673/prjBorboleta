
from databases.databaseAnalytics import DatabaseAnalytics


def saveRecipeBySale(json, allTime):
  try:
    db = DatabaseAnalytics()
    storedProc = "EXEC procedureGraphic @json = ?, @type = ?, @allTime = ?"
    params = (json, 'ventasPorProducto', allTime)
    db.executeProcedure(storedProc, params)
    db.commit()
    print('Guardadó ventas por producto ' + ('por todas las fechas' if allTime else 'por mes'))
  
  except Exception as e:
    print(f"Error - saveRecipeBySale: {e}")
  finally:
    db.disconnect()

