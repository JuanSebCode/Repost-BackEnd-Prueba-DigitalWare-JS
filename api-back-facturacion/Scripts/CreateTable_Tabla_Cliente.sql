/****************************************************************************************
   $Archivo: Tabla_Producto
   $Autor:   Juan Sebastian Guzman Valencia
   $Fecha Creación:        6/10/2022
   $Objetivo:		almacena la informacion de los productos
*****************************************************************************************/
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tabla_Cliente]') 
     AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[Tabla_Cliente](
       [id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
       [nombres] [varchar](50) NOT NULL,
	   [apellidos] [varchar](50) NULL,
       [edad] [bigint] NOT NULL    
CONSTRAINT [PK_Tabla_Cliente] PRIMARY KEY CLUSTERED 
(
      [id] ASC
)) ON [PRIMARY]

END