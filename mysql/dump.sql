-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: clrendezvous
-- ------------------------------------------------------
-- Server version	8.0.35
USE lutece;

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
-- Table structure for table `appointment_appointment`
--

DROP TABLE IF EXISTS `appointment_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_appointment` (
  `id_appointment` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nb_places` int NOT NULL DEFAULT '0',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `id_action_cancelled` int DEFAULT NULL,
  `id_action_reported` int DEFAULT NULL,
  `notification` int NOT NULL DEFAULT '0',
  `id_admin_user` int DEFAULT '0',
  `date_appointment_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_access_code_create` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_user` int NOT NULL,
  `is_surbooked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_appointment`),
  UNIQUE KEY `reference_idx` (`reference`),
  KEY `fk_appointment_appointment_appointment_user_idx` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_appointment`
--

LOCK TABLES `appointment_appointment` WRITE;
/*!40000 ALTER TABLE `appointment_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_appointment_response`
--

DROP TABLE IF EXISTS `appointment_appointment_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_appointment_response` (
  `id_appointment_response` int NOT NULL AUTO_INCREMENT,
  `id_response` int NOT NULL,
  `id_appointment` int NOT NULL,
  PRIMARY KEY (`id_appointment_response`),
  UNIQUE KEY `appointment_appointment_response_unique` (`id_appointment`,`id_response`),
  KEY `fk_appointment_appointment_response_appointment_appointment_idx` (`id_appointment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_appointment_response`
--

LOCK TABLES `appointment_appointment_response` WRITE;
/*!40000 ALTER TABLE `appointment_appointment_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_appointment_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_appointment_slot`
--

DROP TABLE IF EXISTS `appointment_appointment_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_appointment_slot` (
  `id_appointment` int NOT NULL,
  `id_slot` int NOT NULL,
  `nb_places` int NOT NULL,
  PRIMARY KEY (`id_appointment`,`id_slot`),
  KEY `fk_appointment_appointment_slot_slot` (`id_slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_appointment_slot`
--

LOCK TABLES `appointment_appointment_slot` WRITE;
/*!40000 ALTER TABLE `appointment_appointment_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_appointment_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_calendar_template`
--

DROP TABLE IF EXISTS `appointment_calendar_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_calendar_template` (
  `id_calendar_template` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `template_path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_calendar_template`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_calendar_template`
--

LOCK TABLES `appointment_calendar_template` WRITE;
/*!40000 ALTER TABLE `appointment_calendar_template` DISABLE KEYS */;
INSERT INTO `appointment_calendar_template` VALUES (1,'Calendrier','Calendrier des crÃ©neaux disponibles et indisponibles','skin/plugins/appointment/calendar/appointment_form_calendar.html'),(2,'Calendrier jours ouverts','Calendrier des crÃ©neaux disponibles et indisponibles (jours ouverts)','skin/plugins/appointment/calendar/appointment_form_calendar_opendays.html'),(3,'Liste des creneaux disponibles','Liste des crÃ©neaux disponibles','skin/plugins/appointment/calendar/appointment_form_list_open_slots.html'),(4,'Liste des creneaux disponibles jours ouverts','Liste des crÃ©neaux disponibles (jours ouverts)','skin/plugins/appointment/calendar/appointment_form_list_open_slots_opendays.html'),(5,'Liste des creneaux disponible regroupÃ©s','Liste des creneaux disponible regroupÃ©s','skin/plugins/appointment/calendar/appointment_form_list_open_slots_grouped.html');
/*!40000 ALTER TABLE `appointment_calendar_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_category`
--

DROP TABLE IF EXISTS `appointment_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `nb_max_appointments_per_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `appointment_category_unique_label` (`label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_category`
--

LOCK TABLES `appointment_category` WRITE;
/*!40000 ALTER TABLE `appointment_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_closing_day`
--

DROP TABLE IF EXISTS `appointment_closing_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_closing_day` (
  `id_closing_day` int NOT NULL AUTO_INCREMENT,
  `date_of_closing_day` date NOT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_closing_day`),
  UNIQUE KEY `appointment_closing_day_unique` (`id_form`,`date_of_closing_day`),
  KEY `fk_appointment_closing_day_appointment_form_idx` (`id_form`),
  KEY `date_of_closing_day` (`date_of_closing_day`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_closing_day`
--

LOCK TABLES `appointment_closing_day` WRITE;
/*!40000 ALTER TABLE `appointment_closing_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_closing_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_comment`
--

DROP TABLE IF EXISTS `appointment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_comment` (
  `id_comment` int NOT NULL AUTO_INCREMENT,
  `id_form` int NOT NULL DEFAULT '0',
  `starting_validity_date` date NOT NULL,
  `starting_validity_time` time DEFAULT NULL,
  `ending_validity_date` date NOT NULL,
  `ending_validity_time` time DEFAULT NULL,
  `comment` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `comment_creation_date` date NOT NULL,
  `comment_user_creator` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `fk_appointment_comment` (`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_comment`
--

LOCK TABLES `appointment_comment` WRITE;
/*!40000 ALTER TABLE `appointment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_comment_notification_cf`
--

DROP TABLE IF EXISTS `appointment_comment_notification_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_comment_notification_cf` (
  `notify_type` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sender_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb3_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_comment_notification_cf`
--

LOCK TABLES `appointment_comment_notification_cf` WRITE;
/*!40000 ALTER TABLE `appointment_comment_notification_cf` DISABLE KEYS */;
INSERT INTO `appointment_comment_notification_cf` VALUES ('CREATE','noreplay','Notification comment appointment',' '),('DELETE','noreplay','Notification comment appointment',' '),('UPDATE','noreplay','Notification comment appointment',' ');
/*!40000 ALTER TABLE `appointment_comment_notification_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_display`
--

DROP TABLE IF EXISTS `appointment_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_display` (
  `id_display` int NOT NULL AUTO_INCREMENT,
  `display_title_fo` tinyint(1) NOT NULL DEFAULT '0',
  `icon_form_content` mediumblob,
  `icon_form_mime_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nb_weeks_to_display` int NOT NULL DEFAULT '0',
  `is_displayed_on_portlet` tinyint(1) NOT NULL DEFAULT '1',
  `id_calendar_template` int NOT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_display`),
  UNIQUE KEY `appointment_display_unique` (`id_form`),
  KEY `fk_appointment_display_appointment_calendar_template_idx` (`id_calendar_template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_display`
--

LOCK TABLES `appointment_display` WRITE;
/*!40000 ALTER TABLE `appointment_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form`
--

DROP TABLE IF EXISTS `appointment_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_form` (
  `id_form` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  `starting_validity_date` date DEFAULT NULL,
  `ending_validity_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `id_workflow` int DEFAULT NULL,
  `workgroup` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_multislot_appointment` tinyint(1) NOT NULL DEFAULT '0',
  `role_fo` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `capacity_per_slot` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_form`),
  KEY `starting_validity_date_idx` (`starting_validity_date`),
  KEY `ending_validity_date_idx` (`ending_validity_date`),
  KEY `fk_appointment_form_appointment_category_idx` (`id_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form`
--

LOCK TABLES `appointment_form` WRITE;
/*!40000 ALTER TABLE `appointment_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_message`
--

DROP TABLE IF EXISTS `appointment_form_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_form_message` (
  `id_form_message` int NOT NULL AUTO_INCREMENT,
  `calendar_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_firstname_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_firstname_help` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_lastname_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_lastname_help` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_email_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_email_help` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_confirmationEmail_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_confirmationEmail_help` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `text_appointment_created` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `url_redirect_after_creation` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `text_appointment_canceled` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `label_button_redirection` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `no_available_slot` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `calendar_description` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `calendar_reserve_label` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `calendar_full_label` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_form_message`),
  KEY `fk_appointment_form_message_appointment_form_idx` (`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_message`
--

LOCK TABLES `appointment_form_message` WRITE;
/*!40000 ALTER TABLE `appointment_form_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_form_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_portlet`
--

DROP TABLE IF EXISTS `appointment_form_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_form_portlet` (
  `id_portlet` int NOT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_portlet`,`id_form`),
  KEY `fk_appointment_form_portlet_appointment_form_idx` (`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_portlet`
--

LOCK TABLES `appointment_form_portlet` WRITE;
/*!40000 ALTER TABLE `appointment_form_portlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_form_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_form_rule`
--

DROP TABLE IF EXISTS `appointment_form_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_form_rule` (
  `id_form_rule` int NOT NULL AUTO_INCREMENT,
  `is_captcha_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_mandatory_email_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_active_authentication` tinyint(1) NOT NULL DEFAULT '0',
  `nb_days_before_new_appointment` int NOT NULL DEFAULT '0',
  `min_time_before_appointment` int NOT NULL DEFAULT '0',
  `nb_max_appointments_per_user` int NOT NULL DEFAULT '0',
  `nb_days_for_max_appointments_per_user` int NOT NULL DEFAULT '0',
  `bo_overbooking` tinyint(1) NOT NULL DEFAULT '0',
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_form_rule`),
  UNIQUE KEY `appointment_form_rule_unique` (`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_form_rule`
--

LOCK TABLES `appointment_form_rule` WRITE;
/*!40000 ALTER TABLE `appointment_form_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_form_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_localization`
--

DROP TABLE IF EXISTS `appointment_localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_localization` (
  `id_localization` int NOT NULL AUTO_INCREMENT,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_localization`),
  KEY `fk_appointment_localization_appointment_form_idx` (`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_localization`
--

LOCK TABLES `appointment_localization` WRITE;
/*!40000 ALTER TABLE `appointment_localization` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_reservation_rule`
--

DROP TABLE IF EXISTS `appointment_reservation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_reservation_rule` (
  `id_reservation_rule` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `max_capacity_per_slot` int NOT NULL DEFAULT '0',
  `max_people_per_appointment` int NOT NULL DEFAULT '0',
  `duration_appointments` int NOT NULL DEFAULT '15',
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_reservation_rule`),
  KEY `fk_appointment_reservation_rule_appointment_form_idx` (`id_form`),
  KEY `fk_appointment_working_day_appointment_reservation_rule_idx` (`id_reservation_rule`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_reservation_rule`
--

LOCK TABLES `appointment_reservation_rule` WRITE;
/*!40000 ALTER TABLE `appointment_reservation_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_reservation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_slot`
--

DROP TABLE IF EXISTS `appointment_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_slot` (
  `id_slot` int NOT NULL AUTO_INCREMENT,
  `starting_date_time` timestamp NULL DEFAULT NULL,
  `ending_date_time` timestamp NULL DEFAULT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `is_specific` tinyint(1) NOT NULL DEFAULT '0',
  `max_capacity` int NOT NULL DEFAULT '0',
  `nb_remaining_places` int NOT NULL DEFAULT '0',
  `nb_potential_remaining_places` int NOT NULL DEFAULT '0',
  `nb_places_taken` int NOT NULL DEFAULT '0',
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_slot`),
  UNIQUE KEY `appointment_slot_unique_starting` (`id_form`,`starting_date_time`),
  UNIQUE KEY `appointment_slot_unique_ending` (`id_form`,`ending_date_time`),
  KEY `fk_appointment_slot_appointment_form_idx` (`id_form`),
  KEY `starting_date_time_idx` (`starting_date_time`),
  KEY `ending_date_time_idx` (`ending_date_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_slot`
--

LOCK TABLES `appointment_slot` WRITE;
/*!40000 ALTER TABLE `appointment_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_time_slot`
--

DROP TABLE IF EXISTS `appointment_time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_time_slot` (
  `id_time_slot` int NOT NULL AUTO_INCREMENT,
  `starting_time` time NOT NULL,
  `ending_time` time NOT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `max_capacity` int NOT NULL DEFAULT '0',
  `id_working_day` int NOT NULL,
  PRIMARY KEY (`id_time_slot`),
  UNIQUE KEY `appointment_time_slot_unique_starting` (`id_working_day`,`starting_time`),
  UNIQUE KEY `appointment_time_slot_unique_ending` (`id_working_day`,`ending_time`),
  KEY `fk_appointment_time_slot_appointment_working_day_idx` (`id_working_day`),
  KEY `starting_time_idx` (`starting_time`),
  KEY `ending_time_idx` (`ending_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_time_slot`
--

LOCK TABLES `appointment_time_slot` WRITE;
/*!40000 ALTER TABLE `appointment_time_slot` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_user`
--

DROP TABLE IF EXISTS `appointment_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `email_idx` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_user`
--

LOCK TABLES `appointment_user` WRITE;
/*!40000 ALTER TABLE `appointment_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_week_definition`
--

DROP TABLE IF EXISTS `appointment_week_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_week_definition` (
  `id_week_definition` int NOT NULL AUTO_INCREMENT,
  `id_reservation_rule` int NOT NULL,
  `date_of_apply` date NOT NULL,
  `ending_date_of_apply` date NOT NULL,
  PRIMARY KEY (`id_week_definition`),
  UNIQUE KEY `appointment_week_definition_unique_date` (`id_reservation_rule`,`date_of_apply`),
  KEY `date_of_apply_idx` (`date_of_apply`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_week_definition`
--

LOCK TABLES `appointment_week_definition` WRITE;
/*!40000 ALTER TABLE `appointment_week_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_week_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_working_day`
--

DROP TABLE IF EXISTS `appointment_working_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_working_day` (
  `id_working_day` int NOT NULL AUTO_INCREMENT,
  `day_of_week` int NOT NULL,
  `id_reservation_rule` int NOT NULL,
  PRIMARY KEY (`id_working_day`),
  UNIQUE KEY `appointment_working_day_unique` (`id_reservation_rule`,`day_of_week`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_working_day`
--

LOCK TABLES `appointment_working_day` WRITE;
/*!40000 ALTER TABLE `appointment_working_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_working_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentgru_`
--

DROP TABLE IF EXISTS `appointmentgru_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointmentgru_` (
  `id_appointmentgru` int NOT NULL,
  `guid` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `cuid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_appointmentgru`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentgru_`
--

LOCK TABLES `appointmentgru_` WRITE;
/*!40000 ALTER TABLE `appointmentgru_` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentgru_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_item`
--

DROP TABLE IF EXISTS `archive_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archive_item` (
  `id_archive_item` int NOT NULL DEFAULT '0',
  `folder_to_archive` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `archive_destination` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `archive_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `archive_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `archive_mime_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_archive_item`),
  KEY `archive_item_state_idx` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_item`
--

LOCK TABLES `archive_item` WRITE;
/*!40000 ALTER TABLE `archive_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blobstore_blobstore`
--

DROP TABLE IF EXISTS `blobstore_blobstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blobstore_blobstore` (
  `id_blob` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `blob_value` mediumblob,
  PRIMARY KEY (`id_blob`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blobstore_blobstore`
--

LOCK TABLES `blobstore_blobstore` WRITE;
/*!40000 ALTER TABLE `blobstore_blobstore` DISABLE KEYS */;
/*!40000 ALTER TABLE `blobstore_blobstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id_contact` int NOT NULL DEFAULT '0',
  `description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all',
  `hits` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contact`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Contact 1','adresse_email_du_contact_1@domaine.com','all',0),(2,'Contact 2','adresse_email_du_contact_2@domaine.com','all',2);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_list`
--

DROP TABLE IF EXISTS `contact_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_list` (
  `id_contact_list` int NOT NULL DEFAULT '0',
  `label_contact_list` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description_contact_list` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all',
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `contact_list_order` int NOT NULL DEFAULT '0',
  `is_tos_active` smallint NOT NULL DEFAULT '0',
  `tos_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_contact_list`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_list`
--

LOCK TABLES `contact_list` WRITE;
/*!40000 ALTER TABLE `contact_list` DISABLE KEYS */;
INSERT INTO `contact_list` VALUES (1,'Liste de contacts','Ceci est une liste de contacts','all','none',1,1,'Message a valider');
/*!40000 ALTER TABLE `contact_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_list_contact`
--

DROP TABLE IF EXISTS `contact_list_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_list_contact` (
  `id_contact_list` int NOT NULL DEFAULT '0',
  `id_contact` int NOT NULL DEFAULT '0',
  `contact_order` int NOT NULL DEFAULT '0',
  `hits` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contact_list`,`id_contact`,`contact_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_list_contact`
--

LOCK TABLES `contact_list_contact` WRITE;
/*!40000 ALTER TABLE `contact_list_contact` DISABLE KEYS */;
INSERT INTO `contact_list_contact` VALUES (1,1,1,0),(1,2,2,2);
/*!40000 ALTER TABLE `contact_list_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_dashboard`
--

DROP TABLE IF EXISTS `core_admin_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_dashboard` (
  `dashboard_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dashboard_column` int NOT NULL,
  `dashboard_order` int NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_dashboard`
--

LOCK TABLES `core_admin_dashboard` WRITE;
/*!40000 ALTER TABLE `core_admin_dashboard` DISABLE KEYS */;
INSERT INTO `core_admin_dashboard` VALUES ('usersAdminDashboardComponent',1,1),('searchAdminDashboardComponent',1,2),('editorAdminDashboardComponent',1,3),('autoIncludesAdminDashboardComponent',1,4),('featuresAdminDashboardComponent',1,5),('xslExportAdminDashboardComponent',1,6),('myluteceAuthenticationFilterAdminDashboardComponent',1,3),('databaseAdminDashboardComponent',1,1),('workflowAdminDashboardComponent',1,1);
/*!40000 ALTER TABLE `core_admin_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_mailinglist`
--

DROP TABLE IF EXISTS `core_admin_mailinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_mailinglist` (
  `id_mailinglist` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `workgroup` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_mailinglist`
--

LOCK TABLES `core_admin_mailinglist` WRITE;
/*!40000 ALTER TABLE `core_admin_mailinglist` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist` VALUES (1,'admin','admin','all');
/*!40000 ALTER TABLE `core_admin_mailinglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_mailinglist_filter`
--

DROP TABLE IF EXISTS `core_admin_mailinglist_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_mailinglist_filter` (
  `id_mailinglist` int NOT NULL DEFAULT '0',
  `workgroup` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`,`workgroup`,`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_mailinglist_filter`
--

LOCK TABLES `core_admin_mailinglist_filter` WRITE;
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist_filter` VALUES (1,'all','super_admin');
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_right`
--

DROP TABLE IF EXISTS `core_admin_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_right` (
  `id_right` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `level_right` smallint DEFAULT NULL,
  `admin_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_updatable` int NOT NULL DEFAULT '0',
  `plugin_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_feature_group` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `documentation_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_order` int DEFAULT NULL,
  `is_external_feature` smallint DEFAULT '0',
  PRIMARY KEY (`id_right`),
  KEY `index_right` (`level_right`,`admin_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_right`
--

LOCK TABLES `core_admin_right` WRITE;
/*!40000 ALTER TABLE `core_admin_right` DISABLE KEYS */;
INSERT INTO `core_admin_right` VALUES ('CORE_ADMIN_SITE','portal.site.adminFeature.admin_site.name',2,'jsp/admin/site/AdminSite.jsp','portal.site.adminFeature.admin_site.description',1,NULL,'SITE','images/admin/skin/features/admin_site.png','jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-site',1,0),('CORE_CACHE_MANAGEMENT','portal.system.adminFeature.cache_management.name',0,'jsp/admin/system/ManageCaches.jsp','portal.system.adminFeature.cache_management.description',1,'','SYSTEM','images/admin/skin/features/manage_caches.png',NULL,1,0),('CORE_SEARCH_INDEXATION','portal.search.adminFeature.indexer.name',0,'jsp/admin/search/ManageSearchIndexation.jsp','portal.search.adminFeature.indexer.description',0,'','SYSTEM',NULL,NULL,2,0),('CORE_SEARCH_MANAGEMENT','portal.search.adminFeature.search_management.name',0,NULL,'portal.search.adminFeature.search_management.description',0,'','SYSTEM',NULL,NULL,3,0),('CORE_LOGS_VISUALISATION','portal.system.adminFeature.logs_visualisation.name',0,'jsp/admin/system/ManageFilesSystem.jsp','portal.system.adminFeature.logs_visualisation.description',1,'','SYSTEM','images/admin/skin/features/view_logs.png',NULL,4,0),('CORE_PAGE_TEMPLATE_MANAGEMENT','portal.style.adminFeature.page_template_management.name',0,'jsp/admin/style/ManagePageTemplates.jsp','portal.style.adminFeature.page_template_management.description',0,'','STYLE','images/admin/skin/features/manage_page_templates.png',NULL,1,0),('CORE_PLUGINS_MANAGEMENT','portal.system.adminFeature.plugins_management.name',0,'jsp/admin/system/ManagePlugins.jsp','portal.system.adminFeature.plugins_management.description',1,'','SYSTEM','images/admin/skin/features/manage_plugins.png',NULL,5,0),('CORE_PROPERTIES_MANAGEMENT','portal.site.adminFeature.properties_management.name',2,'jsp/admin/ManageProperties.jsp','portal.site.adminFeature.properties_management.description',0,NULL,'SITE',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-properties',2,0),('CORE_STYLESHEET_MANAGEMENT','portal.style.adminFeature.stylesheet_management.name',0,'jsp/admin/style/ManageStyleSheets.jsp','portal.style.adminFeature.stylesheet_management.description',1,'','STYLE','images/admin/skin/features/manage_stylesheets.png',NULL,2,0),('CORE_STYLES_MANAGEMENT','portal.style.adminFeature.styles_management.name',0,'jsp/admin/style/ManageStyles.jsp','portal.style.adminFeature.styles_management.description',1,'','STYLE','images/admin/skin/features/manage_styles.png',NULL,3,0),('CORE_USERS_MANAGEMENT','portal.users.adminFeature.users_management.name',2,'jsp/admin/user/ManageUsers.jsp','portal.users.adminFeature.users_management.description',1,'','MANAGERS','images/admin/skin/features/manage_users.png',NULL,2,0),('CORE_FEATURES_MANAGEMENT','portal.admin.adminFeature.features_management.name',0,NULL,'portal.admin.adminFeature.features_management.description',0,'','SYSTEM','images/admin/skin/features/manage_features.png',NULL,6,0),('CORE_RBAC_MANAGEMENT','portal.rbac.adminFeature.rbac_management.name',0,'jsp/admin/rbac/ManageRoles.jsp','portal.rbac.adminFeature.rbac_management.description',0,'','MANAGERS','images/admin/skin/features/manage_rbac.png',NULL,1,0),('CORE_DAEMONS_MANAGEMENT','portal.system.adminFeature.daemons_management.name',0,'jsp/admin/system/ManageDaemons.jsp','portal.system.adminFeature.daemons_management.description',0,'','SYSTEM',NULL,NULL,7,0),('CORE_WORKGROUPS_MANAGEMENT','portal.workgroup.adminFeature.workgroups_management.name',2,'jsp/admin/workgroup/ManageWorkgroups.jsp','portal.workgroup.adminFeature.workgroups_management.description',0,'','MANAGERS','images/admin/skin/features/manage_workgroups.png',NULL,3,0),('CORE_ROLES_MANAGEMENT','portal.role.adminFeature.roles_management.name',2,'jsp/admin/role/ManagePageRole.jsp','portal.role.adminFeature.roles_management.description',0,'','USERS','images/admin/skin/features/manage_roles.png',NULL,2,0),('CORE_MAILINGLISTS_MANAGEMENT','portal.mailinglist.adminFeature.mailinglists_management.name',2,'jsp/admin/mailinglist/ManageMailingLists.jsp','portal.mailinglist.adminFeature.mailinglists_management.description',0,'','MANAGERS','images/admin/skin/features/manage_mailinglists.png',NULL,4,0),('CORE_LEVEL_RIGHT_MANAGEMENT','portal.users.adminFeature.level_right_management.name',2,NULL,'portal.users.adminFeature.level_right_management.description',0,'','MANAGERS','images/admin/skin/features/manage_rights_levels.png',NULL,5,0),('CORE_LINK_SERVICE_MANAGEMENT','portal.insert.adminFeature.linkService_management.name',2,NULL,'portal.insert.adminFeature.linkService_management.description',0,NULL,NULL,NULL,NULL,1,0),('CORE_RIGHT_MANAGEMENT','portal.users.adminFeature.right_management.name',0,'jsp/admin/features/ManageRights.jsp','portal.users.adminFeature.right_management.description',0,'','MANAGERS','images/admin/skin/features/manage_rights_levels.png',NULL,6,0),('CORE_ADMINDASHBOARD_MANAGEMENT','portal.admindashboard.adminFeature.right_management.name',0,NULL,'portal.admindashboard.adminFeature.right_management.description',0,'','SYSTEM','images/admin/skin/features/manage_admindashboards.png',NULL,8,0),('CORE_DASHBOARD_MANAGEMENT','portal.dashboard.adminFeature.dashboard_management.name',0,NULL,'portal.dashboard.adminFeature.dashboard_management.description',0,'','SYSTEM','images/admin/skin/features/manage_dashboards.png',NULL,9,0),('CORE_XSL_EXPORT_MANAGEMENT','portal.xsl.adminFeature.xsl_export_management.name',2,NULL,'portal.xsl.adminFeature.xsl_export_management.description',1,'','SYSTEM',NULL,NULL,11,0),('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT','portal.templates.adminFeature.ManageAutoIncludes.name',1,NULL,'portal.templates.adminFeature.ManageAutoIncludes.description',1,'','STYLE','images/admin/skin/features/manage_templates.png',NULL,4,0),('CORE_EDITORS_MANAGEMENT','portal.admindashboard.editorManagement.right.name',2,NULL,'portal.admindashboard.editorManagement.right.description',1,'','SYSTEM',NULL,NULL,10,0),('CONTACT_MANAGEMENT','contact.adminFeature.contact_management.name',3,'jsp/admin/plugins/contact/ManageContactsHome.jsp','contact.adminFeature.contact_management.description',0,'contact','APPLICATIONS',NULL,NULL,7,0),('VIEW_TEMP_FILES','filegenerator.adminFeature.temporary_files.name',2,'jsp/admin/plugins/filegenerator/ManageMyFiles.jsp','filegenerator.adminFeature.temporary_files.description',0,'','CONTENT',NULL,NULL,3,0),('FORMS_MANAGEMENT','forms.adminFeature.manageForms.name',1,'jsp/admin/plugins/forms/ManageForms.jsp','forms.adminFeature.manageForms.description',0,'forms','CONTENT',NULL,NULL,1,0),('FORMS_MULTIVIEW','forms.adminFeature.multiviewForms.name',2,'jsp/admin/plugins/forms/MultiviewForms.jsp','forms.adminFeature.multiviewForms.description',0,'forms','CONTENT',NULL,NULL,2,0),('BREADCRUMBACCORDION_MANAGEMENT','module.forms.breadcrumbaccordion.adminFeature.manageBreadcrumbAccordion.name',1,'jsp/admin/plugins/forms/modules/breadcrumbaccordion/ManageBreadcrumbAccordion.jsp','module.forms.breadcrumbaccordion.adminFeature.manageBreadcrumbAccordion.description',0,'forms-breadcrumbaccordion','CONTENT',NULL,NULL,4,0),('CONFIG_DOCUMENT_PRODUCER_MANAGEMENT','module.forms.documentproducer.adminFeature.ManageConfigDocumentProducer.name',1,'jsp/admin/plugins/forms/modules/documentproducer/ManageConfigProducer.jsp?view=getSelectForm','module.forms.documentproducer.adminFeature.ManageConfigDocumentProducer.description',0,'forms-documentproducer','APPLICATIONS',NULL,NULL,2,0),('ENTRY_TYPE_MANAGEMENT','genericattributes.adminFeature.manageEntryType.name',1,'jsp/admin/plugins/genericattributes/ManageEntryType.jsp','genericattributes.adminFeature.manageEntryType.description',0,'genericattributes','APPLICATIONS',NULL,NULL,3,0),('HTMLPAGE_MANAGEMENT','htmlpage.adminFeature.htmlpage_management.name',2,'jsp/admin/plugins/htmlpage/ManageHtmlPage.jsp','htmlpage.adminFeature.htmlpage_management.description',0,'htmlpage','CONTENT',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-htmlpage',5,0),('MATOMO_MANAGEMENT','matomo.adminFeature.ManageMatomo.name',1,'jsp/admin/plugins/matomo/Matomo.jsp','matomo.adminFeature.ManageMatomo.description',0,'matomo','SITE',NULL,NULL,3,0),('MYLUTECE_MANAGEMENT','mylutece.adminFeature.mylutece_management.name',2,'jsp/admin/plugins/mylutece/attribute/ManageAttributes.jsp','mylutece.adminFeature.mylutece_management.description',0,'mylutece','USERS',NULL,NULL,1,0),('MYLUTECE_MANAGE_AUTHENTICATION_FILTER','mylutece.adminFeature.mylutece_management_authentication_filter.name',3,'jsp/admin/plugins/mylutece/security/ManageAuthenticationFilter.jsp','mylutece.adminFeature.mylutece_management_authentication_filter.description',0,'mylutece','SYSTEM',NULL,NULL,15,0),('DATABASE_MANAGEMENT_USERS','module.mylutece.database.adminFeature.database_management_user.name',3,'jsp/admin/plugins/mylutece/modules/database/ManageUsers.jsp','module.mylutece.database.adminFeature.database_management_user.description',0,'mylutece-database','USERS',NULL,NULL,4,0),('DATABASE_GROUPS_MANAGEMENT','module.mylutece.database.adminFeature.groups_management.name',3,'jsp/admin/plugins/mylutece/modules/database/ManageGroups.jsp','module.mylutece.database.adminFeature.groups_management.description',0,'mylutece-database','USERS',NULL,NULL,5,0),('POLL_MANAGEMENT','poll.adminFeature.Manage.name',1,'jsp/admin/plugins/poll/ManagePollForms.jsp','poll.adminFeature.Manage.description',0,'poll','APPLICATIONS',NULL,NULL,4,0),('PROFILES_MANAGEMENT','profiles.adminFeature.profiles_management.name',0,'jsp/admin/plugins/profiles/ManageProfiles.jsp','profiles.adminFeature.profiles_management.description',0,'profiles','MANAGERS',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-profiles',7,0),('PROFILES_VIEWS_MANAGEMENT','profiles.adminFeature.views_management.name',0,'jsp/admin/plugins/profiles/ManageViews.jsp','profiles.adminFeature.views_management.description',0,'profiles','MANAGERS',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-profiles',8,0),('REFERENCELIST_MANAGEMENT','referencelist.adminFeature.ReferenceListManage.name',0,'jsp/admin/plugins/referencelist/ManageReferences.jsp','referencelist.adminFeature.ReferenceListManage.description',0,'referencelist','APPLICATIONS',NULL,NULL,5,0),('REGULAR_EXPRESSION_MANAGEMENT','regularexpression.adminFeature.regularexpression_management.name',0,'jsp/admin/plugins/regularexpression/ManageRegularExpression.jsp','regularexpression.adminFeature.regularexpression_management.description',0,'regularexpression','SYSTEM',NULL,NULL,16,0),('SEO_MANAGEMENT','seo.adminFeature.seo_management.name',0,'jsp/admin/plugins/seo/ManageSEO.jsp','seo.adminFeature.seo_management.description',0,'seo','SYSTEM',NULL,NULL,17,0),('SYSTEMINFO_MANAGEMENT','systeminfo.adminFeature.systeminfo_management.name',0,'jsp/admin/plugins/systeminfo/ManageSystemInfo.jsp','systeminfo.adminFeature.systeminfo_management.description',0,'systeminfo','SYSTEM',NULL,NULL,18,0),('UNITS_MANAGEMENT','unittree.adminFeature.unitsManagement.name',2,'jsp/admin/plugins/unittree/ManageUnits.jsp','unittree.adminFeature.unitsManagement.description',0,'unittree','APPLICATIONS',NULL,'',6,0),('WORKFLOW_MANAGEMENT','workflow.adminFeature.workflow_management.name',3,'jsp/admin/plugins/workflow/ManageWorkflow.jsp','workflow.adminFeature.workflow_management.description',0,'workflow','APPLICATIONS',NULL,NULL,1,0),('MYLUTECE_MANAGE_EXTERNAL_APPLICATION','mylutece.adminFeature.mylutece_management_external_application.name',3,'jsp/admin/plugins/mylutece/ManageExternalApplicationUser.jsp','mylutece.adminFeature.mylutece_management_external_application.description',0,'mylutece','USERS',NULL,NULL,6,0);
/*!40000 ALTER TABLE `core_admin_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_role`
--

DROP TABLE IF EXISTS `core_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_role` (
  `role_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_role`
--

LOCK TABLES `core_admin_role` WRITE;
/*!40000 ALTER TABLE `core_admin_role` DISABLE KEYS */;
INSERT INTO `core_admin_role` VALUES ('all_site_manager','Site Manager'),('super_admin','Super Administrateur'),('forms_manager','FORMS - Gestion des formulaires'),('forms_multiview','FORMS - Visualisation des rÃ©sultats des formulaires'),('assign_roles','Assigner des roles aux utilisateurs'),('assign_groups','Assigner des groupes aux utilisateurs'),('mylutece_manager','GÃ©rer les patramÃ¨tres avancÃ©s Mylutece'),('mylutece_database_manager','Mylutece Database management'),('profiles_manager','Profiles management'),('profiles_views_manager','Profiles Views management'),('CREATE_REFERENCE_IMPORT','Import csv file'),('unittree_management','Gestion des entitÃ©s'),('workflow_manager','Workflow management');
/*!40000 ALTER TABLE `core_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_role_resource`
--

DROP TABLE IF EXISTS `core_admin_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_role_resource` (
  `rbac_id` int NOT NULL AUTO_INCREMENT,
  `role_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `resource_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `resource_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `permission` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`rbac_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1910 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_role_resource`
--

LOCK TABLES `core_admin_role_resource` WRITE;
/*!40000 ALTER TABLE `core_admin_role_resource` DISABLE KEYS */;
INSERT INTO `core_admin_role_resource` VALUES (57,'all_site_manager','PAGE','*','VIEW'),(58,'all_site_manager','PAGE','*','MANAGE'),(77,'super_admin','INSERT_SERVICE','*','*'),(101,'all_site_manager','PORTLET_TYPE','*','*'),(111,'all_site_manager','ADMIN_USER','*','*'),(137,'all_site_manager','SEARCH_SERVICE','*','*'),(164,'all_site_manager','XSL_EXPORT','*','*'),(1907,'forms_manager','FORMS_FORM','*','*'),(1908,'forms_multiview','FORM_PANEL_CONF','*','*'),(205,'assign_roles','ROLE_TYPE','*','ASSIGN_ROLE'),(207,'mylutece_manager','MYLUTECE','*','*'),(206,'assign_groups','GROUP_TYPE','*','ASSIGN_GROUP'),(350,'mylutece_database_manager','DATABASE','*','*'),(150,'profiles_manager','PROFILES','*','*'),(151,'profiles_views_manager','PROFILES_VIEWS','*','*'),(165,'CREATE_REFERENCE_IMPORT','REFERENCE_IMPORT','*','*'),(210,'unittree_management','UNIT_TYPE','*','*'),(912,'workflow_manager','WORKFLOW_ACTION_TYPE','*','*'),(923,'workflow_manager','WORKFLOW_STATE_TYPE','*','*');
/*!40000 ALTER TABLE `core_admin_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user`
--

DROP TABLE IF EXISTS `core_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `access_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '0',
  `password` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `locale` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'fr',
  `level_user` smallint NOT NULL DEFAULT '0',
  `reset_password` smallint NOT NULL DEFAULT '0',
  `accessibility_mode` smallint NOT NULL DEFAULT '0',
  `password_max_valid_date` timestamp NULL DEFAULT NULL,
  `account_max_valid_date` bigint DEFAULT NULL,
  `nb_alerts_sent` int NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '1979-12-31 23:00:00',
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'all',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user`
--

LOCK TABLES `core_admin_user` WRITE;
/*!40000 ALTER TABLE `core_admin_user` DISABLE KEYS */;
INSERT INTO `core_admin_user` VALUES (1,'admin','Admin','admin','admin@lutece.fr',0,'PBKDF2WITHHMACSHA512:40000:6d50268735088106a7c44f6c771ad0c4:55ab62976ec4a288b8fcee8c63f5dcb8d7a7e7478916670e84a38f1116e80bae90325d31ffa7481ad137f83f03d3d86fdcfcbb9a4d897883374ee2b94d7a10e9f519e8620f19e1a604cf8a99c306e3c773b2b3115f56d3ce5e77506de6474813a09206e7fef520512e58bafe103257197394759ae012d6be52c787453a9c2070','fr',0,0,0,NULL,1677084136720,0,'2022-02-22 16:42:16','all'),(5,'adminpack','PACK','User','useradmin@anymail.com',0,'PBKDF2WITHHMACSHA512:40000:9d655481370c0bdd487ff85e2c3c1cbc:c4fe352ef4ea0ad2b08b915cdeedec3d47e3582b943c4b5e6bc6c9fabca3820f9ab548ee3ed533b94a761e9e2dbe49069d894d96212d3b8fbc26957543f8bbb72710b2276e533ba79f2f265a2345475ba2c221de9ce7d7e6bed4c520cd92f2b93a91662164928f52bde8af70b5d22978e8056129e88aa2a64a05da8f28a60c79','fr',1,0,0,NULL,1676972803980,0,'2022-02-21 09:46:43','all');
/*!40000 ALTER TABLE `core_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_anonymize_field`
--

DROP TABLE IF EXISTS `core_admin_user_anonymize_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_user_anonymize_field` (
  `field_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `anonymize` smallint NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_anonymize_field`
--

LOCK TABLES `core_admin_user_anonymize_field` WRITE;
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` DISABLE KEYS */;
INSERT INTO `core_admin_user_anonymize_field` VALUES ('access_code',1),('last_name',1),('first_name',1),('email',1);
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_field`
--

DROP TABLE IF EXISTS `core_admin_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_user_field` (
  `id_user_field` int NOT NULL AUTO_INCREMENT,
  `id_user` int DEFAULT NULL,
  `id_attribute` int DEFAULT NULL,
  `id_field` int DEFAULT NULL,
  `id_file` int DEFAULT NULL,
  `user_field_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_user_field`),
  KEY `core_admin_user_field_idx_file` (`id_file`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_field`
--

LOCK TABLES `core_admin_user_field` WRITE;
/*!40000 ALTER TABLE `core_admin_user_field` DISABLE KEYS */;
INSERT INTO `core_admin_user_field` VALUES (6,5,1,5,NULL,'technical_admin_forms'),(5,5,1,4,NULL,'forms_response_manager'),(4,5,1,3,NULL,'forms_admin');
/*!40000 ALTER TABLE `core_admin_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_user_preferences`
--

DROP TABLE IF EXISTS `core_admin_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_user_preferences` (
  `id_user` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_admin_user_preferences` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_user_preferences`
--

LOCK TABLES `core_admin_user_preferences` WRITE;
/*!40000 ALTER TABLE `core_admin_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_workgroup`
--

DROP TABLE IF EXISTS `core_admin_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_workgroup` (
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `workgroup_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_workgroup`
--

LOCK TABLES `core_admin_workgroup` WRITE;
/*!40000 ALTER TABLE `core_admin_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_workgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_admin_workgroup_user`
--

DROP TABLE IF EXISTS `core_admin_workgroup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_workgroup_user` (
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`workgroup_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_admin_workgroup_user`
--

LOCK TABLES `core_admin_workgroup_user` WRITE;
/*!40000 ALTER TABLE `core_admin_workgroup_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_workgroup_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_attribute`
--

DROP TABLE IF EXISTS `core_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_attribute` (
  `id_attribute` int NOT NULL AUTO_INCREMENT,
  `type_class_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `help_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_mandatory` smallint DEFAULT '0',
  `is_shown_in_search` smallint DEFAULT '0',
  `is_shown_in_result_list` smallint DEFAULT '0',
  `is_field_in_line` smallint DEFAULT '0',
  `attribute_position` int DEFAULT '0',
  `plugin_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `anonymize` smallint DEFAULT NULL,
  PRIMARY KEY (`id_attribute`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_attribute`
--

LOCK TABLES `core_attribute` WRITE;
/*!40000 ALTER TABLE `core_attribute` DISABLE KEYS */;
INSERT INTO `core_attribute` VALUES (1,'fr.paris.lutece.portal.business.user.attribute.AttributeComboBox','Profil','',0,0,0,0,0,'profiles',NULL);
/*!40000 ALTER TABLE `core_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_attribute_field`
--

DROP TABLE IF EXISTS `core_attribute_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_attribute_field` (
  `id_field` int NOT NULL AUTO_INCREMENT,
  `id_attribute` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DEFAULT_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_DEFAULT_value` smallint DEFAULT '0',
  `height` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `max_size_enter` int DEFAULT NULL,
  `is_multiple` smallint DEFAULT '0',
  `field_position` int DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_attribute_field`
--

LOCK TABLES `core_attribute_field` WRITE;
/*!40000 ALTER TABLE `core_attribute_field` DISABLE KEYS */;
INSERT INTO `core_attribute_field` VALUES (1,1,NULL,NULL,0,0,0,0,1,1),(3,1,'forms_admin','Admin manager for Forms - create, update and delete forms',0,0,0,0,0,2),(4,1,'forms_response_manager','User that manage responses made through forms',0,0,0,0,0,3),(5,1,'technical_admin_forms','Admin technical manager that can configure all necessary features to admin forms',0,0,0,0,0,4);
/*!40000 ALTER TABLE `core_attribute_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_connections_log`
--

DROP TABLE IF EXISTS `core_connections_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_connections_log` (
  `access_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip_address` varchar(63) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_status` int DEFAULT NULL,
  KEY `index_connections_log` (`ip_address`,`date_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_connections_log`
--

LOCK TABLES `core_connections_log` WRITE;
/*!40000 ALTER TABLE `core_connections_log` DISABLE KEYS */;
INSERT INTO `core_connections_log` VALUES ('laurent.hohl@gmail.com','0:0:0:0:0:0:0:1','2022-02-17 08:06:09',0);
/*!40000 ALTER TABLE `core_connections_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_dashboard`
--

DROP TABLE IF EXISTS `core_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_dashboard` (
  `dashboard_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dashboard_column` int NOT NULL,
  `dashboard_order` int NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_dashboard`
--

LOCK TABLES `core_dashboard` WRITE;
/*!40000 ALTER TABLE `core_dashboard` DISABLE KEYS */;
INSERT INTO `core_dashboard` VALUES ('CORE_SYSTEM',1,2),('CORE_USERS',1,1),('CORE_USER',4,1),('CORE_PAGES',2,2),('FORMS',2,1),('WORKFLOW',3,1);
/*!40000 ALTER TABLE `core_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_datastore`
--

DROP TABLE IF EXISTS `core_datastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_datastore` (
  `entity_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `entity_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`entity_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_datastore`
--

LOCK TABLES `core_datastore` WRITE;
/*!40000 ALTER TABLE `core_datastore` DISABLE KEYS */;
INSERT INTO `core_datastore` VALUES ('core.advanced_parameters.password_duration','120'),('core.advanced_parameters.default_user_level','0'),('core.advanced_parameters.default_user_notification','1'),('core.advanced_parameters.default_user_language','fr'),('core.advanced_parameters.default_user_status','0'),('core.advanced_parameters.email_pattern','^[\\w_.\\-!\\#\\$\\%\\&\'\\*\\+\\/\\=\\?\\^\\`\\}\\{\\|\\~]+@[\\w_.\\-]+\\.[\\w]+$'),('core.advanced_parameters.email_pattern_verify_by',''),('core.advanced_parameters.force_change_password_reinit','false'),('core.advanced_parameters.password_minimum_length','8'),('core.advanced_parameters.password_format_upper_lower_case','false'),('core.advanced_parameters.password_format_numero','false'),('core.advanced_parameters.password_format_special_characters','false'),('core.advanced_parameters.password_history_size',''),('core.advanced_parameters.maximum_number_password_change',''),('core.advanced_parameters.tsw_size_password_change',''),('core.advanced_parameters.use_advanced_security_parameters',''),('core.advanced_parameters.account_life_time','12'),('core.advanced_parameters.time_before_alert_account','30'),('core.advanced_parameters.nb_alert_account','2'),('core.advanced_parameters.time_between_alerts_account','10'),('core.advanced_parameters.access_failures_max','3'),('core.advanced_parameters.access_failures_interval','10'),('core.advanced_parameters.expired_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.expired_alert_mail_subject','Votre compte a expirÃ©'),('core.advanced_parameters.first_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.first_alert_mail_subject','Votre compte va bientÃ´t expirer'),('core.advanced_parameters.other_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.other_alert_mail_subject','Votre compte va bientÃ´t expirer'),('core.advanced_parameters.account_reactivated_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.account_reactivated_mail_subject','Votre compte a bien Ã©tÃ© rÃ©activÃ©'),('core.advanced_parameters.access_failures_captcha','1'),('core.advanced_parameters.notify_user_password_expired',''),('core.advanced_parameters.password_expired_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.password_expired_mail_subject','Votre mot de passe a expirÃ©'),('core.advanced_parameters.reset_token_validity','60'),('core.advanced_parameters.lock_reset_token_to_session','false'),('core.backOffice.defaultEditor','tinymce'),('core.frontOffice.defaultEditor','markitupbbcode'),('core_banned_domain_names','yopmail.com'),('portal.site.site_property.name','FORMS By LUTECE'),('portal.site.site_property.meta.author','<author>'),('portal.site.site_property.meta.copyright','<copyright>'),('portal.site.site_property.meta.description','<description>'),('portal.site.site_property.meta.keywords','<keywords>'),('portal.site.site_property.email','webmaster@mydomain.com'),('portal.site.site_property.noreply_email','no-reply@mydomain.com'),('portal.site.site_property.home_url','jsp/site/Portal.jsp'),('portal.site.site_property.admin_home_url','jsp/admin/AdminMenu.jsp'),('portal.site.site_property.popup_credits.textblock','&lt;credits text&gt;'),('portal.site.site_property.popup_legal_info.copyright.textblock','&lt;copyright text&gt;'),('portal.site.site_property.popup_legal_info.privacy.textblock','&lt;privacy text&gt;'),('portal.site.site_property.logo_url','images/logo-pack-light.min.svg'),('portal.site.site_property.locale.default','fr'),('portal.site.site_property.avatar_default','images/admin/skin/unknown.png'),('portal.site.site_property.back_images','\'images/admin/skin/bg_login1.svg\' , \'images/admin/skin/bg_login2.svg\' , \'images/admin/skin/bg_login3.svg\' , \'images/admin/skin/bg_login4.svg\''),('portal.site.site_property.portlet.title.maxlength','75'),('themecitelibre.site_property.footer.cookieLink','#cookiecitelibrepack'),('themecitelibre.site_property.footer.cookieLabel','Cookies management'),('themecitelibre.site_property.footer.about','Lutece is made for cities, by cities, upon open source principals.'),('captcha.defaultProvider','JCaptcha'),('core.crypto.key','0edadd4933ca32122952069a6c714a92e0897228bb5e89bb8db16cad7b61a09e'),('themecitelibre.site_property.bannerMessage.Type','info'),('themecitelibre.site_property.bannerMessage.Title',''),('core.plugins.status.themecitelibre.installed','true'),('themecitelibre.site_property.bannerMessage.Position','bottom-right'),('themecitelibre.site_property.bannerMessage.htmlblock',''),('themecitelibre.site_property.bannerMessage.CloseButton.checkbox','1'),('themecitelibre.site_property.bannerMessage.Duration','5000'),('adminavatar.site_property.avatarserver.Url',''),('core.cache.status.EntryTypeServiceManagerCache.enabled','1'),('limitconnectedusers.site_property.limit_message.textblock','<div class=\'alert alert-danger\'>Le nombre maximal d\'utilisateur connectÃ© simultanÃ©ment a Ã©tÃ© atteint</div>'),('limitconnectedusers.site_property.limit_notification_mailing_list.textblock',''),('limitconnectedusers.site_property.limit_notification_message.textblock','Le nombre maximal d\'utilisateur connectÃ© simultanÃ©ment a Ã©tÃ© atteint'),('limitconnectedusers.site_property.limit_notification_sender_name','LUTECE'),('limitconnectedusers.site_property.limit_notification_subject.textblock','Le nombre maximal d\'utilisateur connectÃ© simultanÃ©ment a Ã©tÃ© atteint'),('mylutece.security.public_url.mylutece.url.login.page','jsp/site/Portal.jsp?page=mylutece&action=login'),('mylutece.security.public_url.mylutece.url.doLogin','jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),('mylutece.security.public_url.mylutece.url.doLogout','jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),('mylutece.security.public_url.mylutece.url.createAccount.page','jsp/site/Portal.jsp?page=mylutece&action=createAccount'),('mylutece.security.public_url.mylutece.url.modifyAccount.page','jsp/site/Portal.jsp?page=mylutece&action=modifyAccount'),('mylutece.security.public_url.mylutece.url.lostPassword.page','jsp/site/Portal.jsp?page=mylutece&action=lostPassword'),('mylutece.security.public_url.mylutece.url.lostLogin.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),('mylutece.security.public_url.mylutece.url.doActionsAll','jsp/site/plugins/mylutece/Do*'),('mylutece-database_banned_domain_names','yopmail.com'),('mylutece.security.public_url.mylutece-database.url.login.page','jsp/site/Portal.jsp?page=mylutece&action=login'),('mylutece.security.public_url.mylutece-database.url.doLogin','jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),('mylutece.security.public_url.mylutece-database.url.doLogout','jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),('mylutece.security.public_url.mylutece-database.url.createAccount.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=createAccount'),('mylutece.security.public_url.mylutece-database.url.lostPassword.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=lostPassword'),('mylutece.security.public_url.mylutece-database.url.lostLogin.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),('mylutece.security.public_url.mylutece-database.url.reinitPassword.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=reinitPassword'),('mylutece.security.public_url.mylutece-database.url.doActionsAll','jsp/site/plugins/mylutece/modules/database/Do*'),('seo.rewrite.config.lastUpdate','DerniÃ¨re mise Ã  jour du fichier de configuration : 17 fÃ©vr. 2022 Ã  11:23:24 Nombre d\'url : 8 Resultat : OK'),('seo.config.uptodate','true'),('seo.generator.option.addPath','false'),('seo.generator.option.addHtmlSuffix','true'),('seo.replaceUrl.enabled','false'),('seo.generator.daemon.enabled','false'),('seo.canonicalUrls.enabled','false'),('seo.sitmap.daemon.enabled','true'),('seo.sitemap.update.log','DerniÃ¨re gÃ©nÃ©ration : 22 fÃ©vr. 2022 Ã  17:32:50 Nombre d\'url : 5 Resultat : OK'),('core.cache.status.PortalMenuService.enabled','0'),('core.cache.status.PortletCacheService.enabled','0'),('core.cache.status.StaticFilesCachingFilter.timeToLiveSeconds','604800'),('core.cache.status.MyPortalWidgetContentService.enabled','1'),('core.cache.status.PageCachingFilter.enabled','0'),('core.cache.status.MailAttachmentCacheService.timeToLiveSeconds','7200'),('core.cache.status.MailAttachmentCacheService.overflowToDisk','true'),('core.cache.status.MailAttachmentCacheService.maxElementsInMemory','10'),('core.cache.status.MailAttachmentCacheService.enabled','1'),('core.cache.status.BaseUserPreferencesCacheService.enabled','0'),('core.cache.status.MailAttachmentCacheService.diskPersistent','true'),('core.cache.status.StaticFilesCachingFilter.enabled','0'),('core.cache.status.LinksIncludeCacheService.enabled','0'),('core.cache.status.MyPortalWidgetService.enabled','1'),('core.cache.status.LuteceUserCacheService.maxElementsInMemory','1000'),('core.cache.status.LuteceUserCacheService.enabled','1'),('core.cache.status.pathCacheService.enabled','0'),('core.cache.status.BaseUserPreferencesCacheService.maxElementsInMemory','1000'),('core.cache.status.SiteMapService.enabled','1'),('core.cache.status.PageCacheService.enabled','0'),('forms.display.form.columnTitle','true'),('forms.display.form.csv.separator',';'),('core.plugins.status.core_extensions.installed','true'),('core.plugins.status.lucene.installed','true'),('core.daemon.indexer.interval','300'),('core.daemon.indexer.onStartUp','true'),('core.daemon.mailSender.interval','86400'),('core.daemon.mailSender.onStartUp','true'),('core.daemon.anonymizationDaemon.interval','86400'),('core.daemon.anonymizationDaemon.onStartUp','false'),('core.daemon.accountLifeTimeDaemon.interval','86400'),('core.daemon.accountLifeTimeDaemon.onStartUp','true'),('core.daemon.threadLauncherDaemon.interval','86400'),('core.daemon.threadLauncherDaemon.onStartUp','true'),('core.daemon.archiveIndexer.interval','360'),('core.daemon.archiveIndexer.onStartUp','true'),('core.daemon.fullIndexingDaemon.interval','86400'),('core.daemon.fullIndexingDaemon.onStartUp','true'),('core.daemon.incrementalIndexingDaemon.interval','3000'),('core.daemon.incrementalIndexingDaemon.onStartUp','true'),('core.daemon.temporaryfilesDaemon.interval','86400'),('core.daemon.temporaryfilesDaemon.onStartUp','false'),('core.cache.status.JasperService.enabled','0'),('core.daemon.jasperPurgeImage.interval','10'),('core.daemon.jasperPurgeImage.onStartUp','false'),('matomo.site_property.site.id','0'),('matomo.site_property.server.http.url',''),('matomo.site_property.server.https.url',''),('matomo.site_property.widget.auth.token',''),('core.daemon.databaseAnonymizationDaemon.interval','86400'),('core.daemon.databaseAnonymizationDaemon.onStartUp','true'),('core.daemon.databaseAccountLifeTimeDaemon.interval','86400'),('core.daemon.databaseAccountLifeTimeDaemon.onStartUp','true'),('core.daemon.seoFriendlyUrlGenerator.interval','3600'),('core.daemon.seoFriendlyUrlGenerator.onStartUp','true'),('core.daemon.seoSitemapGenerator.interval','3600'),('core.daemon.seoSitemapGenerator.onStartUp','true'),('core.daemon.alert.interval','43200'),('core.daemon.alert.onStartUp','true'),('core.daemon.alertCleaner.interval','43200'),('core.daemon.alertCleaner.onStartUp','true'),('core.daemon.automaticActionDaemon.interval','14400'),('core.daemon.automaticActionDaemon.onStartUp','true'),('core.daemon.archiveDaemon.interval','86400'),('core.daemon.archiveDaemon.onStartUp','false'),('core.daemon.chooseStateActionDaemon.interval','10'),('core.daemon.chooseStateActionDaemon.onStartUp','false'),('core.daemon.changeStateDaemon.interval','10'),('core.daemon.changeStateDaemon.onStartUp','false'),('core.templates.currentCommonsInclude','Boostrap5Tabler'),('core.startup.time','22 fÃ©vr. 2022 Ã  17:32:48'),('core.cache.status.DatastoreCacheService.enabled','0'),('core.cache.status.XMLTransformerCacheService(XSLT).enabled','1'),('themecitelibre.site_property.banner.image','images/header-software-app.png'),('themecitelibre.site_property.footer.links','[{\"Our wiki\",\"https://lutece.paris.fr/support/wiki/home.html\"},{\"Read our Terms & Conditions\",\"https://lutece.paris.fr/support/wiki/home.html\"},]'),('themecitelibre.site_property.robotIndex.checkbox','1'),('core.plugins.status.archive.installed','true'),('core.plugins.status.archive.pool','portal'),('core.plugins.status.archive-client.installed','true'),('core.plugins.status.asynchronous-upload.installed','true'),('core.plugins.status.asynchronous-upload.pool','portal'),('core.plugins.status.avatar.installed','true'),('core.plugins.status.blobstore.installed','true'),('core.plugins.status.blobstore.pool','portal'),('core.plugins.status.blobstoreclient.installed','true'),('core.plugins.status.captcha.installed','true'),('core.plugins.status.contact.installed','true'),('core.plugins.status.contact.pool','portal'),('core.plugins.status.filegenerator.installed','true'),('core.plugins.status.filegenerator.pool','portal'),('core.plugins.status.forms.installed','true'),('core.plugins.status.forms.pool','portal'),('core.plugins.status.forms-breadcrumbaccordion.installed','true'),('core.plugins.status.forms-breadcrumbaccordion.pool','portal'),('core.plugins.status.forms-documentproducer.installed','true'),('core.plugins.status.forms-documentproducer.pool','portal'),('core.plugins.status.forms-template.installed','true'),('core.plugins.status.forms-template.pool','portal'),('core.plugins.status.forms-unittree.installed','true'),('core.plugins.status.forms-unittree.pool','portal'),('core.plugins.status.forms-userassignment.installed','true'),('core.plugins.status.forms-userassignment.pool','portal'),('core.plugins.status.genericattributes.installed','true'),('core.plugins.status.genericattributes.pool','portal'),('core.plugins.status.genericattributes-address.installed','false'),('core.plugins.status.adminavatar.installed','true'),('core.plugins.status.genericattributes-openstreetmap.installed','true'),('core.plugins.status.html.installed','true'),('core.plugins.status.htmlpage.installed','true'),('core.plugins.status.htmlpage.pool','portal'),('core.plugins.status.jasper.installed','false'),('core.plugins.status.jasper.pool','portal'),('core.plugins.status.jcaptcha.installed','false'),('core.plugins.status.mermaidjs.installed','true'),('core.plugins.status.mermaidjs.pool','portal'),('core.plugins.status.mylutece.installed','true'),('core.plugins.status.mylutece.pool','portal'),('core.plugins.status.mylutece-database.installed','true'),('core.plugins.status.mylutece-database.pool','portal'),('core.plugins.status.poll.installed','true'),('core.plugins.status.poll.pool','portal'),('core.plugins.status.profiles.installed','true'),('core.plugins.status.profiles.pool','portal'),('core.plugins.status.referencelist.installed','true'),('core.plugins.status.referencelist.pool','portal'),('core.plugins.status.regularexpression.installed','true'),('core.plugins.status.regularexpression.pool','portal'),('core.plugins.status.rest.installed','true'),('core.plugins.status.seo.installed','true'),('core.plugins.status.seo.pool','portal'),('core.plugins.status.systeminfo.installed','true'),('core.plugins.status.theme_citelibre.installed','true'),('core.plugins.status.unittree.installed','true'),('core.plugins.status.unittree.pool','portal'),('core.plugins.status.unittreeuserassignment.installed','true'),('core.plugins.status.unittreeuserassignment.pool','portal'),('core.plugins.status.userassignment.installed','true'),('core.plugins.status.userassignment.pool','portal'),('core.plugins.status.workflow.installed','true'),('core.plugins.status.workflow.pool','portal'),('core.plugins.status.workflow-alertforms.installed','true'),('core.plugins.status.workflow-alertforms.pool','portal'),('core.plugins.status.workflow-forms.installed','true'),('core.plugins.status.workflow-forms.pool','portal'),('core.plugins.status.workflow-formsautomaticassignment.installed','true'),('core.plugins.status.workflow-formsautomaticassignment.pool','portal'),('core.plugins.status.workflow-formsjasper.installed','false'),('core.plugins.status.workflow-formsjasper.pool','portal'),('core.plugins.status.workflow-formspdf.installed','true'),('core.plugins.status.workflow-formspdf.pool','portal'),('core.plugins.status.workflow-rest.installed','true'),('core.plugins.status.workflow-unittree.installed','true'),('core.plugins.status.workflow-unittree.pool','portal'),('core.plugins.status.workflow-userassignment.installed','true'),('core.plugins.status.workflow-userassignment.pool','portal'),('core.cache.status.PageCachingFilter(CAUTION:NEVERUSEWITHUSERDYNAMICDATA).enabled','0'),('core.cache.status.SEOFriendlyUrlCacheService.enabled','0'),('core.cache.status.asynchronousupload.asynchronousUploadCacheService.enabled','0');
/*!40000 ALTER TABLE `core_datastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_feature_group`
--

DROP TABLE IF EXISTS `core_feature_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_feature_group` (
  `id_feature_group` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `feature_group_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `feature_group_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `feature_group_order` int DEFAULT NULL,
  PRIMARY KEY (`id_feature_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_feature_group`
--

LOCK TABLES `core_feature_group` WRITE;
/*!40000 ALTER TABLE `core_feature_group` DISABLE KEYS */;
INSERT INTO `core_feature_group` VALUES ('CONTENT','portal.features.group.content.description','portal.features.group.content.label',1),('APPLICATIONS','portal.features.group.applications.description','portal.features.group.applications.label',3),('SYSTEM','portal.features.group.system.description','portal.features.group.system.label',7),('SITE','portal.features.group.site.description','portal.features.group.site.label',2),('STYLE','portal.features.group.charter.description','portal.features.group.charter.label',6),('USERS','portal.features.group.users.description','portal.features.group.users.label',4),('MANAGERS','portal.features.group.managers.description','portal.features.group.managers.label',5);
/*!40000 ALTER TABLE `core_feature_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_file`
--

DROP TABLE IF EXISTS `core_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_file` (
  `id_file` int NOT NULL AUTO_INCREMENT,
  `title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `id_physical_file` int DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_file`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_file`
--

LOCK TABLES `core_file` WRITE;
/*!40000 ALTER TABLE `core_file` DISABLE KEYS */;
INSERT INTO `core_file` VALUES (125,'export_users_csv.xml',125,2523,'application/xml','2005-10-10 08:10:10'),(126,'export_users_xml.xml',126,259,'application/xml','2005-10-10 08:10:10'),(127,'export_users_csv.xml',127,1861,'application/xml',NULL),(128,'export_users_xml.xml',128,259,'application/xml',NULL),(129,'users.csv',129,12597,'text/csv','2022-02-21 15:36:05'),(130,'Flex_et__Calcul.ods',130,18373,'application/vnd.oasis.opendocument.spreadsheet','2022-02-21 15:36:05');
/*!40000 ALTER TABLE `core_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_id_generator`
--

DROP TABLE IF EXISTS `core_id_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_id_generator` (
  `class_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `current_value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_id_generator`
--

LOCK TABLES `core_id_generator` WRITE;
/*!40000 ALTER TABLE `core_id_generator` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_id_generator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_indexer_action`
--

DROP TABLE IF EXISTS `core_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_indexer_action` (
  `id_action` int NOT NULL AUTO_INCREMENT,
  `id_document` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_task` int NOT NULL DEFAULT '0',
  `indexer_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_portlet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_indexer_action`
--

LOCK TABLES `core_indexer_action` WRITE;
/*!40000 ALTER TABLE `core_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_level_right`
--

DROP TABLE IF EXISTS `core_level_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_level_right` (
  `id_level` smallint NOT NULL DEFAULT '0',
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_level_right`
--

LOCK TABLES `core_level_right` WRITE;
/*!40000 ALTER TABLE `core_level_right` DISABLE KEYS */;
INSERT INTO `core_level_right` VALUES (0,'Level 0 - Technical administrator'),(1,'Level 1 - Fonctionnal administrator'),(2,'Level 2 - Site Manager - Webmaster'),(3,'Level 3 - Contributor');
/*!40000 ALTER TABLE `core_level_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mail_item`
--

DROP TABLE IF EXISTS `core_mail_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_mail_item` (
  `id_mail_queue` int NOT NULL DEFAULT '0',
  `mail_item` mediumblob,
  PRIMARY KEY (`id_mail_queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mail_item`
--

LOCK TABLES `core_mail_item` WRITE;
/*!40000 ALTER TABLE `core_mail_item` DISABLE KEYS */;
INSERT INTO `core_mail_item` VALUES (1,_binary '¬\í\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt\ã<strong>Message provenant de : </strong><br/>\r\n&nbsp;&nbsp;<strong>Nom</strong> :&nbsp;ClÃ©mence <br/>\r\n&nbsp;&nbsp;<strong>PrÃ©nom</strong> :&nbsp;HOHL <br/>\r\n&nbsp;&nbsp;<strong>Adresse</strong> :&nbsp;5 Rue Duc <br/>\r\n&nbsp;&nbsp;<strong>E-mail</strong> :&nbsp;clemence.hohl@gmail.com  <br/><br/>\r\n<strong>Date :</strong>&nbsp;18/02/2022<br/>\r\n<strong>Destinataire : </strong>&nbsp;Contact 2 <br/><br/>\r\n<hr/>\r\n<strong>Message : </strong><br/><br/>\r\nazeazeazeazeaze aezaze aze eazppt\0&adresse_email_du_contact_2@domaine.comt\0clemence.hohl@gmail.comt\0	ClÃ©mencet\0arazr'),(2,_binary '¬\í\0sr\0,fr.paris.lutece.portal.service.mail.MailItem\0\0\0\0\0\0\0\0\rZ\0\r_bCreateEventZ\0_bUniqueRecipientToI\0_nFormatL\0_listFilesAttachementt\0Ljava/util/List;L\0_listUrlsAttachementq\0~\0L\0_strCalendarMessaget\0Ljava/lang/String;L\0_strMessageq\0~\0L\0_strRecipientsBccq\0~\0L\0_strRecipientsCcq\0~\0L\0_strRecipientsToq\0~\0L\0_strSenderEmailq\0~\0L\0_strSenderNameq\0~\0L\0_strSubjectq\0~\0xp\0\0\0\0\0\0pppt\Ô<strong>Message provenant de : </strong><br/>\r\n&nbsp;&nbsp;<strong>Nom</strong> :&nbsp;ClÃ©mence <br/>\r\n&nbsp;&nbsp;<strong>PrÃ©nom</strong> :&nbsp;HOHL <br/>\r\n&nbsp;&nbsp;<strong>Adresse</strong> :&nbsp;5 Rue Duc <br/>\r\n&nbsp;&nbsp;<strong>E-mail</strong> :&nbsp;clemence.hohl@gmail.com  <br/><br/>\r\n<strong>Date :</strong>&nbsp;18/02/2022<br/>\r\n<strong>Destinataire : </strong>&nbsp;Contact 2 <br/><br/>\r\n<hr/>\r\n<strong>Message : </strong><br/><br/>\r\nda zdaz dazdazdppt\0&adresse_email_du_contact_2@domaine.comt\0clemence.hohl@gmail.comt\0	ClÃ©mencet\0arazr');
/*!40000 ALTER TABLE `core_mail_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mail_queue`
--

DROP TABLE IF EXISTS `core_mail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_mail_queue` (
  `id_mail_queue` int NOT NULL AUTO_INCREMENT,
  `is_locked` smallint DEFAULT '0',
  PRIMARY KEY (`id_mail_queue`),
  KEY `is_locked_core_mail_queue` (`is_locked`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mail_queue`
--

LOCK TABLES `core_mail_queue` WRITE;
/*!40000 ALTER TABLE `core_mail_queue` DISABLE KEYS */;
INSERT INTO `core_mail_queue` VALUES (1,0),(2,0);
/*!40000 ALTER TABLE `core_mail_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_mode`
--

DROP TABLE IF EXISTS `core_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_mode` (
  `id_mode` int NOT NULL DEFAULT '0',
  `description_mode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `path` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `output_xsl_method` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_version` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_media_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_encoding` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_indent` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_omit_xml_dec` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `output_xsl_standalone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_mode`
--

LOCK TABLES `core_mode` WRITE;
/*!40000 ALTER TABLE `core_mode` DISABLE KEYS */;
INSERT INTO `core_mode` VALUES (0,'Normal','normal/','xml','1.0','text/xml','UTF-8','yes','yes',NULL),(1,'Administration','admin/','xml','1.0','text/xml','UTF-8','yes','yes',NULL),(2,'Wap','wml/','xml','1.0','text/xml','UTF-8','yes','yes',NULL);
/*!40000 ALTER TABLE `core_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_page`
--

DROP TABLE IF EXISTS `core_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_page` (
  `id_page` int NOT NULL AUTO_INCREMENT,
  `id_parent` int DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint DEFAULT NULL,
  `page_order` int DEFAULT '0',
  `id_template` int DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code_theme` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `node_status` smallint NOT NULL DEFAULT '1',
  `image_content` mediumblob,
  `mime_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'NULL',
  `meta_keywords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_authorization_node` int DEFAULT NULL,
  `display_date_update` smallint NOT NULL DEFAULT '0',
  `is_manual_date_update` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_page`),
  KEY `index_page` (`id_template`,`id_parent`),
  KEY `index_childpage` (`id_parent`,`page_order`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_page`
--

LOCK TABLES `core_page` WRITE;
/*!40000 ALTER TABLE `core_page` DISABLE KEYS */;
INSERT INTO `core_page` VALUES (1,0,'Home','Home Page','2014-06-08 15:20:44',1,1,4,'2003-09-08 22:38:01','none','default',0,'','application/octet-stream',NULL,NULL,1,0,0),(2,1,'INFO','Page d\'information','2022-02-17 13:49:38',0,1,4,'2014-06-08 16:23:42','none','default',1,NULL,'application/octet-stream',NULL,NULL,1,0,0);
/*!40000 ALTER TABLE `core_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_page_template`
--

DROP TABLE IF EXISTS `core_page_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_page_template` (
  `id_template` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `picture` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_template`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_page_template`
--

LOCK TABLES `core_page_template` WRITE;
/*!40000 ALTER TABLE `core_page_template` DISABLE KEYS */;
INSERT INTO `core_page_template` VALUES (1,'One column','skin/site/page_template1.html','page_template1.gif'),(2,'Two columns','skin/site/page_template2.html','page_template2.gif'),(3,'Three columns','skin/site/page_template3.html','page_template3.gif'),(4,'1 + 2 columns','skin/site/page_template4.html','page_template4.gif'),(5,'Two equal columns','skin/site/page_template5.html','page_template5.gif'),(6,'Three unequal columns','skin/site/page_template6.html','page_template6.gif');
/*!40000 ALTER TABLE `core_page_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_physical_file`
--

DROP TABLE IF EXISTS `core_physical_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_physical_file` (
  `id_physical_file` int NOT NULL AUTO_INCREMENT,
  `file_value` mediumblob,
  PRIMARY KEY (`id_physical_file`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_physical_file`
--

LOCK TABLES `core_physical_file` WRITE;
/*!40000 ALTER TABLE `core_physical_file` DISABLE KEYS */;
INSERT INTO `core_physical_file` VALUES (125,_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:output method=\"text\"/>\r\n	\r\n	<xsl:template match=\"users\">\r\n		<xsl:apply-templates select=\"user\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"user\">\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:value-of select=\"access_code\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"last_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"first_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"email\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"status\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"locale\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"level\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"must_change_password\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"accessibility_mode\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"password_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"account_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"date_last_login\" />\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:apply-templates select=\"roles\" />\r\n		<xsl:apply-templates select=\"rights\" />\r\n		<xsl:apply-templates select=\"workgroups\" />\r\n		<xsl:apply-templates select=\"attributes\" />\r\n		<xsl:text>&#10;</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"roles\">\r\n		<xsl:apply-templates select=\"role\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"role\">\r\n		<xsl:text>;\"role:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"rights\">\r\n		<xsl:apply-templates select=\"right\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"right\">\r\n		<xsl:text>;\"right:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"workgroups\">\r\n		<xsl:apply-templates select=\"workgroup\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"workgroup\">\r\n		<xsl:text>;\"workgroup:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attributes\">\r\n		<xsl:apply-templates select=\"attribute\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attribute\">\r\n		<xsl:text>;\"</xsl:text>\r\n		<xsl:value-of select=\"attribute-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-field-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-value\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n</xsl:stylesheet>'),(126,_binary '<?xml version=\"1.0\" ?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:template match=\"/ | @* | node()\">\r\n		<xsl:copy>\r\n			<xsl:apply-templates select=\"@* | node()\" />\r\n		</xsl:copy>\r\n	</xsl:template>\r\n</xsl:stylesheet>'),(127,_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:output method=\"text\"/>\r\n	\r\n	<xsl:template match=\"users\">\r\n		<xsl:apply-templates select=\"user\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"user\">\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:value-of select=\"access_code\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"last_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"first_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"email\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"status\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"password_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"account_max_valid_date\" />\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:apply-templates select=\"roles\" />\r\n		<xsl:apply-templates select=\"groups\" />\r\n		<xsl:apply-templates select=\"attributes\" />\r\n		<xsl:text>&#10;</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"roles\">\r\n		<xsl:apply-templates select=\"role\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"role\">\r\n		<xsl:text>;\"role:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"groups\">\r\n		<xsl:apply-templates select=\"group\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"group\">\r\n		<xsl:text>;\"group:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attributes\">\r\n		<xsl:apply-templates select=\"attribute\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attribute\">\r\n		<xsl:text>;\"</xsl:text>\r\n		<xsl:value-of select=\"attribute-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-field-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-value\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n</xsl:stylesheet>'),(128,_binary '<?xml version=\"1.0\" ?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:template match=\"/ | @* | node()\">\r\n		<xsl:copy>\r\n			<xsl:apply-templates select=\"@* | node()\" />\r\n		</xsl:copy>\r\n	</xsl:template>\r\n</xsl:stylesheet>'),(129,_binary '\"admin4\";\"Admin\";\"admin\";\"admin4@lutece.fr\";\"0\";\"fr\";\"0\";\"false\";\"false\";\"\";\"12/7/22 8:23 AM\";\"12/7/21 8:23 AM\";\"role:forms_multiview\";\"role:assign_groups\";\"role:extend_action_button_manager\";\"role:newsletter_manager\";\"role:profiles_views_manager\";\"role:role_daemon_mail_recipient\";\"role:mylutece_manager\";\"role:view_spaces_all\";\"role:extend_manager\";\"role:extend_opengraph_manager\";\"role:manage_spaces\";\"role:workflow_manager\";\"role:all_site_manager\";\"role:content_publisher\";\"role:forms_manager\";\"role:assign_roles\";\"role:content_validator\";\"role:profiles_manager\";\"role:theme_manager\";\"role:myportal_manager\";\"role:super_admin\";\"role:content_contributor\";\"role:CREATE_REFERENCE_IMPORT\";\"role:mylutece_database_manager\";\"right:CORE_LINK_SERVICE_MANAGEMENT\";\"right:CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT\";\"right:CONTACT_MANAGEMENT\";\"right:SEO_MANAGEMENT\";\"right:SYSTEMINFO_MANAGEMENT\";\"right:CORE_LOGS_VISUALISATION\";\"right:CORE_PROPERTIES_MANAGEMENT\";\"right:CORE_LEVEL_RIGHT_MANAGEMENT\";\"right:CORE_PAGE_TEMPLATE_MANAGEMENT\";\"right:CORE_STYLESHEET_MANAGEMENT\";\"right:EXTEND_STATISTICS\";\"right:CORE_EDITORS_MANAGEMENT\";\"right:SEARCH_STATS_MANAGEMENT\";\"right:PROFILES_MANAGEMENT\";\"right:CORE_MAILINGLISTS_MANAGEMENT\";\"right:CORE_PLUGINS_MANAGEMENT\";\"right:TAGCLOUD_MANAGEMENT\";\"right:NEWSLETTER_MANAGEMENT\";\"right:HTMLPAGE_MANAGEMENT\";\"right:CORE_ADMIN_SITE\";\"right:CORE_STYLES_MANAGEMENT\";\"right:REFERENCELIST_MANAGEMENT\";\"right:MYPORTAL_WIDGET_MANAGEMENT\";\"right:MANAGE_ACTION_BUTTONS\";\"right:DOCUMENT_RULES_MANAGEMENT\";\"right:NEWSLETTER_TEMPLATE_MANAGEMENT\";\"right:THEME_MANAGEMENT\";\"right:DATABASE_MANAGEMENT_USERS\";\"right:ENTRY_TYPE_MANAGEMENT\";\"right:CORE_XSL_EXPORT_MANAGEMENT\";\"right:CORE_WORKGROUPS_MANAGEMENT\";\"right:CORE_ADMINDASHBOARD_MANAGEMENT\";\"right:DOCUMENT_MANAGEMENT\";\"right:CORE_USERS_MANAGEMENT\";\"right:LIBRARY_MANAGEMENT\";\"right:PROFILES_VIEWS_MANAGEMENT\";\"right:CORE_ROLES_MANAGEMENT\";\"right:CORE_SEARCH_INDEXATION\";\"right:MYLUTECE_MANAGEMENT\";\"right:CORE_RIGHT_MANAGEMENT\";\"right:DATABASE_GROUPS_MANAGEMENT\";\"right:MANAGE_OPENGRAPH_SOCIALHUB\";\"right:MYLUTECE_MANAGE_AUTHENTICATION_FILTER\";\"right:CORE_DASHBOARD_MANAGEMENT\";\"right:MYPORTAL_RSS_MANAGEMENT\";\"right:CORE_SEARCH_MANAGEMENT\";\"right:CORE_FEATURES_MANAGEMENT\";\"right:CORE_DAEMONS_MANAGEMENT\";\"right:CORE_CACHE_MANAGEMENT\";\"right:DOCUMENT_TYPES_MANAGEMENT\";\"right:WORKFLOW_MANAGEMENT\";\"right:EXTEND_VOTE_TYPES_MANAGEMENT\";\"right:CORE_RBAC_MANAGEMENT\";\"right:DOCUMENT_CATEGORY_MANAGEMENT\";\"right:MYPORTAL_DEFAULT_PAGE_BUILDER\";\"right:RESOURCE_EXTENDER_MANAGEMENT\"\n\"lutece4\";\"Lutece\";\"lutece\";\"lutece4@lutece.fr\";\"0\";\"fr\";\"1\";\"false\";\"false\";\"\";\"\";\"\";\"role:assign_groups\";\"role:extend_action_button_manager\";\"role:newsletter_manager\";\"role:view_spaces_all\";\"role:extend_manager\";\"role:extend_opengraph_manager\";\"role:manage_spaces\";\"role:workflow_manager\";\"role:all_site_manager\";\"role:content_publisher\";\"role:forms_manager\";\"role:assign_roles\";\"role:content_validator\";\"role:myportal_manager\";\"role:super_admin\";\"role:content_contributor\";\"right:CORE_WORKGROUPS_MANAGEMENT\";\"right:DOCUMENT_MANAGEMENT\";\"right:CORE_LINK_SERVICE_MANAGEMENT\";\"right:CORE_USERS_MANAGEMENT\";\"right:CONTACT_MANAGEMENT\";\"right:CORE_ROLES_MANAGEMENT\";\"right:CORE_PROPERTIES_MANAGEMENT\";\"right:CORE_PAGE_TEMPLATE_MANAGEMENT\";\"right:CORE_SEARCH_INDEXATION\";\"right:EXTEND_STATISTICS\";\"right:MANAGE_OPENGRAPH_SOCIALHUB\";\"right:RSS_FEEDS_MANAGEMENT\";\"right:TAGCLOUD_MANAGEMENT\";\"right:CORE_SEARCH_MANAGEMENT\";\"right:RSS_MANAGEMENT\";\"right:NEWSLETTER_MANAGEMENT\";\"right:HTMLPAGE_MANAGEMENT\";\"right:CORE_ADMIN_SITE\";\"right:MYPORTAL_WIDGET_MANAGEMENT\";\"right:MANAGE_ACTION_BUTTONS\";\"right:WORKFLOW_MANAGEMENT\";\"right:DOCUMENT_RULES_MANAGEMENT\";\"right:EXTEND_VOTE_TYPES_MANAGEMENT\";\"right:MYPORTAL_DEFAULT_PAGE_BUILDER\";\"right:RESOURCE_EXTENDER_MANAGEMENT\"\n\"redac4\";\"redac\";\"redac\";\"redac4@lutece.fr\";\"0\";\"fr\";\"2\";\"false\";\"false\";\"\";\"\";\"\";\"role:assign_groups\";\"role:assign_roles\";\"role:view_space_work\";\"role:content_contributor\";\"right:DOCUMENT_MANAGEMENT\";\"right:HTMLPAGE_MANAGEMENT\"\n\"valid4\";\"valid\";\"valid\";\"valid4@lutece.fr\";\"0\";\"fr\";\"3\";\"false\";\"false\";\"\";\"\";\"\";\"role:content_validator\";\"role:view_space_validation\";\"right:DOCUMENT_MANAGEMENT\"\n\"admin3\";\"Admin\";\"admin\";\"admin2@lutece.fr\";\"0\";\"fr\";\"0\";\"false\";\"false\";\"\";\"12/7/22 8:23 AM\";\"12/7/21 8:23 AM\";\"role:forms_multiview\";\"role:assign_groups\";\"role:extend_action_button_manager\";\"role:newsletter_manager\";\"role:profiles_views_manager\";\"role:role_daemon_mail_recipient\";\"role:mylutece_manager\";\"role:view_spaces_all\";\"role:extend_manager\";\"role:extend_opengraph_manager\";\"role:manage_spaces\";\"role:workflow_manager\";\"role:all_site_manager\";\"role:content_publisher\";\"role:forms_manager\";\"role:assign_roles\";\"role:content_validator\";\"role:profiles_manager\";\"role:theme_manager\";\"role:myportal_manager\";\"role:super_admin\";\"role:content_contributor\";\"role:CREATE_REFERENCE_IMPORT\";\"role:mylutece_database_manager\";\"right:CORE_LINK_SERVICE_MANAGEMENT\";\"right:CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT\";\"right:CONTACT_MANAGEMENT\";\"right:SEO_MANAGEMENT\";\"right:SYSTEMINFO_MANAGEMENT\";\"right:CORE_LOGS_VISUALISATION\";\"right:CORE_PROPERTIES_MANAGEMENT\";\"right:CORE_LEVEL_RIGHT_MANAGEMENT\";\"right:CORE_PAGE_TEMPLATE_MANAGEMENT\";\"right:CORE_STYLESHEET_MANAGEMENT\";\"right:EXTEND_STATISTICS\";\"right:CORE_EDITORS_MANAGEMENT\";\"right:SEARCH_STATS_MANAGEMENT\";\"right:PROFILES_MANAGEMENT\";\"right:CORE_MAILINGLISTS_MANAGEMENT\";\"right:CORE_PLUGINS_MANAGEMENT\";\"right:TAGCLOUD_MANAGEMENT\";\"right:NEWSLETTER_MANAGEMENT\";\"right:HTMLPAGE_MANAGEMENT\";\"right:CORE_ADMIN_SITE\";\"right:CORE_STYLES_MANAGEMENT\";\"right:REFERENCELIST_MANAGEMENT\";\"right:MYPORTAL_WIDGET_MANAGEMENT\";\"right:MANAGE_ACTION_BUTTONS\";\"right:DOCUMENT_RULES_MANAGEMENT\";\"right:NEWSLETTER_TEMPLATE_MANAGEMENT\";\"right:THEME_MANAGEMENT\";\"right:DATABASE_MANAGEMENT_USERS\";\"right:ENTRY_TYPE_MANAGEMENT\";\"right:CORE_XSL_EXPORT_MANAGEMENT\";\"right:CORE_WORKGROUPS_MANAGEMENT\";\"right:CORE_ADMINDASHBOARD_MANAGEMENT\";\"right:DOCUMENT_MANAGEMENT\";\"right:CORE_USERS_MANAGEMENT\";\"right:LIBRARY_MANAGEMENT\";\"right:PROFILES_VIEWS_MANAGEMENT\";\"right:CORE_ROLES_MANAGEMENT\";\"right:CORE_SEARCH_INDEXATION\";\"right:MYLUTECE_MANAGEMENT\";\"right:CORE_RIGHT_MANAGEMENT\";\"right:DATABASE_GROUPS_MANAGEMENT\";\"right:MANAGE_OPENGRAPH_SOCIALHUB\";\"right:MYLUTECE_MANAGE_AUTHENTICATION_FILTER\";\"right:CORE_DASHBOARD_MANAGEMENT\";\"right:MYPORTAL_RSS_MANAGEMENT\";\"right:CORE_SEARCH_MANAGEMENT\";\"right:CORE_FEATURES_MANAGEMENT\";\"right:CORE_DAEMONS_MANAGEMENT\";\"right:CORE_CACHE_MANAGEMENT\";\"right:DOCUMENT_TYPES_MANAGEMENT\";\"right:WORKFLOW_MANAGEMENT\";\"right:EXTEND_VOTE_TYPES_MANAGEMENT\";\"right:CORE_RBAC_MANAGEMENT\";\"right:DOCUMENT_CATEGORY_MANAGEMENT\";\"right:MYPORTAL_DEFAULT_PAGE_BUILDER\";\"right:RESOURCE_EXTENDER_MANAGEMENT\"\n\"lutece3\";\"Lutece\";\"lutece\";\"lutece3@lutece.fr\";\"0\";\"fr\";\"1\";\"false\";\"false\";\"\";\"\";\"\";\"role:assign_groups\";\"role:extend_action_button_manager\";\"role:newsletter_manager\";\"role:view_spaces_all\";\"role:extend_manager\";\"role:extend_opengraph_manager\";\"role:manage_spaces\";\"role:workflow_manager\";\"role:all_site_manager\";\"role:content_publisher\";\"role:forms_manager\";\"role:assign_roles\";\"role:content_validator\";\"role:myportal_manager\";\"role:super_admin\";\"role:content_contributor\";\"right:CORE_WORKGROUPS_MANAGEMENT\";\"right:DOCUMENT_MANAGEMENT\";\"right:CORE_LINK_SERVICE_MANAGEMENT\";\"right:CORE_USERS_MANAGEMENT\";\"right:CONTACT_MANAGEMENT\";\"right:CORE_ROLES_MANAGEMENT\";\"right:CORE_PROPERTIES_MANAGEMENT\";\"right:CORE_PAGE_TEMPLATE_MANAGEMENT\";\"right:CORE_SEARCH_INDEXATION\";\"right:EXTEND_STATISTICS\";\"right:MANAGE_OPENGRAPH_SOCIALHUB\";\"right:RSS_FEEDS_MANAGEMENT\";\"right:TAGCLOUD_MANAGEMENT\";\"right:CORE_SEARCH_MANAGEMENT\";\"right:RSS_MANAGEMENT\";\"right:NEWSLETTER_MANAGEMENT\";\"right:HTMLPAGE_MANAGEMENT\";\"right:CORE_ADMIN_SITE\";\"right:MYPORTAL_WIDGET_MANAGEMENT\";\"right:MANAGE_ACTION_BUTTONS\";\"right:WORKFLOW_MANAGEMENT\";\"right:DOCUMENT_RULES_MANAGEMENT\";\"right:EXTEND_VOTE_TYPES_MANAGEMENT\";\"right:MYPORTAL_DEFAULT_PAGE_BUILDER\";\"right:RESOURCE_EXTENDER_MANAGEMENT\"\n\"redac3\";\"redac\";\"redac\";\"redac3@lutece.fr\";\"0\";\"fr\";\"2\";\"false\";\"false\";\"\";\"\";\"\";\"role:assign_groups\";\"role:assign_roles\";\"role:view_space_work\";\"role:content_contributor\";\"right:DOCUMENT_MANAGEMENT\";\"right:HTMLPAGE_MANAGEMENT\"\n\"valid3\";\"valid\";\"valid\";\"valid3@lutece.fr\";\"0\";\"fr\";\"3\";\"false\";\"false\";\"\";\"\";\"\";\"role:content_validator\";\"role:view_space_validation\";\"right:DOCUMENT_MANAGEMENT\"\n\"admin2\";\"Admin\";\"admin\";\"admin2@lutece.fr\";\"0\";\"fr\";\"0\";\"false\";\"false\";\"\";\"12/7/22 8:23 AM\";\"12/7/21 8:23 AM\";\"role:forms_multiview\";\"role:assign_groups\";\"role:extend_action_button_manager\";\"role:newsletter_manager\";\"role:profiles_views_manager\";\"role:role_daemon_mail_recipient\";\"role:mylutece_manager\";\"role:view_spaces_all\";\"role:extend_manager\";\"role:extend_opengraph_manager\";\"role:manage_spaces\";\"role:workflow_manager\";\"role:all_site_manager\";\"role:content_publisher\";\"role:forms_manager\";\"role:assign_roles\";\"role:content_validator\";\"role:profiles_manager\";\"role:theme_manager\";\"role:myportal_manager\";\"role:super_admin\";\"role:content_contributor\";\"role:CREATE_REFERENCE_IMPORT\";\"role:mylutece_database_manager\";\"right:CORE_LINK_SERVICE_MANAGEMENT\";\"right:CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT\";\"right:CONTACT_MANAGEMENT\";\"right:SEO_MANAGEMENT\";\"right:SYSTEMINFO_MANAGEMENT\";\"right:CORE_LOGS_VISUALISATION\";\"right:CORE_PROPERTIES_MANAGEMENT\";\"right:CORE_LEVEL_RIGHT_MANAGEMENT\";\"right:CORE_PAGE_TEMPLATE_MANAGEMENT\";\"right:CORE_STYLESHEET_MANAGEMENT\";\"right:EXTEND_STATISTICS\";\"right:CORE_EDITORS_MANAGEMENT\";\"right:SEARCH_STATS_MANAGEMENT\";\"right:PROFILES_MANAGEMENT\";\"right:CORE_MAILINGLISTS_MANAGEMENT\";\"right:CORE_PLUGINS_MANAGEMENT\";\"right:TAGCLOUD_MANAGEMENT\";\"right:NEWSLETTER_MANAGEMENT\";\"right:HTMLPAGE_MANAGEMENT\";\"right:CORE_ADMIN_SITE\";\"right:CORE_STYLES_MANAGEMENT\";\"right:REFERENCELIST_MANAGEMENT\";\"right:MYPORTAL_WIDGET_MANAGEMENT\";\"right:MANAGE_ACTION_BUTTONS\";\"right:DOCUMENT_RULES_MANAGEMENT\";\"right:NEWSLETTER_TEMPLATE_MANAGEMENT\";\"right:THEME_MANAGEMENT\";\"right:DATABASE_MANAGEMENT_USERS\";\"right:ENTRY_TYPE_MANAGEMENT\";\"right:CORE_XSL_EXPORT_MANAGEMENT\";\"right:CORE_WORKGROUPS_MANAGEMENT\";\"right:CORE_ADMINDASHBOARD_MANAGEMENT\";\"right:DOCUMENT_MANAGEMENT\";\"right:CORE_USERS_MANAGEMENT\";\"right:LIBRARY_MANAGEMENT\";\"right:PROFILES_VIEWS_MANAGEMENT\";\"right:CORE_ROLES_MANAGEMENT\";\"right:CORE_SEARCH_INDEXATION\";\"right:MYLUTECE_MANAGEMENT\";\"right:CORE_RIGHT_MANAGEMENT\";\"right:DATABASE_GROUPS_MANAGEMENT\";\"right:MANAGE_OPENGRAPH_SOCIALHUB\";\"right:MYLUTECE_MANAGE_AUTHENTICATION_FILTER\";\"right:CORE_DASHBOARD_MANAGEMENT\";\"right:MYPORTAL_RSS_MANAGEMENT\";\"right:CORE_SEARCH_MANAGEMENT\";\"right:CORE_FEATURES_MANAGEMENT\";\"right:CORE_DAEMONS_MANAGEMENT\";\"right:CORE_CACHE_MANAGEMENT\";\"right:DOCUMENT_TYPES_MANAGEMENT\";\"right:WORKFLOW_MANAGEMENT\";\"right:EXTEND_VOTE_TYPES_MANAGEMENT\";\"right:CORE_RBAC_MANAGEMENT\";\"right:DOCUMENT_CATEGORY_MANAGEMENT\";\"right:MYPORTAL_DEFAULT_PAGE_BUILDER\";\"right:RESOURCE_EXTENDER_MANAGEMENT\"\n\"lutece2\";\"Lutece\";\"lutece\";\"lutece2@lutece.fr\";\"0\";\"fr\";\"1\";\"false\";\"false\";\"\";\"\";\"\";\"role:assign_groups\";\"role:extend_action_button_manager\";\"role:newsletter_manager\";\"role:view_spaces_all\";\"role:extend_manager\";\"role:extend_opengraph_manager\";\"role:manage_spaces\";\"role:workflow_manager\";\"role:all_site_manager\";\"role:content_publisher\";\"role:forms_manager\";\"role:assign_roles\";\"role:content_validator\";\"role:myportal_manager\";\"role:super_admin\";\"role:content_contributor\";\"right:CORE_WORKGROUPS_MANAGEMENT\";\"right:DOCUMENT_MANAGEMENT\";\"right:CORE_LINK_SERVICE_MANAGEMENT\";\"right:CORE_USERS_MANAGEMENT\";\"right:CONTACT_MANAGEMENT\";\"right:CORE_ROLES_MANAGEMENT\";\"right:CORE_PROPERTIES_MANAGEMENT\";\"right:CORE_PAGE_TEMPLATE_MANAGEMENT\";\"right:CORE_SEARCH_INDEXATION\";\"right:EXTEND_STATISTICS\";\"right:MANAGE_OPENGRAPH_SOCIALHUB\";\"right:RSS_FEEDS_MANAGEMENT\";\"right:TAGCLOUD_MANAGEMENT\";\"right:CORE_SEARCH_MANAGEMENT\";\"right:RSS_MANAGEMENT\";\"right:NEWSLETTER_MANAGEMENT\";\"right:HTMLPAGE_MANAGEMENT\";\"right:CORE_ADMIN_SITE\";\"right:MYPORTAL_WIDGET_MANAGEMENT\";\"right:MANAGE_ACTION_BUTTONS\";\"right:WORKFLOW_MANAGEMENT\";\"right:DOCUMENT_RULES_MANAGEMENT\";\"right:EXTEND_VOTE_TYPES_MANAGEMENT\";\"right:MYPORTAL_DEFAULT_PAGE_BUILDER\";\"right:RESOURCE_EXTENDER_MANAGEMENT\"\n\"redac2\";\"redac\";\"redac\";\"redac2@lutece.fr\";\"0\";\"fr\";\"2\";\"false\";\"false\";\"\";\"\";\"\";\"role:assign_groups\";\"role:assign_roles\";\"role:view_space_work\";\"role:content_contributor\";\"right:DOCUMENT_MANAGEMENT\";\"right:HTMLPAGE_MANAGEMENT\"\n\"valid2\";\"valid\";\"valid\";\"valid2@lutece.fr\";\"0\";\"fr\";\"3\";\"false\";\"false\";\"\";\"\";\"\";\"role:content_validator\";\"role:view_space_validation\";\"right:DOCUMENT_MANAGEMENT\"\n'),(130,_binary 'PK\0\0\0\0]jSl9.\0\0\0.\0\0\0\0\0\0mimetypeapplication/vnd.oasis.opendocument.spreadsheetPK\0\0\0\0]jS¬h\\cG\0\0G\0\0\0\0\0Thumbnails/thumbnail.pngPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0¸\0\0\0ÿ\0\0\0u°\ì!\0\0\0fPLTE###+++333;;;CCCLLLSSSZZZccckkkssszzz£££¬¬¬³³³»»»\Ä\Ä\Ä\Ë\Ë\Ë\Ó\Ó\Ó\Û\Û\Û\ã\ã\ã\ë\ë\ë\ó\ó\óþþþ\0\0\0ÿÿÿi.+U\0\0IDATx\Ú\í]bÚ°²\í²6k\×ÿÿ\å¤Må¾¶\÷F =>\Ë3#YG:´4¾ÿi\à~s\ß3v³yý^`üKF_Zc\á\ó±µ\ì+Èý[x*pAD4\ÂJü¹\õì°zÉ\â[\Ü\Ú\÷¢ú=û\æ×¿¬niÀSE\óymeX[U\ò17:q%;pº\Ì\Î\âF&Dw\à\"ie2.ÜN9(cË|F=;/c!R\õ<R»\Ân´!¨\Êi#ü\ÉÀË±4c\'¥pK¨¸-/\î:\ð\Ö¶\'¹4\'ÕfK:fØ¤\å<²À¹7À62s\\v\Ñ\0\\\Ò6nM£en~º\Æ\Ó\ÉL\ê¢\ñp\Ô\Ê\÷\nZ\ãV\åc­j¾L®\Íª\à\é Ô¶ºgm\Ö\õü¥º\0p\ë9ª)·e\Z\æ\ÉÀK>ey©*3\0x8\Ñ\ó\Z\Ît®\àn$(\éø²Á* jm!S~\êÀG:$*\ÞT9,3\Ê\Ç	Z\ÍRk\áfÏ¹¦J®1\æýtr.­Ä½ª\ö\ã\õl¼`£_K\Ú3|i};\Î\÷Lß¨ÿ\Ôú\íûw8B°qM§\â\Ë}ÿþ\\\ài§)ßµ·.\ß\ó6\Þ\Ü<¶\Òim\nL\"X}&\ðx\Ì%·\æ,	\ÅK[kSµ\Þ\r3.^ª¢Æh]\ÙÖc?#°{­mµ\Ì\öQB5\éc7.j\Û%£\Ñ\Ø9\r\á\ä³FQ<W\ãBy[¤\Õþ¸a\Z\Øv§\r[\"l.N,.«\Æn\"|/­g¶\Ëü`=y¢bp|\öÛ¦¹ÄºW\î\ò\Ý\ÉD\ç=Y\ãnÛF¦°£(±\ê¾\î\ÚiF¨3Ê§´Ai7pù´\ÈE_\\>¼n\óø\Í=AMT\Ðv\ö¥\àO\Í\ÇøT\í\æ\ôz\ê\Zg£;m\Ä¾\õ:9D¸\ZN{G78F\ô1]\÷°\÷¸©o.4¾\Ùe\÷\ö»ÆR#u£\nÖ\ò\ÒL\ö	<SH\Ñ3\Â\0u<1£\r\Ô\ñu|w\å¹e¨ÿU2Ý\Ì*+R\æÍ°½ËºÚ³p\ÕDÌ¼~«\ã\r\â5\Ã|\óp\Ç\Ù4\Ü<ÿs\Ø\Û\'¨*Ì\ß\ÐH\ñ\Ïÿ\ò_À¿ÿþüø\ð/\àÿsÀ\ÂDTÿ9\àx^Wÿ phgU\0\Î\Ç\Ñ\ÅS ¤7;\ÏÓ²´B\ÛyÒ¢·u\Ó_üp<²p#Ç¦\Ïc\ÉÎ¹1\0.Ú¸6\ÄV\Æ\ã\â\ï\ÓxogýAH¨m3a¸É¥\r®\r¦Q\Æ\ÙO\ó\ö\Ïg\Îe\ÍÜ» \ìQM;p6«Á\ÕajÓ©þmÀmWeV-k]£n©\÷T¥\Å\ÒT\êiþ¹¶¿\î\æüY9Û¿ÜªØ&-ý»\Ó©ki\á\êi\éü<Q©¼\Þwqç[û_î­±Iû;d\Û|xQ.\ß\ÓÁ\Ü\ï\Ç3\ç«V\ËË«Rø\È}@-­\Ô\Ö ¹<\ñ\Ôú`·R\áU.¿u\ä\Úiø}\à\ç\\±\òfù\ì\'PEÐ\Ó0ofDK\ÚÀBj\Òrø1\æJ\Ð%¶@g<®l\Æ-£¥J3£ü\ãa=\Ö\écq\'VÝ&q:\æ6\Ùv\Þ\Î\Ô\Õ\Ü~ftÐµeHÑ5´2\ÒÜ¹\ÉBÌ¹_\Ó\ð\÷Í±\"ØªjRß\nÀ! m6ºhtj\î\Ð8§t0z«\Ó\Ù;\æ$\îÀEs#\0\Ï\Ó=$}p|\îGL\Ò9.\Zª\ÊØ«\n\0ªª=D\ÙC{¨ãº¼W½ªlmc\Ù\öØ\×\ZF\ÜNý\Þ\Õ\Ë\ç\ß^\ê\å_¿o\öW«&	º\ßZ%\ï#\"\êe´E\Ê\å9\ÜOÀ\Æy¿·û\í]t^\ô~¾s¹\Ü\ó 7\åÿ\ç3O²\ã,¤\Þk\ÇGr-<+\á\ái¢È¸Ø·+¹ü´4?O·ù+Vù#À\ëp\ÏþsÀ¥`«ÊÛº#Z)I\Ð\õ\à\àk\àè·z\ó%*y·Z±\î\ó\Ô\nGgÁ\ó\ëÀ£o$7s	}[\ÓÍ­[º¦\Ö_A¶\Ähº»-ª\ZZw\0_0®|\ö\'ÀIQ<ùmýªR$kNs0±;\ðf@CQÈª£[£	Z\íf\÷·©D\ÓwiÜ\ÐG8\à­\á2M¦MÓ­:^	Ø\íx\\U+\×Gg\Ë\ôº\á>\Ät\í!V}øaµ&q~¾¸STø2\Æ\ñ\×À­\È\ÄL\ËKi±¢d°iy8 £T´ª¥¬:£·­\n\äk+\\Ê¤­2\'yC\ãF\öø\Þ¸®¢¨¤ªUIÿHUIr\í\ámZ\ãCS\0¬\Ëû9¤\ò\ß0Ô¿K\Ú|\Ï¢ý\Ó\Ò\ô4I*Å\Äg*øùi¢\ÄLÄ\ËÿCÀ¥\â\Õ\Þ\çÕ·\ìn\0¯\Z,½¸(°	\È2`A\Í\æ0HsNL\È+$gwx=H­sJûXq-no\0g\Í$û8=L\É\â\Ïê¨Ð}^\ã\å¤Îº\Ë\ëm7ur]v\ß1\\~4ol&;8\áëª\ä\ÜÊ¥ a^\íYSµ.>>PU¶É\ß\Ë\ÝZd\ä-\ë\ZÇvªH=\Ë\å\ðma-aÔ\ÛY@«kNR¹ ÿy\àl\ò»¼}¼mlfo1\\vÿ¹û|\ðAaª\ãu\à:¤£¶\õ¼ù¢¢?y\Ýf\ð\ÔHi><¯1\í\Ó1ú¨\Z o¨o0\\¯*\Ãy\Ð\\´N\ähh+×\Û\óÀ\Â8 2952\ÏÃ.yY\ògW4Áî¦²SR\çamN~\Ã\ð¿\Ý[ûùµ4þ¤\Äøp\×V/¯\ëi\Æü@ÃµDLxZ\î\Ø&¾¾®\'¦\â?_\Ç¤O¯{_üeÿ\ï\ÙÇ\××Ér\'\ðz\Ç\Éÿ\Øy¸!\\¡lÝ±@E1ª)n\Þ+k(U\äÕ»c\Ç*9\Ú;\Ët\ð\Äc\óµB[¹&\Â\Ö\n~x\É5ø¶B\\1È»z\ä4>Í¡\Ü;(9QOU\é,m\ïÃ©\ÎØ¢\í\áªRû9\ó½Àa\Û\åµ;5 3¾+Ñ·|\ð\ØrM¨W\Ë\"¶\\#~8\éBV\Ó+zÄ\åÛ\ZgB\ðù{O\Ü\÷K~x 6s\íP	{âµWm	yfS¢Æ¡\Þa\ã\ï³*\ZR\ô\áý\ãÉ«À\r\ìR)Å·¨C+\Ö\ÖGG­M¥.²\á¿\Ö\å³t-1\æ\ç\â&&z->-\r\Ï5!ú¿\Ö~¿kýM\ào\äÿ(\ðþÌ½pK_¬þq\0\Ø4JM6`7\ÞK\É3e/=?\ÚRG¦´iÛ¶=ø\Î\Ílû#-\ËR\Ä>`d\ÐfuT\á&\ðM\ÄF\Ó\ÖhK+Ô¬PÍýiLaé¶²\ÆJU½°º?Bh_0\ËbÁ«©~\ï\ØY\õBl\ëªnV\È[­¬],\ä	\ä)\ö¹D\àJ\à\Ä!\ö^Hû¡\óú!\à0PM¹\Z$Y^ep`FJ\ÜkoMûþd£\Ï	Q\Z\ò\Ð\Zs\Ô¨(\".µÄªs5\öûÀ\Ê~\Ý!\0z\\\ã[\Ö6\å^AµÁR\ëY\í£V\é\ð\êY¥uãBù¦\rº>e\Ñs@YºVùO*\Ë:µ$e·V\ÚXLy\é^bûYÜª*\óTYa\öGaF7/\r\È|	\ê\rJ<mMÿM.ÿ?\ÑX\ö?ýqz^»ªp\àÿdüNv\÷sÿýG¡?+\Ç\önnm¨?zIw\÷«p¬\Õ\Ã}b\÷kl±7µ®\à#:\ç\àµ^\õn~Mrd\Þ\â¬\ÊbªQ¥Y\Ø\Ó\Â-YÍA½ûm\n\ñxsp;úu+³jZ\å¾U\ö]|\n8=\ìZ\"\\Xy\Ë4H»i\'ro(B\Ãee¸.\ð\n~<r\ñ~<\Û(\Î\ÏpÏ»H<Ïª£Z7pE,4E8TPQ\ä\Í@CnJ¼?vn\Ùc_>|w4\r\\\rµ\ð²n\äU ] \÷§º%­\ÐnE\Ê\ÅC{mªo\Ùú&\Ö\è\ç j!\à\Åx\Æ;³<\Ó\Æ(\Ç\à\Ô\ÖF*4\'\ðý\Úv\õD»\Ø\ô	\à\\\ëÿ}\Ù\à*®º¡À\Z\ÝÀ\Û;×µ\÷¨\ç\n\âW\'\ò\Øyj\È\ín_¿­*4\æ¹G(\rZ(\rÕ±zAS¡\ë\nj\Ðl\õ^\nWBc\ó\ric/\Ø\ç\ê¸\ä=ZP\\6\rþ}\å\\7&¬È\Å*xwk\éþ¤lJ=F¦J¢\÷\È0_8Wm,{¦D4L6\Ïl_V-¹i\à\ê \âÚ\æA6·©\õ\óÇ´>\æ\Þ\ó\à!=¸ýÿþw¤ø¼\ÌË¯_\óµ\ÂÏ¾\'D\Ä\×Ã«/\àÿ	\à\áw±,\Â\r\à3&\Ó=gc\Å\ï\Ç\ÄÚU[\Í[½4m\ÑWs®@H°¥Ú\è|j`\ìO­¸M¾\êºK&H\n\âD\Ï\Å\î>C£gP\r°µ+;É¥Núû\\L¼\Ø\ÇA\Î\âN\õL¶\î\ëTx\Ä\ì\ì,ûç¢\Å,ùºb\ÆQB59Xár8\ÈÊ¹Ú;\ß\á\ì\Úh\'M\'¹Gw;(_\ãl¡\rJ\çHWÆ\áµa\ÄÕ°_§;4¥Q5±\Ì\ÅX*j\óøh\ñep\ë¢oj¼ª§|Î\ód	\ëR\çÎ\ðCUü\Æ}g\ÐihT©N\Ë\"\Ã\\ú·J\óX[gÑ¶!\ëqnw\å\r\à\ç>\õ\ä\Ø\ÖyLÅ©7f<¯½\ÏKh·±NMÃo«?\É&&{¯9¼N5 \ï©\éCv]hxûSº¤\÷;¦T\ô\á¾\ð\ôý\÷\ô\í\ãý\Ü\äÏ;\è,}\ó#\Ý\ß\ôÝ/E\È\ô\ã\ñ~\Ø\õ\'xI\ÓB¾\\þÞd\Õ\ço|«Ý\ç\ß\0\ÞGNt/BR½x¨|	\ÂQ®Ý®x\È>\ì>$k¶7¾\Ä\å\àû\Ø	Ae\îoÁMn/7Z\Z¾\Òû\Ò\ÃO\Û*L\ä\Í)²\÷»$°u\÷iü|\nGe\0§Gi¶t>§Ày&ý(\Ø27Á\Ö\Ë*\ä£À£tz[[R©\ÆT8Ý¥\ñN§y\åH9\êx\Ò\ò\Z\ð\r©i\r\á\ZúGC\õºR¯vþ©Ç«\Ú\Ö\Ù9A¼\ðSn\'ùW\à8e\Æ¿¼¦ZfXsMK\Í^+v>¤*[\Ï\Æ{¬JZ E{U[j¶V{UÒ°]Þ¾\î[Q8T\ì-\ô	³K¶\ãÿ\n¹\ãÞ¥\å\íóN\Ï5\Î\è \êµ\Ä|}V*\Ë\ÓDU\á\êW¿\Ê.\×\Ë#\×\Ý4­\á6¹£5\ãÚ¶?9­FE:\Ñ>\ÂuË²´þT¨íª\Ö\õ-kÀ\ëA*\r\áúýä¶h8\ËÎ³\ça=9Äµ§hYxyCy0´;\É\Þ76\Ó+¹#\Ü w\ÔYÐ´3\Ï.\í\ÜF\õº\\\é<ÿ%p\Í\Ï\ëgnd]8/iü\áº\ÆAk;¹£»,\è:pf¹¬\Â\Ñ&½4¤a\òQ\æ5\ày®ç´¾b\È6·8l\ä;\ë\Z%w\ì]w;q8T\nV\Ûªs\är§\Ã\ÂDJC-\Ö}4\Z\Æv¹\ã0~e¥l¢I\ÄoÝ\Öe=\àÂ]#ºZ\òüyr¤!¥q0nll@\Õwy\î;ÿ6s\Ø\×þù\õ\÷W?\õ7?OÜ 	±,ú\å{¯/W¿½{\îs\ó}¯\î?¼\Ç\\¯\í%¯~xm\÷\Éz;\ðý\Ù\'\ÒýÀ]o\ò;&t¹\r27B\Í\'_\È+G\ô\äK\ÌR+\ò\òýXÕ×­)\×[ß\Òø4-/i\'w\Ð\áuÕ¶{ª\Êj¬n\ÛúªIg9\àú	\àGKcD4\ç×¶\ê=s\Ù\æT³ú	ÀC\ï^ªw©x[U¸\órº¿ª\È5Ä\ÎO¨*E)\Ë?cUÒª;Lþ¤UqJtzU\Ð:6g\êgÿ{vü:Gb\Â-G\â:+Ú§1I\âY)ÿ3±Jw4º:w¹ü\å[i\Úù}\Ï\ÛT}N\Ó\ëHP\õ\Þ\Û\é\\e_|ï·³©¶ \Ù\'5¬Y¹ý\Ù\ÇK7|<+«\Ìq½	\ÜSÁ\òK\ï\È\Ý\õ¤ú\í!\nG\ro\Ì\ó(\È\Ï\Ð88\Ù%\ìC3±BÎ\÷\î¨\è.8«\"ÿ0ù\ÞGh\Ä0\íh*\ÏÖ¹EQj\Ð63£°Æ¼~p\Úú@[80oÊ¢UÏ¸~°5\\\ÈIe+7«\noNx§Ü4[\É>È¸°c\'wXÑµ\"¼{,ÀWC\n5\Ú)Oý\Ô\Ò\ê­7\ïµ@\ì\á\Éu	4\Å\\	},>Z\Ò|_\Ó4\ñ\';ª¹\ìk^7\Ä\Ö1±j¨.{\é\ê#\æ}A-\ßÒ¸£³l\è3»X\"J%\ðÞ½p\ÅMts\Ð\à\Õ\Õ\ïk¼\äR¾q\Êk8Y/A¾6vwý\ì+Ôÿ}ûráúMVyY{·üW¹|Cü\õw?½ü?fYü\æ\æ\ò\ßoú\ñ\Û/¤1\ñk/~ùXzýþ\ò\ã\Ù7ÿXü¡^gB\ß\íû\î`?|y·É·ow­U\Þ{\ë\÷Êv\ë\ÞUQ¤ü\ÝU¢¾\Ë~¯¹w§;\í#VWN¢sn+(\Ý\nÝ;`,¬&GSs\Â*¢¯fù\ãý\r¬GÈ2ûÀ!¦`¬\ZFûÂ½C8\Í\Ó\Z\Ó	\ä\Ç]	±\ö\ZL §^Xbs]mC¥/Is+øÎe\ñF\È5°\Î>P\ÏýG/\äû\ï\ö\ZÁæCi\ÏÁ£^²,Áuþ\ØAPZ|n¤\ôBh]8Oß¬Å\ä\ÎZ\èc%«\Å\äIB\î\ä\ð\÷¶\ì\ä\ÅBL´±¼=²Ä¿\áH¼µL°\0GÆºWùDW\é=m_¨\0<=_­­Y£L*\È\ï	ýBùÿ\Æ\Ë\â¦°£YaV\ê\0Ç« o\âºp[¾Ic8DM\Èa\ÕY)~;\Â\ÛPcj\î+u\Z\áCm4\Üp­&8W\\¨î¤½\Ì\à\âÂ¡¨h\Å2­æ´;\ö\'B\îsu<û~-·\â#h«Ö°Ç¥y\ëwM_.ºO\å{@[z!y¡ùN|Ú\ï	P@D\õ9\å\Ú\'\Ø\'\Ù\êAl¡y?\\\õ%\æ\Ø×§~\çQ!wø\çyÿWr\Çß¾ÿ¿ÿhú8§\ç\é\ï\Ó\Ó\÷9=¿¥<¼þ?\ó<;¤\î0\ö3­×\çiq_\0\ãf¸\É\Ñ\ï\Çf Y\ö}\Ò§4±*\ò\ÚÖ­t\Z\ì9Nú:\ð¾\0F\à¯z+¢\'øü\ÍZÕP\Õ`l\Þ[<jp\áHH´Ó¾B:Y\ÓQdB\Ý)\Ê\ÊÞn´\ò´a\Ö8Á\Ï;Á\Ýye%DJ9ø¹y\n¹\ã\ÂJÁ#:\çtXË¼\ØsS8^\ÈÈ³«\Ú\\Á\é\Æug¥\Äy£§ª&%H#+ûvjn\ôhV]?q\åAlûÄ«\Ç@\ö0°\0\ò´Ñ¡\Ï:rZ}¾|_\0£\ñaÄ¢¤bÆ´/\Èq\æ\ÒG6´bß\Âa½,\"_9qµ®¢9ø­E\\{c ±¹qs\ö\'|o\éJ+gh\íVtNwºOûMd@\ÖÜÔ²>É§Åý½\æ\çr\åmWû:¿d¯n\çrS.\ôQ²°Ü¯ü\Ë\Õ\â\Ë__ã¹º\Ýp$ü\"\ëÃ¯\ïa\á¯xg}\ÜQ )JM\ç¹ülû_:M\ËkW\é¾2O®·\×\Ä\rþ³À6;c^\ÊNE£+\õd\é)y1\ò¶\Ù\ì¶²T\àpøebLº\ô49\í\äkn;¼\ì»/º9DµPuúû>\í¬\å`J\ïqºk\å\Ãyü,¹£\ÒBû\ÔXÝ\Ö]ÿ}=#üX7K¸È»,û\nU\ò\× w7\ä\ér\äjN­\Ïr\Ñ{¡Z!ût \ëCÀS¨|]ÒÒkÁp\Ï9yp\Êùwr<¥\Ûä\Âe®}\ë£mt»¶þ\Å\à\Øh\Ç5c2l[\ò\â\Ä\íªW\È\ØCs;¹\Ã\Åfk¹I\î\è3u Ý\ô§©{\'\ÖCÀ«Û»\ÃBÛ¬\ñ .\Ø|\÷);þ¯;Fü.!\ô\æøÖ§¥\Ó\óD3>\ðr-±­<-\Í\Ï%\\ù\êø3À+\Ôl\ô1PÝ¢¾	©¦±Þ»H\ð°¿-¸|yÉ´¯\å\ÍWQ#y!;]u\óº7p\n*·«3\Ý\Æýi\n§Z\àÏ®\Ê<°\ÊXY¶yRA8\"hd3%\'§\òÀ|]+\Ö´7I¹\Æ\ëÀÓ²R¹\ìGNÁùJ±D\Ú<PU\Ö)@d\Å\÷g\à7´\îT¼C\ãB\éú²ZW®G#6\ÇÜ\Âµ¹iEVB\Ý\ç\ëÉ¶À\ö\å² \ð§7®kÜ§T¿;P\Ê\rrg\óYL\0\\\'\Ê\í¹~+¬\ö³À	½\ö4ÎY3¼\ÅpxN\È*\ÕúX¾n¸{\é\\¸rsZ	l\Äg:uW\÷©D?©q¹\Ðb<©|¡eCk\Î4\Í¥9üg\Ë\ç«SR\r\Ó\ó\æ¶:=o¬\óøÏ\õ¯\÷«ln\Û\Ê\'ï±\óe\'\ÈúÍ\÷VI½¬¥\Ð\ç*[¹x9b\Ú\'¥®/-{Wdp*ú5#\Íj\ò(\ð\ÔW\î@¦··W¹²\ì\ï^±\ÖÆi\Ü¢} w\ä\ò\à)µ\Õq\ß[]û\Þ)À\ò£ÀkÅ½\0\ÔL \é\Î\â}\Z¿\Ì>AZ\÷\á\ët\ßQý2=kx\í0~\é3\Äý~©ß»V\ò\îE_\Ïù\Ö}MÓ¾©Û\Z\ß5v!w8½\ö]An«\ÍpVqV\íH£|¬-a>{\ÏXPsTWµ2\ó\ãÐ¦[Kh£¯½ý]QJG\÷\Ô\ñ\êWrG\å?TÈp\Õ\á\óª\ÛRm\ö$¤Z9\Û&\æ²H\îJ½\Û\Â=\ß\êehDT\Ý\×I´b\ï\ä&¤\Ð}U¥\õeJ\Î-ÖV\Å\Ë}h2dC·6¹N\"LÊ\Z\õ\âÐ­*b¢(Pø}hS]_»º\äH±\ÕXz\÷\'¨{\Ïþ~\Ó-£]\Ëkfµ^yZzDgV\å\Ô\ÆSo\ô\Ð>\ØGû¬L\"Dd\÷	wy½X\ÊÿØµ4\áýÿqD-°-:t;Ð\'\Êú\ÆÎ\á\ã@\É\ñH\Øq\éø»(:°§¥±\×µ\ã&>\æø´Ô¨~>¬-\õorù\"VI¡\ß\0\éu\è\ä\Ú\É\î·\È\÷u(U\Ý\Ö\Üv\Ù.²\Ö\"\Üw{û:¿7w¿;\"\ÞvrG\é\ä\î>^\\@\r»¹C>Ì\ØÖ\n\ÎF±,/6Þ¡Mh[¡\Ö·OÁ.\ÖM\ÚØ\Ý\öwK\ö¨\öu\n\é\äº\Îm\'w¬\ï\È|ûrGÅfy[\Ð\Ã\ÓB»\Õ+\"«­/p\n\à©Ú¶\Å&,Ý´\Ï8¼,\nþ3×­\à\î\íwr\Çb\"\ê¹\Ã\ðU¯pþ Z\Íú#8¦G \ñu}¾s«wø£~@\ò&	1kq\Ä¿\0ÎH)\ö\Ç/\är\ñø;¹£?©Y\Ó\ã+w~1q\÷ µ3Dx?f¤mT¢PË $\rþ\r\×\ÜWL\ãû¥>¾\ô¢½xÁ\÷À76k\Úh¯*riPMb¯.ý\Ã\ñøN\îP\íq[DYv½\çÁÄ¦û´oD(Aû\ÍiYA+4j\Þ\ÉH	^¹\Ðd«	\Ç~\n\"\Îrª»±trÇ³½|\í\ß\ò_fÏ\çL¿~u\ÏyÉ½¤o_\Þn\õ!\÷\öos¼z¨ø\ád}{\ñ\ÜÁ\è¯_½Í½ý\ò\ÃV\ïs?Hx\ó¹\çÏ|@\ßF\"?\Ù\ñÃ¶\ô­\Å\÷;\Ö\ß$w<1yV4Wr8F\Â\ô~¿;p\'w¬qZÆµV,\ðC\äg¦WrGXÀ\årGX\òÜ±urjRwrG\è\äB\'w¨#±}\Ü\ñ\ÔzRúzHhJr!w»@\ë°\ÕÙm\çHpiLÍª;ViÀ=¿.Qÿ\ÆW©;¹cµ\Â\Ë\rµ³\å5g\äH¦¦«\ë\ã\Ø\Æ2\Ûvry%w\ìýcÀû\à\Í}\ÄrÇc.;¹#´r³\É\å\ÞM\Ö\Ãs\È\ÏLÿ,¹£þ«À\Û\ð/\à_ÀþAO9­M\ð\0\0\0\0IEND®B`PK\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0settings.xmlµW\ÛR\â@}ß¯ \ò®Á()ÀB\\WVW-\î\åm4d\Ê\Étj.\ö\ëwBÀrCR@ s9§s\æLw§s5YcBR\ä]\ë\ä¸i5R>\íZ/\ãÛ£¶u\Õû\ÒÁÉ\à\è¸: Y\"f;n>Ýµ´\à.I¥\ËI\ÒU	\ð\õ6\÷\ãjwI\Ì\åo]+R*qm;M\Ó\ã\ô\ô\Å\Ô>¹¼¼´³\ë¥\ò	nK¯þH\ïDÙ<%\Ól\Ùù³\ÕXùA\Z\Ç\ê­uX¿~¯³\"\È¨8Ó¦±\Z\ÎB\ëZÒQH\ßU³\Ê\öý¿\çJ\ê3\è cL¬\õ¤Z$fre\õ{\äSÀ0Q\õ ÿ¤¡Ê f»\í\ì\rt\Z\î´Z­v9~\É`v \Ûa> Q\Æ9KoÁ{J\õ#\â\nù\Ånª\å\Í\Ê\ñ^Dp\áVoB\Ý(# !r¶¨¾\Ï¦\ÏF\õý\á°*%\ô$/IH\Ü\n\Ç\'\Ìü?<\ÇPÞ\à}I	\Ö<Pzi\Zû\Zû\Þ\"W²\ð¡\ô8I\Æ8\"R¨ D¦3~\Ý\ã\çb\Ç,Tÿ}Xø;\"½@_©þ>\Ê\Ã\ïÏ©4Y#rú·úV\ï\Î\äE\æÒ)\\túVÃdø\ß­)\òGTPG\Ðd¯yÁ\â²2K\ì\áÿL2,\Þ-|9\óü\ÔqZ\çû(Wµ²è\ZÄ£y(Ö±e}³\ìm\\þ¤\é\éÀ[\Ä>2\éA±\È&@\à+aº¯<4¯*?0\Ü\Ð\"¯\é§û¢§ýÎ¨¬L;\'0\ã>\ó¦w¦ª»^7(\Ï\Â;6Zá°@\×S\ÆW7¦\ÔÅ¾\Û\'\ÎÏ®)\'b±\ÑûI\Â/\Ä\rQ\ä\ðL\ÇG\ë\0\ãDÌ\ðr3V¼Ê¶\Ø\ÞøÖ±«¾{ÿ\0PKÉ:7\Æ\0\0G\0\0PK\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0content.xml\í]ýrÛ¸ÿ¿O\ñ]:/¤ø¡\ï\Æ\é\ô\Ëýtn»Ng2d\Þ\ñ« é¾H_¡ùÿ\ÞÀ/\Ö]¤(Ie$°À\îþ°»\×½qrEYhû\Þù*+\'z¦o\Ù\Þ\òüä\ßKÓ¿¾ù\Ók±°M:·|3v©I¦\ïE\ð@m/\ó\Ò\óys\ß\íp\î.\r\ç9\÷\êeµ\æE\êy\ÒF·N\ã\ê	q±vDo¢¦v­®qÑ¼ç¸X\Ûb\Æu\Ó\ÊHZ¬¾\ðV¾	i\áÃ¬»\Ù%.n\Ûûýü\ä2ù`p}}-_\ë²Ïu6\rÒa3§b\æ$T9 \Å\ÎÂ*«Ö¥Ñ?¤-²\ä\Å\îe§Æ{R\r\rÙ¬¡b5ýºZ6Ö®«e\Í4k¬g	\ñºª\èVsUÑ­b]×.k\ä;|\ÂäVz\ÅÜ¦}!\í\ÚT\Ì\ZS\ëû¾³¸±\'\ìj2\ð\Ï\ê\ë\ä\×Ì(+\ÉM\Ã1\ó\÷ÝªI:u\0½BÏ\'\"¬© \rxqNZµMÿ\ë\ãO\æ%u±ý0±d{adx«a(Ú>\òY4_\óv¹N=t`iFºdUI\n\ì\è0b\éÊ¦\×ß¬a\ëf}\r¢\"n¬ *¤\ÉMÄ½¶\Ì×§{>\ô& \Ì\Æ\"\ÃIª\Í\×Z(j°\ão\Ñdº¦ZXz:\õ\çCªl\Æ\÷%7e\0¥\÷y¡\öúºÁÜfÍ¡¢ûÖ¢\Üb\É\è\Í0Ô£*\ÙþüI¸l\ÂÂ\öTp´7oÀ± \ä\à#HÃ¤EM\'|\óc|þ\ð\Ï\È\÷ù\Éßm®üf®\í\Üf\Ï+°aµIdC>^X\ÑÌÀÿR¢\ãO\ÈZ\ÓH/-©³X^\Ûa¸FØ	h|e\0c¨º°\öþfü3\Þ\ÌV¦	K·aD\Ý.<}°½ø$\Ù%?n°eoü\r\ê$}nÄ\ëmJI;¹\ö$ÿ®\Æ\ôÕ¼³ùT`wb\×;\ÉjJd\á\Ï/5~.(\Ø4]g-¦\ä×¶K\ðPa%ü\Ø\ÙÄ¶/\ÞTEg£v\Ì\éûbn¢\ÈcµoÃ½	P¬¥PG{\ãm,+\ãv¼\÷\Å\ÛT\ÕV¼±:Ceþu1xR\ä\á\ÃKj//a©RG\ò;\ß\ÌpR\É\"\Û5©X;b1m\Ãw\ï\ï\á-\ê	\ÏºuQ&ÆJ¼\ÆO\ð\ßOX\ö\ëh\ñ\ë{\Z\ÛüWS~UK\ã,ÅqNm\Ú>:\ï\òJ®oA\Û¢6\ÌW\Ïz{\æµ\Ý1\Ï\ã\Ü4Ü\î\â\ï\Ø\÷\ZI?Áj:6)\Ä0X\î6º¶\'U¦Õ°}¹%tg\ÙK;R5á«¼k®!LUªº/&\Ór\ô&ß¼\ÈYN>\æÊ¼nÀ:Z·\ðS\Ç\ÉJa¾*ù e.\ÙÂ¨P\é¾\í\"o\á\ØKO\nýaka\ßdCF<\Ù\'\Ú\ö53Ä\ÑM\ö|	?gµ,Q8\Ë\Û\òy\ÞB2¼%¦¤û\È¶\æ\åJ\Z^2\Ûû]|ia¯ú\çeW8o²z~.U&Á¼\ô·8\ì\Åm\n@¹\ç\óf,\é\Ë\Òê°\ð\ô\"C\Ð$z\à\ë!½k°%¨CÀ\ÈWe^hÅ«¾¦Ö»¥\Çg\ç\'\ß(\É\ÏIQ:~9\àF\ás)ºd~¼¼\ä*°>}\÷¢Û D8¨k1\n°<\íÿÀCUM\á?\Ë:anJ\ô^\Zf:\îu1%e	k\ìe\Í]§À\á;\Ö\ZCØ·Á¾\áeeOK3V\n\å¼Õ\à^\Û8\Ø$\æÐU`V\ê;/¯\é=/¯\ï?\'I8h\î\â\Ð:Z½0û½½\ö\èf¯=ª\ÙW\÷¾K³¯Vû3{\Ë6¾\Öq\áH[[^A1«iop¡\Ï,\Ü?Q\ä	¦$\ô\Û\"%+8\Z<Awsü\ÏP±o@©K1	?BØ½°û\ãµûº\ô­p$ @i(V\Ù#¤T\ìTR°R·\ó\"\Ü	aý\Âú\Ýú\'\ÂúERRÿ\ó4þ©0þ\Ç4~\êY\Â\ôE\Za\ÏiY\'£\ÏlM\ËùqA¤D!À\æÙª\ìmÊ\ã\Ø°y`#\n\È\év¼²\ÞÁ\ÑF:Oq\"?p#\à\æX\à¦Û±N7\ÂÁ#§\r\âùÒ§\0*®mYø¥.*OTDf\rNvTÀ\ðQNR*\Ý«v\ÌûV¥\Ð`¡Ám4¸Û¹\È\Îq}\Å\Úwe81Mt¨\åx4(\Äj&°\à1° \Û)\É\ÎX \Ö3¡Ãux\÷ý\Äv»H5®\Ä\Ñ\Z¢\ì\ê$\á\ö²8[,\ÎHx\ÄW\íè¸8\\|ÀP#\Ø<b`£=\Ê\ëE.N»p.\ö\ë\\\ìþ\"\Ñ&´\îþ`PP\á0uv\år\Âa0\÷û \ö´\àÂ·nW\ZVxIi\ô\æ5¿M\0¯n+!Pé²L#y§^ªxµR ^¸\êpa{\ä\Ô	K4x1£KhI\ô¯»Ãª¨®m\Ç2\rf\é­wx\Z¿vÛ]É²\nP£È \òüVú!e\r&ÿ¦q­M¯^ j\ÆOü\ðN\Â\rQ\ÌEkcnq\ô¾\Ã\Â pn%Ü\ó«0\n\\¤\÷T\ô\Ü^\öÀÑ\ãm,7oS\Ë\ÚL/]à¤¡\Ä\ñZ\ç\'úz\ÝE\Ã´9\ÚA\ãg\\U\ðÁv3ÿº¢W¼¶¦\Ä ´W\æUqo\ÉnM\Ë\×m|[,\Ë]?WQ\ícI\ð\æg#±&ß¾u\÷\ÕdG¨G2\'`¤0³\ÖG\ryT+y\\8¾­\à\ô¢\ÓS\Å6\'Ï¹F\ÂV5P\Ü,\ëmF/\0Ó<Õ/»Ï¥\r\"\æù¿\ãti\Ê@E_¢\édk\ÊP6\ír\æ7\ÙÑ´°\ä\ò,\æ0À+\ï`u/\ê\×P*dûY~«~>\Ë\ïµ/\Íe;Tf\ò¸l\Ê7¥\'³$X§NÀ\Ñp\Ã\ìI«\ó\÷\ê3½ù|Õ¡\Ü¹\Ê·¥\Z\í¬|c]W\Õ~xdºi\õ\ô=øü\ÒÙ!\ò\ä\é\Û\ð¦Wù\î\É}	¨\ÝÁa\Ô¿¸ú6\ö\Ù^¤\ÚyD°\îu\èZµ\ÒTK©¥\õ¡*\ëz#æ¤»Ò¡z\î-\"´\î*V¿O¿|<ý,?\Ë\ï\Æ_^\÷~LV\ñ¢»\Øf5N\Ë\÷\ã/\Ï\ò·o¿U«]\Å\Õ\åe\Ñ) \ì\ð£()\ë«K¡\öJu¨¸\Ã½=º½\ë:¢\Ùt¨Oa@xf¬,&\0\Z°¨\Ú|\ÚÊ²\Õ86¾\ë!¾¬\àP´tT«a\ö\Ó\ð\õ^S1\ÇÀh»HdOf\Ö_$¢V\'-\ÛØ¬:Ð\\\ÅPyA,Z¥ë£\ïe\ÑZº\ð¸E4|0Á>\ÜÀýz[[Å«5\ñÍ\Å\ÝÙ[Ç3t\ÞeB¹+o{\Ø\Èh6«\Z¸Âª&\ç§8¼¶\ÊjDW\Ä·a\Z\ËG2w]Æ¡5\Ö\Ó86\ÇÆª \èø £\ãjPÐ¬z{¨f%j¸=;vÛ¸Ç¡\èU{\èU\í~>\ã\ÈE\ÄÐ»µC:°?9d»}ûp|2§f\ñxBºÿ\ì\Ýg?°tÁ©H<©tÁ´C=\ÙLS§mvqcy<\Ùi\æ Ãt§½Ë/0C$\ÂA\'j7xÏ´6[¼\ZX;ÿi¶\Æ#}K|\ß\Û\ÓûÝn\îÖ¼Ô ûh\í6¿\ð¾½\È|l­h¬Ô>D\ß\Ó7@\ív_9\Ùk)R{\Í\Í\0,\òiG¼\ØÇ}0\Ñ\ó$0Df§\'¥k]\è²2®	\Ën+§\ÝqEAä¤D\å)eX@^Ça\é2$\r4R\ô2nb\Ñv<¦wOxL\Ó-\Z~ûI«ûúH·tºEk°\Ès-m2.;M¸þ\÷\Äÿ!;¯[\ñV\÷u\îf\Ñj\Ó\"\çH\ät¨|§\á\Þwr\È\éBLþ\Þ>\Øc>¢0\ï\Ûe\é\÷\ö\ÐFÍ¾\õtÐ§\rß¥0\Ý\õtüF~ \ßi\nM^9¤ª\r[µi|Ô¦6Z\÷\í\õWNbØ\é\Ä\ä%±M\rpVMþ¾$g&<d¿\ç\ïl(\n(\í2¤wù*H¼\Âh\Ç\ß\Í\é2vo|È£~;\çÉds®G\Ç\ï\ç\è\÷ý\ÆH\ÝÕ\Þl=G\ÂC\Â\ã\ìm§:.Ànºû\Î1Y\ç8¯\Ù$#O)Áu1¸\Ù*}úüÖ§\Ò\Ëa*«9=\Õ\Î`¶_p\Ñk\á\Ó(r³]! \Û\ëê¬×­$\÷x\×\ó\Ò\"5^\çgùGÀg	µyª4Rk\ÎqFv¥wËN){ú§ÿ¬¡HS\Ô)ø¢8¾_ \ðd \ï§|MlØ§\ß×°\Æú\Ø4¶§aû¨Z³p	\Å\0:µ\íKe\õ½¼k¸+¼³]Û(\ð\Õ\ö\Æ\nHCr\÷Õ¹ûê&\ç·xfM¡¶-\Ô|ß°S³\Ý\ô+{þI\ç\éÿdg\×	6\à\ñ\î¾.\È^¼\"ÀA\ð\Ú\r{aS\ò\ï$E	¿hÆKkNFvÄøÃHb\áR\Î}¹\Ê\Ïoç¡»\à\Þ\ÒøF\â\n\0{\åÛ°»¯ü5m&<bDP\ç\"Fi\Æ%\ÐZ*.)!\r\\¾\"\Ê(\ðch6L\Ì\îþp(+)	\ÊÖ¼4\ðW.Ë¼b\Þ}µ(3X·q|JvS\ì\à\×+´&$w\é[\Éo\ã!V|_\ð,1I¼\Í\ç\î,ÿRnÝ±\ZsEBpP*¶Ð8ºûC^.4\Zcø/X%+4L¾\ôq\ó¬\ì	Ä\Å)zF\ã\'o#,5\ò\n\íÝ³\ËWB¢\í%À 8²8x³V& /\"\'aa!F \Ø9rÀf\îi©\ç»\ð?7¬±¾\ë\Òzq\ó\Ô\ãk\é\Z\Ø{\åbþº»cú6WÓ§	:&ÈÜy?¿i\ínY?8\Ô%*9%\â	\ò2\å\õ\é\'{xwÿÅ\ñK2H\÷\î\È9GøT\â\äsAx\Ë4\ÆJZIj­0\Ô&Âx\\cka\èB±\Þ>\Ð£=X¾c²4tUNF\ãYý\ð7±5\ì\ÂV=¬µ5\ô\Ý+Zy\ò(2\î±\Ô\í\ZIm\ë;1»\î¬Îªj6P[¯R¾EG\í\å%:mv¹\æx·\Ë\ðnª¶Ã¹\Õ\â;[\Üþ¨N\åY3\ña\ß\ó\Ôs¹\ã\î¢::\Ó\ä6\'\'\rw²\ðT\ìa°&ýB\ïa=\ödo´Æ©L×®\Ø\Î\òK¸³OoÆ\òxf:z\óPKe¢<\0\0\×\ì\0\0PK\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0styles.xml\í]mo\Û8þ~¿\Âpq8Y²Û¸Ø»\Ý\î-\ÐÅ¶{\÷±`$J\æ®$\n\'ýx¿g\ÕýRï¯\å\÷\\ \È\áh\æ\á\ÌP\nÙ·;zÀ,$Ô¿O\'\Úx}Z\ÄwnÇ¿}~§\Ì\Æo¹¡¶ML¼°¨y\Ø\çJÈ\\`°.\â\Î\Ûq\ÄüE!	>\òp¸\à\æ\ØO-\Ôy«¸E2\ë;\\Gsü\Èû´¥±\è¾ÿ%qq´\ÅÐº\ï`AÛ´\ï\à\Ç\ÐUlª\Ô\')]\âÿq;^q,Tu½^O\ÖÆ2G\Î\çsU\öf]1WRY¦],nª\Ó\ÉTMi=\ÌQ_ùmQ$?\ò\î1\ë\r\r\â¨fÕ\áH@]\áýÇü\ëÁ\é\í]N\Ì\æ\n±\Þ~&Ë®bXý]Å°c=\ÄW-\ö© Sþ\ó\á}\îW\Ì\ë{/A[\Êd$\è­fL]O)\ÍD\â\É.\Å\Õ5\íB¯\Ô\ëN\ò5#³¹\ÙIn\"\×\Ì§^h@7UBÁ\Â\åSj&n\å|©2P\Æ3A\ìþÁ\ÐÑ³©º\â\Û>UEoJ\ê0\Ëj$q¦-L\Z\å\à\õ«R,\ë\Æ®J¢bü\ê0\ÕTAM7¶\Ì\ÉÒM#ß§]~0#¢¹rØ¢Ä¡\è1.À2\É!¥ÀJ°Î¶L¥F6*^¨\Â\è\Ò\ÌC7\â\ó¯ª\èSDV¸Ü§L\õ\ñ2Í6¬i#+6\ÝpyG¼¬y_!o\Ç?0À ¥q\Òvµ{\ð{±W\"7úü°\Íw( \á\÷º¸q<*±\ô}f^¸&aX¢7!6= L8\Ö3¢ýGÿº\Å*\Ð\ô\é)\ä\Ø\ÛF¦\÷ÄGN|<ú¹°\n\å\Î\äSÛ$i«­T\Û(r\Z,\åH*\ç·bb\×§\äb\Èa(X)8¹\n·¸¨\rù¢3®C&<»>L\Ù\âl6]¸\Èw\"\ä@/\öe	s3\î·O\ã*B(\ò«®!iR>)\É\×UÚ0L;þqWg+¸»gD+Reuýr\'-\Ô\0ý\ò&®sr§d;m\\!\Z%W\ñe\Øq`E\ÂC\òF\r<3W\Óm¦ú4¿°8\Ø*¹Lkú\àr\Ã.\Ù\Ý\äe\ÚbúVµ&K\ñ ¦4,\òMÄ±B}B¨´]Q\Ø\È\rq®ÂF,\ì\'\ì)jk\Æi\Ä\n\â!W	\\U?j¼\Ý]§úE.zhÈR\ö\ÝúýFq\nN\Ý\Ð\Ù\é\ò\Å^\È\Í\Ô«\ËBw\Ì9ë©úAed¤}PÂ\Ø\ÊÄ\0~Of\Ä¬v±¸l¼U\õ.\0\ô\08F\\u§¢\Ýa\Ô\ì¹O\Þ=uS^yFl¼ü\ïþ\ÌFW,:ú#¤A\Üù¨¥óºwJê²l²-d6eÔ\èk]\èk{A[\Ð#oüºpo*\ÇPx(È²­ox:Â¯\ß|\ç\ð\ïo3BA\à&0*¯S·6þ\Íw¶	8\ÍE¤¬]\ÊnÇ¯l[OU\äon;\è\önn\ßÍ ·\í4B\ôÛ\ï\Z;\ñÝo¾;\0´³\Ñ\ç\ë\æ½\Ü\Ü\Þk]peú|UQPm¶ú>aÙ§e«\ÑK³«\Õ\ÅUZ\ÖýQ¡\'\Â&Ë·0ú\×\íúxº\rx6\Ô\Ï\ör\ëSy>@\ä½<:jY}#O	¼´©¡z\í!\Ë\ä\á3PæG\'g\Ó¥;B1¤X>p\n\ë\á­;whÿh\Ãq\ÕnwÁu\Ä\çEú\âr¼\ö\è0\î§n5*u\ë\0£\\\ÌY¸Ë©:\ë\Ù.²¤«m\ç¬W»p\Ö½\Ô_\nWIM\\WùLYNSi?Ð²C§¿ú8=9|\Ï*¬o½~\Ø+9m*}\Z\ÛR\ê\É{A0\â\Ø\ç\ÏL~!\ì¹vG°\Ì\Ü>Ì¦ý=X\ë\Ëþ\Ì}5\Z\×;¬6xÑ­¾´;\ìQ/À¿¸{8ø\Ï2$6\Í\Â\òM\Ó\Z±[0\è\ÙCTÌ¾\ÞeÌ¾\ÞYÌ¾~6fw³³+\Ïký7{Q¥\ð[aª¥\ðs^\íÁ\ÎJ\ñ!¯N*¬\Ïv\Ög;ë³­K\ñùK*\Å\Ï\î¯.\0þÿRü)a°iÎ°?Õ1`)0\ä=þI\åù.s\Æ|g9cÞ3\âqu{üo`\Ê\öKµoË\êÀ7Y+È-|\ê\ãl	Jü.é»§S¯}KY\áe&?µ½\\\Ù~H m\ØÙ¶£¬ic_Nl\ÔKhn\ðKÇ·m\óKû³\Í~\íû\Ô\ê\Ê$·ªP\äÑ1\õ?1§8t:\é	ËtP\Ên²\ÑR\ã\ä+0\Ð/^hL0¯h\Ç5&Îq­\õú¢k_²k\ÂÜR¢M\é\â6X\÷\élÝ\ö!\Ú\ë\Ý\Ú\ëG\Ò^ß£\öA­Zm\ç}G9\Ä[\n\Õ6A\ï{dþ!ª\ßRò»¶m¹C}\÷®\ÂY9¨f}º³>Á2K´¡M®aÆB\êk\ôj¦¯^1×µ=\Z\ñ¥\Ü\ß\r\Ø\íz%\ôÑpHU\æ¦\æ\È·²G\ÅÄ\Ãx#xûIqJ#=¦dM,q\ò8m¡hj( ®\Â}\Í\ð)µ\ñN\Ä\Z2\ÇMS\Î\ñ~\å\Ï\ÕUC<\Ý\çT¼\Ãg²\ã@ $¯(\óùÁAù;:¸8zbYwü1h%Y\å¤û1\Ê\Ò?\éz[~¶d³\Úú\ÓM³dØ»Z+`\à!m/$H\È69l-K¶a+-`Û ¾=*lF\'lÆ¡a³ä§®Z9f(¹u81´#\ÊÁ\nhC#^\ÒûC\àM\Ç\rD\rB³ ]Ý\Å\ã<\âGÙ¢@ü9G\ñ¨¬]¦\ðû\Ü\Þ+X¤\æo­Jm6,.\àG\ñÀsXSN\ô«\Äúbt¹Ø­\Ü\Èb\òJkü4\ëv|=\Ñ\æ\ñAIj»H,GÓ AÆ²<j\ÍP=¬\÷3\ðyX¯¸\Ö\'\ó|]\ÈP²\â\ÃPµ\É\å4Ô\Õ5\ñ¡S   Us¦g\àI§\×¼\Ú\è\ç\Õ«q`&\â\òUV2Ðü´RqT$C¤Gm2»hq\ÉzWl¥Kc2»j´T\ÖSD*ØÃ¬\ëqCA&\áTdG\í¯]q¸xC\à#\Î:\rG\É·\á\ÞÿMhøUä«\ð\çþK\Üjk\ÒN:<f,²T4\nN]¯³¢!\×\Ç\È,oD¶\á\n\ãzù\ö\í\ÛµÚ´;T\ÐÈk¨\ô°8µl«\ì\î.\ÉE\î\î\Ëiz¿B[MU	\ôN\Ô\Z\ÏAûkrl²z\r\ÙøaG¼tm\nvÜ ._Ç¿q\Â\Ý\"i|ý¦Hé¥&\é½)Ä\Ç)q<m±l½EBF*>U¦º¢\Í\ÆKMSå·¦%R\Â\å\ßF©À ¦-\äw&t\å;o¥«\Å\òU\÷r>/Û\âBO\âúË¥ý\å¿¶¯s\ò6_07ú±Q\ñ\ãgÀ\Þ\Ô,½Y\Ë\n¹þ!Ss\Úü¿,ÿPK½ ¹¼\n\0\0u`\0\0PK\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0meta.xml?o0\Å\÷~\n\äv\ãO\Z%¥\ê©K+us¡nl\ò\ñLh¡£\ßý\îÞ»\óÍ©ÁZ$b \âºª.\È\Çûk¸\"\ò!×\àH+Í»t,8·*K\ÇRA:£¨fVXªX:Nujj¡sz£Q9I¡~\n\ò\å\\Kú¾ú,Ò¦d½^¯NhÅ¯\\\Ûé©J,$Q;$üo¨G\ÒZ_|\í\í\Ò8^Àø\è\ÚT¼·À\Í\à9\ö$¸¬?;xJ\Ê\éºC2\÷a®¶9a\à\×\ÛK¹\î+HJF£d\ÙE\Õûo\än\Òc\Ñ5*4\ÌiSn\Å\Þ\à\÷~Á#,£8zÒ§­P\Ýi\÷¹Zî`\Æ\ìZ£\ÃÍ þl\0\÷~KùPK6\ÅÁ8\0\0k\0\0PK\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0manifest.rdfÍ\Ín0\ï<e\Î\Ø@/r(Ê¹jÀ5X/\òÞ¾VQ¤ª\ê\Ô\ã®F3ß´\íaÈ²¨ÁT4c)%\ÊHhµ\é+:».¹¥\Û:\ÚØ¶+\ñj¥*ºwn*9_-7lÏ³¢(x\ó<O¼\"Á\Õ8qHÆ´	Bi\õ\ä|\Z9\Î\â	fWQtë y\÷ =\Ý:© ²\na¶R½¶ @	LÊtºNK\Å3\óQ9Á¡\í\â\Ç`½Ó¢<`\ð+\Ï\ØÞ¦\å^à½°\î\\\ß|hz\îczu\Ó\Å\ñ\ß#`2\îO\ê»;yÿ\çþ.\Ïÿâ¯´vDl@Î£gú\ç´\òUG¯PK´\÷h\Ò\0\0\0\0PK\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0Configurations2/toolpanel/PK\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0Configurations2/statusbar/PK\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Configurations2/progressbar/PK\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Configurations2/toolbar/PK\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0Configurations2/popupmenu/PK\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Configurations2/floater/PK\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Configurations2/menubar/PK\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0META-INF/manifest.xml­Mn\Ã \÷9Å¶2´YU(Nz\ô\0	\ÄOÜ¾ØWU¤XÊa\ï½`³;;Û &\ã±#\ô4\Ò+}G¾_\í\'\ÙmW\'\ÐhHO¦\Ãt;R\"r/IÄ³\ä>\0*/\Ìüo=n\Ñ\ÌÀ\\\Ñ\Ö\Ãy\âÆO \í*k\õU\Î¢R\Âr¯µÀgQi»j\î-hc¡­\å\ñr7 µmù\Ø\ö\Ð\×} h\ó%@GD\Ö\È\Ñ;¡¢\ã\è¼uB¡\Ò ¶\Ä\Ê\áX\Ü\nc\ËÓ\ìX1N\ôÀü\"9\×\ëN´N\í9\×A²!½,=\æ¡ÿWsS¾Xx½]Y¼zÝ£Q\é\'^P­z[¬±\÷¨M_\âHk\ö\äKMvi1T\Î	øýû\ñ\Û_PK\îL\î3\0\0,\0\0PK\0\0\0\0\0]jSl9.\0\0\0.\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0mimetypePK\0\0\0\0\0]jS¬h\\cG\0\0G\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T\0\0\0Thumbnails/thumbnail.pngPK\0\0\0]jSÉ:7\Æ\0\0G\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ñ\0\0settings.xmlPK\0\0\0]jSe¢<\0\0\×\ì\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ñ\"\0\0content.xmlPK\0\0\0]jS½ ¹¼\n\0\0u`\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0F3\0\0styles.xmlPK\0\0\0]jS6\ÅÁ8\0\0k\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:>\0\0meta.xmlPK\0\0\0]jS´\÷h\Ò\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¨?\0\0manifest.rdfPK\0\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\ç@\0\0Configurations2/toolpanel/PK\0\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0A\0\0Configurations2/statusbar/PK\0\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0WA\0\0Configurations2/progressbar/PK\0\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0A\0\0Configurations2/toolbar/PK\0\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\ÇA\0\0Configurations2/popupmenu/PK\0\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿA\0\0Configurations2/floater/PK\0\0\0\0\0]jS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\05B\0\0Configurations2/menubar/PK\0\0\0]jS\îL\î3\0\0,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0kB\0\0META-INF/manifest.xmlPK\0\0\0\0\0\0\Î\0\0\áC\0\0\0\0');
/*!40000 ALTER TABLE `core_physical_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portal_component`
--

DROP TABLE IF EXISTS `core_portal_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_portal_component` (
  `id_portal_component` int NOT NULL DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portal_component`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portal_component`
--

LOCK TABLES `core_portal_component` WRITE;
/*!40000 ALTER TABLE `core_portal_component` DISABLE KEYS */;
INSERT INTO `core_portal_component` VALUES (0,'Porlet'),(1,'Article'),(2,'Article List Portlet'),(3,'Menu Init'),(4,'Main Menu'),(5,'Breadcrum'),(6,'Site Map'),(7,'Tree View'),(8,'Site Map (Admin mode)');
/*!40000 ALTER TABLE `core_portal_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet`
--

DROP TABLE IF EXISTS `core_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_portlet` (
  `id_portlet` int NOT NULL AUTO_INCREMENT,
  `id_portlet_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_page` int DEFAULT NULL,
  `name` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint NOT NULL DEFAULT '0',
  `portlet_order` int DEFAULT NULL,
  `column_no` int DEFAULT NULL,
  `id_style` int DEFAULT NULL,
  `accept_alias` smallint DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `display_portlet_title` int NOT NULL DEFAULT '0',
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `device_display_flags` int NOT NULL DEFAULT '15',
  PRIMARY KEY (`id_portlet`),
  KEY `index_portlet` (`id_page`,`id_portlet_type`,`id_style`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet`
--

LOCK TABLES `core_portlet` WRITE;
/*!40000 ALTER TABLE `core_portlet` DISABLE KEYS */;
INSERT INTO `core_portlet` VALUES (6,'HTML_UNTRANSFORMED_PORTLET',1,'Intro','2022-02-17 08:44:43',0,1,1,0,0,'2022-02-17 08:36:30',0,'none',4369),(7,'HTML_UNTRANSFORMED_PORTLET',2,'Quoi de neuf ?','2022-02-17 15:18:11',0,1,1,0,0,'2022-02-17 15:18:11',0,'none',4369),(4,'HTML_UNTRANSFORMED_PORTLET',1,'Lutece','2019-06-03 08:23:25',0,2,1,100,0,'2019-05-31 09:55:16',1,'none',4369),(5,'HTML_UNTRANSFORMED_PORTLET',1,'Autres informations','2019-05-31 14:51:33',0,3,1,100,0,'2019-05-31 13:01:47',1,'none',4369);
/*!40000 ALTER TABLE `core_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet_alias`
--

DROP TABLE IF EXISTS `core_portlet_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_portlet_alias` (
  `id_portlet` int NOT NULL DEFAULT '0',
  `id_alias` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_portlet`,`id_alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet_alias`
--

LOCK TABLES `core_portlet_alias` WRITE;
/*!40000 ALTER TABLE `core_portlet_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_portlet_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_portlet_type`
--

DROP TABLE IF EXISTS `core_portlet_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_portlet_type` (
  `id_portlet_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url_creation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url_update` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `home_class` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `plugin_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url_docreate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_script` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_specific` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_specific_form` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `url_domodify` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modify_script` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modify_specific` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `modify_specific_form` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portlet_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_portlet_type`
--

LOCK TABLES `core_portlet_type` WRITE;
/*!40000 ALTER TABLE `core_portlet_type` DISABLE KEYS */;
INSERT INTO `core_portlet_type` VALUES ('ALIAS_PORTLET','portal.site.portletAlias.name','plugins/alias/CreatePortletAlias.jsp','plugins/alias/ModifyPortletAlias.jsp','fr.paris.lutece.portal.business.portlet.AliasPortletHome','alias','plugins/alias/DoCreatePortletAlias.jsp','/admin/portlet/script_create_portlet.html','/admin/portlet/alias/create_portlet_alias.html','','plugins/alias/DoModifyPortletAlias.jsp','/admin/portlet/script_modify_portlet.html','/admin/portlet/alias/modify_portlet_alias.html',''),('HTML_PORTLET','html.portlet.name','plugins/html/CreatePortletHtml.jsp','plugins/html/ModifyPortletHtml.jsp','fr.paris.lutece.plugins.html.business.portlet.HtmlPortletHome','html','plugins/html/DoCreatePortletHtml.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/html/portlet_html.html','','plugins/html/DoModifyPortletHtml.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/html/portlet_html.html',''),('HTML_UNTRANSFORMED_PORTLET','html.portlet.untransformed.name','plugins/html/CreatePortletHtml.jsp','plugins/html/ModifyPortletHtml.jsp','fr.paris.lutece.plugins.html.business.portlet.UntransformedHtmlPortletHome','html','plugins/html/DoCreatePortletHtml.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/html/portlet_html.html','','plugins/html/DoModifyPortletHtml.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/html/portlet_html.html',''),('MYLUTECE_PORTLET','mylutece.portlet.name','plugins/mylutece/CreatePortletMyLutece.jsp','plugins/mylutece/ModifyPortletMyLutece.jsp','fr.paris.lutece.plugins.mylutece.business.portlet.MyLutecePortletHome','mylutece','plugins/mylutece/DoCreatePortletMyLutece.jsp','/admin/portlet/script_create_portlet.html','','','plugins/mylutece/DoModifyPortletMyLutece.jsp','/admin/portlet/script_modify_portlet.html','','');
/*!40000 ALTER TABLE `core_portlet_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_role`
--

DROP TABLE IF EXISTS `core_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_role` (
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_role`
--

LOCK TABLES `core_role` WRITE;
/*!40000 ALTER TABLE `core_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_search_parameter`
--

DROP TABLE IF EXISTS `core_search_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_search_parameter` (
  `parameter_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parameter_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`parameter_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_search_parameter`
--

LOCK TABLES `core_search_parameter` WRITE;
/*!40000 ALTER TABLE `core_search_parameter` DISABLE KEYS */;
INSERT INTO `core_search_parameter` VALUES ('type_filter','none'),('default_operator','OR'),('help_message','Message d aide pour la recherche'),('date_filter','0'),('tag_filter','0'),('taglist',NULL);
/*!40000 ALTER TABLE `core_search_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_style`
--

DROP TABLE IF EXISTS `core_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_style` (
  `id_style` int NOT NULL DEFAULT '0',
  `description_style` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_portlet_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_portal_component` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_style`),
  KEY `index_style` (`id_portlet_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_style`
--

LOCK TABLES `core_style` WRITE;
/*!40000 ALTER TABLE `core_style` DISABLE KEYS */;
INSERT INTO `core_style` VALUES (3,'Menu Init','',3),(5,'Chemin Page','',5),(4,'Main Menu','',4),(6,'Site Map','',6),(7,'Tree View','',7),(8,'Site Map (Admin mode)',NULL,8),(100,'DÃ©faut','HTML_PORTLET',0),(101,'Fond colorÃ©','HTML_PORTLET',0),(200,'DÃ©faut','MYLUTECE_PORTLET',0);
/*!40000 ALTER TABLE `core_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_style_mode_stylesheet`
--

DROP TABLE IF EXISTS `core_style_mode_stylesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_style_mode_stylesheet` (
  `id_style` int NOT NULL DEFAULT '0',
  `id_mode` int NOT NULL DEFAULT '0',
  `id_stylesheet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_style`,`id_mode`,`id_stylesheet`),
  KEY `index_style_mode_stylesheet` (`id_stylesheet`,`id_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_style_mode_stylesheet`
--

LOCK TABLES `core_style_mode_stylesheet` WRITE;
/*!40000 ALTER TABLE `core_style_mode_stylesheet` DISABLE KEYS */;
INSERT INTO `core_style_mode_stylesheet` VALUES (3,0,211),(4,0,213),(5,0,215),(6,0,217),(7,0,253),(8,1,279),(100,0,10),(101,0,285),(200,0,310);
/*!40000 ALTER TABLE `core_style_mode_stylesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_stylesheet`
--

DROP TABLE IF EXISTS `core_stylesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_stylesheet` (
  `id_stylesheet` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `source` mediumblob,
  PRIMARY KEY (`id_stylesheet`)
) ENGINE=MyISAM AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_stylesheet`
--

LOCK TABLES `core_stylesheet` WRITE;
/*!40000 ALTER TABLE `core_stylesheet` DISABLE KEYS */;
INSERT INTO `core_stylesheet` VALUES (253,'Child Pages - Tree View','menu_tree.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"menu-list\">\r\n	<xsl:variable name=\"menu-list\" select=\"menu\" />\r\n\r\n	<script type=\"text/javascript\">\r\n		$(document).ready(function(){\r\n			$(\"#tree\").treeview({\r\n				animated: \"fast\",\r\n				collapsed: false,\r\n				unique: true,\r\n				persist: \"cookie\"\r\n			});\r\n		\r\n		});\r\n	</script>    \r\n	\r\n	<!-- Menu Tree -->      \r\n	<xsl:if test=\"not(string(menu)=\'\')\">\r\n	    <xsl:text disable-output-escaping=\"yes\">		    \r\n            <div class=\"tree4\">		\r\n			<h2>&#160;</h2>\r\n			<ul id=\"tree\" class=\"tree4\">\r\n                <xsl:apply-templates select=\"menu\" />        \r\n			</ul>	\r\n			</div>\r\n		 	 <br />\r\n		</xsl:text> \r\n	</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"menu\">\r\n    <xsl:variable name=\"index\">\r\n    	<xsl:number level=\"single\" value=\"position()\" />\r\n    </xsl:variable>\r\n		<li>\r\n    <!--<xsl:if test=\"$index &lt; 7\">-->        \r\n          <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\" >\r\n               <xsl:value-of select=\"page-name\" />\r\n           </a>	   \r\n		   <br />\r\n		   <xsl:value-of select=\"page-description\" />\r\n		   <!--<xsl:value-of select=\"page-description\" /><br />-->		   			\r\n			<xsl:apply-templates select=\"sublevel-menu-list\" /> \r\n			\r\n		</li> 	\r\n    <!--</xsl:if>-->\r\n		\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu-list\" > \r\n	\r\n	<xsl:apply-templates select=\"sublevel-menu\" /> 	    	\r\n\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"sublevel-menu\">\r\n   <xsl:variable name=\"index_sous_menu\">\r\n         <xsl:number level=\"single\" value=\"position()\" />\r\n   </xsl:variable>\r\n		 <ul >\r\n			<li>\r\n<!--	<span> -->\r\n				<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n					<xsl:value-of select=\"page-name\" />\r\n				</a>\r\n			</li>			\r\n		</ul>\r\n	<!--</span>	-->\r\n		\r\n   \r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),(215,'Chemin page','page_path.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"page\">\r\n	<xsl:if test=\"position()=1\">\r\n		<li class=\"breadcrumb-item\">\r\n			<a href=\".\" target=\"_top\">Accueil</a>\r\n		</li>	\r\n	</xsl:if>\r\n	<xsl:if test=\"position()!=last()-1\">\r\n		<li class=\"breadcrumb-item\">\r\n			<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\"><xsl:value-of select=\"page-name\" /></a>\r\n		</li>	\r\n	</xsl:if>\r\n	<xsl:if test=\"position()=last()-1\">\r\n		<li class=\"breadcrumb-item active\" aria-current=\"page\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</li>\r\n	</xsl:if>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"page_link\">\r\n	<xsl:if test=\"position()=1\">\r\n		<li class=\"breadcrumb-item\">\r\n			<a href=\".\" target=\"_top\">Accueil</a>\r\n		</li>	\r\n	</xsl:if>\r\n	<xsl:if test=\"position()!=last()-1\">\r\n		<li class=\"breadcrumb-item\">\r\n			<a href=\"{$site-path}?{page-url}\" target=\"_top\"><xsl:value-of select=\"page-name\" /></a>\r\n		</li>	\r\n	</xsl:if>\r\n	<xsl:if test=\"position()=last()-1\">\r\n		<li class=\"breadcrumb-item active\" aria-current=\"page\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</li>\r\n	</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n</xsl:stylesheet>'),(213,'Menu principal','menu_main.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\"\r\n	xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n	<xsl:param name=\"site-path\" select=\"site-path\" />\r\n	<xsl:param name=\"current-page-id\" select=\"current-page-id\" />\r\n\r\n	<xsl:template match=\"menu-list\">\r\n		<xsl:apply-templates select=\"menu\" />\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"menu\">\r\n		<li>\r\n			<xsl:choose>\r\n				<xsl:when test=\"count(sublevel-menu-list/*) &gt; 0\">\r\n					<xsl:attribute name=\"class\">nav-item dropdown</xsl:attribute>\r\n					<a class=\"nav-link dropdown-toggle\" aria-label=\"{page-name}\" id=\"navbarMainMenuLink{page-id}\" title=\"{page-name}\" href=\"#\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\r\n						<xsl:value-of select=\"page-name\" />\r\n					</a> \r\n					<xsl:apply-templates select=\"sublevel-menu-list\" />\r\n				</xsl:when>	\r\n				<xsl:otherwise>\r\n					<xsl:attribute name=\"class\">\r\n						<xsl:choose>\r\n							<xsl:when test=\"page-id=current-page-id\">nav-item active</xsl:when>\r\n							<xsl:otherwise>nav-item</xsl:otherwise>\r\n						</xsl:choose>\r\n					</xsl:attribute>\r\n					<a class=\"nav-link\" aria-label=\"{page-name}\" title=\"{page-name}\" href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n						<xsl:attribute name=\"title\">\r\n							<xsl:choose>\r\n								<xsl:when test=\"page-id=current-page-id\"><xsl:value-of select=\"page-name\" /> - Rubrique Active</xsl:when>\r\n								<xsl:otherwise>\r\n									<xsl:value-of select=\"page-name\" /> \r\n								</xsl:otherwise>\r\n							</xsl:choose>\r\n						</xsl:attribute>\r\n						<xsl:attribute name=\"aria-label\">\r\n							<xsl:choose>\r\n								<xsl:when test=\"page-id=current-page-id\"><xsl:value-of select=\"page-name\" /> - Rubrique Active</xsl:when>\r\n								<xsl:otherwise><xsl:value-of select=\"page-name\" /></xsl:otherwise>\r\n							</xsl:choose>\r\n						</xsl:attribute>\r\n						<xsl:value-of select=\"page-name\" />\r\n					</a> \r\n				</xsl:otherwise>\r\n			</xsl:choose>	\r\n		</li>\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"sublevel-menu-list\">\r\n		<div class=\"dropdown-menu\" aria-labelledby=\"navbarMainMenuLink{../page-id}\">\r\n        	<xsl:apply-templates select=\"sublevel-menu\" />\r\n		</div>\r\n    </xsl:template>\r\n\r\n    <xsl:template match=\"sublevel-menu\">\r\n        <a href=\"{$site-path}?page_id={page-id}\" title=\"{page-name}\" target=\"_top\">\r\n			<xsl:attribute name=\"class\">\r\n				<xsl:choose>\r\n					<xsl:when test=\"page-id=../current-page-id\">dropdown-item active</xsl:when>\r\n					<xsl:otherwise>dropdown-item</xsl:otherwise>\r\n				</xsl:choose>\r\n			</xsl:attribute>\r\n			<xsl:attribute name=\"aria-label\">\r\n				<xsl:choose>\r\n					<xsl:when test=\"page-id=../current-page-id\"><xsl:value-of select=\"page-name\" /> - Rubrique Active</xsl:when>\r\n					<xsl:otherwise><xsl:value-of select=\"page-name\" /></xsl:otherwise>\r\n				</xsl:choose>\r\n			</xsl:attribute>\r\n            <span><xsl:value-of select=\"page-name\" /></span>\r\n        </a>\r\n    </xsl:template>   \r\n</xsl:stylesheet>'),(211,'Menu Init','menu_init.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"menu-list\">\r\n<br /><br />\r\n	<div id=\"menu-init\">\r\n		<div id=\"menu-init-content\">\r\n            <ul id=\"menu-verti\">\r\n                <xsl:apply-templates select=\"menu\" />\r\n            </ul>\r\n        </div>\r\n     </div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"menu\">\r\n    <xsl:variable name=\"index\">\r\n    	<xsl:number level=\"single\" value=\"position()\" />\r\n    </xsl:variable>\r\n\r\n    <xsl:if test=\"$index &gt; 7\">\r\n        <li class=\"first-verti\">\r\n        	<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n          		<xsl:value-of select=\"page-name\" />\r\n	        </a>\r\n    	    <xsl:apply-templates select=\"sublevel-menu-list\" />\r\n        </li>\r\n   </xsl:if>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu-list\" >\r\n	<ul>\r\n    	<li class=\"last-verti\">\r\n		 	<xsl:apply-templates select=\"sublevel-menu\" />\r\n 	    </li>\r\n    </ul>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu\">\r\n   <xsl:variable name=\"index_sous_menu\">\r\n         <xsl:number level=\"single\" value=\"position()\" />\r\n   </xsl:variable>\r\n\r\n   <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n		<span><xsl:value-of select=\"page-name\" /></span>\r\n   </a>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),(217,'Site Map','site_map.xsl',_binary '<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n    <xsl:param name=\"site-path\" select=\"site-path\" />\r\n    <xsl:template match=\"page[page-level=0]\">\r\n        <div class=\"container my-5 main-site-map\">\r\n            <div class=\"row\">\r\n                <div class=\"col\">\r\n                <xsl:apply-templates select=\"child-pages-list\" />\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </xsl:template>\r\n\r\n\r\n    <xsl:template match=\"page[page-level=1]\">\r\n        <ul class=\"list-unstyled site-map-level-one\">\r\n            <li>\r\n                <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n                    <i class=\"fa fa-map-marker\">&#160;</i> <xsl:value-of select=\"page-name\" />\r\n                </a>\r\n                <xsl:apply-templates select=\"page-description\" />\r\n                <xsl:apply-templates select=\"page-image\" />\r\n                <xsl:apply-templates select=\"child-pages-list\" />\r\n            </li>\r\n        </ul>\r\n    </xsl:template>\r\n\r\n\r\n    <xsl:template match=\"page[page-level=2]\">\r\n        <ul class=\"list-unstyled site-map-level-two\">\r\n            <li>\r\n                <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n                    <i class=\"fa fa-map-marker\">&#160;</i>  <xsl:value-of select=\"page-name\" />\r\n                </a>\r\n                <xsl:apply-templates select=\"page-description\" />\r\n                <xsl:apply-templates select=\"child-pages-list\" />\r\n            </li>\r\n        </ul>\r\n    </xsl:template>\r\n\r\n\r\n    <xsl:template match=\"page[page-level>2]\">\r\n        <ul class=\"site-map-level-highest\">\r\n            <li>\r\n                <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n                    <xsl:value-of select=\"page-name\" />\r\n                </a>\r\n                <xsl:apply-templates select=\"page-description\" />\r\n                <xsl:apply-templates select=\"child-pages-list\" />\r\n            </li>\r\n        </ul>\r\n    </xsl:template>\r\n\r\n\r\n    <xsl:template match=\"page-description\">\r\n        <p><xsl:value-of select=\".\" /></p>\r\n    </xsl:template>\r\n\r\n\r\n    <xsl:template match=\"child-pages-list[page-level=0]\">\r\n        <xsl:if test=\"count(page)>0\">\r\n            <xsl:apply-templates select=\"page\" />\r\n        </xsl:if>\r\n    </xsl:template>\r\n\r\n\r\n    <xsl:template match=\"child-pages-list[page-level=1]\">\r\n        <xsl:if test=\"count(page)>0\">\r\n            <xsl:apply-templates select=\"page\" />\r\n        </xsl:if>\r\n    </xsl:template>\r\n\r\n\r\n    <xsl:template match=\"child-pages-list[page-level=2]\">\r\n        <xsl:if test=\"count(page)>0\">\r\n            <xsl:apply-templates select=\"page\" />\r\n        </xsl:if>\r\n    </xsl:template>\r\n\r\n    <xsl:template match=\"child-pages-list[page-level>2]\">\r\n        <xsl:if test=\"count(page)>0\">\r\n            <xsl:apply-templates select=\"page\" />\r\n        </xsl:if>\r\n    </xsl:template>\r\n\r\n\r\n    <xsl:template match=\"page-image\">\r\n        <div class=\"level-one-image\">\r\n            <div class=\"polaroid\">\r\n                <img border=\"0\" width=\"80\" height=\"80\" src=\"images/local/data/pages/{.}\" alt=\"\" />\r\n            </div>\r\n        </div>\r\n    </xsl:template>\r\n\r\n\r\n</xsl:stylesheet>\r\n'),(279,'Site Map (Admin mode)','admin_site_map_admin.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n<xsl:variable name=\"current-page-id\" select=\"current-page-id\" />\r\n\r\n<xsl:template match=\"page[page-level=0]\"> \r\n	<div id=\"tree\" class=\"jstree-default\">\r\n		<a href=\"{$site-path}?page_id={page-id}\" title=\"{page-description}\" >\r\n			<xsl:value-of select=\"page-name\" />\r\n			<xsl:if test=\"not(string(page-role)=\'none\')\"> \r\n				<strong><xsl:text disable-output-escaping=\"yes\">- #i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text>\r\n				<xsl:value-of select=\"page-role\" /></strong>\r\n			</xsl:if>            \r\n		</a>\r\n		<ul>\r\n			<xsl:apply-templates select=\"child-pages-list\" />\r\n		</ul>\r\n	</div>\r\n</xsl:template>\r\n    \r\n<xsl:template match=\"page[page-level>0]\" >\r\n	<xsl:variable name=\"index\" select=\"page-id\" />\r\n	<xsl:variable name=\"description\" select=\"page-description\" />\r\n	\r\n	<li id=\"node-{$index}\">\r\n		<a href=\"{$site-path}?page_id={page-id}\" title=\"{$description}\">\r\n		<xsl:value-of select=\"page-name\" />\r\n			<xsl:if test=\"not(string(page-role)=\'none\')\">\r\n				<strong>\r\n				  <xsl:text disable-output-escaping=\"yes\">#i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text><xsl:value-of select=\"page-role\" />\r\n				</strong>\r\n			</xsl:if>\r\n		</a>\r\n		<xsl:choose>\r\n			<xsl:when test=\"count(child-pages-list/*)>0\">\r\n				<ul>\r\n				   <xsl:apply-templates select=\"child-pages-list\" />\r\n				</ul>\r\n			</xsl:when>\r\n		   <xsl:otherwise>\r\n				<xsl:apply-templates select=\"child-pages-list\" />\r\n		   </xsl:otherwise>\r\n		</xsl:choose>\r\n	</li>\r\n</xsl:template>\r\n    \r\n<xsl:template match=\"child-pages-list\">\r\n	<xsl:apply-templates select=\"page\" />\r\n</xsl:template>\r\n    \r\n</xsl:stylesheet>\r\n'),(10,'Rubrique HTML - DÃ©faut','portlet_html.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"html\" indent=\"yes\"/>\r\n\r\n<xsl:template match=\"portlet\">\r\n<xsl:variable name=\"device_class\">\r\n<xsl:choose>\r\n	<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n	<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n	<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n	<xsl:otherwise></xsl:otherwise>\r\n</xsl:choose>\r\n</xsl:variable>\r\n\r\n	<div class=\"portlet {$device_class}\">\r\n	<xsl:choose>\r\n	<xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n	<h3><xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" /></h3>\r\n	<xsl:apply-templates select=\"html-portlet\" />\r\n	</xsl:when>\r\n	<xsl:otherwise>\r\n	<xsl:apply-templates select=\"html-portlet\" />\r\n	</xsl:otherwise>\r\n</xsl:choose>\r\n</div>\r\n</xsl:template>\r\n	\r\n<xsl:template match=\"html-portlet\">\r\n	<xsl:apply-templates select=\"html-portlet-content\" />\r\n</xsl:template>\r\n	\r\n<xsl:template match=\"html-portlet-content\">\r\n	<xsl:value-of disable-output-escaping=\"yes\" select=\".\" />\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n\r\n\r\n\r\n\r\n'),(285,'Rubrique HTML - Fond colorÃ©','portlet_html_background.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:output method=\"html\" indent=\"yes\"/>\r\n\r\n<xsl:template match=\"portlet\">\r\n\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n		<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n	\r\n	<div class=\"portlet {$device_class}\">\r\n		<div class=\"well\">\r\n		<xsl:choose>\r\n			<xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n				<h2>\r\n					<xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" />\r\n				</h2>\r\n				<div class=\"portlet-background-content -lutece-border-radius-bottom\">\r\n					<xsl:apply-templates select=\"html-portlet\" />\r\n				</div>\r\n			</xsl:when>\r\n			<xsl:otherwise>\r\n				<div class=\"portlet-background-content -lutece-border-radius\">\r\n					<xsl:apply-templates select=\"html-portlet\" />\r\n				</div>\r\n			</xsl:otherwise>\r\n		</xsl:choose>\r\n		</div>\r\n    </div>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"html-portlet\">\r\n	<xsl:apply-templates select=\"html-portlet-content\" />\r\n</xsl:template>\r\n\r\n<xsl:template match=\"html-portlet-content\">\r\n	<xsl:value-of disable-output-escaping=\"yes\" select=\".\" />\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>'),(310,'Rubrique MyLutece - DÃ©faut','portlet_mylutece.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:template match=\"portlet\">\r\n\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n		<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n\r\n	<div class=\"portlet {$device_class}\">\r\n		<div class=\"well\">\r\n			<xsl:choose>\r\n	        <xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n				<h3><xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" /></h3>\r\n				<xsl:apply-templates select=\"mylutece-portlet\" />\r\n	        </xsl:when>\r\n	        <xsl:otherwise>\r\n				<xsl:apply-templates select=\"mylutece-portlet\" />\r\n	        </xsl:otherwise>\r\n			</xsl:choose>\r\n			<div class=\"clearfix\">&#160;</div>\r\n		</div>\r\n	</div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"mylutece-portlet\">\r\n	<xsl:apply-templates select=\"user-not-signed\" />\r\n	<xsl:apply-templates select=\"lutece-user\" />\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"user-not-signed\">\r\n	<form class=\"form\" action=\"jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp\" method=\"post\">\r\n		<xsl:apply-templates select=\"lutece-user-authentication-service[@delegated=\'true\']\" />\r\n		<xsl:apply-templates select=\"lutece-user-authentication-service[@loginpassword-required=\'true\']\" />\r\n		<xsl:if test=\"count(lutece-user-authentication-service[@loginpassword-required=\'true\']) &gt;= 1\">\r\n			<label for=\"username\">Code d\'acc&#232;s :</label>\r\n			<input name=\"username\" class=\"input-normal\" id=\"username\" autocomplete=\"off\" tabindex=\"1\" type=\"text\"/><br />\r\n			<label for=\"password\">Mot de passe :</label>\r\n			<input name=\"password\" class=\"input-normal\" id=\"password\" autocomplete=\"off\" tabindex=\"2\" type=\"password\" />\r\n			<button class=\"btn btn-small\" tabindex=\"3\" type=\"submit\"><i class=\"icon-user\">&#160;</i>&#160;Connexion</button>\r\n		</xsl:if>\r\n	</form>\r\n	<xsl:apply-templates select=\"lutece-user-new-account-url\" />\r\n	<xsl:apply-templates select=\"lutece-user-lost-password-url\" />\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-authentication-service[@loginpassword-required=\'true\']\">\r\n	<label class=\"radio\" for=\"auth_provider\" >\r\n		<input type=\"radio\" name=\"auth_provider\" value=\"{name}\" checked=\"checked\" />\r\n		<xsl:value-of select=\"display-name\" />\r\n	</label>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-authentication-service[@delegated=\'true\']\">\r\n	<a href=\"{url}?auth_provider={name}\">\r\n		<img src=\"{icon-url}\" alt=\"{display-name}\" title=\"{display-name}\"/>\r\n	</a>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user\">\r\n    <p>\r\n	<strong>Bienvenue&#160;\r\n		<xsl:value-of disable-output-escaping=\"yes\" select=\"lutece-user-name-given\" />&#160;\r\n		<xsl:value-of disable-output-escaping=\"yes\" select=\"lutece-user-name-family\" />\r\n	</strong>\r\n	</p>\r\n    <xsl:apply-templates select=\"lutece-user-logout-url\" />\r\n    <xsl:apply-templates select=\"lutece-user-view-account-url\" />\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-logout-url\">\r\n   <form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n   	<button type=\"submit\" class=\"btn\"><i class=\"icon-off\">&#160;</i>&#160;D&#233;connexion</button>&#160;\r\n   </form>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-new-account-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n		<button type=\"submit\" class=\"btn\"><i class=\"icon-plus\">&#160;</i>&#160;Cr&#233;er un compte</button>&#160;\r\n    </form>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-lost-password-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n	   	<button type=\"submit\" class=\"btn\"><i class=\"icon-lock\">&#160;</i>&#160;Mot de passe perdu</button>&#160;\r\n   </form>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-view-account-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n	   	<button type=\"submit\" class=\"btn\"><i class=\"icon-edit\">&#160;</i>&#160;Voir mon compte</button>&#160;\r\n	</form>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n\r\n');
/*!40000 ALTER TABLE `core_stylesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_template`
--

DROP TABLE IF EXISTS `core_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_template` (
  `template_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `template_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`template_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_template`
--

LOCK TABLES `core_template` WRITE;
/*!40000 ALTER TABLE `core_template` DISABLE KEYS */;
INSERT INTO `core_template` VALUES ('core_first_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive Ã  expiration. Pour prolonger sa validitÃ©, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera dÃ©sactivÃ©.'),('core_expiration_mail','Bonjour ${first_name} ! Votre compte a expirÃ©. Vous ne pourrez plus vous connecter avec, et les donnÃ©es vous concernant ont Ã©tÃ© anonymisÃ©es'),('core_other_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive Ã  expiration. Pour prolonger sa validitÃ©, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera dÃ©sactivÃ©.'),('core_account_reactivated_mail','Bonjour ${first_name} ! Votre compte utilisateur a bien Ã©tÃ© rÃ©activÃ©. Il est dÃ©sormais valable jusqu\'au ${date_valid}.'),('core_password_expired','Bonjour ! Votre mot de passe a expirÃ©. Lors de votre prochaine connexion, vous pourrez le changer.'),('mylutece_database_first_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive Ã  expiration. Pour prolonger sa validitÃ©, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera dÃ©sactivÃ©.'),('mylutece_database_expiration_mail','Bonjour ${first_name} ! Votre compte a expirÃ©. Vous ne pourrez plus vous connecter avec, et les donnÃ©es vous concernant ont Ã©tÃ© anonymisÃ©es'),('mylutece_database_other_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive Ã  expiration. Pour prolonger sa validitÃ©, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera dÃ©sactivÃ©.'),('mylutece_database_account_reactivated_mail','Bonjour ${first_name} ! Votre compte utilisateur a bien Ã©tÃ© rÃ©activÃ©. Il est dÃ©sormais valable jusqu\'au ${date_valid}.'),('mylutece_database_unblock_user','${site_link!}<br />Bonjour ! Votre IP a Ã©tÃ© bloquÃ©e. Pour la dÃ©bloquer, vous pouvez suivre le lien suivant : <a href=\"${url}\">debloquer</a>.'),('mylutece_database_password_expired','Bonjour ! Votre mot de passe a Ã©xpirÃ©. Lors de votre prochaine connection, vous pourrez le changer.'),('mylutece_database_mailLostPassword','<html><head><title>#i18n{mylutece.email_reinit.object}</title></head><body><p>#i18n{mylutece.email_reinit.content.text}<br /></p><p>#i18n{mylutece.email_reinit.content.newPassword} : ${new_password}<br /></p></body></html><p>#i18n{mylutece.email_reinit.content.reinitPassword}<a href=\"${reinit_url}\">#i18n{mylutece.email_reinit.content.labelLink}</a></p>'),('mylutece_database_mailPasswordEncryptionChanged','<html><head><title>Votre mot de passe a Ã©tÃ© rÃ©initialisÃ©</title></head><body><p>Pour des raisons de sÃ©curitÃ©, votre mot de passe a Ã©tÃ© rÃ©initialisÃ©.<br />----------------------------------------------------------</p><p>Votre nouveau mot de passe est : ${new_password}<br />----------------------------------------------------------</p></body></html>');
/*!40000 ALTER TABLE `core_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_text_editor`
--

DROP TABLE IF EXISTS `core_text_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_text_editor` (
  `editor_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `editor_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `backOffice` smallint NOT NULL,
  PRIMARY KEY (`editor_name`,`backOffice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_text_editor`
--

LOCK TABLES `core_text_editor` WRITE;
/*!40000 ALTER TABLE `core_text_editor` DISABLE KEYS */;
INSERT INTO `core_text_editor` VALUES ('tinymce','portal.admindashboard.editors.labelBackTinyMCE',1),('','portal.admindashboard.editors.labelBackNoEditor',1),('','portal.admindashboard.editors.labelFrontNoEditor',0),('markitupbbcode','portal.admindashboard.editors.labelFrontMarkitupBBCode',0);
/*!40000 ALTER TABLE `core_text_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_password_history`
--

DROP TABLE IF EXISTS `core_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_password_history` (
  `id_user` int NOT NULL,
  `password` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_password_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`date_password_change`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_password_history`
--

LOCK TABLES `core_user_password_history` WRITE;
/*!40000 ALTER TABLE `core_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_preferences`
--

DROP TABLE IF EXISTS `core_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_preferences` (
  `id_user` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_user_preferences` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_preferences`
--

LOCK TABLES `core_user_preferences` WRITE;
/*!40000 ALTER TABLE `core_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_right`
--

DROP TABLE IF EXISTS `core_user_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_right` (
  `id_right` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_right`,`id_user`),
  KEY `index_user_right` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_right`
--

LOCK TABLES `core_user_right` WRITE;
/*!40000 ALTER TABLE `core_user_right` DISABLE KEYS */;
INSERT INTO `core_user_right` VALUES ('BREADCRUMBACCORDION_MANAGEMENT',1),('BREADCRUMBACCORDION_MANAGEMENT',5),('CONFIG_DOCUMENT_PRODUCER_MANAGEMENT',1),('CONTACT_MANAGEMENT',1),('CONTACT_MANAGEMENT',5),('CORE_ADMIN_SITE',1),('CORE_ADMINDASHBOARD_MANAGEMENT',1),('CORE_CACHE_MANAGEMENT',1),('CORE_DAEMONS_MANAGEMENT',1),('CORE_DASHBOARD_MANAGEMENT',1),('CORE_EDITORS_MANAGEMENT',1),('CORE_FEATURES_MANAGEMENT',1),('CORE_LEVEL_RIGHT_MANAGEMENT',1),('CORE_LINK_SERVICE_MANAGEMENT',1),('CORE_LINK_SERVICE_MANAGEMENT',5),('CORE_LOGS_VISUALISATION',1),('CORE_LOGS_VISUALISATION',5),('CORE_MAILINGLISTS_MANAGEMENT',1),('CORE_MAILINGLISTS_MANAGEMENT',5),('CORE_MODES_MANAGEMENT',1),('CORE_PAGE_TEMPLATE_MANAGEMENT',1),('CORE_PLUGINS_MANAGEMENT',1),('CORE_PROPERTIES_MANAGEMENT',1),('CORE_RBAC_MANAGEMENT',1),('CORE_RIGHT_MANAGEMENT',1),('CORE_ROLES_MANAGEMENT',1),('CORE_ROLES_MANAGEMENT',5),('CORE_SEARCH_INDEXATION',1),('CORE_SEARCH_INDEXATION',5),('CORE_SEARCH_MANAGEMENT',1),('CORE_STYLES_MANAGEMENT',1),('CORE_STYLESHEET_MANAGEMENT',1),('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT',1),('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT',5),('CORE_USERS_MANAGEMENT',1),('CORE_USERS_MANAGEMENT',5),('CORE_WORKGROUPS_MANAGEMENT',1),('CORE_WORKGROUPS_MANAGEMENT',5),('CORE_XSL_EXPORT_MANAGEMENT',1),('DATABASE_GROUPS_MANAGEMENT',1),('DATABASE_MANAGEMENT_USERS',1),('DATABASE_MANAGEMENT_USERS',5),('ENTRY_TYPE_MANAGEMENT',1),('ENTRY_TYPE_MANAGEMENT',5),('FORMS_MANAGEMENT',1),('FORMS_MANAGEMENT',5),('FORMS_MULTIVIEW',1),('FORMS_MULTIVIEW',5),('HTMLPAGE_MANAGEMENT',1),('MATOMO_MANAGEMENT',1),('MYLUTECE_MANAGE_AUTHENTICATION_FILTER',1),('MYLUTECE_MANAGE_EXTERNAL_APPLICATION',1),('MYLUTECE_MANAGEMENT',1),('POLL_MANAGEMENT',1),('PROFILES_MANAGEMENT',1),('PROFILES_VIEWS_MANAGEMENT',1),('REFERENCELIST_MANAGEMENT',1),('REFERENCELIST_MANAGEMENT',5),('REGULAR_EXPRESSION_MANAGEMENT',1),('REGULAR_EXPRESSION_MANAGEMENT',5),('SEO_MANAGEMENT',1),('SYSTEMINFO_MANAGEMENT',1),('SYSTEMINFO_MANAGEMENT',5),('UNITS_MANAGEMENT',1),('UNITS_MANAGEMENT',5),('VIEW_TEMP_FILES',1),('VIEW_TEMP_FILES',5),('WORKFLOW_MANAGEMENT',1),('WORKFLOW_MANAGEMENT',5);
/*!40000 ALTER TABLE `core_user_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_role`
--

DROP TABLE IF EXISTS `core_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_role` (
  `role_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_role`
--

LOCK TABLES `core_user_role` WRITE;
/*!40000 ALTER TABLE `core_user_role` DISABLE KEYS */;
INSERT INTO `core_user_role` VALUES ('all_site_manager',1),('assign_groups',1),('assign_groups',5),('assign_roles',1),('assign_roles',5),('CREATE_REFERENCE_IMPORT',1),('CREATE_REFERENCE_IMPORT',5),('forms_manager',1),('forms_manager',5),('forms_multiview',1),('forms_multiview',5),('mylutece_database_manager',1),('mylutece_database_manager',5),('mylutece_manager',1),('profiles_manager',1),('profiles_views_manager',1),('super_admin',1),('unittree_management',1),('unittree_management',5),('workflow_manager',1),('workflow_manager',5);
/*!40000 ALTER TABLE `core_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_xsl_export`
--

DROP TABLE IF EXISTS `core_xsl_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_xsl_export` (
  `id_xsl_export` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_file` int DEFAULT NULL,
  `plugin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_xsl_export`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_xsl_export`
--

LOCK TABLES `core_xsl_export` WRITE;
/*!40000 ALTER TABLE `core_xsl_export` DISABLE KEYS */;
INSERT INTO `core_xsl_export` VALUES (125,'Core - Export users to a CSV file','Export back office users to a CSV file','csv',125,'core'),(126,'Core - Export users to a XML file','Export back office users to a XML file','xml',126,'core'),(127,'MyLutece Database - Export CSV des utilisateurs','Export des utilisateur MyLutece Database dans un fichier CSV','csv',127,'mylutece-database'),(128,'MyLutece Database - Export XML des utilisateurs','Export des utilisateur MyLutece Database dans un fichier XML','xml',128,'mylutece-database');
/*!40000 ALTER TABLE `core_xsl_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_client_crm_item`
--

DROP TABLE IF EXISTS `crm_client_crm_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_client_crm_item` (
  `id_crm_queue` int NOT NULL DEFAULT '0',
  `crm_item` mediumblob,
  PRIMARY KEY (`id_crm_queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_client_crm_item`
--

LOCK TABLES `crm_client_crm_item` WRITE;
/*!40000 ALTER TABLE `crm_client_crm_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_client_crm_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_client_crm_queue`
--

DROP TABLE IF EXISTS `crm_client_crm_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_client_crm_queue` (
  `id_crm_queue` int NOT NULL DEFAULT '0',
  `is_locked` smallint DEFAULT '0',
  PRIMARY KEY (`id_crm_queue`),
  KEY `is_locked_crm_client_crm_queue` (`is_locked`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_client_crm_queue`
--

LOCK TABLES `crm_client_crm_queue` WRITE;
/*!40000 ALTER TABLE `crm_client_crm_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_client_crm_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elastic_mapping`
--

DROP TABLE IF EXISTS `elastic_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elastic_mapping` (
  `id_mapping` int NOT NULL,
  `id_customer` int NOT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_mapping`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elastic_mapping`
--

LOCK TABLES `elastic_mapping` WRITE;
/*!40000 ALTER TABLE `elastic_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `elastic_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elasticdata_indexer_action`
--

DROP TABLE IF EXISTS `elasticdata_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elasticdata_indexer_action` (
  `id_action` int NOT NULL AUTO_INCREMENT,
  `id_resource` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_task` int NOT NULL DEFAULT '0',
  `id_datasource` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elasticdata_indexer_action`
--

LOCK TABLES `elasticdata_indexer_action` WRITE;
/*!40000 ALTER TABLE `elasticdata_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `elasticdata_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filegen_temporary_file`
--

DROP TABLE IF EXISTS `filegen_temporary_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filegen_temporary_file` (
  `id_file` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL DEFAULT '0',
  `title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `id_physical_file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filegen_temporary_file`
--

LOCK TABLES `filegen_temporary_file` WRITE;
/*!40000 ALTER TABLE `filegen_temporary_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `filegen_temporary_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_action`
--

DROP TABLE IF EXISTS `forms_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `name_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_permission` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `form_state` smallint DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_action`
--

LOCK TABLES `forms_action` WRITE;
/*!40000 ALTER TABLE `forms_action` DISABLE KEYS */;
INSERT INTO `forms_action` VALUES (1,'forms.action.modify.name','forms.action.modify.description','jsp/admin/plugins/forms/ManageForms.jsp?view=modifyForm','cog','MODIFY',0),(3,'forms.action.params.name','forms.action.params.description','jsp/admin/plugins/forms/ManageSteps.jsp?view=manageSteps','step-forward','PARAM',0),(2,'forms.action.delete.name','forms.action.delete.description','jsp/admin/plugins/forms/ManageForms.jsp?view=confirmRemoveForm','trash','DELETE',0),(4,'forms.action.publish.name','forms.action.publish.description','jsp/admin/plugins/forms/ManageForms.jsp?view=modifyPublication','calendar','PUBLISH',0),(5,'forms.action.viewResponses.name','forms.action.viewResponses.description','jsp/admin/plugins/forms/MultiviewForms.jsp?current_selected_panel=forms','list-alt','VIEW_FORM_RESPONSE',0),(6,'forms.action.json.copy.name','forms.json.copy.description','jsp/admin/plugins/forms/ManageForms.jsp?action=duplicateForm','copy','MODIFY',0),(7,'forms.action.json.download.name','forms.json.download.description','jsp/admin/plugins/forms/ManageForms.jsp?action=doExportJson','download','MODIFY',0),(100,'module.forms.documentproducer.actions.extractpdf.name','module.forms.documentproducer.actions.extractpdf.description','jsp/admin/plugins/forms/modules/documentproducer/ManageConfigProducer.jsp?view=getManageConfigProducer','file-pdf-o','MODIFY',0);
/*!40000 ALTER TABLE `forms_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_breadcrumbaccordion_config_item`
--

DROP TABLE IF EXISTS `forms_breadcrumbaccordion_config_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_breadcrumbaccordion_config_item` (
  `id_form` int NOT NULL DEFAULT '0',
  `id_step` int NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_form`,`id_step`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_breadcrumbaccordion_config_item`
--

LOCK TABLES `forms_breadcrumbaccordion_config_item` WRITE;
/*!40000 ALTER TABLE `forms_breadcrumbaccordion_config_item` DISABLE KEYS */;
INSERT INTO `forms_breadcrumbaccordion_config_item` VALUES (1,4,4),(1,3,3),(1,2,2),(1,1,1);
/*!40000 ALTER TABLE `forms_breadcrumbaccordion_config_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_config_producer`
--

DROP TABLE IF EXISTS `forms_config_producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_config_producer` (
  `id_config` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_question_name_file` int DEFAULT NULL,
  `id_form` int DEFAULT NULL,
  `config_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `text_file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type_config_file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `extract_empty` int DEFAULT '0',
  PRIMARY KEY (`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_config_producer`
--

LOCK TABLES `forms_config_producer` WRITE;
/*!40000 ALTER TABLE `forms_config_producer` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_config_producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_config_question`
--

DROP TABLE IF EXISTS `forms_config_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_config_question` (
  `id_config` int NOT NULL,
  `id_question` int NOT NULL,
  PRIMARY KEY (`id_config`,`id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_config_question`
--

LOCK TABLES `forms_config_question` WRITE;
/*!40000 ALTER TABLE `forms_config_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_config_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_control`
--

DROP TABLE IF EXISTS `forms_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_control` (
  `id_control` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `error_message` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `validator_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `control_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_control_target` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_control`),
  KEY `index_fc_id_control_target` (`id_control_target`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_control`
--

LOCK TABLES `forms_control` WRITE;
/*!40000 ALTER TABLE `forms_control` DISABLE KEYS */;
INSERT INTO `forms_control` VALUES (1,'125',NULL,'forms.listValueValidator','conditional',22);
/*!40000 ALTER TABLE `forms_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_control_question`
--

DROP TABLE IF EXISTS `forms_control_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_control_question` (
  `id_control` int NOT NULL,
  `id_question` int NOT NULL,
  PRIMARY KEY (`id_control`,`id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_control_question`
--

LOCK TABLES `forms_control_question` WRITE;
/*!40000 ALTER TABLE `forms_control_question` DISABLE KEYS */;
INSERT INTO `forms_control_question` VALUES (1,14);
/*!40000 ALTER TABLE `forms_control_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_control_question_mapping`
--

DROP TABLE IF EXISTS `forms_control_question_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_control_question_mapping` (
  `id_control` int NOT NULL,
  `id_question` int NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_control`,`id_question`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_control_question_mapping`
--

LOCK TABLES `forms_control_question_mapping` WRITE;
/*!40000 ALTER TABLE `forms_control_question_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_control_question_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_default_config`
--

DROP TABLE IF EXISTS `forms_default_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_default_config` (
  `id_config` int NOT NULL,
  `id_form` int NOT NULL,
  `config_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_config`,`id_form`,`config_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_default_config`
--

LOCK TABLES `forms_default_config` WRITE;
/*!40000 ALTER TABLE `forms_default_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_default_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_display`
--

DROP TABLE IF EXISTS `forms_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_display` (
  `id_display` int NOT NULL AUTO_INCREMENT,
  `id_form` int DEFAULT '0',
  `id_step` int DEFAULT '0',
  `id_composite` int DEFAULT '0',
  `id_parent` int DEFAULT '0',
  `display_order` int DEFAULT '0',
  `composite_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `display_depth` int DEFAULT '0',
  PRIMARY KEY (`id_display`),
  KEY `index_fd_id_form` (`id_form`),
  KEY `index_fd_id_step` (`id_step`),
  KEY `index_fd_id_composite` (`id_composite`),
  KEY `index_fd_id_parent` (`id_parent`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_display`
--

LOCK TABLES `forms_display` WRITE;
/*!40000 ALTER TABLE `forms_display` DISABLE KEYS */;
INSERT INTO `forms_display` VALUES (1,1,1,1,0,1,'group',0),(2,1,1,1,1,1,'question',1),(3,1,1,2,1,2,'question',1),(4,1,2,2,0,1,'group',0),(5,1,2,3,4,1,'question',1),(12,1,2,8,4,2,'question',1),(13,1,2,9,4,3,'question',1),(14,1,2,10,4,4,'question',1),(15,1,3,5,0,1,'group',0),(16,1,3,11,15,1,'question',1),(17,1,3,12,15,2,'question',1),(18,1,3,13,0,2,'question',0),(19,1,4,14,0,1,'question',0),(20,1,2,15,0,2,'question',0),(21,1,2,16,0,3,'question',0),(22,1,4,17,0,2,'question',0),(24,1,3,19,15,3,'question',1);
/*!40000 ALTER TABLE `forms_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_export_config`
--

DROP TABLE IF EXISTS `forms_export_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_export_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_form` int DEFAULT NULL,
  `field` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `display_order` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_export_config`
--

LOCK TABLES `forms_export_config` WRITE;
/*!40000 ALTER TABLE `forms_export_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_export_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_form`
--

DROP TABLE IF EXISTS `forms_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_form` (
  `id_form` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT '1979-12-31 23:00:00',
  `availability_start_date` timestamp NULL DEFAULT NULL,
  `availability_end_date` timestamp NULL DEFAULT NULL,
  `max_number_response` int DEFAULT '0',
  `workgroup` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_workflow` int DEFAULT NULL,
  `authentification_needed` smallint DEFAULT NULL,
  `one_response_by_user` smallint DEFAULT '0',
  `breadcrumb_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `display_summary` smallint NOT NULL DEFAULT '0',
  `return_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `captcha_step_initial` smallint DEFAULT '0',
  `captcha_step_final` smallint DEFAULT '0',
  `captcha_recap` smallint DEFAULT '0',
  `count_responses` smallint DEFAULT '0',
  `label_final_button` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `unavailable_message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_logo` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_form`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_form`
--

LOCK TABLES `forms_form` WRITE;
/*!40000 ALTER TABLE `forms_form` DISABLE KEYS */;
INSERT INTO `forms_form` VALUES (1,'Citizen\'s demand','','2022-02-18 15:57:09','2022-02-21 15:39:39','2022-02-17 11:00:00','2022-03-31 10:00:00',0,NULL,0,0,1,'forms-breadcrumbaccordion.breadcrumbAccordion',1,'jsp/site/Portal.jsp',0,0,0,0,'','',0);
/*!40000 ALTER TABLE `forms_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_global_action`
--

DROP TABLE IF EXISTS `forms_global_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_global_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_action`),
  KEY `index_fga_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_global_action`
--

LOCK TABLES `forms_global_action` WRITE;
/*!40000 ALTER TABLE `forms_global_action` DISABLE KEYS */;
INSERT INTO `forms_global_action` VALUES (1,'multiviewconfig','forms.action.multiviewConfig.labelKey','forms.action.multiviewConfig.descriptionKey','jsp/admin/plugins/forms/MultiviewForms.jsp?view=view_multiview_config','edit'),(2,'multiviewExport','forms.action.multiviewExport.labelKey','forms.action.multiviewExport.descriptionKey','jsp/admin/plugins/forms/MultiviewForms.jsp','edit');
/*!40000 ALTER TABLE `forms_global_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_group`
--

DROP TABLE IF EXISTS `forms_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_group` (
  `id_group` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `id_step` int DEFAULT '0',
  `iteration_min` int DEFAULT '1',
  `iteration_max` int DEFAULT '1',
  `iteration_add_label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `iteration_remove_label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_group`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_group`
--

LOCK TABLES `forms_group` WRITE;
/*!40000 ALTER TABLE `forms_group` DISABLE KEYS */;
INSERT INTO `forms_group` VALUES (1,'Informations','',1,1,1,'',''),(2,'Etat Civil','',2,1,1,'',''),(5,'My demand','',3,1,3,'Add a demand','Remove my demand');
/*!40000 ALTER TABLE `forms_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_indexer_action`
--

DROP TABLE IF EXISTS `forms_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_indexer_action` (
  `id_action` int NOT NULL AUTO_INCREMENT,
  `id_form_response` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`),
  KEY `idx_fia_id_form_response` (`id_form_response`),
  KEY `idx_fia_id_task` (`id_task`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_indexer_action`
--

LOCK TABLES `forms_indexer_action` WRITE;
/*!40000 ALTER TABLE `forms_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_message`
--

DROP TABLE IF EXISTS `forms_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_form` int NOT NULL,
  `end_message_display` smallint DEFAULT NULL,
  `end_message` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_fm_id_form` (`id_form`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_message`
--

LOCK TABLES `forms_message` WRITE;
/*!40000 ALTER TABLE `forms_message` DISABLE KEYS */;
INSERT INTO `forms_message` VALUES (1,1,1,'Authoritatively reinvent just in time schemas with proactive resources. Credibly drive vertical bandwidth and alternative initiatives. Monotonectally evolve front-end e-services without compelling outsourcing. Progressively deliver viral vortals for client-centric opportunities. Continually fashion multimedia based bandwidth after principle-centered expertise.<br /><br />Progressively synthesize cross-platform content with covalent initiatives. Completely provide access to resource sucking methods of empowerment with robust supply chains. Conveniently syndicate client-focused applications with adaptive.');
/*!40000 ALTER TABLE `forms_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_question`
--

DROP TABLE IF EXISTS `forms_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_question` (
  `id_question` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `id_entry` int DEFAULT '0',
  `id_step` int DEFAULT '0',
  `is_visible_multiview_global` smallint NOT NULL DEFAULT '0',
  `is_visible_multiview_form_selected` smallint NOT NULL DEFAULT '0',
  `multiview_column_order` int NOT NULL DEFAULT '0',
  `column_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `is_filterable_multiview_global` smallint NOT NULL DEFAULT '0',
  `is_filterable_multiview_form_selected` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_question`),
  KEY `index_fq_code` (`code`),
  KEY `index_fq_id_entry` (`id_entry`),
  KEY `index_fq_id_step` (`id_step`),
  KEY `index_fg_id_step` (`id_step`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_question`
--

LOCK TABLES `forms_question` WRITE;
/*!40000 ALTER TABLE `forms_question` DISABLE KEYS */;
INSERT INTO `forms_question` VALUES (1,'commentaire','question_1','<p>Distinctively foster equity invested initiatives without business e-commerce. Compellingly benchmark client-centered supply chains and business information. Compellingly re-engineer process-centric resources via team driven intellectual capital. Uniquely innovate team driven products and stand-alone communities. Assertively enable web-enabled web services for plug-and-play information.</p>\r\n<p>Dynamically negotiate competitive strategic theme areas before seamless initiatives. Objectively matrix exceptional innovation and highly efficient e-commerce. Continually aggregate process-centric architectures whereas web-enabled communities. Compellingly extend emerging ideas without market-driven customer service. Compellingly syndicate B2C products vis-a-vis high-payoff methods of empowerment.</p>\r\n<p>Synergistically mesh sustainable e-business vis-a-vis unique niches. Compellingly negotiate cutting-edge e-tailers via just in time opportunities. Interactively brand client-centered growth strategies before flexible results. Dramatically grow e-business infrastructures for extensible schemas. Continually orchestrate.</p>\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -52px; top: -17px;\">&nbsp;</div>',1,1,0,0,0,'commentaire',0,0),(2,'Accepter les conditions !!!','question_2',NULL,2,1,0,0,0,'Accepter les conditions !!!',0,0),(3,'Name','question_3','',3,2,0,0,0,'Name',0,0),(8,'Resume','question_8','',8,2,0,0,0,'Resume',0,0),(9,'Birth date','question_9','',9,2,0,0,0,'Birth date',0,0),(10,'Gender','question_10','',10,2,0,0,0,'Gender',0,0),(11,'Demand\'s type','question_11','',11,3,1,0,0,'Type',1,0),(12,'Add a file to your demand','question_12','',12,3,0,0,0,'Add a file to your demand',0,0),(13,'Add a location','question_13','',13,3,0,0,0,'Add a location',0,0),(14,'Anything else to add ?','question_14','',14,4,0,0,0,'Anything else to add ?',0,0),(15,'Email','question_15','',15,2,0,0,0,'Email',0,0),(16,'Add your phone','question_16','',16,2,0,0,0,'Add your phone',0,0),(17,'Someting to say','question_17','',17,4,0,0,0,'Someting to say',0,0),(19,'Number of people concerned','question_19','',19,3,0,0,0,'Number of people concerned',0,0);
/*!40000 ALTER TABLE `forms_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_question_entry_response`
--

DROP TABLE IF EXISTS `forms_question_entry_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_question_entry_response` (
  `id_question_entry_response` int NOT NULL AUTO_INCREMENT,
  `id_question_response` int NOT NULL DEFAULT '0',
  `id_entry_response` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_question_entry_response`),
  KEY `idx_fqer_id_question_response` (`id_question_response`),
  KEY `idx_fqer_id_entry_response` (`id_entry_response`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_question_entry_response`
--

LOCK TABLES `forms_question_entry_response` WRITE;
/*!40000 ALTER TABLE `forms_question_entry_response` DISABLE KEYS */;
INSERT INTO `forms_question_entry_response` VALUES (1,2,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,11,10),(11,11,11),(12,11,12),(13,11,13),(14,11,14),(15,11,15),(16,12,16),(17,13,17),(18,15,18),(19,15,19),(20,16,20),(21,17,21),(22,18,22),(23,19,23),(24,20,24),(25,21,25),(26,22,26),(27,24,27),(28,24,28),(29,24,29),(30,24,30),(31,24,31),(32,24,32),(33,25,33),(34,27,34),(35,27,35),(36,28,36),(37,29,37),(38,30,38),(39,31,39),(40,32,40),(41,33,41),(42,34,42),(43,36,43),(44,36,44),(45,36,45),(46,36,46),(47,36,47),(48,36,48),(49,37,49),(50,39,50),(51,39,51),(52,40,52),(53,41,53),(54,42,54),(55,43,55),(56,44,56),(57,45,57),(58,46,58),(59,48,59),(60,48,60),(61,48,61),(62,48,62),(63,48,63),(64,48,64),(65,49,65),(66,51,66),(67,51,67),(68,52,68),(69,53,69),(70,54,70),(71,55,71),(72,57,72),(73,58,73),(74,59,74),(75,60,75),(76,60,76),(77,60,77),(78,60,78),(79,60,79),(80,60,80),(81,61,81),(82,62,82),(83,63,83),(84,63,84),(85,63,85),(86,63,86),(87,63,87),(88,63,88),(89,64,89),(90,65,90),(91,67,91),(92,67,92),(93,68,93),(94,69,94),(95,70,95),(96,71,96),(97,73,97),(98,74,98),(99,76,99),(100,76,100),(101,76,101),(102,76,102),(103,76,103),(104,76,104),(105,77,105);
/*!40000 ALTER TABLE `forms_question_entry_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_question_response`
--

DROP TABLE IF EXISTS `forms_question_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_question_response` (
  `id_question_response` int NOT NULL AUTO_INCREMENT,
  `id_form_response` int NOT NULL DEFAULT '0',
  `id_question` int NOT NULL DEFAULT '0',
  `id_step` int NOT NULL DEFAULT '0',
  `iteration_number` int DEFAULT '0',
  PRIMARY KEY (`id_question_response`),
  KEY `idx_fqr_id_form_response` (`id_form_response`),
  KEY `idx_fqr_id_question` (`id_question`),
  KEY `idx_fqr_id_step` (`id_step`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_question_response`
--

LOCK TABLES `forms_question_response` WRITE;
/*!40000 ALTER TABLE `forms_question_response` DISABLE KEYS */;
INSERT INTO `forms_question_response` VALUES (1,1,1,1,0),(2,1,2,1,0),(3,1,3,2,0),(4,1,8,2,0),(5,1,9,2,0),(6,1,10,2,0),(7,1,15,2,0),(8,1,16,2,0),(9,1,11,3,0),(10,1,12,3,0),(11,1,13,3,0),(12,1,14,4,0),(13,1,17,4,0),(14,2,1,1,0),(15,2,2,1,0),(16,2,3,2,0),(17,2,8,2,0),(18,2,9,2,0),(19,2,10,2,0),(20,2,15,2,0),(21,2,16,2,0),(22,2,11,3,0),(23,2,12,3,0),(24,2,13,3,0),(25,2,14,4,0),(26,3,1,1,0),(27,3,2,1,0),(28,3,3,2,0),(29,3,8,2,0),(30,3,9,2,0),(31,3,10,2,0),(32,3,15,2,0),(33,3,16,2,0),(34,3,11,3,0),(35,3,12,3,0),(36,3,13,3,0),(37,3,14,4,0),(38,4,1,1,0),(39,4,2,1,0),(40,4,3,2,0),(41,4,8,2,0),(42,4,9,2,0),(43,4,10,2,0),(44,4,15,2,0),(45,4,16,2,0),(46,4,11,3,0),(47,4,12,3,0),(48,4,13,3,0),(49,4,14,4,0),(50,5,1,1,0),(51,5,2,1,0),(52,5,3,2,0),(53,5,8,2,0),(54,5,9,2,0),(55,5,10,2,0),(56,5,15,2,0),(57,5,16,2,0),(58,5,11,3,0),(59,5,12,3,0),(60,5,13,3,0),(61,5,11,3,1),(62,5,12,3,1),(63,5,13,3,1),(64,5,14,4,0),(65,5,17,4,0),(66,6,1,1,0),(67,6,2,1,0),(68,6,3,2,0),(69,6,8,2,0),(70,6,9,2,0),(71,6,10,2,0),(72,6,15,2,0),(73,6,16,2,0),(74,6,11,3,0),(75,6,12,3,0),(76,6,13,3,0),(77,6,14,4,0);
/*!40000 ALTER TABLE `forms_question_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_response`
--

DROP TABLE IF EXISTS `forms_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_response` (
  `id_response` int NOT NULL AUTO_INCREMENT,
  `id_form` int NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT '1979-12-31 23:00:00',
  `from_save` smallint DEFAULT '0',
  PRIMARY KEY (`id_response`),
  KEY `idx_fr_id_form` (`id_form`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_response`
--

LOCK TABLES `forms_response` WRITE;
/*!40000 ALTER TABLE `forms_response` DISABLE KEYS */;
INSERT INTO `forms_response` VALUES (1,1,NULL,'2022-02-21 10:52:59','2022-02-21 10:52:59',0),(2,1,NULL,'2022-02-21 10:54:31','2022-02-21 10:54:31',0),(3,1,NULL,'2022-02-21 10:56:39','2022-02-21 10:56:39',0),(4,1,NULL,'2022-02-21 10:57:31','2022-02-21 10:57:31',0),(5,1,NULL,'2022-02-21 15:36:05','2022-02-21 15:36:05',0),(6,1,NULL,'2022-02-21 15:39:13','2022-02-21 15:39:13',0);
/*!40000 ALTER TABLE `forms_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_response_step`
--

DROP TABLE IF EXISTS `forms_response_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_response_step` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_form_response` int NOT NULL DEFAULT '0',
  `id_step` int NOT NULL DEFAULT '0',
  `order_response` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_frs_id_form_response` (`id_form_response`),
  KEY `idx_frs_id_step` (`id_step`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_response_step`
--

LOCK TABLES `forms_response_step` WRITE;
/*!40000 ALTER TABLE `forms_response_step` DISABLE KEYS */;
INSERT INTO `forms_response_step` VALUES (1,1,1,0),(2,1,2,1),(3,1,3,2),(4,1,4,3),(5,2,1,0),(6,2,2,1),(7,2,3,2),(8,2,4,3),(9,3,1,0),(10,3,2,1),(11,3,3,2),(12,3,4,3),(13,4,1,0),(14,4,2,1),(15,4,3,2),(16,4,4,3),(17,5,1,0),(18,5,2,1),(19,5,3,2),(20,5,4,3),(21,6,1,0),(22,6,2,1),(23,6,3,2),(24,6,4,3);
/*!40000 ALTER TABLE `forms_response_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_step`
--

DROP TABLE IF EXISTS `forms_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_step` (
  `id_step` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `id_form` int NOT NULL DEFAULT '0',
  `is_initial` smallint NOT NULL DEFAULT '0',
  `is_final` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_step`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_step`
--

LOCK TABLES `forms_step` WRITE;
/*!40000 ALTER TABLE `forms_step` DISABLE KEYS */;
INSERT INTO `forms_step` VALUES (1,'Introduction','',1,1,0),(2,'Citizen\'s informations','',1,0,0),(3,'Demand','',1,0,0),(4,'Complementary informations','',1,0,1);
/*!40000 ALTER TABLE `forms_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_transition`
--

DROP TABLE IF EXISTS `forms_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_transition` (
  `id_transition` int NOT NULL AUTO_INCREMENT,
  `from_step` int NOT NULL,
  `next_step` int NOT NULL,
  `priority` int DEFAULT '0',
  PRIMARY KEY (`id_transition`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_transition`
--

LOCK TABLES `forms_transition` WRITE;
/*!40000 ALTER TABLE `forms_transition` DISABLE KEYS */;
INSERT INTO `forms_transition` VALUES (1,1,2,1),(2,2,3,1),(3,3,4,1);
/*!40000 ALTER TABLE `forms_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_unittree_unit_selection_config`
--

DROP TABLE IF EXISTS `forms_unittree_unit_selection_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_unittree_unit_selection_config` (
  `id_config` int NOT NULL AUTO_INCREMENT,
  `id_form` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_unittree_unit_selection_config`
--

LOCK TABLES `forms_unittree_unit_selection_config` WRITE;
/*!40000 ALTER TABLE `forms_unittree_unit_selection_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_unittree_unit_selection_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms_unittree_unit_selection_config_value`
--

DROP TABLE IF EXISTS `forms_unittree_unit_selection_config_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms_unittree_unit_selection_config_value` (
  `id_config_value` int NOT NULL AUTO_INCREMENT,
  `id_config` int NOT NULL DEFAULT '0',
  `id_step` int NOT NULL DEFAULT '0',
  `id_question` int NOT NULL DEFAULT '0',
  `response_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_unit` int NOT NULL DEFAULT '0',
  `id_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_config_value`),
  KEY `index_unit_selection_conf_value` (`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms_unittree_unit_selection_config_value`
--

LOCK TABLES `forms_unittree_unit_selection_config_value` WRITE;
/*!40000 ALTER TABLE `forms_unittree_unit_selection_config_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms_unittree_unit_selection_config_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_entry`
--

DROP TABLE IF EXISTS `genatt_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_entry` (
  `id_entry` int NOT NULL AUTO_INCREMENT,
  `id_resource` int NOT NULL DEFAULT '0',
  `resource_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_type` int NOT NULL DEFAULT '0',
  `id_parent` int DEFAULT NULL,
  `title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `help_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `comment` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `mandatory` smallint DEFAULT NULL,
  `fields_in_line` smallint DEFAULT NULL,
  `pos` int DEFAULT NULL,
  `id_field_depend` int DEFAULT NULL,
  `field_unique` smallint DEFAULT NULL,
  `css_class` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pos_conditional` int DEFAULT '0',
  `error_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_only_display_back` smallint DEFAULT '0',
  `is_indexed` smallint DEFAULT '0',
  PRIMARY KEY (`id_entry`),
  KEY `index_genatt_entry_resource` (`id_resource`),
  KEY `index_genatt_entry_parent` (`id_parent`),
  KEY `index_genatt_code` (`code`),
  KEY `fk_genatt_entry_type` (`id_type`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_entry`
--

LOCK TABLES `genatt_entry` WRITE;
/*!40000 ALTER TABLE `genatt_entry` DISABLE KEYS */;
INSERT INTO `genatt_entry` VALUES (1,1,'FORMS_FORM',103,NULL,NULL,'question_1',NULL,'<p>Distinctively foster equity invested initiatives without business e-commerce. Compellingly benchmark client-centered supply chains and business information. Compellingly re-engineer process-centric resources via team driven intellectual capital. Uniquely innovate team driven products and stand-alone communities. Assertively enable web-enabled web services for plug-and-play information.</p>\r\n<p>Dynamically negotiate competitive strategic theme areas before seamless initiatives. Objectively matrix exceptional innovation and highly efficient e-commerce. Continually aggregate process-centric architectures whereas web-enabled communities. Compellingly extend emerging ideas without market-driven customer service. Compellingly syndicate B2C products vis-a-vis high-payoff methods of empowerment.</p>\r\n<p>Synergistically mesh sustainable e-business vis-a-vis unique niches. Compellingly negotiate cutting-edge e-tailers via just in time opportunities. Interactively brand client-centered growth strategies before flexible results. Dramatically grow e-business infrastructures for extensible schemas. Continually orchestrate.</p>\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -52px; top: -17px;\">&nbsp;</div>',0,0,0,NULL,0,'',0,NULL,0,0),(2,1,'FORMS_FORM',116,NULL,'Accepter les conditions !!!','question_2',NULL,NULL,0,0,0,NULL,0,'',0,NULL,0,0),(3,1,'FORMS_FORM',106,NULL,'Name','question_3','','',0,0,0,NULL,0,'',0,'',0,1),(8,1,'FORMS_FORM',107,NULL,'Resume','question_8','','',0,0,0,NULL,0,'',0,NULL,0,1),(9,1,'FORMS_FORM',104,NULL,'Birth date','question_9','','',0,0,0,NULL,0,'',0,NULL,0,1),(10,1,'FORMS_FORM',101,NULL,'Gender','question_10','','',0,1,0,NULL,0,'',0,NULL,0,0),(11,1,'FORMS_FORM',105,NULL,'Demand\'s type','question_11','','',1,0,0,NULL,0,'',0,NULL,0,1),(12,1,'FORMS_FORM',108,NULL,'Add a file to your demand','question_12','','',0,0,0,NULL,0,'',0,NULL,0,0),(13,1,'FORMS_FORM',109,NULL,'Add a location','question_13','','',0,0,0,NULL,0,' ',0,NULL,0,1),(14,1,'FORMS_FORM',101,NULL,'Anything else to add ?','question_14','','',1,1,0,NULL,0,'',0,NULL,0,0),(15,1,'FORMS_FORM',113,NULL,'Email','question_15','','',0,0,0,NULL,0,'',0,NULL,0,1),(16,1,'FORMS_FORM',119,NULL,'Add your phone','question_16','If you want to be contact by our services','',0,0,0,NULL,0,'',0,'',0,1),(17,1,'FORMS_FORM',107,NULL,'Someting to say','question_17','','',0,0,0,NULL,0,'',0,NULL,0,1),(19,1,'FORMS_FORM',120,NULL,'Number of people concerned','question_19','','',0,0,0,NULL,0,'w-25',0,'',0,1);
/*!40000 ALTER TABLE `genatt_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_entry_type`
--

DROP TABLE IF EXISTS `genatt_entry_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_entry_type` (
  `id_type` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_group` smallint DEFAULT NULL,
  `is_comment` int DEFAULT NULL,
  `is_mylutece_user` smallint DEFAULT NULL,
  `class_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `plugin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `display_order` int DEFAULT '0',
  `inactive` int DEFAULT '0',
  PRIMARY KEY (`id_type`),
  KEY `index_genatt_entry_type_plugin` (`plugin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_entry_type`
--

LOCK TABLES `genatt_entry_type` WRITE;
/*!40000 ALTER TABLE `genatt_entry_type` DISABLE KEYS */;
INSERT INTO `genatt_entry_type` VALUES (101,'Bouton radio',0,0,0,'forms.entryTypeRadioButton','dot-circle','forms',5,0),(102,'Case Ã  cocher',0,0,0,'forms.entryTypeCheckBox','check-square','forms',6,0),(103,'Commentaire',0,1,0,'forms.entryTypeComment','comment','forms',11,0),(104,'Date',0,0,0,'forms.entryTypeDate','calendar','forms',4,0),(105,'Liste dÃ©roulante',0,0,0,'forms.entryTypeSelect','list-alt','forms',7,0),(106,'Zone de texte court',0,0,0,'forms.entryTypeText','file-alt','forms',2,0),(107,'Zone de texte long',0,0,0,'forms.entryTypeTextArea','sticky-note','forms',3,0),(108,'Fichier',0,0,0,'forms.entryTypeFile','file','forms',9,0),(109,'GÃ©olocalisation',0,0,0,'forms.entryTypeGeolocation','map-marked-alt','forms',16,0),(110,'Image',0,0,0,'forms.entryTypeImage','image','forms',10,1),(111,'Utilisateur MyLutece',0,0,1,'forms.entryTypeMyLuteceUser','user','forms',13,1),(112,'NumÃ©rotation',0,0,0,'forms.entryTypeNumbering','hashtag','forms',8,0),(113,'Attribut de l\'utilisateur MyLutece',0,0,0,'forms.entryTypeMyLuteceUserattribute','user','forms',14,0),(114,'Tableau',0,0,0,'forms.entryTypeArray','table','forms',17,1),(115,'Regroupement',1,0,0,'forms.entryTypeGroup','indent','forms',1,0),(116,'Conditions d\'utilisation',0,0,0,'forms.entryTypeTermsOfService','gavel','forms',12,0),(117,'Lecture automatique fichier (OCR)',0,0,0,'forms.entryTypeAutomaticFileReading','file','forms',18,1),(118,'Camera',0,0,0,'forms.entryTypeCamera','camera','forms',15,1),(119,'NumÃ©ro de tÃ©lÃ©phone',0,0,0,'forms.entryTypeTelephoneNumber','phone-square','forms',19,0),(120,'Nombre',0,0,0,'forms.entryTypeNumber','hashtag','forms',5,0);
/*!40000 ALTER TABLE `genatt_entry_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_field`
--

DROP TABLE IF EXISTS `genatt_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_field` (
  `id_field` int NOT NULL AUTO_INCREMENT,
  `id_entry` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `default_value` smallint DEFAULT NULL,
  `pos` int DEFAULT NULL,
  `value_type_date` date DEFAULT NULL,
  `no_display_title` smallint DEFAULT NULL,
  `comment` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_field`),
  KEY `index_genatt_field_entry` (`id_entry`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_field`
--

LOCK TABLES `genatt_field` WRITE;
/*!40000 ALTER TABLE `genatt_field` DISABLE KEYS */;
INSERT INTO `genatt_field` VALUES (1,1,NULL,'used_in_correct_form_response','false',0,1,NULL,0,NULL),(2,1,NULL,'used_in_complete_form_response','false',0,2,NULL,0,NULL),(3,1,NULL,'exportable','false',0,3,NULL,0,NULL),(4,1,NULL,'exportable_pdf','false',0,4,NULL,0,NULL),(5,1,NULL,'anonymizable','false',0,5,NULL,0,NULL),(6,1,NULL,'display_in_bo','false',0,6,NULL,0,NULL),(7,2,NULL,'used_in_correct_form_response','false',0,7,NULL,0,NULL),(8,2,NULL,'used_in_complete_form_response','false',0,8,NULL,0,NULL),(9,2,NULL,'exportable','false',0,9,NULL,0,NULL),(10,2,NULL,'exportable_pdf','false',0,10,NULL,0,NULL),(11,2,NULL,'anonymizable','false',0,11,NULL,0,NULL),(12,2,NULL,'link','voir les conditions ',0,12,NULL,0,NULL),(13,2,NULL,'tos','<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or \"organic\" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>',0,13,NULL,0,NULL),(14,2,NULL,'agreement','false',0,14,NULL,0,NULL),(15,3,NULL,'used_in_correct_form_response','false',0,15,NULL,0,NULL),(16,3,NULL,'used_in_complete_form_response','false',0,16,NULL,0,NULL),(17,3,NULL,'exportable','false',0,17,NULL,0,NULL),(18,3,NULL,'exportable_pdf','false',0,18,NULL,0,NULL),(19,3,'','anonymizable','false',0,19,NULL,0,NULL),(20,3,NULL,'text_config','',0,20,NULL,0,NULL),(21,3,NULL,'width','0',0,21,NULL,0,NULL),(22,3,NULL,'max_size','-1',0,22,NULL,0,NULL),(23,3,NULL,'placeholder','',0,23,NULL,0,NULL),(24,3,NULL,'confirm_field','false',0,24,NULL,0,NULL),(66,8,NULL,'max_size','-1',0,55,NULL,0,NULL),(65,8,NULL,'text_config','',0,54,NULL,0,NULL),(64,8,'','anonymizable','false',0,53,NULL,0,NULL),(63,8,NULL,'exportable_pdf','false',0,52,NULL,0,NULL),(62,8,NULL,'exportable','false',0,51,NULL,0,NULL),(61,8,NULL,'used_in_complete_form_response','false',0,50,NULL,0,NULL),(60,8,NULL,'used_in_correct_form_response','false',0,49,NULL,0,NULL),(67,8,NULL,'width','0',0,56,NULL,0,NULL),(68,8,NULL,'height','10',0,57,NULL,0,NULL),(69,8,NULL,'richtext','true',0,58,NULL,0,NULL),(70,8,NULL,'placeholder','',0,59,NULL,0,NULL),(71,9,NULL,'used_in_correct_form_response','false',0,60,NULL,0,NULL),(72,9,NULL,'used_in_complete_form_response','false',0,61,NULL,0,NULL),(73,9,NULL,'exportable','false',0,62,NULL,0,NULL),(74,9,NULL,'exportable_pdf','false',0,63,NULL,0,NULL),(75,9,'','anonymizable','false',0,64,NULL,0,NULL),(76,9,NULL,'placeholder','',0,65,NULL,0,NULL),(77,9,NULL,'default_date_value',NULL,0,66,NULL,0,NULL),(78,10,NULL,'used_in_correct_form_response','false',0,67,NULL,0,NULL),(79,10,NULL,'used_in_complete_form_response','false',0,68,NULL,0,NULL),(80,10,NULL,'exportable','false',0,69,NULL,0,NULL),(81,10,NULL,'exportable_pdf','false',0,70,NULL,0,NULL),(82,10,NULL,'anonymizable','false',0,71,NULL,0,NULL),(83,10,'1','use_ref_list','true',0,72,NULL,0,NULL),(84,10,'Woman','answer_choice','F',0,73,NULL,0,NULL),(85,10,'Man','answer_choice','H',0,74,NULL,0,NULL),(86,10,'Undefined','answer_choice','U',0,75,NULL,0,NULL),(87,11,NULL,'used_in_correct_form_response','false',0,76,NULL,0,NULL),(88,11,NULL,'used_in_complete_form_response','false',0,77,NULL,0,NULL),(89,11,NULL,'exportable','false',0,78,NULL,0,NULL),(90,11,NULL,'exportable_pdf','false',0,79,NULL,0,NULL),(91,11,NULL,'anonymizable','false',0,80,NULL,0,NULL),(92,11,'2','use_ref_list','true',0,81,NULL,0,NULL),(93,11,'Environment','answer_choice','env',0,82,NULL,0,NULL),(94,11,'City shift','answer_choice','move',0,83,NULL,0,NULL),(95,11,'City cleanliness','answer_choice','clean',0,84,NULL,0,NULL),(96,11,'Healthcare','answer_choice','health',0,85,NULL,0,NULL),(97,12,NULL,'used_in_correct_form_response','false',0,86,NULL,0,NULL),(98,12,NULL,'used_in_complete_form_response','false',0,87,NULL,0,NULL),(99,12,NULL,'exportable','false',0,88,NULL,0,NULL),(100,12,NULL,'exportable_pdf','false',0,89,NULL,0,NULL),(101,12,'%v','anonymizable','true',0,90,NULL,0,NULL),(102,12,NULL,'file_max_size','250000000',0,91,NULL,0,NULL),(103,12,NULL,'max_files','3',0,92,NULL,0,NULL),(104,12,NULL,'export_binary','false',0,93,NULL,0,NULL),(105,13,NULL,'used_in_correct_form_response','false',0,94,NULL,0,NULL),(106,13,NULL,'used_in_complete_form_response','false',0,95,NULL,0,NULL),(107,13,NULL,'exportable','false',0,96,NULL,0,NULL),(108,13,NULL,'exportable_pdf','false',0,97,NULL,0,NULL),(109,13,'','anonymizable','false',0,98,NULL,0,NULL),(110,13,NULL,'provider','openstreetmap',0,99,NULL,0,NULL),(111,13,NULL,'editMode','Address',0,100,NULL,0,NULL),(112,13,NULL,'viewNumber','1',0,101,NULL,0,NULL),(113,13,NULL,'idAddress','idAddress',0,102,NULL,0,NULL),(114,13,NULL,'address','address',0,103,NULL,0,NULL),(115,13,NULL,'additionalAddress','additionalAddress',0,104,NULL,0,NULL),(116,13,NULL,'X','X',0,105,NULL,0,NULL),(117,13,NULL,'Y','Y',0,106,NULL,0,NULL),(118,13,NULL,'geometry','geometry',0,107,NULL,0,NULL),(119,14,NULL,'used_in_correct_form_response','false',0,108,NULL,0,NULL),(120,14,NULL,'used_in_complete_form_response','false',0,109,NULL,0,NULL),(121,14,NULL,'exportable','false',0,110,NULL,0,NULL),(122,14,NULL,'exportable_pdf','false',0,111,NULL,0,NULL),(123,14,NULL,'anonymizable','false',0,112,NULL,0,NULL),(124,14,'-1','use_ref_list','false',0,113,NULL,0,NULL),(125,14,'Yes','answer_choice','y',0,114,NULL,0,''),(126,14,'No','answer_choice','no',1,115,NULL,0,''),(127,15,NULL,'used_in_correct_form_response','false',0,116,NULL,0,NULL),(128,15,NULL,'used_in_complete_form_response','false',0,117,NULL,0,NULL),(129,15,NULL,'exportable','false',0,118,NULL,0,NULL),(130,15,NULL,'exportable_pdf','false',0,119,NULL,0,NULL),(131,15,'','anonymizable','false',0,120,NULL,0,NULL),(132,15,NULL,'attribute_name','user.business-info.online.email',0,121,NULL,0,NULL),(133,16,NULL,'used_in_correct_form_response','false',0,122,NULL,0,NULL),(134,16,NULL,'used_in_complete_form_response','false',0,123,NULL,0,NULL),(135,16,NULL,'exportable','false',0,124,NULL,0,NULL),(136,16,NULL,'exportable_pdf','false',0,125,NULL,0,NULL),(137,16,'','anonymizable','false',0,126,NULL,0,NULL),(138,16,NULL,'autocomplete','tel',0,127,NULL,0,NULL),(139,16,NULL,'defaultRegion','FR',0,128,NULL,0,NULL),(140,16,NULL,'placeholder','06-06-06-06',0,129,NULL,0,NULL),(141,17,NULL,'used_in_correct_form_response','false',0,130,NULL,0,NULL),(142,17,NULL,'used_in_complete_form_response','false',0,131,NULL,0,NULL),(143,17,NULL,'exportable','false',0,132,NULL,0,NULL),(144,17,NULL,'exportable_pdf','false',0,133,NULL,0,NULL),(145,17,'','anonymizable','false',0,134,NULL,0,NULL),(146,17,NULL,'text_config','',0,135,NULL,0,NULL),(147,17,NULL,'max_size','-1',0,136,NULL,0,NULL),(148,17,NULL,'width','0',0,137,NULL,0,NULL),(149,17,NULL,'height','10',0,138,NULL,0,NULL),(150,17,NULL,'richtext','false',0,139,NULL,0,NULL),(151,17,NULL,'placeholder','',0,140,NULL,0,NULL),(160,19,NULL,'used_in_correct_form_response','false',0,141,NULL,0,NULL),(161,19,NULL,'used_in_complete_form_response','false',0,142,NULL,0,NULL),(162,19,NULL,'exportable','false',0,143,NULL,0,NULL),(163,19,NULL,'exportable_pdf','false',0,144,NULL,0,NULL),(164,19,'','anonymizable','false',0,145,NULL,0,NULL),(165,19,NULL,'text_config','1',0,146,NULL,0,NULL),(166,19,NULL,'min','0',0,147,NULL,0,NULL),(167,19,NULL,'max','100',0,148,NULL,0,NULL),(168,19,NULL,'suffix','nb',0,149,NULL,0,NULL),(169,19,NULL,'placeholder','',0,150,NULL,0,NULL);
/*!40000 ALTER TABLE `genatt_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_referenceitem_field`
--

DROP TABLE IF EXISTS `genatt_referenceitem_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_referenceitem_field` (
  `id_field` int NOT NULL DEFAULT '0',
  `id_item` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_referenceitem_field`
--

LOCK TABLES `genatt_referenceitem_field` WRITE;
/*!40000 ALTER TABLE `genatt_referenceitem_field` DISABLE KEYS */;
INSERT INTO `genatt_referenceitem_field` VALUES (84,1),(85,2),(86,3),(93,4),(94,6),(95,7),(96,8);
/*!40000 ALTER TABLE `genatt_referenceitem_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_response`
--

DROP TABLE IF EXISTS `genatt_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_response` (
  `id_response` int NOT NULL AUTO_INCREMENT,
  `response_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `id_entry` int DEFAULT NULL,
  `iteration_number` int DEFAULT '-1',
  `id_field` int DEFAULT NULL,
  `id_file` int DEFAULT NULL,
  `status` smallint DEFAULT '1',
  PRIMARY KEY (`id_response`),
  KEY `index_genatt_response_entry` (`id_entry`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_response`
--

LOCK TABLES `genatt_response` WRITE;
/*!40000 ALTER TABLE `genatt_response` DISABLE KEYS */;
INSERT INTO `genatt_response` VALUES (1,'true',2,0,14,NULL,1),(2,'<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or \"organic\" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>',2,0,13,NULL,1),(3,'Laurent HOHL',3,0,NULL,NULL,1),(4,'azdazda dazazd',8,0,NULL,NULL,1),(5,'1645052400000',9,0,NULL,NULL,1),(6,'H',10,0,85,NULL,1),(7,'laurent.hohl@gmail.com',15,0,NULL,NULL,1),(8,'+33606060606',16,0,NULL,NULL,1),(9,'env',11,0,93,NULL,1),(10,'',13,0,113,NULL,1),(11,'227 rue de Bercy',13,-1,114,NULL,1),(12,NULL,13,0,115,NULL,1),(13,'',13,-1,116,NULL,1),(14,'',13,-1,117,NULL,1),(15,'',13,-1,118,NULL,1),(16,'y',14,0,125,NULL,1),(17,'azdazd',17,0,NULL,NULL,1),(18,'true',2,0,14,NULL,1),(19,'<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or \"organic\" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>',2,0,13,NULL,1),(20,'Laurent HOHL',3,0,NULL,NULL,1),(21,'dazazdaz',8,0,NULL,NULL,1),(22,'1643756400000',9,0,NULL,NULL,1),(23,'F',10,0,84,NULL,1),(24,'laurent.hohl@gmail.com',15,0,NULL,NULL,1),(25,'+33606060606',16,0,NULL,NULL,1),(26,'env',11,0,93,NULL,1),(27,'',13,0,113,NULL,1),(28,'',13,-1,114,NULL,1),(29,NULL,13,0,115,NULL,1),(30,'',13,-1,116,NULL,1),(31,'',13,-1,117,NULL,1),(32,'',13,-1,118,NULL,1),(33,'no',14,0,126,NULL,1),(34,'true',2,0,14,NULL,1),(35,'<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or \"organic\" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>',2,0,13,NULL,1),(36,'Laurent HOHL',3,0,NULL,NULL,1),(37,'dzad ad',8,0,NULL,NULL,1),(38,NULL,9,0,NULL,NULL,1),(39,NULL,10,0,NULL,NULL,1),(40,'laurent.hohl@gmail.com',15,0,NULL,NULL,1),(41,'',16,0,NULL,NULL,1),(42,'clean',11,0,95,NULL,1),(43,'',13,0,113,NULL,1),(44,'',13,-1,114,NULL,1),(45,NULL,13,0,115,NULL,1),(46,'',13,-1,116,NULL,1),(47,'',13,-1,117,NULL,1),(48,'',13,-1,118,NULL,1),(49,'no',14,0,126,NULL,1),(50,'true',2,0,14,NULL,1),(51,'<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or \"organic\" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>',2,0,13,NULL,1),(52,'',3,0,NULL,NULL,1),(53,'',8,0,NULL,NULL,1),(54,NULL,9,0,NULL,NULL,1),(55,NULL,10,0,NULL,NULL,1),(56,'laurent.hohl@gmail.com',15,0,NULL,NULL,1),(57,'',16,0,NULL,NULL,1),(58,'clean',11,0,95,NULL,1),(59,'',13,0,113,NULL,1),(60,'',13,-1,114,NULL,1),(61,NULL,13,0,115,NULL,1),(62,'',13,-1,116,NULL,1),(63,'',13,-1,117,NULL,1),(64,'',13,-1,118,NULL,1),(65,'no',14,0,126,NULL,1),(66,'true',2,0,14,NULL,1),(67,'<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or \"organic\" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>',2,0,13,NULL,1),(68,'laurent.hohl@paris.fr',3,0,NULL,NULL,1),(69,'dH ZDAZDH AZUDHA ZDAZUH DAZUDHAZIU DH',8,0,NULL,NULL,1),(70,'1645052400000',9,0,NULL,NULL,1),(71,NULL,10,0,NULL,NULL,1),(72,'+33688385653',16,0,NULL,NULL,1),(73,'clean',11,0,95,NULL,1),(74,NULL,12,0,NULL,129,1),(75,'',13,0,113,NULL,1),(76,'Sookie, 2 bis, Rue Commines, Quartier des Enfants-Rouges, Paris 3e Arrondissement, Paris, Ãle-de-France, France mÃ©tropolitaine, 75003, France',13,-1,114,NULL,1),(77,NULL,13,0,115,NULL,1),(78,'2.365107536315918',13,-1,116,NULL,1),(79,'48.861544805019086',13,-1,117,NULL,1),(80,'',13,-1,118,NULL,1),(81,'env',11,1,93,NULL,1),(82,NULL,12,1,NULL,130,1),(83,'',13,1,113,NULL,1),(84,'Sookie, 2 bis, Rue Commines, Quartier des Enfants-Rouges, Paris 3e Arrondissement, Paris, Ãle-de-France, France mÃ©tropolitaine, 75003, France',13,-1,114,NULL,1),(85,NULL,13,1,115,NULL,1),(86,'2.365107536315918',13,-1,116,NULL,1),(87,'48.861544805019086',13,-1,117,NULL,1),(88,'',13,-1,118,NULL,1),(89,'y',14,0,125,NULL,1),(90,'TEST',17,0,NULL,NULL,1),(91,'true',2,0,14,NULL,1),(92,'<p>Holisticly target reliable alignments rather than customized e-tailers. Assertively parallel task timely architectures whereas sticky intellectual capital. Monotonectally coordinate enterprise benefits before worldwide action items. Appropriately deliver premier partnerships rather than market-driven models. Appropriately morph collaborative human capital rather than client-centric opportunities.</p>\r\n<p>Holisticly streamline cross-unit solutions before distributed platforms. Completely mesh flexible catalysts for change through 24/365 metrics. Assertively scale installed base potentialities whereas global ROI. Completely recaptiualize client-focused ROI via just in time networks. Intrinsicly cultivate vertical best practices after revolutionary infomediaries.</p>\r\n<p>Phosfluorescently orchestrate clicks-and-mortar solutions and client-centered e-markets. Phosfluorescently mesh worldwide infrastructures vis-a-vis inexpensive web-readiness. Completely syndicate team building methods of empowerment through pandemic growth strategies. Collaboratively unleash flexible core competencies vis-a-vis extensible bandwidth. Progressively productivate diverse resources without enterprise-wide best practices.</p>\r\n<p>Intrinsicly revolutionize dynamic information via bleeding-edge growth strategies. Objectively formulate magnetic strategic theme areas with standardized expertise. Globally create standards compliant paradigms rather than robust synergy. Synergistically enhance business technologies with plug-and-play internal or \"organic\" sources. Phosfluorescently pontificate empowered communities rather than value-added innovation.</p>\r\n<p>Completely incentivize holistic models after future-proof e-commerce. Synergistically generate distributed models after intermandated growth strategies. Quickly customize robust paradigms after future-proof relationships. Assertively promote cutting-edge deliverables whereas standards compliant expertise. Globally seize dynamic information vis-a-vis cross-media human capital.</p>\r\n<p>Quickly pursue tactical supply chains with distributed e-commerce. Synergistically transition ethical potentialities whereas leveraged opportunities. Authoritatively leverage existing pandemic functionalities with value-added expertise. Compellingly fashion plug-and-play synergy after process-centric methodologies. Dynamically conceptualize pandemic data through global.</p>',2,0,13,NULL,1),(93,'laurent.hohl@paris.fr',3,0,NULL,NULL,1),(94,'dzadza azdazd',8,0,NULL,NULL,1),(95,'1645138800000',9,0,NULL,NULL,1),(96,'H',10,0,85,NULL,1),(97,'+33606060606',16,0,NULL,NULL,1),(98,'move',11,0,94,NULL,1),(99,'',13,0,113,NULL,1),(100,'',13,-1,114,NULL,1),(101,NULL,13,0,115,NULL,1),(102,'',13,-1,116,NULL,1),(103,'',13,-1,117,NULL,1),(104,'',13,-1,118,NULL,1),(105,'no',14,0,126,NULL,1);
/*!40000 ALTER TABLE `genatt_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genatt_verify_by`
--

DROP TABLE IF EXISTS `genatt_verify_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_verify_by` (
  `id_field` int NOT NULL DEFAULT '0',
  `id_expression` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`,`id_expression`),
  KEY `index_genatt_verify_by_field` (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genatt_verify_by`
--

LOCK TABLES `genatt_verify_by` WRITE;
/*!40000 ALTER TABLE `genatt_verify_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_verify_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `html_portlet`
--

DROP TABLE IF EXISTS `html_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `html_portlet` (
  `id_portlet` int NOT NULL DEFAULT '0',
  `html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_portlet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `html_portlet`
--

LOCK TABLES `html_portlet` WRITE;
/*!40000 ALTER TABLE `html_portlet` DISABLE KEYS */;
INSERT INTO `html_portlet` VALUES (6,'\r\n    <!-- Features -->\r\n    <div id=\"features\" class=\"tabs\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12\">\r\n                    <div class=\"above-heading\">FEATURES</div>\r\n                    <h2 class=\"h2-heading\">Forms </h2>\r\n                    <p class=\"p-heading\">Add multi-step forms to retrieve info from your citizen\'s, associations...</p>\r\n                </div> \r\n            </div> \r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12\">\r\n                   <!-- Tabs Links -->\r\n                    <ul class=\"nav nav-tabs\" id=\"argoTabs\" role=\"tablist\">\r\n                        <li class=\"nav-item\">\r\n                            <a class=\"nav-link active\" id=\"nav-tab-1\" data-bs-toggle=\"tab\" href=\"#tab-1\" role=\"tab\" aria-controls=\"tab-1\" aria-selected=\"true\">\r\n								<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"icon icon-tabler icon-tabler-forms\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">\r\n								  <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/>\r\n								  <path d=\"M12 3a3 3 0 0 0 -3 3v12a3 3 0 0 0 3 3\" />\r\n								  <path d=\"M6 3a3 3 0 0 1 3 3v12a3 3 0 0 1 -3 3\" />\r\n								  <path d=\"M13 7h7a1 1 0 0 1 1 1v8a1 1 0 0 1 -1 1h-7\" />\r\n								  <path d=\"M5 7h-1a1 1 0 0 0 -1 1v8a1 1 0 0 0 1 1h1\" />\r\n								  <path d=\"M17 12h.01\" />\r\n								  <path d=\"M13 12h.01\" />\r\n								</svg> \r\n								Build forms\r\n							</a>\r\n                        </li>\r\n                        <li class=\"nav-item\">\r\n                            <a class=\"nav-link\" id=\"nav-tab-2\" data-bs-toggle=\"tab\" href=\"#tab-2\" role=\"tab\" aria-controls=\"tab-2\" aria-selected=\"false\">\r\n								<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"icon icon-tabler icon-tabler-list-details\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">\r\n								  <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/>\r\n								  <path d=\"M13 5h8\" />\r\n								  <path d=\"M13 9h5\" />\r\n								  <path d=\"M13 15h8\" />\r\n								  <path d=\"M13 19h5\" />\r\n								  <rect x=\"3\" y=\"4\" width=\"6\" height=\"6\" rx=\"1\" />\r\n								  <rect x=\"3\" y=\"14\" width=\"6\" height=\"6\" rx=\"1\" />\r\n								</svg>\r\n								Manage responses\r\n							</a>\r\n                        </li>\r\n                    </ul>\r\n                    <!-- end of tabs links -->\r\n                    <!-- Tabs Content -->\r\n                    <div class=\"tab-content\" id=\"argoTabsContent\">\r\n                        <!-- Tab -->\r\n                        <div class=\"tab-pane fade show active\" id=\"tab-1\" role=\"tabpanel\" aria-labelledby=\"tab-1\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-lg-6\">\r\n                                    <div class=\"image-container\">\r\n                                        <img class=\"img-fluid\" src=\"images/features-1.png\" alt=\"alternative\">\r\n                                    </div> <!-- end of image-container -->\r\n                                </div> <!-- end of col -->\r\n                                <div class=\"col-lg-6\">\r\n                                    <div class=\"text-container\">\r\n                                        <h3>List Building Is Easier Than Ever</h3>\r\n                                        <p>It\'s very easy to start using Tivo. You just need to fill out and submit the <a class=\"blue page-scroll\" href=\"sign-up.html\">Sign Up Form</a> and you will receive access to the app and all of its features in no more than 24h.</p>\r\n                                        <ul class=\"list-unstyled li-space-lg\">\r\n                                            <li>\r\n                                                <i class=\"fas fa-square\"></i> Create and embed on websites newsletter sign up forms\r\n                                            </li>\r\n                                            <li>\r\n                                                <i class=\"fas fa-square\"></i> Manage forms and landing pages for your services\r\n                                            </li>\r\n                                            <li>\r\n                                                <i class=\"fas fa-square\"></i> Add and remove subscribers using the control panel\r\n                                            </li>\r\n                                        </ul>\r\n                                        <p class=\"p-small\">Demo user access-code is <strong>\"adminpack\"</strong> and the password is <strong>\"packcitelibreadmin\"</strong></p>\r\n                                        <a class=\"btn-solid-reg\" target=\"_blank\" title=\"[Nouvelle fenÃªtre] AccÃ©der au back-office\" href=\"jsp/admin/AdminLogin.jsp\"><i class=\"fas fa-external-link-alt\"></i> Connect to admin</a>\r\n                                    </div> <!-- end of text-container -->\r\n                                </div> <!-- end of col -->\r\n                            </div> <!-- end of row -->\r\n                        </div> <!-- end of tab-pane -->\r\n                        <!-- end of tab -->\r\n                        <!-- Tab -->\r\n                        <div class=\"tab-pane fade\" id=\"tab-2\" role=\"tabpanel\" aria-labelledby=\"tab-2\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-lg-6\">\r\n                                    <div class=\"image-container\">\r\n                                        <img class=\"img-fluid\" src=\"images/features-2.png\" alt=\"alternative\">\r\n                                    </div> <!-- end of image-container -->\r\n                                </div> <!-- end of col -->\r\n                                <div class=\"col-lg-6\">\r\n                                    <div class=\"text-container\">\r\n                                        <h3>Campaigns Monitoring Tools</h3>\r\n                                        <p>Campaigns monitoring is a feature we\'ve developed since the beginning because it\'s at the core of Tivo and basically to any marketing activity focused on results.</p>\r\n                                        <ul class=\"list-unstyled li-space-lg\">\r\n                                            <li class=\"media\">\r\n                                                <i class=\"fas fa-square\"></i>\r\n                                                <div class=\"media-body\">Easily plan campaigns and schedule their starting date</div>\r\n                                            </li>\r\n                                            <li class=\"media\">\r\n                                                <i class=\"fas fa-square\"></i>\r\n                                                <div class=\"media-body\">Start campaigns and follow their evolution closely</div>\r\n                                            </li>\r\n                                            <li class=\"media\">\r\n                                                <i class=\"fas fa-square\"></i>\r\n                                                <div class=\"media-body\">Evaluate campaign results and optimize future actions</div>\r\n                                            </li>\r\n                                        </ul>\r\n                                        <a class=\"btn-solid-reg popup-with-move-anim\" href=\"#details-lightbox-2\">LIGHTBOX</a>\r\n                                    </div> <!-- end of text-container -->\r\n                                </div> <!-- end of col -->\r\n                            </div> <!-- end of row -->\r\n                        </div> <!-- end of tab-pane -->\r\n                        <!-- end of tab -->\r\n                    <!-- end of tabs content -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n        </div> <!-- end of container -->\r\n    </div> <!-- end of tabs -->\r\n    <!-- end of features -->\r\n    '),(4,'<!-- end of customers -->\r\n<!-- Description -->\r\n    <div class=\"cards-1\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12\">\r\n                    <div class=\"above-heading\">ALL PACK AVAILABLE</div>\r\n                    <!-- <h2 class=\"h2-heading\">Marketing Automation Will Bring More Qualified Leads</h2> -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12\">\r\n                    <!-- Card \r\n                    <div class=\"card\">\r\n                        <div class=\"card-image\">\r\n                            <img class=\"img-fluid\" src=\"images/description-1.png\" alt=\"alternative\">\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <h4 class=\"card-title\">Forms</h4>\r\n                            <p>It\'s very easy to start creating a form.</p>\r\n                        </div>\r\n                    </div>\r\n-->\r\n                    <!-- end of card -->\r\n                    <!-- Card -->\r\n                    <div class=\"card\">\r\n                        <div class=\"card-image\">\r\n                            <img class=\"img-fluid\" src=\"images/description-2.png\" alt=\"alternative\">\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <h4 class=\"card-title\">Appointment</h4>\r\n                            <p>Rule your service\'s appointments</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n  	<!-- Card -->\r\n                    <div class=\"card\">\r\n                        <div class=\"card-image\">\r\n                            <img class=\"img-fluid\" src=\"images/description-4.png\" alt=\"alternative\">\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <h4 class=\"card-title\">In my street</h4>\r\n                            <p>Have citizen feedback on your city equipments</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n                    <!-- Card -->\r\n                    <div class=\"card\">\r\n                        <div class=\"card-image\">\r\n                            <img class=\"img-fluid\" src=\"images/description-3.png\" alt=\"alternative\">\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <h4 class=\"card-title\">Participative Budget</h4>\r\n                            <p>Elaborate with citizen</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n        </div> <!-- end of container -->\r\n    </div> <!-- end of cards-1 -->\r\n    <!-- end of description -->\r\n'),(5,'	<div class=\"slider-1\">\r\n		<div class=\"container\">\r\n			<div class=\"row\">\r\n				<div class=\"col\">\r\n					<!-- Image Slider -->\r\n					<div class=\"slider-container\">\r\n						<div class=\"swiper-container image-slider\">\r\n							<div class=\"swiper-wrapper\">\r\n								<div class=\"swiper-slide\">\r\n									<img class=\"img-fluid\" src=\"images/customer-logo-1.png\" alt=\"alternative\">\r\n								</div>\r\n								<div class=\"swiper-slide\">\r\n									<img class=\"img-fluid\" src=\"images/customer-logo-2.png\" alt=\"alternative\">\r\n								</div>\r\n								<div class=\"swiper-slide\">\r\n									<img class=\"img-fluid\" src=\"images/customer-logo-3.png\" alt=\"alternative\">\r\n								</div>\r\n								<div class=\"swiper-slide\">\r\n									<img class=\"img-fluid\" src=\"images/customer-logo-4.png\" alt=\"alternative\">\r\n								</div>\r\n								\r\n							</div> <!-- end of swiper-wrapper -->\r\n						</div> <!-- end of swiper container -->\r\n					</div> <!-- end of slider-container -->\r\n					<!-- end of image slider -->\r\n				</div> <!-- end of col -->\r\n			</div> <!-- end of row -->\r\n		</div> <!-- end of container -->\r\n	</div> <!-- end of slider-1 -->'),(7,'<div class=\"cards-1\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12\">\r\n                    <div class=\"above-heading\">ALL PACK AVAILABLE</div>\r\n                    <!-- <h2 class=\"h2-heading\">Marketing Automation Will Bring More Qualified Leads</h2> -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12\">\r\n                    <!-- Card \r\n                    <div class=\"card\">\r\n                        <div class=\"card-image\">\r\n                            <img class=\"img-fluid\" src=\"images/description-1.png\" alt=\"alternative\">\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <h4 class=\"card-title\">Forms</h4>\r\n                            <p>It\'s very easy to start creating a form.</p>\r\n                        </div>\r\n                    </div>\r\n-->\r\n                    <!-- end of card -->\r\n                    <!-- Card -->\r\n                    <div class=\"card\">\r\n                        <div class=\"card-image\">\r\n                            <img class=\"img-fluid\" src=\"images/description-2.png\" alt=\"alternative\">\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <h4 class=\"card-title\">Appointment</h4>\r\n                            <p>Rule your service\'s appointments</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n  	<!-- Card -->\r\n                    <div class=\"card\">\r\n                        <div class=\"card-image\">\r\n                            <img class=\"img-fluid\" src=\"images/description-4.png\" alt=\"alternative\">\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <h4 class=\"card-title\">In my street</h4>\r\n                            <p>Have citizen feedback on your city equipments</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n                    <!-- Card -->\r\n                    <div class=\"card\">\r\n                        <div class=\"card-image\">\r\n                            <img class=\"img-fluid\" src=\"images/description-3.png\" alt=\"alternative\">\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <h4 class=\"card-title\">Participative Budget</h4>\r\n                            <p>Elaborate with citizen</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n        </div> <!-- end of container -->\r\n    </div> <!-- end of cards-1 -->\r\n    <!-- end of description -->');
/*!40000 ALTER TABLE `html_portlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htmlpage`
--

DROP TABLE IF EXISTS `htmlpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htmlpage` (
  `id_htmlpage` int NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `html_content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all',
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id_htmlpage`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htmlpage`
--

LOCK TABLES `htmlpage` WRITE;
/*!40000 ALTER TABLE `htmlpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `htmlpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_attribute`
--

DROP TABLE IF EXISTS `identitystore_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_attribute` (
  `id_attribute` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `key_name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb3_unicode_ci,
  `key_type` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `key_name` (`key_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_attribute`
--

LOCK TABLES `identitystore_attribute` WRITE;
/*!40000 ALTER TABLE `identitystore_attribute` DISABLE KEYS */;
INSERT INTO `identitystore_attribute` VALUES (1,'Genre','gender','0:Non dÃ©fini /  1:Homme / 2:Femme',0),(2,'Email','email','',0),(3,'Date de naissance','birthdate','au format DD/MM/YYYY',0),(4,'Lieu de naissance','birthplace','',0),(5,'TÃ©lÃ©phone portable','mobile_phone','RÃ©servÃ© pour l\'envoi de SMS',0),(6,'TÃ©lÃ©phone fixe','fixed_phone','',0),(7,'TÃ©lÃ©phone fixe ou mobile','phone','',0),(8,'Nom usuel','preferred_username','',0),(9,'Adresse postale','address','',0),(10,'PrÃ©nom','first_name','PrÃ©nom usuel',0),(11,'Nom de famille de naissance','family_name','',0),(12,'NumÃ©ro de rue','address_number','Champ d\'adresse : numÃ©ro de rue ',0),(13,'Suffixe','address_suffix','Champ d\'adresse : suffixe de numÃ©ro (bis,ter...)',0),(14,'Rue','address_street','Champ d\'adresse :  rue, avenue...',0),(15,'Immeuble','address_building','Champ d\'adresse : immeuble, rÃ©sidence...',0),(16,'Etage','address_stair','Champ d\'adresse : Etage, NumÃ©ro d appartement',0),(17,'Code postal','address_postal_code','Champ d\'adresse : code postal',0),(18,'Ville','address_city','Champ d\'adresse : ville',0),(19,'Pays de naissance','birthcountry','',0),(30,'(FC) PrÃ©noms','fc_given_name','Format Pivot FranceConnect - Liste des prÃ©noms',0),(31,'(FC) Nom de naissance','fc_family_name','Format Pivot FranceConnect',0),(32,'(FC) Date de naissance','fc_birthdate','Format Pivot FranceConnect - format YYYY-MM-DD',0),(33,'(FC) Genre','fc_gender','Format Pivot FranceConnect - male / female',0),(34,'(FC) Lieu de naissance','fc_birthplace','Format Pivot FranceConnect - Code INSEE du lieu de naissance (ou une chaÃ®ne vide si la personne est nÃ©e Ã  l\'Ã©tranger)',0),(35,'(FC) Pays de naissance','fc_birthcountry','Format Pivot FranceConnect - Code INSEE du pays de naissance',0);
/*!40000 ALTER TABLE `identitystore_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_attribute_certificate`
--

DROP TABLE IF EXISTS `identitystore_attribute_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_attribute_certificate` (
  `id_attribute_certificate` int NOT NULL AUTO_INCREMENT,
  `certifier_code` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `certificate_date` timestamp NOT NULL,
  `certificate_level` int NOT NULL DEFAULT '0',
  `expiration_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_attribute_certificate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_attribute_certificate`
--

LOCK TABLES `identitystore_attribute_certificate` WRITE;
/*!40000 ALTER TABLE `identitystore_attribute_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `identitystore_attribute_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_attribute_right`
--

DROP TABLE IF EXISTS `identitystore_attribute_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_attribute_right` (
  `id_client_app` int NOT NULL,
  `id_attribute` int NOT NULL,
  `readable` int NOT NULL DEFAULT '0',
  `writable` int NOT NULL DEFAULT '0',
  `certifiable` int NOT NULL DEFAULT '0',
  `searchable` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_client_app`,`id_attribute`),
  KEY `fk_attribute_right_id_attribute` (`id_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_attribute_right`
--

LOCK TABLES `identitystore_attribute_right` WRITE;
/*!40000 ALTER TABLE `identitystore_attribute_right` DISABLE KEYS */;
INSERT INTO `identitystore_attribute_right` VALUES (1,1,1,1,0,0),(1,2,1,1,0,0),(1,3,1,1,0,0),(1,4,1,1,0,0),(1,5,1,1,0,0),(1,6,1,1,0,0),(1,7,1,1,0,0),(1,8,1,1,0,0),(1,9,1,1,0,0),(1,10,1,1,0,0),(1,11,1,1,0,0),(1,12,1,1,0,0),(1,13,1,1,0,0),(1,14,1,1,0,0),(1,15,1,1,0,0),(1,16,1,1,0,0),(1,17,1,1,0,0),(1,18,1,1,0,0);
/*!40000 ALTER TABLE `identitystore_attribute_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_client_application`
--

DROP TABLE IF EXISTS `identitystore_client_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_client_application` (
  `id_client_app` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_application_authorized_to_delete_value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_client_app`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_client_application`
--

LOCK TABLES `identitystore_client_application` WRITE;
/*!40000 ALTER TABLE `identitystore_client_application` DISABLE KEYS */;
INSERT INTO `identitystore_client_application` VALUES (1,'My Application','MyApplication',0);
/*!40000 ALTER TABLE `identitystore_client_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_client_application_certifiers`
--

DROP TABLE IF EXISTS `identitystore_client_application_certifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_client_application_certifiers` (
  `id_client_app` int NOT NULL,
  `certifier_code` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_client_app`,`certifier_code`),
  KEY `id_client_app` (`id_client_app`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_client_application_certifiers`
--

LOCK TABLES `identitystore_client_application_certifiers` WRITE;
/*!40000 ALTER TABLE `identitystore_client_application_certifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `identitystore_client_application_certifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_history_identity_attribute`
--

DROP TABLE IF EXISTS `identitystore_history_identity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_history_identity_attribute` (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `change_type` int NOT NULL,
  `id_identity` int NOT NULL,
  `identity_connection_id` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `attribute_key` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `attribute_new_value` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `attribute_old_value` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `author_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `author_type` int NOT NULL,
  `author_application` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `certifier_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_history`),
  KEY `fk_history_identity_attribute_id_identity` (`id_identity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_history_identity_attribute`
--

LOCK TABLES `identitystore_history_identity_attribute` WRITE;
/*!40000 ALTER TABLE `identitystore_history_identity_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `identitystore_history_identity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_identity`
--

DROP TABLE IF EXISTS `identitystore_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_identity` (
  `id_identity` int NOT NULL AUTO_INCREMENT,
  `connection_id` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` smallint DEFAULT '0',
  `date_delete` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_identity`),
  UNIQUE KEY `connection_id` (`connection_id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  KEY `connection_id_2` (`connection_id`),
  KEY `customer_id_2` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_identity`
--

LOCK TABLES `identitystore_identity` WRITE;
/*!40000 ALTER TABLE `identitystore_identity` DISABLE KEYS */;
INSERT INTO `identitystore_identity` VALUES (1,'azerty','3F2504E0-4F89-11D3-9A0C-0305E82C3301','2023-12-12 10:18:06',0,'2023-12-12 10:18:06');
/*!40000 ALTER TABLE `identitystore_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identitystore_identity_attribute`
--

DROP TABLE IF EXISTS `identitystore_identity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_identity_attribute` (
  `id_identity` int NOT NULL DEFAULT '0',
  `id_attribute` int NOT NULL DEFAULT '0',
  `attribute_value` mediumtext COLLATE utf8mb3_unicode_ci,
  `id_certification` int NOT NULL DEFAULT '0',
  `id_file` int DEFAULT '0',
  `lastupdate_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastupdate_application` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_identity`,`id_attribute`),
  KEY `fk_identity_attribute_id_attribute` (`id_attribute`),
  KEY `ix_attribute_value` (`attribute_value`(50)) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identitystore_identity_attribute`
--

LOCK TABLES `identitystore_identity_attribute` WRITE;
/*!40000 ALTER TABLE `identitystore_identity_attribute` DISABLE KEYS */;
INSERT INTO `identitystore_identity_attribute` VALUES (1,1,'M',0,0,'2023-12-12 10:18:06',NULL),(1,2,'john.doe@gmail.com',0,0,'2023-12-12 10:18:06',NULL),(1,3,'11/10/1970',0,0,'2023-12-12 10:18:06',NULL),(1,4,'Paris',0,0,'2023-12-12 10:18:06',NULL),(1,5,'0623457896',0,0,'2023-12-12 10:18:06',NULL),(1,6,'0123457896',0,0,'2023-12-12 10:18:06',NULL),(1,7,'0123457896',0,0,'2023-12-12 10:18:06',NULL),(1,8,'Joe',0,0,'2023-12-12 10:18:06',NULL),(1,9,'Rue de Rennes',0,0,'2023-12-12 10:18:06',NULL),(1,10,'John',0,0,'2023-12-12 10:18:06',NULL),(1,11,'Doe',0,0,'2023-12-12 10:18:06',NULL),(1,12,'8',0,0,'2023-12-12 10:18:06',NULL),(1,13,'Bis',0,0,'2023-12-12 10:18:06',NULL),(1,14,'Rue de Rennes',0,0,'2023-12-12 10:18:06',NULL),(1,15,'Escalier B',0,0,'2023-12-12 10:18:06',NULL),(1,16,'Etage 4',0,0,'2023-12-12 10:18:06',NULL),(1,17,'75018',0,0,'2023-12-12 10:18:06',NULL),(1,18,'Paris',0,0,'2023-12-12 10:18:06',NULL);
/*!40000 ALTER TABLE `identitystore_identity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kibana_dashboard`
--

DROP TABLE IF EXISTS `kibana_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kibana_dashboard` (
  `id_dashboard` int NOT NULL,
  `idkibanadashboard` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `title` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `dataSourceName` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_dashboard`),
  UNIQUE KEY `idkibanadashboard` (`idkibanadashboard`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kibana_dashboard`
--

LOCK TABLES `kibana_dashboard` WRITE;
/*!40000 ALTER TABLE `kibana_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `kibana_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydashboard_configuration`
--

DROP TABLE IF EXISTS `mydashboard_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_configuration` (
  `my_dashboard_component_id` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_config` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dashboard_order` int NOT NULL,
  `hide_dashboard` smallint NOT NULL,
  PRIMARY KEY (`my_dashboard_component_id`,`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydashboard_configuration`
--

LOCK TABLES `mydashboard_configuration` WRITE;
/*!40000 ALTER TABLE `mydashboard_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydashboard_dashboard_association`
--

DROP TABLE IF EXISTS `mydashboard_dashboard_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_dashboard_association` (
  `id_dashboard_association` int NOT NULL,
  `id_dashboard` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `id_panel` int NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_dashboard_association`),
  KEY `fk_id_panel` (`id_panel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydashboard_dashboard_association`
--

LOCK TABLES `mydashboard_dashboard_association` WRITE;
/*!40000 ALTER TABLE `mydashboard_dashboard_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_dashboard_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydashboard_panel`
--

DROP TABLE IF EXISTS `mydashboard_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_panel` (
  `id_panel` int NOT NULL,
  `code` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb3_unicode_ci,
  `is_default` smallint NOT NULL,
  PRIMARY KEY (`id_panel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydashboard_panel`
--

LOCK TABLES `mydashboard_panel` WRITE;
/*!40000 ALTER TABLE `mydashboard_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydashboard_portlet_panel`
--

DROP TABLE IF EXISTS `mydashboard_portlet_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_portlet_panel` (
  `id_portlet` int NOT NULL,
  `id_panel` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_portlet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydashboard_portlet_panel`
--

LOCK TABLES `mydashboard_portlet_panel` WRITE;
/*!40000 ALTER TABLE `mydashboard_portlet_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_portlet_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_attribute`
--

DROP TABLE IF EXISTS `mylutece_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_attribute` (
  `id_attribute` int NOT NULL DEFAULT '0',
  `type_class_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `help_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_mandatory` smallint DEFAULT '0',
  `is_shown_in_search` smallint DEFAULT '0',
  `attribute_position` int DEFAULT '0',
  `plugin_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `anonymize` smallint DEFAULT NULL,
  PRIMARY KEY (`id_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_attribute`
--

LOCK TABLES `mylutece_attribute` WRITE;
/*!40000 ALTER TABLE `mylutece_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_attribute_field`
--

DROP TABLE IF EXISTS `mylutece_attribute_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_attribute_field` (
  `id_field` int NOT NULL DEFAULT '0',
  `id_attribute` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `DEFAULT_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_DEFAULT_value` smallint DEFAULT '0',
  `height` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `max_size_enter` int DEFAULT NULL,
  `is_multiple` smallint DEFAULT '0',
  `field_position` int DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_attribute_field`
--

LOCK TABLES `mylutece_attribute_field` WRITE;
/*!40000 ALTER TABLE `mylutece_attribute_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_connections_log`
--

DROP TABLE IF EXISTS `mylutece_connections_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_connections_log` (
  `ip_address` varchar(63) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_status` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_connections_log`
--

LOCK TABLES `mylutece_connections_log` WRITE;
/*!40000 ALTER TABLE `mylutece_connections_log` DISABLE KEYS */;
INSERT INTO `mylutece_connections_log` VALUES ('0:0:0:0:0:0:0:1','2022-02-17 15:11:39',0);
/*!40000 ALTER TABLE `mylutece_connections_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_group`
--

DROP TABLE IF EXISTS `mylutece_database_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_group` (
  `group_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `group_description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`group_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_group`
--

LOCK TABLES `mylutece_database_group` WRITE;
/*!40000 ALTER TABLE `mylutece_database_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_group_role`
--

DROP TABLE IF EXISTS `mylutece_database_group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_group_role` (
  `group_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `role_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_key`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_group_role`
--

LOCK TABLES `mylutece_database_group_role` WRITE;
/*!40000 ALTER TABLE `mylutece_database_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_key`
--

DROP TABLE IF EXISTS `mylutece_database_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_key` (
  `mylutece_database_user_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mylutece_database_user_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`mylutece_database_user_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_key`
--

LOCK TABLES `mylutece_database_key` WRITE;
/*!40000 ALTER TABLE `mylutece_database_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_user`
--

DROP TABLE IF EXISTS `mylutece_database_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_user` (
  `mylutece_database_user_id` int NOT NULL,
  `login` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `password` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name_given` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `name_family` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active` smallint NOT NULL DEFAULT '0',
  `reset_password` smallint NOT NULL DEFAULT '0',
  `password_max_valid_date` timestamp NULL DEFAULT NULL,
  `account_max_valid_date` bigint DEFAULT NULL,
  `nb_alerts_sent` int NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '1979-12-31 23:00:00',
  PRIMARY KEY (`mylutece_database_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_user`
--

LOCK TABLES `mylutece_database_user` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user` DISABLE KEYS */;
INSERT INTO `mylutece_database_user` VALUES (1,'laurent.hohl@gmail.com','PBKDF2WITHHMACSHA512:40000:d812ffa87cb979a45099c919f6acd64a:2030e46e70e0b731ee180047daafac227159a5e9b5e33c1d5ddc310e6e410e72777147f8088f4ff5323303db89aa44f8be67fc64565cd06820f18e6e8a2af6699af97c7f7f68a8c2013f33f69bd4c1c2db77ec06136381ab3d62d017f46601c2b1e2e49dcf1816c12e9b31075a2cd7e3447d1a5a98ab7ab7eebe61f8eb321a78','Laurent','HOHLA','laurent.hohl@gmail.com',1,0,NULL,1676652179713,0,'2022-02-22 16:42:59');
/*!40000 ALTER TABLE `mylutece_database_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_user_group`
--

DROP TABLE IF EXISTS `mylutece_database_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_user_group` (
  `mylutece_database_user_id` int NOT NULL DEFAULT '0',
  `group_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mylutece_database_user_id`,`group_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_user_group`
--

LOCK TABLES `mylutece_database_user_group` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_user_parameter`
--

DROP TABLE IF EXISTS `mylutece_database_user_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_user_parameter` (
  `parameter_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parameter_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`parameter_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_user_parameter`
--

LOCK TABLES `mylutece_database_user_parameter` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_parameter` DISABLE KEYS */;
INSERT INTO `mylutece_database_user_parameter` VALUES ('account_creation_validation_email','false'),('auto_login_after_validation_email','false'),('enable_jcaptcha','false'),('force_change_password_reinit',''),('password_minimum_length','8'),('password_format_upper_lower_case','false'),('password_format_numero','false'),('password_format_special_characters','false'),('password_duration',''),('password_history_size',''),('maximum_number_password_change',''),('tsw_size_password_change',''),('use_advanced_security_parameters','false'),('account_life_time','360'),('time_before_alert_account','30'),('nb_alert_account','2'),('time_between_alerts_account','10'),('access_failures_max','3'),('access_failures_interval','10'),('expired_alert_mail_sender','LUTECE'),('expired_alert_mail_subject','Votre compte a expirÃ©'),('first_alert_mail_sender','LUTECE'),('first_alert_mail_subject','Votre compte va bientot expirer'),('other_alert_mail_sender','LUTECE'),('other_alert_mail_subject','Votre compte va bientot expirer'),('account_reactivated_mail_sender','LUTECE'),('account_reactivated_mail_subject','Votre compte a bien Ã©tÃ© rÃ©activÃ©'),('access_failures_captcha','1'),('unblock_user_mail_sender','LUTECE'),('unblock_user_mail_subject','Votre IP a Ã©tÃ© bloquÃ©e'),('enable_unblock_ip','false'),('notify_user_password_expired',''),('password_expired_mail_sender','LUTECE'),('password_expired_mail_subject','Votre mot de passe a expirÃ©'),('mail_lost_password_sender','LUTECE'),('mail_lost_password_subject','Votre mot de passe a Ã©tÃ© rÃ©initialisÃ©'),('mail_password_encryption_changed_sender','LUTECE'),('mail_password_encryption_changed_subject','Votre mot de passe a Ã©tÃ© rÃ©initialisÃ©');
/*!40000 ALTER TABLE `mylutece_database_user_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_user_password_history`
--

DROP TABLE IF EXISTS `mylutece_database_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_user_password_history` (
  `mylutece_database_user_id` int NOT NULL,
  `password` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_password_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mylutece_database_user_id`,`date_password_change`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_user_password_history`
--

LOCK TABLES `mylutece_database_user_password_history` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_database_user_role`
--

DROP TABLE IF EXISTS `mylutece_database_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_user_role` (
  `mylutece_database_user_id` int NOT NULL DEFAULT '0',
  `role_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mylutece_database_user_id`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_database_user_role`
--

LOCK TABLES `mylutece_database_user_role` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_user_anonymize_field`
--

DROP TABLE IF EXISTS `mylutece_user_anonymize_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_user_anonymize_field` (
  `field_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `anonymize` smallint NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_user_anonymize_field`
--

LOCK TABLES `mylutece_user_anonymize_field` WRITE;
/*!40000 ALTER TABLE `mylutece_user_anonymize_field` DISABLE KEYS */;
INSERT INTO `mylutece_user_anonymize_field` VALUES ('login',1),('name_given',1),('name_family',1),('email',1);
/*!40000 ALTER TABLE `mylutece_user_anonymize_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mylutece_user_field`
--

DROP TABLE IF EXISTS `mylutece_user_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_user_field` (
  `id_user_field` int NOT NULL DEFAULT '0',
  `id_user` int DEFAULT NULL,
  `id_attribute` int DEFAULT NULL,
  `id_field` int DEFAULT NULL,
  `user_field_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_user_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mylutece_user_field`
--

LOCK TABLES `mylutece_user_field` WRITE;
/*!40000 ALTER TABLE `mylutece_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_user_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifygru_alert_update_resource_state_queue`
--

DROP TABLE IF EXISTS `notifygru_alert_update_resource_state_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifygru_alert_update_resource_state_queue` (
  `id_resource_queue` int NOT NULL AUTO_INCREMENT,
  `id_resource` int NOT NULL,
  `id_resource_history` int NOT NULL,
  `id_task` int NOT NULL,
  `resource_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_external_parent` int NOT NULL DEFAULT '0',
  `id_workflow` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alert_reference_date` timestamp NOT NULL,
  `id_state` int NOT NULL,
  PRIMARY KEY (`id_resource_queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifygru_alert_update_resource_state_queue`
--

LOCK TABLES `notifygru_alert_update_resource_state_queue` WRITE;
/*!40000 ALTER TABLE `notifygru_alert_update_resource_state_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifygru_alert_update_resource_state_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_form`
--

DROP TABLE IF EXISTS `poll_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poll_form` (
  `id_poll_form` int NOT NULL AUTO_INCREMENT,
  `id_form` int NOT NULL DEFAULT '0',
  `is_visible` smallint NOT NULL,
  `title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `btn_title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `btn_url` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `btn_is_visible` smallint NOT NULL,
  PRIMARY KEY (`id_poll_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_form`
--

LOCK TABLES `poll_form` WRITE;
/*!40000 ALTER TABLE `poll_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_form_question`
--

DROP TABLE IF EXISTS `poll_form_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poll_form_question` (
  `id_poll_form_question` int NOT NULL AUTO_INCREMENT,
  `id_poll_form` int NOT NULL DEFAULT '0',
  `id_form` int NOT NULL DEFAULT '0',
  `id_question` int NOT NULL DEFAULT '0',
  `chart_type` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `chart_is_toolbox` smallint NOT NULL,
  `chart_is_checked` smallint NOT NULL,
  PRIMARY KEY (`id_poll_form_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_form_question`
--

LOCK TABLES `poll_form_question` WRITE;
/*!40000 ALTER TABLE `poll_form_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_form_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_action`
--

DROP TABLE IF EXISTS `profile_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `name_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_permission` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_action`
--

LOCK TABLES `profile_action` WRITE;
/*!40000 ALTER TABLE `profile_action` DISABLE KEYS */;
INSERT INTO `profile_action` VALUES (1,'profiles.action.modify_profile.name','profiles.action.modify_profile.description','jsp/admin/plugins/profiles/ModifyProfile.jsp','edit','MODIFY_PROFILE'),(2,'profiles.action.delete_profile.name','profiles.action.delete_profile.description','jsp/admin/plugins/profiles/RemoveProfile.jsp','trash','DELETE_DELETE'),(3,'profiles.action.manage_users_assignment.name','profiles.action.manage_users_assignment.description','jsp/admin/plugins/profiles/AssignUsersProfile.jsp','user','MANAGE_USERS_ASSIGNMENT'),(4,'profiles.action.manage_rights_assignment.name','profiles.action.manage_rights_assignment.description','jsp/admin/plugins/profiles/AssignRightsProfile.jsp','lock','MANAGE_RIGHTS_ASSIGNMENT'),(5,'profiles.action.manage_roles_assignment.name','profiles.action.manage_roles_assignment.description','jsp/admin/plugins/profiles/AssignRolesProfile.jsp','th-list','MANAGE_ROLES_ASSIGNMENT'),(6,'profiles.action.manage_workgroups_assignment.name','profiles.action.manage_workgroups_assignment.description','jsp/admin/plugins/profiles/AssignWorkgroupsProfile.jsp','group','MANAGE_WORKGROUPS_ASSIGNMENT'),(7,'profiles.action.manage_view_assignment.name','profiles.action.manage_view_assignment.description','jsp/admin/plugins/profiles/AssignViewProfile.jsp','eye','MANAGE_VIEW_ASSIGNMENT');
/*!40000 ALTER TABLE `profile_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_profile`
--

DROP TABLE IF EXISTS `profile_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_profile` (
  `profile_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `profile_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_profile`
--

LOCK TABLES `profile_profile` WRITE;
/*!40000 ALTER TABLE `profile_profile` DISABLE KEYS */;
INSERT INTO `profile_profile` VALUES ('forms_admin','Admin manager for Forms - create, update and delete forms'),('forms_response_manager','User that manage responses made through forms'),('technical_admin_forms','Admin technical manager that can configure all necessary features to admin forms');
/*!40000 ALTER TABLE `profile_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_right`
--

DROP TABLE IF EXISTS `profile_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_right` (
  `profile_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_right` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`id_right`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_right`
--

LOCK TABLES `profile_right` WRITE;
/*!40000 ALTER TABLE `profile_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_role`
--

DROP TABLE IF EXISTS `profile_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_role` (
  `profile_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `role_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_role`
--

LOCK TABLES `profile_role` WRITE;
/*!40000 ALTER TABLE `profile_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_user`
--

DROP TABLE IF EXISTS `profile_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_user` (
  `profile_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`profile_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_user`
--

LOCK TABLES `profile_user` WRITE;
/*!40000 ALTER TABLE `profile_user` DISABLE KEYS */;
INSERT INTO `profile_user` VALUES ('forms_admin',5),('forms_response_manager',5),('technical_admin_forms',5);
/*!40000 ALTER TABLE `profile_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_view`
--

DROP TABLE IF EXISTS `profile_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view` (
  `view_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `view_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`view_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_view`
--

LOCK TABLES `profile_view` WRITE;
/*!40000 ALTER TABLE `profile_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_view_action`
--

DROP TABLE IF EXISTS `profile_view_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `name_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `action_permission` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_view_action`
--

LOCK TABLES `profile_view_action` WRITE;
/*!40000 ALTER TABLE `profile_view_action` DISABLE KEYS */;
INSERT INTO `profile_view_action` VALUES (1,'profiles.action.modify_view.name','profiles.action.modify_view.description','jsp/admin/plugins/profiles/ModifyView.jsp','edit','MODIFY_VIEW'),(2,'profiles.action.delete_view.name','profiles.action.delete_view.description','jsp/admin/plugins/profiles/RemoveView.jsp','trash','DELETE_VIEW'),(3,'profiles.action.manage_views_assignment.name','profiles.action.manage_views_assignment.description','jsp/admin/plugins/profiles/AssignProfilesView.jsp','user-tag','MANAGE_PROFILES_ASSIGNMENT'),(4,'profiles.action.manage_dashboards.name','profiles.action.manage_dashboards.description','jsp/admin/plugins/profiles/ManageDashboards.jsp','wrench','MANAGE_DASHBOARDS');
/*!40000 ALTER TABLE `profile_view_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_view_dashboard`
--

DROP TABLE IF EXISTS `profile_view_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view_dashboard` (
  `view_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `dashboard_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dashboard_column` int NOT NULL,
  `dashboard_order` int NOT NULL,
  PRIMARY KEY (`view_key`,`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_view_dashboard`
--

LOCK TABLES `profile_view_dashboard` WRITE;
/*!40000 ALTER TABLE `profile_view_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_view_profile`
--

DROP TABLE IF EXISTS `profile_view_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view_profile` (
  `view_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `profile_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`view_key`,`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_view_profile`
--

LOCK TABLES `profile_view_profile` WRITE;
/*!40000 ALTER TABLE `profile_view_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_workgroup`
--

DROP TABLE IF EXISTS `profile_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_workgroup` (
  `profile_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_workgroup`
--

LOCK TABLES `profile_workgroup` WRITE;
/*!40000 ALTER TABLE `profile_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_workgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencelist_item`
--

DROP TABLE IF EXISTS `referencelist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencelist_item` (
  `id_reference_item` int NOT NULL AUTO_INCREMENT,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `idreference` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_reference_item`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencelist_item`
--

LOCK TABLES `referencelist_item` WRITE;
/*!40000 ALTER TABLE `referencelist_item` DISABLE KEYS */;
INSERT INTO `referencelist_item` VALUES (1,'Woman','F',1),(2,'Man','H',1),(3,'Undefined','U',1),(4,'Environment','env',2),(6,'City shift','move',2),(7,'City cleanliness','clean',2),(8,'Healthcare','health',2);
/*!40000 ALTER TABLE `referencelist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencelist_reference`
--

DROP TABLE IF EXISTS `referencelist_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencelist_reference` (
  `id_reference` int NOT NULL AUTO_INCREMENT,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_reference`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencelist_reference`
--

LOCK TABLES `referencelist_reference` WRITE;
/*!40000 ALTER TABLE `referencelist_reference` DISABLE KEYS */;
INSERT INTO `referencelist_reference` VALUES (1,'Gender','Gender list'),(2,'Types of demands','Demand\'s type ');
/*!40000 ALTER TABLE `referencelist_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referencelist_translation`
--

DROP TABLE IF EXISTS `referencelist_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencelist_translation` (
  `id_translation` int NOT NULL AUTO_INCREMENT,
  `lang` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_reference_item` int NOT NULL,
  PRIMARY KEY (`id_translation`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referencelist_translation`
--

LOCK TABLES `referencelist_translation` WRITE;
/*!40000 ALTER TABLE `referencelist_translation` DISABLE KEYS */;
INSERT INTO `referencelist_translation` VALUES (1,'fr','Femme',1),(2,'fr','Homme',2),(3,'fr','Non dÃ©fini',3),(4,'fr','Environnement',4),(5,'fr','DÃ©placements',6),(6,'fr','PropretÃ©',7),(7,'fr','SantÃ©',8);
/*!40000 ALTER TABLE `referencelist_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regularexpression_regular_expression`
--

DROP TABLE IF EXISTS `regularexpression_regular_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regularexpression_regular_expression` (
  `id_expression` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `regular_expression_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `valid_exemple` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `information_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `error_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_expression`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regularexpression_regular_expression`
--

LOCK TABLES `regularexpression_regular_expression` WRITE;
/*!40000 ALTER TABLE `regularexpression_regular_expression` DISABLE KEYS */;
INSERT INTO `regularexpression_regular_expression` VALUES (1,'Fichier JPG','image/jpeg','image/jpeg','Expression rÃ©guliÃ¨re pour les fichiers de type jpeg.','Le format du fichier n\'est pas valide. Veuillez choisir une image de type jpeg.'),(2,'Email','(^([a-zA-Z0-9]+(([\\.\\-\\_]?[a-zA-Z0-9]+)+)?)\\@(([a-zA-Z0-9]+[\\.\\-\\_])+[a-zA-Z]{2,4})$)|(^$)','admin@lutece.fr','Expression rÃ©guliÃ¨re pour les emails.','Le format de l\'email est incorrect.');
/*!40000 ALTER TABLE `regularexpression_regular_expression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_resource`
--

DROP TABLE IF EXISTS `resource_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_resource` (
  `id_resource` int NOT NULL DEFAULT '0',
  `resource_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `resource_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_resource`),
  KEY `resource_resource_type_idx` (`resource_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_resource`
--

LOCK TABLES `resource_resource` WRITE;
/*!40000 ALTER TABLE `resource_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_friendly_url`
--

DROP TABLE IF EXISTS `seo_friendly_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seo_friendly_url` (
  `id_url` int NOT NULL DEFAULT '0',
  `friendly_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `technical_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modification` timestamp NOT NULL DEFAULT '2012-10-09 22:00:00',
  `is_canonical` int NOT NULL DEFAULT '0',
  `is_sitemap` int NOT NULL DEFAULT '0',
  `sitemap_lastmod` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `sitemap_changefreq` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `sitemap_priority` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_friendly_url`
--

LOCK TABLES `seo_friendly_url` WRITE;
/*!40000 ALTER TABLE `seo_friendly_url` DISABLE KEYS */;
INSERT INTO `seo_friendly_url` VALUES (1,'/sitemap.html','/jsp/site/Portal.jsp?page=map','2022-02-15 14:55:06','2012-10-09 22:00:00',1,1,'2012-10-10','monthly','0.8'),(2,'/contacts.html','/jsp/site/Portal.jsp?page=contact','2022-02-15 14:55:06','2012-10-09 22:00:00',1,1,'2012-10-10','monthly','0.8'),(3,'/credits.html','/jsp/site/PopupCredits.jsp','2022-02-15 14:55:06','2012-10-09 22:00:00',1,1,'2012-10-10','monthly','0.8'),(4,'/home.html','/jsp/site/Portal.jsp?page_id=1','2022-02-15 15:26:31','2012-10-09 22:00:00',1,1,'2014-06-08','weekly','0.7'),(5,'/page-1.html','/jsp/site/Portal.jsp?page_id=2','2022-02-15 15:26:31','2012-10-09 22:00:00',1,1,'2014-06-08','weekly','0.7');
/*!40000 ALTER TABLE `seo_friendly_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_properties`
--

DROP TABLE IF EXISTS `seo_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seo_properties` (
  `property_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `property_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`property_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_properties`
--

LOCK TABLES `seo_properties` WRITE;
/*!40000 ALTER TABLE `seo_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_rule`
--

DROP TABLE IF EXISTS `seo_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seo_rule` (
  `id_rule` int NOT NULL DEFAULT '0',
  `rule_from` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rule_to` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_rule`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_rule`
--

LOCK TABLES `seo_rule` WRITE;
/*!40000 ALTER TABLE `seo_rule` DISABLE KEYS */;
INSERT INTO `seo_rule` VALUES (1,'/page/([0-9]+)','/jsp/site/Portal.jsp?page_id=$1'),(2,'/app/([a-z]+)','/jsp/site/Portal.jsp?page=$1'),(3,'/map','/jsp/site/Portal.jsp?page=map');
/*!40000 ALTER TABLE `seo_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solr_facet_intersection`
--

DROP TABLE IF EXISTS `solr_facet_intersection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solr_facet_intersection` (
  `id_field1` int DEFAULT NULL,
  `id_field2` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solr_facet_intersection`
--

LOCK TABLES `solr_facet_intersection` WRITE;
/*!40000 ALTER TABLE `solr_facet_intersection` DISABLE KEYS */;
/*!40000 ALTER TABLE `solr_facet_intersection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solr_fields`
--

DROP TABLE IF EXISTS `solr_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solr_fields` (
  `id_field` int NOT NULL,
  `name` varchar(75) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_facet` tinyint(1) DEFAULT '0',
  `enable_facet` tinyint(1) DEFAULT '0',
  `is_sort` tinyint(1) DEFAULT '0',
  `enable_sort` tinyint(1) DEFAULT '0',
  `default_sort` tinyint(1) DEFAULT '0',
  `weight` float DEFAULT '0',
  `facet_mincount` int DEFAULT '1',
  `operator_type` varchar(30) COLLATE utf8mb3_unicode_ci DEFAULT 'OR',
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solr_fields`
--

LOCK TABLES `solr_fields` WRITE;
/*!40000 ALTER TABLE `solr_fields` DISABLE KEYS */;
INSERT INTO `solr_fields` VALUES (1,'site','Site','Site',1,1,0,0,0,0,1,'OR'),(2,'type','Type','Type',1,1,0,0,0,0,1,'OR'),(3,'date','Date','Date',1,1,1,1,0,0,1,'OR'),(4,'score','Score','Score',0,0,1,1,1,0,1,'OR'),(5,'categorie','Categorie','Category',1,1,0,0,0,0,1,'OR'),(6,'title','title','Title',0,0,0,0,0,10,1,'AND'),(7,'content','content','Content',0,0,0,0,0,0.1,1,'AND'),(8,'summary','summary','Summary',0,0,0,0,0,1,1,'AND');
/*!40000 ALTER TABLE `solr_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solr_indexer_action`
--

DROP TABLE IF EXISTS `solr_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solr_indexer_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `id_document` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_task` int NOT NULL DEFAULT '0',
  `type_ressource` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_portlet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solr_indexer_action`
--

LOCK TABLES `solr_indexer_action` WRITE;
/*!40000 ALTER TABLE `solr_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `solr_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_alert`
--

DROP TABLE IF EXISTS `task_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_alert` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL DEFAULT '0',
  `reference_date` timestamp NULL DEFAULT NULL,
  `is_active` smallint NOT NULL DEFAULT '1',
  `is_executed` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_history`,`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_alert`
--

LOCK TABLES `task_alert` WRITE;
/*!40000 ALTER TABLE `task_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_alert_cf`
--

DROP TABLE IF EXISTS `task_alert_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_alert_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `id_form` int NOT NULL DEFAULT '0',
  `id_state_after_deadline` int NOT NULL DEFAULT '0',
  `id_question_date` int NOT NULL DEFAULT '0',
  `nb_days_to_date` int NOT NULL DEFAULT '0',
  `id_retrieval_type` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_alert_cf`
--

LOCK TABLES `task_alert_cf` WRITE;
/*!40000 ALTER TABLE `task_alert_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_alert_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_create_pdf_cf`
--

DROP TABLE IF EXISTS `task_create_pdf_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_create_pdf_cf` (
  `id_task` int NOT NULL,
  `id_form` int DEFAULT NULL,
  `id_question_url_pdf` int DEFAULT NULL,
  `id_config` int DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_create_pdf_cf`
--

LOCK TABLES `task_create_pdf_cf` WRITE;
/*!40000 ALTER TABLE `task_create_pdf_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_create_pdf_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_control`
--

DROP TABLE IF EXISTS `template_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_control` (
  `id_control` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `error_message` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `validator_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `control_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_control_target` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_control`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_control`
--

LOCK TABLES `template_control` WRITE;
/*!40000 ALTER TABLE `template_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_control_question`
--

DROP TABLE IF EXISTS `template_control_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_control_question` (
  `id_control` int NOT NULL,
  `id_question` int NOT NULL,
  PRIMARY KEY (`id_control`,`id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_control_question`
--

LOCK TABLES `template_control_question` WRITE;
/*!40000 ALTER TABLE `template_control_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_control_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_control_question_mapping`
--

DROP TABLE IF EXISTS `template_control_question_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_control_question_mapping` (
  `id_control` int NOT NULL,
  `id_question` int NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_control`,`id_question`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_control_question_mapping`
--

LOCK TABLES `template_control_question_mapping` WRITE;
/*!40000 ALTER TABLE `template_control_question_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_control_question_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_display`
--

DROP TABLE IF EXISTS `template_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_display` (
  `id_display` int NOT NULL AUTO_INCREMENT,
  `id_template` int DEFAULT '0',
  `id_composite` int DEFAULT '0',
  `id_parent` int DEFAULT '0',
  `display_order` int DEFAULT '0',
  `composite_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `display_depth` int DEFAULT '0',
  PRIMARY KEY (`id_display`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_display`
--

LOCK TABLES `template_display` WRITE;
/*!40000 ALTER TABLE `template_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_entry`
--

DROP TABLE IF EXISTS `template_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_entry` (
  `id_entry` int NOT NULL AUTO_INCREMENT,
  `id_type` int NOT NULL DEFAULT '0',
  `title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `help_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `comment` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `mandatory` smallint DEFAULT NULL,
  `fields_in_line` smallint DEFAULT NULL,
  `pos` int DEFAULT NULL,
  `field_unique` smallint DEFAULT NULL,
  `css_class` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pos_conditional` int DEFAULT '0',
  `error_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_only_display_back` smallint DEFAULT '0',
  `is_indexed` smallint DEFAULT '0',
  PRIMARY KEY (`id_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_entry`
--

LOCK TABLES `template_entry` WRITE;
/*!40000 ALTER TABLE `template_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_field`
--

DROP TABLE IF EXISTS `template_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_field` (
  `id_field` int NOT NULL AUTO_INCREMENT,
  `id_entry` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `default_value` smallint DEFAULT NULL,
  `pos` int DEFAULT NULL,
  `value_type_date` date DEFAULT NULL,
  `no_display_title` smallint DEFAULT NULL,
  `comment` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_field`
--

LOCK TABLES `template_field` WRITE;
/*!40000 ALTER TABLE `template_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_group`
--

DROP TABLE IF EXISTS `template_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_group` (
  `id_group` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `id_template` int DEFAULT '0',
  `iteration_min` int DEFAULT '1',
  `iteration_max` int DEFAULT '1',
  `iteration_add_label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `iteration_remove_label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_group`
--

LOCK TABLES `template_group` WRITE;
/*!40000 ALTER TABLE `template_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_question`
--

DROP TABLE IF EXISTS `template_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_question` (
  `id_question` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `id_entry` int DEFAULT '0',
  `id_template` int DEFAULT '0',
  `is_visible_multiview_global` smallint NOT NULL DEFAULT '0',
  `is_visible_multiview_form_selected` smallint NOT NULL DEFAULT '0',
  `multiview_column_order` int NOT NULL DEFAULT '0',
  `column_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `is_filterable_multiview_global` smallint NOT NULL DEFAULT '0',
  `is_filterable_multiview_form_selected` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_question`
--

LOCK TABLES `template_question` WRITE;
/*!40000 ALTER TABLE `template_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_referenceitem_field`
--

DROP TABLE IF EXISTS `template_referenceitem_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_referenceitem_field` (
  `id_field` int NOT NULL DEFAULT '0',
  `id_item` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_referenceitem_field`
--

LOCK TABLES `template_referenceitem_field` WRITE;
/*!40000 ALTER TABLE `template_referenceitem_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_referenceitem_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_step`
--

DROP TABLE IF EXISTS `template_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_step` (
  `id_template` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_step`
--

LOCK TABLES `template_step` WRITE;
/*!40000 ALTER TABLE `template_step` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unittree_action`
--

DROP TABLE IF EXISTS `unittree_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unittree_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `name_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `action_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `icon_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `action_permission` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `action_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unittree_action`
--

LOCK TABLES `unittree_action` WRITE;
/*!40000 ALTER TABLE `unittree_action` DISABLE KEYS */;
INSERT INTO `unittree_action` VALUES (1,'unittree.unit.action.createUnit.name','unittree.unit.action.createUnit.description','jsp/admin/plugins/unittree/CreateUnit.jsp','plus','CREATE','unittree.unitAction'),(2,'unittree.unit.action.modifyUnit.name','unittree.unit.action.modifyUnit.description','jsp/admin/plugins/unittree/ModifyUnit.jsp','edit','MODIFY','unittree.unitAction'),(3,'unittree.unit.action.deleteUnit.name','unittree.unit.action.deleteUnit.description','jsp/admin/plugins/unittree/RemoveUnit.jsp','trash','DELETE','unittree.unitAction'),(5,'unittree.user.action.moveUser.name','unittree.user.action.moveUser.description','jsp/admin/plugins/unittree/MoveUser.jsp','sort','MOVE_USER','unittree.unitUserAction'),(6,'unittree.user.action.removeUser.name','unittree.user.action.removeUser.description','jsp/admin/plugins/unittree/RemoveUser.jsp','user-times','REMOVE_USER','unittree.unitUserAction'),(10,'unittree.unit.action.moveSubTree.name','unittree.unit.action.moveSubTree.description','jsp/admin/plugins/unittree/MoveSubTree.jsp','sort','MOVE_SUB_TREE','unittree.unitAction');
/*!40000 ALTER TABLE `unittree_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unittree_unit`
--

DROP TABLE IF EXISTS `unittree_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unittree_unit` (
  `id_unit` int NOT NULL DEFAULT '0',
  `id_parent` int NOT NULL DEFAULT '0',
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_unit`),
  KEY `index_unittree_unit_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unittree_unit`
--

LOCK TABLES `unittree_unit` WRITE;
/*!40000 ALTER TABLE `unittree_unit` DISABLE KEYS */;
INSERT INTO `unittree_unit` VALUES (0,-1,'ROOT','Racine','Racine des entitÃ©s');
/*!40000 ALTER TABLE `unittree_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unittree_unit_assignment`
--

DROP TABLE IF EXISTS `unittree_unit_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unittree_unit_assignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_resource` int NOT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_assignor_unit` int NOT NULL DEFAULT '0',
  `id_assigned_unit` int NOT NULL DEFAULT '0',
  `assignment_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `assignment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_unittree_unit_assignment_resource` (`id_resource`,`resource_type`),
  KEY `index_unittree_unit_assignment_id_assigned_unit` (`id_assigned_unit`,`assignment_date`),
  KEY `index_unittree_unit_assignment_id_assignor_unit` (`id_assignor_unit`,`assignment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unittree_unit_assignment`
--

LOCK TABLES `unittree_unit_assignment` WRITE;
/*!40000 ALTER TABLE `unittree_unit_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `unittree_unit_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unittree_unit_user`
--

DROP TABLE IF EXISTS `unittree_unit_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unittree_unit_user` (
  `id_unit` int NOT NULL DEFAULT '0',
  `id_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_unit`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unittree_unit_user`
--

LOCK TABLES `unittree_unit_user` WRITE;
/*!40000 ALTER TABLE `unittree_unit_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `unittree_unit_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userassignment_resource_user`
--

DROP TABLE IF EXISTS `userassignment_resource_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userassignment_resource_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_resource` int NOT NULL DEFAULT '0',
  `resource_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `assignment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userassignment_resource_user_id_resource_fk` (`id_resource`),
  KEY `userassignment_resource_user_resource_type_fk` (`resource_type`),
  KEY `userassignment_resource_user_id_admin_fk` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userassignment_resource_user`
--

LOCK TABLES `userassignment_resource_user` WRITE;
/*!40000 ALTER TABLE `userassignment_resource_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `userassignment_resource_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_action`
--

DROP TABLE IF EXISTS `workflow_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_action` (
  `id_action` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `id_workflow` int DEFAULT NULL,
  `id_state_before` int DEFAULT NULL,
  `id_state_after` int DEFAULT NULL,
  `id_icon` int DEFAULT NULL,
  `is_automatic` smallint DEFAULT '0',
  `is_mass_action` smallint DEFAULT '0',
  `display_order` int DEFAULT '0',
  `is_automatic_reflexive_action` smallint DEFAULT '0',
  PRIMARY KEY (`id_action`),
  KEY `action_id_workflow_fk` (`id_workflow`),
  KEY `action_id_state_before_fk` (`id_state_before`),
  KEY `action_id_state_after_fk` (`id_state_after`),
  KEY `action_id_icon_fk` (`id_icon`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_action`
--

LOCK TABLES `workflow_action` WRITE;
/*!40000 ALTER TABLE `workflow_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_action_action`
--

DROP TABLE IF EXISTS `workflow_action_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_action_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `id_linked_action` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`,`id_linked_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_action_action`
--

LOCK TABLES `workflow_action_action` WRITE;
/*!40000 ALTER TABLE `workflow_action_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_action_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_assignment_history`
--

DROP TABLE IF EXISTS `workflow_assignment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_assignment_history` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL,
  `workgroup_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_history`,`id_task`,`workgroup_key`),
  KEY `assignment_id_history_fk` (`id_history`),
  KEY `assignment_id_task_fk` (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_assignment_history`
--

LOCK TABLES `workflow_assignment_history` WRITE;
/*!40000 ALTER TABLE `workflow_assignment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assignment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_forms_auto_assignment`
--

DROP TABLE IF EXISTS `workflow_forms_auto_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_forms_auto_assignment` (
  `id_task` int NOT NULL,
  `id_question` int NOT NULL,
  `value` int NOT NULL,
  `workgroup_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_task`,`id_question`,`value`,`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_forms_auto_assignment`
--

LOCK TABLES `workflow_forms_auto_assignment` WRITE;
/*!40000 ALTER TABLE `workflow_forms_auto_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_forms_auto_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_forms_auto_assignment_cf`
--

DROP TABLE IF EXISTS `workflow_forms_auto_assignment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_forms_auto_assignment_cf` (
  `id_task` int NOT NULL,
  `id_form` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_notify` smallint DEFAULT '0',
  `sender_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_view_form_response` smallint NOT NULL DEFAULT '0',
  `label_link_view_form_response` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `recipients_bcc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_forms_auto_assignment_cf`
--

LOCK TABLES `workflow_forms_auto_assignment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_forms_auto_assignment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_forms_auto_assignment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_forms_auto_assignment_ef`
--

DROP TABLE IF EXISTS `workflow_forms_auto_assignment_ef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_forms_auto_assignment_ef` (
  `id_task` int NOT NULL,
  `position_form_question_file` int NOT NULL,
  PRIMARY KEY (`id_task`,`position_form_question_file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_forms_auto_assignment_ef`
--

LOCK TABLES `workflow_forms_auto_assignment_ef` WRITE;
/*!40000 ALTER TABLE `workflow_forms_auto_assignment_ef` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_forms_auto_assignment_ef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_icon`
--

DROP TABLE IF EXISTS `workflow_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_icon` (
  `id_icon` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mime_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_value` mediumblob,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  PRIMARY KEY (`id_icon`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_icon`
--

LOCK TABLES `workflow_icon` WRITE;
/*!40000 ALTER TABLE `workflow_icon` DISABLE KEYS */;
INSERT INTO `workflow_icon` VALUES (1,'Valider','image/png',_binary 'PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0×©\Í\Ê\0\0¼PLTEÿÿÿýýýûûûüüüùùù\ö\ö\ö\ó\ó\ó\Ò\Ò\Òúúú\ë\ë\ë\Ø\Ø\Ø\Ó\ÓÓ²\ÇÛ³³³±±±³Î®\ÊwÀc¶}}}O~ªGqNNN\røøø\õ\õ\õ\ô\ô\ô\ñ\ñ\ñ\ð\ð\ð\î\î\î\í\í\í\ê\ê\ê\ç\ç\ç\â\â\â\á\á\á\×\â\ì\Þ\Þ\Þ\Û\Û\Û\Ö\Ö\Ö\Õ\Õ\Õ\Ñ\Ñ\Ñ\Ï\Ï\ÏÁ\Ò\â\Î\Î\Î\Ë\Ë\Ë\Ê\ÊÊº\Í\ß\Å\Å\Å\Ã\ÃÃ¯\ÅÏ­\ÃØ©ÀÖ¤½Õ£¼Ô´µµ²²²«««©©©¨¨¨­Ç§§§¬É«É£££}¡ÂzÁx¿v¿r½f·bµ_´]´Y²X±W°U°T¯yyywwwuuuN}©sssLy£nnnItHsGr[htGlBjBi___@f]^^=b<`VY[<_~PZ`VVV5VtOOOKOR3Rn3Qk2Qm@LT:M^HHH<AC<?A)AX<<<1>I(=Q&<Q$:O\'9J&9I$7I,5;-01!2B&08,,,-=+:\'\'\'#(,%%%$$$(	\ËS%\0\0\0tRNS\0@\æ\Øf\0\0\0ûIDATx\Úc`À°Ffl¢\\bb\ZX$llKx90\Å\rùE»ù°\è®)¡U\Ê/\Úf\ÅUeâº\Z¬³u;yY\á|V&\Z\ÆS?\ñXu¸7Ø´YÀ6û\å\õZ\É\Â5pV«\Ö;²10°\ç\õ\år#¬fv\æ©\ñc\Ìr\ðÎ\èÆd§t¹»g£OtOX{J\05\nµ\ô¥L\nTFq+Kz¼¯«}Tmª\ä[BBE%R5ÑÉ®N$&®R\ÒI\Ý\Ï2i	ùz,±¦\ÒU\Ø!é¢%Ù\'Gp³`:%v5Vi\0\0\ÇK+ù; \Ö\0\0\0\0IEND®B`',14,14),(2,'Refuser','image/png',_binary 'PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0×©\Í\Ê\0\0CPLTEÿÿÿüüüýýýûûû\ÃL6úúú\÷\÷\÷\è\è\è\ö\ö\öùùù\ò\ò\ò\æ\æ\æ¾;\"º:\"\ñ\ñ\ñ\ì\ì\ì\ë\ë\ë\à\à\à\ß\ß\ß\Ç\ÇÇ´´´;\å\å\å\â\â\â\á\á\á\Ô\Ô\Ô\Í\Í\Í\Ê\Ê\Ê\É\É\É\Å\ÅÅ¾¾¾®®®¥¥¥£££   \Ëxhqqq\ÈN7\ÆM7\ÄM6mmmÀ;\"¿;\"½;\"___¼;\"»;\"º;\"¹;$·9\"\\\\\\²8!WWWTTT.NL<--øøø\ô\ô\ô\ó\ó\ó\î\î\î\í\í\í\é\é\é\ç\ç\ç\ã\ã\ã\Ü\Ü\Ü\×\×\×\Ö\Ö\Ö\Ó\Ó\Ó\Ð\Ð\Ð\Ï\Ï\Ï\Æ\Æ\ÆÁÁÁ¹¹¹¸¸¸¶¶¶µµµ°°°ªªª§§§¤¤¤Ý}\Ñp\Ùp[\Öo[\Íra\Ìra\Êm[Án^\ÎfS\ÓcN\Ð_I~~~zzz°cTxxxvvv\ÉVA\ÎR:ttt´[Jrrrnnn\ÂM6llljjj\ÂF/\ÂA)ccc­F2¾?\'½?(½=%\Â;\"¸>\'½<$¶=&¹:\"´:#¶9\"´9\"°7 ­6 ¢:&¡5!QQQ11/0//,&&>>>P3.;86e$F/*\\%50.W!B 9\";\Z&&&<N\rI$$$3A7\Z5.- ,.107%\Z&\Z/$(\n\"\r#%\n,!			Vo\0\0\0tRNS\0@\æ\Øf\0\0sIDATx\Úc` .°fcq\á1s\çk°³AØK\ÈqA¥fdr0Ù¾kSª7K\ò1%§e\ä«Y\nq00\È.«4\Û\è\Ç\r\Ñ\Â<ESK}F±8\à¦xITü¡\Â\ëYxxXfºlIn²·L\ÑjW5¶®±è®\É;³¥`Nd²b\Ñ\Ó7,*\è\ÛW¢ \Å\Ï\nw/+{%/¯jë¶©\á\Âü\ÌH^\ä\ä6Z\Þ\È\Ëkl©!i\ìw&\Ù\r5MúzmV±ÜH>ûk\'l-\Õ\Õn·fGØ´PÙ wwª(\Ð\Ù-k\ä\á®Ê\Øl¶\'[Á[eºf\çj.?\æ%\Ô\õ\ì(Wb0±P«\ïX%\"\õù\ìýªdøY\Ù$L\ÍU»V	A\Ìb[¾]\'\Ô\Ëh\'Îu\Ý\ò\âPK¸\ÜEd\ØÁ®\ä\ËUv#³=\Ô\õl\ì®nN6H\Ñ\Éc3³q°\âK\071P\ë\ê£\â\Ô\0\0\0\0IEND®B`',14,14),(3,'Commentaire','image/png',_binary 'PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szz\ô\0\0\0gAMA\0\0\ÙÜ²\Ú\0\0xIDATxÅMl\é\Çÿ\óe\Ç\ÄÍ\rd\í¸4Â£©!(@\Ô\"N8J{\ØmÃ¡j¥H¸Q R7\Ùj¥*=*U\à\Â\n@|\ä@Ll\ÇÞuL$\'1¬g<¶\Ç3\ó>=DÙ¬\×vª~ü¥\÷4\ï¼\Ï\ïy\Þyþ\ó\0ÿg	nÜ¿\÷\éÓ§O\ð<\ÏË²\×4-\÷\0+\Ýx\êÔ©Áß¬®®\â\íÛ·\Éx<þM$	Á\ÙH$\òm:~¿]\0®\Ìs\á\êÕ«¿w:wuuý\Ê\ívlA$I\Ì\årH&\Ë\ñxüKKKQÆV\ìl\"$I\\ ~Y	`\Ã\ì\ìl\ÖT(H7Ê&es9\Êf³\Ë\å(\ÏS¡P J511\ØÈ°\ãÜ¹s¿ÞµkWý·H\É2\ädln\Ó	N@À®\ëe\Çq0Ms\Ë\åj\rB!¾\\	xGN\ÓLb~dz>±º\Z \Çq\ÛZ1\ìÜ¹³vhh\è\ó\Æ\Æ\Æv¾¿¿ÿ\È\ñ\ã\ÇY\nP]Ws|ZK,}}\0c\\aQqp8ü]$Y=:244t\ôÆI$Y\Ç\Æ\Æ\Æ\0\è\ëÁ«,X\Z\Z°:0\0iÂª\ë \ã\Ê}\ÃÅ[,\Ãá®\ë	\ñÒ¥KWc±\ç\âÅutt\àþýû¡\æ\æ\æ¶\ñ\ñ\ñ?-,,¤cE?\ï\ê\ã8\ð\î\Ì4ÿ\í\n\0À\ì\ì\ì\0Y ¢\å`0ª­­=°g\ÏûÞ½{aØÛ¨ª¿¿ÿn·»^Vd3\è<¤\Ó\à%	*\ö±\r	\0UU166v+=\0è±§O¾N¥R¶¶¶]½½½\Õ\Ô\Ô\Øß½{W·o\ß>\Ó\é´=¾$aþ/PN£\Æ\ïx\ÜZY+]$!HÐµk\×FEùf=<\Å^½z\õ*\nÙN\çÞ\Æ\î\înW>·(¹$¾\÷\×_ce~m\ÃÃ°UU\Ûv¢`0\Zý3\ä\æ\Z\ê\0g<y¢X,\Ï\ç«\óx<ª(H¨*ÒÒ|ú|°»ø¢(\âÙ³g±¯\0d¶^\"R%899e\Ù\Û\Ð\Ð\Ð\ä\ñx\Ð\èp ®³?\óûQ]U\"\ÚV\à\Í\0/_¾\\¼}û\ö\ß\0\äX\Ñuý\ïw\ï\ÞýRe<þ]\ÃnEÁqx/[\î­Á×µ¹}K9a\Î\ï\÷K½½½\ðz½F4\Z®\ë0\×ZP¤Yo]¬y¼È®®.¿ \ðz½°\Ùlªª°Z­Â\'\àr¹`hÍ7\Ü\nSL¥\0D¿ß¿oýà¦¦&:t\Ã\á@(\ÂÀÀ\08\0\Æ\Ø2,R±l6[\ë\ô\ô\ô\ÛT*EDDaa¤(\n]¾|DQ¤;vÐ#G\èÖ­[DDd&iF¦Q>§\Ü\Ú/[UURU2Ý¼y3\0 ®$@gggÿ\Ò\ÒK&\ß0M\îÝ»G»w\ï&\0\Ô\Ú\ÚJW®\\!UUI\×u\Ò4m#ø:@&!EQ\èú\õ\ë\Ï\0Ô8{\ö\ìo³\Ù,-//`3Ä7ohpp\0\Ï\ç£L&C±\ìUU\ÝØ¯i\Z¦I?\ÖZZZþ\0ÀHÎ?ÿ\éÁ»s¹\ìv;\0ü ½\ê\ê\êp\ò\äIø|>\Ô\Ö\ÖB$477\Ãjµ1\Ã0 \"\Ã\0c@À8s\æ\ÌWD\â¯\0JÎN¦¹Q\Ó4®\Í\ãÚ£G\èÎ;)\ÏS*\"EQ(JQ8¦\á\á\áY\0{°i^ü1p¨ªZ\Ç\Ë~¶1¦	\çqø\ðá \"èºl6¹¹9H\Ã0\0\æ\ñÁ\ìJ\ê\' kjjºü\âÅ\ÕrC&cL\Ó$]\×\É0\"\"Z]]¥h4J< H$BDDÇû\Ý\Ö@?\æ\Ó4$ÉB¡\ði9\Ú\Í\ök&\Ò\é4^¿~t:´´´@eF\ç* \0.ü\Ãn··³b>ºù Q\ä\ë\ë\ëk\ÜnwC{{{CgggM__¬V+\0`qq\ñ»x<>_)ÀºÞB¡?\âi»7@Z\ç?r¹\\n¯\×\ë\ñù|¶X,°²\õ¥\íO\å%\0\0\Ø\0\Ø\Ôh0@ûo\Óz·*\èÿ©þM]<6\ÂH \0\0\0\0IEND®B`',14,14);
/*!40000 ALTER TABLE `workflow_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_prerequisite`
--

DROP TABLE IF EXISTS `workflow_prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_prerequisite` (
  `id_prerequisite` int NOT NULL AUTO_INCREMENT,
  `id_action` int NOT NULL,
  `prerequisite_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_prerequisite`
--

LOCK TABLES `workflow_prerequisite` WRITE;
/*!40000 ALTER TABLE `workflow_prerequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_prerequisite_duration_cf`
--

DROP TABLE IF EXISTS `workflow_prerequisite_duration_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_prerequisite_duration_cf` (
  `id_prerequisite` int NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_prerequisite_duration_cf`
--

LOCK TABLES `workflow_prerequisite_duration_cf` WRITE;
/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_history`
--

DROP TABLE IF EXISTS `workflow_resource_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_resource_history` (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `id_resource` int DEFAULT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_workflow` int DEFAULT NULL,
  `id_action` int DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_access_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_history`),
  KEY `history_id_workflow_fk` (`id_workflow`),
  KEY `history_id_action_fk` (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_history`
--

LOCK TABLES `workflow_resource_history` WRITE;
/*!40000 ALTER TABLE `workflow_resource_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_user_history`
--

DROP TABLE IF EXISTS `workflow_resource_user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_resource_user_history` (
  `id_history` int NOT NULL,
  `user_access_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `first_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `last_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `realm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_history`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_user_history`
--

LOCK TABLES `workflow_resource_user_history` WRITE;
/*!40000 ALTER TABLE `workflow_resource_user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_workflow`
--

DROP TABLE IF EXISTS `workflow_resource_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_resource_workflow` (
  `id_resource` int NOT NULL DEFAULT '0',
  `resource_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_state` int DEFAULT NULL,
  `id_workflow` int NOT NULL,
  `id_external_parent` int DEFAULT NULL,
  `is_associated_workgroups` smallint DEFAULT '0',
  PRIMARY KEY (`id_resource`,`resource_type`,`id_workflow`),
  KEY `workflow_resource_workflow_id_resource_fk` (`id_resource`),
  KEY `workflow_resource_workflow_resource_type_fk` (`resource_type`),
  KEY `workflow_resource_workflow_id_workflow_fk` (`id_workflow`),
  KEY `fk_document_id_state` (`id_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_workflow`
--

LOCK TABLES `workflow_resource_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_resource_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_resource_workgroup`
--

DROP TABLE IF EXISTS `workflow_resource_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_resource_workgroup` (
  `id_resource` int NOT NULL DEFAULT '0',
  `resource_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_workflow` int DEFAULT NULL,
  `workgroup_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  KEY `workflow_resource_workgroup_id_resource_fk` (`id_resource`),
  KEY `workflow_resource_workgroup_resource_type_fk` (`resource_type`),
  KEY `workflow_resource_workgroup_id_workflow_fk` (`id_workflow`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_resource_workgroup`
--

LOCK TABLES `workflow_resource_workgroup` WRITE;
/*!40000 ALTER TABLE `workflow_resource_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_workgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_state`
--

DROP TABLE IF EXISTS `workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_state` (
  `id_state` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `id_workflow` int DEFAULT NULL,
  `is_initial_state` smallint DEFAULT '0',
  `is_required_workgroup_assigned` smallint DEFAULT '0',
  `id_icon` int DEFAULT NULL,
  `display_order` int DEFAULT '0',
  PRIMARY KEY (`id_state`),
  KEY `fk_state_id_workflow` (`id_workflow`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_state`
--

LOCK TABLES `workflow_state` WRITE;
/*!40000 ALTER TABLE `workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_state_controller_form_response_value`
--

DROP TABLE IF EXISTS `workflow_state_controller_form_response_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_state_controller_form_response_value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_task` int NOT NULL DEFAULT '0',
  `id_form` int NOT NULL DEFAULT '0',
  `id_step` int NOT NULL DEFAULT '0',
  `id_question` int NOT NULL DEFAULT '0',
  `response_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_state_controller_form_response_value` (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_state_controller_form_response_value`
--

LOCK TABLES `workflow_state_controller_form_response_value` WRITE;
/*!40000 ALTER TABLE `workflow_state_controller_form_response_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_state_controller_form_response_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task`
--

DROP TABLE IF EXISTS `workflow_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task` (
  `id_task` int NOT NULL AUTO_INCREMENT,
  `task_type_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_action` int NOT NULL DEFAULT '0',
  `display_order` int DEFAULT '0',
  PRIMARY KEY (`id_task`),
  KEY `task_id_action_fk` (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task`
--

LOCK TABLES `workflow_task` WRITE;
/*!40000 ALTER TABLE `workflow_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_alert_gru_cf`
--

DROP TABLE IF EXISTS `workflow_task_alert_gru_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_alert_gru_cf` (
  `id_task` int NOT NULL,
  `id_spring_provider` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `marker_provider_ids` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_status` int DEFAULT NULL,
  `crm_status_id` int DEFAULT '1',
  `set_onglet` smallint DEFAULT NULL,
  `message_guichet` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status_text_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_max_step_guichet` smallint DEFAULT '1',
  `demand_user_current_step_guichet` smallint DEFAULT '1',
  `is_active_onglet_guichet` smallint DEFAULT '0',
  `status_text_agent` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_active_onglet_agent` smallint NOT NULL DEFAULT '0',
  `subject_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sender_name_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cc_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_email` smallint DEFAULT '0',
  `message_sms` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `billing_account_sms` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `billing_group_sms` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_sms` smallint NOT NULL DEFAULT '0',
  `id_mailing_list_broadcast` int DEFAULT NULL,
  `email_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_broadcast` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `recipients_cc_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_broadcast` smallint DEFAULT '0',
  `days_to_alert` int DEFAULT NULL,
  `id_state_after` int DEFAULT NULL,
  `alert_subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `marker_alert` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `alert_after_before` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_alert_gru_cf`
--

LOCK TABLES `workflow_task_alert_gru_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_alert_gru_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_alert_gru_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_archive_cf`
--

DROP TABLE IF EXISTS `workflow_task_archive_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_archive_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `next_state` int NOT NULL,
  `type_archival` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `delay_archival` int DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_archive_cf`
--

LOCK TABLES `workflow_task_archive_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_archive_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_archive_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_archive_resource`
--

DROP TABLE IF EXISTS `workflow_task_archive_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_archive_resource` (
  `id_resource` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL DEFAULT '0',
  `initial_date` timestamp NULL DEFAULT NULL,
  `archival_date` timestamp NULL DEFAULT NULL,
  `is_archived` smallint DEFAULT '0',
  PRIMARY KEY (`id_resource`,`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_archive_resource`
--

LOCK TABLES `workflow_task_archive_resource` WRITE;
/*!40000 ALTER TABLE `workflow_task_archive_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_archive_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_assign_user_config`
--

DROP TABLE IF EXISTS `workflow_task_assign_user_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_assign_user_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `provider_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_assign_user_config`
--

LOCK TABLES `workflow_task_assign_user_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_assign_user_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_assign_user_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_assign_user_information`
--

DROP TABLE IF EXISTS `workflow_task_assign_user_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_assign_user_information` (
  `id_history` int NOT NULL,
  `id_task` int NOT NULL,
  `information_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `information_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_assign_user_information`
--

LOCK TABLES `workflow_task_assign_user_information` WRITE;
/*!40000 ALTER TABLE `workflow_task_assign_user_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_assign_user_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_assignment_cf`
--

DROP TABLE IF EXISTS `workflow_task_assignment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_assignment_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_multiple_owner` smallint DEFAULT '0',
  `is_notify` smallint DEFAULT '0',
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_use_user_name` smallint DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_assignment_cf`
--

LOCK TABLES `workflow_task_assignment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_assignment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_assignment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_change_appointment_status_cf`
--

DROP TABLE IF EXISTS `workflow_task_change_appointment_status_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_change_appointment_status_cf` (
  `id_task` int NOT NULL,
  `appointment_status` int DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_change_appointment_status_cf`
--

LOCK TABLES `workflow_task_change_appointment_status_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_change_appointment_status_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_change_appointment_status_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_change_state_config`
--

DROP TABLE IF EXISTS `workflow_task_change_state_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_change_state_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `id_next_state` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_change_state_config`
--

LOCK TABLES `workflow_task_change_state_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_change_state_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_change_state_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_change_state_information`
--

DROP TABLE IF EXISTS `workflow_task_change_state_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_change_state_information` (
  `id_history` int NOT NULL,
  `id_task` int NOT NULL,
  `new_state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_change_state_information`
--

LOCK TABLES `workflow_task_change_state_information` WRITE;
/*!40000 ALTER TABLE `workflow_task_change_state_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_change_state_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_choose_state_config`
--

DROP TABLE IF EXISTS `workflow_task_choose_state_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_choose_state_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `controller_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_state_ok` int NOT NULL,
  `id_state_ko` int NOT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_choose_state_config`
--

LOCK TABLES `workflow_task_choose_state_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_choose_state_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_choose_state_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_choose_state_information`
--

DROP TABLE IF EXISTS `workflow_task_choose_state_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_choose_state_information` (
  `id_history` int NOT NULL,
  `id_task` int NOT NULL,
  `new_state` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_choose_state_information`
--

LOCK TABLES `workflow_task_choose_state_information` WRITE;
/*!40000 ALTER TABLE `workflow_task_choose_state_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_choose_state_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_comment_config`
--

DROP TABLE IF EXISTS `workflow_task_comment_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_comment_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_mandatory` smallint DEFAULT '0',
  `is_richtext` smallint DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_comment_config`
--

LOCK TABLES `workflow_task_comment_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_comment_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_comment_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_comment_value`
--

DROP TABLE IF EXISTS `workflow_task_comment_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_comment_value` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL,
  `comment_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_history`,`id_task`),
  KEY `comment_value_id_history_fk` (`id_history`),
  KEY `comment_value_id_task_fk` (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_comment_value`
--

LOCK TABLES `workflow_task_comment_value` WRITE;
/*!40000 ALTER TABLE `workflow_task_comment_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_comment_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_complete_response`
--

DROP TABLE IF EXISTS `workflow_task_complete_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_complete_response` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL DEFAULT '0',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_complete` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_history`,`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_complete_response`
--

LOCK TABLES `workflow_task_complete_response` WRITE;
/*!40000 ALTER TABLE `workflow_task_complete_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_complete_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_complete_response_cf`
--

DROP TABLE IF EXISTS `workflow_task_complete_response_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_complete_response_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `id_state_after_edition` int NOT NULL DEFAULT '0',
  `default_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_complete_response_cf`
--

LOCK TABLES `workflow_task_complete_response_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_complete_response_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_complete_response_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_complete_response_history`
--

DROP TABLE IF EXISTS `workflow_task_complete_response_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_complete_response_history` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL DEFAULT '0',
  `id_question` int NOT NULL DEFAULT '0',
  `iteration_number` int NOT NULL DEFAULT '0',
  `new_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_history`,`id_task`,`id_question`,`iteration_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_complete_response_history`
--

LOCK TABLES `workflow_task_complete_response_history` WRITE;
/*!40000 ALTER TABLE `workflow_task_complete_response_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_complete_response_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_complete_response_value`
--

DROP TABLE IF EXISTS `workflow_task_complete_response_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_complete_response_value` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_entry` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_history`,`id_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_complete_response_value`
--

LOCK TABLES `workflow_task_complete_response_value` WRITE;
/*!40000 ALTER TABLE `workflow_task_complete_response_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_complete_response_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_editformresponse_config`
--

DROP TABLE IF EXISTS `workflow_task_editformresponse_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_editformresponse_config` (
  `id_config` int NOT NULL AUTO_INCREMENT,
  `id_task` int NOT NULL,
  PRIMARY KEY (`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_editformresponse_config`
--

LOCK TABLES `workflow_task_editformresponse_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_editformresponse_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_editformresponse_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_editformresponse_config_value`
--

DROP TABLE IF EXISTS `workflow_task_editformresponse_config_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_editformresponse_config_value` (
  `id_config_value` int NOT NULL AUTO_INCREMENT,
  `id_config` int NOT NULL DEFAULT '0',
  `id_form` int NOT NULL DEFAULT '0',
  `id_step` int NOT NULL DEFAULT '0',
  `id_question` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_config_value`),
  KEY `index_task_editformresponse_config_value` (`id_config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_editformresponse_config_value`
--

LOCK TABLES `workflow_task_editformresponse_config_value` WRITE;
/*!40000 ALTER TABLE `workflow_task_editformresponse_config_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_editformresponse_config_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_forms_editresponse_history`
--

DROP TABLE IF EXISTS `workflow_task_forms_editresponse_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_forms_editresponse_history` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL DEFAULT '0',
  `id_question` int NOT NULL DEFAULT '0',
  `iteration_number` int NOT NULL DEFAULT '0',
  `previous_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `new_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_history`,`id_task`,`id_question`,`iteration_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_forms_editresponse_history`
--

LOCK TABLES `workflow_task_forms_editresponse_history` WRITE;
/*!40000 ALTER TABLE `workflow_task_forms_editresponse_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_forms_editresponse_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_formsjasper_cf`
--

DROP TABLE IF EXISTS `workflow_task_formsjasper_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_formsjasper_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `id_report` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_forms` int DEFAULT '0',
  `id_step` int DEFAULT '0',
  `id_forms_field_generated_report` int DEFAULT '0',
  `params_report` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `format` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_formsjasper_cf`
--

LOCK TABLES `workflow_task_formsjasper_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_formsjasper_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_formsjasper_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_manual_app_notify`
--

DROP TABLE IF EXISTS `workflow_task_manual_app_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_manual_app_notify` (
  `id_notif` int NOT NULL,
  `id_history` int DEFAULT NULL,
  `id_appointment` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_notif`),
  KEY `idx_wf_task_manual_app_notify` (`id_appointment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_manual_app_notify`
--

LOCK TABLES `workflow_task_manual_app_notify` WRITE;
/*!40000 ALTER TABLE `workflow_task_manual_app_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_manual_app_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notification_cf`
--

DROP TABLE IF EXISTS `workflow_task_notification_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notification_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `id_mailing_list` int DEFAULT NULL,
  `sender_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notification_cf`
--

LOCK TABLES `workflow_task_notification_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notification_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notification_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_admin_appointment_cf`
--

DROP TABLE IF EXISTS `workflow_task_notify_admin_appointment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_admin_appointment_cf` (
  `id_task` int NOT NULL,
  `id_admin_user` int DEFAULT NULL,
  `sender_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb3_unicode_ci,
  `recipients_cc` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `recipients_bcc` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_action_cancel` int DEFAULT NULL,
  `id_action_validate` int DEFAULT NULL,
  `ical_notification` smallint DEFAULT '0',
  `create_notif` smallint DEFAULT '0',
  `location` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_admin_appointment_cf`
--

LOCK TABLES `workflow_task_notify_admin_appointment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_admin_appointment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_admin_appointment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_appointment_cf`
--

DROP TABLE IF EXISTS `workflow_task_notify_appointment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_appointment_cf` (
  `id_task` int NOT NULL,
  `sender_name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb3_unicode_ci,
  `recipients_cc` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `recipients_bcc` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_action_cancel` int DEFAULT NULL,
  `ical_notification` smallint DEFAULT '0',
  `create_notif` smallint DEFAULT '0',
  `location` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `is_sms` smallint DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_appointment_cf`
--

LOCK TABLES `workflow_task_notify_appointment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_appointment_crm`
--

DROP TABLE IF EXISTS `workflow_task_notify_appointment_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_appointment_crm` (
  `id_task` int NOT NULL,
  `id_demand_type` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status_text` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_status_crm` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `object` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_appointment_crm`
--

LOCK TABLES `workflow_task_notify_appointment_crm` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_crm` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_crm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_gru_cf`
--

DROP TABLE IF EXISTS `workflow_task_notify_gru_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_gru_cf` (
  `id_task` int NOT NULL,
  `id_spring_provider` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `marker_provider_ids` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_status` int DEFAULT NULL,
  `crm_status_id` int DEFAULT '1',
  `set_onglet` smallint DEFAULT NULL,
  `message_guichet` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status_text_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_guichet` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_max_step_guichet` smallint DEFAULT '1',
  `demand_user_current_step_guichet` smallint DEFAULT '1',
  `is_active_onglet_guichet` smallint DEFAULT '0',
  `status_text_agent` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_active_onglet_agent` smallint NOT NULL DEFAULT '0',
  `subject_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sender_name_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cc_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_email` smallint DEFAULT '0',
  `message_sms` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `billing_account_sms` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `billing_group_sms` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_sms` smallint NOT NULL DEFAULT '0',
  `id_mailing_list_broadcast` int DEFAULT NULL,
  `email_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_broadcast` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `recipients_cc_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_broadcast` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_broadcast` smallint DEFAULT '0',
  `content_cleaned` smallint DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_gru_cf`
--

LOCK TABLES `workflow_task_notify_gru_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_gru_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_gru_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_gru_mapping_manager`
--

DROP TABLE IF EXISTS `workflow_task_notify_gru_mapping_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_gru_mapping_manager` (
  `id_notifygrumappingmanager` int NOT NULL,
  `beankey` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `connection_id` int NOT NULL DEFAULT '0',
  `customer_id` int NOT NULL DEFAULT '0',
  `mobilephonenumber` int NOT NULL DEFAULT '0',
  `fixedphonenumber` int NOT NULL DEFAULT '0',
  `email` int NOT NULL DEFAULT '0',
  `demandetype` int NOT NULL DEFAULT '0',
  `demand_reference` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_notifygrumappingmanager`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_gru_mapping_manager`
--

LOCK TABLES `workflow_task_notify_gru_mapping_manager` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_gru_mapping_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_gru_mapping_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_notify_reminder_cf`
--

DROP TABLE IF EXISTS `workflow_task_notify_reminder_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_reminder_cf` (
  `id_task` int NOT NULL,
  `id_form` int NOT NULL DEFAULT '0',
  `nb_alerts` int DEFAULT '0',
  PRIMARY KEY (`id_task`,`id_form`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_notify_reminder_cf`
--

LOCK TABLES `workflow_task_notify_reminder_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_reminder_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_reminder_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_resubmit_response`
--

DROP TABLE IF EXISTS `workflow_task_resubmit_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_resubmit_response` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL DEFAULT '0',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_complete` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_history`,`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_resubmit_response`
--

LOCK TABLES `workflow_task_resubmit_response` WRITE;
/*!40000 ALTER TABLE `workflow_task_resubmit_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_resubmit_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_resubmit_response_cf`
--

DROP TABLE IF EXISTS `workflow_task_resubmit_response_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_resubmit_response_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `id_state_after_edition` int NOT NULL DEFAULT '0',
  `default_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_resubmit_response_cf`
--

LOCK TABLES `workflow_task_resubmit_response_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_resubmit_response_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_resubmit_response_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_resubmit_response_history`
--

DROP TABLE IF EXISTS `workflow_task_resubmit_response_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_resubmit_response_history` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_task` int NOT NULL DEFAULT '0',
  `id_question` int NOT NULL DEFAULT '0',
  `iteration_number` int NOT NULL DEFAULT '0',
  `previous_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `new_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_history`,`id_task`,`id_question`,`iteration_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_resubmit_response_history`
--

LOCK TABLES `workflow_task_resubmit_response_history` WRITE;
/*!40000 ALTER TABLE `workflow_task_resubmit_response_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_resubmit_response_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_resubmit_response_value`
--

DROP TABLE IF EXISTS `workflow_task_resubmit_response_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_resubmit_response_value` (
  `id_history` int NOT NULL DEFAULT '0',
  `id_entry` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_history`,`id_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_resubmit_response_value`
--

LOCK TABLES `workflow_task_resubmit_response_value` WRITE;
/*!40000 ALTER TABLE `workflow_task_resubmit_response_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_resubmit_response_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_unittree_information`
--

DROP TABLE IF EXISTS `workflow_task_unittree_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_unittree_information` (
  `id_history` int NOT NULL,
  `id_task` int NOT NULL,
  `information_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `information_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_unittree_information`
--

LOCK TABLES `workflow_task_unittree_information` WRITE;
/*!40000 ALTER TABLE `workflow_task_unittree_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_unittree_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_unittree_unit_assignment_cf`
--

DROP TABLE IF EXISTS `workflow_task_unittree_unit_assignment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_unittree_unit_assignment_cf` (
  `id_task` int NOT NULL,
  `assignment_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `unit_selections` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_unittree_unit_assignment_cf`
--

LOCK TABLES `workflow_task_unittree_unit_assignment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_unittree_unit_assignment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_unittree_unit_assignment_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_unittree_unit_selection_parametrable_cf`
--

DROP TABLE IF EXISTS `workflow_task_unittree_unit_selection_parametrable_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_unittree_unit_selection_parametrable_cf` (
  `id_task` int NOT NULL,
  `parametrable_config_handler` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_unittree_unit_selection_parametrable_cf`
--

LOCK TABLES `workflow_task_unittree_unit_selection_parametrable_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_unittree_unit_selection_parametrable_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_unittree_unit_selection_parametrable_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_unittree_unit_selection_specific_unit_cf`
--

DROP TABLE IF EXISTS `workflow_task_unittree_unit_selection_specific_unit_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_unittree_unit_selection_specific_unit_cf` (
  `id_task` int NOT NULL,
  `id_unit` int NOT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_unittree_unit_selection_specific_unit_cf`
--

LOCK TABLES `workflow_task_unittree_unit_selection_specific_unit_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_unittree_unit_selection_specific_unit_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_unittree_unit_selection_specific_unit_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_update_admin_appointment`
--

DROP TABLE IF EXISTS `workflow_task_update_admin_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_update_admin_appointment` (
  `id_update` int NOT NULL,
  `id_history` int DEFAULT NULL,
  `id_appointment` int DEFAULT NULL,
  `id_admin_user` int DEFAULT NULL,
  PRIMARY KEY (`id_update`),
  KEY `idx_wf_task_update_admin_app` (`id_appointment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_update_admin_appointment`
--

LOCK TABLES `workflow_task_update_admin_appointment` WRITE;
/*!40000 ALTER TABLE `workflow_task_update_admin_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_update_admin_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_task_update_appointment_cancel_cf`
--

DROP TABLE IF EXISTS `workflow_task_update_appointment_cancel_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_update_appointment_cancel_cf` (
  `id_task` int NOT NULL,
  `id_action_cancel` int DEFAULT NULL,
  `id_action_report` int DEFAULT NULL,
  PRIMARY KEY (`id_task`),
  KEY `fk_wf_task_up_app_cancel_cf` (`id_action_cancel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_task_update_appointment_cancel_cf`
--

LOCK TABLES `workflow_task_update_appointment_cancel_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_update_appointment_cancel_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_update_appointment_cancel_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workflow`
--

DROP TABLE IF EXISTS `workflow_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_workflow` (
  `id_workflow` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_enabled` smallint DEFAULT '0',
  `workgroup_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_workflow`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workflow`
--

LOCK TABLES `workflow_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_workflow` DISABLE KEYS */;
INSERT INTO `workflow_workflow` VALUES (1,'Demands','Treat citizen demand','2022-02-21 09:36:48',0,'all');
/*!40000 ALTER TABLE `workflow_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_workgroup_cf`
--

DROP TABLE IF EXISTS `workflow_workgroup_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_workgroup_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `workgroup_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_mailing_list` int DEFAULT NULL,
  PRIMARY KEY (`id_task`,`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_workgroup_cf`
--

LOCK TABLES `workflow_workgroup_cf` WRITE;
/*!40000 ALTER TABLE `workflow_workgroup_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_workgroup_cf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-13 10:25:21
