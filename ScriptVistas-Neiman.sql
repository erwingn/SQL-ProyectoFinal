------ Creacion de vistas -------
USE DBEcommerce;

---- 1) Vista de ventas por producto ----
----- Vista para mostrar la cantidad total de ventas y el total de ventas generados por cada producto vendido. ------

CREATE OR REPLACE VIEW VW_Ventas_por_Producto AS
SELECT P.id_producto, P.descripcion_prod, SUM(D.cantidad) AS total_ventas, SUM(D.subtotal) AS ingresos_totales
FROM Productos P
JOIN Detalle_Factura D ON P.id_producto = D.id_producto
GROUP BY P.id_producto;

SELECT * FROM VW_Ventas_por_Producto;

---- 2) Vista de facturas pendientes de pago ----
----- Vista para mostrar todos los pedidos que no han sido entregados, junto al total de las mismas. -----

CREATE OR REPLACE VIEW VW_Facturas_Pendientes AS
SELECT F.id_factura, C.nombre, C.apellido, F.fecha_factura, F.total
FROM Facturas F
JOIN Clientes C ON F.id_cliente = C.id_cliente
WHERE F.estado != 'Entregado';

SELECT * FROM VW_Facturas_Pendientes;

---- 3) Vista de clientes por ciudad ----
----- Vista para mostrar la cantidad de clientes registrados en cada ciudad. -----

CREATE OR REPLACE VIEW VW_Clientes_por_Ciudad AS
SELECT C.id_ciudad, CI.ciudad, COUNT(*) AS total_clientes
FROM Clientes C
JOIN Ciudad CI ON C.id_ciudad = CI.id_ciudad
GROUP BY C.id_ciudad;

SELECT * FROM VW_Clientes_por_Ciudad;

---- 4) Vista de productos sin stock ----
----- Vista para mostrar todos los productos que actualmente no tienen ningún stock disponible -----

CREATE OR REPLACE VIEW VW_Productos_Sin_Stock AS
SELECT id_producto, descripcion_prod
FROM Productos
WHERE stock = 0
ORDER BY descripcion_prod;

SELECT * FROM VW_Productos_Sin_Stock;

---- 5) Vista de facturas por mes ----
----- Vista para mostrar la cantidad de facturas emitidas y el total de ingresos generados por mes. -----

CREATE OR REPLACE VIEW VW_Facturas_por_Mes AS
SELECT MONTH(fecha_factura) AS mes, COUNT(*) AS total_facturas, SUM(total) AS ingresos_totales
FROM Facturas
GROUP BY MONTH(fecha_factura);

SELECT * FROM VW_Facturas_por_Mes;

