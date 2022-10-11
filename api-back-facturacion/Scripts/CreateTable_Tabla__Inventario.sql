/****************************************************************************************
   $Archivo: Tabla_Inventario
   $Autor:   Juan Sebastian Guzman Valencia
   $Fecha Creación:        6/10/2022
   $Objetivo:		almacena la informacion de los inventarios
*****************************************************************************************/
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tabla_Inventario]') 
     AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[Tabla_Inventario](
       [id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	   [id_producto] [bigint] NOT NULL,
       [cantidad] [bigint] NOT NULL,
	   [valor_und] [bigint] NOT NULL,
	   [existencia] [bigint] NOT NULL
	   
CONSTRAINT [PK_Tabla_Inventario] PRIMARY KEY CLUSTERED ( [id] ASC ),
CONSTRAINT FK_Tabla_Producto FOREIGN KEY (id_producto) REFERENCES Tabla_Producto(id));

END