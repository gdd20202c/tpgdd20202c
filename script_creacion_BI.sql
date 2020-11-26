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
		cliente_id DECIMAL(18, 0) NOT NULL identity (1,1) PRIMARY KEY,
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

/* Fin Inserts Fede */
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
SET @ANIO=2018
WHILE ( @ANIO <= 2020)
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
	modelo_codigo as modelo,
	fabricante_codigo as fabricante,
	TIPO_CAJA_CODIGO as tipo_caja,
	TIPO_AUTO_CODIGO as tipo_automovil,
    0 as rubroautoparte,
	potencia_id potencia,
	TIPO_TRANSMISION_CODIGO tipo_transmision,
	TIPO_MOTOR_CODIGO as tipo_motor,
	1 as cantidad_cambios,
	isnull(count(item_factura_automovil_nro),0) unidades_automov,
	isnull(sum(item_factura_automovil_precio),0) importe_automov,
	isnull(count(ITEM_FACTURA_AUTOPARTE_NRO),0) unidades_automov,
	isnull(sum(ITEM_FACTURA_AUTOPARTE_PRECIO),0) importe_automov
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
 	modelo_codigo,
	fabricante_codigo,
	TIPO_CAJA_CODIGO,
	TIPO_AUTO_CODIGO,
	potencia_id,
	TIPO_TRANSMISION_CODIGO,
	TIPO_MOTOR_CODIGO
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
		and tiempo_mes = MONTH(compra_FECHA)) as tiempo,
	clb.cliente_id as cliente,
	c.COMPRA_SUCURSAL_ID ,
	m.MODELO_CODIGO, 
	f.FABRICANTE_CODIGO,
	am.auto_TIPO_CAJA_CODIGO,
	am.auto_TIPO_CODIGO,
	0 as rubroautoparte,
	potencia_id potencia,
	TIPO_TRANSMISION_CODIGO tipo_transmision,
	TIPO_MOTOR_CODIGO as tipo_motor,
	1 as cantidad_cambios,
	isnull(count(ica.ITEM_COMPRA_AUTO_NRO),0) unidades_automov,
	isnull(sum(ica.ITEM_COMPRA_AUTO_AUTOMOVIL_PRECIO),0) importe_automov,
	isnull(count(ica2.ITEM_COMPRA_AUTOPARTE_NRO),0) unidades_automov,
	isnull(sum(ica2.ITEM_COMPRA_AUTOPARTE_PRECIO),0) importe_automov
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
	group by year(c.compra_fecha),
	month(c.compra_fecha),
	clb.cliente_id,
	c.COMPRA_SUCURSAL_ID ,
	m.MODELO_CODIGO, 
	f.fabricante_codigo,
	am.auto_TIPO_CAJA_CODIGO,
	am.auto_tipo_codigo,
	potencia_id,
	tt.TIPO_TRANSMISION_CODIGO,
	tm.TIPO_MOTOR_CODIGO
GO

-------
VISTAS
-------
-- Precio promedio de automóviles, vendidos y comprados

IF OBJECT_ID('V_Precio_Promedio_Automoviles', 'V') IS NOT NULL DROP VIEW[V_Precio_Promedio_Automoviles];
go
CREATE VIEW V_Precio_Promedio_Automoviles
AS 
select 
tipoautomovil_id tipo_automovil,
(select  sum(compras_importe_automov)/sum(compras_unidades_automov) from FFAN.BI_Hechos_Compras where compras_idtipoautomovil = tipoautomovil_id) prom_precio_compra,
(select  sum(ventas_importe_automov)/sum(ventas_unidades_automov) from FFAN.BI_Hechos_Ventas where ventas_idtipoautomovil = tipoautomovil_id) prom_precio_venta
from FFAN.BI_TipoAutomovil
GO

IF OBJECT_ID('V_Cantidad_Compras_Automoviles_Sucursal_Mes', 'V') IS NOT NULL DROP VIEW[V_Cantidad_Compras_Automoviles_Sucursal_Mes];
go
CREATE VIEW V_Cantidad_Compras_Automoviles_Sucursal_Mes
AS
select compras_idsucursal as SUCURSAL_COMPRA ,compras_idtiempo TIEMPO_COMPRA , sum(compras_unidades_automov) AS CANTIDAD_COMPRA 
from FFAN.BI_Hechos_Compras
group by compras_idtiempo, compras_idsucursal
go

IF OBJECT_ID('V_Cantidad_Ventas_Automoviles_Sucursal_Mes', 'V') IS NOT NULL DROP VIEW [V_Cantidad_Ventas_Automoviles_Sucursal_Mes];
go
CREATE VIEW V_Cantidad_Ventas_Automoviles_Sucursal_Mes
AS
select ventas_idsucursal as SUCURSAL ,ventas_idtiempo TIEMPO , sum(ventas_unidades_automov) AS CANTIDAD_COMPRA
from FFAN.BI_Hechos_Ventas
group by ventas_idtiempo, ventas_idsucursal
go



/*

Automóviles:
o Cantidad de automóviles, vendidos y comprados x sucursal y mes  NACHO
o Precio promedio de automóviles, vendidos y comprados.  FACU
o Ganancias (precio de venta – precio de compra) x Sucursal x mes FEDE
o Promedio de tiempo en stock de cada modelo de automóvil. ALEXIS
o 
Autopartes (Preguntar si autoparte es una dimensión y hay que llegar al detalle. En base a esto cambiamos las tablas de hechos agregando autoparte_id agrupado)
o Precio promedio de cada autoparte, vendida y comprada. 
o Ganancias (precio de venta – precio de compra) x Sucursal x mes
o Promedio de tiempo en stock de cada autoparte.
o Máxima cantidad de stock por cada sucursal (anual)

*/

