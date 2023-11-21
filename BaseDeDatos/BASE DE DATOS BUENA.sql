
use master;
GO
DROP DATABASE IF EXISTS tenis;
GO
create database tenis;
GO
use tenis;
GO

-------------------------------------------------------------------------------------------------------------creacion de las tablas--------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE roles (
  idRole int NOT NULL IDENTITY(1,1) PRIMARY KEY ,
  nombre varchar(80) DEFAULT NULL,
  descripccion varchar(255) DEFAULT NULL
);

GO
CREATE TABLE domicilio(
	domicilioId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	estado varchar(255) NOT NULL,
	municipio varchar(255) NOT NULL,
	codigoPostal int NOT NULL,
	colonia varchar(255) NOT NULL,
	calle varchar(255) NOT NULL,
	numeroExt int NOT NULL,
	numeroInt int DEFAULT NULL,
	referencia varchar(255) NOT NULL
);

GO
CREATE TABLE usuario (
  idUsuario int NOT NULL PRIMARY KEY IDENTITY(1,1),
  nombre varchar(50) NOT NULL,
  correo varchar(255) DEFAULT NULL,
  contrasenia varchar(255) NOT NULL,
  estatus tinyint DEFAULT 1,
  fecha_creacion datetime DEFAULT GETDATE(),
  idRole INT not null default 3,
  UNIQUE (correo),
  domicilioId int NOT NULL,
  CONSTRAINT fk_domiclio_id FOREIGN KEY (domicilioId) REFERENCES domicilio(domicilioId),
  CONSTRAINT fk_rol_id FOREIGN KEY (idRole) REFERENCES roles(idRole)
);
GO
CREATE TABLE provedores(
	proovedoresId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	nombreProvedor varchar(255) NOT NULL,
	telefono varchar(255) NOT NULL,
	estatus int NOT NULL DEFAULT 1,
	domicilioId int NOT NULL,
	CONSTRAINT fk_domiclio_id_proovedores FOREIGN KEY (domicilioId) REFERENCES domicilio(domicilioId)
);
GO


CREATE TABLE materiaPrima (
  materiaPrimaId int NOT NULL PRIMARY KEY IDENTITY(1,1),
  proovedoresId int NOT NULL,
  nombreMateriaPrima varchar(255)NOT NULL,
  unidadMedida varchar(255) NOT NULL,
  cantidadTotal float NOT NULL,
  costo float NOT NULL,
  image_name varchar(MAX) DEFAULT NULL,
  CONSTRAINT fk_proovedores_proovedoresId FOREIGN KEY (proovedoresId) REFERENCES provedores(proovedoresId)
);
GO

CREATE TABLE compraMateriaPrima(
	compraMateriaPrimaID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	materiaPrimaId int NOT NULL,
	cantidadCompra int NOT NULL,
	pagoTotal float NOT NULL,
	fecha datetime DEFAULT GETDATE(),
	CONSTRAINT fk_materiaPrima_materiaPrimaId FOREIGN KEY (materiaPrimaId) REFERENCES materiaPrima(materiaPrimaId)
);
GO

CREATE TABLE compraMateriaPrimaPuntos(
    compraMateriaPrimaPuntoID int NOT NULL PRIMARY KEY IDENTITY(10000, 1),
    materiaPrimaId int NOT NULL,
    cantidadCompra int NOT NULL,
    punto float not null,
    pagoTotal float NOT NULL,
    fecha datetime DEFAULT GETDATE(),
    CONSTRAINT fk_materiaPrimaPunto_materiaPrimaId FOREIGN KEY (materiaPrimaId) REFERENCES materiaPrima(materiaPrimaId)
);

GO

CREATE TABLE productos (
  idProducto int NOT NULL PRIMARY KEY IDENTITY(1,1),
  nombre varchar(255) NOT NULL,
  precio float DEFAULT NULL,
  descripccion varchar(255) DEFAULT NULL,
  image_name varchar(MAX) DEFAULT NULL,
  estatus int DEFAULT NULL
);
GO

CREATE TABLE ProductoDetalle (
    ProductoDetalleID int NOT NULL PRIMARY KEY IDENTITY(1, 1),
    idProducto int NOT NULL,
    punto float,
    cantidad_STOCK int,
    CONSTRAINT fk_idProducto_detalle FOREIGN KEY (idProducto) REFERENCES productos(idProducto)
);

CREATE TABLE detalleMateriaProducto (
  idDetalleMateriaProducto int NOT NULL PRIMARY KEY IDENTITY(1,1),
  ProductoDetalleID int NOT NULL,
  materiaPrimaId int NOT NULL,
  cantidadUsoMateria float NOT NULL,
  CONSTRAINT fk_detalleMateria_detalleProducto FOREIGN KEY (ProductoDetalleID) REFERENCES ProductoDetalle(ProductoDetalleID),
  CONSTRAINT fk_detalleMateriaProducto_materiaPrimaId FOREIGN KEY (materiaPrimaId) REFERENCES materiaPrima(materiaPrimaId)
);
GO
 CREATE TABLE estatus(
	estatus int NOT NULL PRIMARY KEY IDENTITY(1,1),
	descripcionEstatus varchar(255) NOT NULL
);
GO
CREATE TABLE compras (
  idCompra int NOT NULL PRIMARY KEY IDENTITY(1,1),
  fechaCompra datetime NOT NULL,
  idUsuario int NOT NULL,
  Total float NOT NULL,
  CantidadTotalTenis int NOT NULL,
  estatus int default 1,
  domicilioId int NOT NULL,
  CONSTRAINT fk_domiclioCompra_id FOREIGN KEY (domicilioId) REFERENCES domicilio(domicilioId),
  CONSTRAINT fk_compras_user FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);
GO
CREATE TABLE detalleCompra (
  idDetalleCompra int NOT NULL PRIMARY KEY IDENTITY(1,1),
  idCompra int NOT NULL,
  idDetalleProducto int NOT NULL,
  cantidad int NOT NULL,
  costo float NOT NULL,
  CONSTRAINT fk_compras_idCompra FOREIGN KEY (idCompra) REFERENCES compras(idCompra),
  CONSTRAINT fk_compras_idDetalleProducto FOREIGN KEY (idDetalleProducto) REFERENCES ProductoDetalle(ProductoDetalleID)
);

GO
---------------------------------------------------------------------------------------------inserciones------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO roles (nombre, descripccion) VALUES
('Admin', 'administrador'),
('Empleado', 'Empleado de la empresa'),
('Cliente', 'Cliente de la empresa'),
('Inactivo', 'Usuario Inactivo');

GO
INSERT INTO domicilio (estado,municipio,codigoPostal,colonia,calle,numeroExt,referencia)
VALUES
('guanajuato','leon','37570','Granjeno Plus','Granja eva','114','casa dos pisos porton negro'),
('guanajuato','leon','37570','Granjeno Plus','Granja Norma','232','casa roja'),
('guanajuato','leon','37570','Granjeno Plus','Granja Martha','452','casa verde con reja negra');

GO
INSERT INTO usuario (nombre, correo, contrasenia, estatus, idRole, domicilioId) 
VALUES
('Nestor', 'nestor38@gmail.com', '12345',1,1,1),
('Jose', 'jose@gmail.com', '12345',1,2,2),
('Pedro', 'pedro@gmail.com', '12345',1,3,3);

INSERT INTO estatus (descripcionEstatus) 
values
	('EN ESPERA DE ELABORACION'),
	('ELABORANDO PEDIDO'),
	('PEDIDO ENVIADO'),
	('PEDIDO ENTREGADO'),
	('PEDIDO CANCELADO');

GO

-------------------------------------------------------------------------------------Store procedures-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_consultar_usuario(
    @email varchar(255),
    @pass varchar(255)
	)
AS   
BEGIN
select * from usuario inner join roles on
usuario.idRole = roles.idRole inner join domicilio on
usuario.domicilioId = domicilio.domicilioId
where usuario.correo like @email and usuario.contrasenia like @pass;
END;
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_registrar_usuario(
    @estado varchar(255),
    @municipio varchar(255),
    @codigoPostal int,
    @colonia varchar(255),
    @calle varchar(255),
    @numeroExt int,
    @numeroInt int,
    @referencia varchar(255),

    @nombre varchar(255),
    @correo varchar(255),
    @contrasenia varchar(255),
    @idRole varchar(255)
	)
AS   
BEGIN
DECLARE @idDomicilio INT;

insert into domicilio(estado, municipio, codigoPostal, colonia, calle, numeroExt, numeroInt, referencia) values(
@estado,@municipio,@codigoPostal,@colonia, @calle,@numeroExt,@numeroInt,@referencia
);

SET @idDomicilio = SCOPE_IDENTITY();


insert into usuario(nombre,correo, contrasenia, idRole, domicilioId) values(
@nombre, @correo, @contrasenia, @idRole, @idDomicilio
);

END;
GO 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_insertar_proveedor(
    @nombreP varchar(255),
    @telefono varchar(255),

	@estado varchar(255),
    @municipio varchar(255),
    @codigoPostal int,
    @colonia varchar(255),
    @calle varchar(255),
    @numeroExt int,
    @numeroInt int,
    @referencia varchar(255)
	)
AS   
BEGIN
DECLARE @idDomicilio INT;

insert into domicilio(estado, municipio, codigoPostal, colonia, calle, numeroExt, numeroInt, referencia) values(
@estado,@municipio,@codigoPostal,@colonia, @calle,@numeroExt,@numeroInt,@referencia
);

SET @idDomicilio = SCOPE_IDENTITY();

insert into provedores(nombreProvedor,telefono, domicilioId) values(
@nombreP, @telefono,@idDomicilio
);
END;
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_verificar_correo_existente
    @correo VARCHAR(100)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM usuario WHERE correo = @correo)
        SELECT 1 AS correo_existente;
    ELSE
        SELECT 0 AS correo_existente;
END
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_baja_proveedor(
    @id int
	)
AS
BEGIN

	declare @esta int;

    SELECT @esta = CASE WHEN estatus = 0 
	THEN 1 
	ELSE 0 
	END FROM provedores WHERE proovedoresId = @id;

    UPDATE provedores
    SET estatus = @esta
    WHERE proovedoresId = @id;
END;
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostar_proveedores_inactivos
AS
BEGIN
select p.proovedoresId, p.nombreProvedor, p.telefono, p.estatus, domicilio.* from provedores p inner join domicilio on
p.domicilioId = domicilio.domicilioId  where estatus = 0;

END;
GO
----------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostar_proveedores_activos
AS
BEGIN
select p.proovedoresId, p.nombreProvedor, p.telefono, p.estatus, domicilio.* from provedores p inner join domicilio on
p.domicilioId = domicilio.domicilioId  where estatus = 1;

END;
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_Nueva_materiaPrima(
    @proovedoresId int,
    @nombreMateriaPrima varchar(255),
	@unidadMedida varchar(255),
    @costo float,
    @image_name varchar(MAX)
)
AS   
BEGIN

        INSERT INTO materiaPrima (proovedoresId, nombreMateriaPrima,unidadMedida, cantidadTotal, costo, image_name)
        VALUES (@proovedoresId, @nombreMateriaPrima,@unidadMedida, 0, @costo, @image_name);
END;
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostrar_materiaPrima
AS   
BEGIN

select * from materiaPrima;
END;
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostrar_materiaPrimaNormal
AS   
BEGIN
SELECT * FROM materiaPrima where nombreMateriaPrima Not like '%del%'
END;
GO

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostrar_materiaPrimaPuntos
AS   
BEGIN
SELECT * FROM materiaPrima where nombreMateriaPrima like '%del%';
END;
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_comprar_materiaPrima(
    @materiaPrimaId int,
    @cantidadCompra int,
    @pagoTotal float
	)
AS   
BEGIN

insert into compraMateriaPrima(materiaPrimaId, cantidadCompra, pagoTotal) values(
@materiaPrimaId, @cantidadCompra, @pagoTotal
);

 UPDATE materiaPrima
    SET cantidadTotal = cantidadTotal + @cantidadCompra
    WHERE materiaPrimaId = @materiaPrimaId;

END;
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostrar_comprasMateriaPrima
AS   
BEGIN
SELECT 
    COALESCE(compraMateriaPrima.compraMateriaPrimaId, compraMateriaPrimaPuntos.compraMateriaPrimaPuntoId) AS compraMateriaPrimaId,
    materiaPrima.*,
    COALESCE(compraMateriaPrima.cantidadCompra, compraMateriaPrimaPuntos.cantidadCompra) AS cantidadCompra,
    COALESCE(compraMateriaPrima.pagoTotal, compraMateriaPrimaPuntos.pagoTotal) AS pagoTotal,
    COALESCE(compraMateriaPrima.fecha, compraMateriaPrimaPuntos.fecha) AS fecha
FROM materiaPrima
LEFT JOIN compraMateriaPrima ON materiaPrima.materiaPrimaId = compraMateriaPrima.materiaPrimaId
LEFT JOIN compraMateriaPrimaPuntos ON materiaPrima.materiaPrimaId = compraMateriaPrimaPuntos.materiaPrimaId
WHERE 
    compraMateriaPrima.compraMateriaPrimaId IS NOT NULL OR
    compraMateriaPrimaPuntos.compraMateriaPrimaPuntoId IS NOT NULL OR
    compraMateriaPrima.cantidadCompra IS NOT NULL OR
    compraMateriaPrimaPuntos.cantidadCompra IS NOT NULL OR
    compraMateriaPrima.pagoTotal IS NOT NULL OR
    compraMateriaPrimaPuntos.pagoTotal IS NOT NULL OR
    compraMateriaPrima.fecha IS NOT NULL OR
    compraMateriaPrimaPuntos.fecha IS NOT NULL;

END;
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostrarEmpleados
AS   
BEGIN
select u.idUsuario, u.nombre,u.correo, u.contrasenia,u.idRole, domicilio.* from usuario u inner join domicilio on
u.domicilioId = domicilio.domicilioId where idRole = 2;
END;
GO
DROP PROCEDURE sp_mostrarEmpleados

CREATE PROCEDURE sp_productoNuevo(
    @nombre varchar(255),
	@precio float,
    @descripccion varchar(255),
    @image_name varchar(MAX)
)
AS   
BEGIN

        INSERT INTO productos(nombre, precio, descripccion, image_name, estatus )
        VALUES (@nombre, @precio, @descripccion, @image_name, 1);
END;
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostarProductosActivos
AS   
BEGIN
select * from productos where estatus = 1;
END;
GO

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostarProductosInactivos
AS   
BEGIN
select * from productos where estatus = 0;
END;
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_atualizar_usuario(
  @idUsuario int,
  @estado varchar(255) = NULL,
  @municipio varchar(255) = NULL,
  @codigoPostal int = NULL,
  @colonia varchar(255) = NULL,
  @calle varchar(255) = NULL,
  @numeroExt int = NULL,
  @numeroInt int = NULL,
  @referencia varchar(255) = NULL
)
AS   
BEGIN

    DECLARE @iDomcilio int;

    SELECT @iDomcilio = domicilioId FROM usuario WHERE idUsuario = @idUsuario;

    IF @iDomcilio IS NOT NULL
    BEGIN
        UPDATE domicilio
        SET
            estado = CASE WHEN @estado IS NULL or @estado = '' THEN estado ELSE @estado END,
            municipio = CASE WHEN @municipio IS NULL or @municipio = '' THEN municipio ELSE @municipio END,
            codigoPostal = CASE WHEN @codigoPostal IS NULL or @codigoPostal = 0  THEN codigoPostal ELSE @codigoPostal END,
            colonia = CASE WHEN @colonia IS NULL or @colonia = '' THEN colonia ELSE @colonia END,
            calle = CASE WHEN @calle IS NULL or @calle = '' THEN calle ELSE @calle END,
            numeroExt = CASE WHEN @numeroExt IS NULL or @numeroExt = 0 THEN numeroExt ELSE @numeroExt END,
            numeroInt = CASE WHEN @numeroInt IS NULL or @numeroInt = 0 THEN numeroInt ELSE @numeroInt END,
            referencia = CASE WHEN @referencia IS NULL or @referencia = '' THEN referencia ELSE @referencia END
        WHERE domicilioId = @iDomcilio;
    END;

END;
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_comprar_materiaPrimaPunto(
    @materiaPrimaId int,
    @cantidadCompra int,
    @pagoTotal float,
	@punto int 
	)
AS   
BEGIN

insert into compraMateriaPrimaPuntos(materiaPrimaId, cantidadCompra, pagoTotal, punto) values(
@materiaPrimaId, @cantidadCompra, @pagoTotal, @punto
);

 UPDATE materiaPrima
    SET cantidadTotal = cantidadTotal + @cantidadCompra
    WHERE materiaPrimaId = @materiaPrimaId;

END;
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create PROCEDURE sp_estatus_producto(
    @idProducto int
	)
AS
BEGIN

	declare @esta int;

    SELECT @esta = CASE WHEN estatus = 0 
	THEN 1 
	ELSE 0 
	END FROM productos WHERE idProducto = @idProducto;


	UPDATE productos
    SET estatus = @esta
    WHERE idProducto = @idProducto;

END;
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_ProductoDetalle(
    @idProducto int,
    @punto float
	)
AS   
BEGIN

insert into ProductoDetalle(idProducto, punto, cantidad_STOCK) values
(@idProducto, @punto, 0)

END;
GO
------------------------------------------------------------------------------------------------------------------------------------------

create PROCEDURE sp_mostrar_puntosProducto(
    @idProducto int
	)
AS
BEGIN
    SELECT * from ProductoDetalle inner join productos on
	productos.idProducto=ProductoDetalle.idProducto
	where ProductoDetalle.idProducto = @idProducto;

END;
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE sp_DetalleMateriaProducto(
    @idProductoDetalle int,
    @materiaPrimaId int,
    @cantidadUsoMateria float
	)
AS   
BEGIN

insert into detalleMateriaProducto(ProductoDetalleID, materiaPrimaId, cantidadUsoMateria ) values
(@idProductoDetalle, @materiaPrimaId, @cantidadUsoMateria)

END;
GO
------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_MostrarDetalleMateriaProducto(
    @idProductoDetalle int
	)
AS   
BEGIN

select detalleMateriaProducto.idDetalleMateriaProducto,detalleMateriaProducto.cantidadUsoMateria, 
materiaPrima.*, ProductoDetalle.*, productos.* from detalleMateriaProducto inner join materiaPrima on
materiaPrima.materiaPrimaId = detalleMateriaProducto.materiaPrimaId inner join ProductoDetalle on
ProductoDetalle.ProductoDetalleID = detalleMateriaProducto.ProductoDetalleID inner join productos on
ProductoDetalle.idProducto = productos.idProducto
where detalleMateriaProducto.ProductoDetalleID=@idProductoDetalle;

END;
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_CrearProductos(
    @ProductoDetalleID int,
    @cantidadCrear int
)
AS   
BEGIN

    UPDATE ProductoDetalle
    SET cantidad_STOCK = cantidad_STOCK + @cantidadCrear
    WHERE ProductoDetalleID = @ProductoDetalleID;

    UPDATE MP
    SET cantidadTotal = cantidadTotal - (DMP.cantidadUsoMateria * @cantidadCrear)
    FROM materiaPrima AS MP
    INNER JOIN detalleMateriaProducto AS DMP ON MP.materiaPrimaId = DMP.materiaPrimaId
    WHERE DMP.ProductoDetalleID = @ProductoDetalleID;

END;
GO
------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostrarComprasPuntos
AS   
BEGIN
select * from compraMateriaPrimaPuntos;
END;
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure sp_registrarCompra(
@IdUsuario int,
@TotalProducto int,
@Total float,

@estado varchar(255),
@municipio varchar(255),
@codigoPostal int,
@colonia varchar(255),
@calle varchar(255),
@numeroExt int,
@numeroInt int,
@referencia varchar(255),


@QueryDetalleCompra nvarchar(max)
)
as
begin
	begin try
		begin transaction
		
		declare @idcompra int = 0
		DECLARE @idDomicilio INT;

		insert into domicilio(estado, municipio, codigoPostal, colonia, calle, numeroExt, numeroInt, referencia) values(
		@estado,@municipio,@codigoPostal,@colonia, @calle,@numeroExt,@numeroInt,@referencia
		);
		SET @idDomicilio = SCOPE_IDENTITY();

		insert into compras(fechaCompra,idUsuario,Total, CantidadTotalTenis, estatus, domicilioId) values
		(getDate(), @IdUsuario,@Total, @TotalProducto,1,@idDomicilio)

		set @idcompra = scope_identity()

		set @QueryDetalleCompra = replace(@QueryDetalleCompra,'�idcompra!',@idcompra)

		EXECUTE sp_executesql @QueryDetalleCompra



		commit
	end try
	begin catch
		rollback
	end catch
end

go
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create procedure sp_CambiarEstatusCompra(
@estatus int,
@idCompra int
)
as
begin
	begin try
		begin transaction
   UPDATE compras
    SET estatus = @estatus
    WHERE idCompra = @idCompra;

		commit
	end try
	begin catch
		rollback
	end catch
end
go
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostarComprasPorUsuario
(
  @idUsuario int
)
AS
BEGIN
    SELECT c.idCompra,c.fechaCompra,c.CantidadTotalTenis,c.idUsuario,c.Total, d.*, e.*
  FROM compras c
  INNER JOIN domicilio d ON c.domicilioId = d.domicilioId
  INNER JOIN estatus e ON c.estatus = e.estatus
  WHERE c.idUsuario =@idUsuario;
END;
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_mostarDetalleCompras
(
  @idCompra int
)
AS
BEGIN
   SELECT
    dc.idDetalleCompra,
    dc.cantidad,
    dc.costo as subtotal,
    pd.punto,
    p.nombre,
    p.precio as precioUnitario,
    p.descripccion,
    p.image_name
FROM detalleCompra dc
INNER JOIN compras c ON dc.idCompra = c.idCompra
INNER JOIN ProductoDetalle pd ON dc.idDetalleProducto = pd.ProductoDetalleID
INNER JOIN productos p ON pd.idProducto = p.idProducto
where c.idCompra=@idCompra;

END;
GO
------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_consultarDomicilio(
    @idUsuario int
	)
AS
BEGIN
	select domicilio.* from domicilio inner join usuario on
	domicilio.domicilioId = usuario.domicilioId 
	where usuario.idUsuario =@idUsuario;
END;
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create PROCEDURE sp_mostarComprasADMIN
AS
BEGIN
    SELECT c.idCompra, c.fechaCompra, c.Total, c.CantidadTotalTenis,
	u.nombre,u.correo, d.*, e.* from compras c inner join usuario u on
	c.idUsuario = u.idUsuario inner join domicilio d on
	c.domicilioId = d.domicilioId inner join estatus e on
	c.estatus = e.estatus;
END;
GO


------------------------------------------------------------------------Ejecucion de los SP-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
EXEC sp_registrar_usuario
    @estado='Guanajuato',
    @municipio='Leon',
    @codigoPostal=37190,
    @colonia='La florida',
    @calle='san placido',
    @numeroExt=145,
    @numeroInt='',
    @referencia='Porton blanco',
    @nombre='Leonel Robledo',
    @correo='robledo@gmail.com',
    @contrasenia='leonel2002',
    @idRole=1;
GO

EXEC sp_insertar_proveedor
    @nombreP='cyprus',
    @telefono='477123873',
	@estado='Guanajuato',
    @municipio='Leon',
    @codigoPostal=37190,
    @colonia='La florida',
    @calle='san placido',
    @numeroExt=145,
    @numeroInt='',
    @referencia='Porton blanco'
GO
EXEC sp_insertar_proveedor
    @nombreP='toef',
    @telefono='4771276873',
	@estado='Guanajuato',
    @municipio='Leon',
    @codigoPostal=37190,
    @colonia='La florida',
    @calle='san placido',
    @numeroExt=145,
    @numeroInt='',
    @referencia='Porton blanco'
GO
EXEC sp_nueva_materiaPrima
    @proovedoresId = 1,
    @nombreMateriaPrima = 'PVC',
	@unidadMedida ='Gramos', 
    @costo = 517.20,
	@image_name = ''
GO
EXEC sp_nueva_materiaPrima
    @proovedoresId = 1,
    @nombreMateriaPrima = 'Suela del 2',
	@unidadMedida = '2',
    @costo = 52.20,
	@image_name = ''
GO
select * from compraMateriaPrimaPuntos
exec sp_comprar_materiaPrima @materiaPrimaId=1, @cantidadCompra=25, @pagoTotal=23.362;
GO
exec sp_comprar_materiaPrima @materiaPrimaId=1, @cantidadCompra=51, @pagoTotal=233.62;
GO
exec sp_comprar_materiaPrimaPunto @materiaPrimaId=2, @cantidadCompra=21, @pagoTotal=372.62, @punto=2;
GO

GO


--------------------------------------------------------------------------------------selects------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from usuario; 
select * from domicilio; 
select * from provedores; 
select * from compraMateriaPrima;
select * from compraMateriaPrimaPuntos;
select * from materiaPrima;
select * from productos;
select * from ProductoDetalle;
select * from detalleMateriaProducto;
select * from estatus;
select * from compras;
select * from detalleCompra;

exec sp_mostrar_comprasMateriaPrima;



EXEC sp_productoNuevo
    @nombre='Tenis De mujer',
    @precio=350,
    @descripccion='Tenis de dama Rosa bonito',
    @image_name='';

GO

EXEC sp_ProductoDetalle @idProducto = 1, @punto=4;
GO
exec sp_DetalleMateriaProducto @idProductoDetalle=1, @materiaPrimaId=2, @cantidadUsoMateria=0.1;
GO



EXEC sp_productoNuevo
    @nombre='Tenis Calcetin sport',
    @precio=238,
    @descripccion='Tenis unisex rojo',
    @image_name='';
GO
EXEC sp_ProductoDetalle @idProducto = 2, @punto=4;
GO

	EXEC sp_productoNuevo
    @nombre='Tenis calcetin alto',
    @precio=1234,
    @descripccion='calcetin rosa alto para dama',
    @image_name='';
	GO
EXEC sp_ProductoDetalle @idProducto = 3, @punto=4;
GO

		EXEC sp_productoNuevo
    @nombre='Calcet�n sport palace',
    @precio=2300,
    @descripccion='calcetin negro para dama',
    @image_name='';

GO
EXEC sp_ProductoDetalle @idProducto = 4, @punto=4;
GO

	EXEC sp_productoNuevo
    @nombre='Calcet�n Invierno',
    @precio=3289,
    @descripccion='calcetin para invierno con borrega',
    @image_name='';

GO
EXEC sp_ProductoDetalle @idProducto = 5, @punto=4;
GO
		EXEC sp_productoNuevo
    @nombre='Calcet�n Ni�a',
    @precio=250,
    @descripccion='calcetin rosa para ni�a',
    @image_name='';

	GO
EXEC sp_ProductoDetalle @idProducto = 6, @punto=4;
GO
		EXEC sp_productoNuevo
    @nombre='Calcet�n choclo',
    @precio=730,
    @descripccion='calcetin corto tipo choclo negro',
    @image_name='';
GO
EXEC sp_ProductoDetalle @idProducto = 7, @punto=4;
GO


		EXEC sp_productoNuevo
    @nombre='Calcet�n Calvin Klein',
    @precio=2200,
    @descripccion='calcetin alto negro, marca calvin klein',
    @image_name='';

	GO
EXEC sp_ProductoDetalle @idProducto = 8, @punto=4;
GO


		EXEC sp_productoNuevo
    @nombre='Calcet�n con agujetas',
    @precio=1200,
    @descripccion='calcetin con agujetas blanco',
    @image_name='';

	GO
EXEC sp_ProductoDetalle @idProducto = 9, @punto=4;
GO


		EXEC sp_productoNuevo
    @nombre='Calcet�n para Bebe',
    @precio=400,
    @descripccion='calcetin negro para bebe',
    @image_name='';

	GO
EXEC sp_ProductoDetalle @idProducto = 10, @punto=4;
GO



  SELECT 
            c.idCompra,
            c.fechaCompra,
            c.Total,
            c.CantidadTotalTenis,
            u.idUsuario,
            u.nombre AS nombreUsuario,
            d.estado,
            d.municipio,
            d.codigoPostal,
            d.colonia,
            d.calle,
            d.numeroExt,
            d.numeroInt,
            d.referencia
        FROM compras c
        INNER JOIN usuario u
            ON c.idUsuario = u.idUsuario
        INNER JOIN domicilio d
            ON c.domicilioId = d.domicilioId