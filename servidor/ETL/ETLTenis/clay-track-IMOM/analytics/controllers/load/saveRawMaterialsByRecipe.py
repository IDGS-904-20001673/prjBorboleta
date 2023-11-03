
from databases.databaseAnalytics import DatabaseAnalytics


def saveRawMaterialsByRecipe(json, allTime):
  try:
    db = DatabaseAnalytics()
    storedProc = "EXEC procedureGraphic @json = ?, @type = ?, @allTime = ?"
    params = (json, 'MateriaPrimaPorProducto', allTime)
    db.executeProcedure(storedProc, params)
    db.commit()
    print('Guardado Materia Prima por producto ' + ('por todas las fechas' if allTime else 'por mes'))
  
  except Exception as e:
    print(f"Error - saveRawMaterialsByRecipe: {e}")
  finally:
    db.disconnect()

