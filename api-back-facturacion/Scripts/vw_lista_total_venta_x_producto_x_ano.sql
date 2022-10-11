/****************************************************************************************
   $Archivo: Vista valaor total por producto vendido al a�o
   $Autor:   Juan Sebastian Guzman Valencia
   $Fecha Creaci�n:        6/10/2022
   $Objetivo:		almacena la informacion de los productos vendidos en el a�o
*****************************************************************************************/
CREATE VIEW [vw_lista_total_venta_x_producto_x_ano] AS
select 
	fac.id,
	cl.nombre_producto, 
	--inv.existencia,
	fac.cantidad 'Cant_Vendido', 
	inv.valor_und, 
	(fac.cantidad * inv.valor_und)'total_venta',
	fac.fecha_compra
	--YEAR(fac.fecha_compra) as ano
from 
	Tabla_Producto cl
inner join Tabla_Inventario inv on cl.id = inv.id_producto
inner join Tabla_Facturacion fac on inv.id = fac.id_inventario
where 
	YEAR(fac.fecha_compra) = YEAR('01/01/2000')