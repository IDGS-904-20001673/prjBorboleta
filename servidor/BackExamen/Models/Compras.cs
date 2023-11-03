using serverTenis.Models;

namespace tenis.Models
{
    public class Compras
    {
            public int IdUsuario { get; set; }
            public double Total { get; set; }
            public int CantidadTotalTenis { get; set; }
            public Domicilio? Domicilio { get; set; }

            public List<DetalleCompra> Detalles { get; set; }
        }

    public class DetalleCompra
    {
        public int IdDetalleProducto { get; set; }
        public int Cantidad { get; set; }
        public double Costo { get; set; }
    }

    public class EstatusCompra
    {
        public int idCompra { get; set; }
        public int estatus { get; set; }
    }

    public class Estatus
    {
        public int estatus { get; set; }
        public string descripccionEstatus { get; set; }

    }
    public class ComprasUser
    {
        public int idUsuario { get; set; }
    }

    public class MostarCompras
    {
        public int IdCompra { get; set; }
        public string fecha { get; set; }
        public int CantidadTotalTenis { get; set; }
        public int IdUsuario { get; set; }
       
        public double Total { get; set; }

        public Domicilio? Domicilio { get; set; }

        public int estatus { get; set; }
        public string descripccionEstatus { get; set; }

    }


    public class MostarDECompras
    {
        public int cantidad { get; set; }
        public double subtotal { get; set; }
        public double punto { get; set; }
        public string nombre { get; set; }
        public double precioUnitario { get; set; }

        public string descripccion { get; set; }

        public string image_name { get; set; }

    }

    public class idCompra
    {
        public int idCompras { get; set; }
    }

    public class ComprasAdmin
    {
        public int IdCompra { get; set; }
        public string? fecha { get; set; }
        public double Total { get; set; }
        public int CantidadTotalTenis { get; set; }
        public string? nombre { get; set; }
        public string? correo { get; set; }

        public Domicilio? Domicilio { get; set; }

        public string? descripccionEstatus { get; set; }
    }
}
