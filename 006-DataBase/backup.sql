-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: testinstitutomedico
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `id_cita` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fk_paciente` smallint(5) unsigned NOT NULL,
  `fk_especialidad` tinyint(3) unsigned NOT NULL,
  `fk_medico` tinyint(3) unsigned NOT NULL,
  `valoracion_medica` text DEFAULT NULL,
  `comentarios_paciente` text DEFAULT NULL,
  `fecha_cita` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_cita`),
  KEY `fk_paciente` (`fk_paciente`),
  KEY `fk_especialidad` (`fk_especialidad`),
  KEY `fk_medico` (`fk_medico`),
  CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`fk_paciente`) REFERENCES `paciente` (`id_paciente`),
  CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`fk_especialidad`) REFERENCES `especialidad` (`id_especialidad`),
  CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`fk_medico`) REFERENCES `medico` (`id_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correo`
--

DROP TABLE IF EXISTS `correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `correo` (
  `id_correo` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fk_tercero` smallint(5) unsigned NOT NULL,
  `fk_tipo_correo` char(2) NOT NULL,
  `fk_prioridad` char(2) NOT NULL,
  PRIMARY KEY (`id_correo`),
  KEY `fk_tercero` (`fk_tercero`),
  KEY `fk_tipo_correo` (`fk_tipo_correo`),
  KEY `fk_prioridad` (`fk_prioridad`),
  CONSTRAINT `correo_ibfk_1` FOREIGN KEY (`fk_tercero`) REFERENCES `datos_terceros` (`id_tercero`),
  CONSTRAINT `correo_ibfk_2` FOREIGN KEY (`fk_tipo_correo`) REFERENCES `detalle` (`pk_id_detalle`),
  CONSTRAINT `correo_ibfk_3` FOREIGN KEY (`fk_prioridad`) REFERENCES `detalle` (`pk_id_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correo`
--

LOCK TABLES `correo` WRITE;
/*!40000 ALTER TABLE `correo` DISABLE KEYS */;
/*!40000 ALTER TABLE `correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_terceros`
--

DROP TABLE IF EXISTS `datos_terceros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_terceros` (
  `id_tercero` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fk_tipoDocumento` char(2) DEFAULT NULL,
  `numero_identificacion` varchar(12) NOT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `razon_social` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fk_estado` char(2) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_tercero`),
  KEY `fk_tipoDocumento` (`fk_tipoDocumento`),
  KEY `fk_estado` (`fk_estado`),
  CONSTRAINT `datos_terceros_ibfk_1` FOREIGN KEY (`fk_tipoDocumento`) REFERENCES `detalle` (`pk_id_detalle`),
  CONSTRAINT `datos_terceros_ibfk_2` FOREIGN KEY (`fk_estado`) REFERENCES `detalle` (`pk_id_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_terceros`
--

LOCK TABLES `datos_terceros` WRITE;
/*!40000 ALTER TABLE `datos_terceros` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_terceros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `pk_id_detalle` char(2) NOT NULL,
  `fk_id_encabezado` char(1) NOT NULL,
  `valor` varchar(40) NOT NULL,
  `abreviatura` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`pk_id_detalle`),
  KEY `fk_id_encabezado` (`fk_id_encabezado`),
  CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`fk_id_encabezado`) REFERENCES `encabezado` (`pk_id_encabezado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
INSERT INTO `detalle` VALUES ('1','1','Activo','ACT'),('10','3','Registro Civil','RC'),('11','3','Cédula de Extranjería','CE'),('12','3','Carné de Identidad','CI'),('13','3','Documento Nacional de Identidad','DNI'),('14','4','Medico','MD'),('15','4','Paciente','PA'),('16','4','Administrador','AD'),('17','5','Telefono',NULL),('18','5','Celular',NULL),('19','6','EPS',NULL),('2','1','Inactivo','INA'),('20','6','IPS',NULL),('21','7','Personal',NULL),('22','7','Profesional',NULL),('23','8','Alta',NULL),('24','8','Baja',NULL),('3','1','En Espera','ESP'),('4','1','Atendida','ATE'),('5','1','Cancelada','CAN'),('6','2','Masculino','M'),('7','2','Femenino','F'),('8','3','Cédula de Ciudadanía','CC'),('9','3','Tarjeta de Identidad','TI');
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encabezado`
--

DROP TABLE IF EXISTS `encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encabezado` (
  `pk_id_encabezado` char(2) NOT NULL,
  `clave` varchar(20) NOT NULL,
  PRIMARY KEY (`pk_id_encabezado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encabezado`
--

LOCK TABLES `encabezado` WRITE;
/*!40000 ALTER TABLE `encabezado` DISABLE KEYS */;
INSERT INTO `encabezado` VALUES ('1','Estado'),('2','Genero'),('3','Tipo de Documento'),('4','Rol'),('5','Tipo de Contacto'),('6','Tipo de Entidad'),('7','Tipo de Correo'),('8','Prioridad');
/*!40000 ALTER TABLE `encabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidad_medica`
--

DROP TABLE IF EXISTS `entidad_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entidad_medica` (
  `id_entidad` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `fk_tercero` smallint(5) unsigned NOT NULL,
  `fk_tipo_entidad` char(2) NOT NULL,
  PRIMARY KEY (`id_entidad`),
  KEY `fk_tercero` (`fk_tercero`),
  KEY `fk_tipo_entidad` (`fk_tipo_entidad`),
  CONSTRAINT `entidad_medica_ibfk_1` FOREIGN KEY (`fk_tercero`) REFERENCES `datos_terceros` (`id_tercero`),
  CONSTRAINT `entidad_medica_ibfk_2` FOREIGN KEY (`fk_tipo_entidad`) REFERENCES `detalle` (`pk_id_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidad_medica`
--

LOCK TABLES `entidad_medica` WRITE;
/*!40000 ALTER TABLE `entidad_medica` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidad_medica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `id_especialidad` tinyint(3) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_especialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id_medico` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `fk_tercero` smallint(5) unsigned NOT NULL,
  `fk_especialidad` tinyint(3) unsigned NOT NULL,
  `fk_genero` char(2) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_medico`),
  KEY `fk_tercero` (`fk_tercero`),
  KEY `fk_especialidad` (`fk_especialidad`),
  KEY `fk_genero` (`fk_genero`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`fk_tercero`) REFERENCES `datos_terceros` (`id_tercero`),
  CONSTRAINT `medico_ibfk_2` FOREIGN KEY (`fk_especialidad`) REFERENCES `especialidad` (`id_especialidad`),
  CONSTRAINT `medico_ibfk_3` FOREIGN KEY (`fk_genero`) REFERENCES `detalle` (`pk_id_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id_paciente` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fk_tercero` smallint(5) unsigned NOT NULL,
  `fk_genero` char(2) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fk_entidad` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `fk_tercero` (`fk_tercero`),
  KEY `fk_genero` (`fk_genero`),
  KEY `fk_entidad` (`fk_entidad`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`fk_tercero`) REFERENCES `datos_terceros` (`id_tercero`),
  CONSTRAINT `paciente_ibfk_2` FOREIGN KEY (`fk_genero`) REFERENCES `detalle` (`pk_id_detalle`),
  CONSTRAINT `paciente_ibfk_3` FOREIGN KEY (`fk_entidad`) REFERENCES `entidad_medica` (`id_entidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `id_telefono` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fk_tercero` smallint(5) unsigned NOT NULL,
  `fk_tipo_contacto` char(2) NOT NULL,
  `fk_prioridad` char(2) NOT NULL,
  PRIMARY KEY (`id_telefono`),
  KEY `fk_tercero` (`fk_tercero`),
  KEY `fk_tipo_contacto` (`fk_tipo_contacto`),
  KEY `fk_prioridad` (`fk_prioridad`),
  CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`fk_tercero`) REFERENCES `datos_terceros` (`id_tercero`),
  CONSTRAINT `telefono_ibfk_2` FOREIGN KEY (`fk_tipo_contacto`) REFERENCES `detalle` (`pk_id_detalle`),
  CONSTRAINT `telefono_ibfk_3` FOREIGN KEY (`fk_prioridad`) REFERENCES `detalle` (`pk_id_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fk_tercero` smallint(5) unsigned NOT NULL,
  `contraseña` varchar(12) NOT NULL,
  `fk_rol` char(2) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  KEY `fk_tercero` (`fk_tercero`),
  KEY `fk_rol` (`fk_rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`fk_tercero`) REFERENCES `datos_terceros` (`id_tercero`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`fk_rol`) REFERENCES `detalle` (`pk_id_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_estado`
--

DROP TABLE IF EXISTS `vista_estado`;
/*!50001 DROP VIEW IF EXISTS `vista_estado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estado` AS SELECT 
 1 AS `id_estado`,
 1 AS `id_detalle`,
 1 AS `estado`,
 1 AS `abreviatura`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_genero`
--

DROP TABLE IF EXISTS `vista_genero`;
/*!50001 DROP VIEW IF EXISTS `vista_genero`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_genero` AS SELECT 
 1 AS `id_genero`,
 1 AS `id_detalle`,
 1 AS `genero`,
 1 AS `abreviatura`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_prioridad`
--

DROP TABLE IF EXISTS `vista_prioridad`;
/*!50001 DROP VIEW IF EXISTS `vista_prioridad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_prioridad` AS SELECT 
 1 AS `id_prioridad`,
 1 AS `id_detalle`,
 1 AS `prioridad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_rol`
--

DROP TABLE IF EXISTS `vista_rol`;
/*!50001 DROP VIEW IF EXISTS `vista_rol`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_rol` AS SELECT 
 1 AS `id_rol`,
 1 AS `id_detalle`,
 1 AS `rol`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tipocontacto`
--

DROP TABLE IF EXISTS `vista_tipocontacto`;
/*!50001 DROP VIEW IF EXISTS `vista_tipocontacto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tipocontacto` AS SELECT 
 1 AS `id_tipoContacto`,
 1 AS `id_detalle`,
 1 AS `tipoContacto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tipocorreo`
--

DROP TABLE IF EXISTS `vista_tipocorreo`;
/*!50001 DROP VIEW IF EXISTS `vista_tipocorreo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tipocorreo` AS SELECT 
 1 AS `id_tipoCorreo`,
 1 AS `id_detalle`,
 1 AS `tipoCorreo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tipodocumento`
--

DROP TABLE IF EXISTS `vista_tipodocumento`;
/*!50001 DROP VIEW IF EXISTS `vista_tipodocumento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tipodocumento` AS SELECT 
 1 AS `id_tipo_documento`,
 1 AS `id_detalle`,
 1 AS `tipo_documento`,
 1 AS `abreviatura`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tipoentidad`
--

DROP TABLE IF EXISTS `vista_tipoentidad`;
/*!50001 DROP VIEW IF EXISTS `vista_tipoentidad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tipoentidad` AS SELECT 
 1 AS `id_tipoEntidad`,
 1 AS `id_detalle`,
 1 AS `tipoEntidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_estado`
--

/*!50001 DROP VIEW IF EXISTS `vista_estado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estado` AS select `e`.`pk_id_encabezado` AS `id_estado`,`d`.`pk_id_detalle` AS `id_detalle`,`d`.`valor` AS `estado`,`d`.`abreviatura` AS `abreviatura` from (`encabezado` `e` join `detalle` `d` on(`e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`)) where `e`.`pk_id_encabezado` = '1' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_genero`
--

/*!50001 DROP VIEW IF EXISTS `vista_genero`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_genero` AS select `e`.`pk_id_encabezado` AS `id_genero`,`d`.`pk_id_detalle` AS `id_detalle`,`d`.`valor` AS `genero`,`d`.`abreviatura` AS `abreviatura` from (`encabezado` `e` join `detalle` `d` on(`e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`)) where `e`.`pk_id_encabezado` = '2' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_prioridad`
--

/*!50001 DROP VIEW IF EXISTS `vista_prioridad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_prioridad` AS select `e`.`pk_id_encabezado` AS `id_prioridad`,`d`.`pk_id_detalle` AS `id_detalle`,`d`.`valor` AS `prioridad` from (`encabezado` `e` join `detalle` `d` on(`e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`)) where `e`.`pk_id_encabezado` = '8' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_rol`
--

/*!50001 DROP VIEW IF EXISTS `vista_rol`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_rol` AS select `e`.`pk_id_encabezado` AS `id_rol`,`d`.`pk_id_detalle` AS `id_detalle`,`d`.`valor` AS `rol` from (`encabezado` `e` join `detalle` `d` on(`e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`)) where `e`.`pk_id_encabezado` = '4' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tipocontacto`
--

/*!50001 DROP VIEW IF EXISTS `vista_tipocontacto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tipocontacto` AS select `e`.`pk_id_encabezado` AS `id_tipoContacto`,`d`.`pk_id_detalle` AS `id_detalle`,`d`.`valor` AS `tipoContacto` from (`encabezado` `e` join `detalle` `d` on(`e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`)) where `e`.`pk_id_encabezado` = '5' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tipocorreo`
--

/*!50001 DROP VIEW IF EXISTS `vista_tipocorreo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tipocorreo` AS select `e`.`pk_id_encabezado` AS `id_tipoCorreo`,`d`.`pk_id_detalle` AS `id_detalle`,`d`.`valor` AS `tipoCorreo` from (`encabezado` `e` join `detalle` `d` on(`e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`)) where `e`.`pk_id_encabezado` = '7' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tipodocumento`
--

/*!50001 DROP VIEW IF EXISTS `vista_tipodocumento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tipodocumento` AS select `e`.`pk_id_encabezado` AS `id_tipo_documento`,`d`.`pk_id_detalle` AS `id_detalle`,`d`.`valor` AS `tipo_documento`,`d`.`abreviatura` AS `abreviatura` from (`encabezado` `e` join `detalle` `d` on(`e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`)) where `e`.`pk_id_encabezado` = '3' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tipoentidad`
--

/*!50001 DROP VIEW IF EXISTS `vista_tipoentidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tipoentidad` AS select `e`.`pk_id_encabezado` AS `id_tipoEntidad`,`d`.`pk_id_detalle` AS `id_detalle`,`d`.`valor` AS `tipoEntidad` from (`encabezado` `e` join `detalle` `d` on(`e`.`pk_id_encabezado` = `d`.`fk_id_encabezado`)) where `e`.`pk_id_encabezado` = '6' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-28  6:21:39
