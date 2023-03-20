---- Procedimientos ----
USE dbecommerce;

---- Creación del stored procedure ----
----- 1) SP con 3 parametros para ordenar la tabla y el campo que se requiera en un orden indicado. -----
------ 1er parametro nombre de la tabla  -----
------ 2do parametro nombre del campo  -----
------ 3er parametro puede ser (ASC o DESC) Asc para ascendente o DESC para Descendente -----

DROP PROCEDURE IF EXISTS SP_OrdenarTabla;
DELIMITER $$
CREATE PROCEDURE SP_OrdenarTabla (
  IN p_tabla VARCHAR(50),
  IN p_campo VARCHAR(50),
  IN p_orden VARCHAR(4)
)
BEGIN
  SET @consulta = CONCAT("SELECT * FROM ", p_tabla, " ORDER BY ", p_campo, " ", p_orden);
  PREPARE ejecutar FROM @consulta;
  EXECUTE ejecutar;
  DEALLOCATE PREPARE ejecutar;
END $$
DELIMITER ;

CALL SP_OrdenarTabla('ciudad','ciudad','DESC');


----- 2) SP con 2 parametros para agregar o quitar registros de la tabla ciudad -----
------ 1er parametro Id Ciudad  -----
------ 2do parametro nombre de la ciudad  -----
------- Para Eliminar una ciudad: Ingresar ID a eliminar y nombre ciudad en NULL. -----
------- Para Insertar una ciudad: Ingresar ID como NULL, y nombre de la ciudad a insertar. -----

DROP PROCEDURE IF EXISTS SP_InsertarEliminarCiudad;

DELIMITER $$
CREATE PROCEDURE SP_InsertarEliminarCiudad (
  IN p_id_ciudad INT,
  IN p_ciudad VARCHAR(255)
)
BEGIN
  -- De acuerdo al valor del parametro Id inserta o elimina un registro. --
  IF p_id_ciudad IS NULL THEN
    -- Genera un nuevo ID automáticamente 	e inserta el registro. --
    SELECT MAX(id_ciudad) + 1 INTO p_id_ciudad FROM Ciudad;
    INSERT INTO Ciudad (id_ciudad, ciudad) VALUES (p_id_ciudad, p_ciudad);
    SELECT CONCAT('Se ha insertado la ciudad: ', p_ciudad) AS INSERCION;
  ELSE
    -- Busca y elimina el registro existente. --
    DELETE FROM Ciudad WHERE id_ciudad = p_id_ciudad;
    SELECT CONCAT('Se ha eliminado la ciudad con ID: ', p_id_ciudad) AS ELIMINACION;
  END IF;
END $$
DELIMITER ;

CALL SP_InsertarEliminarCiudad(NULL,"MENDOZA");
CALL SP_InsertarEliminarCiudad(6,NULL);

SELECT * FROM CIUDAD;
