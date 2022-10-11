/****************************************************************************************
   $Archivo: Tabla_Producto
   $Autor:   Juan Sebastian Guzman Valencia
   $Fecha Creación:        6/10/2022
   $Objetivo:		almacena la informacion de los productos
*****************************************************************************************/

CREATE VIEW [vw_lista_cliente_no_mayor_35] AS
select 
fac.id, cl.nombres, cl.apellidos, cl.edad, fac.fecha_compra 
from 
	Tabla_Cliente cl
	inner join Tabla_Facturacion fac on cl.id = fac.id_cliente
where 
	cl.edad < 35 and 
	fac.fecha_compra between '2000/02/01' and '2000/05/25'