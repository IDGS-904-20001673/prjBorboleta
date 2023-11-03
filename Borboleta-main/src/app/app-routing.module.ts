import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './vistas/home/home.component';
import { LoginComponent } from './vistas/login/login.component';
import { RegistroComponent } from './vistas/registro/registro.component';
import { AuthGuardService } from './vistas/Admin/descripcion-proveedores/guards/auth-guard.service';
import { HeaderAdmComponent } from './vistas/Admin/header-adm/header-adm.component';
import { ErrorsComponent } from './vistas/errors/errors.component';
import { ForbiddenComponent } from './vistas/forbidden/forbidden.component';
import { ProovedoresComponent } from './vistas/Admin/proovedores/proovedores.component';
import { MateriaPrimaComponent } from './vistas/Admin/materia-prima/materia-prima.component';
import { MateriaPrimaComprasComponent } from './vistas/Admin/materia-prima-compras/materia-prima-compras.component';
import { ProductosAdminComponent } from './vistas/Admin/productos-admin/productos-admin.component';
import { ProductosClienteComponent } from './vistas/Cliente/productos-cliente/productos-cliente.component';
import { InfoProcutosAdminComponent } from './vistas/Admin/info-procutos-admin/info-procutos-admin.component';
import { PerfilAdminComponent } from './vistas/Admin/perfil-admin/perfil-admin.component';
import { PerfilClienteComponent } from './vistas/Cliente/perfil-cliente/perfil-cliente.component'
import { ProductoDetalleClienteComponent } from './vistas/Cliente/producto-detalle-cliente/producto-detalle-cliente.component'
import { MateriaPrimaHistoricoComponent } from './vistas/Admin/materia-prima-historico/materia-prima-historico.component'
import { InfoProveedoresComponent } from './vistas/Admin/info-proveedores/info-proveedores.component';
import { DescripcionProveedoresComponent } from './vistas/Admin/descripcion-proveedores/descripcion-proveedores.component';
import { CarritoClienteComponent } from './vistas/Cliente/carrito-cliente/carrito-cliente.component';
import { EmpleadosComponent } from './vistas/Admin/empleados/empleados.component';




const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'home', component: HomeComponent },
  { path: 'registro', component: RegistroComponent },
  { path: 'error', component:  ErrorsComponent},
  { path: 'forbidden', component:  ForbiddenComponent},
  { 
    path: 'proovedores', 
    canActivate: [AuthGuardService],
    component:  ProovedoresComponent
  },
  { 
    path: 'materiaPrima', 
    canActivate: [AuthGuardService],
    component:  MateriaPrimaComponent
  },
  { 
    path: 'materiaPrimaCompras', 
    canActivate: [AuthGuardService],
    component:  MateriaPrimaComprasComponent
  },
  { 
    path: 'homeAdmin',
    canActivate: [AuthGuardService],
    component: HeaderAdmComponent 
  },
  { 
    path: 'productosAdmin',
    canActivate: [AuthGuardService],
    component: ProductosAdminComponent 
  },
  { 
    path: 'productosCliente',
    canActivate: [AuthGuardService],
    component: ProductosClienteComponent 
  },
  { 
    path: 'empleados',
    canActivate: [AuthGuardService],
    component: EmpleadosComponent 
  },
  { 
    path: 'infoProductos',
    canActivate: [AuthGuardService],
    component: InfoProcutosAdminComponent 
  },
  { 
    path: 'perfilAdm',
    canActivate: [AuthGuardService],
    component: PerfilAdminComponent 
  },
  { 
    path: 'perfilCliente',
    canActivate: [AuthGuardService],
    component: PerfilClienteComponent 
  },
  { 
    path: 'productoDetalleCliente',
    canActivate: [AuthGuardService],
    component: ProductoDetalleClienteComponent 
  },
  { 
    path: 'materiaPrimaHistorico',
    canActivate: [AuthGuardService],
    component: MateriaPrimaHistoricoComponent 
  },
  { 
    path: 'infoProveedores',
    canActivate: [AuthGuardService],
    component: InfoProveedoresComponent 
  },
  { 
    path: 'descripcionProveedores',
    canActivate: [AuthGuardService],
    component: DescripcionProveedoresComponent 
  },
  { 
    path: 'carrito',
    canActivate: [AuthGuardService],
    component: CarritoClienteComponent 
  },
  
  
  
  // Redirige cualquier ruta desconocida a la página de error 404
  { path: '**', redirectTo: 'error' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

// const routes: Routes = [
//   { path: 'login', component: LoginComponent },
//   {
//     path: 'admin-view',
//     canActivate: [AuthGuardService], // Protege la ruta con AuthGuardService
//     component: AdminViewComponent,
//   },
//   {
//     path: 'employee-view',
//     canActivate: [AuthGuardService], // Protege la ruta con AuthGuardService
//     component: EmployeeViewComponent,
//   },
//   {
//     path: 'client-view',
//     canActivate: [AuthGuardService], // Protege la ruta con AuthGuardService
//     component: ClientViewComponent,
//   },
//   {
//     path: 'inactive-client-view',
//     canActivate: [AuthGuardService], // Protege la ruta con AuthGuardService
//     component: InactiveClientViewComponent,
//   },
//   // ... Otras rutas públicas
//   { path: '**', redirectTo: 'login', pathMatch: 'full' }, // Redirige cualquier ruta desconocida al login
// ];

