namespace BackExamen.Models
{
    public class Ventas
    {
        public int IDVentas { get; set; }
        public Productos? Producto { get; set; }
        public int CantidadVendida { get; set; }
        public DateTime Fecha { get; set; }
    }
}
