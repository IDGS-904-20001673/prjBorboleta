import { Component, OnInit} from '@angular/core';
import { ProyectoApiService } from '../../../proyecto-api.service';
import { DetallePorProductoId } from '../../../models/modelo-general.model';
import { NgxPaginationModule } from 'ngx-pagination';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-info-procutos-admin',
  templateUrl: './info-procutos-admin.component.html',
  styleUrls: ['./info-procutos-admin.component.css']
})
export class InfoProcutosAdminComponent implements OnInit {
  DetallePorProductoId: DetallePorProductoId[] = [];

  currentPage = 1;
  pageSize = 10; // Cantidad de elementos por página
  totalPages = 0;

  constructor(private proyectoApiService: ProyectoApiService) { }
  ngOnInit(): void {
    this.obtenerDetalle();
  }

  // Método para manejar cambios de página
  pageChanged(event: any, action: string): void {
    if (action === 'next') {
      this.currentPage++;
    } else if (action === 'previous') {
      this.currentPage--;
    }
    this.obtenerDetalle(); // Actualizar los datos de la tabla según la página actual
  }

  obtenerDetalle(): void {
    const selectedMatPrima = localStorage.getItem('selectedMatPrima'); 
    if (selectedMatPrima) {
      const parsedSelectedMatPrima = JSON.parse(selectedMatPrima); 
      const idProducto = parsedSelectedMatPrima.idProducto; 
  
      const data = {
        idProducto: idProducto
      };
  
      this.proyectoApiService.getIdProductoDetalle(data).subscribe(
        (data) => {
          this.DetallePorProductoId = data; 

        // Calcular totalPages basado en el tamaño del array y pageSize
        this.totalPages = Math.ceil(data.length / this.pageSize);
        console.log(this.totalPages);
        },
        (error) => {
          console.error('Error al obtener el detalle del producto', error);
        }
      );
    }
  }

  onRegisterCantidad(idProductoDetalle: number): void {
    Swal.fire({
      title: '¿Deseas agregar más productos al stock?',
      icon: 'question',
      showCancelButton: true,
      confirmButtonText: 'Sí',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire({
          title: '¿Cuántos productos agregas?',
          html:
            '<input id="cantidad-input" type="number" min="1" step="1" class="swal2-input">',
          showCancelButton: true,
          confirmButtonText: 'Siguiente',
          cancelButtonText: 'Cancelar',
          preConfirm: () => {
            const cantidadInput = document.getElementById('cantidad-input') as HTMLInputElement;
            if (cantidadInput) {
              return cantidadInput.value;
            }
            return undefined; // Cambiado de null a undefined
          }
        }).then((inputResult) => {
          if (inputResult.isConfirmed && inputResult.value !== undefined) {
            const cantidad = parseInt(inputResult.value);
            const data = {
              productoDetalleId: idProductoDetalle,
              cantidadACrear: cantidad
            };
            this.proyectoApiService.hacerProducto(data).subscribe(
              (response) => {
                if(response.statusCode == 200){
                  console.log('este es el response',response)
                Swal.fire('¡Registro exitoso!', '', 'success').then((result) => {
                  window.location.reload();
                });;
                }
                else if(response.statusCode == 409){
                  console.log('este es el response',response)
                  Swal.fire('¡Verifica que haya materia prima disponible!', '', 'error');
                }else if (response.statusCode == 500){
                  console.log('este es el response',response)
                  Swal.fire('¡Error en el servidor!', '', 'error');
                }else{
                  console.log('este es el response',response)
                  Swal.fire('¡Error en el servidor!', '', 'error');
                }
              },
              (error) => {
                console.error('Error al obtener el detalle del producto', error);
              }

            );
          }
        });
      }
    });
  }
  

  

}
