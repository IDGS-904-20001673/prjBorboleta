
USE master;
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'TenisAnalytics')
BEGIN
    ALTER DATABASE [TenisAnalytics]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE TenisAnalytics
END;
GO
CREATE DATABASE TenisAnalytics;
GO
USE TenisAnalytics;
GO


CREATE TABLE Graphic(
  id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  result VARCHAR(MAX) NOT NULL,
  date DATETIME,
  type VARCHAR(MAX) NOT NULL
);
GO
select * from Graphic;

DROP PROCEDURE IF EXISTS procedureGraphic;
GO


CREATE PROCEDURE procedureGraphic (
  @json VARCHAR(MAX),
  @type VARCHAR(255),
  @allTime BIT
)
AS
BEGIN
  DECLARE @repeatedTotal INT;
  DECLARE @idGraphic INT;
  IF @allTime = 1
    BEGIN
      SET @repeatedTotal = (
        SELECT COUNT(*) FROM Graphic g
          WHERE g.date IS NULL
          AND g.type = @type
      );
      IF @repeatedTotal = 0
        BEGIN
          INSERT INTO Graphic (result, type) VALUES (@json, @type);
        END
      IF @repeatedTotal > 0
        BEGIN
          SET @idGraphic = (
            SELECT TOP 1 id FROM Graphic g
              WHERE g.date IS NULL
              AND g.type = @type
          );
          UPDATE Graphic
            SET result = @json,
              type = @type
          WHERE id = @idGraphic;
        END
    END
	ELSE
    BEGIN
      SET @repeatedTotal = (
        SELECT COUNT(*) FROM Graphic g
          WHERE YEAR(g.date) = YEAR(GETDATE())
          AND MONTH(g.date) = MONTH(GETDATE())
          AND g.type = @type
      );
      IF @repeatedTotal = 0
        BEGIN
          INSERT INTO Graphic (result, type, date) VALUES (@json, @type, GETDATE());
        END
      IF @repeatedTotal > 0
        BEGIN
          SET @idGraphic = (
            SELECT TOP 1 id FROM Graphic g
            WHERE YEAR(g.date) = YEAR(GETDATE())
            AND MONTH(g.date) = MONTH(GETDATE())
            AND g.type = @type
          );
          UPDATE Graphic
            SET result = @json,
              type = @type,
              date = GETDATE()
          WHERE id = @idGraphic;
        END
    END
END;
GO


CREATE PROCEDURE procedureGraphicFilling (
  @json VARCHAR(MAX),
  @type VARCHAR(255),
  @month INTEGER
)
AS
BEGIN
  DECLARE @repeatedTotal INT;
  DECLARE @idGraphic INT;
  INSERT INTO Graphic (result, type, date) VALUES (@json, @type, DATEFROMPARTS(2023, @month, 1));
END;
GO



CREATE PROCEDURE sp_mostrar_comprasProveedor
AS   
BEGIN

SELECT
   result
 FROM Graphic
 WHERE type = 'comprasPorProveedor'
 AND date >= DATEADD(DAY, -30, GETDATE());
END;
GO

exec sp_mostrar_comprasProveedor
SELECT
   result
 FROM Graphic
 WHERE type = 'comprasPorProveedor'
 AND date >= DATEADD(DAY, -30, GETDATE());


 SELECT
  result
 FROM Graphic
 WHERE type = 'ventasPorCliente'
 AND YEAR(date) = YEAR('2023-06-08')
AND MONTH(date) = MONTH('2023-06-08');


SELECT
   result
 FROM Graphic
 WHERE type = 'ventasPorCliente'
 AND date >= DATEADD(DAY, -30, GETDATE());


 SELECT
  result
 FROM Graphic
 WHERE type = 'ventasPorProducto'
 AND YEAR(date) = YEAR('2023-08-01')
AND MONTH(date) = MONTH('2023-08-17');


SELECT
   result
 FROM Graphic
 WHERE type = 'ventasPorProducto'
 AND date >= DATEADD(DAY, -30, GETDATE());


 SELECT
  result
 FROM Graphic
 WHERE type = 'MateriaPrimaPorProducto'
 AND YEAR(date) = YEAR('2023-06-08')
AND MONTH(date) = MONTH('2023-06-08');


SELECT
   result
 FROM Graphic
 WHERE type = 'MateriaPrimaPorProducto'
 AND date >= DATEADD(DAY, -30, GETDATE());