
from controllers.extract.getVentasPorCliente import getVentasPorCliente
from controllers.extract.getComprasDeMateriaPrimaPorProveedor import getComprasDeMateriaPrimaPorProveedor
from controllers.extract.getMateriaPrimaPorProducto import getMateriaPrimaPorProducto
from controllers.extract.getProductosMasVendidos import getProductosMasVendidos

from controllers.transform.filterSalesByClient import filterSalesByClient
from controllers.transform.filterPurchasesBySupplier import filtrarComprasPorProveedor
from controllers.transform.filterRawMaterialsByRecipe import filterRawMaterialsByRecipe
from controllers.transform.filterRecipeBySale import filterRecipeBySale

from controllers.load.saveSalesByClient import saveSalesByClient
from controllers.load.savePurchasesBySupplier import savePurchasesBySupplier
from controllers.load.saveRawMaterialsByRecipe import saveRawMaterialsByRecipe
from controllers.load.saveRecipeBySale import saveRecipeBySale


# Best client
def startProcessSalesByClient(allTime = False):
  result_get = getVentasPorCliente(allTime)
  result_filter = filterSalesByClient(result_get)
  saveSalesByClient(result_filter, allTime)


# Best supplier
def startProcessPurchasesBySupplier(allTime = False):
  result_get = getComprasDeMateriaPrimaPorProveedor(allTime)
  result_filter = filtrarComprasPorProveedor(result_get)
  savePurchasesBySupplier(result_filter, allTime)


# Best raw material
def startProcessRawMaterialsByRecipe(allTime = False):
  result_get = getMateriaPrimaPorProducto(allTime)
  result_filter = filterRawMaterialsByRecipe(result_get)
  saveRawMaterialsByRecipe(result_filter, allTime)


# Best recipe
def startProcessRecipeBySale(allTime = False):
  result_get = getProductosMasVendidos(allTime)
  result_filter = filterRecipeBySale(result_get)
  saveRecipeBySale(result_filter, allTime)


def mainProcessAnalytics():
  startProcessSalesByClient()
  startProcessPurchasesBySupplier()
  startProcessRawMaterialsByRecipe()
  startProcessRecipeBySale()
  
  startProcessSalesByClient(True)
  startProcessPurchasesBySupplier(True)
  startProcessRawMaterialsByRecipe(True)
  startProcessRecipeBySale(True)