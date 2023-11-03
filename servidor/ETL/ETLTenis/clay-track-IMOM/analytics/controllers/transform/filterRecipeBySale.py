from itertools import groupby
from operator import itemgetter
import json

def filterRecipeBySale(rows):
    grouped_results = []
    for row in rows:
        result_row = {
            'Producuto': f"{row['nombreProducto']}",
            'total vendido': row['totalVendido'],
            'id prodcuto': row['idProducto']
        }
        grouped_results.append(result_row)
    return json.dumps(grouped_results)
