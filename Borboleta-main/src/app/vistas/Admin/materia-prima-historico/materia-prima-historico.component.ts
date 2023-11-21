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
  filtro :string = '' 
  productosFiltrados: comprasMP[] = [];
  ngOnInit(): void {
    this.obtenerMateriaPrima();
  }

  obtenerMateriaPrima(): void {
    this.proyectoApiService.getAllComprasMP().subscribe(
      (data) => {
        this.compras = data;
        this.productosFiltrados = data;
      },
      (error) => {
        console.error('Error al obtener la materia prima', error);
      }
    );
  }
  dataURLtoImage(dataURL: string): string {
    return 'data:image/jpeg;base64,' + dataURL;
  }
  filtrarHistorico():void{
    if(this.filtro){
      this.productosFiltrados = this.compras.filter((compras) =>{
        return(
          compras.materiaPrima.nombreMateriaPrima.toLowerCase().includes(this.filtro.toLowerCase())||
          compras.materiaPrima.unidadMedida.toLowerCase().includes(this.filtro.toLowerCase())||
          compras.cantidadCompra.toString().includes(this.filtro) ||
          compras.pagoTotal.toString().includes(this.filtro) ||
          compras.fecha.toString().includes(this.filtro) 
          
        );
      });

    }else{
      this.productosFiltrados=[...this.compras];
    }

    
  }


}
