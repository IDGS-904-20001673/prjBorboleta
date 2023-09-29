// models/modelo-general.model.ts
export class ModeloGeneral {

}

export interface Proveedor {
    idProveedor: number;
    nombre: string;
    telefono: string;
    estatus: number;
    domicilio: {
      estado: string;
      municipio: string;
      codigoPostal: number;
      colonia: string;
      calle: string;
      numeroExt: number;
      numeroInt: number;
      referencia: string;
    }
  }
  

export interface ProveedorInAct {
  idProveedor: number;
  nombre: string;
  telefono: string;
  estatus: number;
  domicilio: {
    estado: string;
    municipio: string;
    codigoPostal: number;
    colonia: string;
    calle: string;
    numeroExt: number;
    numeroInt: number;
    referencia: string;
  }
}
export interface materiaPrima {
  materiaPrimaId: number;
  provedoresId: number;
  nombreMateriaPrima: string;
  cantidadTotal: number;
  costo: number;
  image_name: string;
}

export interface materiaPrimaPuntos {
  materiaPrimaId: number;
  provedoresId: number;
  nombreMateriaPrima: string;
  cantidadTotal: number;
  costo: number;
  image_name: string;
}

export interface productos{
  idProducto: number,
  nombre: string,
  precio: number,
  descripccion: string,
  image_name: string,
  estatus: number
}

export interface agregarMateriaPrima {
  materiaPrimaId: number;
  provedoresId: number;
  nombreMateriaPrima: string;
  cantidadTotal: number;
  costo: number;
  image_name: string;
  cantidadUsoMateria: number;
}

export interface DetallePorProductoId {
  idProductoDetalle: number;
  producto: {
    idProducto: number;
    nombre: string;
    precio: number;
    descripccion: string;
    image_name: string;
    estatus: number;
  };
  punto: number;
  cantidad: number;
}
export interface comprasMP {
  compraMateriaPrimaId: number;
  materiaPrimaId: number;
  cantidadCompra: number;
  pagoTotal: number;
  fecha: number;
  materiaPrima: {
    materiaPrimaId: number;
    provedoresId: number;
    nombreMateriaPrima: string;
    cantidadTotal: number;
    costo: number;
    image_name: string;
  }
}

export interface domicilio{
  estado: string;
  municipio: string;
  codigoPostal: number;
  colonia: string;
  calle: string;
  numeroExt: number;
  numeroInt: number;
  referencia: string;
}

// modelo-general.model.ts
export interface ProductoDetalle {
  idProductoDetalle: number;
  producto: {
    idProducto: number;
    nombre: string;
    precio: number;
    descripccion: string;
    image_name: string;
    estatus: number;
  };
  punto: number;
  cantidad: number;
}

export interface MateriaPrimaDetalle {
  idDetalleMateriaProducto: number;
  productoDetalle: ProductoDetalle;
  detalles:{
    idDetalleProducto: number;
    cantidad: number;
    costo: number;
  } 
}

export interface DetalleLocalStorage {
  idDetalleProducto: number;
  cantidad: number;
  costo: number;

}

  