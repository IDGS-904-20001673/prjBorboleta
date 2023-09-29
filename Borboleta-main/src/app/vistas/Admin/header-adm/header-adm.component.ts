import { Component,OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-header-adm',
  templateUrl: './header-adm.component.html',
  styleUrls: ['./header-adm.component.css']
})
export class HeaderAdmComponent implements OnInit {
  idRole: number = 0;

  constructor(private router: Router) { }

  ngOnInit(): void {
    // Obtener el idRole del localStorage
    const storedIdRole = localStorage.getItem('idRole');
    if (storedIdRole) {
      this.idRole = +storedIdRole;
    }
  }

  Nombre: string | null = localStorage.getItem('Nombre');


  onLogOut(): void {
    localStorage.clear();
    this.router.navigate(['/home']);
    
  }

}
