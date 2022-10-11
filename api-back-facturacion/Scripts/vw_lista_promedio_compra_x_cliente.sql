/****************************************************************************************
   $Archivo: Tabla_Producto
   $Autor:   Juan Sebastian Guzman Valencia
   $Fecha Creación:        6/10/2022
   $Objetivo:		almacena la informacion de los productos x cliente
*****************************************************************************************/


CREATE VIEW [vw_lista_promedio_compra_x_cliente] AS
select 
	fac.id,
	fac.id_cliente,
	cl.nombres, cl.apellidos,
	((DATEDIFF(day, MIN (fac.fecha_compra), MAX (fac.fecha_compra))) / (SUM(fac.cantidad))) 'media_dias',
	DATEADD(DAY, ((DATEDIFF(day, MIN (fac.fecha_compra), MAX (fac.fecha_compra))) / (SUM(fac.cantidad))), GETDATE()) 'fecha_proxima_compra'
from 
	Tabla_Facturacion fac
	inner join Tabla_Cliente cl on fac.id_cliente = cl.id
where
	cl.id = 10
	group by fac.id_cliente, cl.nombres, cl.apellidos, fac.id