---- Funciones ----
USE dbecommerce;

----- 1) Stock de un producto -----
------ Al ingresar el ID de un producto se podra conocer su stock -----

DROP FUNCTION IF EXISTS fn_stock_producto;
DELIMITER $$
CREATE FUNCTION fn_stock_producto(p_id_producto INT)
RETURNS INT DETERMINISTIC
BEGIN
  DECLARE v_stock INT;
  SET v_stock =(SELECT stock FROM Productos WHERE id_producto = p_id_producto);
  RETURN v_stock;
END $$
DELIMITER ;

SELECT fn_stock_producto(1);

----- 2) Recuperar Nombre y email por ID -----
------ Al ingresar el ID de un cliente se obtendra el nombre y el mail del mismo -----

DROP FUNCTION IF EXISTS fn_datos_clientes;
DELIMITER $$
CREATE FUNCTION fn_datos_clientes(p_id_cliente INT)
RETURNS VARCHAR(510) DETERMINISTIC
BEGIN
  DECLARE v_nombre_completo VARCHAR(255);
  DECLARE v_correo VARCHAR(255);
  SELECT CONCAT(nombre, ' ', apellido), correo INTO v_nombre_completo, v_correo FROM Clientes WHERE id_cliente = p_id_cliente;
  RETURN CONCAT(v_nombre_completo, ' - ', v_correo);
END $$
DELIMITER ;

SELECT fn_datos_clientes(2);

---- 3) Recuperar los productos solicitados para una ciudad dada ----

DROP FUNCTION IF EXISTS fn_productos_por_ciudad;
DELIMITER $$
CREATE FUNCTION fn_productos_por_ciudad(p_id_ciudad INT)
RETURNS TEXT DETERMINISTIC
BEGIN
  DECLARE v_productos TEXT;
  SELECT GROUP_CONCAT(pr.descripcion_prod SEPARATOR ', ') INTO v_productos
  FROM Productos pr
  INNER JOIN Detalle_Factura df ON pr.id_producto = df.id_producto
  INNER JOIN Facturas f ON df.id_factura = f.id_factura
  WHERE f.id_ciudad = p_id_ciudad;
  RETURN v_productos;
END $$
DELIMITER ;

select fn_productos_por_ciudad(1);