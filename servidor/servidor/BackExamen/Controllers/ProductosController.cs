using Microsoft.AspNetCore.Mvc;
using tenis.Data;
using tenis.Models;

namespace tenis.Controllers
{
    [ApiController]
    [Route("tenis")]
    public class ProductosController
    {

        [HttpPost]
        [Route("NuevoProducto")]
        public dynamic RegistarMateria([FromBody] Producto P)
        {
            return ProductoData.RegistrarProductoNuevo(P);
        }

        [HttpPost]
        [Route("MostrarProductosActivos")]
        public dynamic MostrarProductosActivos()
        {
            return ProductoData.MostrarProductosActivos();
        }

        [HttpPost]
        [Route("MostrarProductosInactivos")]
        public dynamic MostrarProductosInActivos()
        {
            return ProductoData.MostrarProductosInActivos();
        }

        [HttpPost]
        [Route("CambiarEstatusProducto")]
        public dynamic CambiaEstatus([FromBody] ProductoId id)
        {
            return ProductoData.CambiarEstatusProducto(id);
        }


        [HttpPost]
        [Route("RegistrarPuntosProducto")]
        public dynamic RegistarPuntosMateria([FromBody] ProductoDetaPuntos P)
        {
            return ProductoData.RegistrarPuntosProducto(P);
        }

        [HttpPost]
        [Route("MostrarDetalleProductoPorId")]
        public dynamic DetalleProducto([FromBody] ProductoId id)
        {
            return ProductoData.MostrarDetalleProductos(id);
        }
        [HttpPost]
        [Route("RegistrarDetalleMateriaProductoPuntos")]
        public dynamic RegistarMateriaAlPunto([FromBody] ProductoMateriaDetallePuntos PMDP)
        {
            return ProductoData.RegistrarDetalleMateriaDelProductoPorPunto(PMDP);

        }

        [HttpPost]
        [Route("MostrarDetalleMateriaProductoPorPunto")]
        public dynamic DetalleProducto([FromBody] ProductoDetalleId id)
        {
            return ProductoData.MostrarDetalleMateriaProductosPorPuntos(id);
        }

        [HttpPost]
        [Route("HacerProductos")]
        public dynamic HacerProductos([FromBody] CrearProducto CPs)
        {
            return ProductoData.CrearProductos(CPs);
        }
    }
}
