-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: domuxdb
-- ------------------------------------------------------
-- Server version	12.0.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task` varchar(100) DEFAULT NULL,
  `id_routine` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_routine` (`id_routine`),
  CONSTRAINT `actions_ibfk_1` FOREIGN KEY (`id_routine`) REFERENCES `routines` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,'Encender ventilador',1),(2,'Encender TV',1),(3,'Apagar TV',1),(4,'Encender ventilador',1),(5,'Desactivar alarma',1),(6,'Encender luces',2),(7,'Activar purificador aire',2),(8,'Encender TV',3),(9,'Desactivar alarma',3),(10,'Encender luces',3),(11,'Activar alarma',3),(12,'Apagar luces',4),(13,'Encender luces',4),(14,'Ajustar temperatura a 20°C',4),(15,'Subir persianas',5),(16,'Encender ventilador',5),(17,'Apagar luces',5),(18,'Cerrar válvulas',5),(19,'Cerrar válvulas',5),(20,'Desactivar alarma',6),(21,'Encender ventilador',6),(22,'Cerrar válvulas',6),(23,'Apagar TV',6),(24,'Activar calefacción',6),(25,'Encender luces',7),(26,'Desactivar alarma',7),(27,'Ajustar temperatura a 20°C',7),(28,'Bajar persianas',7),(29,'Apagar TV',7),(30,'Ajustar temperatura a 22°C',8),(31,'Cerrar válvulas',8),(32,'Abrir válvulas',8),(33,'Bajar persianas',8),(34,'Activar alarma',9),(35,'Desactivar calefacción',9),(36,'Desactivar calefacción',9),(37,'Activar modo eco',10),(38,'Cerrar válvulas',10),(39,'Encender ventilador',11),(40,'Abrir válvulas',11),(41,'Encender luces',11),(42,'Apagar luces',12),(43,'Activar modo eco',12),(44,'Cerrar válvulas',12),(45,'Apagar TV',13),(46,'Activar modo eco',13),(47,'Cerrar válvulas',14),(48,'Activar alarma',14),(49,'Reproducir música',14),(50,'Desactivar alarma',14),(51,'Encender ventilador',15),(52,'Encender luces',15),(53,'Encender ventilador',15),(54,'Subir persianas',16),(55,'Encender TV',16),(56,'Desactivar alarma',16),(57,'Cerrar válvulas',16),(58,'Ajustar temperatura a 20°C',16),(59,'Cerrar válvulas',17),(60,'Encender ventilador',17),(61,'Activar calefacción',17),(62,'Encender luces',17),(63,'Ajustar temperatura a 22°C',17),(64,'Encender ventilador',18),(65,'Encender luces',18),(66,'Activar alarma',19),(67,'Reproducir música',19),(68,'Apagar luces',19),(69,'Activar calefacción',19),(70,'Apagar luces',19),(71,'Activar alarma',20),(72,'Desactivar alarma',20),(73,'Desactivar alarma',20),(74,'Activar purificador aire',20),(75,'Activar calefacción',20);
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_actuators`
--

DROP TABLE IF EXISTS `device_actuators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_actuators` (
  `id_device` int(10) unsigned NOT NULL,
  `action_type` enum('switch','valve','motor','led','other') NOT NULL,
  PRIMARY KEY (`id_device`),
  CONSTRAINT `device_actuators_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_actuators`
--

LOCK TABLES `device_actuators` WRITE;
/*!40000 ALTER TABLE `device_actuators` DISABLE KEYS */;
INSERT INTO `device_actuators` VALUES (2,'other'),(5,'switch'),(7,'switch'),(13,'valve'),(14,'led'),(15,'other'),(16,'led'),(18,'motor'),(20,'led'),(23,'motor'),(24,'led'),(31,'led'),(32,'led'),(33,'switch'),(34,'motor'),(40,'other'),(41,'switch'),(42,'led'),(47,'led'),(48,'other'),(49,'switch'),(56,'led'),(57,'valve'),(58,'led'),(62,'other'),(63,'other'),(68,'switch'),(69,'motor'),(71,'motor'),(76,'switch'),(77,'led'),(78,'switch'),(84,'other'),(85,'motor'),(86,'valve'),(91,'motor'),(92,'other'),(97,'motor'),(98,'valve'),(101,'valve'),(106,'other'),(107,'motor'),(108,'other'),(111,'motor'),(112,'motor'),(117,'other'),(118,'valve'),(125,'other'),(126,'led'),(127,'valve'),(128,'other'),(134,'valve'),(135,'led'),(136,'other'),(140,'valve'),(141,'led'),(144,'other'),(148,'other'),(149,'led'),(154,'valve'),(155,'other'),(158,'led'),(165,'other'),(166,'motor'),(167,'valve'),(168,'motor');
/*!40000 ALTER TABLE `device_actuators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_device`
--

DROP TABLE IF EXISTS `device_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_device` (
  `id_device` int(10) unsigned NOT NULL,
  `id_linked` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_device`,`id_linked`),
  KEY `id_linked` (`id_linked`),
  CONSTRAINT `device_device_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `devices` (`id`),
  CONSTRAINT `device_device_ibfk_2` FOREIGN KEY (`id_linked`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_device`
--

LOCK TABLES `device_device` WRITE;
/*!40000 ALTER TABLE `device_device` DISABLE KEYS */;
INSERT INTO `device_device` VALUES (51,20),(3,33),(30,56),(37,71),(38,78),(9,86),(53,91),(12,92),(137,97),(11,111),(82,128),(17,134),(64,136),(11,140),(66,141),(67,148),(9,165),(83,165),(109,165),(60,166);
/*!40000 ALTER TABLE `device_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_routine`
--

DROP TABLE IF EXISTS `device_routine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_routine` (
  `id_device` int(10) unsigned NOT NULL,
  `id_routine` int(10) unsigned NOT NULL,
  `monday` tinyint(1) NOT NULL DEFAULT 0,
  `tuesday` tinyint(1) NOT NULL DEFAULT 0,
  `wednesday` tinyint(1) NOT NULL DEFAULT 0,
  `thursdays` tinyint(1) NOT NULL DEFAULT 0,
  `friday` tinyint(1) NOT NULL DEFAULT 0,
  `saturday` tinyint(1) NOT NULL DEFAULT 0,
  `sunday` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_device`,`id_routine`),
  KEY `id_routine` (`id_routine`),
  CONSTRAINT `device_routine_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `devices` (`id`),
  CONSTRAINT `device_routine_ibfk_2` FOREIGN KEY (`id_routine`) REFERENCES `routines` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_routine`
--

LOCK TABLES `device_routine` WRITE;
/*!40000 ALTER TABLE `device_routine` DISABLE KEYS */;
INSERT INTO `device_routine` VALUES (3,1,0,1,1,1,1,0,1),(3,6,1,1,1,1,1,1,1),(10,9,1,1,1,0,1,1,1),(15,16,1,1,0,1,1,0,0),(16,3,1,1,0,0,1,0,1),(16,4,1,1,1,1,1,1,1),(18,13,1,0,0,0,1,1,1),(20,15,1,1,1,1,1,1,0),(20,17,1,1,1,0,1,1,0),(27,1,1,0,0,0,1,0,1),(28,5,0,1,1,1,0,1,1),(28,7,1,1,1,1,0,0,1),(30,8,0,1,1,1,1,1,0),(32,20,1,1,0,0,1,1,0),(37,7,1,1,1,1,1,1,1),(37,14,1,0,1,0,0,0,0),(39,15,1,1,1,1,1,1,1),(41,1,1,1,1,0,0,1,1),(45,11,1,1,0,0,1,1,0),(46,17,1,0,0,1,0,0,0),(47,11,0,0,1,1,1,0,1),(50,19,0,1,1,1,1,1,0),(51,4,0,1,1,0,0,0,1),(52,11,0,1,1,1,1,1,0),(53,13,0,1,1,0,1,0,1),(54,3,1,1,0,1,1,0,1),(55,9,0,1,1,1,0,1,1),(56,4,1,1,0,1,1,0,0),(59,10,0,1,0,1,1,1,1),(60,11,1,1,1,1,0,0,1),(66,14,1,1,1,1,0,0,0),(66,19,1,0,1,1,1,0,1),(67,2,1,1,0,1,0,1,0),(67,12,1,1,1,0,1,0,1),(67,19,1,0,1,1,0,1,1),(69,9,1,1,1,1,0,1,1),(71,8,1,1,1,0,1,1,1),(75,20,0,0,1,1,1,1,1),(77,14,0,0,1,1,1,0,1),(79,9,0,1,0,1,1,1,1),(85,3,1,1,1,1,0,0,0),(86,18,1,1,1,0,0,1,1),(90,2,0,1,0,1,0,1,0),(90,15,0,1,1,0,0,0,0),(91,9,1,1,0,0,1,1,1),(93,13,1,1,1,1,0,1,1),(94,8,0,0,1,1,1,0,0),(100,4,0,0,1,0,1,1,0),(102,5,1,0,1,1,1,0,0),(103,1,0,1,1,0,1,1,0),(103,7,1,0,0,1,1,0,1),(104,8,1,1,1,0,1,1,1),(105,14,0,1,0,1,1,1,1),(105,16,1,0,0,1,1,0,1),(106,14,1,1,0,1,1,0,1),(109,8,1,1,0,1,1,1,0),(110,19,1,1,0,0,0,1,0),(111,14,1,1,1,0,0,0,0),(112,5,1,1,0,1,1,1,0),(112,14,0,1,1,1,1,1,0),(114,6,1,1,0,1,1,1,1),(116,17,1,0,1,1,1,0,1),(118,8,1,1,0,0,1,0,0),(120,5,1,0,1,0,1,1,1),(121,1,1,1,0,1,1,0,0),(121,14,1,1,1,1,1,0,0),(122,11,1,1,1,1,1,0,1),(123,7,1,1,0,1,1,0,1),(124,16,1,1,0,1,1,1,0),(125,4,1,0,1,0,1,1,1),(125,15,1,0,0,1,0,1,1),(126,7,1,0,0,1,1,0,0),(128,1,0,1,1,1,1,0,1),(130,12,1,1,0,1,1,0,1),(131,2,1,1,1,1,1,1,0),(131,15,1,1,1,0,0,0,0),(140,3,1,0,0,1,1,1,0),(140,4,1,1,1,0,1,1,1),(144,10,1,0,0,1,1,0,1),(146,4,0,0,1,0,1,0,1),(146,19,1,1,1,1,1,0,1),(148,17,0,1,1,1,1,0,1),(149,13,1,0,1,0,1,1,1),(154,3,1,1,1,0,0,0,0),(154,19,0,0,0,1,1,1,1),(155,3,0,1,0,1,1,1,0),(158,6,1,1,0,0,1,1,0),(159,16,1,0,0,1,1,1,1),(161,3,1,1,1,1,1,0,1),(162,7,1,1,1,1,0,0,0),(162,9,0,1,1,0,1,0,1),(164,18,1,1,1,1,1,1,0),(167,1,1,1,1,1,1,1,0),(167,7,1,0,0,1,1,1,1);
/*!40000 ALTER TABLE `device_routine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_sensors`
--

DROP TABLE IF EXISTS `device_sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_sensors` (
  `id_device` int(10) unsigned NOT NULL,
  `sensor_type` enum('temperature','humidity','motion','light','other') NOT NULL,
  PRIMARY KEY (`id_device`),
  CONSTRAINT `device_sensors_ibfk_1` FOREIGN KEY (`id_device`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_sensors`
--

LOCK TABLES `device_sensors` WRITE;
/*!40000 ALTER TABLE `device_sensors` DISABLE KEYS */;
INSERT INTO `device_sensors` VALUES (1,'light'),(3,'humidity'),(4,'humidity'),(6,'humidity'),(8,'motion'),(9,'motion'),(10,'motion'),(11,'motion'),(12,'other'),(17,'temperature'),(19,'temperature'),(21,'humidity'),(22,'other'),(25,'other'),(26,'humidity'),(27,'motion'),(28,'temperature'),(29,'temperature'),(30,'light'),(35,'motion'),(36,'motion'),(37,'light'),(38,'other'),(39,'temperature'),(43,'other'),(44,'motion'),(45,'other'),(46,'light'),(50,'humidity'),(51,'other'),(52,'motion'),(53,'other'),(54,'temperature'),(55,'temperature'),(59,'humidity'),(60,'other'),(61,'light'),(64,'light'),(65,'motion'),(66,'motion'),(67,'temperature'),(70,'light'),(72,'motion'),(73,'other'),(74,'humidity'),(75,'light'),(79,'other'),(80,'temperature'),(81,'temperature'),(82,'temperature'),(83,'motion'),(87,'motion'),(88,'light'),(89,'humidity'),(90,'humidity'),(93,'temperature'),(94,'temperature'),(95,'temperature'),(96,'temperature'),(99,'humidity'),(100,'motion'),(102,'other'),(103,'motion'),(104,'temperature'),(105,'humidity'),(109,'light'),(110,'other'),(113,'humidity'),(114,'temperature'),(115,'humidity'),(116,'other'),(119,'light'),(120,'humidity'),(121,'motion'),(122,'humidity'),(123,'temperature'),(124,'other'),(129,'temperature'),(130,'other'),(131,'temperature'),(132,'other'),(133,'temperature'),(137,'temperature'),(138,'temperature'),(139,'light'),(142,'humidity'),(143,'humidity'),(145,'other'),(146,'temperature'),(147,'light'),(150,'motion'),(151,'humidity'),(152,'temperature'),(153,'motion'),(156,'motion'),(157,'motion'),(159,'light'),(160,'other'),(161,'temperature'),(162,'humidity'),(163,'other'),(164,'light');
/*!40000 ALTER TABLE `device_sensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `wireless` tinyint(1) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `power_w` double DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `id_room` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`),
  KEY `id_room` (`id_room`),
  CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'Sensor Ventana 1-1','SEN000001',1,'Philips','Model-89',3.8,1,2),(2,'Bombilla LED 1-2','ACT000002',1,'TP-Link','Model-9',18,1,2),(3,'Sensor Temperatura 2-3','SEN000003',0,'Xiaomi','Model-55',1.9,1,4),(4,'Detector Movimiento 3-4','SEN000004',1,'Zigbee','Model-13',3.9,1,9),(5,'Enchufe Inteligente 3-5','ACT000005',1,'Philips','Model-10',52.1,1,9),(6,'Sensor Temperatura 4-6','SEN000006',1,'Aqara','Model-19',3.9,1,12),(7,'Cerradura Inteligente 4-7','ACT000007',1,'Zigbee','Model-27',52.6,1,13),(8,'Sensor Temperatura 5-8','SEN000008',1,'Aqara','Model-56',0.9,1,17),(9,'Sensor Humedad 5-9','SEN000009',0,'Samsung','Model-95',3.7,1,23),(10,'Sensor Temperatura 5-10','SEN000010',1,'TP-Link','Model-35',5.3,1,23),(11,'Sensor Puerta 5-11','SEN000011',1,'Aqara','Model-49',5.3,1,19),(12,'Sensor Humedad 5-12','SEN000012',1,'Shelly','Model-74',2,1,20),(13,'Ventilador 5-13','ACT000013',1,'Samsung','Model-0',35.4,1,16),(14,'Cerradura Inteligente 5-14','ACT000014',0,'Bosch','Model-52',17.8,1,17),(15,'Ventilador 5-15','ACT000015',0,'Sonoff','Model-65',49.5,1,23),(16,'Interruptor Luz 5-16','ACT000016',1,'TP-Link','Model-17',23.3,1,23),(17,'Detector Movimiento 6-17','SEN000017',0,'Bosch','Model-86',4.6,1,29),(18,'Bombilla LED 6-18','ACT000018',1,'Sonoff','Model-90',6.1,1,27),(19,'Sensor Luz 7-19','SEN000019',1,'Bosch','Model-64',1.6,1,31),(20,'Bombilla LED 7-20','ACT000020',1,'TP-Link','Model-54',10.2,1,33),(21,'Medidor Consumo 8-21','SEN000021',1,'TP-Link','Model-62',5.2,1,34),(22,'Sensor Ventana 8-22','SEN000022',1,'Philips','Model-39',0.6,1,36),(23,'Enchufe Inteligente 8-23','ACT000023',0,'Bosch','Model-44',43.3,1,36),(24,'Cerradura Inteligente 8-24','ACT000024',0,'Aqara','Model-77',18.6,1,36),(25,'Detector Movimiento 9-25','SEN000025',1,'Sonoff','Model-75',4.2,1,39),(26,'Sensor Humo 9-26','SEN000026',1,'TP-Link','Model-69',0.9,1,37),(27,'Sensor Humedad 9-27','SEN000027',0,'Tuya','Model-21',4.2,1,40),(28,'Sensor Ventana 9-28','SEN000028',1,'Xiaomi','Model-8',4,1,39),(29,'Sensor Ventana 9-29','SEN000029',1,'Bosch','Model-17',3.6,0,40),(30,'Sensor Puerta 9-30','SEN000030',0,'Philips','Model-74',1.7,1,40),(31,'Interruptor Luz 9-31','ACT000031',1,'Tuya','Model-76',11.9,1,37),(32,'Interruptor Luz 9-32','ACT000032',0,'Sonoff','Model-8',13.8,1,37),(33,'Timbre 9-33','ACT000033',1,'Philips','Model-77',11.6,1,37),(34,'Termostato 9-34','ACT000034',1,'TP-Link','Model-82',40.6,1,40),(35,'Sensor Ventana 10-35','SEN000035',0,'Tuya','Model-21',3.2,1,44),(36,'Sensor Luz 10-36','SEN000036',1,'Tuya','Model-46',5,1,45),(37,'Sensor Luz 10-37','SEN000037',0,'Zigbee','Model-65',3.5,1,43),(38,'Sensor Puerta 10-38','SEN000038',1,'Aqara','Model-68',1.2,1,45),(39,'Sensor Luz 10-39','SEN000039',1,'Xiaomi','Model-51',4.1,1,42),(40,'Válvula Radiador 10-40','ACT000040',1,'Zigbee','Model-85',43.4,1,45),(41,'Enchufe Inteligente 10-41','ACT000041',0,'Shelly','Model-9',8.7,1,44),(42,'Bombilla LED 10-42','ACT000042',1,'Sonoff','Model-93',36.9,0,42),(43,'Sensor Puerta 11-43','SEN000043',0,'Philips','Model-30',1.2,1,46),(44,'Sensor Puerta 11-44','SEN000044',1,'Aqara','Model-60',2.7,1,46),(45,'Detector Movimiento 11-45','SEN000045',1,'Aqara','Model-71',4.3,1,46),(46,'Sensor Ventana 11-46','SEN000046',1,'TP-Link','Model-35',0.9,1,46),(47,'Persiana Automática 11-47','ACT000047',0,'Shelly','Model-30',29.7,1,46),(48,'Timbre 11-48','ACT000048',1,'Aqara','Model-39',17.4,1,46),(49,'Enchufe Inteligente 11-49','ACT000049',0,'Sonoff','Model-68',42.9,1,46),(50,'Sensor Humedad 12-50','SEN000050',0,'Shelly','Model-72',2.1,0,50),(51,'Sensor Ventana 13-51','SEN000051',1,'Zigbee','Model-39',3.8,0,54),(52,'Sensor Humo 13-52','SEN000052',1,'Tuya','Model-76',4.6,1,55),(53,'Sensor Ventana 13-53','SEN000053',1,'Sonoff','Model-72',5.4,1,55),(54,'Medidor Consumo 13-54','SEN000054',1,'Sonoff','Model-63',2.8,1,55),(55,'Medidor Consumo 13-55','SEN000055',0,'Samsung','Model-96',4.9,1,56),(56,'Interruptor Luz 13-56','ACT000056',1,'Xiaomi','Model-56',24.5,1,54),(57,'Válvula Radiador 13-57','ACT000057',1,'Aqara','Model-31',46.1,1,56),(58,'Persiana Automática 13-58','ACT000058',1,'Sonoff','Model-24',20.9,1,56),(59,'Sensor Humo 14-59','SEN000059',1,'Xiaomi','Model-86',3.2,1,57),(60,'Sensor Temperatura 14-60','SEN000060',1,'Zigbee','Model-39',2.8,1,61),(61,'Detector Movimiento 14-61','SEN000061',1,'TP-Link','Model-64',5.3,1,61),(62,'Cerradura Inteligente 14-62','ACT000062',1,'Zigbee','Model-59',42.1,1,57),(63,'Enchufe Inteligente 14-63','ACT000063',1,'Philips','Model-28',36.9,1,59),(64,'Sensor Ventana 15-64','SEN000064',0,'Sonoff','Model-62',0.9,1,66),(65,'Medidor Consumo 15-65','SEN000065',1,'Xiaomi','Model-7',3.6,1,66),(66,'Sensor Puerta 15-66','SEN000066',0,'Philips','Model-66',1.7,1,64),(67,'Sensor Humedad 15-67','SEN000067',1,'Zigbee','Model-79',5.3,0,65),(68,'Válvula Radiador 15-68','ACT000068',1,'Tuya','Model-43',7.4,1,66),(69,'Cerradura Inteligente 15-69','ACT000069',1,'TP-Link','Model-16',25.8,1,65),(70,'Sensor Luz 16-70','SEN000070',1,'Xiaomi','Model-80',0.6,1,67),(71,'Ventilador 16-71','ACT000071',1,'Zigbee','Model-68',37.6,1,68),(72,'Sensor Humo 17-72','SEN000072',1,'Shelly','Model-13',2.9,1,76),(73,'Detector Movimiento 17-73','SEN000073',1,'Xiaomi','Model-30',0.9,1,79),(74,'Sensor Puerta 17-74','SEN000074',1,'TP-Link','Model-43',4.5,1,76),(75,'Sensor Luz 17-75','SEN000075',1,'Tuya','Model-10',4.1,1,77),(76,'Cerradura Inteligente 17-76','ACT000076',1,'Samsung','Model-14',36.4,1,78),(77,'Persiana Automática 17-77','ACT000077',1,'Sonoff','Model-35',16,1,78),(78,'Persiana Automática 17-78','ACT000078',1,'Tuya','Model-72',22.2,1,76),(79,'Sensor Ventana 18-79','SEN000079',1,'TP-Link','Model-80',3.3,1,85),(80,'Sensor Puerta 18-80','SEN000080',0,'Zigbee','Model-3',2.2,1,85),(81,'Detector Movimiento 18-81','SEN000081',0,'Aqara','Model-82',5.1,1,83),(82,'Sensor Puerta 18-82','SEN000082',1,'Tuya','Model-12',3.7,0,81),(83,'Sensor Temperatura 18-83','SEN000083',1,'Samsung','Model-75',4.2,1,81),(84,'Timbre 18-84','ACT000084',1,'Philips','Model-32',25.1,1,85),(85,'Cerradura Inteligente 18-85','ACT000085',1,'Sonoff','Model-93',21.4,1,83),(86,'Cerradura Inteligente 18-86','ACT000086',1,'TP-Link','Model-22',33.7,1,85),(87,'Sensor Luz 19-87','SEN000087',1,'Aqara','Model-86',4.2,1,87),(88,'Detector Movimiento 19-88','SEN000088',1,'Samsung','Model-58',1.5,1,89),(89,'Sensor Humedad 19-89','SEN000089',1,'Aqara','Model-48',5,1,91),(90,'Sensor Ventana 19-90','SEN000090',1,'Bosch','Model-30',5.5,1,89),(91,'Ventilador 19-91','ACT000091',1,'Bosch','Model-49',45.2,1,86),(92,'Ventilador 19-92','ACT000092',1,'Philips','Model-80',37.9,1,91),(93,'Detector Movimiento 20-93','SEN000093',0,'Xiaomi','Model-48',0.8,1,92),(94,'Detector Movimiento 20-94','SEN000094',1,'TP-Link','Model-77',2.5,1,93),(95,'Sensor Ventana 20-95','SEN000095',1,'Philips','Model-98',0.9,0,93),(96,'Sensor Puerta 20-96','SEN000096',1,'Zigbee','Model-31',3.4,1,92),(97,'Termostato 20-97','ACT000097',0,'TP-Link','Model-9',36.5,1,93),(98,'Persiana Automática 20-98','ACT000098',1,'Aqara','Model-18',29.1,1,93),(99,'Detector Movimiento 21-99','SEN000099',0,'Bosch','Model-93',3.4,1,94),(100,'Sensor Humedad 21-100','SEN000100',0,'Bosch','Model-59',4.7,1,95),(101,'Válvula Radiador 21-101','ACT000101',1,'Zigbee','Model-37',18.9,0,95),(102,'Sensor Luz 22-102','SEN000102',1,'Philips','Model-98',0.8,1,101),(103,'Sensor Humedad 22-103','SEN000103',0,'Samsung','Model-85',1.9,1,102),(104,'Sensor Luz 22-104','SEN000104',1,'Aqara','Model-11',3.9,1,102),(105,'Detector Movimiento 22-105','SEN000105',1,'Xiaomi','Model-81',4.4,0,100),(106,'Persiana Automática 22-106','ACT000106',1,'Xiaomi','Model-87',18.7,0,103),(107,'Persiana Automática 22-107','ACT000107',1,'Samsung','Model-84',10.8,1,97),(108,'Ventilador 22-108','ACT000108',1,'TP-Link','Model-72',32.8,1,99),(109,'Sensor Puerta 23-109','SEN000109',1,'Aqara','Model-18',4.5,1,105),(110,'Sensor Ventana 23-110','SEN000110',1,'TP-Link','Model-59',3.1,1,104),(111,'Interruptor Luz 23-111','ACT000111',0,'Sonoff','Model-97',36.2,1,105),(112,'Persiana Automática 23-112','ACT000112',0,'Shelly','Model-78',10.6,1,105),(113,'Sensor Puerta 24-113','SEN000113',1,'Shelly','Model-54',1.4,1,110),(114,'Sensor Temperatura 24-114','SEN000114',1,'Philips','Model-81',4.4,1,110),(115,'Sensor Humo 24-115','SEN000115',0,'TP-Link','Model-94',1.6,1,109),(116,'Medidor Consumo 24-116','SEN000116',1,'TP-Link','Model-97',2.4,1,106),(117,'Termostato 24-117','ACT000117',1,'Sonoff','Model-94',45.9,1,110),(118,'Interruptor Luz 24-118','ACT000118',0,'Bosch','Model-16',50.9,1,110),(119,'Sensor Luz 25-119','SEN000119',1,'Philips','Model-73',5.2,1,116),(120,'Sensor Humedad 25-120','SEN000120',1,'Xiaomi','Model-78',3.4,1,116),(121,'Detector Movimiento 25-121','SEN000121',1,'Bosch','Model-33',2.5,1,112),(122,'Detector Movimiento 25-122','SEN000122',0,'Aqara','Model-99',1.3,1,112),(123,'Detector Movimiento 25-123','SEN000123',1,'Xiaomi','Model-66',0.8,1,111),(124,'Sensor Puerta 25-124','SEN000124',1,'Zigbee','Model-28',2.4,1,111),(125,'Termostato 25-125','ACT000125',0,'Tuya','Model-57',49.9,1,113),(126,'Ventilador 25-126','ACT000126',1,'Philips','Model-60',30.2,1,116),(127,'Persiana Automática 25-127','ACT000127',1,'TP-Link','Model-23',30.1,1,113),(128,'Enchufe Inteligente 25-128','ACT000128',0,'Samsung','Model-98',39.9,1,114),(129,'Sensor Humo 26-129','SEN000129',1,'TP-Link','Model-37',2.1,0,118),(130,'Sensor Humedad 26-130','SEN000130',1,'Philips','Model-72',3.7,1,118),(131,'Sensor Humo 26-131','SEN000131',0,'Tuya','Model-54',4.5,1,118),(132,'Sensor Temperatura 26-132','SEN000132',1,'Shelly','Model-40',5.1,1,118),(133,'Detector Movimiento 26-133','SEN000133',1,'Aqara','Model-75',3,1,118),(134,'Ventilador 26-134','ACT000134',1,'Xiaomi','Model-73',45.2,1,117),(135,'Válvula Radiador 26-135','ACT000135',1,'Xiaomi','Model-88',16.5,1,118),(136,'Interruptor Luz 26-136','ACT000136',1,'Zigbee','Model-61',11,1,117),(137,'Sensor Humo 27-137','SEN000137',1,'Philips','Model-53',4.9,1,119),(138,'Sensor Temperatura 27-138','SEN000138',1,'Sonoff','Model-26',2.9,1,119),(139,'Sensor Ventana 27-139','SEN000139',1,'Philips','Model-37',2.9,1,119),(140,'Bombilla LED 27-140','ACT000140',1,'Xiaomi','Model-94',34.9,1,119),(141,'Ventilador 27-141','ACT000141',1,'Aqara','Model-88',53.6,1,119),(142,'Detector Movimiento 28-142','SEN000142',0,'Samsung','Model-56',0.7,1,120),(143,'Detector Movimiento 28-143','SEN000143',1,'Tuya','Model-51',4.5,1,123),(144,'Ventilador 28-144','ACT000144',0,'Zigbee','Model-69',27.8,1,121),(145,'Sensor Ventana 29-145','SEN000145',1,'Samsung','Model-53',3.7,1,125),(146,'Sensor Ventana 29-146','SEN000146',1,'Philips','Model-75',1,1,125),(147,'Sensor Humo 29-147','SEN000147',1,'Shelly','Model-54',5.1,1,126),(148,'Termostato 29-148','ACT000148',0,'TP-Link','Model-35',21.3,1,124),(149,'Timbre 29-149','ACT000149',1,'Shelly','Model-97',50.9,1,124),(150,'Sensor Humedad 30-150','SEN000150',0,'Shelly','Model-34',3.7,1,134),(151,'Sensor Puerta 30-151','SEN000151',0,'Xiaomi','Model-78',5.3,1,131),(152,'Sensor Ventana 30-152','SEN000152',1,'Tuya','Model-89',2.3,1,132),(153,'Sensor Luz 30-153','SEN000153',1,'TP-Link','Model-8',2.4,1,131),(154,'Válvula Radiador 30-154','ACT000154',1,'Aqara','Model-53',28.9,1,135),(155,'Persiana Automática 30-155','ACT000155',1,'Aqara','Model-9',44.8,1,132),(156,'Sensor Puerta 31-156','SEN000156',1,'Sonoff','Model-83',2.9,1,140),(157,'Detector Movimiento 31-157','SEN000157',0,'Shelly','Model-60',1.6,1,141),(158,'Interruptor Luz 31-158','ACT000158',1,'TP-Link','Model-17',53.6,1,142),(159,'Sensor Luz 32-159','SEN000159',0,'Samsung','Model-70',2,1,149),(160,'Sensor Humo 32-160','SEN000160',1,'Zigbee','Model-35',3,1,144),(161,'Medidor Consumo 32-161','SEN000161',1,'Tuya','Model-12',4,1,145),(162,'Detector Movimiento 32-162','SEN000162',1,'Sonoff','Model-14',5,1,144),(163,'Sensor Puerta 32-163','SEN000163',1,'Philips','Model-75',3.1,1,144),(164,'Sensor Temperatura 32-164','SEN000164',0,'Philips','Model-58',2.7,1,146),(165,'Bombilla LED 32-165','ACT000165',1,'Xiaomi','Model-38',45.3,1,146),(166,'Ventilador 32-166','ACT000166',1,'TP-Link','Model-51',35.5,1,148),(167,'Cerradura Inteligente 32-167','ACT000167',1,'Zigbee','Model-17',48.3,1,144),(168,'Timbre 32-168','ACT000168',1,'TP-Link','Model-91',54.2,0,147);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dwelling`
--

DROP TABLE IF EXISTS `dwelling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dwelling` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `direction` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `house_type` enum('apartment','house','studio','loft','other') DEFAULT NULL,
  `square_meters` double DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `pets` tinyint(1) NOT NULL DEFAULT 0,
  `raw_material` enum('brick','wood','concrete','steel','stone','other') NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `dwelling_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dwelling`
--

LOCK TABLES `dwelling` WRITE;
/*!40000 ALTER TABLE `dwelling` DISABLE KEYS */;
INSERT INTO `dwelling` VALUES (1,'Piso Urbano 1-1','Gran Vía, 72','Alicante','Alicante','03001','apartment',96,1,1,'brick',1),(2,'Piso Urbano 1-2','Avenida América, 39','Palma','Islas Baleares','07001','apartment',59.1,1,0,'wood',1),(3,'Piso Urbano 2-1','Paseo de Gracia, 63','Sevilla','Sevilla','41001','apartment',75.7,1,1,'brick',2),(4,'Chalet Familiar 2-2','Paseo de Gracia, 89','Zaragoza','Zaragoza','50001','apartment',54.6,1,0,'steel',2),(5,'Loft Industrial 3-1','Calle Velázquez, 112','Valencia','Valencia','46001','house',99.1,1,1,'concrete',3),(6,'Vivienda Costa 3-2','Calle Velázquez, 82','Murcia','Murcia','30001','house',93.4,1,1,'brick',3),(7,'Apartamento Playa 4-1','Calle Mayor, 147','Valencia','Valencia','46001','apartment',70.8,1,1,'concrete',4),(8,'Casa Rural 4-2','Calle Velázquez, 79','Palma','Islas Baleares','07001','apartment',50.1,1,0,'steel',4),(9,'Estudio Downtown 5-1','Avenida de la Constitución, 65','Zaragoza','Zaragoza','50001','loft',117,1,1,'brick',5),(10,'Apartamento Centro 5-2','Paseo de Gracia, 135','Valencia','Valencia','46001','apartment',71.7,1,0,'brick',5),(11,'Casa Principal 6-1','Calle Princesa, 7','Bilbao','Vizcaya','48001','studio',47.6,1,1,'wood',6),(12,'Piso Urbano 6-2','Avenida Diagonal, 115','Murcia','Murcia','30001','apartment',68.5,1,0,'concrete',6),(13,'Casa Principal 7-1','Paseo de Gracia, 52','Barcelona','Barcelona','08001','house',98.4,1,0,'concrete',7),(14,'Estudio Downtown 7-2','Avenida América, 29','Palma','Islas Baleares','07001','house',172,1,1,'brick',7),(15,'Chalet Familiar 8-1','Paseo de Gracia, 42','Zaragoza','Zaragoza','50001','apartment',94.5,1,1,'steel',8),(16,'Apartamento Centro 9-1','Calle del Sol, 25','Alicante','Alicante','03001','house',108.1,1,1,'wood',9),(17,'Apartamento Centro 10-1','Calle del Sol, 52','Murcia','Murcia','30001','house',181.6,1,0,'wood',10),(18,'Estudio Downtown 11-1','Gran Vía, 117','Zaragoza','Zaragoza','50001','apartment',58.8,1,0,'steel',11),(19,'Loft Industrial 12-1','Calle Mayor, 93','Murcia','Murcia','30001','house',141.8,0,1,'concrete',12),(20,'Apartamento Centro 13-1','Calle del Sol, 137','Zaragoza','Zaragoza','50001','loft',60.3,1,0,'brick',13),(21,'Estudio Downtown 14-1','Calle Princesa, 127','Valencia','Valencia','46001','studio',45.8,1,0,'brick',14),(22,'Apartamento Centro 15-1','Gran Vía, 33','Sevilla','Sevilla','41001','house',195.8,0,1,'wood',15),(23,'Apartamento Playa 16-1','Calle Serrano, 120','Valencia','Valencia','46001','loft',116.3,1,0,'concrete',16),(24,'Casa Principal 17-1','Avenida de la Constitución, 126','Sevilla','Sevilla','41001','apartment',95.6,0,0,'brick',17),(25,'Estudio Downtown 18-1','Paseo de Gracia, 5','Alicante','Alicante','03001','house',169.5,1,1,'wood',18),(26,'Casa Rural 19-1','Avenida de la Constitución, 67','Murcia','Murcia','30001','loft',99.6,1,0,'concrete',19),(27,'Casa de Campo 20-1','Paseo de Gracia, 79','Sevilla','Sevilla','41001','studio',48.1,1,1,'steel',20),(28,'Apartamento Playa 21-1','Avenida América, 57','Palma','Islas Baleares','07001','loft',88.3,1,0,'brick',21),(29,'Casa de Campo 22-1','Paseo de Gracia, 25','Alicante','Alicante','03001','apartment',55.2,1,1,'brick',22),(30,'Vivienda Costa 23-1','Calle Alcalá, 103','Valencia','Valencia','46001','house',113.1,1,1,'steel',23),(31,'Loft Industrial 24-1','Avenida de la Constitución, 11','Málaga','Málaga','29001','house',151.6,1,0,'wood',24),(32,'Chalet Familiar 25-1','Calle Princesa, 129','Palma','Islas Baleares','07001','house',162.3,1,0,'brick',25);
/*!40000 ALTER TABLE `dwelling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `flat` varchar(10) DEFAULT '1',
  `square_meters` double DEFAULT 0,
  `power_outlet` tinyint(1) DEFAULT NULL,
  `natural_light_type` enum('high','low','medium','none') DEFAULT NULL,
  `number_doors` int(11) DEFAULT 1,
  `number_windows` int(11) DEFAULT 0,
  `id_dwelling` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_dwelling` (`id_dwelling`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`id_dwelling`) REFERENCES `dwelling` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Vestidor','1',26.1,1,'medium',1,3,1),(2,'Comedor','1',26.9,1,'high',1,3,1),(3,'Baño Principal','1',29.1,1,'high',1,1,1),(4,'Salón','1',13.2,1,'medium',2,3,2),(5,'Dormitorio Principal','1',10.6,1,'high',1,2,2),(6,'Estudio','1',17.7,1,'high',1,3,2),(7,'Baño','1',16.7,0,'none',1,0,2),(8,'Dormitorio Principal','1',23.8,1,'high',1,1,3),(9,'Vestidor','1',22.3,1,'high',1,1,3),(10,'Baño Principal','1',24,1,'high',1,1,3),(11,'Habitación Invitados','1',16.7,1,'high',1,3,3),(12,'Salón','1',16.9,1,'high',2,1,4),(13,'Cocina','1',10.7,1,'high',2,1,4),(14,'Garaje','1',14.1,1,'low',1,1,4),(15,'Baño Principal','1',10.7,1,'high',1,1,4),(16,'Estudio','1',13.4,1,'medium',1,3,5),(17,'Baño Principal','1',9.4,0,'medium',1,1,5),(18,'Garaje','1',10.6,1,'none',1,0,5),(19,'Dormitorio','1',14,1,'high',1,1,5),(20,'Habitación Invitados','1',16,1,'high',1,1,5),(21,'Salón','1',13.2,1,'medium',1,3,5),(22,'Comedor','1',10.8,1,'high',1,3,5),(23,'Baño','1',8.8,1,'none',1,1,5),(24,'Dormitorio Principal','1',16.5,1,'high',1,1,6),(25,'Habitación Invitados','1',16.9,1,'medium',1,1,6),(26,'Terraza','1',14.3,1,'medium',1,3,6),(27,'Estudio','1',12.1,1,'high',1,1,6),(28,'Cocina','1',10.8,1,'high',1,2,6),(29,'Baño','1',13.5,1,'low',1,1,6),(30,'Lavadero','1',10.1,1,'high',1,3,6),(31,'Cocina','1',20.4,1,'medium',2,3,7),(32,'Dormitorio','1',27.7,1,'medium',1,1,7),(33,'Salón','1',28.8,1,'medium',1,1,7),(34,'Lavadero','1',20.4,1,'medium',1,2,8),(35,'Vestidor','1',12.5,1,'medium',1,1,8),(36,'Baño','1',19.2,1,'none',1,0,8),(37,'Cocina','1',32.4,1,'medium',2,1,9),(38,'Lavadero','1',36.2,1,'high',1,2,9),(39,'Salón','1',26.4,1,'medium',1,3,9),(40,'Comedor','1',37.4,1,'medium',1,1,9),(41,'Dormitorio Principal','1',12.8,1,'high',1,1,10),(42,'Comedor','1',10.4,1,'high',1,3,10),(43,'Estudio','1',11.2,1,'medium',1,2,10),(44,'Cocina','1',11.5,1,'medium',2,1,10),(45,'Terraza','1',13.9,1,'medium',1,1,10),(46,'Vestidor','1',41.5,1,'high',1,3,11),(47,'Vestidor','1',13.1,1,'high',1,1,12),(48,'Dormitorio','1',13.6,1,'medium',1,1,12),(49,'Salón','1',12.6,1,'high',2,1,12),(50,'Cocina','1',14.9,1,'medium',2,1,12),(51,'Garaje','1',17.8,1,'none',1,0,12),(52,'Baño Principal','1',19.1,0,'high',1,2,13),(53,'Comedor','1',16.9,1,'medium',1,3,13),(54,'Cocina','1',23.5,1,'high',2,2,13),(55,'Terraza','1',21.9,1,'high',1,1,13),(56,'Baño','1',15,1,'none',1,1,13),(57,'Cocina','1',25.3,1,'high',2,3,14),(58,'Dormitorio Principal','1',38.9,1,'medium',1,2,14),(59,'Vestidor','1',39.3,1,'high',1,3,14),(60,'Lavadero','1',37.4,1,'medium',1,3,14),(61,'Garaje','1',27.1,1,'low',1,0,14),(62,'Garaje','1',21.5,1,'none',1,0,15),(63,'Dormitorio Principal','1',17.7,1,'medium',1,2,15),(64,'Baño','1',23,1,'low',1,1,15),(65,'Baño Principal','1',17.1,1,'medium',1,3,15),(66,'Lavadero','1',17.5,1,'medium',1,2,15),(67,'Baño Principal','1',14.7,1,'high',1,3,16),(68,'Dormitorio Principal','1',14.6,1,'medium',1,1,16),(69,'Estudio','1',15.3,1,'high',1,2,16),(70,'Vestidor','1',9.5,1,'medium',1,2,16),(71,'Baño','1',17.4,1,'low',1,1,16),(72,'Salón','1',13.6,1,'high',2,3,16),(73,'Dormitorio','1',12.7,1,'medium',1,1,16),(74,'Comedor','1',14,1,'high',1,1,16),(75,'Comedor','1',21.8,1,'medium',1,1,17),(76,'Baño Principal','1',25,1,'medium',1,1,17),(77,'Dormitorio Principal','1',27.8,1,'high',1,3,17),(78,'Dormitorio','1',26.7,1,'high',1,2,17),(79,'Lavadero','1',32.6,1,'medium',1,2,17),(80,'Baño','1',28.7,1,'low',1,1,17),(81,'Baño Principal','1',10.3,1,'high',1,1,18),(82,'Lavadero','1',11.2,1,'medium',1,3,18),(83,'Dormitorio','1',10.5,1,'high',1,1,18),(84,'Cocina','1',10.1,1,'medium',1,2,18),(85,'Comedor','1',10.7,1,'high',1,3,18),(86,'Comedor','1',30.5,1,'high',1,1,19),(87,'Vestidor','1',22,1,'medium',1,2,19),(88,'Dormitorio','1',25.1,1,'medium',1,1,19),(89,'Garaje','1',23.1,1,'low',1,0,19),(90,'Baño Principal','1',24.5,1,'medium',1,1,19),(91,'Estudio','1',23.9,1,'high',1,1,19),(92,'Vestidor','1',23.3,1,'medium',1,2,20),(93,'Terraza','1',26.7,1,'medium',1,1,20),(94,'Dormitorio','1',18.9,1,'high',1,2,21),(95,'Baño','1',25.2,1,'none',1,0,21),(96,'Baño Principal','1',17.4,1,'medium',1,1,22),(97,'Comedor','1',25.3,1,'medium',1,1,22),(98,'Baño','1',24,1,'none',1,1,22),(99,'Salón','1',20.3,1,'medium',1,3,22),(100,'Vestidor','1',17.2,1,'medium',1,1,22),(101,'Dormitorio Principal','1',18.7,1,'medium',1,3,22),(102,'Habitación Invitados','1',20.4,1,'high',1,1,22),(103,'Estudio','1',17.4,1,'medium',1,1,22),(104,'Salón','1',51.3,1,'medium',1,3,23),(105,'Dormitorio','1',51.4,1,'medium',1,1,23),(106,'Dormitorio','1',15.1,1,'high',1,1,24),(107,'Baño Principal','1',24.7,1,'medium',1,2,24),(108,'Estudio','1',20.6,1,'medium',1,2,24),(109,'Vestidor','1',23.9,1,'medium',1,1,24),(110,'Garaje','1',22,1,'low',1,0,24),(111,'Garaje','1',26,1,'low',1,1,25),(112,'Dormitorio','1',27.3,1,'medium',1,1,25),(113,'Comedor','1',35,1,'high',1,3,25),(114,'Dormitorio Principal','1',24.9,1,'high',1,1,25),(115,'Vestidor','1',30.6,1,'high',1,2,25),(116,'Terraza','1',36.4,1,'high',1,1,25),(117,'Dormitorio Principal','1',45.8,1,'high',1,1,26),(118,'Cocina','1',45.4,1,'high',1,2,26),(119,'Salón','1',49.4,1,'medium',2,1,27),(120,'Dormitorio','1',20,1,'high',1,3,28),(121,'Comedor','1',20.9,1,'high',1,2,28),(122,'Cocina','1',23.7,1,'high',2,1,28),(123,'Dormitorio Principal','1',16.5,1,'high',1,2,28),(124,'Habitación Invitados','1',8,1,'medium',1,3,29),(125,'Dormitorio','1',9,1,'high',1,1,29),(126,'Salón','1',13,1,'medium',2,2,29),(127,'Dormitorio Principal','1',9.8,1,'medium',1,1,29),(128,'Vestidor','1',8.4,1,'high',1,2,29),(129,'Dormitorio Principal','1',15.1,1,'medium',1,1,30),(130,'Lavadero','1',16.4,1,'high',1,2,30),(131,'Estudio','1',13.9,1,'high',1,3,30),(132,'Baño','1',12.7,0,'low',1,0,30),(133,'Vestidor','1',15.5,1,'medium',1,3,30),(134,'Habitación Invitados','1',12.9,1,'medium',1,3,30),(135,'Dormitorio','1',10.5,1,'high',1,2,30),(136,'Garaje','1',16.4,1,'none',1,1,30),(137,'Salón','1',17.5,1,'medium',2,2,31),(138,'Dormitorio Principal','1',16.9,1,'high',1,1,31),(139,'Garaje','1',24.5,1,'none',1,0,31),(140,'Comedor','1',21,1,'medium',1,2,31),(141,'Terraza','1',19.7,1,'medium',1,3,31),(142,'Vestidor','1',22.3,1,'medium',1,3,31),(143,'Habitación Invitados','1',19.6,1,'high',1,2,31),(144,'Comedor','1',34.4,1,'medium',1,3,32),(145,'Terraza','1',24.5,1,'high',1,1,32),(146,'Baño','1',28.3,0,'low',1,1,32),(147,'Dormitorio','1',28.8,1,'medium',1,2,32),(148,'Habitación Invitados','1',19.7,1,'medium',1,1,32),(149,'Estudio','1',20.9,1,'medium',1,1,32);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routines`
--

DROP TABLE IF EXISTS `routines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routines`
--

LOCK TABLES `routines` WRITE;
/*!40000 ALTER TABLE `routines` DISABLE KEYS */;
INSERT INTO `routines` VALUES (1,'Despertar Mañana','Rutina automática para despertar mañana','07:41:00','08:34:00',1,'2025-07-18 08:25:36'),(2,'Salir de Casa','Rutina automática para salir de casa','19:49:00','20:40:00',1,'2025-04-17 08:25:36'),(3,'Llegar a Casa','Rutina automática para llegar a casa','18:32:00','19:24:00',1,'2025-03-21 09:25:36'),(4,'Ir a Dormir','Rutina automática para ir a dormir','23:51:00','23:56:00',1,'2025-08-06 08:25:36'),(5,'Modo Noche','Rutina automática para modo noche','23:58:00','23:48:00',0,'2025-12-02 09:25:36'),(6,'Fin de Semana','Rutina automática para fin de semana','17:51:00','20:51:00',0,'2025-11-14 09:25:36'),(7,'Modo Vacaciones','Rutina automática para modo vacaciones','04:44:00','06:27:00',1,'2025-09-08 08:25:36'),(8,'Ahorro Energía','Rutina automática para ahorro energía','20:16:00','23:00:00',1,'2025-04-08 08:25:36'),(9,'Seguridad Activada','Rutina automática para seguridad activada','17:09:00','20:48:00',0,'2025-02-18 09:25:36'),(10,'Modo Lectura','Rutina automática para modo lectura','22:59:00','01:00:00',1,'2025-03-30 08:25:36'),(11,'Ver Películas','Rutina automática para ver películas','01:00:00','04:19:00',0,'2025-08-20 08:25:36'),(12,'Modo Fiesta','Rutina automática para modo fiesta','04:55:00','07:24:00',0,'2025-03-21 09:25:36'),(13,'Limpieza Casa','Rutina automática para limpieza casa','18:40:00','19:46:00',1,'2025-11-10 09:25:36'),(14,'Regar Plantas','Rutina automática para regar plantas','21:56:00','22:26:00',1,'2025-12-22 09:25:36'),(15,'Ventilación','Rutina automática para ventilación','06:03:00','07:30:00',1,'2025-06-14 08:25:36'),(16,'Calefacción Invierno','Rutina automática para calefacción invierno','16:51:00','18:42:00',1,'2025-03-17 09:25:36'),(17,'Refrigeración Verano','Rutina automática para refrigeración verano','07:09:00','08:28:00',1,'2025-06-02 08:25:36'),(18,'Modo Trabajo','Rutina automática para modo trabajo','06:34:00','07:21:00',1,'2025-11-21 09:25:36'),(19,'Cocinar','Rutina automática para cocinar','06:57:00','09:18:00',0,'2025-06-27 08:25:36'),(20,'Ejercicio','Rutina automática para ejercicio','01:46:00','03:33:00',0,'2025-12-13 09:25:36');
/*!40000 ALTER TABLE `routines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `direction` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Carlos','García','+34 613 158760','Paseo de Gracia, 58','Sevilla','Sevilla','41001','$2a$10$v1bi2ouupqsq0tsqkt88d','2025-06-06 08:24:28'),(2,'María','Fernández','+34 693 198840','Paseo de Gracia, 111','Zaragoza','Zaragoza','50001','$2a$10$1ho12neekwyqz9t8chiqt','2023-11-04 09:24:28'),(3,'José','González','+34 639 617749','Ronda de Segovia, 12','Bilbao','Vizcaya','48001','$2a$10$pc4han71ns9p9u41ixpv','2025-05-11 08:24:28'),(4,'Ana','Rodríguez','+34 625 887843','Avenida de la Constitución, 27','Murcia','Murcia','30001','$2a$10$jxl7ge5o7k9moaxma5dlv','2025-08-17 08:24:28'),(5,'Francisco','López','+34 698 318791','Calle Mayor, 69','Zaragoza','Zaragoza','50001','$2a$10$mtkgjp144ao89y7hqy319','2025-01-02 09:24:28'),(6,'Carmen','Martínez','+34 600 219798','Gran Vía, 148','Zaragoza','Zaragoza','50001','$2a$10$98wj2e7pabp3easzauxw4w','2024-07-04 08:24:28'),(7,'Antonio','Sánchez','+34 607 676592','Calle Alcalá, 13','Bilbao','Vizcaya','48001','$2a$10$0wsa72dta7jdyzzb6uq1i7','2024-05-14 08:24:28'),(8,'Isabel','Pérez','+34 621 019337','Gran Vía, 20','Alicante','Alicante','03001','$2a$10$y0wkx09wsbpdwi5up9slsk','2024-11-28 09:24:28'),(9,'Manuel','Martín','+34 609 178442','Calle Mayor, 24','Barcelona','Barcelona','08001','$2a$10$qzjuvcri0falogzg5evir9','2024-07-13 08:24:28'),(10,'Dolores','Gómez','+34 614 844338','Calle del Sol, 9','Barcelona','Barcelona','08001','$2a$10$vtsxuetpiflpss58ocw4pa','2024-02-18 09:24:28'),(11,'David','Ruiz','+34 658 111659','Calle Alcalá, 93','Madrid','Madrid','28001','$2a$10$13nbn2gnvrt9937tffljf0f','2024-06-10 08:24:28'),(12,'Laura','Díaz','+34 639 384306','Calle Mayor, 104','Barcelona','Barcelona','08001','$2a$10$a6k0y87lh1amc5bifxz758','2023-11-30 09:24:28'),(13,'Javier','Hernández','+34 659 415137','Calle Mayor, 121','Palma','Islas Baleares','07001','$2a$10$bip38p0dex4e564e7zxg6','2025-11-02 09:24:28'),(14,'Marta','Álvarez','+34 688 783018','Gran Vía, 20','Zaragoza','Zaragoza','50001','$2a$10$exarx2w3p8z9t8hv6m1ks','2025-11-24 09:24:28'),(15,'Rafael','Jiménez','+34 669 297620','Calle del Sol, 65','Valencia','Valencia','46001','$2a$10$gff6lolxcwwln9eojby25n','2025-01-05 09:24:28'),(16,'Elena','Moreno','+34 634 089311','Calle Velázquez, 95','Murcia','Murcia','30001','$2a$10$qepdmjo166scfdhdr2kpzu','2024-07-26 08:24:28'),(17,'Miguel','Muñoz','+34 635 010005','Ronda de Segovia, 31','Bilbao','Vizcaya','48001','$2a$10$1j2zt0m7qbh62oivgdgplo','2025-12-04 09:24:28'),(18,'Lucía','Alonso','+34 678 910031','Avenida Diagonal, 65','Alicante','Alicante','03001','$2a$10$dc5p3t0z4sskyh02ibk2','2023-08-12 08:24:28'),(19,'Juan','Romero','+34 660 005597','Calle Alcalá, 98','Murcia','Murcia','30001','$2a$10$5xo5u55bb046v25zf65s37','2024-09-08 08:24:28'),(20,'Rosa','Navarro','+34 627 578890','Avenida de la Constitución, 60','Alicante','Alicante','03001','$2a$10$sfy5uhzd78oxy2vd4lww','2023-11-24 09:24:28'),(21,'Pedro','Torres','+34 663 406744','Calle Serrano, 125','Zaragoza','Zaragoza','50001','$2a$10$jk9do8bkbctu2o7jjiax','2023-04-19 08:24:28'),(22,'Patricia','Domínguez','+34 628 414868','Calle Velázquez, 116','Bilbao','Vizcaya','48001','$2a$10$cg48f81ituzcsin42kbaq','2023-03-05 09:24:28'),(23,'Luis','Ramos','+34 693 850714','Calle del Sol, 34','Zaragoza','Zaragoza','50001','$2a$10$m3w72s1x4t135dmavq4ykg','2024-02-11 09:24:28'),(24,'Cristina','Vázquez','+34 650 244761','Calle Serrano, 59','Barcelona','Barcelona','08001','$2a$10$kljc9zl29ll5e3xeab71xt','2023-05-30 08:24:28'),(25,'Fernando','Castro','+34 624 605022','Avenida de la Constitución, 86','Málaga','Málaga','29001','$2a$10$dsgvlhowsywfnqnv5l47ck','2023-01-19 09:24:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'domuxdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-05 15:19:43
