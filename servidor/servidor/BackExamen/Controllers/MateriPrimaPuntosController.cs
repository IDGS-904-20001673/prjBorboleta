using Microsoft.AspNetCore.Mvc;
using tenis.Data;
using tenis.Models;

namespace tenis.Controllers
{
    [ApiController]
    [Route("tenis")]
    public class MateriPrimaPuntosController
    {
        [HttpPost]
        [Route("ComprarMateriaPrimaPorPuntos")]
        public dynamic ComprarMateria([FromBody] ComprasMateriaPrimaPuntosI CMPPI)
        {
            return MateriaPrimaPuntosData.ComprarMateriaPrimaPuntos(CMPPI);
        }



        [HttpPost]
        [Route("MostrarMateriaPrimaPuntos")]
        public dynamic MostrarMateriaPuntos()
        {
            return MateriaPrimaPuntosData.MostarMateriaPrimaPuntos();
        }
    }
}

