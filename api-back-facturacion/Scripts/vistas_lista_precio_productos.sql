/****************************************************************************************
   $Archivo: Tabla_Producto
   $Autor:   Juan Sebastian Guzman Valencia
   $Fecha Creación:        6/10/2022
   $Objetivo:		almacena la informacion de los productos
*****************************************************************************************/

CREATE VIEW [vw_lista_precios_productos] AS
select pr.id, pr.nombre_producto, inv.valor_und from Tabla_Inventario inv
inner join Tabla_Producto pr on inv.id_producto = pr.id;