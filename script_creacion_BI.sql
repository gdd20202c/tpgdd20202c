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

IF OBJECT_ID('FFAN.BI_Autoparte', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_Autoparte];
GO

IF OBJECT_ID('FFAN.BI_Automovil', 'U') IS NOT NULL DROP TABLE [FFAN].[BI_Automovil];
GO

	CREATE TABLE [FFAN].[BI_Autoparte] (
		autoparte_codigo DECIMAL(18, 0) NOT NULL  PRIMARY KEY,
		autoparte_descripcion nvarchar(255)
	)
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
		cliente_id DECIMAL(18, 0) NOT NULL identity (1,1) PRIMARY KEY,
		cliente_sexo nvarchar(1),
		cliente_rango_etario DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_RangoEtario(rangoetario_id)
	)
GO

CREATE TABLE [FFAN].[BI_Automovil] (
auto_id decimal(18,0) not null PRIMARY KEY,
auto_patente nvarchar(50) not null,
auto_fecha_alta datetime2(2) not null,
auto_nro_motor nvarchar(50) not null
)
GO 


CREATE TABLE [FFAN].[BI_Hechos_Compras] (
		compras_idtiempo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Tiempo(tiempo_id),
		compras_idcliente DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Cliente(cliente_id),
		compras_idsucursal DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Sucursal(sucursal_id),
		compra_fecha datetime NOT NULL,
		compra_auto_id DECIMAL(18,0) FOREIGN KEY REFERENCES FFAN.BI_Automovil(auto_id),
		compras_idmodelo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Modelo(modelo_id),
		compras_idfabricante DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Fabricante(fabricante_id),
		compras_idtipocaja DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoCaja(tipocaja_id),
		compras_idtipoautomovil DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoAutomovil(tipoautomovil_id),
		compras_idautoparte DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Autoparte(autoparte_codigo),
		compras_idrubroautoparte DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_RubroAutoparte(rubroautoparte_id),
		compras_idpotencia DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_Potencia(potencia_id),
		compras_idtipotransmision DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoTransmision(tipotransmision_id),
		compras_idtipomotor DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoMotor(tipomotor_id),
		compras_idCANTIDAD_CAMBIOS DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_CantidadCambios(CANTIDADCAMBIOS_id),
		compras_unidades_automov decimal (18,0),
		compras_importe_automov decimal(18,2),
		compras_unidades_autopart decimal(18,0),
		compras_importe_autopart decimal(18,2)
	)
GO


	CREATE TABLE [FFAN].[BI_Hechos_Ventas] (
		ventas_idtiempo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Tiempo(tiempo_id),
		ventas_idcliente DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Cliente(cliente_id),
		ventas_idsucursal DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Sucursal(sucursal_id),
		ventas_fecha_venta datetime2(2) not null,
		venta_auto_id DECIMAL(18,0) FOREIGN KEY REFERENCES FFAN.BI_Automovil(auto_id),
		ventas_idmodelo DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Modelo(modelo_id),
		ventas_idfabricante DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Fabricante(fabricante_id),
		ventas_idtipocaja DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoCaja(tipocaja_id),
		ventas_idtipoautomovil DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoAutomovil(tipoautomovil_id),
		ventas_idautoparte DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_Autoparte(autoparte_codigo),
		ventas_idrubroautoparte DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_RubroAutoparte(rubroautoparte_id),
		ventas_idpotencia DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_Potencia(potencia_id),
		ventas_idtipotransmision DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoTransmision(tipotransmision_id),
		ventas_idtipomotor DECIMAL(18, 0) FOREIGN KEY REFERENCES FFAN.BI_TipoMotor(tipomotor_id),
		ventas_idCANTIDAD_CAMBIOS DECIMAL(2, 0) FOREIGN KEY REFERENCES FFAN.BI_CantidadCambios(CANTIDADCAMBIOS_id),
		ventas_unidades_automov decimal(18,0),
		ventas_importe_automov decimal(18,2),
		ventas_unidades_autopart decimal(18,0),
		ventas_importe_autopart decimal(18,2)
	)
GO



INSERT INTO
	FFAN.BI_Autoparte
SELECT 
    AUTOPARTE_CODIGO,
	AUTOPARTE_DESCRIPCION
FROM
	FFAN.AUTOPARTE
GO


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
/* Inserts Fede */
INSERT INTO
	FFAN.BI_SUCURSAL
SELECT DISTINCT 
    SUCURSAL_ID,
	SUCURSAL_DIRECCION,
	SUCURSAL_MAIL,
	SUCURSAL_TELEFONO,
	SUCURSAL_CIUDAD
FROM
	FFAN.SUCURSAL

GO

INSERT INTO
	FFAN.BI_Modelo
SELECT
	MODELO_CODIGO,
	MODELO_NOMBRE,
	MODELO_POTENCIA
FROM
	FFAN.MODELO

GO
INSERT INTO
	 FFAN.BI_Fabricante
SELECT
	 FABRICANTE_CODIGO as fabricante_id,
     FABRICANTE_NOMBRE
FROM
	FFAN.FABRICANTE
GO

INSERT INTO
	FFAN.BI_TipoCaja
SELECT
	TIPO_CAJA_CODIGO tipocaja_id,
    TIPO_CAJA_DESC tipocaja_descripcion
FROM
	FFAN.TIPO_CAJA tc

	
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
	ffan.BI_Cliente (cliente_sexo, cliente_rango_etario ) values ('M',1)
go
insert
	into
	ffan.BI_Cliente ( cliente_sexo, cliente_rango_etario ) values ('M',2)
go
insert
	into
	ffan.BI_Cliente (cliente_sexo, cliente_rango_etario ) values ('M',3)
go
insert
	into
	ffan.BI_Cliente ( cliente_sexo, cliente_rango_etario ) values ('M',4)
go
insert
	into
	ffan.BI_Cliente ( cliente_sexo, cliente_rango_etario ) values ('F',1)
go
insert
	into
	ffan.BI_Cliente (cliente_sexo, cliente_rango_etario ) values ('F',2)
go
insert
	into
	ffan.BI_Cliente (cliente_sexo, cliente_rango_etario ) values ('F',3)
go
insert
	into
	ffan.BI_Cliente ( cliente_sexo, cliente_rango_etario ) values ('F',4)
go
insert
	into
	ffan.BI_Cliente (cliente_sexo, cliente_rango_etario ) values (null,1)
go
insert
	into
	ffan.BI_Cliente (cliente_sexo, cliente_rango_etario ) values (null,2)
go
insert
	into
	ffan.BI_Cliente (cliente_sexo, cliente_rango_etario ) values (null,3)
go
insert
	into
	ffan.BI_Cliente ( cliente_sexo, cliente_rango_etario ) values (null,4)
go



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
SET @ANIO=2018
WHILE ( @ANIO <= 2020)
BEGIN
	IF @MES <=12
		BEGIN
			insert into ffan.BI_Tiempo (tiempo_mes,tiempo_anio) values (@MES, @ANIO)
			SET @MES  = @MES  + 1
	END
	ELSE
		BEGIN
			SET @MES=1
			SET @ANIO=@ANIO+1
		END
END
GO


insert
	into
	FFAN.BI_Automovil
SELECT
	a.auto_id,
	a.auto_patente,
	a.auto_fecha_alta,
	a.auto_nro_motor
from
	FFAN.AUTOMOVIL a
GO

-- VENTAS
insert into FFAN.BI_Hechos_Ventas
select
	(
	select
		tiempo_id
	from
		FFAN.BI_Tiempo
	where
		tiempo_anio = YEAR(FACTURA_FECHA)
		and tiempo_mes = MONTH(FACTURA_FECHA)) as tiempo,
	clb.cliente_id as cliente,
	(
	select
		sucursal_id
	from
		FFAN.SUCURSAL
	where
		sucursal_direccion = factura_sucursal_direccion
		and sucursal_ciudad = factura_sucursal_ciudad) as sucursal,
	factura_fecha as fecha_venta,
	auto_id, 
	modelo_codigo as modelo,
	fabricante_codigo as fabricante,
	TIPO_CAJA_CODIGO as tipo_caja,
	TIPO_AUTO_CODIGO as tipo_automovil,
	AUTOPARTE_CODIGO,
    0 as rubroautoparte,
	potencia_id potencia,
	TIPO_TRANSMISION_CODIGO tipo_transmision,
	TIPO_MOTOR_CODIGO as tipo_motor,
	1 as cantidad_cambios,
	count(item_factura_automovil_nro) as unidades_automovil,
	isnull(sum(item_factura_automovil_precio),0) importe_automovil,
	isnull(sum(ITEM_FACTURA_AUTOPARTE_cant),0) unidades_autoparte,
	isnull(sum(ITEM_FACTURA_AUTOPARTE_PRECIO),0) importe_autoparte
from
	FFAN.FACTURA
left join FFAN.ITEM_FACTURA_AUTOMOVIL on
	FACTURA_NUMERO = ITEM_FACTURA_AUTOMOVIL_NRO
left join FFAN.ITEM_FACTURA_AUTOPARTE on
	FACTURA_NUMERO = ITEM_FACTURA_AUTOPARTE_NRO
left join FFAN.AUTOMOVIL on
	AUTO_ID = ITEM_FACTURA_AUTOMOVIL_ID
left join FFAN.AUTOPARTE on
	AUTOPARTE_CODIGO = item_factura_autoparte_codigo
left join FFAN.MODELO on
	(modelo_codigo = auto_modelo_codigo
	or modelo_codigo = AUTOPARTE_MODELO_CODIGO)
left join FFAN.FABRICANTE fab on
	(FABRICANTE_CODIGO = AUTO_FABRICANTE_CODIGO
	or FABRICANTE_CODIGO = AUTOPARTE_FABRICANTE_CODIGO)
left join FFAN.TIPO_CAJA on
	(TIPO_CAJA_CODIGO = AUTO_TIPO_CAJA_CODIGO)
left join FFAN.TIPO_AUTO on
	(TIPO_AUTO_CODIGO = AUTO_TIPO_CODIGO)
left join FFAN.TIPO_TRANSMISION on
	(TIPO_TRANSMISION_CODIGO = AUTO_TIPO_TRANSMISION)
left join FFAN.TIPO_MOTOR on
	(TIPO_MOTOR_CODIGO = AUTO_TIPO_MOTOR_CODIGO)
join FFAN.CLIENTE cl on
	cl.cliente_id = factura_cliente_id
join FFAN.BI_CLIENTE clb on
	(clb.cliente_sexo is null
	and clb.cliente_rango_etario =
	(case
		when DATEDIFF(yy, cl.cliente_fecha_nac, factura_fecha) between 18 and 30 then 1
		when DATEDIFF(yy, cl.cliente_fecha_nac, factura_fecha) between 31 and 50 then 2
		when DATEDIFF(yy, cl.cliente_fecha_nac, factura_fecha) > 50 then 3
		else 4
	end) )
join FFAN.BI_Potencia on
	(potencia_descripcion =
	(case
		when modelo_potencia between 50 and 150 then '50-150cv'
		when modelo_potencia between 151 and 300 then '151-300cv'
		else '> 300cv'
	end) )
group by
	year(factura_fecha),
	month(factura_fecha),
	clb.cliente_id,
	factura_sucursal_ciudad,
	factura_sucursal_direccion,
	factura_fecha,
	auto_id,
 	modelo_codigo,
	fabricante_codigo,
	TIPO_CAJA_CODIGO,
	TIPO_AUTO_CODIGO,
	potencia_id,
	TIPO_TRANSMISION_CODIGO,
	TIPO_MOTOR_CODIGO,
	AUTOPARTE_CODIGO
GO	
	
	
-- Compras
insert into FFAN.BI_Hechos_Compras
select
	(
	select
		tiempo_id
	from
		FFAN.BI_Tiempo
	where
		tiempo_anio = YEAR(c.COMPRA_FECHA)
		and tiempo_mes = MONTH(compra_FECHA)) as tiempo_id,
	clb.cliente_id as cliente,
	c.COMPRA_SUCURSAL_ID,
	c.COMPRA_FECHA ,
	am.AUTO_ID ,
	m.MODELO_CODIGO,
	f.FABRICANTE_CODIGO,
	am.auto_TIPO_CAJA_CODIGO,
	am.auto_TIPO_CODIGO,
	ap.AUTOPARTE_CODIGO,
	0 as rubroautoparte,
	potencia_id potencia,
	TIPO_TRANSMISION_CODIGO tipo_transmision,
	TIPO_MOTOR_CODIGO as tipo_motor,
	1 as cantidad_cambios,
	count(ica.item_compra_auto_nro) as unidades_automovil,
	isnull(sum(ica.ITEM_COMPRA_AUTO_AUTOMOVIL_PRECIO),0) importe_automov,
	isnull(sum(ica2.ITEM_COMPRA_AUTOPARTE_CANT),0) unidades_autoparte,
	isnull(sum(ica2.ITEM_COMPRA_AUTOPARTE_PRECIO),0) importe_autoparte
from
	FFAN.COMPRA c
left join FFAN.ITEM_COMPRA_AUTOMOVIL ica on
	c.COMPRA_NRO = ica.ITEM_compra_AUTO_NRO
left join FFAN.AUTOMOVIL am on
	ica.item_compra_auto_id = am.AUTO_ID
left join FFAN.ITEM_COMPRA_AUTOPARTE ica2 on
	c.COMPRA_NRO = ica2.ITEM_COMPRA_AUTOPARTE_NRO
left join FFAN.AUTOPARTE ap on
	ap.AUTOPARTE_CODIGO = ica2.item_compra_autoparte_codigo
left join FFAN.MODELO m on
	(m.modelo_codigo = am.auto_modelo_codigo
	or m.modelo_codigo = ap.AUTOPARTE_MODELO_CODIGO)
left join ffan.TIPO_CAJA tc on
	am.auto_tipo_caja_codigo = tc.TIPO_CAJA_CODIGO
left join FFAN.FABRICANTE f on
	(f.FABRICANTE_CODIGO = am.AUTO_FABRICANTE_CODIGO
	or f.FABRICANTE_CODIGO = ap.AUTOPARTE_FABRICANTE_CODIGO)
left join FFAN.TIPO_CAJA tp on
	(tp.TIPO_CAJA_CODIGO = am.AUTO_TIPO_CAJA_CODIGO)
left join FFAN.TIPO_AUTO ta on
	(ta.TIPO_AUTO_CODIGO = am.AUTO_TIPO_CODIGO)
left join FFAN.TIPO_TRANSMISION tt on
	(tt.TIPO_TRANSMISION_CODIGO = am.AUTO_TIPO_TRANSMISION)
left join FFAN.TIPO_MOTOR tm on
	(tm.TIPO_MOTOR_CODIGO = am.AUTO_TIPO_MOTOR_CODIGO)
join FFAN.CLIENTE cl on
	cl.cliente_id = c.compra_cliente
join FFAN.BI_CLIENTE clb on
	(clb.cliente_sexo is null
	and clb.cliente_rango_etario =
	(case
		when DATEDIFF(yy, cl.cliente_fecha_nac, compra_fecha) between 18 and 30 then 1
		when DATEDIFF(yy, cl.cliente_fecha_nac, compra_fecha) between 31 and 50 then 2
		when DATEDIFF(yy, cl.cliente_fecha_nac, compra_fecha) > 50 then 3
		else 4
	end) )
join FFAN.BI_Potencia p on
	(p.potencia_descripcion =
	(case
		when m.modelo_potencia between 50 and 150 then '50-150cv'
		when m.modelo_potencia between 151 and 300 then '151-300cv'
		else '> 300cv'
	end) )
group by
	year(c.compra_fecha),
	month(c.compra_fecha),
	clb.cliente_id,
	c.COMPRA_SUCURSAL_ID ,
	c.COMPRA_FECHA ,
	m.MODELO_CODIGO,
	f.fabricante_codigo,
	am.auto_TIPO_CAJA_CODIGO,
	am.auto_tipo_codigo,
	potencia_id,
	tt.TIPO_TRANSMISION_CODIGO,
	tm.TIPO_MOTOR_CODIGO,
	ap.AUTOPARTE_CODIGO,
	am.AUTO_ID
GO

-------
--VISTAS
-------
-- Precio promedio de automóviles, vendidos y comprados








/*

Automóviles:
o Cantidad de automóviles, vendidos y comprados x sucursal y mes  NACHO */
IF OBJECT_ID('FFAN.V_CANTIDAD_AUTOMOVILES_SUCURSAL_MES', 'V') IS NOT NULL DROP VIEW [FFAN].[V_CANTIDAD_AUTOMOVILES_SUCURSAL_MES];
GO

CREATE VIEW FFAN.V_CANTIDAD_AUTOMOVILES_SUCURSAL_MES
AS
SELECT T.TIEMPO_ID AS TIEMPO_COMPRA, S.SUCURSAL_ID  AS SUCURSAL_COMPRA, 
ISNULL((SELECT SUM(VENTAS_UNIDADES_AUTOMOV) 
FROM FFAN.BI_HECHOS_VENTAS WHERE VENTAS_IDSUCURSAL = S.SUCURSAL_ID AND VENTAS_IDTIEMPO = T.TIEMPO_ID),0) AS VENTAS,
ISNULL((SELECT SUM(COMPRAS_UNIDADES_AUTOMOV) 
FROM FFAN.BI_HECHOS_COMPRAS WHERE COMPRAS_IDSUCURSAL = S.SUCURSAL_ID AND COMPRAS_IDTIEMPO = T.TIEMPO_ID),0)AS COMPRAS
FROM FFAN.BI_TIEMPO T, FFAN.BI_SUCURSAL S
GO

/* o Precio promedio de automóviles, vendidos y comprados.  FACU */
IF OBJECT_ID('FFAN.V_Precio_Promedio_Automoviles', 'V') IS NOT NULL DROP VIEW [FFAN].[V_Precio_Promedio_Automoviles];
go

CREATE VIEW FFAN.V_Precio_Promedio_Automoviles AS
select
	tipoautomovil_id tipo_automovil,
	(
	select
		sum(compras_importe_automov)/ count(compras_importe_automov)
	from
		FFAN.BI_Hechos_Compras
	where
		compras_idtipoautomovil = tipoautomovil_id) prom_precio_compra,
	(
	select
		sum(ventas_importe_automov)/ count(ventas_importe_automov)
	from
		FFAN.BI_Hechos_Ventas
	where
		ventas_idtipoautomovil = tipoautomovil_id) prom_precio_venta
from
	FFAN.BI_TipoAutomovil
GO

/*o Ganancias (precio de venta – precio de compra) x Sucursal x mes FEDE */

IF OBJECT_ID('FFAN.V_AUTOMOVIL_GANANCIA_SUC_MES', 'V') IS NOT NULL DROP VIEW FFAN.V_AUTOMOVIL_GANANCIA_SUC_MES;
go
CREATE VIEW FFAN.V_AUTOMOVIL_GANANCIA_SUC_MES
AS
select 
s.sucursal_id, t.tiempo_anio as año, t.tiempo_mes as mes,
(isnull((select  sum(hv.ventas_importe_automov) 
         from FFAN.BI_Hechos_Ventas hv 
		 where hv.ventas_idtiempo = t.tiempo_id and hv.ventas_idsucursal=s.sucursal_id),0) -
isnull((select  sum(hc.compras_importe_automov) 
        from FFAN.BI_Hechos_Compras hc 
		where hc.compras_idtiempo = t.tiempo_id and hc.compras_idsucursal=s.sucursal_id),0))  as ganancias
from FFAN.BI_Sucursal s, FFAN.BI_Tiempo t
GO

/*  Promedio de tiempo en stock de cada modelo de automóvil. ALEXIS */

IF OBJECT_ID('FFAN.DETALLE_STOCK_AUTO_MODELO_VW', 'V') IS NOT NULL DROP VIEW [FFAN].[DETALLE_STOCK_AUTO_MODELO_VW];
go	
create view FFAN.DETALLE_STOCK_AUTO_MODELO_VW AS
select
	bhc.compra_auto_id,
	bhc.compras_idmodelo,
	bhc.compra_fecha,
	bhv.ventas_fecha_venta,
	case 
	when bhv.ventas_fecha_venta is null then datediff(day,bhc.compra_fecha, getdate() )
	ELSE 
	datediff(day,bhc.compra_fecha, bhv.ventas_fecha_venta) 
	end as dias_stock
from
	ffan.BI_Hechos_Compras bhc
left join ffan.BI_Hechos_Ventas bhv on
	bhc.compra_auto_id = bhv.venta_auto_id
where bhc.compra_auto_id is not null
GO 

IF OBJECT_ID('FFAN.PROMEDIO_STOCK_DIAS_MODELO_AUTOMOVIL', 'V') IS NOT NULL DROP VIEW [FFAN].[PROMEDIO_STOCK_DIAS_MODELO_AUTOMOVIL]
go		
create view FFAN.PROMEDIO_STOCK_DIAS_MODELO_AUTOMOVIL AS
SELECT
	dsamv.compras_idmodelo,
	AVG(dsamv.dias_stock) AS DIAS_PROMEDIO_STOCK
FROM
	FFAN.DETALLE_STOCK_AUTO_MODELO_VW dsamv
GROUP BY
	dsamv.compras_idmodelo
GO 


if OBJECT_ID('FFAN.CalculaStockMaximoAutoparte','P') is not null
DROP PROCEDURE [FFAN].CalculaStockMaximoAutoparte
GO

CREATE PROCEDURE FFAN.CalculaStockMaximoAutoparte 
as
begin

if OBJECT_ID('FFAN.TABLATEMPORAL','U') is not null
DROP TABLE FFAN.TABLATEMPORAL

create table FFAN.TABLATEMPORAL (
	idSucursal decimal(18,0),
	id_autoparte decimal(18, 0),
	fecha datetime,
	unidad decimal(18,0),
	operacion varchar(1),
	acumuladoStock decimal(18,0),
)

insert into FFAN.TABLATEMPORAL 
select
	bhc.compras_idsucursal as Sucursal,
	bhc.compras_idautoparte as Autoparte,
	bhc.compra_fecha as Fecha,
	bhc.compras_unidades_autopart as Unidades,
	'C' as Operacion,
	0 as Acumulado
	from FFAN.BI_Hechos_Compras bhc
where
	bhc.compra_auto_id is null
union
select
	bhv.ventas_idsucursal as Sucursal,
	bhv.ventas_idautoparte as Autoparte,
	bhv.ventas_fecha_venta as Fecha,
	bhv.ventas_unidades_autopart,
	'V' as Operacion,
	0
	from FFAN.BI_Hechos_Ventas bhv
where
	bhv.venta_auto_id is null



if OBJECT_ID('FFAN.StockAutoparte','U') is not null
DROP TABLE FFAN.StockAutoparte

create table FFAN.StockAutoparte(
	idSucursal decimal(18,0),
	id_autoparte decimal(18, 0),
	anio int,
	stockMaximo int
)

Declare 
@id_sucursal decimal(18, 0),
@id_autoparte decimal(18, 0),
@fecha datetime,
@unidad int,
@operacion varchar(2),
@acumuladoStock int

declare stock_maximo_autoparte_sucursal_fecha cursor 
for select *
from
FFAN.TABLATEMPORAL
order by
1,2,3


declare @id_sucursal_ant decimal(18,0)
declare @id_autoparte_ant decimal(18,0)
declare @anio_ant int
declare @stockTemporal int
declare @maximo int

open stock_maximo_autoparte_sucursal_fecha 
fetch stock_maximo_autoparte_sucursal_fecha
into
	@id_sucursal,
	@id_autoparte,
	@fecha,
	@unidad,
	@operacion,
	@acumuladoStock

set @id_sucursal_ant  =	@id_sucursal
set @id_autoparte_ant =	@id_autoparte
set @anio_ant = year(@fecha)
set @stockTemporal = 0
set @maximo = 0

while @@fetch_status = 0
begin 
	
	while (@id_sucursal = @id_sucursal_ant and @id_autoparte_ant = @id_autoparte and @anio_ant = year(@fecha)) and @@fetch_status = 0
	begin
		
		if @operacion = 'C'
		begin
			set @stockTemporal = @stockTemporal + @unidad
		end
		else
		begin
			set @stockTemporal = @stockTemporal - @unidad
		end
		if @maximo < @stockTemporal
		begin
			set @maximo = @stockTemporal
		end
		

		fetch stock_maximo_autoparte_sucursal_fecha
		into
		@id_sucursal,
		@id_autoparte,
		@fecha,
		@unidad,
		@operacion,
		@acumuladoStock
	end
		insert into FFAN.StockAutoparte values (@id_sucursal_ant,@id_autoparte_ant,@anio_ant,@maximo)
		set @id_sucursal_ant  =	@id_sucursal
		set @id_autoparte_ant =	@id_autoparte
		set @anio_ant = year(@fecha)
		set @stockTemporal = 0
		set @maximo = 0
end

CLOSE stock_maximo_autoparte_sucursal_fecha
DEALLOCATE stock_maximo_autoparte_sucursal_fecha 
end

go

exec FFAN.CalculaStockMaximoAutoparte


if OBJECT_ID('FFAN.STOCK_MAXIMO_AUTOPARTE_ANIO_SUCURSAL','V') is not null
DROP VIEW FFAN.STOCK_MAXIMO_AUTOPARTE_ANIO_SUCURSAL
GO

CREATE VIEW FFAN.STOCK_MAXIMO_AUTOPARTE_ANIO_SUCURSAL
AS
select idSucursal,id_autoparte,anio,stockMaximo from FFAN.StockAutoparte
group by
idSucursal,
id_autoparte,
anio,
stockMaximo
GO

SELECT * FROM FFAN.STOCK_MAXIMO_AUTOPARTE_ANIO_SUCURSAL
ORDER BY STOCKMAXIMO DESC



/* Precio promedio de cada autoparte, vendida y comprada. NACHO */

IF OBJECT_ID('FFAN.V_PRECIO_PROMEDIO_AUTOPARTE', 'V') IS NOT NULL DROP VIEW [FFAN].[V_PRECIO_PROMEDIO_AUTOPARTE];
GO
CREATE VIEW FFAN.V_PRECIO_PROMEDIO_AUTOPARTE
AS
SELECT A.AUTOPARTE_CODIGO AS CODIGO_AUTOPARTE,
ISNULL((SELECT SUM(VENTAS_IMPORTE_AUTOPART)/SUM(VENTAS_UNIDADES_AUTOPART) 
FROM FFAN.BI_HECHOS_VENTAS WHERE VENTAS_IDAUTOPARTE = A.AUTOPARTE_CODIGO),0) AS PRECIO_PROMEDIO_VENTA,
ISNULL((SELECT SUM(COMPRAS_IMPORTE_AUTOPART)/SUM(COMPRAS_UNIDADES_AUTOPART) 
FROM FFAN.BI_HECHOS_COMPRAS WHERE COMPRAS_IDAUTOPARTE = A.AUTOPARTE_CODIGO),0) AS PRECIO_PROMEDIO_COMPRA
FROM FFAN.BI_AUTOPARTE A
GROUP BY A.AUTOPARTE_CODIGO
GO


-- Ganancias (precio de venta – precio de compra) x Sucursal x mes FACU
IF OBJECT_ID('FFAN.V_AUTOPARTE_GANANCIA_SUC_MES', 'V') IS NOT NULL DROP VIEW [FFAN].[V_AUTOPARTE_GANANCIA_SUC_MES];
go
CREATE VIEW FFAN.V_AUTOPARTE_GANANCIA_SUC_MES
AS
select 
s.sucursal_id,
t.tiempo_anio anio,
t.tiempo_mes mes,
(isnull((select  sum(ventas_importe_autopart) from FFAN.BI_Hechos_Ventas where ventas_idtiempo = t.tiempo_id and ventas_idsucursal=s.sucursal_id),0) -
isnull((select  sum(compras_importe_autopart) from FFAN.BI_Hechos_Compras where compras_idtiempo = t.tiempo_id and compras_idsucursal=s.sucursal_id),0))  as ganancias
from FFAN.BI_Sucursal s, FFAN.BI_Tiempo t
GO



-- Máxima cantidad de stock por cada sucursal (anual) ALEXIS
 -- FALTA COMPLETAR




	


/* los autos se compran en una sucursal y se pueden vender en otra. Pero el stock está relacionado con el tiempo que una sucursal tuvo el auto hasta que lo vendio
 * no me importa si se vendio en otra sucursal, el tiempo y stock queda registrado en quien compró el auto*/





	
