/****************************************************************************************

   $Autor:   Juan Sebastian Guzman Valencia
   $Fecha Creación:        6/10/2022
   $Objetivo:		almacena la informacion de los productos existencia
*****************************************************************************************/

CREATE VIEW [vw_lista_producto_existencia_min] AS
select 
	inv.id,
	pr.nombre_producto, 
	inv.existencia 
from 
	Tabla_Inventario inv
	inner join Tabla_Producto pr on inv.id_producto = pr.id
where 
	inv.existencia <= 5