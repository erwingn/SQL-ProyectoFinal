USE dbecommerce;

-- Transacción para eliminar 2 registros de la tabla Pagos
START TRANSACTION;
	DELETE FROM Pagos WHERE id_pago IN (4, 5);
-- ROLLBACK
-- COMMIT

-- REINSERCION DE REGISTROS ELIMINADOS
/*START TRANSACTION;
	INSERT INTO Pagos (id_pago, descripcion) VALUES
	(4, 'Transferencia bancaria'),
    (5, 'Efectivo');
COMMIT;*/


-- Transacción para la inserción de registros en la tabla Marcas_Prod
START TRANSACTION;
INSERT INTO Marcas_Prod (id_marca, descripcion) VALUES (6, 'Puma');
INSERT INTO Marcas_Prod (id_marca, descripcion) VALUES (7, 'Calvin Klein');
INSERT INTO Marcas_Prod (id_marca, descripcion) VALUES (8, 'Gucci');
INSERT INTO Marcas_Prod (id_marca, descripcion) VALUES (9, 'Tommy Hilfiger');
SAVEPOINT POINT1;
INSERT INTO Marcas_Prod (id_marca, descripcion) VALUES (10, 'Versace');
INSERT INTO Marcas_Prod (id_marca, descripcion) VALUES  (11, 'Armani');
INSERT INTO Marcas_Prod (id_marca, descripcion) VALUES  (12, 'Fila');
INSERT INTO Marcas_Prod (id_marca, descripcion) VALUES  (13, 'Converse');
SAVEPOINT POINT2;
-- ROLLBACK TO POINT1;
-- COMMIT