import { Component, OnInit } from '@angular/core';
import { ProyectoApiService } from '../../../proyecto-api.service';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';


@Component({
  selector: 'app-empleados',
  templateUrl: './empleados.component.html',
  styleUrls: ['./empleados.component.css']
})

export class EmpleadosComponent {

  nombre: string = '';
  correo: string = '';
  contrasenia: string = '';
  idRole: number = 2;
  estado: string = '';
  municipio: string = '';
  codigoPostal: number | null = null;
  colonia: string = '';
  calle: string = '';
  numeroExt: number | null = null;
  numeroInt: number | null = null;
  referencia: string = '';
  isFormValid: boolean = false;

  isFieldEmpty(fieldValue: string | number | null): boolean {
    return fieldValue === null || fieldValue === undefined || fieldValue === '';
  }  

  checkFormValidity(): void {
    this.isFormValid = !!this.nombre && !!this.contrasenia && !!this.estado && !!this.municipio &&
      !!this.codigoPostal && !!this.colonia && !!this.calle && !!this.numeroExt && !!this.referencia;
  }

  constructor(private proyectoApiService: ProyectoApiService) { }
  onRegisterEmpleado(): void {    
      console.log('Función onRegister llamada');

    // Verificar si el formulario es válido
    this.checkFormValidity();
    console.log('si checo el formuario');
  
    // Si el formulario es válido, enviar los datos al servidor
    if (this.isFormValid) {
      // Crear el objeto con los datos del formulario y realizar la llamada a la API
      const data = {
        nombre: this.nombre,
        correo: this.correo,
        contrasenia: this.contrasenia,
        idRole: this.idRole,
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
      console.log(data);
      this.proyectoApiService.registerEmpleado(data).subscribe(
        (response) => {
          console.log('Respuesta de la API de registro:', response);
          console.log('estatus code: ', response.statusCode);
  
          // Verificar el código de estado de la respuesta
          if (response.statusCode === 200) {
            console.log('Deberia mandarte una alerta ')
            // Registro exitoso
            Swal.fire('¡Registro exitoso!', '', 'success').then(() => {
              // Redireccionar a la página de login después de hacer clic en el botón "OK"
              window.location.href = '/empleados';
            });
          }else if (response.statusCode === 409) {
            // Error en los datos ingresados
            Swal.fire('¡Error en el registro!', 'Este correo ya esta registrado.', 'error');
          } else if (response.statusCode === 400) {
            // Error en los datos ingresados
            Swal.fire('¡Error en el registro!', 'Por favor, verifica los datos ingresados.', 'error');
          } else {
            // Otro error desconocido
            Swal.fire('¡Error en el registro!', 'Hubo un problema al intentar registrarse.', 'error');
          }
        },
        (error) => {
          console.error('Error en el registro:', error);
  
          // Mostrar mensaje de error genérico
          Swal.fire('¡Error en el registro!', 'Hubo un problema al intentar registrarse.', 'error');
        }
      );
    }
  }
  
  
}