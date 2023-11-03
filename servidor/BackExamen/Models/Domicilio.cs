namespace serverTenis.Models
{
    public class Domicilio
    {
        public string? Estado { get; set; }
        public string? Municipio { get; set; }
        public int? CodigoPostal { get; set; }
        public string? Colonia { get; set; }
        public string? Calle { get; set; }
        public int? NumeroExt { get; set; }
        public int? NumeroInt { get; set; }
        public string? Referencia { get; set; }
    }

    public class DomicilioI
    {
        public int? IdUsuario { get; set; }
        public string? Estado { get; set; }
        public string? Municipio { get; set; }
        public int? CodigoPostal { get; set; }
        public string? Colonia { get; set; }
        public string? Calle { get; set; }
        public int? NumeroExt { get; set; }
        public int? NumeroInt { get; set; }
        public string? Referencia { get; set; }
    }

}
