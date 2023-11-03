from itertools import groupby
from operator import itemgetter
import json


def filterSalesByClient(rows):
    grouped_results = []
    for key, group in groupby(rows, key=itemgetter('idUsuario')):
        group_list = list(group)
        total_sales = sum(row['Total'] for row in group_list)
        sales_count = len(group_list)
        first_row = group_list[0]
        result_row = {
            'Numero ventas': sales_count,
            'total ventas': total_sales,
            'Nombre': first_row['nombreUsuario']
        }
        grouped_results.append(result_row)
    return json.dumps(grouped_results)
