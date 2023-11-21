
from databases.databaseAnalytics import DatabaseAnalytics


def saveSalesByClient(json, allTime):
  try:
    db = DatabaseAnalytics()
    storedProc = "EXEC procedureGraphic @json = ?, @type = ?, @allTime = ?"
    params = (json, 'ventasPorCliente', allTime)
    db.executeProcedure(storedProc, params)
    db.commit()
    print('Guardadó ventas por cliente ' + ('por todas las fechas' if allTime else 'por mes'))

  
  except Exception as e:
    print(f"Error - saveSalesByClient: {e}")
  finally:
    db.disconnect()

