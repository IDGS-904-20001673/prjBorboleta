
from databases.databaseAnalytics import DatabaseAnalytics


def saveRecipeBySale(json, month):
  try:
    db = DatabaseAnalytics()
    storedProc = "EXEC procedureGraphicFilling @json = ?, @type = ?, @month = ?"
    params = (json, 'ventasPorProducto', month)
    db.executeProcedure(storedProc, params)
    db.commit()
    print('Guardadó ventas por producto ')
  except Exception as e:
    print(f"Error - saveRecipeBySale: {e}")
  finally:
    db.disconnect()

