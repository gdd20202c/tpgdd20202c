USE [GD2C2020]
GO

	IF OBJECT_ID('FFAN.BI_Hechos_Compras', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_Hechos_Compras];
GO
	IF OBJECT_ID('FFAN.BI_Hechos_Ventas', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_Hechos_Ventas];
GO
	IF OBJECT_ID('FFAN.BI_Sucursal', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_Sucursal]
GO
	IF OBJECT_ID('FFAN.BI_Modelo', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_Modelo]
GO
	IF OBJECT_ID('FFAN.BI_Fabricante', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_Fabricante]
GO
	IF OBJECT_ID('FFAN.BI_TipoCaja', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_TipoCaja]
GO
	IF OBJECT_ID('FFAN.BI_TipoAutomovil', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_TipoAutomovil]
GO
	IF OBJECT_ID('FFAN.BI_RubroAutoparte', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_RubroAutoparte]
GO
	IF OBJECT_ID('FFAN.BI_Potencia', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_Potencia]
GO
	IF OBJECT_ID('FFAN.BI_Tiempo', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_Tiempo];

GO
	IF OBJECT_ID('FFAN.BI_TipoTransmision', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_TipoTransmision];

GO
	IF OBJECT_ID('FFAN.BI_TipoMotor', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_TipoMotor];

GO
	IF OBJECT_ID('FFAN.BI_CantidadCambios', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_CantidadCambios];

GO
	IF OBJECT_ID('FFAN.BI_TipoAutomovil', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_TipoAutomovil];

GO
	IF OBJECT_ID('FFAN.BI_Cliente', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_Cliente];

GO
	IF OBJECT_ID('FFAN.BI_RangoEtario', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_RangoEtario];

GO

GO

	CREATE TABLE [FFAN].[BI_Sucursal](
		sucursal_id DECIMAL(18, 0) NOT NULL PRIMARY KEY,
		sucursal_direccion NVARCHAR(255),
		sucursal_mail NVARCHAR(255),
		sucursal_telefono DECIMAL(18, 0),
		sucursal_ciudad NVARCHAR(255)
	)
GO

	CREATE TABLE [FFAN].[BI_Modelo] (
		modelo_id DECIMAL(18, 0) NOT NULL PRIMARY KEY,
		modelo_nombre NVARCHAR(255),
		modelo_potencia DECIMAL(18, 0)
	)
GO

	CREATE TABLE [FFAN].[BI_Fabricante] (
		fabricante_id DECIMAL(18, 0) NOT NULL  PRIMARY KEY,
		fabricante_nombre NVARCHAR(255)
	)
GO

	CREATE TABLE [FFAN].[BI_TipoCaja] (
		tipocaja_id DECIMAL(18, 0) NOT NULL PRIMARY KEY,
		tipocaja_descripcion NVARCHAR(255)
	)
GO
	CREATE TABLE [FFAN].[BI_TipoAutomovil] (
		tipoautomovil_id DECIMAL(18, 0) NOT NULL PRIMARY KEY,
		tipoautomovil_descripcion NVARCHAR(255)
	)
GO

	CREATE TABLE [FFAN].[BI_RubroAutoparte] (
		rubroautoparte_id DECIMAL(2, 0) NOT NULL PRIMARY KEY,
		rubroautoparte_descripcion NVARCHAR(255)
	)
GO


	CREATE TABLE [FFAN].[BI_Potencia] (
		potencia_id DECIMAL(2, 0) NOT NULL IDENTITY(1, 1) PRIMARY KEY,
		potencia_descripcion NVARCHAR(255)
	)
GO

	CREATE TABLE [FFAN].[BI_Tiempo] (
		tiempo_id DECIMAL(18, 0) NOT NULL IDENTITY(1, 1) PRIMARY KEY,
		tiempo_anio decimal(4,0) NOT NULL,
		tiempo_mes decimal(2,0) NOT NULL
	)
GO

	CREATE TABLE [FFAN].[BI_TipoTransmision] (
		tipotransmision_id DECIMAL(18, 0) NOT NULL PRIMARY KEY,
		tipotransmision_descripcion NVARCHAR(255)
	)
GO

	CREATE TABLE [FFAN].[BI_TipoMotor] (
		tipomotor_id DECIMAL(18, 0) NOT NULL PRIMARY KEY,
		tipomotor_descripcion NVARCHAR(255)
	)
GO

	CREATE TABLE [FFAN].[BI_CantidadCambios] (
		CANTIDADCAMBIOS_id DECIMAL(2, 0) IDENTITY(1,1) NOT NULL PRIMARY KEY,
		CANTIDADCAMBIOS_nro decimal(2,0)
	)
GO


	CREATE TABLE [FFAN].[BI_RangoEtario] (
		rangoetario_id DECIMAL(2, 0) NOT NULL IDENTITY(1, 1) PRIMARY KEY,
		rangoetario_descripcion NVARCHAR(30)
	)
GO

	CREATE TABLE [FFAN].[BI_Cliente] (
		cliente_id DECIMAL(18, 0) NOT NULL PRIMARY KEY,
		cliente_sexo nvarchar(1),
		cliente_rango_etario DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_RangoEtario(rangoetario_id)
	)
GO

	CREATE TABLE [FFAN].[BI_Hechos_Compras] (
		compras_idtiempo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Tiempo(tiempo_id),
		compras_idcliente DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Cliente(cliente_id),
		compras_idsucursal DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Sucursal(sucursal_id),
		compras_idmodelo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Modelo(modelo_id),
		compras_idfabricante DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Fabricante(fabricante_id),
		compras_idtipocaja DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoCaja(tipocaja_id),
		compras_idtipoautomovil DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoAutomovil(tipoautomovil_id),
		compras_idrubroautoparte DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_RubroAutoparte(rubroautoparte_id),
		compras_idpotencia DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_Potencia(potencia_id),
		compras_idtipotransmision DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoTransmision(tipotransmision_id),
		compras_idtipomotor DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoMotor(tipomotor_id),
		compras_idCANTIDAD_CAMBIOS DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_CantidadCambios(CANTIDADCAMBIOS_id),
		compras_unidades_automov decimal(18,0) NOT NULL,
		compras_importe_automov decimal(18,2) NOT NULL,
		compras_unidades_autopart decimal(18,0) NOT NULL,
		compras_importe_autopart decimal(18,2) NOT NULL
	)
GO


	CREATE TABLE [FFAN].[BI_Hechos_Ventas] (
		ventas_idtiempo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Tiempo(tiempo_id),
		ventas_idcliente DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Cliente(cliente_id),
		ventas_idsucursal DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Sucursal(sucursal_id),
		ventas_idmodelo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Modelo(modelo_id),
		ventas_idfabricante DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Fabricante(fabricante_id),
		ventas_idtipocaja DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoCaja(tipocaja_id),
		ventas_idtipoautomovil DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoAutomovil(tipoautomovil_id),
		ventas_idrubroautoparte DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_RubroAutoparte(rubroautoparte_id),
		ventas_idpotencia DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_Potencia(potencia_id),
		ventas_idtipotransmision DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoTransmision(tipotransmision_id),
		ventas_idtipomotor DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoMotor(tipomotor_id),
		ventas_idCANTIDAD_CAMBIOS DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_CantidadCambios(CANTIDADCAMBIOS_id),
		ventas_unidades_automov decimal(18,0) NOT NULL,
		ventas_importe_automov decimal(18,2) NOT NULL,
		ventas_unidades_autopart decimal(18,0) NOT NULL,
		ventas_importe_autopart decimal(18,2) NOT NULL
	)
GO

/* 
   FEDE
	CREATE TABLE [FFAN].[BI_Sucursal](
	CREATE TABLE [FFAN].[BI_Modelo] (
	CREATE TABLE [FFAN].[BI_Fabricante] (
	CREATE TABLE [FFAN].[BI_TipoCaja] (

FACU
	CREATE TABLE [FFAN].[BI_TipoAutomovil] (
	CREATE TABLE [FFAN].[BI_RubroAutoparte] (
    CREATE TABLE [FFAN].[BI_Autoparte] (

NACHO
	CREATE TABLE [FFAN].[BI_Potencia] (
	CREATE TABLE [FFAN].[BI_Tiempo] (
	CREATE TABLE [FFAN].[BI_TipoTransmision] (

ALEXIS
	CREATE TABLE [FFAN].[BI_TipoMotor] (
	CREATE TABLE [FFAN].[BI_CANTIDAD_CAMBIOS] (
	CREATE TABLE [FFAN].[BI_RangoEtario] (
	CREATE TABLE [FFAN].[BI_Cliente] (
	
	
DISCUTIMOS MEJOR OPCION EL LUNES
	CREATE TABLE [FFAN].[BI_Hechos_Compras] (
	CREATE TABLE [FFAN].[BI_Hechos_Ventas] (


*/



INSERT INTO
	FFAN.BI_TipoAutomovil
SELECT
	TIPO_AUTO_CODIGO,
	TIPO_AUTO_DESC
FROM
	FFAN.TIPO_AUTO
GO

INSERT INTO FFAN.BI_RubroAutoparte values (0,null)
GO

/* Inserts Alexis */
INSERT
	INTO
	FFAN.BI_CantidadCambios (cantidadcambios_nro)
values (null)
GO


insert
	into
	FFAN.BI_TipoMotor
select
	tm.TIPO_MOTOR_CODIGO,
	tm.TIPO_MOTOR_DESC
from
	ffan.TIPO_MOTOR tm
GO


insert into ffan.BI_RangoEtario (rangoetario_descripcion ) values ('18 a 30 años')
go
insert into ffan.BI_RangoEtario (rangoetario_descripcion ) values ('31 a 50 años')
go
insert into ffan.BI_RangoEtario (rangoetario_descripcion ) values ('Mayor de 50 años')
go
insert into ffan.BI_RangoEtario (rangoetario_descripcion ) values ('Sin información')
go

insert
	into
	ffan.BI_Cliente (cliente_id, cliente_sexo, cliente_rango_etario )
select
	c.CLIENTE_ID,
	null,
	CASE
		when floor(DATEDIFF(day, c.CLIENTE_FECHA_NAC, getdate())/ 365.2425) between 18 and 30 then 1
		when floor(DATEDIFF(day, c.CLIENTE_FECHA_NAC, getdate())/ 365.2425) between 31 and 50 then 2
		when floor(DATEDIFF(day, c.CLIENTE_FECHA_NAC, getdate())/ 365.2425) > 50 then 3
		else 4
	end
from
	ffan.CLIENTE c
go
	
/* Fin inserción alexis */ 
	

-- NACHO

insert
	into
	FFAN.BI_TipoTransmision
select
	tt.TIPO_TRANSMISION_CODIGO,
	tt.TIPO_TRANSMISION_DESC
from
	ffan.TIPO_TRANSMISION tt
GO


insert into ffan.BI_Potencia (potencia_descripcion ) values ('50-150cv')
go
insert into ffan.BI_Potencia (potencia_descripcion ) values ('151-300cv')
go
insert into ffan.BI_Potencia (potencia_descripcion ) values ('> 300cv')
go

DECLARE @MES INT 
DECLARE @ANIO INT
SET @MES=1
SET @ANIO=18
WHILE ( @ANIO <= 20)
BEGIN
	IF @MES <=12
		BEGIN
			insert into ffan.BI_Tiempo (tiempo_mes,tiempo_anio) values (@MES, @ANIO)
			SET @MES  = @MES  + 1;
	END
	ELSE
		BEGIN
			SET @MES=1
			SET @ANIO=@ANIO+1
		END
END

--NACHO
