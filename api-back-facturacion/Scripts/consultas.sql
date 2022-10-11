select * from Tabla_Cliente
select * from Tabla_Producto
select * from Tabla_Inventario
select * from Tabla_Facturacion

-- delete from Tabla_Facturacion
--DBCC CHECKIDENT ('Tabla_Facturacion', RESEED, 0);

-- LISTA PRECIOS TODOS LOS PRODUCTOS
select pr.nombre_producto, inv.valor_und from Tabla_Inventario inv
inner join Tabla_Producto pr on inv.id_producto = pr.id

-- LISTA PRODUCTOS EXISTENCIA MINIMO PERMITIDO 5
select 
	pr.nombre_producto, 
	inv.existencia 
from 
	Tabla_Inventario inv
	inner join Tabla_Producto pr on inv.id_producto = pr.id
where 
	inv.existencia <= 5

-- LISTA CLIENTE NO MAYORES 35
select 
	cl.nombres + ' ' +cl.apellidos,  
	cl.edad, fac.fecha_compra 
from 
	Tabla_Cliente cl
	inner join Tabla_Facturacion fac on cl.id = fac.id_cliente
where 
	cl.edad < 35 and 
	fac.fecha_compra between '2000/02/01' and '2000/05/25'

-- OBTENER VALOR TOTAL VENDIDO POR CADA PRODUCTO AL AÑO 2000
select 
	cl.nombre_producto, 
	--inv.existencia,
	fac.cantidad 'Cant_Vendido', 
	inv.valor_und, 
	(fac.cantidad * inv.valor_und)'TOTAL_VENDIDO',
	fac.fecha_compra
	--YEAR(fac.fecha_compra) as ano
from 
	Tabla_Producto cl
inner join Tabla_Inventario inv on cl.id = inv.id_producto
inner join Tabla_Facturacion fac on inv.id = fac.id_inventario
where 
	YEAR(fac.fecha_compra) = YEAR('01/01/2000')

-- OBTENER ULTIMA FECHA POSIBLE COMPRA

select 
	DATEDIFF(day, MIN (fac.fecha_compra), MAX (fac.fecha_compra)) 'DIF'
from 
	Tabla_Facturacion fac
	inner join Tabla_Cliente cl on fac.id_cliente = cl.id
where
	cl.id = 10

select 
	SUM(fac.cantidad) AS TOTAL_CANT
from 
	Tabla_Facturacion fac
	inner join Tabla_Cliente cl on fac.id_cliente = cl.id
where
	cl.id = 10

select 
	fac.id_cliente,
	cl.nombres,
	((DATEDIFF(day, MIN (fac.fecha_compra), MAX (fac.fecha_compra))) / (SUM(fac.cantidad))) 'MEDIA DIAS',
	DATEADD(DAY, ((DATEDIFF(day, MIN (fac.fecha_compra), MAX (fac.fecha_compra))) / (SUM(fac.cantidad))), GETDATE()) 'PROXIMA COMPRA'
from 
	Tabla_Facturacion fac
	inner join Tabla_Cliente cl on fac.id_cliente = cl.id
where
	cl.id = 10
	group by fac.id_cliente, cl.nombres



select 
	--cl.nombres + ' ' +cl.apellidos, 
	fac.fecha_compra
	--fac.cantidad,
	--SUM(fac.cantidad) AS TOTAL_CANT
	--MAX (fac.fecha_compra) 'MAXDATE', 
	--MIN (fac.fecha_compra) 'MINDATE',
	--DATEDIFF(day, MIN (fac.fecha_compra), MAX (fac.fecha_compra)) 'DIF'
	
from 
	Tabla_Facturacion fac
	inner join Tabla_Cliente cl on fac.id_cliente = cl.id
where
	cl.id = 10
	--GROUP BY cl.nombres, cl.apellidos, fac.fecha_compra, fac.cantidad
	

------------------------------
select * from vw_lista_precios_productos
select * from vw_lista_producto_existencia_min