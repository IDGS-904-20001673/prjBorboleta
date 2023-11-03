import { Component, OnInit } from '@angular/core';
import { ProyectoApiService } from '../../../proyecto-api.service';
import { Proveedor } from '../../../models/modelo-general.model';
import { HttpClientModule } from '@angular/common/http';


@Component({
  selector: 'app-descripcion-proveedores',
  templateUrl: './descripcion-proveedores.component.html',
  styleUrls: ['./descripcion-proveedores.component.css']
})
export class DescripcionProveedoresComponent implements OnInit{
  proveedores: Proveedor[] = [];
  detalleProveedor: any | null = null;
  
  constructor(private proyectoApiService: ProyectoApiService) {}

  ngOnInit(): void {
    // Obtener el detalle del proveedor desde el localStorage
    const detalleProveedorString = localStorage.getItem('detalleProveedor');
    
    // Verificar si el valor no es nulo antes de asignarlo
    if (detalleProveedorString !== null) {
      this.detalleProveedor = JSON.parse(detalleProveedorString);
    }
  }

  

}
