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
	IF OBJECT_ID('FFAN.BI_Autoparte', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_Autoparte];
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
		sucursal_id DECIMAL(18, 0) NOT NULL IDENTITY(1, 1) PRIMARY KEY,
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
		fabricante_id DECIMAL(18, 0) NOT NULL IDENTITY(1, 1) PRIMARY KEY,
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


	CREATE TABLE [FFAN].[BI_Autoparte] (
		autoparte_id DECIMAL(18, 0) NOT NULL PRIMARY KEY,
		autoparte_descripcion nvarchar(255),
		autoparte_rubro DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_RubroAutoparte(rubroautoparte_id)
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
		tipotransmision_id DECIMAL(18, 0) NOT NULL IDENTITY(1, 1) PRIMARY KEY,
		tipotransmision_descripcion NVARCHAR(255)
	)
GO

	CREATE TABLE [FFAN].[BI_TipoMotor] (
		tipomotor_id DECIMAL(18, 0) NOT NULL IDENTITY(1, 1) PRIMARY KEY,
		tipomotor_descripcion NVARCHAR(255)
	)
GO

	CREATE TABLE [FFAN].[BI_CantidadCambios] (
		cantidadcambios_id DECIMAL(2, 0) NOT NULL IDENTITY(1, 1) PRIMARY KEY,
		cantidadcambios_nro decimal(2,0)
	)
GO


	CREATE TABLE [FFAN].[BI_RangoEtario] (
		rangoetario_id DECIMAL(2, 0) NOT NULL IDENTITY(1, 1) PRIMARY KEY,
		rangoetario_descripcion NVARCHAR(30)
	)
GO

	CREATE TABLE [FFAN].[BI_Cliente] (
		cliente_id DECIMAL(2, 0) NOT NULL PRIMARY KEY,
		cliente_sexo nvarchar(1),
		cliente_rango_etario DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_RangoEtario(rangoetario_id)
	)
GO

	CREATE TABLE [FFAN].[BI_Hechos_Compras] (
		compras_idtiempo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Tiempo(tiempo_id),
		compras_idcliente DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_Cliente(cliente_id),
		compras_idsucursal DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Sucursal(sucursal_id),
		compras_idmodelo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Modelo(modelo_id),
		compras_idfabricante DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Fabricante(fabricante_id),
		compras_idtipocaja DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoCaja(tipocaja_id),
		compras_idtipoautomovil DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoAutomovil(tipoautomovil_id),
		compras_idautoparte DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Autoparte(autoparte_id),
		compras_idpotencia DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_Potencia(potencia_id),
		compras_idtipotransmision DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoTransmision(tipotransmision_id),
		compras_idtipomotor DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoMotor(tipomotor_id),
		compras_idcantidadcambios DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_CantidadCambios(cantidadcambios_id),
		compras_unidades_automov decimal(18,0) NOT NULL,
		compras_importe_automov decimal(18,2) NOT NULL,
		compras_unidades_autopart decimal(18,0) NOT NULL,
		compras_importe_autopart decimal(18,2) NOT NULL
	)
GO


	CREATE TABLE [FFAN].[BI_Hechos_Ventas] (
		ventas_idtiempo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Tiempo(tiempo_id),
		ventas_idcliente DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_Cliente(cliente_id),
		ventas_idsucursal DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Sucursal(sucursal_id),
		ventas_idmodelo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Modelo(modelo_id),
		ventas_idfabricante DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Fabricante(fabricante_id),
		ventas_idtipocaja DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoCaja(tipocaja_id),
		ventas_idtipoautomovil DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoAutomovil(tipoautomovil_id),
		ventas_idautoparte DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Autoparte(autoparte_id),
		ventas_idpotencia DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_Potencia(potencia_id),
		ventas_idtipotransmision DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoTransmision(tipotransmision_id),
		ventas_idtipomotor DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoMotor(tipomotor_id),
		ventas_idcantidadcambios DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_CantidadCambios(cantidadcambios_id),
		ventas_unidades_automov decimal(18,0) NOT NULL,
		ventas_importe_automov decimal(18,2) NOT NULL,
		ventas_unidades_autopart decimal(18,0) NOT NULL,
		ventas_importe_autopart decimal(18,2) NOT NULL
	)
GO