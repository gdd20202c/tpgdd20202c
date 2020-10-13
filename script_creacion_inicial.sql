USE [GD2C2020]
GO

IF NOT EXISTS ( SELECT  *
                FROM    sys.schemas
                WHERE   name = N'FFAN' )
    EXEC('CREATE SCHEMA [FFAN]');
GO


DROP TABLE IF EXISTS [FFAN].[TIPO_CAJA] 
GO

CREATE TABLE [FFAN].[TIPO_CAJA] 
(
    TIPO_CAJA_CODIGO DECIMAL(18,0) NOT NULL IDENTITY(1,1) PRIMARY KEY,  /* VERIFICAR SI DEBERIA EMPEZAR POR 1000 EN VEZ DE 1 */
    TIPO_CAJA_DESC NVARCHAR(255)
)
GO

DROP TABLE IF EXISTS  [FFAN].[TIPO_TRANSMISION] 
GO

CREATE TABLE [FFAN].[TIPO_TRANSMISION] 
(
    TIPO_TRANSMISION_CODIGO DECIMAL(18,0) NOT NULL IDENTITY(1,1) PRIMARY KEY,  
    TIPO_TRANSMISION_DESC NVARCHAR(255)

)
GO

DROP TABLE IF EXISTS  [FFAN].[TIPO_MOTOR] 
GO

CREATE TABLE [FFAN].[TIPO_MOTOR] 
(
    TIPO_MOTOR_CODIGO DECIMAL(18,0) NOT NULL IDENTITY(1,1) PRIMARY KEY,  
    TIPO_MOTOR_DESC NVARCHAR(255)

)
GO

DROP TABLE IF EXISTS  [FFAN].[TIPO_AUTO] 
GO

CREATE TABLE [FFAN].[TIPO_AUTO] 
(
    TIPO_AUTO_CODIGO DECIMAL(18,0) NOT NULL IDENTITY(1,1) PRIMARY KEY,  
    TIPO_AUTO_DESC NVARCHAR(255)

)
GO

DROP TABLE IF EXISTS  [FFAN].[MODELO] 
GO

CREATE TABLE [FFAN].[MODELO] 
(
    MODELO_CODIGO DECIMAL(18,0) NOT NULL PRIMARY KEY,  
    MODELO_NOMBRE NVARCHAR(255),
    MODELO_POTENCIA DECIMAL(18,0)
)
GO

DROP TABLE IF EXISTS  [FFAN].[FABRICANTE] 
GO

CREATE TABLE [FFAN].[FABRICANTE] 
(
    FABRICANTE_CODIGO DECIMAL(18,0) NOT NULL IDENTITY(1,1) PRIMARY KEY,  
    FABRICANTE_NOMBRE NVARCHAR(255)

)
GO

DROP TABLE IF EXISTS [FFAN].[CLIENTE]
GO

CREATE TABLE [FFAN].[CLIENTE] 
(
    CLIENTE_ID DECIMAL(18,0) NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CLIENTE_APELLIDO NVARCHAR(255) NOT NULL,
    CLIENTE_NOMBRE NVARCHAR(255) NOT NULL,
    CLIENTE_DIRECCION NVARCHAR(255) NOT NULL,
    CLIENTE_DNI DECIMAL(18,0) NOT NULL,
    CLIENTE_FECHA_NAC  DATETIME2(3) NOT NULL,
    CLIENTE_EMAIL NVARCHAR(255),
)

DROP TABLE IF EXISTS [FFAN].[AUTOMOVIL]
GO

CREATE TABLE [FFAN].[AUTOMOVIL]
(
    AUTO_ID DECIMAL(18,0) NOT NULL IDENTITY(1,1) PRIMARY KEY,
    AUTO_PATENTE NVARCHAR(50) NOT NULL,
    AUTO_FECHA_ALTA DATETIME2(2) NOT NULL,
    AUTO_CANT_KMS DECIMAL(18,0) NOT NULL,
    AUTO_NRO_CHASIS NVARCHAR(50) NOT NULL,
    AUTO_NRO_MOTOR NVARCHAR(50) NOT NULL,
    AUTO_MODELO_CODIGO DECIMAL(18,0) FOREIGN KEY REFERENCES FFAN.MODELO(MODELO_CODIGO),
    AUTO_TIPO_CAJA_CODIGO DECIMAL(18,0) FOREIGN KEY REFERENCES FFAN.TIPO_CAJA(TIPO_CAJA_CODIGO),
    AUTO_TIPO_MOTOR_CODIGO DECIMAL(18,0) FOREIGN KEY REFERENCES FFAN.TIPO_MOTOR(TIPO_MOTOR_CODIGO),
    AUTO_TIPO_TRANSMISION DECIMAL(18,0) FOREIGN KEY REFERENCES FFAN.TIPO_TRANSMISION(TIPO_TRANSMISION_CODIGO),
    AUTO_TIPO_CODIGO DECIMAL(18,0) FOREIGN KEY REFERENCES FFAN.TIPO_AUTO(TIPO_AUTO_CODIGO),
    AUTO_FABRICANTE_CODIGO DECIMAL(18,0) FOREIGN KEY REFERENCES FFAN.FABRICANTE(FABRICANTE_CODIGO)
)

CREATE TABLE [FFAN].[SUCURSAL](
    SUCURSAL_ID DECIMAL(18,0) NOT NULL PRIMARY KEY,
    SUCURSAL_DIRECCION NVARCHAR(255),
    SUCURSAL_MAIL NVARCHAR(255),
    SUCURSAL_TELEFONO DECIMAL(18,0),
    SUCURSAL_CIUDAD NVARCHAR(255)
)



