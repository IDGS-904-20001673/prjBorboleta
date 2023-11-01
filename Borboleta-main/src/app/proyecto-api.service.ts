import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Proveedor } from './models/modelo-general.model';
import { ProveedorInAct } from './models/modelo-general.model';
import { materiaPrima } from './models/modelo-general.model';
import { materiaPrimaPuntos } from './models/modelo-general.model';
import { comprasMP } from './models/modelo-general.model';
import { agregarMateriaPrima } from './models/modelo-general.model';
import { productos } from './models/modelo-general.model';
import { domicilio } from './models/modelo-general.model';
import { MateriaPrimaDetalle } from './models/modelo-general.model';



@Injectable({
  providedIn: 'root'
})
export class ProyectoApiService {
  

  constructor(private http: HttpClient) { }
  
  /* ---------------------------------------------------------------------LOGIN--------------------------------------------------------*/
  private  urlPadre = 'http://192.168.1.8:7109/tenis'
  private apiUrlLogin = this.urlPadre + '/login';
  private apiUrlRegistro = this.urlPadre + '/Registrase'; 
  private apiUrlDomicilio = this.urlPadre + '/ConsultarDomicilioPorIdUsuario'
  private apiUrlUpdateDomicilio = this.urlPadre + '/ActualizarUsuario';
  

  login(email: string, password: string): Observable<any> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    const data = {
      email: email,
      password: password
    };

    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlLogin}`, data, { headers: headers });
  }


  register(data: any): Observable<any> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlRegistro}`, data, { headers: headers });
  }

  getDomiciliobyId(data: any): Observable<domicilio[]> {
    console.log('esto lleva data de la api',data)
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST vacía, ya que no se requiere enviar datos en el cuerpo
    return this.http.post<domicilio[]>(`${this.apiUrlDomicilio}`, data, { headers: headers });
  }

  actualizarDomicilio(data: any): Observable<any> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlUpdateDomicilio}`, data, { headers: headers });
  }

  




  /* ------------------------------------------------------------------Proveedores--------------------------------------------------------*/

  private apiUrlProveedores = this.urlPadre + '/MostrarProveedoresActivos'; 
  private apiUrlCambiarEstatus = this.urlPadre + '/CambiarEstatusProveedor';
  private apiUrlRegistrarProveedor = this.urlPadre + '/RegistrarProvedor';
  private apiUrlProveedoresInAct = this.urlPadre + '/MostrarProveedoresInActivos';



  getAllProveedores(): Observable<Proveedor[]> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST vacía, ya que no se requiere enviar datos en el cuerpo
    return this.http.post<Proveedor[]>(this.apiUrlProveedores, {}, { headers: headers });
  }

  getAllProveedoresInAct(): Observable<ProveedorInAct[]> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST vacía, ya que no se requiere enviar datos en el cuerpo
    return this.http.post<ProveedorInAct[]>(this.apiUrlProveedoresInAct, {}, { headers: headers });
  }
  

  cambiarEstatusProveedor(idProveedor: number): Observable<any> {
    const url = `${this.apiUrlCambiarEstatus}/${idProveedor}`;

    // Realizar la solicitud HTTP POST
    return this.http.post<any>(url, null);
  }

  onRegisterProovedor(data: any): Observable<any>{
    console.log('esto lleva data de la api',data)
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlRegistrarProveedor}`, data, { headers: headers });
  }


  /* -----------------------------------------------------------Materia Prima--------------------------------------------------------*/

  private apiUrlRegistrarMateriaPrima = this.urlPadre + '/NuevaMateriaPrima';
  private apiUrlMostrarMateriaPrima = this.urlPadre + '/MostrarMateriaPrimaNormal'; 
  private apiUrlObtenerMateriaPrimaCompleta = this.urlPadre + '/MostrarMateriaPrima';
  private apiUrlComprarMateriaPrima = this.urlPadre + '/ComprarMateriaPrima'; 
  private apiUrlMostrarMateriaPrimaPuntos =this.urlPadre + '/MostrarMateriaPrimaPuntos';
  private apiUrlComprarMateriaPrimaPuntos = this.urlPadre + '/ComprarMateriaPrimaPorPuntos';
  private apiUrlgetAllComprasMP = this.urlPadre + '/MostrarComprasMateriaPrima';


  onRegisterMateriaPrima(data: any): Observable<any>{
    console.log('esto lleva data de la api',data);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlRegistrarMateriaPrima}`, data, { headers: headers });
  }

  getAllMateriaPrimaCompleta(): Observable<agregarMateriaPrima[]> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST vacía, ya que no se requiere enviar datos en el cuerpo
    return this.http.post<agregarMateriaPrima[]>(this.apiUrlObtenerMateriaPrimaCompleta, {}, { headers: headers });
  }

  getAllMateriaPrima(): Observable<materiaPrima[]> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST vacía, ya que no se requiere enviar datos en el cuerpo
    return this.http.post<materiaPrima[]>(this.apiUrlMostrarMateriaPrima, {}, { headers: headers });
  }

  onCompraMateriaPrima(data: any): Observable<any>{
    console.log('esto lleva data de la api',data);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlComprarMateriaPrima}`, data, { headers: headers });
  }

  onCompraMateriaPrimaPuntos(data: any): Observable<any>{
    console.log('esto lleva data de la api',data);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlComprarMateriaPrimaPuntos}`, data, { headers: headers });
  }

  getAllMateriaPrimaPuntos(): Observable<materiaPrimaPuntos[]> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST vacía, ya que no se requiere enviar datos en el cuerpo
    return this.http.post<materiaPrimaPuntos[]>(this.apiUrlMostrarMateriaPrimaPuntos, {}, { headers: headers });
  }

  getAllComprasMP(): Observable<comprasMP[]> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST vacía, ya que no se requiere enviar datos en el cuerpo
    return this.http.post<comprasMP[]>(this.apiUrlgetAllComprasMP, {}, { headers: headers });
  }


  /* -----------------------------------------------------------Productos--------------------------------------------------------*/


  private apiUrlgetallProductos =this.urlPadre +  '/MostrarProductosActivos';
  private apiUrlgetallProductosInActivos =this.urlPadre +  '/MostrarProductosInactivos'; 
  private apiUrlCambiarEstatusProducto =this.urlPadre +  '/CambiarEstatusProducto';
  private apiUrlRegistrarNuevoProducto =this.urlPadre +  '/NuevoProducto';
  private apiUrlRegistrarPuntoProducto =this.urlPadre +  '/RegistrarPuntosProducto';
  private apiUrlIdProductoDetalle =this.urlPadre +  '/MostrarDetalleProductoPorId';
  private apiUrlRegistrarMateriaPrimaProducto =this.urlPadre +  '/RegistrarDetalleMateriaProductoPuntos';
  private apiUrlHacerProducto =this.urlPadre +  '/HacerProductos';
  getAllProductosActivos(): Observable<productos[]> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST vacía, ya que no se requiere enviar datos en el cuerpo
    return this.http.post<productos[]>(this.apiUrlgetallProductos, {}, { headers: headers });
  }
  getAllProductosInActivos(): Observable<productos[]> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST vacía, ya que no se requiere enviar datos en el cuerpo
    return this.http.post<productos[]>(this.apiUrlgetallProductosInActivos, {}, { headers: headers });
  }

  cambiarEstatusProducto(data: any): Observable<any>{
    console.log('esto lleva data de la api',data);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlCambiarEstatusProducto}`, data, { headers: headers });
  }

  //regisrtrar producto---------------------------------------------------------------------------------


  registrarNuevoProducto(data: any): Observable<any>{
    console.log('esto lleva data de la api',data);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlRegistrarNuevoProducto}`, data, { headers: headers });
  }
  registrarPuntoProducto(data: any): Observable<any>{
    console.log('esto lleva data de la api',data);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlRegistrarPuntoProducto}`, data, { headers: headers });
  }

  getIdProductoDetalle(data: any): Observable<any>{
    console.log('esto lleva data de la api',data);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlIdProductoDetalle}`, data, { headers: headers });
  }

  
  agregarMateriaPrimaProducto(data: any): Observable<any>{
    console.log('esto lleva data de la api',data);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlRegistrarMateriaPrimaProducto}`, data, { headers: headers });
  }

  getAllMateriaPrimaCompletaProductos(): Observable<materiaPrima[]> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Realizar la solicitud HTTP POST vacía, ya que no se requiere enviar datos en el cuerpo
    return this.http.post<materiaPrima[]>(this.apiUrlObtenerMateriaPrimaCompleta, {}, { headers: headers });
  }

  hacerProducto(data: any): Observable<any>{
    console.log('esto lleva data de la api',data);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<any>(`${this.apiUrlHacerProducto}`, data, { headers: headers });
  }

  //productos clientes------------------------------------------------------------------------------------------------------------
  private apiUrlMostrarDetalleMateriaPrimaProductoPorPunto = this.urlPadre + '/MostrarDetalleMateriaProductoPorPunto';

  MostrarDetalleMateriaPrimaProductoPorPunto(data: any): Observable<MateriaPrimaDetalle>{
    console.log('esto lleva data de la api',data);
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    // Realizar la solicitud HTTP POST con los datos en el cuerpo
    return this.http.post<MateriaPrimaDetalle>(`${this.apiUrlMostrarDetalleMateriaPrimaProductoPorPunto}`, data, { headers: headers });
  }

  

  


}


