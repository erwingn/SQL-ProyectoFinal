---- Triggers ----
USE dbecommerce;

---- Creación de tablas de Log para la tabla Clientes y Productos ----

------- Tabla LOG_Clientes --------

DROP TABLE IF EXISTS LOG_Clientes;
CREATE TABLE IF NOT EXISTS LOG_Clientes(
id_log INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_cliente INT NOT NULL,
operacion VARCHAR(255) NOT NULL,
usuario VARCHAR(100),
fecha DATE NOT NULL,
hora TIME NOT NULL)
ENGINE = InnoDB;


------- Tabla LOG_Productos -------

DROP TABLE IF EXISTS LOG_Productos;
CREATE TABLE IF NOT EXISTS LOG_Productos(
id_log INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_producto INT NOT NULL,
operacion VARCHAR(255) NOT NULL,
usuario VARCHAR(100),
fecha DATE NOT NULL,
hora TIME NOT NULL)
ENGINE = InnoDB;

------- Creación de Trigger para tabla Clientes ------- 
--------- El trigger BEFORE_Clientes se activará antes de que se realice una inserción en la tabla Clientes y guardará la información en la tabla LOG_Clientes. ---------
--------- El trigger AFTER_Clientes se activará después de una eliminación en la tabla Clientes y y guardará la información en la tabla LOG_Clientes. ---------

DROP TRIGGER IF EXISTS BEFORE_Clientes;
DELIMITER $$
CREATE TRIGGER BEFORE_Clientes BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN
	INSERT INTO LOG_Clientes (id_cliente, operacion, usuario, fecha, hora)
	VALUES (NEW.id_cliente, 'INSERCION', CURRENT_USER(), CURDATE(), CURTIME());
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS AFTER_Clientes;
DELIMITER $$
CREATE TRIGGER AFTER_Clientes AFTER DELETE ON Clientes
FOR EACH ROW
BEGIN
	INSERT INTO LOG_Clientes (id_cliente, operacion, usuario, fecha, hora)
	VALUES (OLD.id_cliente, 'ELIMINACION', CURRENT_USER(), CURDATE(), CURTIME());
END $$
DELIMITER ;

------- Creación de Trigger para tabla Productos ------- 
--------- El trigger BEFORE_Productos se activará antes de una actualización en la tabla Productos y guardará la información en la tabla LOG_Productos. ---------
--------- El trigger AFTER_Productos se activará después de una inserción en la tabla Productos y guardará la información en la tabla LOG_Productos. ---------

DROP TRIGGER IF EXISTS BEFORE_Productos;
DELIMITER $$
CREATE TRIGGER BEFORE_Productos BEFORE UPDATE ON Productos
FOR EACH ROW
BEGIN
	INSERT INTO LOG_Productos (id_producto, operacion, usuario, fecha, hora)
	VALUES (NEW.id_producto, 'ACTUALIZACION', CURRENT_USER(), CURDATE(), CURTIME());
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS AFTER_Productos;
DELIMITER $$
CREATE TRIGGER AFTER_Productos AFTER INSERT ON Productos
FOR EACH ROW
BEGIN
	INSERT INTO LOG_Productos (id_producto, operacion, usuario, fecha, hora)
	VALUES (NEW.id_producto, 'INSERCION', CURRENT_USER(), CURDATE(), CURTIME());
END $$
DELIMITER ;


SELECT * FROM LOG_Clientes;
SELECT * FROM LOG_Productos;

SELECT * FROM Productos;
SELECT * FROM Clientes;

INSERT INTO Clientes (id_cliente, nombre, apellido, id_ciudad, direccion, documento, telefono, cuit, correo, usuario, password, fecha_nacimiento)
VALUES (6, 'Pepe', 'Perez', 1, 'Av. Siempreviva 123', 12345678, 11223344, 205678901, 'pepeperez@email.com', 'pperez', '34567a', '2001-01-03');

DELETE FROM Clientes WHERE id_cliente = 6;

UPDATE Productos
SET descripcion_prod = 'Sudadera con capucha negra', costo = 59.99, stock = 20
WHERE id_producto = 4;

INSERT INTO Productos (id_producto, descripcion_prod, costo, stock, id_categoria_prod, id_marca)
VALUES (8, 'Camisa blanca', 19.99, 50, 1, 4);
