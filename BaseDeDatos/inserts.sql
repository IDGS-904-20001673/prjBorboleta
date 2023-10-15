---------------------------INSERTAR Usuaurios---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

EXEC sp_registrar_usuario
    @estado='Jalisco',
    @municipio='Guadalajara',
    @codigoPostal=44100,
    @colonia='Centro',
    @calle='Av. Juárez',
    @numeroExt=123,
    @numeroInt=0,
    @referencia='Edificio Amarillo',
    @nombre='Maria Garcia',
    @correo='maria@example.com',
    @contrasenia='maria123',
    @idRole=3;


EXEC sp_registrar_usuario
    @estado='Nuevo León',
    @municipio='Monterrey',
    @codigoPostal=64000,
    @colonia='Condesa',
    @calle='Calle del Sol',
    @numeroExt=987,
    @numeroInt=0,
    @referencia='Cerca del parque',
    @nombre='Alejandro Perez',
    @correo='alejandro@example.com',
    @contrasenia='alejandro456',
    @idRole=3;


EXEC sp_registrar_usuario
    @estado='Puebla',
    @municipio='Puebla',
    @codigoPostal=72000,
    @colonia='Las Animas',
    @calle='Av. Reforma',
    @numeroExt=456,
    @numeroInt=0,
    @referencia='Frente al cine',
    @nombre='Ana Martinez',
    @correo='ana@example.com',
    @contrasenia='ana789',
    @idRole=3;

-- Consulta 5
EXEC sp_registrar_usuario
    @estado='Veracruz',
    @municipio='Veracruz',
    @codigoPostal=91700,
    @colonia='Boca del Río',
    @calle='Av. Costera',
    @numeroExt=234,
    @numeroInt=0,
    @referencia='Frente al mar',
    @nombre='Carolina Lopez',
    @correo='carolina@example.com',
    @contrasenia='carolina789',
    @idRole=3;

-- Consulta 6
EXEC sp_registrar_usuario
    @estado='Chihuahua',
    @municipio='Chihuahua',
    @codigoPostal=31000,
    @colonia='San Felipe',
    @calle='Calle Victoria',
    @numeroExt=567,
    @numeroInt=0,
    @referencia='Esquina con Hidalgo',
    @nombre='Pedro Ramirez',
    @correo='pedro@example.com',
    @contrasenia='pedro456',
    @idRole=3;

-- Consulta 7
EXEC sp_registrar_usuario
    @estado='Oaxaca',
    @municipio='Oaxaca de Juárez',
    @codigoPostal=68000,
    @colonia='Centro Histórico',
    @calle='Calle Madero',
    @numeroExt=678,
    @numeroInt=0,
    @referencia='Cerca del mercado',
    @nombre='Carmen Flores',
    @correo='carmen@example.com',
    @contrasenia='carmen123',
    @idRole=3;

-- Consulta 8
EXEC sp_registrar_usuario
    @estado='Quintana Roo',
    @municipio='Cancún',
    @codigoPostal=77500,
    @colonia='Zona Hotelera',
    @calle='Blvd. Kukulcán',
    @numeroExt=1234,
    @numeroInt=324,
    @referencia='Frente a la playa',
    @nombre='Ricardo Perez',
    @correo='ricardo@example.com',
    @contrasenia='ricardo789',
    @idRole=3;

-- Consulta 9
EXEC sp_registrar_usuario
    @estado='Sinaloa',
    @municipio='Culiacán',
    @codigoPostal=80000,
    @colonia='Centro',
    @calle='Av. Obregón',
    @numeroExt=4567,
    @numeroInt=213,
    @referencia='Cerca del parque',
    @nombre='Laura Gonzalez',
    @correo='laura@example.com',
    @contrasenia='laura101',
    @idRole=3;

-- Consulta 10
EXEC sp_registrar_usuario
    @estado='Yucatán',
    @municipio='Mérida',
    @codigoPostal=97000,
    @colonia='García Ginerés',
    @calle='Calle 59',
    @numeroExt=7890,
    @numeroInt=613,
    @referencia='Cerca de la plaza',
    @nombre='Daniel Vargas',
    @correo='daniel@example.com',
    @contrasenia='daniel456',
    @idRole=3;

---------------------------INSERTAR PROVEEDORES---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Consulta 1
EXEC sp_insertar_proveedor
    @nombreP='TechCorp',
    @telefono='5551234567',
    @estado='Jalisco',
    @municipio='Guadalajara',
    @codigoPostal=44100,
    @colonia='Centro',
    @calle='Av. Juárez',
    @numeroExt=123,
    @numeroInt=0,
    @referencia='Edificio Amarillo';
GO

-- Consulta 2
EXEC sp_insertar_proveedor
    @nombreP='GadgetWorld',
    @telefono='2229876543',
    @estado='Nuevo León',
    @municipio='Monterrey',
    @codigoPostal=64000,
    @colonia='Condesa',
    @calle='Calle del Sol',
    @numeroExt=987,
    @numeroInt=56,
    @referencia='Cerca del parque';
GO

-- Consulta 3
EXEC sp_insertar_proveedor
    @nombreP='EcoTech',
    @telefono='3334567890',
    @estado='Puebla',
    @municipio='Puebla',
    @codigoPostal=72000,
    @colonia='Las Ánimas',
    @calle='Av. Reforma',
    @numeroExt=456,
    @numeroInt=56,
    @referencia='Frente al cine';
GO

-- Consulta 4
EXEC sp_insertar_proveedor
    @nombreP='SuperElectronics',
    @telefono='4446789012',
    @estado='Distrito Federal',
    @municipio='Ciudad de México',
    @codigoPostal=11000,
    @colonia='Polanco',
    @calle='Av. Presidente Masaryk',
    @numeroExt=789,
    @numeroInt=0,
    @referencia='Cerca del parque';
GO
---------------------------INSERTAR MATERIA---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC sp_nueva_materiaPrima
    @proovedoresId = 1,
    @nombreMateriaPrima = 'PVC',
    @costo = 517.20,
	@image_name = 'foto.jpg'
GO
EXEC sp_nueva_materiaPrima
    @proovedoresId = 2,
    @nombreMateriaPrima = 'suela del 4',
    @costo = 20,
	@image_name = 'foto.jpg'
GO
EXEC sp_nueva_materiaPrima
    @proovedoresId = 3,
    @nombreMateriaPrima = 'cierre',
    @costo = 10,
	@image_name = 'foto.jpg'
GO
EXEC sp_nueva_materiaPrima
    @proovedoresId = 4,
    @nombreMateriaPrima = 'Agujetas',
    @costo = 5,
	@image_name = 'foto.jpg'
GO
EXEC sp_nueva_materiaPrima
    @proovedoresId = 1,
    @nombreMateriaPrima = 'Calcetin del 7',
    @costo = 50,
	@image_name = 'foto.jpg'
GO
EXEC sp_nueva_materiaPrima
    @proovedoresId = 1,
    @nombreMateriaPrima = 'plantilla del 8',
    @costo = 517.20,
	@image_name = 'foto.jpg'
GO
EXEC sp_nueva_materiaPrima
    @proovedoresId = 1,
    @nombreMateriaPrima = 'Caja',
    @costo = 517.20,
	@image_name = 'foto.jpg'
GO
---------------------------comprarMateriaPrima--------------------------------------------------------------------------------------------------------
-- Consulta 1
EXEC sp_comprar_materiaPrima @materiaPrimaId=1, @cantidadCompra=12000, @pagoTotal=17.548;
GO

-- Consulta 2
EXEC sp_comprar_materiaPrima @materiaPrimaId=3, @cantidadCompra=15000, @pagoTotal=19.765;
GO

-- Consulta 3
EXEC sp_comprar_materiaPrima @materiaPrimaId=5, @cantidadCompra=18000, @pagoTotal=21.963;
GO

-- Consulta 4
EXEC sp_comprar_materiaPrima @materiaPrimaId=6, @cantidadCompra=11000, @pagoTotal=22.876;
GO

-- Consulta 5
EXEC sp_comprar_materiaPrima @materiaPrimaId=9, @cantidadCompra=17000, @pagoTotal=18.409;
GO

-- Consulta 6
EXEC sp_comprar_materiaPrima @materiaPrimaId=1, @cantidadCompra=19000, @pagoTotal=20.625;
GO

-- Consulta 7
EXEC sp_comprar_materiaPrima @materiaPrimaId=3, @cantidadCompra=14000, @pagoTotal=23.141;
GO

-- Consulta 8
EXEC sp_comprar_materiaPrima @materiaPrimaId=5, @cantidadCompra=16000, @pagoTotal=25.998;
GO

-- Consulta 9
EXEC sp_comprar_materiaPrima @materiaPrimaId=6, @cantidadCompra=12000, @pagoTotal=26.732;
GO

-- Consulta 10
EXEC sp_comprar_materiaPrima @materiaPrimaId=9, @cantidadCompra=15000, @pagoTotal=28.465;
GO
------------------------------------------------------------------------------------------------------------
-- Consulta 1
exec sp_comprar_materiaPrimaPunto @materiaPrimaId=2, @cantidadCompra=15000, @pagoTotal=75000, @punto=2;

-- Consulta 2
exec sp_comprar_materiaPrimaPunto @materiaPrimaId=4, @cantidadCompra=17000, @pagoTotal=85000, @punto=4;

-- Consulta 3
exec sp_comprar_materiaPrimaPunto @materiaPrimaId=7, @cantidadCompra=12000, @pagoTotal=60000, @punto=7;

-- Consulta 4
exec sp_comprar_materiaPrimaPunto @materiaPrimaId=8, @cantidadCompra=18000, @pagoTotal=90000, @punto=8;

-- Consulta 5
exec sp_comprar_materiaPrimaPunto @materiaPrimaId=2, @cantidadCompra=19000, @pagoTotal=95000, @punto=2;

-- Consulta 6
exec sp_comprar_materiaPrimaPunto @materiaPrimaId=4, @cantidadCompra=16000, @pagoTotal=80000, @punto=4;

-- Consulta 7
exec sp_comprar_materiaPrimaPunto @materiaPrimaId=7, @cantidadCompra=11000, @pagoTotal=55000, @punto=7;

-- Consulta 8
exec sp_comprar_materiaPrimaPunto @materiaPrimaId=8, @cantidadCompra=15000, @pagoTotal=75000, @punto=8;

-- Consulta 9
exec sp_comprar_materiaPrimaPunto @materiaPrimaId=2, @cantidadCompra=17000, @pagoTotal=85000, @punto=2;

-- Consulta 10
exec sp_comprar_materiaPrimaPunto @materiaPrimaId=4, @cantidadCompra=12000, @pagoTotal=60000, @punto=4;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Consulta 1
EXEC sp_productoNuevo
    @nombre='Tenis Hombre',
    @precio=750,
    @descripccion='zapato deportivo para hombre',
    @image_name='tenis_hombre.jpg';
GO

-- Consulta 2
EXEC sp_productoNuevo
    @nombre='Tenis Mujer',
    @precio=600,
    @descripccion='zapatilla elegante para mujer',
    @image_name='tenis_mujer.jpg';
GO

-- Consulta 3
EXEC sp_productoNuevo
    @nombre='Tenis Infantil',
    @precio=400,
    @descripccion='calzado cómodo para niños',
    @image_name='tenis_infantil.jpg';
GO

-- Consulta 4
EXEC sp_productoNuevo
    @nombre='Tenis Deportivo',
    @precio=900,
    @descripccion='zapato ideal para actividades físicas',
    @image_name='tenis_deportivo.jpg';
GO

-- Consulta 5
EXEC sp_productoNuevo
    @nombre='Tenis Casual',
    @precio=550,
    @descripccion='calzado informal para uso diario',
    @image_name='tenis_casual.jpg';
GO


EXEC sp_ProductoDetalle @idProducto = 2, @punto=2;
EXEC sp_ProductoDetalle @idProducto = 2, @punto=4;
EXEC sp_ProductoDetalle @idProducto = 2, @punto=7;
EXEC sp_ProductoDetalle @idProducto = 2, @punto=8;

EXEC sp_ProductoDetalle @idProducto = 3, @punto=2;
EXEC sp_ProductoDetalle @idProducto = 3, @punto=4;
EXEC sp_ProductoDetalle @idProducto = 3, @punto=7;
EXEC sp_ProductoDetalle @idProducto = 3, @punto=8;

EXEC sp_ProductoDetalle @idProducto = 4, @punto=2;
EXEC sp_ProductoDetalle @idProducto = 4, @punto=4;
EXEC sp_ProductoDetalle @idProducto = 4, @punto=7;
EXEC sp_ProductoDetalle @idProducto = 4, @punto=8;

EXEC sp_ProductoDetalle @idProducto = 5, @punto=2;
EXEC sp_ProductoDetalle @idProducto = 5, @punto=4;
EXEC sp_ProductoDetalle @idProducto = 5, @punto=7;
EXEC sp_ProductoDetalle @idProducto = 5, @punto=8;

EXEC sp_ProductoDetalle @idProducto = 6, @punto=2;
EXEC sp_ProductoDetalle @idProducto = 6, @punto=4;
EXEC sp_ProductoDetalle @idProducto = 6, @punto=7;
EXEC sp_ProductoDetalle @idProducto = 6, @punto=8;

EXEC sp_ProductoDetalle @idProducto = 7, @punto=2;
EXEC sp_ProductoDetalle @idProducto = 7, @punto=4;
EXEC sp_ProductoDetalle @idProducto = 7, @punto=7;
EXEC sp_ProductoDetalle @idProducto = 7, @punto=8;

exec sp_DetalleMateriaProducto @idProductoDetalle=2, @materiaPrimaId=2, @cantidadUsoMateria=0.8;
exec sp_DetalleMateriaProducto @idProductoDetalle=3, @materiaPrimaId=4, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=4, @materiaPrimaId=7, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=5, @materiaPrimaId=8, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=6, @materiaPrimaId=2, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=7, @materiaPrimaId=4, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=8, @materiaPrimaId=7, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=9, @materiaPrimaId=8, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=10, @materiaPrimaId=2, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=11, @materiaPrimaId=4, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=12, @materiaPrimaId=7, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=13, @materiaPrimaId=8, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=14, @materiaPrimaId=2, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=15, @materiaPrimaId=4, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=16, @materiaPrimaId=7, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=17, @materiaPrimaId=8, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=18, @materiaPrimaId=2, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=19, @materiaPrimaId=4, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=20, @materiaPrimaId=7, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=21, @materiaPrimaId=8, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=22, @materiaPrimaId=2, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=23, @materiaPrimaId=4, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=24, @materiaPrimaId=7, @cantidadUsoMateria=1;
exec sp_DetalleMateriaProducto @idProductoDetalle=25, @materiaPrimaId=8, @cantidadUsoMateria=1;

-- Consulta 1
exec sp_DetalleMateriaProducto @idProductoDetalle=1, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 2
exec sp_DetalleMateriaProducto @idProductoDetalle=2, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 3
exec sp_DetalleMateriaProducto @idProductoDetalle=3, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 4
exec sp_DetalleMateriaProducto @idProductoDetalle=4, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 5
exec sp_DetalleMateriaProducto @idProductoDetalle=5, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 6
exec sp_DetalleMateriaProducto @idProductoDetalle=6, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 7
exec sp_DetalleMateriaProducto @idProductoDetalle=7, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 8
exec sp_DetalleMateriaProducto @idProductoDetalle=8, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 9
exec sp_DetalleMateriaProducto @idProductoDetalle=9, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 10
exec sp_DetalleMateriaProducto @idProductoDetalle=10, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 11
exec sp_DetalleMateriaProducto @idProductoDetalle=11, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 12
exec sp_DetalleMateriaProducto @idProductoDetalle=12, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 13
exec sp_DetalleMateriaProducto @idProductoDetalle=13, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 14
exec sp_DetalleMateriaProducto @idProductoDetalle=14, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 15
exec sp_DetalleMateriaProducto @idProductoDetalle=15, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 16
exec sp_DetalleMateriaProducto @idProductoDetalle=16, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 17
exec sp_DetalleMateriaProducto @idProductoDetalle=17, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 18
exec sp_DetalleMateriaProducto @idProductoDetalle=18, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 19
exec sp_DetalleMateriaProducto @idProductoDetalle=19, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 20
exec sp_DetalleMateriaProducto @idProductoDetalle=20, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 21
exec sp_DetalleMateriaProducto @idProductoDetalle=21, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 22
exec sp_DetalleMateriaProducto @idProductoDetalle=22, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 23
exec sp_DetalleMateriaProducto @idProductoDetalle=23, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 24
exec sp_DetalleMateriaProducto @idProductoDetalle=24, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO

-- Consulta 25
exec sp_DetalleMateriaProducto @idProductoDetalle=25, @materiaPrimaId=3, @cantidadUsoMateria=0.8;
GO
-- Consulta 1
exec sp_DetalleMateriaProducto @idProductoDetalle=1, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 2
exec sp_DetalleMateriaProducto @idProductoDetalle=2, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 3
exec sp_DetalleMateriaProducto @idProductoDetalle=3, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 4
exec sp_DetalleMateriaProducto @idProductoDetalle=4, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 5
exec sp_DetalleMateriaProducto @idProductoDetalle=5, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 6
exec sp_DetalleMateriaProducto @idProductoDetalle=6, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 7
exec sp_DetalleMateriaProducto @idProductoDetalle=7, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 8
exec sp_DetalleMateriaProducto @idProductoDetalle=8, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 9
exec sp_DetalleMateriaProducto @idProductoDetalle=9, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 10
exec sp_DetalleMateriaProducto @idProductoDetalle=10, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 11
exec sp_DetalleMateriaProducto @idProductoDetalle=11, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 12
exec sp_DetalleMateriaProducto @idProductoDetalle=12, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 13
exec sp_DetalleMateriaProducto @idProductoDetalle=13, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 14
exec sp_DetalleMateriaProducto @idProductoDetalle=14, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 15
exec sp_DetalleMateriaProducto @idProductoDetalle=15, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 16
exec sp_DetalleMateriaProducto @idProductoDetalle=16, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 17
exec sp_DetalleMateriaProducto @idProductoDetalle=17, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 18
exec sp_DetalleMateriaProducto @idProductoDetalle=18, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 19
exec sp_DetalleMateriaProducto @idProductoDetalle=19, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 20
exec sp_DetalleMateriaProducto @idProductoDetalle=20, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 21
exec sp_DetalleMateriaProducto @idProductoDetalle=21, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 22
exec sp_DetalleMateriaProducto @idProductoDetalle=22, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 23
exec sp_DetalleMateriaProducto @idProductoDetalle=23, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 24
exec sp_DetalleMateriaProducto @idProductoDetalle=24, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO

-- Consulta 25
exec sp_DetalleMateriaProducto @idProductoDetalle=25, @materiaPrimaId=9, @cantidadUsoMateria=1;
GO


DECLARE @IdUsuario INT = 1;
DECLARE @TotalProducto INT = 5;
DECLARE @Total FLOAT = 150.00;
DECLARE @estado VARCHAR(255) = 'Guanajuato';
DECLARE @municipio VARCHAR(255) = 'Leon';
DECLARE @codigoPostal INT = 37190;
DECLARE @colonia VARCHAR(255) = 'La Florida';
DECLARE @calle VARCHAR(255) = 'San Placido';
DECLARE @numeroExt INT = 145;
DECLARE @numeroInt INT = NULL;
DECLARE @referencia VARCHAR(255) = 'Porton Blanco';

DECLARE @QueryDetalleCompra NVARCHAR(MAX) = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (@idcompra, 1, 2, 50.00),
           (@idcompra, 2, 3, 40.00)
    ';

-- Ejecutar el procedimiento almacenado
EXEC sp_registrarCompra 
    @IdUsuario=4,
    @TotalProducto=5,
    @Total=400,
    @estado= 'Guanajuato',
    @municipio= 'Leon',
    @codigoPostal= 37190,
    @colonia= 'La Florida',
    @calle= 'San Placido',
    @numeroExt=145,
    @numeroInt=0,
    @referencia='Porton Blanco',
    @QueryDetalleCompra= N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (1, 1, 2, 50.00),
           (1, 2, 3, 40.00),
           (1, 2, 5, 40.00),
           (1, 2, 3, 40.00)
    
    ';
	-- Script 1
EXEC sp_registrarCompra 
    @IdUsuario = 4,
    @TotalProducto = 5,
    @Total = 17323,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (1, 1, 2, 52.00),
           (1, 2, 3, 41.00),
           (1, 2, 4, 43.00),
           (1, 2, 2, 40.00);
    ';

-- Script 2
EXEC sp_registrarCompra 
    @IdUsuario = 4,
    @TotalProducto = 5,
    @Total = 17323,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (2, 3, 4, 55.00),
           (2, 1, 5, 46.00),
           (2, 4, 3, 49.00),
           (2, 2, 2, 44.00);
    ';

-- Script 3
EXEC sp_registrarCompra 
    @IdUsuario = 4,
    @TotalProducto = 5,
    @Total = 17323,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (3, 2, 4, 48.00),
           (3, 1, 5, 45.00),
           (3, 4, 3, 47.00),
           (3, 2, 2, 42.00);
    ';

-- Script 4
EXEC sp_registrarCompra 
    @IdUsuario = 4,
    @TotalProducto = 5,
    @Total = 17323,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (4, 3, 4, 54.00),
           (4, 1, 5, 47.00),
           (4, 4, 3, 50.00),
           (4, 2, 2, 43.00);
    ';

-- Script 5
EXEC sp_registrarCompra 
    @IdUsuario = 4,
    @TotalProducto = 5,
    @Total = 17323,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (5, 2, 4, 50.00),
           (5, 1, 5, 42.00),
           (5, 4, 3, 44.00),
           (5, 2, 2, 41.00);
    ';

-- Script 6
EXEC sp_registrarCompra 
    @IdUsuario = 4,
    @TotalProducto = 5,
    @Total = 17323,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (6, 3, 4, 53.00),
           (6, 1, 5, 44.00),
           (6, 4, 3, 46.00),
           (6, 2, 2, 42.00);
    ';

-- Script 7
EXEC sp_registrarCompra 
    @IdUsuario = 4,
    @TotalProducto = 5,
    @Total = 17323,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (7, 2, 4, 51.00),
           (7, 1, 5, 43.00),
           (7, 4, 3, 45.00),
           (7, 2, 2, 40.00);
    ';

-- Script 8
EXEC sp_registrarCompra 
    @IdUsuario = 4,
    @TotalProducto = 5,
    @Total = 17323,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (8, 3, 4, 49.00),
           (8, 1, 5, 42.00),
           (8, 4, 3, 44.00),
           (8, 2, 2, 41.00);
    ';

-- Script 9
EXEC sp_registrarCompra 
    @IdUsuario = 4,
    @TotalProducto = 5,
    @Total = 17323,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (9, 2, 4, 47.00),
           (9, 1, 5, 40.00),
           (9, 4, 3, 42.00),
           (9, 2, 2, 39.00);
    ';

-- Script 10
EXEC sp_registrarCompra 
    @IdUsuario = 4,
    @TotalProducto = 5,
    @Total = 17323,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (10, 3, 4, 45.00),
           (10, 1, 5, 38.00),
           (10, 4, 3, 40.00),
           (10, 2, 2, 37.00);
    ';

-- Script 1
EXEC sp_registrarCompra 
    @IdUsuario = 5,
    @TotalProducto = 3,
    @Total = 1732,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (11, 1, 2, 52),
           (11, 9, 3, 41),
           (11, 2, 4, 43),
           (11, 3, 2, 40);
    ';

-- Script 2
EXEC sp_registrarCompra 
    @IdUsuario = 5,
    @TotalProducto = 3,
    @Total = 1732,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (12, 3, 4, 55),
           (12, 1, 5, 46),
           (12, 4, 3, 49),
           (12, 2, 2, 44);
    ';

-- Script 3
EXEC sp_registrarCompra 
    @IdUsuario = 5,
    @TotalProducto = 3,
    @Total = 1732,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (13, 2, 4, 48),
           (13, 1, 5, 45),
           (13, 4, 3, 47),
           (13, 2, 2, 42);
    ';

-- Script 4
EXEC sp_registrarCompra 
    @IdUsuario = 5,
    @TotalProducto = 3,
    @Total = 1732,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (14, 3, 4, 54),
           (14, 1, 5, 47),
           (14, 4, 3, 50),
           (14, 2, 2, 43);
    ';

-- Script 5
EXEC sp_registrarCompra 
    @IdUsuario = 5,
    @TotalProducto = 3,
    @Total = 1732,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (15, 2, 4, 50),
           (15, 1, 5, 42),
           (15, 4, 3, 44),
           (15, 2, 2, 41);
    ';

-- Script 6
EXEC sp_registrarCompra 
    @IdUsuario = 5,
    @TotalProducto = 3,
    @Total = 1732,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (16, 3, 4, 53),
           (16, 1, 5, 44),
           (16, 4, 3, 46),
           (16, 2, 2, 42);
    ';

-- Script 7
EXEC sp_registrarCompra 
    @IdUsuario = 5,
    @TotalProducto = 3,
    @Total = 1732,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (17, 2, 4, 51),
           (17, 1, 5, 43),
           (17, 4, 3, 45),
           (17, 2, 2, 40);
    ';

-- Script 8
EXEC sp_registrarCompra 
    @IdUsuario = 5,
    @TotalProducto = 3,
    @Total = 1732,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (18, 3, 4, 49),
           (18, 1, 5, 42),
           (18, 4, 3, 44),
           (18, 2, 2, 41);
    ';

-- Script 9
EXEC sp_registrarCompra 
    @IdUsuario = 5,
    @TotalProducto = 3,
    @Total = 1732,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (19, 2, 4, 47),
           (19, 1, 5, 40),
           (19, 4, 3, 42),
           (19, 2, 2, 39);
    ';

-- Script 10
EXEC sp_registrarCompra 
    @IdUsuario = 5,
    @TotalProducto = 3,
    @Total = 1732,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (20, 3, 4, 45),
           (20, 1, 5, 38),
           (20, 4, 3, 40),
           (20, 2, 2, 37);
    ';

	-- Script 1
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 1732,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (21, 1, 2, 52),
           (21, 9, 3, 41),
           (21, 2, 4, 43),
           (21, 3, 2, 40);
    ';

-- Script 2
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (22, 3, 4, 55),
           (22, 1, 5, 46),
           (22, 4, 3, 49),
           (22, 2, 2, 44);
    ';

-- Script 3
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (23, 2, 4, 48),
           (23, 1, 5, 45),
           (23, 4, 3, 47),
           (23, 2, 2, 42);
    ';

-- Script 4
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (24, 3, 4, 54),
           (24, 1, 5, 47),
           (24, 4, 3, 50),
           (24, 2, 2, 43);
    ';

-- Script 5
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (25, 2, 4, 50),
           (25, 1, 5, 42),
           (25, 4, 3, 44),
           (25, 2, 2, 41);
    ';

-- Script 6
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 420,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (26, 3, 41, 31),
           (26, 1, 51, 41),
           (26, 4, 31, 61),
           (26, 2, 21, 21);
    ';

-- Script 7
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 420,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (27, 12, 14, 51),
           (27, 11, 15, 43),
           (27, 14, 13, 45),
           (27, 12, 12, 40);
    ';

-- Script 8
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 420,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (28, 23, 34, 19),
           (28, 21, 35, 12),
           (28, 24, 33, 14),
           (28, 22, 32, 11);
    ';

-- Script 9
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 420,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (29, 12, 24, 17),
           (29, 11, 25, 10),
           (29, 14, 23, 12),
           (29, 12, 22, 19);
    ';

-- Script 10
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 420,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (30, 13, 4, 45),
           (30, 11, 5, 38),
           (30, 14, 3, 40),
           (30, 12, 2, 37);
    ';

-- Script 1
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 420,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'Es verde',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (31, 1, 41, 52),
           (31, 9, 41, 41),
           (31, 2, 21, 43),
           (31, 3, 21, 40);
    ';

-- Script 2
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 420,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (32, 3, 1, 55),
           (32, 1, 1, 46),
           (32, 4, 3, 49),
           (32, 2, 3, 44);
    ';

-- Script 3
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 420,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (33, 2, 9, 48),
           (33, 1, 9, 45),
           (33, 4, 31, 47),
           (33, 2, 21, 42);
    ';

-- Script 4
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 420,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (34, 3, 1, 54),
           (34, 1, 1, 47),
           (34, 4, 33, 50),
           (34, 2, 23, 43);
    ';

-- Script 5
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (35, 2, 2, 50),
           (35, 1, 3, 42),
           (35, 4, 34, 44),
           (35, 2, 24, 41);
    ';

-- Script 6
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (36, 3, 41, 31),
           (36, 1, 8, 41),
           (36, 4, 8, 61),
           (36, 2, 21, 21);
    ';

-- Script 7
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (37, 12, 14, 51),
           (37, 11, 15, 43),
           (37, 14, 13, 45),
           (37, 12, 12, 40);
    ';

-- Script 8
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (38, 23, 34, 19),
           (38, 21, 35, 12),
           (38, 24, 33, 14),
           (38, 22, 32, 11);
    ';

-- Script 9
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (39, 12, 24, 17),
           (39, 11, 25, 10),
           (39, 14, 23, 12),
           (39, 12, 22, 19);
    ';

-- Script 10
EXEC sp_registrarCompra 
    @IdUsuario = 6,
    @TotalProducto = 13,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (40, 13, 4, 45),
           (40, 11, 5, 38),
           (40, 14, 3, 40),
           (40, 12, 2, 37);
    ';
EXEC sp_registrarCompra 
    @IdUsuario = 10,
    @TotalProducto=5,
    @Total=400,
    @estado= 'Guanajuato',
    @municipio= 'Leon',
    @codigoPostal= 37190,
    @colonia= 'La Florida',
    @calle= 'San Placido',
    @numeroExt=145,
    @numeroInt=0,
    @referencia='Porton Blanco',
    @QueryDetalleCompra= N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (41, 1, 2, 50.00),
           (41, 2, 3, 40.00),
           (41, 2, 5, 40.00),
           (41, 2, 3, 40.00)
    
    ';
	-- Script 1
EXEC sp_registrarCompra 
    @IdUsuario = 10,
    @TotalProducto = 5,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (42, 1, 2, 52.00),
           (42, 2, 3, 41.00),
           (42, 2, 4, 43.00),
           (42, 2, 2, 40.00);
    ';

-- Script 2
EXEC sp_registrarCompra 
    @IdUsuario = 10,
    @TotalProducto = 5,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (43, 3, 4, 55.00),
           (43, 1, 5, 46.00),
           (43, 4, 3, 49.00),
           (43, 2, 2, 44.00);
    ';

-- Script 3
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 5,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (44, 2, 4, 48.00),
           (44, 1, 5, 45.00),
           (44, 4, 3, 47.00),
           (44, 2, 2, 42.00);
    ';

-- Script 4
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 5,
    @Total = 2884,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (45, 3, 4, 54.00),
           (45, 1, 5, 47.00),
           (45, 4, 3, 50.00),
           (45, 2, 2, 43.00);
    ';

-- Script 5
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 5,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (46, 2, 4, 50.00),
           (46, 1, 5, 42.00),
           (46, 4, 3, 44.00),
           (46, 2, 2, 41.00);
    ';

-- Script 6
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 5,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (47, 3, 4, 53.00),
           (47, 1, 5, 44.00),
           (47, 4, 3, 46.00),
           (47, 2, 2, 42.00);
    ';

-- Script 7
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 5,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (48, 2, 4, 51.00),
           (48, 1, 5, 43.00),
           (48, 4, 3, 45.00),
           (48, 2, 2, 40.00);
    ';

-- Script 8
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 5,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (49, 3, 4, 49.00),
           (49, 1, 5, 42.00),
           (49, 4, 3, 44.00),
           (49, 2, 2, 41.00);
    ';

-- Script 9
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 5,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (50, 2, 4, 47.00),
           (50, 1, 5, 40.00),
           (50, 4, 3, 42.00),
           (50, 2, 2, 39.00);
    ';

-- Script 10
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 5,
    @Total = 3523,
    @estado = 'Guanajuato',
    @municipio = 'Leon',
    @codigoPostal = 37192,
    @colonia = 'La Palma',
    @calle = 'Calle del Sol',
    @numeroExt = 146,
    @numeroInt = 0,
    @referencia = 'Porton Azul',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (51, 3, 4, 45.00),
           (51, 1, 5, 38.00),
           (51, 4, 3, 40.00),
           (51, 2, 2, 37.00);
    ';

-- Script 1
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 3,
    @Total = 3523,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (52, 1, 2, 52),
           (52, 9, 3, 41),
           (52, 2, 4, 43),
           (52, 3, 2, 40);
    ';

-- Script 2
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 3,
    @Total = 3523,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (53, 3, 4, 55),
           (53, 1, 5, 46),
           (53, 4, 3, 49),
           (53, 2, 2, 44);
    ';

-- Script 3
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 3,
    @Total = 3523,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (54, 2, 4, 48),
           (54, 1, 5, 45),
           (54, 4, 3, 47),
           (54, 2, 2, 42);
    ';

-- Script 4
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 3,
    @Total = 3523,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (55, 3, 4, 54),
           (55, 1, 5, 47),
           (55, 4, 3, 50),
           (55, 2, 2, 43);
    ';

-- Script 5
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 3,
    @Total = 3523,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (56, 2, 4, 50),
           (56, 1, 5, 42),
           (56, 4, 3, 44),
           (56, 2, 2, 41);
    ';

-- Script 6
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 3,
    @Total = 3523,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (57, 3, 4, 53),
           (57, 1, 5, 44),
           (57, 4, 3, 46),
           (57, 2, 2, 42);
    ';

-- Script 7
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 3,
    @Total = 3523,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (58, 2, 4, 51),
           (58, 1, 5, 43),
           (58, 4, 3, 45),
           (58, 2, 2, 40);
    ';

-- Script 8
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 3,
    @Total = 3523,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (59, 3, 4, 49),
           (59, 1, 5, 42),
           (59, 4, 3, 44),
           (59, 2, 2, 41);
    ';

-- Script 9
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 3,
    @Total = 3523,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (60, 2, 4, 47),
           (60, 1, 5, 40),
           (60, 4, 3, 42),
           (60, 2, 2, 39);
    ';

-- Script 10
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 3,
    @Total = 3523,
    @estado = 'Queretaro',
    @municipio = 'Santiago',
    @codigoPostal = 37182,
    @colonia = 'Los pinos',
    @calle = 'joaqin',
    @numeroExt = 778,
    @numeroInt = 24,
    @referencia = '2 pisos',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (61, 3, 4, 45),
           (61, 1, 5, 38),
           (61, 4, 3, 40),
           (61, 2, 2, 37);
    ';

	-- Script 1
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 13,
    @Total = 3523,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (62, 1, 2, 52),
           (62, 9, 3, 41),
           (62, 2, 4, 43),
           (62, 3, 2, 40);
    ';

-- Script 2
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 13,
    @Total = 3523,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (63, 3, 4, 55),
           (63, 1, 5, 46),
           (63, 4, 3, 49),
           (63, 2, 2, 44);
    ';

-- Script 3
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (64, 2, 4, 48),
           (64, 1, 5, 45),
           (64, 4, 3, 47),
           (64, 2, 2, 42);
    ';

-- Script 4
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (65, 3, 4, 54),
           (65, 1, 5, 47),
           (65, 4, 3, 50),
           (65, 2, 2, 43);
    ';

-- Script 5
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (66, 2, 4, 50),
           (66, 1, 5, 42),
           (66, 4, 3, 44),
           (66, 2, 2, 41);
    ';

-- Script 6
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (67, 3, 41, 31),
           (67, 1, 51, 41),
           (67, 4, 31, 61),
           (67, 2, 21, 21);
    ';

-- Script 7
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (68, 12, 14, 51),
           (68, 11, 15, 43),
           (68, 14, 13, 45),
           (68, 12, 12, 40);
    ';

-- Script 8
EXEC sp_registrarCompra 
    @IdUsuario = 8,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (69, 23, 34, 19),
           (69, 21, 35, 12),
           (69, 24, 33, 14),
           (69, 22, 32, 11);
    ';

-- Script 9
EXEC sp_registrarCompra 
    @IdUsuario = 7,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (70, 12, 24, 17),
           (70, 11, 25, 10),
           (70, 14, 23, 12),
           (70, 12, 22, 19);
    ';

-- Script 10
EXEC sp_registrarCompra 
    @IdUsuario = 7,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Chihuahua',
    @municipio = 'Crispio',
    @codigoPostal = 19374,
    @colonia = 'Chapalita',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (71, 13, 4, 45),
           (71, 11, 5, 38),
           (71, 14, 3, 40),
           (71, 12, 2, 37);
    ';

-- Script 1
EXEC sp_registrarCompra 
    @IdUsuario = 7,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'Es verde',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (72, 1, 41, 52),
           (72, 9, 41, 41),
           (72, 2, 21, 43),
           (72, 3, 21, 40);
    ';

-- Script 2
EXEC sp_registrarCompra 
    @IdUsuario = 9,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (73, 3, 1, 55),
           (73, 1, 1, 46),
           (73, 4, 3, 49),
           (73, 2, 3, 44);
    ';

-- Script 3
EXEC sp_registrarCompra 
    @IdUsuario = 9,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (74, 2, 9, 48),
           (74, 1, 9, 45),
           (74, 4, 31, 47),
           (74, 2, 21, 42);
    ';

-- Script 4
EXEC sp_registrarCompra 
    @IdUsuario = 9,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (75, 3, 1, 54),
           (75, 1, 1, 47),
           (75, 4, 33, 50),
           (75, 2, 23, 43);
    ';

-- Script 5
EXEC sp_registrarCompra 
    @IdUsuario = 9,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (76, 2, 2, 50),
           (76, 1, 3, 42),
           (76, 4, 34, 44),
           (76, 2, 24, 41);
    ';

-- Script 6
EXEC sp_registrarCompra 
    @IdUsuario = 9,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (77, 3, 41, 31),
           (77, 1, 8, 41),
           (77, 4, 8, 61),
           (77, 2, 21, 21);
    ';

-- Script 7
EXEC sp_registrarCompra 
    @IdUsuario = 9,
    @TotalProducto = 13,
    @Total = 9173,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (78, 12, 14, 51),
           (78, 11, 15, 43),
           (78, 14, 13, 45),
           (78, 12, 12, 40);
    ';

-- Script 8
EXEC sp_registrarCompra 
    @IdUsuario = 10,
    @TotalProducto = 13,
    @Total = 1732,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (79, 23, 34, 19),
           (79, 21, 35, 12),
           (79, 24, 33, 14),
           (79, 22, 32, 11);
    ';

-- Script 9
EXEC sp_registrarCompra 
    @IdUsuario = 10,
    @TotalProducto = 13,
    @Total = 1732,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (80, 12, 24, 17),
           (80, 11, 25, 10),
           (80, 14, 23, 12),
           (80, 12, 22, 19);
    ';

-- Script 10
EXEC sp_registrarCompra 
    @IdUsuario = 10,
    @TotalProducto = 13,
    @Total = 17323,
    @estado = 'Guanajuato',
    @municipio = 'silao',
    @codigoPostal = 19374,
    @colonia = 'la florida',
    @calle = 'Pedro',
    @numeroExt = 71,
    @numeroInt = 45,
    @referencia = 'esta grande',
    @QueryDetalleCompra = N'
    INSERT INTO detalleCompra (idCompra, idDetalleProducto, cantidad, costo)
    VALUES (81, 13, 4, 45),
           (81, 11, 5, 38),
           (81, 14, 3, 40),
           (81, 12, 2, 37);
    ';
