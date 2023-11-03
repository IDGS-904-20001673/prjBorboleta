using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using tenis.Data;
using tenis.Models;

namespace tenis.Controllers
{
    [ApiController]
    [Route("tenis")]
    public class ETLController
    {
        [HttpPost]
        [Route("ventasPorCliente")]
        public dynamic ventasPorClie()
        {
            return ETLData.ventasPorCliente();
        }
    }
}
