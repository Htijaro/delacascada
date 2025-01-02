-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbh2o
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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

CREATE DATABASE IF NOT EXISTS `dbh2o`;

USE `dbh2o`;

-- Table structure for table `appcarrito_cart`
--

DROP TABLE IF EXISTS `appcarrito_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appcarrito_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appcarrito_cart`
--

LOCK TABLES `appcarrito_cart` WRITE;
/*!40000 ALTER TABLE `appcarrito_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `appcarrito_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appcarrito_cartitem`
--

DROP TABLE IF EXISTS `appcarrito_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appcarrito_cartitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(10) unsigned NOT NULL CHECK (`cantidad` >= 0),
  `precio` int(11) DEFAULT NULL,
  `foto_producto` varchar(100) NOT NULL,
  `cart_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AppCarrito_cartitem_cart_id_1228f24b_fk_AppCarrito_cart_id` (`cart_id`),
  KEY `AppCarrito_cartitem_producto_id_527d36a2_fk_producto_idproducto` (`producto_id`),
  CONSTRAINT `AppCarrito_cartitem_cart_id_1228f24b_fk_AppCarrito_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `appcarrito_cart` (`id`),
  CONSTRAINT `AppCarrito_cartitem_producto_id_527d36a2_fk_producto_idproducto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appcarrito_cartitem`
--

LOCK TABLES `appcarrito_cartitem` WRITE;
/*!40000 ALTER TABLE `appcarrito_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `appcarrito_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AppUsuarios_usuarios`
--

DROP TABLE IF EXISTS `AppUsuarios_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AppUsuarios_usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `observaciones` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `AppUsuarios_usuarios_email_8c29677f_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AppUsuarios_usuarios`
--

LOCK TABLES `AppUsuarios_usuarios` WRITE;
/*!40000 ALTER TABLE `AppUsuarios_usuarios` DISABLE KEYS */;
INSERT INTO `AppUsuarios_usuarios` VALUES (1,'pbkdf2_sha256$720000$a23Db8ryaJeqyJUxsaQWJ4$npAVVibhGB83GJhEO/3XtT3G20l6PgqJQwbsksWV2CE=','2024-11-16 21:10:07.002285',0,'AuxiliarVentas','Armando','Casas','auxiliarventas@delacascada.com',0,1,'2024-11-16 21:09:30.285811','Carrera 8 No. 65 -25','311789632',NULL);
/*!40000 ALTER TABLE `AppUsuarios_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AppUsuarios_usuarios_groups`
--

DROP TABLE IF EXISTS `AppUsuarios_usuarios_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AppUsuarios_usuarios_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuarios_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AppUsuarios_usuarios_groups_usuarios_id_group_id_49a7fe95_uniq` (`usuarios_id`,`group_id`),
  KEY `AppUsuarios_usuarios_groups_group_id_5a12c939_fk_auth_group_id` (`group_id`),
  CONSTRAINT `AppUsuarios_usuarios_groups_group_id_5a12c939_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `AppUsuarios_usuarios_usuarios_id_d7034d2a_fk_AppUsuari` FOREIGN KEY (`usuarios_id`) REFERENCES `AppUsuarios_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AppUsuarios_usuarios_groups`
--

LOCK TABLES `AppUsuarios_usuarios_groups` WRITE;
/*!40000 ALTER TABLE `AppUsuarios_usuarios_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `AppUsuarios_usuarios_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AppUsuarios_usuarios_user_permissions`
--

DROP TABLE IF EXISTS `AppUsuarios_usuarios_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AppUsuarios_usuarios_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuarios_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AppUsuarios_usuarios_use_usuarios_id_permission_i_49a00c2b_uniq` (`usuarios_id`,`permission_id`),
  KEY `AppUsuarios_usuarios_permission_id_7142757c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `AppUsuarios_usuarios_permission_id_7142757c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `AppUsuarios_usuarios_usuarios_id_f5ccf0e6_fk_AppUsuari` FOREIGN KEY (`usuarios_id`) REFERENCES `AppUsuarios_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AppUsuarios_usuarios_user_permissions`
--

LOCK TABLES `AppUsuarios_usuarios_user_permissions` WRITE;
/*!40000 ALTER TABLE `AppUsuarios_usuarios_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `AppUsuarios_usuarios_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appventas_factura`
--

DROP TABLE IF EXISTS `appventas_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appventas_factura` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `id_cliente` varchar(20) NOT NULL,
  PRIMARY KEY (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appventas_factura`
--

LOCK TABLES `appventas_factura` WRITE;
/*!40000 ALTER TABLE `appventas_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `appventas_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Domicilio',6,'add_domicilio'),(22,'Can change Domicilio',6,'change_domicilio'),(23,'Can delete Domicilio',6,'delete_domicilio'),(24,'Can view Domicilio',6,'view_domicilio'),(25,'Can add Pedido',7,'add_pedidos'),(26,'Can change Pedido',7,'change_pedidos'),(27,'Can delete Pedido',7,'delete_pedidos'),(28,'Can view Pedido',7,'view_pedidos'),(29,'Can add Ventas',8,'add_ventas'),(30,'Can change Ventas',8,'change_ventas'),(31,'Can delete Ventas',8,'delete_ventas'),(32,'Can view Ventas',8,'view_ventas'),(33,'Can add factura',9,'add_factura'),(34,'Can change factura',9,'change_factura'),(35,'Can delete factura',9,'delete_factura'),(36,'Can view factura',9,'view_factura'),(37,'Can add Control Calidades',10,'add_controlcalidad'),(38,'Can change Control Calidades',10,'change_controlcalidad'),(39,'Can delete Control Calidades',10,'delete_controlcalidad'),(40,'Can view Control Calidades',10,'view_controlcalidad'),(41,'Can add Ficha Producción',11,'add_fichaproduccion'),(42,'Can change Ficha Producción',11,'change_fichaproduccion'),(43,'Can delete Ficha Producción',11,'delete_fichaproduccion'),(44,'Can view Ficha Producción',11,'view_fichaproduccion'),(45,'Can add Entradas',12,'add_entradas'),(46,'Can change Entradas',12,'change_entradas'),(47,'Can delete Entradas',12,'delete_entradas'),(48,'Can view Entradas',12,'view_entradas'),(49,'Can add Productos',13,'add_producto'),(50,'Can change Productos',13,'change_producto'),(51,'Can delete Productos',13,'delete_producto'),(52,'Can view Productos',13,'view_producto'),(53,'Can add Proveedores',14,'add_proveedores'),(54,'Can change Proveedores',14,'change_proveedores'),(55,'Can delete Proveedores',14,'delete_proveedores'),(56,'Can view Proveedores',14,'view_proveedores'),(57,'Can add Salidas',15,'add_salida'),(58,'Can change Salidas',15,'change_salida'),(59,'Can delete Salidas',15,'delete_salida'),(60,'Can view Salidas',15,'view_salida'),(61,'Can add Insumos',16,'add_insumos'),(62,'Can change Insumos',16,'change_insumos'),(63,'Can delete Insumos',16,'delete_insumos'),(64,'Can view Insumos',16,'view_insumos'),(65,'Can add Inventarios',17,'add_controlinventario'),(66,'Can change Inventarios',17,'change_controlinventario'),(67,'Can delete Inventarios',17,'delete_controlinventario'),(68,'Can view Inventarios',17,'view_controlinventario'),(69,'Can add cart',18,'add_cart'),(70,'Can change cart',18,'change_cart'),(71,'Can delete cart',18,'delete_cart'),(72,'Can view cart',18,'view_cart'),(73,'Can add cart item',19,'add_cartitem'),(74,'Can change cart item',19,'change_cartitem'),(75,'Can delete cart item',19,'delete_cartitem'),(76,'Can view cart item',19,'view_cartitem'),(77,'Can add user',20,'add_usuarios'),(78,'Can change user',20,'change_usuarios'),(79,'Can delete user',20,'delete_usuarios'),(80,'Can view user',20,'view_usuarios');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlcalidad`
--

DROP TABLE IF EXISTS `controlcalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlcalidad` (
  `idcontrolcalidad` bigint(20) NOT NULL AUTO_INCREMENT,
  `catacioncalidad` varchar(30) DEFAULT NULL,
  `registrocontrocalidadl` varchar(30) DEFAULT NULL,
  `hallazgoscalidad` varchar(30) DEFAULT NULL,
  `fechavencimiento` date DEFAULT NULL,
  PRIMARY KEY (`idcontrolcalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlcalidad`
--

LOCK TABLES `controlcalidad` WRITE;
/*!40000 ALTER TABLE `controlcalidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlcalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlinventario`
--

DROP TABLE IF EXISTS `controlinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlinventario` (
  `idinventario` bigint(20) NOT NULL AUTO_INCREMENT,
  `almacenajeproductos` varchar(50) DEFAULT NULL,
  `solicitudcompra` varchar(50) DEFAULT NULL,
  `identrada_id` bigint(20) DEFAULT NULL,
  `idinsumo_id` bigint(20) DEFAULT NULL,
  `idproducto_id` bigint(20) NOT NULL,
  `idsalida_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idinventario`),
  KEY `controlinventario_idproducto_id_980507e8_fk_producto_idproducto` (`idproducto_id`),
  KEY `controlinventario_idsalida_id_7daa58c7_fk_salida_idsalida` (`idsalida_id`),
  KEY `controlinventario_identrada_id_e5fede7a_fk_entradas_identrada` (`identrada_id`),
  KEY `controlinventario_idinsumo_id_18adb562_fk_insumos_idinsumo` (`idinsumo_id`),
  CONSTRAINT `controlinventario_identrada_id_e5fede7a_fk_entradas_identrada` FOREIGN KEY (`identrada_id`) REFERENCES `entradas` (`identrada`),
  CONSTRAINT `controlinventario_idinsumo_id_18adb562_fk_insumos_idinsumo` FOREIGN KEY (`idinsumo_id`) REFERENCES `insumos` (`idinsumo`),
  CONSTRAINT `controlinventario_idproducto_id_980507e8_fk_producto_idproducto` FOREIGN KEY (`idproducto_id`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `controlinventario_idsalida_id_7daa58c7_fk_salida_idsalida` FOREIGN KEY (`idsalida_id`) REFERENCES `salida` (`idsalida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlinventario`
--

LOCK TABLES `controlinventario` WRITE;
/*!40000 ALTER TABLE `controlinventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_AppUsuarios_usuarios_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_AppUsuarios_usuarios_id` FOREIGN KEY (`user_id`) REFERENCES `AppUsuarios_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-09-18 16:01:54.876848','2','AsistenteAdministrativo',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Observaciones\"]}}]',20,1),(2,'2024-11-16 20:52:21.743155','3','AuxiliarVentas',2,'[{\"changed\": {\"fields\": [\"Observaciones\"]}}]',20,1),(3,'2024-11-16 20:56:30.583037','3','AuxiliarVentas',3,'',20,1),(4,'2024-11-16 20:59:05.834838','2','AsistenteAdministrativo',3,'',20,1),(5,'2024-11-16 21:01:54.617362','4','AuxiliarVentas',2,'[{\"changed\": {\"fields\": [\"Observaciones\"]}}]',20,1),(6,'2024-11-16 21:07:43.045796','4','AuxiliarVentas',3,'',20,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(18,'AppCarrito','cart'),(19,'AppCarrito','cartitem'),(17,'AppInventario','controlinventario'),(12,'AppInventario','entradas'),(16,'AppInventario','insumos'),(13,'AppInventario','producto'),(14,'AppInventario','proveedores'),(15,'AppInventario','salida'),(10,'AppProduccion','controlcalidad'),(11,'AppProduccion','fichaproduccion'),(20,'AppUsuarios','usuarios'),(6,'AppVentas','domicilio'),(9,'AppVentas','factura'),(7,'AppVentas','pedidos'),(8,'AppVentas','ventas'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'AppInventario','0001_initial','2024-09-18 15:55:39.198719'),(2,'AppInventario','0002_alter_producto_precioproductoinv','2024-09-18 15:55:39.289659'),(3,'AppInventario','0003_rename_identradas_entradas_identrada_and_more','2024-09-18 15:55:39.322652'),(4,'AppInventario','0004_entradas_idinsumo_alter_controlinventario_identrada_and_more','2024-09-18 15:55:41.626063'),(5,'contenttypes','0001_initial','2024-09-18 15:55:41.651891'),(6,'contenttypes','0002_remove_content_type_name','2024-09-18 15:55:41.704070'),(7,'auth','0001_initial','2024-09-18 15:55:41.927306'),(8,'auth','0002_alter_permission_name_max_length','2024-09-18 15:55:41.976402'),(9,'auth','0003_alter_user_email_max_length','2024-09-18 15:55:41.981411'),(10,'auth','0004_alter_user_username_opts','2024-09-18 15:55:41.987401'),(11,'auth','0005_alter_user_last_login_null','2024-09-18 15:55:41.993408'),(12,'auth','0006_require_contenttypes_0002','2024-09-18 15:55:41.996404'),(13,'auth','0007_alter_validators_add_error_messages','2024-09-18 15:55:42.001402'),(14,'auth','0008_alter_user_username_max_length','2024-09-18 15:55:42.007411'),(15,'auth','0009_alter_user_last_name_max_length','2024-09-18 15:55:42.014409'),(16,'auth','0010_alter_group_name_max_length','2024-09-18 15:55:42.025571'),(17,'auth','0011_update_proxy_permissions','2024-09-18 15:55:42.033581'),(18,'auth','0012_alter_user_first_name_max_length','2024-09-18 15:55:42.038968'),(19,'AppUsuarios','0001_initial','2024-09-18 15:55:42.270508'),(20,'AppVentas','0001_initial','2024-09-18 15:55:42.409602'),(21,'AppVentas','0002_alter_pedidos_estadopedido','2024-09-18 15:55:42.414601'),(22,'AppVentas','0003_pedidos_cantidad_pedidos_precioproductoinv_and_more','2024-09-18 15:55:42.453793'),(23,'AppVentas','0004_alter_pedidos_iddomicilio_and_more','2024-09-18 15:55:42.777506'),(24,'AppCarrito','0001_initial','2024-09-18 15:55:42.836634'),(25,'AppCarrito','0002_alter_pedidocarrito_iddomicilio','2024-09-18 15:55:43.098299'),(26,'AppCarrito','0003_alter_pedidocarrito_estadopedido','2024-09-18 15:55:43.103297'),(27,'AppCarrito','0004_pedidocarrito_idusuario','2024-09-18 15:55:43.167452'),(28,'AppCarrito','0005_alter_pedidocarrito_idusuario','2024-09-18 15:55:43.448284'),(29,'AppCarrito','0006_cart_cartitem_cart_productos_delete_pedidocarrito','2024-09-18 15:55:43.563101'),(30,'AppInventario','0005_alter_producto_foto_producto','2024-09-18 15:55:43.570617'),(31,'AppProduccion','0001_initial','2024-09-18 15:55:43.669825'),(32,'AppProduccion','0002_alter_fichaproduccion_options_and_more','2024-09-18 15:55:44.037076'),(33,'AppUsuarios','0002_alter_usuarios_email','2024-09-18 15:55:44.054506'),(34,'AppVentas','0005_domicilio_numdomicilio','2024-09-18 15:55:44.097153'),(35,'AppVentas','0006_remove_domicilio_numdomicilio_and_more','2024-09-18 15:55:44.113195'),(36,'AppVentas','0007_alter_pedidos_iddomicilio','2024-09-18 15:55:44.374121'),(37,'AppVentas','0008_alter_ventas_fechaventa_alter_ventas_horaventa_and_more','2024-09-18 15:55:44.441119'),(38,'AppVentas','0009_remove_pedidos_iddomicilio_domicilio_idpedido','2024-09-18 15:55:44.710106'),(39,'AppVentas','0010_factura','2024-09-18 15:55:44.719104'),(40,'admin','0001_initial','2024-09-18 15:55:44.828040'),(41,'admin','0002_logentry_remove_auto_add','2024-09-18 15:55:44.835032'),(42,'admin','0003_logentry_add_action_flag_choices','2024-09-18 15:55:44.843381'),(43,'sessions','0001_initial','2024-09-18 15:55:44.871905');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('vf0cja0dp3y5p8a1uem0p0won2w1ot7h','.eJxVizsOAiEQQO9CbTYzgCxrp4lHsCYDzATib7NIZby7mmyh7fs8VaD-KKE3XkLNaqeM2vyySOnMt6_Yz_OpdVrqvQ0rbcPxSvVyWJu_sVArn0szosM4RoJxAuNYAMR5yZwma7x4uxVtjRbkUXxEFwGTWOs0gUfK6vUG6D80mw:1sqxC6:WbGqC2a1gU-YlmGxCVn-gaGU-l7ieK3pQBfwPIDui7o','2024-10-02 16:06:18.435630');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilio` (
  `iddomicilio` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechadomicilio` date NOT NULL,
  `horadomicilio` time(6) NOT NULL,
  `estadodomicilio` varchar(10) DEFAULT NULL,
  `idpedido_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`iddomicilio`),
  KEY `domicilio_idpedido_id_30f2c5f0_fk_pedidos_idpedido` (`idpedido_id`),
  CONSTRAINT `domicilio_idpedido_id_30f2c5f0_fk_pedidos_idpedido` FOREIGN KEY (`idpedido_id`) REFERENCES `pedidos` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilio`
--

LOCK TABLES `domicilio` WRITE;
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas` (
  `identrada` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombreinsumoentrada` varchar(50) DEFAULT NULL,
  `cantidadinsumoentrada` int(11) DEFAULT NULL,
  `fechainsumoentrada` date DEFAULT NULL,
  `horainsumoentrada` time(6) DEFAULT NULL,
  `idinsumo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`identrada`),
  KEY `entradas_idinsumo_id_598bee6f_fk_insumos_idinsumo` (`idinsumo_id`),
  CONSTRAINT `entradas_idinsumo_id_598bee6f_fk_insumos_idinsumo` FOREIGN KEY (`idinsumo_id`) REFERENCES `insumos` (`idinsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichaproduccion`
--

DROP TABLE IF EXISTS `fichaproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fichaproduccion` (
  `idfichaproduccion` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidadproduccion` int(11) DEFAULT NULL,
  `medirclorado` varchar(20) DEFAULT NULL,
  `medirph` varchar(20) DEFAULT NULL,
  `filtrado` varchar(20) DEFAULT NULL,
  `microfiltrado` varchar(20) DEFAULT NULL,
  `empaque` varchar(20) DEFAULT NULL,
  `fecha_produccion` date DEFAULT NULL,
  `hora_produccion` time(6) DEFAULT NULL,
  `num_lote_produccion` varchar(20) DEFAULT NULL,
  `estadoproduccion` varchar(20) DEFAULT NULL,
  `idcontrolcalidad_id` bigint(20) DEFAULT NULL,
  `idproducto_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idfichaproduccion`),
  KEY `fichaproduccion_idcontrolcalidad_id_1d16622a_fk_controlca` (`idcontrolcalidad_id`),
  KEY `fichaproduccion_idproducto_id_cae2fbd1_fk_producto_idproducto` (`idproducto_id`),
  CONSTRAINT `fichaproduccion_idcontrolcalidad_id_1d16622a_fk_controlca` FOREIGN KEY (`idcontrolcalidad_id`) REFERENCES `controlcalidad` (`idcontrolcalidad`),
  CONSTRAINT `fichaproduccion_idproducto_id_cae2fbd1_fk_producto_idproducto` FOREIGN KEY (`idproducto_id`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichaproduccion`
--

LOCK TABLES `fichaproduccion` WRITE;
/*!40000 ALTER TABLE `fichaproduccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `fichaproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos` (
  `idinsumo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombreinsumo` varchar(30) DEFAULT NULL,
  `cantidadinsumo` int(11) DEFAULT NULL,
  `idestadoinsumo` tinyint(1) DEFAULT NULL,
  `idproveedor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idinsumo`),
  KEY `insumos_idproveedor_id_3289b5f3_fk_proveedores_idproveedor` (`idproveedor_id`),
  CONSTRAINT `insumos_idproveedor_id_3289b5f3_fk_proveedores_idproveedor` FOREIGN KEY (`idproveedor_id`) REFERENCES `proveedores` (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos`
--

LOCK TABLES `insumos` WRITE;
/*!40000 ALTER TABLE `insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idpedido` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_pedido` varchar(20) DEFAULT NULL,
  `direccionpedido` varchar(50) DEFAULT NULL,
  `telefonopedido` varchar(20) DEFAULT NULL,
  `fechapedido` date NOT NULL,
  `horapedido` time(6) NOT NULL,
  `estadopedido` varchar(20) DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precioproductoinv` varchar(20) DEFAULT NULL,
  `producto` varchar(20) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombreproductoinv` varchar(100) DEFAULT NULL,
  `cantidadproducto` int(11) DEFAULT NULL,
  `precioproductoinv` int(11) DEFAULT NULL,
  `fechaactualizacioninv` date DEFAULT NULL,
  `otrosdatos` varchar(100) DEFAULT NULL,
  `presentacion` varchar(50) DEFAULT NULL,
  `foto_producto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idproveedor` bigint(20) NOT NULL AUTO_INCREMENT,
  `num_proveedor` int(11) DEFAULT NULL,
  `nombreproveedor` varchar(50) DEFAULT NULL,
  `emailproveedor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`),
  UNIQUE KEY `num_proveedor` (`num_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida`
--

DROP TABLE IF EXISTS `salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salida` (
  `idsalida` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombreproductosalida` varchar(30) DEFAULT NULL,
  `cantidadproductosalida` int(11) DEFAULT NULL,
  `fechasalidaproducto` date DEFAULT NULL,
  `horasalidaproducto` time(6) DEFAULT NULL,
  PRIMARY KEY (`idsalida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida`
--

LOCK TABLES `salida` WRITE;
/*!40000 ALTER TABLE `salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idventa` bigint(20) NOT NULL AUTO_INCREMENT,
  `idfactura` varchar(45) DEFAULT NULL,
  `fechaventa` date NOT NULL,
  `horaventa` time(6) DEFAULT NULL,
  `nombre_usuario` varchar(45) DEFAULT NULL,
  `idpedido_id` bigint(20) NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `ventas_idpedido_id_894d1135_fk_pedidos_idpedido` (`idpedido_id`),
  CONSTRAINT `ventas_idpedido_id_894d1135_fk_pedidos_idpedido` FOREIGN KEY (`idpedido_id`) REFERENCES `pedidos` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-16 16:17:03
