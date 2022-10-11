/****************************************************************************************
   $Archivo: Tabla_Producto
   $Autor:   Juan Sebastian Guzman Valencia
   $Fecha Creaci�n:        6/10/2022
   $Objetivo:		almacena la informacion de los productos
*****************************************************************************************/
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tabla_Producto]') 
     AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[Tabla_Producto](
       [id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
       [nombre_producto] [varchar](20) NOT NULL,
	   [detalle] [varchar](100) NULL
       
CONSTRAINT [PK_Tabla_Producto] PRIMARY KEY CLUSTERED 
(
      [id] ASC
)) ON [PRIMARY]

END