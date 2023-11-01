import { Component,OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
})
export class HeaderComponent {
  idRole: number = 0;
  Nombre: string = '';

  constructor(private router: Router) { }

  isNavbarTransparent = true;

  ngOnInit(): void {
    // Obtener el idRole del localStorage
    const storednombre = localStorage.getItem('nombre');
    const storedIdRole = localStorage.getItem('idRole');
    if (storedIdRole) {
      this.idRole = +storedIdRole;
      this.Nombre + storednombre;
    }
  }

  onLogOut(): void {
    localStorage.clear();
    this.router.navigate(['/home']);
  
    setTimeout(() => {
      window.location.reload();
    }, 500);
  }

  onScroll() {
    this.isNavbarTransparent = window.scrollY === 0;
  }
  redirectToHome() {
    this.router.navigate(['/home']);
   
  }
  realizarAccion() {
    setTimeout(() => {
      window.location.reload();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }, 50);
  
  }
  scrollEspecifico(){
    setTimeout(() => {
    window.location.reload();
    const destino = document.getElementById('puntero');
    const posiciondestino = destino ? destino.offsetTop:0;
    window.scrollTo({top:posiciondestino,behavior:'smooth'});
  }, 50);
  
}
 
}
