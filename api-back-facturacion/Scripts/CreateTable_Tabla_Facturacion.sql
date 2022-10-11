/****************************************************************************************
   $Archivo: Tabla_Producto
   $Autor:   Juan Sebastian Guzman Valencia
   $Fecha Creación:        6/10/2022
   $Objetivo:		almacena la informacion de los productos
*****************************************************************************************/
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tabla_Facturacion]') 
     AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[Tabla_Facturacion](
       [id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	   [fecha_compra] [date] NOT NULL,
	   [id_inventario] [bigint] NOT NULL,
	   [id_cliente] [bigint] NOT NULL,
       [cantidad] [bigint] NOT NULL,
	   [descripcion] [varchar](100) NULL
	   
CONSTRAINT [PK_Tabla_Facturacion] PRIMARY KEY CLUSTERED ( [id] ASC ),
CONSTRAINT FK_Tabla_Inventario FOREIGN KEY (id_inventario) REFERENCES Tabla_Inventario(id),
CONSTRAINT FK_Tabla_Cliente FOREIGN KEY (id_cliente) REFERENCES Tabla_Cliente(id));

END