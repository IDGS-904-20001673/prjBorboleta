using BackExamen.Data;
using BackExamen.Services;
using Microsoft.AspNetCore.Mvc;
using serverTenis.Data;
using serverTenis.Models;
using tenis.Data;

namespace BackExamen.Controllers
{

    [ApiController]
    [Route("tenis")]
    public class UsuarioController : ControllerBase
    {
        [HttpPost]
        [Route("login")]
        public dynamic Login([FromBody] LoginRequestModel log)
        { 

            if (LoginData.login(log.Password, log.Email) == null)
            {
                return BadRequest("Datos de inicio de sesión inválidos");
            }
            else {
                return LoginData.login(log.Password, log.Email); 
            }
            
          
        }


        [HttpPost]
        [Route("RegistrarEmpleado")]
        public dynamic RegistrarEm([FromBody] Usuario usuario)
        {
            return RegistrarseData.RegistraEmpleado(usuario);

        }

        [HttpPost]
        [Route("Registrase")]
        public dynamic Registrarse([FromBody] Usuario usuario )
        {          
            return RegistrarseData.Registrar(usuario);

        }

        [HttpPost]
        [Route("ActualizarUsuario")]
        public dynamic Actuzalizar([FromBody] DomicilioI DomI)
        {
            return RegistrarseData.ActualizarUsuario(DomI);

        }

        [HttpPost]
        [Route("ConsultarDomicilioPorIdUsuario")]
        public dynamic CONDOMIPOIDUSER([FromBody] UsuarioIDDomi id)
        {
            
            
                return LoginData.consultarDomicilio(id);
         


        }



    }
    public class LoginRequestModel
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }



}

