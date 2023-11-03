import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { productos } from '../../../models/modelo-general.model';
import { ProyectoApiService } from '../../../proyecto-api.service';
import { DetallePorProductoId } from '../../../models/modelo-general.model';

@Component({
  selector: 'app-productos-cliente',
  templateUrl: './productos-cliente.component.html',
  styleUrls: ['./productos-cliente.component.css']
})
export class ProductosClienteComponent implements OnInit{

  constructor(private proyectoApiService: ProyectoApiService, private router: Router) {}
  ngOnInit(): void {
    this.obtenerProductos();
    localStorage.removeItem('detalleProducto');
  }
  productos: productos[] = [];
  DetallePorProductoId: DetallePorProductoId[] = [];


  obtenerProductos(): void {
    this.proyectoApiService.getAllProductosActivos().subscribe(
      (data) => {
        this.productos = data;
      },
      (error) => {
        console.error('Error al obtener los proveedores', error);
      }
    );
  }

  mostrarDetalleProducto(idProducto: number): void {
    const data = {
      idProducto: idProducto
    };
  
    this.proyectoApiService.getIdProductoDetalle(data).subscribe(
      (data) => {
        this.DetallePorProductoId = data;
        localStorage.setItem('detalleProducto', JSON.stringify(this.DetallePorProductoId));
        
        // Redirige a la página 'productoDetalleCliente'
        this.router.navigate(['/productoDetalleCliente']);
      },
      (error) => {
        console.error('Error al obtener el detalle del producto', error);
      }
    );
    
  }
  
  


}
