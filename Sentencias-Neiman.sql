USE dbecommerce;
-- Creación del usuario de solo lectura

-- Este usuario solo podrá realizar consultas SELECT en todas las tablas de la base de datos DBEcommerce
CREATE USER IF NOT EXISTS 'usu_lectura'@'localhost' IDENTIFIED BY 'pass_lectura';
GRANT SELECT ON DBEcommerce.* TO 'usu_lectura'@'localhost';

-- Creación del usuario con permisos de lectura, inserción y modificación de datos
-- Este usuario podrá realizar consultas SELECT, INSERT y UPDATE en todas las tablas de la base de datos DBEcommerce
CREATE USER IF NOT EXISTS 'usu_modificacion'@'localhost' IDENTIFIED BY 'pass_modificacion';
GRANT SELECT, INSERT, UPDATE ON DBEcommerce.* TO 'usu_modificacion'@'localhost';

-- Aplicar los cambios realizados a los privilegios
FLUSH PRIVILEGES;