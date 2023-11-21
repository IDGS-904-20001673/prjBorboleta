from itertools import groupby
from operator import itemgetter
import json


def filtrarComprasPorProveedor(filas):
    resultados_agrupados = []
    for key, group in groupby(filas, key=itemgetter('materiaPrimaId')):
        lista_grupo = list(group)
        total_compras = sum(row['pagoTotal'] for row in lista_grupo)
        cantidad_compras = len(lista_grupo)
        primera_fila = lista_grupo[0]
        resultado_fila = {
            'cantidadCompras': cantidad_compras,
            'totalCompras': total_compras,
            'nombre': primera_fila['nombreProveedor']
        }
        resultados_agrupados.append(resultado_fila)
    return json.dumps(resultados_agrupados)

