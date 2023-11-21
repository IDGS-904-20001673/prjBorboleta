from itertools import groupby
from operator import itemgetter
import json


def filterRawMaterialsByRecipe(rows):
    grouped_results = []
    for key, group in groupby(rows, key=itemgetter('nombreMateriaPrima')):
        group_list = list(group)
        total_quantity_raw_material_used = sum(row['cantidadUsoMateria'] for row in group_list)
        first_row = group_list[0]
        result_row = {
            'cantidad total usada': total_quantity_raw_material_used,
            'nombre': first_row['nombreMateriaPrima'],
            'cantidad total': first_row['cantidadTotal'],
            'Producto': first_row['nombreProducto']
        }
        grouped_results.append(result_row)
    return json.dumps(grouped_results)
