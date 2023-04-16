-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: dbecommerce
-- ------------------------------------------------------
-- Server version	8.0.32

------ Tablas del backup: Ciudad, Clientes, detalle_factura, facturas, log_clientes, log_productos, marcas_prod, pagos y productos -------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria_prod`
--

DROP TABLE IF EXISTS `categoria_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_prod` (
  `id_categoria_prod` int NOT NULL,
  `descripcion_cat_prod` varchar(255) NOT NULL,
  PRIMARY KEY (`id_categoria_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_prod`
--

LOCK TABLES `categoria_prod` WRITE;
/*!40000 ALTER TABLE `categoria_prod` DISABLE KEYS */;
INSERT INTO `categoria_prod` VALUES (1,'Camisetas'),(2,'Pantalones'),(3,'Zapatos'),(4,'Abrigos'),(5,'Vestidos');
/*!40000 ALTER TABLE `categoria_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id_ciudad` int NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Buenos Aires'),(2,'Córdoba'),(3,'Rosario'),(4,'Mendoza'),(5,'La Plata'),(6,'MENDOZA');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `id_ciudad` int NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `documento` int NOT NULL,
  `telefono` int DEFAULT NULL,
  `cuit` int NOT NULL,
  `correo` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_ciudad` (`id_ciudad`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Pérez',1,'Av. Rivadavia 1234',12345678,11223344,203456701,'juanperez@gmail.com','jperez','123456','1980-01-01'),(2,'María','González',2,'Calle San Martín 567',23456789,22334455,273456701,'mariagonzalez@gmail.com','mgonzalez','456789','1990-02-02'),(3,'Pedro','Rodríguez',3,'Av. Pellegrini 789',34567890,33445566,303456901,'pedrorodriguez@gmail.com','prodriguez','789012','2000-03-03'),(4,'Ana','Martínez',4,'Calle San Juan 901',45678901,44556677,383456901,'anamartinez@gmail.com','amartinez','012345','1995-04-04'),(5,'Lucas','Gómez',5,'Av. 13 2468',56789012,55667788,453456701,'lucasgomez@gmail.com','lgomez','678901','1998-05-05');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura` (
  `id_detalle` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_factura` int NOT NULL,
  `cantidad` int NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_producto` (`id_producto`),
  KEY `id_factura` (`id_factura`),
  CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (1,1,1,2,40.20),(2,2,1,3,240.00),(3,4,2,1,49.99),(4,1,2,4,80.40),(5,3,3,1,29.99),(6,3,4,1,29.99),(7,5,4,1,59.99),(8,4,4,1,49.99),(9,6,5,1,149.99);
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` int NOT NULL,
  `id_pago` int NOT NULL,
  `id_cliente` int NOT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `fecha_factura` date NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `direccion_envio` varchar(255) NOT NULL,
  `id_ciudad` int NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_pago` (`id_pago`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_ciudad` (`id_ciudad`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`),
  CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,1,1,'En proceso','2022-02-01',280.20,'Calle 1234',1),(2,2,2,'Entregado','2022-02-10',129.99,'Calle 5678',2),(3,3,3,'Enviado','2022-02-15',29.99,'Calle 9101',3),(4,2,4,'Enviado','2022-02-20',139.97,'Calle 1213',4),(5,1,5,'En proceso','2022-02-25',149.99,'Calle 1415',5);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_clientes`
--

DROP TABLE IF EXISTS `log_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_clientes` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `operacion` varchar(255) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_clientes`
--

LOCK TABLES `log_clientes` WRITE;
/*!40000 ALTER TABLE `log_clientes` DISABLE KEYS */;
INSERT INTO `log_clientes` VALUES (1,6,'INSERCION','root@localhost','2023-03-14','18:09:11'),(2,6,'ELIMINACION','root@localhost','2023-03-14','18:09:34');
/*!40000 ALTER TABLE `log_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_productos`
--

DROP TABLE IF EXISTS `log_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_productos` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `operacion` varchar(255) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_productos`
--

LOCK TABLES `log_productos` WRITE;
/*!40000 ALTER TABLE `log_productos` DISABLE KEYS */;
INSERT INTO `log_productos` VALUES (1,4,'ACTUALIZACION','root@localhost','2023-03-14','18:12:10'),(2,8,'INSERCION','root@localhost','2023-03-14','18:12:40');
/*!40000 ALTER TABLE `log_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas_prod`
--

DROP TABLE IF EXISTS `marcas_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas_prod` (
  `id_marca` int NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas_prod`
--

LOCK TABLES `marcas_prod` WRITE;
/*!40000 ALTER TABLE `marcas_prod` DISABLE KEYS */;
INSERT INTO `marcas_prod` VALUES (1,'Adidas'),(2,'Nike'),(3,'Levis'),(4,'H&M'),(5,'Zara');
/*!40000 ALTER TABLE `marcas_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` int NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'Tarjeta de crédito'),(2,'Tarjeta de débito'),(3,'PayPal'),(4,'Transferencia bancaria'),(5,'Efectivo');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL,
  `descripcion_prod` varchar(255) NOT NULL,
  `costo` decimal(8,2) NOT NULL,
  `stock` int DEFAULT NULL,
  `id_categoria_prod` int NOT NULL,
  `id_marca` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria_prod` (`id_categoria_prod`),
  KEY `id_marca` (`id_marca`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria_prod`) REFERENCES `categoria_prod` (`id_categoria_prod`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marcas_prod` (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Camiseta blanca de algodón',20.10,50,1,1),(2,'Pantalón negro de cuero',80.00,30,2,2),(3,'Camisa de algodón blanca',29.99,20,2,3),(4,'Sudadera con capucha negra',59.99,20,1,4),(5,'Pantalones vaqueros ajustados',59.99,10,2,5),(6,'Chaqueta de cuero marrón',149.99,5,3,1),(7,'Vestido de fiesta largo',99.99,8,4,2),(8,'Camisa blanca',19.99,50,1,4);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-29 18:31:37
