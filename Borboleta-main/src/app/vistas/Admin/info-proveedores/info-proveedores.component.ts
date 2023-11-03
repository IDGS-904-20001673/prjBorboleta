import { Component, OnInit } from '@angular/core';
import { ProyectoApiService } from '../../../proyecto-api.service';
import { Proveedor } from '../../../models/modelo-general.model';
import { ProveedorInAct } from '../../../models/modelo-general.model';
import Swal from 'sweetalert2';
import { timer } from 'rxjs';


@Component({
  selector: 'app-info-proveedores',
  templateUrl: './info-proveedores.component.html',
  styleUrls: ['./info-proveedores.component.css']
})
export class InfoProveedoresComponent implements OnInit{
  nombre: string = '';
  telefono: string = '';
  proveedores: Proveedor[] = [];
  proveedoresInAct: ProveedorInAct[] = [];
  estado: string = '';
  municipio: string = '';
  codigoPostal: number | null = null;
  colonia: string = '';
  calle: string = '';
  numeroExt: number | null = null;
  numeroInt: number | null = null;
  referencia: string = '';
  
  constructor(private proyectoApiService: ProyectoApiService) {}

  ngOnInit(): void {
    this.obtenerProveedores();
    this.obtenerProveedoresInactivos();
  }

  mostrarinfo(proveedores: Proveedor):void{
    localStorage.removeItem('detalleProveedor');
    localStorage.setItem('detalleProveedor', JSON.stringify(proveedores));
  }

  isFormValid(): boolean {
    return this.nombre.trim() !== '' && this.telefono.trim() !== '';
  }

  obtenerProveedores(): void {
    this.proyectoApiService.getAllProveedores().subscribe(
      (data) => {
        this.proveedores = data;
      },
      (error) => {
        console.error('Error al obtener los proveedores', error);
      }
    );
  }
  obtenerProveedoresInactivos(): void {
    this.proyectoApiService.getAllProveedoresInAct().subscribe(
      (data) => {
        this.proveedoresInAct = data;
      },
      (error) => {
        console.error('Error al obtener los proveedores', error);
      }
    );
  }

  onRegisterProovedor(): void {
    if (!this.isFormValid()) {
      Swal.fire('Formulario incompleto', 'llena todos los campos para continuar', 'error');
      return;
    }
    const data = {
      nombre: this.nombre,
      telefono: this.telefono,
      domicilio: {
        estado: this.estado,
        municipio: this.municipio,
        codigoPostal: this.codigoPostal,
        colonia: this.colonia,
        calle: this.calle,
        numeroExt: this.numeroExt,
        numeroInt: this.numeroInt,
        referencia: this.referencia
      }
    };
  
    // Mostrar SweetAlert de confirmación
    Swal.fire({
      title: '¿Quieres agregar el proveedor prima?',
      icon: 'question',
      showCancelButton: true,
      confirmButtonText: 'Sí',
      cancelButtonText: 'No'
    }).then((result: any) => {
      if (result.isConfirmed) {
        this.proyectoApiService.onRegisterProovedor(data).subscribe(
          () => {
            console.log('Registro exitoso');
            Swal.fire('¡Registro exitoso!', '', 'success').then((result) => {
              window.location.reload();
            });;
          },
          (error) => {
            console.error('Error al registrar la materia prima', error);
            Swal.fire('¡Registro fallido!', '', 'error');
          }
        );
      }
    });
  }
  

cambiarEstatusProveedor(idProveedor: number): void {
  // Mostrar SweetAlert para confirmar la acción
  Swal.fire({
    title: '¿Desactivar proveedor?',
    text: '¿Estás seguro que deseas desactivar este proveedor?',
    icon: 'question',
    showCancelButton: true,
    confirmButtonText: 'Sí',
    cancelButtonText: 'No',
  }).then((result) => {
    if (result.isConfirmed) {
      // Si el usuario presiona "Sí", llamar a la API para cambiar el estatus
      this.proyectoApiService.cambiarEstatusProveedor(idProveedor).subscribe(
        (response) => {
          console.log(`Este es el response`, response);
          // Verificar si la respuesta fue exitosa (statusCode 200)
          if (response && response.isSuccessStatusCode) {
            console.log(`Se cambió el estatus del proveedor con ID ${idProveedor}`);
            // Vuelve a obtener los proveedores actualizados después de cambiar el estatus
            this.obtenerProveedores();
            this.obtenerProveedoresInactivos();
            // Mostrar mensaje de éxito
            Swal.fire('¡Usuario desactivado!', '', 'success').then((result) => {
              window.location.reload();
            });
          } else {
            console.error(`Error al cambiar el estatus del proveedor con ID ${idProveedor}`);
            // Mostrar mensaje de error
            Swal.fire('Error', 'No se pudo desactivar el usuario', 'error');
          }
        },
        (error) => {
          console.error(`Error al cambiar el estatus del proveedor con ID ${idProveedor}`, error);
          // Mostrar mensaje de error
          Swal.fire('Error', 'Ocurrió un error al desactivar el usuario', 'error');
        }
      );
    }
  });


}

activarEstatusProveedor(idProveedor: number): void {
  // Mostrar SweetAlert para confirmar la acción
  Swal.fire({
    title: 'Activar proveedor?',
    text: '¿Estás seguro que deseas activar este proveedor?',
    icon: 'question',
    showCancelButton: true,
    confirmButtonText: 'Sí',
    cancelButtonText: 'No',
  }).then((result) => {
    if (result.isConfirmed) {
      // Si el usuario presiona "Sí", llamar a la API para cambiar el estatus
      this.proyectoApiService.cambiarEstatusProveedor(idProveedor).subscribe(
        (response) => {
          // Verificar si la respuesta fue exitosa (statusCode 200)
          if (response && response.isSuccessStatusCode) {
            this.obtenerProveedores();
            this.obtenerProveedoresInactivos();
            Swal.fire('¡Usuario activado!', '', 'success').then((result) => {
              window.location.reload();
            });;
          } else {
            console.error(`Error al cambiar el estatus del proveedor con ID ${idProveedor}`);
            // Mostrar mensaje de error
            Swal.fire('Error', 'No se pudo activar el usuario', 'error');
          }
        },
        (error) => {
          console.error(`Error al cambiar el estatus del proveedor con ID ${idProveedor}`, error);
          // Mostrar mensaje de error
          Swal.fire('Error', 'Ocurrió un error al activar el usuario', 'error');
        }
      );
    }
  });


}
}
