import { Component } from '@angular/core';
import { ProyectoApiService } from '../../proyecto-api.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  email: string = '';
  password: string = '';

  constructor(private proyectoApiService: ProyectoApiService, private router: Router) { }

  onLogin(): void {
    this.proyectoApiService.login(this.email, this.password)
      .subscribe(
        (data) => {
          const idRole = data[0].idRole;
          const nombre = data[0].nombre;
          const idUsuario = data[0].idUsuario;
          localStorage.setItem('idRole', idRole);
          localStorage.setItem('Nombre', nombre); 
          localStorage.setItem('idUsuario', idUsuario); 

          if (idRole === 1) {
            this.router.navigate(['/homeAdmin']);
          } else if (idRole === 2) {
            this.router.navigate(['/homeAdmin']);
          } else if (idRole === 3) {
            this.router.navigate(['/home']);
          }
        },
        (error) => {
          // Manejar el error de la API aquí
          console.error('Error en el inicio de sesión:', error);
          alert('¡Error en el inicio de sesión! Credenciales incorrectas!.');
        }
      );
  }
  scrollEspecifico(){
    setTimeout(() => {
    window.location.reload();
  
  }, 50);
  
}
}
