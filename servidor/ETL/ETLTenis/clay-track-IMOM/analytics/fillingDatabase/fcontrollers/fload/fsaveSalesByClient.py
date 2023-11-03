
from databases.databaseAnalytics import DatabaseAnalytics


def saveSalesByClient(json, month):
  try:
    db = DatabaseAnalytics()
    storedProc = "EXEC procedureGraphicFilling @json = ?, @type = ?, @month = ?"
    params = (json, 'ventasPorCliente', month)
    db.executeProcedure(storedProc, params)
    db.commit()
    print('Guardadó ventas por cliente')
  except Exception as e:
    print(f"Error - saveSalesByClient: {e}")
  finally:
    db.disconnect()

