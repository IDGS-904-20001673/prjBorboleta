import { Injectable } from '@angular/core';
import { CanActivate, Router, ActivatedRouteSnapshot } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService implements CanActivate {

  private allowedRoutesForEmployee: string[] = [
    'login',
    'home',
    'homeAdmin',
    'materiaPrima',
    'productosAdmin',
    'materiaPrimaCompras',
    'infoProductos',
    'perfilAdm',
  ];

  private allowedRoutesForCliente: string[] = [
    'login',
    'home',
    'productosCliente',
    'perfilCliente',
    'productoDetalleCliente',
    'carrito',
  ];

  constructor(private router: Router) {}

  canActivate(route: ActivatedRouteSnapshot): boolean {
    const idRole = parseInt(localStorage.getItem('idRole') ?? '0', 10);
    console.log('Esto trae el idrole del auth', idRole);
    const targetRoute = route.routeConfig?.path || '';
    console.log('Esto trae el targetRoute del auth', targetRoute);

    switch (idRole) {
      case 1: // Admin
        return true;
  
      case 2: // Empleado
        if (!this.allowedRoutesForEmployee.includes(targetRoute)) {
          this.router.navigate(['/forbidden']);
          return false;
        }
        return true;
  
      case 3: // Cliente
        if (!this.allowedRoutesForCliente.includes(targetRoute)) {
          this.router.navigate(['/forbidden']);
          return false;
        }
        return true;    
      
      default:
        // Si el idRole no es válido, redirigir a /error
        this.router.navigate(['/forbidden']);
        return false;
    }
  }
}
