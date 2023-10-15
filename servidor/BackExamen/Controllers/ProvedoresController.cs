using BackExamen.Controllers;
using Microsoft.AspNetCore.Mvc;
using serverTenis.Data;
using tenis.Data;
using tenis.Models;

namespace tenis.Controllers
{

    [ApiController]
    [Route("tenis")]
    public class ProvedoresController
    {
        [HttpPost]
        [Route("RegistrarProvedor")]
        public dynamic RegistarProveedor([FromBody] Provedor pro)
        {

                return ProveedoresData.RegistrarProvedor(pro);
            }


        [HttpPost]
        [Route("CambiarEstatusProveedor/{id}")]
        public dynamic EstatusProveedor(int id)
        {
            return ProveedoresData.BajaProvedor(id);
        }



        [HttpPost]
        [Route("MostrarProveedoresInActivos")]
        public dynamic ProveedoresInAct()
        {

            return ProveedoresData.MostarProvedoresInActivos();
        }

        [HttpPost]
        [Route("MostrarProveedoresActivos")]
        public dynamic ProveedoresAct()
        {

            return ProveedoresData.MostarProvedoresActivos();
        }

    }
    }

