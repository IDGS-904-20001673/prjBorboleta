using Microsoft.AspNetCore.Mvc;
using tenis.Data;
using tenis.Models;



namespace tenis.Controllers
{
    [ApiController]
    [Route("tenis")]
    public class ComprasController
    {
        [HttpPost]
        [Route("ComprarProductos")]
        public dynamic ComprarProdutos([FromBody] Compras ocompras)
        {
            return ComprasData.Comprar(ocompras);
        }

        [HttpPost]
        [Route("CambiarEstatusCompra")]
        public dynamic CambiarEstatusCompra([FromBody] EstatusCompra EC)
        {
            return ComprasData.CambiarEstatusCompra(EC);
        }


        [HttpPost]
        [Route("MostrarComprasUsuario")]
        public dynamic MostrarCompra([FromBody] ComprasUser CM)
        {
            return ComprasData.MostrarComprasPorUsuario(CM);
        }
        [HttpPost]
        [Route("MostrarDetalleCompras")]
        public dynamic MostrarDetalleCompra([FromBody] idCompra id)
        {
            return ComprasData.MostrarComprasDetalles(id);
        }
        [HttpPost]
        [Route("MostrarComprasAdmin")]
        public dynamic MostrarCompraAdmin()
        {
            return ComprasData.MostrarComprasAdmin();
        }
    }
}
