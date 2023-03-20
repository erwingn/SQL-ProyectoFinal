-----Inserción de Datos ----
USE DBEcommerce;

INSERT INTO Ciudad (id_ciudad, ciudad)
VALUES 
  (1, 'Buenos Aires'),
  (2, 'Córdoba'),
  (3, 'Rosario'),
  (4, 'Mendoza'),
  (5, 'La Plata');

INSERT INTO Categoria_Prod (id_categoria_prod, descripcion_cat_prod)
VALUES 
  (1, 'Camisetas'),
  (2, 'Pantalones'),
  (3, 'Zapatos'),
  (4, 'Abrigos'),
  (5, 'Vestidos');

INSERT INTO Marcas_Prod (id_marca, descripcion)
VALUES 
  (1, 'Adidas'),
  (2, 'Nike'),
  (3, 'Levis'),
  (4, 'H&M'),
  (5, 'Zara');

INSERT INTO Pagos (id_pago, descripcion)
VALUES 
  (1, 'Tarjeta de crédito'),
  (2, 'Tarjeta de débito'),
  (3, 'PayPal'),
  (4, 'Transferencia bancaria'),
  (5, 'Efectivo');

INSERT INTO Clientes (id_cliente, nombre, apellido, id_ciudad, direccion, documento, telefono, cuit, correo, usuario, password, fecha_nacimiento)
VALUES 
  (1, 'Juan', 'Pérez', 1, 'Av. Rivadavia 1234', 12345678, 11223344, 203456701, 'juanperez@gmail.com', 'jperez', '123456', '1980-01-01'),
  (2, 'María', 'González', 2, 'Calle San Martín 567', 23456789, 22334455, 273456701, 'mariagonzalez@gmail.com', 'mgonzalez', '456789', '1990-02-02'),
  (3, 'Pedro', 'Rodríguez', 3, 'Av. Pellegrini 789', 34567890, 33445566, 303456901, 'pedrorodriguez@gmail.com', 'prodriguez', '789012', '2000-03-03'),
  (4, 'Ana', 'Martínez', 4, 'Calle San Juan 901', 45678901, 44556677, 383456901, 'anamartinez@gmail.com', 'amartinez', '012345', '1995-04-04'),
  (5, 'Lucas', 'Gómez', 5, 'Av. 13 2468', 56789012, 55667788, 453456701, 'lucasgomez@gmail.com', 'lgomez', '678901', '1998-05-05');

INSERT INTO Productos (id_producto, descripcion_prod, costo, stock, id_categoria_prod, id_marca)
VALUES 
  (1, 'Camiseta blanca de algodón', 20.10, 50, 1, 1),
  (2, 'Pantalón negro de cuero', 80.00, 30, 2, 2),
  (3, 'Camisa de algodón blanca', 29.99, 20, 2, 3),
  (4, 'Sudadera con capucha gris', 49.99, 15, 1, 4),
  (5, 'Pantalones vaqueros ajustados', 59.99, 10, 2, 5),
  (6, 'Chaqueta de cuero marrón', 149.99, 5, 3, 1),
  (7, 'Vestido de fiesta largo', 99.99, 8, 4, 2);

INSERT INTO Facturas(id_factura, id_pago, id_cliente, estado, fecha_factura, total, direccion_envio, id_ciudad) VALUES
(1, 1, 1, 'En proceso', '2022-02-01', 280.20, 'Calle 1234', 1),
(2, 2, 2, 'Entregado', '2022-02-10', 129.99, 'Calle 5678', 2),
(3, 3, 3, 'Enviado', '2022-02-15', 29.99, 'Calle 9101', 3),
(4, 2, 4, 'Enviado', '2022-02-20', 139.97, 'Calle 1213', 4),
(5, 1, 5, 'En proceso', '2022-02-25', 149.99, 'Calle 1415', 5);

INSERT INTO Detalle_Factura(id_detalle, id_producto, id_factura, cantidad, subtotal) VALUES
(1, 1, 1, 2, 40.20),
(2, 2, 1, 3, 240.00),
(3, 4, 2, 1, 49.99),
(4, 1, 2, 4, 80.40),
(5, 3, 3, 1, 29.99),
(6, 3, 4, 1, 29.99),
(7, 5, 4, 1, 59.99),
(8, 4, 4, 1, 49.99),
(9, 6, 5, 1, 149.99);productos

