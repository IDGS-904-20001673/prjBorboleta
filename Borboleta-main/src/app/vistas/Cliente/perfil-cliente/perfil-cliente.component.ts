import { Component, OnInit } from '@angular/core';
import { ProyectoApiService } from '../../../proyecto-api.service';
import { domicilio } from '../../../models/modelo-general.model';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-perfil-cliente',
  templateUrl: './perfil-cliente.component.html',
  styleUrls: ['./perfil-cliente.component.css']
})
export class PerfilClienteComponent implements OnInit {
  constructor(private proyectoApiService: ProyectoApiService) {}
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
  isFormValid: boolean = false;

  ngOnInit(): void {
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
  

  onUpdate(): void {
    // Mostrar una ventana de confirmación
    Swal.fire({
      title: '¿Estás seguro?',
      text: '¿Quieres actualizar el domicilio?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Sí, actualizar',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        // Usuario hizo clic en "Sí, actualizar"
        const updatedDomicilio = {
          idUsuario: this.idUsuario,
          estado: this.estado,
          municipio: this.municipio,
          codigoPostal: this.codigoPostal,
          colonia: this.colonia,
          calle: this.calle,
          numeroExt: this.numeroExt,
          numeroInt: this.numeroInt,
          referencia: this.referencia
        };
  
        this.proyectoApiService.actualizarDomicilio(updatedDomicilio).subscribe(
          (response) => {
            // Manejar la respuesta de la API si es necesario
            console.log('Domicilio actualizado exitosamente', response);
            Swal.fire('¡Actualizado!', 'El domicilio ha sido actualizado.', 'success').then((result) => {
              window.location.reload();
            });
          },
          (error) => {
            console.error('Error al actualizar el domicilio', error);
            Swal.fire('Error', 'No se pudo actualizar el domicilio.', 'error');
          }
        );
      }
    });
  }

}
