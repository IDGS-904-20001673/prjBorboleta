namespace BackExamen.Models
{
    public class Productos
    {
        public int IDProductos { get; set; }
        public int CantidadVendida { get; set; }
        public string? Titulo { get; set; }
        public string? Descripcion { get; set; }
        public double PrecioUnitario { get; set; }
        public int Existencias { get; set; }

        public double TotalVendido { get; set; }

    }
}
