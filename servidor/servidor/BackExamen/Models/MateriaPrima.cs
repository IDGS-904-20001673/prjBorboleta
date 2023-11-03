using Microsoft.AspNetCore.DataProtection.KeyManagement;

namespace tenis.Models
{
    public class MateriaPrima
    {
        public int provedoresId { get; set; }
        public string? nombreMateriaPrima { get; set; }
        public double costo { get; set; }
        public string? image_name { get; set; }
    }

    public class MateriaPrimaE
    {
        public int materiaPrimaId { get; set; }

        public int provedoresId { get; set; }
        public string? nombreMateriaPrima { get; set; }
        public int cantidadTotal { get; set; }

        public double costo { get; set; }
        public string? image_name { get; set; }
    }

    public class ComprasMateriaPrima
    {
        public int compraMateriaPrimaId { get; set; }

        public int materiaPrimaId { get; set; }
        public int cantidadCompra { get; set; }

        public double pagoTotal { get; set; }
        public string fecha { get; set; }

        public MateriaPrimaE materiaPrima { get; set; }
    }

    public class ComprasMateriaPrimaI
    {

        public int materiaPrimaId { get; set; }
        public int cantidadCompra { get; set; }
        public double pagoTotal { get; set; }
    }

    public class MateriaPrimaPunto
    {
        public int materiaPrimaId { get; set; }
        public double punto { get; set; }
    }
}
