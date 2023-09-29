import { Component, OnInit, ViewChild  } from '@angular/core';
import { ProyectoApiService } from '../../../proyecto-api.service';
import { comprasMP } from '../../../models/modelo-general.model';
import { materiaPrima } from '../../../models/modelo-general.model';
import { agregarMateriaPrima } from '../../../models/modelo-general.model';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-materia-prima-historico',
  templateUrl: './materia-prima-historico.component.html',
  styleUrls: ['./materia-prima-historico.component.css']
})
export class MateriaPrimaHistoricoComponent implements OnInit {
  constructor(private proyectoApiService: ProyectoApiService) {}
  compras: comprasMP[] = [];
  
  ngOnInit(): void {
    this.obtenerMateriaPrima();
  }

  obtenerMateriaPrima(): void {
    this.proyectoApiService.getAllComprasMP().subscribe(
      (data) => {
        this.compras = data;
      },
      (error) => {
        console.error('Error al obtener la materia prima', error);
      }
    );
  }

}
