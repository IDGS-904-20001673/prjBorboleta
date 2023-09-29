import { Component, OnInit } from '@angular/core';
import { ProyectoApiService } from '../../../proyecto-api.service';
import { DetalleLocalStorage , MateriaPrimaDetalle } from '../../../models/modelo-general.model';
import { domicilio } from '../../../models/modelo-general.model';


@Component({
  selector: 'app-carrito-cliente',
  templateUrl: './carrito-cliente.component.html',
  styleUrls: ['./carrito-cliente.component.css']
})
export class CarritoClienteComponent implements OnInit {

  detalleProductoParaCompras: any[] = JSON.parse(localStorage.getItem('detalleProductoParaCompras') || '[]');

  domicilio: domicilio[]=[];
  idUsuario: number = 0;
  estado: string = '';
  municipio: string = '';
  codigoPostal: number | null = null;
  colonia: string = '';
  calle: string = '';
  numeroExt: number | null = null;
  numeroInt: number | null = null;
  referencia: string = '';
  tarjeta : number | null = null;
  mes: number | null = null;
  anio: number | null = null;
  cvv: number | null = null;

  constructor(private proyectoApiService: ProyectoApiService) { }

  ngOnInit(): void {
    console.log(this.detalleProductoParaCompras);
    const storedidUsuario = localStorage.getItem('idUsuario');
    if (storedidUsuario) {
      this.idUsuario = +storedidUsuario;
    }
    this.obtenerDomicilio();
  }

  obtenerDomicilio(): void {
    const data = {
      idUsuario: this.idUsuario
    };
  
    this.proyectoApiService.getDomiciliobyId(data).subscribe(
      (data) => {
        if (data.length > 0) {
          const domicilioData = data[0]; // Suponiendo que la API devuelve un arreglo de domicilios
          this.estado = domicilioData.estado;
          this.municipio = domicilioData.municipio;
          this.codigoPostal = domicilioData.codigoPostal;
          this.colonia = domicilioData.colonia;
          this.calle = domicilioData.calle;
          this.numeroExt = domicilioData.numeroExt;
          this.numeroInt = domicilioData.numeroInt;
          this.referencia = domicilioData.referencia;
        }
      },
      (error) => {
        console.error('Error al obtener los proveedores', error);
      }
    );
  }

  calcularSubtotal(): number {
    let subtotal = 0;
    for (const detalle of this.detalleProductoParaCompras) {
      subtotal += detalle.cantidad * detalle.costo;
    }
    return subtotal;
  }

  calcularTotal(): number {
    return this.calcularSubtotal() + 50; // Agrega el costo de envío fijo
  }

  eliminarDetalle(index: number): void {
    this.detalleProductoParaCompras.splice(index, 1);
    localStorage.setItem('detalleProductoParaCompras', JSON.stringify(this.detalleProductoParaCompras));
  }



  

}
