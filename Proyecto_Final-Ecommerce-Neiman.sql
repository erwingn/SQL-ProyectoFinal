-- Creación de la BASE
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS DBEcommerce;
USE DBEcommerce;

-- -----------------------------------------------------
-- Creación de las TABLAS
-- -----------------------------------------------------
-- --------Tabla Ciudad ---------
CREATE TABLE IF NOT EXISTS Ciudad(
	id_ciudad INT NOT NULL PRIMARY KEY,
	ciudad VARCHAR(255) NOT NULL)
	ENGINE = InnoDB;

-- --------Tabla Categoria_Prod ---------
CREATE TABLE IF NOT EXISTS Categoria_Prod(
	id_categoria_prod INT NOT NULL PRIMARY KEY,
	descripcion_cat_prod VARCHAR(255) NOT NULL)
	ENGINE = InnoDB;

-- --------Tabla Marcas_Prod ---------
CREATE TABLE IF NOT EXISTS Marcas_Prod(
	id_marca INT NOT NULL PRIMARY KEY,
	descripcion VARCHAR(255) NOT NULL)
	ENGINE = InnoDB;
    
-- --------Tabla Pagos ---------
CREATE TABLE IF NOT EXISTS Pagos(
	id_pago INT NOT NULL PRIMARY KEY,
	descripcion VARCHAR(255) NOT NULL)
ENGINE = InnoDB;

-- --------Tabla Clientes ---------
CREATE TABLE IF NOT EXISTS Clientes(
	id_cliente INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    id_ciudad INT NOT NULL,
    direccion VARCHAR(255) NOT NULL,
	documento INT NOT NULL,
	telefono INT,
    cuit INT NOT NULL,
    correo VARCHAR(255) NOT NULL,
    usuario VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    FOREIGN KEY(id_ciudad) REFERENCES Ciudad(id_ciudad))
	ENGINE = InnoDB;

-- --------Tabla Productos ---------
CREATE TABLE IF NOT EXISTS Productos(
	id_producto INT NOT NULL PRIMARY KEY,
	descripcion_prod VARCHAR(255) NOT NULL,
    costo DECIMAL(8,2) NOT NULL,
	stock INT,
	id_categoria_prod INT NOT NULL,
    id_marca INT NOT NULL,
    FOREIGN KEY(id_categoria_prod) REFERENCES Categoria_Prod(id_categoria_prod),
    FOREIGN KEY(id_marca) REFERENCES Marcas_Prod(id_marca))
	ENGINE = InnoDB;
    
-- --------Tabla Facturas ---------
CREATE TABLE IF NOT EXISTS Facturas(
	id_factura INT NOT NULL PRIMARY KEY,
    id_pago INT NOT NULL,
    id_cliente INT NOT NULL,
    estado VARCHAR(255),
    fecha_factura DATE NOT NULL,
    total DECIMAL(8,2) NOT NULL,
    direccion_envio VARCHAR(255) NOT NULL,
    id_ciudad INT NOT NULL,
    FOREIGN KEY(id_pago) REFERENCES Pagos(id_pago),
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY(id_ciudad) REFERENCES Ciudad(id_ciudad))
	ENGINE = InnoDB;

-- --------Tabla Detalle_Factura ---------
CREATE TABLE IF NOT EXISTS Detalle_Factura(
	id_detalle INT NOT NULL PRIMARY KEY,
    id_producto INT NOT NULL,
    id_factura INT NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(8,2) NOT NULL,
    FOREIGN KEY(id_producto) REFERENCES Productos(id_producto),
    FOREIGN KEY(id_factura) REFERENCES Facturas(id_factura))
	ENGINE = InnoDB;
