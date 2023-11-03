import { Component, OnInit } from '@angular/core';
import { ProyectoApiService } from '../../../proyecto-api.service';
import { DetallePorProductoId } from '../../../models/modelo-general.model';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-producto-detalle-cliente',
  templateUrl: './producto-detalle-cliente.component.html',
  styleUrls: ['./producto-detalle-cliente.component.css']
})
export class ProductoDetalleClienteComponent implements OnInit {
  selectedPunto: number | undefined;
  selectedCantidad: number | undefined;
  DetallePorProductoId: DetallePorProductoId[] = [];
  puntosArray: any[] = [];
  detalles: any[]=[];

  
  cantidadAcomprar: number | null = null;
  idProductoDetalleGlobal: number = 0;
  cantidadGlobal: number = 0;
  costototalxproductoGlobal: number = 0;

  constructor(private proyectoApiService: ProyectoApiService) { }

  ngOnInit(): void {
    

    // Obtén los datos del localStorage bajo la clave 'detalleProducto'
    const detalleProductoString = localStorage.getItem('detalleProducto');

    if (detalleProductoString) {
      this.DetallePorProductoId = JSON.parse(detalleProductoString);
      console.log(this.DetallePorProductoId);
    }
    this.obtenerPuntos();
  }

  obtenerPuntos(): void {
    this.puntosArray = [];
  
    for (const detalle of this.DetallePorProductoId) {
      const puntoCantidad = { idProductoDetalle: detalle.idProductoDetalle, punto: detalle.punto, cantidad: detalle.cantidad };
      this.puntosArray.push(puntoCantidad);
    }
    
  }
  
  selectPunto(idProductoDetalle: number, cantidad: number, punto: number): void {
    this.cantidadGlobal = cantidad;
    this.idProductoDetalleGlobal = idProductoDetalle;
    this.selectedPunto = punto; // Almacena el valor del punto seleccionado
  }

  registrarDetalle(): void {
    if (this.cantidadAcomprar && this.DetallePorProductoId && this.DetallePorProductoId[0].producto.precio) {
      this.costototalxproductoGlobal = this.cantidadAcomprar * this.DetallePorProductoId[0].producto.precio;
      console.log('Costo total por producto:', this.costototalxproductoGlobal);
    } else {
      console.log('No se pudo calcular el costo total del producto debido a datos faltantes.');
    }
  
    const data = {
      idDetalleProducto: this.idProductoDetalleGlobal,
      cantidad: this.cantidadAcomprar,
      costo: this.DetallePorProductoId[0].producto.precio,
      stock: this.cantidadGlobal,
      nombre: this.DetallePorProductoId[0].producto.nombre,
      punto: this.selectedPunto // Agrega el valor del punto seleccionado aquí
    };  
    Swal.fire({
      title: '¿Quieres agregar al carrito?',
      icon: 'question',
      showCancelButton: true,
      confirmButtonText: 'Sí',
      cancelButtonText: 'No'
    }).then((result: any) => {
      if (result.isConfirmed) {
        this.detalles.push(data);
        this.cantidadAcomprar = 0;
        this.cantidadGlobal = 0;
        if (localStorage.getItem('detalleProductoParaCompras')) {
          // Si ya existe el detalleProductoParaCompras en el LocalStorage, haces push
          this.detalles = JSON.parse(localStorage.getItem('detalleProductoParaCompras') || '[]');
          this.detalles.push(data);
        } else {
          // Si no existe, creas un nuevo arreglo con el primer elemento
          this.detalles = [data];
        }
      
        localStorage.setItem('detalleProductoParaCompras', JSON.stringify(this.detalles));
            }
    });
  }
  
}
