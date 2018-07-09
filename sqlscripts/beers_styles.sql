-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: beers
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `styles`
--

DROP TABLE IF EXISTS `styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `style_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_cat2_id` (`cat_id`),
  CONSTRAINT `fk_cat2_id` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `styles`
--

LOCK TABLES `styles` WRITE;
/*!40000 ALTER TABLE `styles` DISABLE KEYS */;
INSERT INTO `styles` VALUES (1,1,'Classic English-Style Pale Ale'),(2,1,'English-Style India Pale Ale'),(3,1,'Ordinary Bitter'),(4,1,'Special Bitter or Best Bitter'),(5,1,'Extra Special Bitter'),(6,1,'English-Style Summer Ale'),(7,1,'Scottish-Style Light Ale'),(8,1,'Scottish-Style Heavy Ale'),(9,1,'Scottish-Style Export Ale'),(10,1,'English-Style Pale Mild Ale'),(11,1,'English-Style Dark Mild Ale'),(12,1,'English-Style Brown Ale'),(13,1,'Old Ale'),(14,1,'Strong Ale'),(15,1,'Scotch Ale'),(16,1,'British-Style Imperial Stout'),(17,1,'British-Style Barley Wine Ale'),(18,1,'Robust Porter'),(19,1,'Brown Porter'),(20,1,'Sweet Stout'),(21,1,'Oatmeal Stout'),(22,2,'Irish-Style Red Ale'),(23,2,'Classic Irish-Style Dry Stout'),(24,2,'Foreign (Export)-Style Stout'),(25,2,'Porter'),(26,3,'American-Style Pale Ale'),(27,3,'Fresh Hop Ale'),(28,3,'Pale American-Belgo-Style Ale'),(29,3,'Dark American-Belgo-Style Ale'),(30,3,'American-Style Strong Pale Ale'),(31,3,'American-Style India Pale Ale'),(32,3,'Imperial or Double India Pale Ale'),(33,3,'American-Style Amber/Red Ale'),(34,3,'Imperial or Double Red Ale'),(35,3,'American-Style Barley Wine Ale'),(36,3,'American-Style Wheat Wine Ale'),(37,3,'Golden or Blonde Ale'),(38,3,'American-Style Brown Ale'),(39,3,'Smoke Porter'),(40,3,'American-Style Sour Ale'),(41,3,'American-Style India Black Ale'),(42,3,'American-Style Stout'),(43,3,'American-Style Imperial Stout'),(44,3,'Specialty Stouts'),(45,3,'American-Style Imperial Porter'),(46,3,'Porter'),(47,4,'German-Style Kolsch'),(48,4,'Berliner-Style Weisse'),(49,4,'Leipzig-Style Gose'),(50,4,'South German-Style Hefeweizen'),(51,4,'South German-Style Kristal Weizen'),(52,4,'German-Style Leichtes Weizen'),(53,4,'South German-Style Bernsteinfarbenes Weizen'),(54,4,'South German-Style Dunkel Weizen'),(55,4,'South German-Style Weizenbock'),(56,4,'Bamberg-Style Weiss Rauchbier'),(57,4,'German-Style Brown Ale/Altbier'),(58,4,'Kellerbier - Ale'),(59,5,'Belgian-Style Flanders/Oud Bruin'),(60,5,'Belgian-Style Dubbel'),(61,5,'Belgian-Style Tripel'),(62,5,'Belgian-Style Quadrupel'),(63,5,'Belgian-Style Blonde Ale'),(64,5,'Belgian-Style Pale Ale'),(65,5,'Belgian-Style Pale Strong Ale'),(66,5,'Belgian-Style Dark Strong Ale'),(67,5,'Belgian-Style White'),(68,5,'Belgian-Style Lambic'),(69,5,'Belgian-Style Gueuze Lambic'),(70,5,'Belgian-Style Fruit Lambic'),(71,5,'Belgian-Style Table Beer'),(72,5,'Other Belgian-Style Ales'),(73,5,'French-Style Biere de Garde'),(74,5,'French & Belgian-Style Saison'),(75,6,'International-Style Pale Ale'),(76,6,'Australasian-Style Pale Ale'),(77,7,'German-Style Pilsener'),(78,7,'Bohemian-Style Pilsener'),(79,7,'European Low-Alcohol Lager'),(80,7,'Munchner-Style Helles'),(81,7,'Dortmunder/European-Style Export'),(82,7,'Vienna-Style Lager'),(83,7,'German-Style Marzen'),(84,7,'German-Style Oktoberfest'),(85,7,'European-Style Dark'),(86,7,'German-Style Schwarzbier'),(87,7,'Bamberg-Style Marzen'),(88,7,'Bamberg-Style Helles Rauchbier'),(89,7,'Bamberg-Style Bock Rauchbier'),(90,7,'Traditional German-Style Bock'),(91,7,'German-Style Heller Bock/Maibock'),(92,7,'German-Style Doppelbock'),(93,7,'German-Style Eisbock'),(94,7,'Kellerbier - Lager'),(95,8,'American-Style Lager'),(96,8,'American-Style Light Lager'),(97,8,'American-Style Low-Carb Light Lager'),(98,8,'American-Style Amber Lager'),(99,8,'American-Style Premium Lager'),(100,8,'American-Style Pilsener'),(101,8,'American-Style Ice Lager'),(102,8,'American-Style Malt Liquor'),(103,8,'American-Style Amber Lager'),(104,8,'American-Style Marzen/Oktoberfest'),(105,8,'American-Style Dark Lager'),(106,9,'Baltic-Style Porter'),(107,9,'Australasian-Style Light Lager'),(108,9,'Latin American-Style Light Lager'),(109,9,'Tropical-Style Light Lager'),(110,10,'International-Style Pilsener'),(111,10,'Dry Lager'),(112,11,'Session Beer'),(113,11,'American-Style Cream Ale or Lager'),(114,11,'California Common Beer'),(115,11,'Japanese Sake-Yeast Beer'),(116,11,'Light American Wheat Ale or Lager'),(117,11,'Fruit Wheat Ale or Lager'),(118,11,'Dark American Wheat Ale or Lager'),(119,11,'American Rye Ale or Lager'),(120,11,'German-Style Rye Ale'),(121,11,'Fruit Beer'),(122,11,'Field Beer'),(123,11,'Pumpkin Beer'),(124,11,'Chocolate/Cocoa-Flavored Beer'),(125,11,'Coffee-Flavored Beer'),(126,11,'Herb and Spice Beer'),(127,11,'Specialty Beer'),(128,11,'Specialty Honey Lager or Ale'),(129,11,'Gluten-Free Beer'),(130,11,'Smoke Beer'),(131,11,'Experimental Beer'),(132,11,'Out of Category'),(133,11,'Wood- and Barrel-Aged Beer'),(134,11,'Wood- and Barrel-Aged Pale to Amber Beer'),(135,11,'Wood- and Barrel-Aged Dark Beer'),(136,11,'Wood- and Barrel-Aged Strong Beer'),(137,11,'Wood- and Barrel-Aged Sour Beer'),(138,11,'Aged Beer'),(139,11,'Other Strong Ale or Lager'),(140,11,'Non-Alcoholic Beer'),(141,11,'Winter Warmer');
/*!40000 ALTER TABLE `styles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-09 13:28:11
