using Microsoft.AspNetCore.Mvc;
using tenis.Data;
using tenis.Models;

namespace tenis.Controllers
{
    [ApiController]
    [Route("tenis")]
    public class MateriaPrimaController
    {
        [HttpPost]
        [Route("NuevaMateriaPrima")]
        public dynamic RegistarMateria([FromBody] MateriaPrima MP)
        {
            return MateriaPrimaData.RegistrarMateriaPrima(MP);
        }

        [HttpPost]
        [Route("MostrarMateriaPrima")]
        public dynamic MostrarMateria()
        {
            return MateriaPrimaData.MostarTodaMateriaPrima();
        }

        [HttpPost]
        [Route("MostrarMateriaPrimaNormal")]
        public dynamic MostrarMateriaNormal()
        {
            return MateriaPrimaData.MostarMateriaPrimaNormal();
        }

        [HttpPost]
        [Route("MostrarComprasMateriaPrima")]
        public dynamic MostrarComprasMateria()
        {
            return MateriaPrimaData.MostarComprasMateriaPrima();
        }


        [HttpPost]
        [Route("ComprarMateriaPrima")]
        public dynamic ComprarMateria([FromBody] ComprasMateriaPrimaI CMPI)
        {
            return MateriaPrimaData.ComprarMateriaPrima(CMPI);
        }
    }
}
