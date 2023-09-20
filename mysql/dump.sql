
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

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lutece` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `lutece`;
DROP TABLE IF EXISTS `appointment_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_appointment` (
  `id_appointment` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nb_places` int NOT NULL DEFAULT '0',
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `id_action_cancelled` int DEFAULT NULL,
  `notification` int NOT NULL DEFAULT '0',
  `id_admin_user` int DEFAULT '0',
  `date_appointment_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_access_code_create` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_user` int NOT NULL,
  `is_surbooked` tinyint(1) NOT NULL DEFAULT '0',
  `id_action_reported` int DEFAULT NULL,
  PRIMARY KEY (`id_appointment`),
  UNIQUE KEY `reference_idx` (`reference`),
  KEY `fk_appointment_appointment_appointment_user_idx` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=852 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_appointment` WRITE;
/*!40000 ALTER TABLE `appointment_appointment` DISABLE KEYS */;
INSERT INTO `appointment_appointment` VALUES (841,'8415c682',1,0,0,0,0,'2022-03-09 12:16:37',NULL,1,0,0),(842,'8427c031',2,0,0,0,0,'2022-03-09 16:08:50',NULL,2,0,0),(843,'8432f2a6',1,0,0,0,0,'2022-03-09 16:40:36',NULL,3,0,0),(844,'84476f76',1,0,0,0,0,'2022-03-09 16:44:53',NULL,4,0,0),(845,'8452174f',2,0,0,0,0,'2022-03-10 10:42:01',NULL,5,0,0),(846,'8464e6ad',1,0,0,0,0,'2022-03-10 14:50:38',NULL,6,0,0),(847,'847a8184',1,0,0,0,0,'2022-03-10 15:57:20',NULL,7,0,0),(848,'84839c90',1,0,0,0,0,'2022-03-10 15:57:49',NULL,8,0,0),(849,'84901b28',2,0,0,0,0,'2022-03-10 16:31:55',NULL,9,0,0),(850,'850fa433',1,0,0,0,0,'2022-03-10 16:32:58',NULL,10,0,0),(851,'851d396f',1,0,0,0,0,'2022-03-11 09:38:41',NULL,11,0,0);
/*!40000 ALTER TABLE `appointment_appointment` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_appointment_response` WRITE;
/*!40000 ALTER TABLE `appointment_appointment_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_appointment_response` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_appointment_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_appointment_slot` (
  `id_appointment` int NOT NULL,
  `id_slot` int NOT NULL,
  `nb_places` int NOT NULL,
  PRIMARY KEY (`id_appointment`,`id_slot`),
  KEY `fk_appointment_appointment_slot_slot` (`id_slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_appointment_slot` WRITE;
/*!40000 ALTER TABLE `appointment_appointment_slot` DISABLE KEYS */;
INSERT INTO `appointment_appointment_slot` VALUES (149,940,1),(372,1532,1),(372,1533,1),(721,3233,1),(841,3653,1),(842,3651,2),(843,3654,1),(844,3651,1),(845,3653,2),(846,3656,1),(847,3658,1),(848,3658,1),(849,3658,2),(850,3657,1),(851,3660,1);
/*!40000 ALTER TABLE `appointment_appointment_slot` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_calendar_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_calendar_template` (
  `id_calendar_template` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `template_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_calendar_template`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_calendar_template` WRITE;
/*!40000 ALTER TABLE `appointment_calendar_template` DISABLE KEYS */;
INSERT INTO `appointment_calendar_template` VALUES (1,'Calendrier','Calendrier des créneaux disponibles et indisponibles','skin/plugins/appointment/calendar/appointment_form_calendar.html'),(2,'Calendrier jours ouverts','Calendrier des créneaux disponibles et indisponibles (jours ouverts)','skin/plugins/appointment/calendar/appointment_form_calendar_opendays.html'),(3,'Liste des creneaux disponibles','Liste des créneaux disponibles','skin/plugins/appointment/calendar/appointment_form_list_open_slots.html'),(4,'Liste des creneaux disponibles jours ouverts','Liste des créneaux disponibles (jours ouverts)','skin/plugins/appointment/calendar/appointment_form_list_open_slots_opendays.html'),(5,'Liste des creneaux disponible regroup├⌐s','Liste des creneaux disponible regroupés','skin/plugins/appointment/calendar/appointment_form_list_open_slots_grouped.html');
/*!40000 ALTER TABLE `appointment_calendar_template` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `nb_max_appointments_per_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `appointment_category_unique_label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_category` WRITE;
/*!40000 ALTER TABLE `appointment_category` DISABLE KEYS */;
INSERT INTO `appointment_category` VALUES (2,'Autres',1);
/*!40000 ALTER TABLE `appointment_category` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_closing_day` WRITE;
/*!40000 ALTER TABLE `appointment_closing_day` DISABLE KEYS */;
INSERT INTO `appointment_closing_day` VALUES (30,'2021-04-16',3),(29,'2021-04-17',3),(28,'2021-04-18',3),(27,'2021-04-19',3),(26,'2021-04-20',3),(25,'2021-04-21',3);
/*!40000 ALTER TABLE `appointment_closing_day` ENABLE KEYS */;
UNLOCK TABLES;
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
  `comment` mediumtext NOT NULL,
  `comment_creation_date` date NOT NULL,
  `comment_user_creator` varchar(255) NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `fk_appointment_comment` (`id_form`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_comment` WRITE;
/*!40000 ALTER TABLE `appointment_comment` DISABLE KEYS */;
INSERT INTO `appointment_comment` VALUES (214,5,'2021-05-17','00:00:00','2021-05-17','00:00:00','<p>dazdzad</p>','2021-05-20','testchef'),(215,5,'2021-05-17','00:00:00','2021-05-17','00:00:00','<p>dddd</p>','2021-05-20','testchef'),(216,5,'2021-05-18','00:00:00','2021-05-18','00:00:00','<p>TEST ADMIN</p>','2021-05-20','admin'),(217,5,'2021-05-19','00:00:00','2021-05-19','00:00:00','<p>TEST CHEF AVEC DROIT</p>','2021-05-20','testchef'),(221,5,'2021-11-08','10:00:00','2021-11-08','12:00:00','<p>1</p>','2021-11-08','admin'),(222,5,'2021-11-08','09:00:00','2021-11-08','10:00:00','<p>2</p>','2021-11-08','admin');
/*!40000 ALTER TABLE `appointment_comment` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_comment_notification_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_comment_notification_cf` (
  `notify_type` varchar(45) NOT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_comment_notification_cf` WRITE;
/*!40000 ALTER TABLE `appointment_comment_notification_cf` DISABLE KEYS */;
INSERT INTO `appointment_comment_notification_cf` VALUES ('CREATE','RdV Titres R7','Notification de cr??ation de commentaire','<p>Bonjour,</p>\r\n<p>Un commentaire a &eacute;t&eacute; ajout&eacute; le ${creation_date!} sur le planning de rdv du \"${form_title!}\".</p>\r\n<p>Commentaire appliqu&eacute; du ${date_start_validity!} &agrave; ${time_start_validity!} au ${date_end_validity!} &agrave; ${time_end_validity!}.</p>\r\n<p>&nbsp;</p>\r\n<p>Par ${creator_user_name!}</p>\r\n<p>Commentaire :</p>\r\n<p>${comment!}</p>\r\n<p>&nbsp;</p>\r\n<p>--</p>\r\n<p>Ne pas r&eacute;pondre</p>'),('DELETE','RdV Titres R7','Notification de suppression de commentaire','<p>Bonjour,</p>\r\n<p>Un commentaire vient d\'&ecirc;tre supprim&eacute; sur le planning de rdv du \"${form_title!}\".</p>\r\n<p>Commentaire appliqu&eacute; du ${date_start_validity!} &agrave; ${time_start_validity!} au ${date_end_validity!} &agrave; ${time_end_validity!}.</p>\r\n<p><br />Par ${creator_user_name!}</p>\r\n<p>Commentaire :</p>\r\n<p>${comment!}</p>\r\n<p>&nbsp;</p>\r\n<p>--</p>\r\n<p>Ne pas r&eacute;pondre</p>'),('UPDATE','RdV Titres R7','Notification de modification de commentaire','<p>Bonjour,</p>\r\n<p>Un commentaire vient d\'&ecirc;tre modifi&eacute; sur le planning de rdv du \"${form_title!}\".</p>\r\n<p>Commentaire appliqu&eacute; du ${date_start_validity!} &agrave; ${time_start_validity!} au ${date_end_validity!} &agrave; ${time_end_validity!}.</p>\r\n<p><br />Par ${creator_user_name!}</p>\r\n<p>Commentaire :</p>\r\n<p>${comment!}</p>\r\n<p>&nbsp;</p>\r\n<p>--</p>\r\n<p>Ne pas r&eacute;pondre</p>');
/*!40000 ALTER TABLE `appointment_comment_notification_cf` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_display` (
  `id_display` int NOT NULL AUTO_INCREMENT,
  `display_title_fo` tinyint(1) NOT NULL DEFAULT '0',
  `icon_form_content` mediumblob,
  `icon_form_mime_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nb_weeks_to_display` int NOT NULL DEFAULT '0',
  `is_displayed_on_portlet` tinyint(1) NOT NULL DEFAULT '1',
  `id_calendar_template` int NOT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_display`),
  UNIQUE KEY `appointment_display_unique` (`id_form`),
  KEY `fk_appointment_display_appointment_calendar_template_idx` (`id_calendar_template`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_display` WRITE;
/*!40000 ALTER TABLE `appointment_display` DISABLE KEYS */;
INSERT INTO `appointment_display` VALUES (3,0,'','NULL',10,0,5,3),(5,1,'','NULL',6,1,3,5);
/*!40000 ALTER TABLE `appointment_display` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_form` (
  `id_form` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reference` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  `starting_validity_date` date DEFAULT NULL,
  `ending_validity_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `id_workflow` int DEFAULT NULL,
  `workgroup` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_multislot_appointment` tinyint(1) NOT NULL DEFAULT '0',
  `role_fo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `capacity_per_slot` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`id_form`),
  KEY `starting_validity_date_idx` (`starting_validity_date`),
  KEY `ending_validity_date_idx` (`ending_validity_date`),
  KEY `fk_appointment_form_appointment_category_idx` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_form` WRITE;
/*!40000 ALTER TABLE `appointment_form` DISABLE KEYS */;
INSERT INTO `appointment_form` VALUES (3,'TEST YYU multi-slot normal','Ceci est un test de YYU multi slot validation auto ZZZZ','',2,'2021-04-02',NULL,0,1,'groupe_yyu',1,'restricted',5),(5,'Agenda générique','Agenda de démonstation','',NULL,'2021-07-01',NULL,1,51,'all',0,'none',5);
/*!40000 ALTER TABLE `appointment_form` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_form_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_form_message` (
  `id_form_message` int NOT NULL AUTO_INCREMENT,
  `calendar_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_firstname_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_firstname_help` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_lastname_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_lastname_help` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_email_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_email_help` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_confirmationEmail_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_confirmationEmail_help` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `text_appointment_created` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `url_redirect_after_creation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `text_appointment_canceled` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `label_button_redirection` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `no_available_slot` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `calendar_description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `calendar_reserve_label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `calendar_full_label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_form_message`),
  KEY `fk_appointment_form_message_appointment_form_idx` (`id_form`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_form_message` WRITE;
/*!40000 ALTER TABLE `appointment_form_message` DISABLE KEYS */;
INSERT INTO `appointment_form_message` VALUES (3,'Choisir une date','Pr├⌐nom','','Nom','','Email','','Confirmation Email','','<p>Votre demande de rendez-vous a bien &eacute;t&eacute; cr&eacute;&eacute;e avec la reference %%REF%%</p>','jsp/site/Portal.jsp?page=appointment&view=getMyAppointments','<p>Votre demande de rendez-vous a bien &eacute;t&eacute; annul&eacute;e</p>','Terminer','Aucun cr├⌐neau disponible n\'a ├⌐t├⌐ trouv├⌐. Veuillez r├⌐iterer votre recherche ult├⌐rieurement.','','R├⌐serv├⌐xx','Completxx',3),(5,'Choix de la date','Surname','','Name','','E-mail','','E-mail confirm','','<p>Your demand <strong>has been accepted</strong> with this reference<strong>&nbsp;%%REF%%</strong></p>','jsp/site/Portal.jsp','<p>Your appointement is canceled</p>','Finish !','No more slots available ! Please renew your demand in a moment.','<p>Beware if no slots are available, many slots&nbsp;will be available in a few hours !</p>\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: 132px; top: 25px;\">&nbsp;</div>','Book','No more slots available !',5);
/*!40000 ALTER TABLE `appointment_form_message` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_form_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_form_portlet` (
  `id_portlet` int NOT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_portlet`,`id_form`),
  KEY `fk_appointment_form_portlet_appointment_form_idx` (`id_form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_form_portlet` WRITE;
/*!40000 ALTER TABLE `appointment_form_portlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_form_portlet` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_form_rule` WRITE;
/*!40000 ALTER TABLE `appointment_form_rule` DISABLE KEYS */;
INSERT INTO `appointment_form_rule` VALUES (3,0,1,0,0,2,0,0,1,3),(5,0,0,0,0,0,0,0,0,5);
/*!40000 ALTER TABLE `appointment_form_rule` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_localization` (
  `id_localization` int NOT NULL AUTO_INCREMENT,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_form` int NOT NULL,
  PRIMARY KEY (`id_localization`),
  KEY `fk_appointment_localization_appointment_form_idx` (`id_form`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_localization` WRITE;
/*!40000 ALTER TABLE `appointment_localization` DISABLE KEYS */;
INSERT INTO `appointment_localization` VALUES (3,2.3211,48.83,'122 rue d\'Al├⌐sia, 75014 PARIS',3),(5,2.341,48.8601,'4 place du Louvre, 75001 PARIS',5);
/*!40000 ALTER TABLE `appointment_localization` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_reservation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_reservation_rule` (
  `id_reservation_rule` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `max_capacity_per_slot` int NOT NULL DEFAULT '0',
  `max_people_per_appointment` int NOT NULL DEFAULT '0',
  `id_form` int NOT NULL,
  `duration_appointments` int NOT NULL DEFAULT '15',
  PRIMARY KEY (`id_reservation_rule`),
  KEY `fk_appointment_reservation_rule_appointment_form_idx` (`id_form`),
  KEY `fk_appointment_working_day_appointment_reservation_rule_idx` (`id_reservation_rule`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_reservation_rule` WRITE;
/*!40000 ALTER TABLE `appointment_reservation_rule` DISABLE KEYS */;
INSERT INTO `appointment_reservation_rule` VALUES (10,'P??riode par d??faut','P??riode par d??faut','#d031dd',1,5,2,5,15),(22,'P??riode verte','P??riode d??faut','#47d737',1,7,2,5,15),(37,'P??riode rouge','P??riode rouge','#fc3114',1,3,2,5,15);
/*!40000 ALTER TABLE `appointment_reservation_rule` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_resource_app_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_resource_app_res` (
  `id_appointment` int NOT NULL DEFAULT '0',
  `id_app_form_res_type` int NOT NULL DEFAULT '0',
  `id_resource` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_appointment`,`id_app_form_res_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_resource_app_res` WRITE;
/*!40000 ALTER TABLE `appointment_resource_app_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_resource_app_res` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_resource_form_rt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_resource_form_rt` (
  `id` int NOT NULL DEFAULT '0',
  `id_appointment_form` int NOT NULL DEFAULT '0',
  `resource_type_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `is_app_admin_user` smallint NOT NULL DEFAULT '0',
  `is_localization` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_appointment_resource_form_rt_name` (`resource_type_name`),
  KEY `fk_appointment_res_form_rt_id_form` (`id_appointment_form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_resource_form_rt` WRITE;
/*!40000 ALTER TABLE `appointment_resource_form_rt` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_resource_form_rt` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=3661 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_slot` WRITE;
/*!40000 ALTER TABLE `appointment_slot` DISABLE KEYS */;
INSERT INTO `appointment_slot` VALUES (3636,'2021-11-25 10:00:00','2021-11-25 10:30:00',1,0,3,3,3,0,5),(3637,'2021-11-29 10:00:00','2021-11-29 11:00:00',1,1,1,1,1,0,5),(3638,'2021-11-29 11:00:00','2021-11-29 12:00:00',1,1,6,6,6,0,5),(3639,'2021-11-29 12:00:00','2021-11-29 13:00:00',0,1,6,6,6,0,5),(3640,'2021-11-29 13:00:00','2021-11-29 14:00:00',1,1,6,6,6,0,5),(3641,'2021-11-29 14:00:00','2021-11-29 15:00:00',1,1,6,6,6,0,5),(3650,'2022-03-10 10:00:00','2022-03-10 10:30:00',1,0,3,3,3,0,5),(3651,'2022-03-10 10:30:00','2022-03-10 11:00:00',1,0,3,0,0,3,5),(3652,'2022-03-10 11:00:00','2022-03-10 12:00:00',1,0,5,5,5,0,5),(3653,'2022-03-10 13:00:00','2022-03-10 14:00:00',1,0,5,2,2,3,5),(3654,'2022-03-10 14:00:00','2022-03-10 15:00:00',1,0,5,4,4,1,5),(3655,'2022-03-17 10:30:00','2022-03-17 11:00:00',1,0,3,3,3,0,5),(3656,'2022-03-17 14:00:00','2022-03-17 15:00:00',1,0,5,4,4,1,5),(3657,'2022-03-17 13:00:00','2022-03-17 14:00:00',1,0,5,4,4,1,5),(3658,'2022-03-17 11:00:00','2022-03-17 12:00:00',1,0,5,1,1,4,5),(3659,'2022-03-17 10:00:00','2022-03-17 10:30:00',1,0,3,3,3,0,5),(3660,'2022-03-31 11:00:00','2022-03-31 12:00:00',1,0,5,4,4,1,5);
/*!40000 ALTER TABLE `appointment_slot` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=14512 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_time_slot` WRITE;
/*!40000 ALTER TABLE `appointment_time_slot` DISABLE KEYS */;
INSERT INTO `appointment_time_slot` VALUES (1472,'10:00:00','11:00:00',1,0,77),(1473,'11:00:00','12:00:00',1,5,77),(1474,'12:00:00','13:00:00',0,5,77),(1475,'13:00:00','14:00:00',1,5,77),(1476,'14:00:00','15:00:00',1,5,77),(1477,'10:00:00','10:30:00',1,3,78),(1478,'11:00:00','12:00:00',1,5,78),(1479,'12:00:00','13:00:00',0,5,78),(1480,'13:00:00','14:00:00',1,5,78),(1481,'14:00:00','15:00:00',1,5,78),(1482,'10:30:00','11:00:00',1,3,78),(1588,'09:00:00','09:30:00',1,3,86),(1589,'09:30:00','10:00:00',1,3,86),(1590,'10:00:00','10:30:00',1,3,86),(1591,'10:30:00','11:00:00',1,3,86),(1592,'11:00:00','11:30:00',1,3,86),(1593,'11:30:00','12:00:00',1,3,86),(1594,'12:00:00','12:30:00',1,3,86),(1595,'12:30:00','13:00:00',1,3,86),(1596,'13:00:00','13:30:00',1,3,86),(1597,'13:30:00','14:00:00',1,3,86),(1598,'14:00:00','14:30:00',1,3,86),(1599,'14:30:00','15:00:00',1,3,86),(1600,'15:00:00','15:30:00',1,3,86),(1601,'15:30:00','16:00:00',1,3,86),(1602,'16:00:00','16:30:00',1,3,86),(1603,'09:00:00','09:30:00',1,3,87),(1604,'09:30:00','10:00:00',1,3,87),(1605,'10:00:00','10:30:00',1,3,87),(1606,'10:30:00','11:00:00',1,3,87),(1607,'11:00:00','11:30:00',1,3,87),(1608,'11:30:00','12:00:00',1,3,87),(1609,'12:00:00','12:30:00',1,3,87),(1610,'12:30:00','13:00:00',1,3,87),(1611,'13:00:00','13:30:00',1,3,87),(1612,'13:30:00','14:00:00',1,3,87),(1613,'14:00:00','14:30:00',1,3,87),(1614,'14:30:00','15:00:00',1,3,87),(1615,'15:00:00','15:30:00',1,3,87),(1616,'15:30:00','16:00:00',1,3,87),(1617,'16:00:00','16:30:00',1,3,87),(1618,'09:00:00','09:30:00',1,3,88),(1619,'09:30:00','10:00:00',1,3,88),(1620,'10:00:00','10:30:00',1,3,88),(1621,'10:30:00','11:00:00',1,3,88),(1622,'11:00:00','11:30:00',1,3,88),(1623,'11:30:00','12:00:00',1,3,88),(1624,'12:00:00','12:30:00',1,3,88),(1625,'12:30:00','13:00:00',1,3,88),(1626,'13:00:00','13:30:00',1,3,88),(1627,'13:30:00','14:00:00',1,3,88),(1628,'14:00:00','14:30:00',1,3,88),(1629,'14:30:00','15:00:00',1,3,88),(1630,'15:00:00','15:30:00',1,3,88),(1631,'15:30:00','16:00:00',1,3,88),(1632,'16:00:00','16:30:00',1,3,88),(1633,'09:00:00','09:30:00',1,3,89),(1634,'09:30:00','10:00:00',1,3,89),(1635,'10:00:00','10:30:00',1,3,89),(1636,'10:30:00','11:00:00',1,3,89),(1637,'11:00:00','11:30:00',1,3,89),(1638,'11:30:00','12:00:00',1,3,89),(1639,'12:00:00','12:30:00',1,3,89),(1640,'12:30:00','13:00:00',1,3,89),(1641,'13:00:00','13:30:00',1,3,89),(1642,'13:30:00','14:00:00',1,3,89),(1643,'14:00:00','14:30:00',1,3,89),(1644,'14:30:00','15:00:00',1,3,89),(1645,'15:00:00','15:30:00',1,3,89),(1646,'15:30:00','16:00:00',1,3,89),(1647,'16:00:00','16:30:00',1,3,89),(1648,'09:00:00','09:30:00',1,3,90),(1649,'09:30:00','10:00:00',1,3,90),(1650,'10:00:00','10:30:00',1,3,90),(1651,'10:30:00','11:00:00',1,3,90),(1652,'11:00:00','11:30:00',1,3,90),(1653,'11:30:00','12:00:00',1,3,90),(1654,'12:00:00','12:30:00',1,3,90),(1655,'12:30:00','13:00:00',1,3,90),(1656,'13:00:00','13:30:00',1,3,90),(1657,'13:30:00','14:00:00',1,3,90),(1658,'14:00:00','14:30:00',1,3,90),(1659,'14:30:00','15:00:00',1,3,90),(1660,'15:00:00','15:30:00',1,3,90),(1661,'15:30:00','16:00:00',1,3,90),(1662,'16:00:00','16:30:00',1,3,90),(1663,'09:00:00','09:30:00',1,3,91),(1664,'09:30:00','10:00:00',1,3,91),(1665,'10:00:00','10:30:00',1,3,91),(1666,'10:30:00','11:00:00',1,3,91),(1667,'11:00:00','11:30:00',1,3,91),(1668,'11:30:00','12:00:00',1,3,91),(1669,'12:00:00','12:30:00',1,3,91),(1670,'12:30:00','13:00:00',1,3,91),(1671,'13:00:00','13:30:00',1,3,91),(1672,'13:30:00','14:00:00',1,3,91),(1673,'14:00:00','14:30:00',1,3,91),(1674,'14:30:00','15:00:00',1,3,91),(1675,'15:00:00','15:30:00',1,3,91),(1676,'15:30:00','16:00:00',1,3,91),(1677,'16:00:00','16:30:00',1,3,91),(1726,'09:00:00','10:00:00',1,4,103),(1727,'10:00:00','11:00:00',1,4,103),(1728,'11:00:00','12:00:00',1,4,103),(1729,'09:00:00','10:00:00',1,4,104),(1730,'10:00:00','11:00:00',1,4,104),(1731,'11:00:00','12:00:00',1,4,104),(1787,'09:00:00','10:00:00',1,4,121),(1788,'10:00:00','11:00:00',1,4,121),(1789,'11:00:00','12:00:00',1,4,121),(1790,'09:00:00','10:00:00',1,4,122),(1791,'10:00:00','11:00:00',1,4,122),(1792,'11:00:00','12:00:00',1,4,122),(5103,'09:00:00','09:30:00',1,4,257),(5104,'09:30:00','10:00:00',1,4,257),(5105,'10:00:00','10:30:00',1,4,257),(5106,'10:30:00','11:00:00',1,4,257),(5107,'11:00:00','11:30:00',1,4,257),(5108,'11:30:00','12:00:00',1,4,257),(5109,'09:00:00','09:30:00',1,4,258),(5110,'09:30:00','10:00:00',1,4,258),(5111,'10:00:00','10:30:00',1,4,258),(5112,'10:30:00','11:00:00',1,4,258),(5113,'11:00:00','11:30:00',1,4,258),(5114,'11:30:00','12:00:00',1,4,258),(5115,'09:00:00','09:30:00',1,4,259),(5116,'09:30:00','10:00:00',1,4,259),(5117,'10:00:00','10:30:00',1,4,259),(5118,'10:30:00','11:00:00',1,4,259),(5119,'11:00:00','11:30:00',1,4,259),(5120,'11:30:00','12:00:00',1,4,259),(5226,'09:00:00','09:30:00',1,3,269),(5227,'10:00:00','11:00:00',1,3,269),(5228,'11:00:00','12:00:00',1,3,269),(5229,'12:00:00','12:30:00',1,3,269),(5230,'13:00:00','14:00:00',1,3,269),(5231,'14:00:00','15:00:00',1,3,269),(5232,'15:00:00','16:00:00',1,3,269),(5233,'16:00:00','17:00:00',1,3,269),(5234,'17:00:00','18:00:00',1,3,269),(5235,'09:00:00','10:00:00',1,3,270),(5236,'10:00:00','11:00:00',1,3,270),(5237,'11:00:00','12:00:00',1,3,270),(5238,'12:00:00','13:30:00',1,3,270),(5239,'13:30:00','14:30:00',1,3,270),(5240,'14:30:00','15:30:00',1,3,270),(5241,'15:30:00','16:30:00',1,3,270),(5242,'16:30:00','17:30:00',1,3,270),(5243,'17:30:00','18:00:00',1,3,270),(5244,'09:00:00','10:00:00',1,3,271),(5245,'10:00:00','10:30:00',1,3,271),(5246,'10:30:00','11:00:00',1,3,271),(5247,'11:00:00','11:10:00',1,3,271),(5248,'11:10:00','12:10:00',1,3,271),(5249,'12:10:00','13:10:00',1,3,271),(5250,'13:10:00','13:40:00',1,5,271),(5251,'13:40:00','14:40:00',1,3,271),(5252,'14:40:00','15:40:00',1,3,271),(5253,'09:00:00','10:00:00',1,3,272),(5254,'10:00:00','11:00:00',1,3,272),(5255,'11:00:00','11:30:00',0,2,272),(5256,'12:00:00','13:00:00',1,3,272),(5257,'13:00:00','13:30:00',1,4,272),(5258,'13:30:00','13:45:00',1,3,272),(5259,'14:30:00','15:00:00',1,2,272),(5260,'15:00:00','16:00:00',1,3,272),(5261,'16:00:00','17:00:00',1,3,272),(5262,'09:00:00','10:00:00',1,3,273),(5263,'10:00:00','11:00:00',1,3,273),(5264,'11:00:00','11:30:00',1,4,273),(5265,'12:00:00','13:00:00',1,3,273),(5266,'13:00:00','14:00:00',1,3,273),(5267,'14:00:00','15:00:00',1,3,273),(5268,'15:00:00','16:00:00',1,3,273),(5269,'16:00:00','16:30:00',1,1,273),(5270,'16:30:00','17:30:00',1,3,273),(5271,'15:40:00','16:10:00',0,3,271),(5272,'16:10:00','16:40:00',1,3,271),(5273,'17:00:00','17:30:00',0,3,272),(5274,'17:30:00','18:00:00',1,3,272),(5275,'11:30:00','12:00:00',1,3,272),(5276,'11:30:00','12:00:00',0,5,273),(5277,'17:30:00','18:00:00',1,3,273),(5467,'13:45:00','14:15:00',1,3,272),(5468,'14:15:00','14:30:00',0,3,272),(5469,'16:40:00','17:10:00',1,3,271),(5470,'17:10:00','17:30:00',0,3,271),(5471,'17:30:00','17:40:00',1,3,271),(5472,'17:40:00','17:50:00',1,3,271),(5473,'17:50:00','18:00:00',1,3,271),(5474,'09:30:00','10:00:00',0,3,269),(5475,'12:30:00','13:00:00',1,3,269),(7207,'10:00:00','10:15:00',1,7,393),(7208,'10:15:00','10:30:00',1,7,393),(7209,'10:30:00','10:45:00',1,7,393),(7210,'10:45:00','11:00:00',1,7,393),(7211,'11:00:00','11:15:00',1,7,393),(7212,'11:15:00','11:30:00',1,7,393),(7213,'11:30:00','11:45:00',1,7,393),(7214,'11:45:00','12:00:00',1,7,393),(7215,'12:00:00','12:15:00',1,7,393),(7216,'12:15:00','12:30:00',1,7,393),(7217,'12:30:00','12:45:00',1,7,393),(7218,'12:45:00','13:00:00',1,7,393),(7219,'13:00:00','13:15:00',1,7,393),(7220,'13:15:00','13:30:00',1,7,393),(7221,'13:30:00','13:45:00',1,7,393),(7222,'13:45:00','14:00:00',1,7,393),(7223,'14:00:00','14:15:00',1,7,393),(7224,'14:15:00','14:30:00',1,7,393),(7225,'14:30:00','14:45:00',1,7,393),(7226,'14:45:00','15:00:00',1,7,393),(7227,'10:00:00','10:15:00',1,7,394),(7228,'10:15:00','10:30:00',1,7,394),(7229,'10:30:00','10:45:00',1,7,394),(7230,'10:45:00','11:00:00',1,7,394),(7231,'11:00:00','11:15:00',1,7,394),(7232,'11:15:00','11:30:00',1,7,394),(7233,'11:30:00','11:45:00',1,7,394),(7234,'11:45:00','12:00:00',1,7,394),(7235,'12:00:00','12:15:00',1,7,394),(7236,'12:15:00','12:30:00',1,7,394),(7237,'12:30:00','12:45:00',1,7,394),(7238,'12:45:00','13:00:00',1,7,394),(7239,'13:00:00','13:15:00',1,7,394),(7240,'13:15:00','13:30:00',1,7,394),(7241,'13:30:00','13:45:00',1,7,394),(7242,'13:45:00','14:00:00',1,7,394),(7243,'14:00:00','14:15:00',1,7,394),(7244,'14:15:00','14:30:00',1,7,394),(7245,'14:30:00','14:45:00',1,7,394),(7246,'14:45:00','15:00:00',1,7,394),(9636,'08:30:00','08:45:00',1,5,555),(9637,'08:45:00','09:00:00',1,5,555),(9638,'09:00:00','09:15:00',1,5,555),(9639,'09:15:00','09:30:00',1,5,555),(9640,'09:30:00','09:45:00',1,5,555),(9641,'09:45:00','10:00:00',1,5,555),(9642,'10:00:00','10:15:00',1,5,555),(9643,'10:15:00','10:30:00',1,5,555),(9644,'10:30:00','10:45:00',1,5,555),(9645,'10:45:00','11:00:00',1,5,555),(9646,'11:00:00','11:15:00',1,5,555),(9647,'11:15:00','11:30:00',1,5,555),(9648,'11:30:00','11:45:00',1,5,555),(9649,'11:45:00','12:00:00',1,5,555),(9650,'12:00:00','12:15:00',1,5,555),(9651,'12:15:00','12:30:00',1,5,555),(9652,'12:30:00','12:45:00',1,5,555),(9653,'12:45:00','13:00:00',1,5,555),(9654,'13:00:00','13:15:00',1,5,555),(9655,'13:15:00','13:30:00',1,5,555),(9656,'13:30:00','13:45:00',1,5,555),(9657,'13:45:00','14:00:00',1,5,555),(9658,'14:00:00','14:15:00',1,5,555),(9659,'14:15:00','14:30:00',1,5,555),(9660,'14:30:00','14:45:00',1,5,555),(9661,'14:45:00','15:00:00',1,5,555),(9662,'15:00:00','15:15:00',1,5,555),(9663,'15:15:00','15:30:00',1,5,555),(9664,'15:30:00','15:45:00',1,5,555),(9665,'15:45:00','16:00:00',1,5,555),(9666,'16:00:00','16:15:00',1,5,555),(9667,'16:15:00','16:30:00',1,5,555),(9668,'16:30:00','16:45:00',1,5,555),(9669,'08:30:00','08:45:00',1,5,556),(9670,'08:45:00','09:00:00',0,6,556),(9671,'09:00:00','09:15:00',1,5,556),(9672,'09:15:00','09:30:00',1,5,556),(9673,'09:30:00','09:45:00',1,5,556),(9674,'09:45:00','10:00:00',1,5,556),(9675,'10:00:00','10:15:00',1,5,556),(9676,'10:15:00','10:30:00',1,5,556),(9677,'10:30:00','10:45:00',1,5,556),(9678,'10:45:00','11:00:00',1,5,556),(9679,'11:00:00','11:15:00',1,5,556),(9680,'11:15:00','11:30:00',1,5,556),(9681,'11:30:00','11:45:00',1,5,556),(9682,'11:45:00','12:00:00',1,5,556),(9683,'12:00:00','12:15:00',1,5,556),(9684,'12:15:00','12:30:00',1,5,556),(9685,'12:30:00','12:45:00',1,5,556),(9686,'12:45:00','13:00:00',1,5,556),(9687,'13:00:00','13:15:00',1,5,556),(9688,'13:15:00','13:30:00',1,5,556),(9689,'13:30:00','13:45:00',1,5,556),(9690,'13:45:00','14:00:00',1,5,556),(9691,'14:00:00','14:15:00',1,5,556),(9692,'14:15:00','14:30:00',1,5,556),(9693,'14:30:00','14:45:00',1,5,556),(9694,'14:45:00','15:00:00',1,5,556),(9695,'15:00:00','15:15:00',1,5,556),(9696,'15:15:00','15:30:00',1,5,556),(9697,'15:30:00','15:45:00',1,5,556),(9698,'15:45:00','16:00:00',1,5,556),(9699,'16:00:00','16:15:00',1,5,556),(9700,'16:15:00','16:30:00',1,5,556),(9701,'16:30:00','16:45:00',1,5,556),(9702,'08:30:00','08:45:00',1,5,557),(9703,'08:45:00','09:00:00',1,5,557),(9704,'09:00:00','09:15:00',0,5,557),(9705,'09:15:00','09:30:00',0,5,557),(9706,'09:30:00','09:45:00',1,5,557),(9707,'09:45:00','10:00:00',1,3,557),(9708,'10:00:00','10:15:00',1,5,557),(9709,'10:15:00','10:30:00',1,5,557),(9710,'10:30:00','10:45:00',1,5,557),(9711,'10:45:00','11:00:00',1,5,557),(9712,'11:00:00','11:15:00',1,5,557),(9713,'11:15:00','11:30:00',1,5,557),(9714,'11:30:00','11:45:00',1,5,557),(9715,'11:45:00','12:00:00',1,5,557),(9716,'12:00:00','12:15:00',1,5,557),(9717,'12:15:00','12:30:00',1,5,557),(9718,'12:30:00','12:45:00',1,5,557),(9719,'12:45:00','13:00:00',1,5,557),(9720,'13:00:00','13:15:00',1,5,557),(9721,'13:15:00','13:30:00',1,5,557),(9722,'13:30:00','13:45:00',1,5,557),(9723,'13:45:00','14:00:00',1,5,557),(9724,'14:00:00','14:15:00',1,5,557),(9725,'14:15:00','14:30:00',1,5,557),(9726,'14:30:00','14:45:00',1,5,557),(9727,'14:45:00','15:00:00',1,5,557),(9728,'15:00:00','15:15:00',1,5,557),(9729,'15:15:00','15:30:00',1,5,557),(9730,'15:30:00','15:45:00',1,5,557),(9731,'15:45:00','16:00:00',1,5,557),(9732,'16:00:00','16:15:00',1,5,557),(9733,'16:15:00','16:30:00',1,5,557),(9734,'16:30:00','16:45:00',1,5,557),(9735,'08:30:00','08:45:00',1,5,558),(9736,'08:45:00','09:00:00',1,5,558),(9737,'09:00:00','09:15:00',0,6,558),(9738,'09:15:00','09:30:00',1,5,558),(9739,'09:30:00','09:45:00',1,5,558),(9740,'09:45:00','10:00:00',1,1,558),(9741,'10:00:00','10:15:00',1,1,558),(9742,'10:15:00','10:30:00',1,1,558),(9743,'10:30:00','10:45:00',1,5,558),(9744,'10:45:00','11:00:00',1,5,558),(9745,'11:00:00','11:15:00',1,5,558),(9746,'11:15:00','11:30:00',1,5,558),(9747,'11:30:00','11:45:00',1,5,558),(9748,'11:45:00','12:00:00',1,5,558),(9749,'12:00:00','12:15:00',1,5,558),(9750,'12:15:00','12:30:00',1,5,558),(9751,'12:30:00','12:45:00',1,5,558),(9752,'12:45:00','13:00:00',1,5,558),(9753,'13:00:00','13:15:00',1,5,558),(9754,'13:15:00','13:30:00',1,5,558),(9755,'13:30:00','13:45:00',1,5,558),(9756,'13:45:00','14:00:00',1,5,558),(9757,'14:00:00','14:15:00',1,5,558),(9758,'14:15:00','14:30:00',1,5,558),(9759,'14:30:00','14:45:00',1,5,558),(9760,'14:45:00','15:00:00',1,5,558),(9761,'15:00:00','15:15:00',1,5,558),(9762,'15:15:00','15:30:00',1,5,558),(9763,'15:30:00','15:45:00',1,5,558),(9764,'15:45:00','16:00:00',1,5,558),(9765,'16:00:00','16:15:00',1,5,558),(9766,'16:15:00','16:30:00',1,5,558),(9767,'16:30:00','16:45:00',1,5,558),(9768,'08:30:00','08:45:00',1,5,559),(9769,'08:45:00','09:00:00',1,5,559),(9770,'09:00:00','09:15:00',1,5,559),(9771,'09:15:00','09:30:00',1,5,559),(9772,'09:30:00','09:45:00',1,5,559),(9773,'09:45:00','10:00:00',1,5,559),(9774,'10:00:00','10:15:00',1,5,559),(9775,'10:15:00','10:30:00',1,5,559),(9776,'10:30:00','10:45:00',1,5,559),(9777,'10:45:00','11:00:00',1,5,559),(9778,'11:00:00','11:15:00',1,5,559),(9779,'11:15:00','11:30:00',1,5,559),(9780,'11:30:00','11:45:00',1,5,559),(9781,'11:45:00','12:00:00',1,5,559),(9782,'12:00:00','12:15:00',1,5,559),(9783,'12:15:00','12:30:00',1,5,559),(9784,'12:30:00','12:45:00',1,5,559),(9785,'12:45:00','13:00:00',1,5,559),(9786,'13:00:00','13:15:00',1,5,559),(9787,'13:15:00','13:30:00',1,5,559),(9788,'13:30:00','13:45:00',1,5,559),(9789,'13:45:00','14:00:00',1,5,559),(9790,'14:00:00','14:15:00',1,5,559),(9791,'14:15:00','14:30:00',1,5,559),(9792,'14:30:00','14:45:00',1,5,559),(9793,'14:45:00','15:00:00',1,5,559),(9794,'15:00:00','15:15:00',1,5,559),(9795,'15:15:00','15:30:00',1,5,559),(9796,'15:30:00','15:45:00',1,5,559),(9797,'15:45:00','16:00:00',1,5,559),(9798,'16:00:00','16:15:00',1,5,559),(9799,'16:15:00','16:30:00',1,5,559),(9800,'16:30:00','16:45:00',1,5,559),(9801,'08:30:00','08:45:00',1,5,560),(9802,'08:45:00','09:00:00',1,5,560),(9803,'09:00:00','09:15:00',1,5,560),(9804,'09:15:00','09:30:00',1,5,560),(9805,'09:30:00','09:45:00',1,5,560),(9806,'09:45:00','10:00:00',1,5,560),(9807,'10:00:00','10:15:00',1,5,560),(9808,'10:15:00','10:30:00',1,5,560),(9809,'10:30:00','10:45:00',1,5,560),(9810,'10:45:00','11:00:00',1,5,560),(9811,'11:00:00','11:15:00',1,5,560),(9812,'11:15:00','11:30:00',1,5,560),(9813,'11:30:00','11:45:00',1,5,560),(9814,'11:45:00','12:00:00',1,5,560),(9815,'12:00:00','12:15:00',1,5,560),(9816,'12:15:00','12:30:00',1,5,560),(9817,'12:30:00','12:45:00',1,5,560),(9818,'12:45:00','13:00:00',1,5,560),(9819,'13:00:00','13:15:00',1,5,560),(9820,'13:15:00','13:30:00',1,5,560),(9821,'13:30:00','13:45:00',1,5,560),(9822,'13:45:00','14:00:00',1,5,560),(9823,'14:00:00','14:15:00',1,5,560),(9824,'14:15:00','14:30:00',1,5,560),(9825,'14:30:00','14:45:00',1,5,560),(9826,'14:45:00','15:00:00',1,5,560),(9827,'15:00:00','15:15:00',1,5,560),(9828,'15:15:00','15:30:00',1,5,560),(9829,'15:30:00','15:45:00',1,5,560),(9830,'15:45:00','16:00:00',1,5,560),(9831,'16:00:00','16:15:00',1,5,560),(9832,'16:15:00','16:30:00',1,5,560),(9833,'16:30:00','16:45:00',1,5,560),(13005,'09:00:00','09:30:00',1,5,695),(13006,'09:30:00','10:00:00',1,5,695),(13007,'10:00:00','10:30:00',1,5,695),(13008,'10:30:00','11:00:00',1,5,695),(13009,'11:00:00','11:30:00',1,5,695),(13010,'11:30:00','12:00:00',1,5,695),(13011,'12:00:00','12:30:00',1,5,695),(13012,'12:30:00','13:00:00',1,5,695),(13013,'13:00:00','13:30:00',1,5,695),(13014,'13:30:00','14:00:00',1,5,695),(13015,'14:00:00','14:30:00',1,5,695),(13016,'14:30:00','15:00:00',1,5,695),(13017,'09:00:00','09:30:00',1,5,696),(13018,'09:30:00','10:00:00',1,5,696),(13019,'10:00:00','10:30:00',1,5,696),(13020,'10:30:00','11:00:00',1,5,696),(13021,'11:00:00','11:30:00',1,5,696),(13022,'11:30:00','12:00:00',1,5,696),(13023,'12:00:00','12:30:00',1,5,696),(13024,'12:30:00','13:00:00',1,5,696),(13025,'13:00:00','13:30:00',1,5,696),(13026,'13:30:00','14:00:00',1,5,696),(13027,'14:00:00','14:30:00',1,5,696),(13028,'14:30:00','15:00:00',1,5,696),(13029,'09:00:00','09:30:00',1,5,697),(13030,'09:30:00','10:00:00',1,5,697),(13031,'10:00:00','10:30:00',1,5,697),(13032,'10:30:00','11:00:00',1,5,697),(13033,'11:00:00','11:30:00',1,5,697),(13034,'11:30:00','12:00:00',1,5,697),(13035,'12:00:00','12:30:00',1,5,697),(13036,'12:30:00','13:00:00',1,5,697),(13037,'13:00:00','13:30:00',1,5,697),(13038,'13:30:00','14:00:00',1,5,697),(13039,'14:00:00','14:30:00',1,5,697),(13040,'14:30:00','15:00:00',1,5,697),(13041,'09:00:00','09:30:00',1,5,698),(13042,'09:30:00','10:00:00',1,5,698),(13043,'10:00:00','10:30:00',1,5,698),(13044,'10:30:00','11:00:00',1,5,698),(13045,'11:00:00','11:30:00',1,5,698),(13046,'11:30:00','12:00:00',1,5,698),(13047,'12:00:00','12:30:00',1,5,698),(13048,'12:30:00','13:00:00',1,5,698),(13049,'13:00:00','13:30:00',1,5,698),(13050,'13:30:00','14:00:00',1,5,698),(13051,'14:00:00','14:30:00',1,5,698),(13052,'14:30:00','15:00:00',1,5,698);
/*!40000 ALTER TABLE `appointment_time_slot` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `email_idx` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_user` WRITE;
/*!40000 ALTER TABLE `appointment_user` DISABLE KEYS */;
INSERT INTO `appointment_user` VALUES (1,NULL,'Laurent','HOHL','laurent.hohl@gmail.com',NULL),(2,NULL,'Laurent','HOHL','laurent.hohl@gmail.com',NULL),(3,NULL,'Laurent','HOHL','laurent.hohl@gmail.com',NULL),(4,NULL,'Julie','PATS','juliepats@yahoo.com',NULL),(5,NULL,'Laurent','HOHL','laurent.hohl@gmail.com',NULL),(6,NULL,'Laurent','HOHL','laurent.hohl@gmail.com',NULL),(7,NULL,'Julie','PATS','juliepats@yahoo.com',NULL),(8,NULL,'HOHL','Clémence','clemence.hohl@gmail.com',NULL),(9,NULL,'Julie','PATS','juliepats@yahoo.com',NULL),(10,NULL,'Laurent','HOHL','laurent.hohl@gmail.com',NULL),(11,NULL,'Laurent','HOHL','laurent.hohl@gmail.com',NULL);
/*!40000 ALTER TABLE `appointment_user` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_week_definition` WRITE;
/*!40000 ALTER TABLE `appointment_week_definition` DISABLE KEYS */;
INSERT INTO `appointment_week_definition` VALUES (276,10,'2021-07-01','2021-08-29'),(325,10,'2021-08-30','2021-08-31'),(326,10,'2021-11-22','2021-12-16'),(327,10,'2021-09-03','2021-11-14'),(333,10,'2021-12-22','2021-12-31'),(334,10,'2022-01-01','2022-12-31');
/*!40000 ALTER TABLE `appointment_week_definition` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointment_working_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_working_day` (
  `id_working_day` int NOT NULL AUTO_INCREMENT,
  `day_of_week` int NOT NULL,
  `id_reservation_rule` int NOT NULL,
  PRIMARY KEY (`id_working_day`),
  UNIQUE KEY `appointment_working_day_unique` (`id_reservation_rule`,`day_of_week`)
) ENGINE=InnoDB AUTO_INCREMENT=767 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointment_working_day` WRITE;
/*!40000 ALTER TABLE `appointment_working_day` DISABLE KEYS */;
INSERT INTO `appointment_working_day` VALUES (86,1,5),(87,2,5),(88,4,5),(89,5,5),(90,6,5),(91,7,5),(103,2,6),(104,3,6),(77,1,10),(78,4,10),(121,2,13),(122,3,13),(393,1,22),(394,4,22),(257,1,33),(258,2,33),(259,3,33),(269,1,37),(270,2,37),(271,3,37),(272,4,37),(273,5,37),(555,1,38),(556,2,38),(557,3,38),(558,4,38),(559,5,38),(560,6,38),(695,1,92),(696,4,92),(697,5,92),(698,6,92);
/*!40000 ALTER TABLE `appointment_working_day` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `appointmentgru_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointmentgru_` (
  `id_appointmentgru` int NOT NULL,
  `guid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `cuid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_appointmentgru`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `appointmentgru_` WRITE;
/*!40000 ALTER TABLE `appointmentgru_` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentgru_` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_admin_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_dashboard` (
  `dashboard_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dashboard_column` int NOT NULL,
  `dashboard_order` int NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_dashboard` WRITE;
/*!40000 ALTER TABLE `core_admin_dashboard` DISABLE KEYS */;
INSERT INTO `core_admin_dashboard` VALUES ('autoIncludesAdminDashboardComponent',1,4),('editorAdminDashboardComponent',1,3),('featuresAdminDashboardComponent',1,5),('myluteceAuthenticationFilterAdminDashboardComponent',1,3),('searchAdminDashboardComponent',1,2),('usersAdminDashboardComponent',1,1),('workflowAdminDashboardComponent',1,1),('xslExportAdminDashboardComponent',1,6);
/*!40000 ALTER TABLE `core_admin_dashboard` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_admin_mailinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_mailinglist` (
  `id_mailinglist` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `workgroup` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_mailinglist` WRITE;
/*!40000 ALTER TABLE `core_admin_mailinglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_mailinglist` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_admin_mailinglist_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_mailinglist_filter` (
  `id_mailinglist` int NOT NULL DEFAULT '0',
  `workgroup` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`,`workgroup`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_mailinglist_filter` WRITE;
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_right` WRITE;
/*!40000 ALTER TABLE `core_admin_right` DISABLE KEYS */;
INSERT INTO `core_admin_right` VALUES ('APPOINTMENT_CALENDAR_TEMPLATE','appointment.adminFeature.manageCalendarTemplates.name',0,'jsp/admin/plugins/appointment/ManageCalendarTemplates.jsp','appointment.adminFeature.manageCalendarTemplates.name',0,'appointment','APPLICATIONS',NULL,NULL,4,0),('APPOINTMENT_CATEGORY_MANAGEMENT','appointment.adminFeature.manageCategories.name',1,'jsp/admin/plugins/appointment/ManageAppointmentCategory.jsp','appointment.adminFeature.manageCategories.name',0,'appointment','MANAGERS',NULL,NULL,8,0),('APPOINTMENT_COMMENT_MANAGEMENT','appointment.adminFeature.manageComment.name',2,'jsp/admin/plugins/appointment/Comments.jsp','appointment.adminFeature.manageComment.name',0,'appointment','APPLICATIONS',NULL,NULL,5,0),('APPOINTMENT_FORM_MANAGEMENT','appointment.adminFeature.ManageAppointmentForm.name',3,'jsp/admin/plugins/appointment/ManageAppointmentForms.jsp','appointment.adminFeature.ManageAppointmentForm.description',0,'appointment','CONTENT',NULL,NULL,1,0),('CORE_ADMIN_SITE','portal.site.adminFeature.admin_site.name',0,'jsp/admin/site/AdminSite.jsp','portal.site.adminFeature.admin_site.description',1,NULL,'SITE','images/admin/skin/features/admin_site.png','jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-site',1,0),('CORE_ADMINDASHBOARD_MANAGEMENT','portal.admindashboard.adminFeature.right_management.name',0,NULL,'portal.admindashboard.adminFeature.right_management.description',0,'','SYSTEM','images/admin/skin/features/manage_admindashboards.png',NULL,10,0),('CORE_CACHE_MANAGEMENT','portal.system.adminFeature.cache_management.name',0,'jsp/admin/system/ManageCaches.jsp','portal.system.adminFeature.cache_management.description',1,'','SYSTEM','images/admin/skin/features/manage_caches.png',NULL,2,0),('CORE_DAEMONS_MANAGEMENT','portal.system.adminFeature.daemons_management.name',0,'jsp/admin/system/ManageDaemons.jsp','portal.system.adminFeature.daemons_management.description',0,'','SYSTEM',NULL,NULL,9,0),('CORE_DASHBOARD_MANAGEMENT','portal.dashboard.adminFeature.dashboard_management.name',0,NULL,'portal.dashboard.adminFeature.dashboard_management.description',0,'','SYSTEM','images/admin/skin/features/manage_dashboards.png',NULL,11,0),('CORE_EDITORS_MANAGEMENT','portal.admindashboard.editorManagement.right.name',0,NULL,'portal.admindashboard.editorManagement.right.description',1,'','SYSTEM',NULL,NULL,12,0),('CORE_FEATURES_MANAGEMENT','portal.admin.adminFeature.features_management.name',0,NULL,'portal.admin.adminFeature.features_management.description',0,'','SYSTEM','images/admin/skin/features/manage_features.png',NULL,8,0),('CORE_LEVEL_RIGHT_MANAGEMENT','portal.users.adminFeature.level_right_management.name',0,NULL,'portal.users.adminFeature.level_right_management.description',0,'','MANAGERS','images/admin/skin/features/manage_rights_levels.png',NULL,5,0),('CORE_LINK_SERVICE_MANAGEMENT','portal.insert.adminFeature.linkService_management.name',0,NULL,'portal.insert.adminFeature.linkService_management.description',0,NULL,NULL,NULL,NULL,1,0),('CORE_LOGS_VISUALISATION','portal.system.adminFeature.logs_visualisation.name',0,'jsp/admin/system/ManageFilesSystem.jsp','portal.system.adminFeature.logs_visualisation.description',1,'','SYSTEM','images/admin/skin/features/view_logs.png',NULL,3,0),('CORE_MAILINGLISTS_MANAGEMENT','portal.mailinglist.adminFeature.mailinglists_management.name',2,'jsp/admin/mailinglist/ManageMailingLists.jsp','portal.mailinglist.adminFeature.mailinglists_management.description',0,'','MANAGERS','images/admin/skin/features/manage_mailinglists.png',NULL,4,0),('CORE_PAGE_TEMPLATE_MANAGEMENT','portal.style.adminFeature.page_template_management.name',0,'jsp/admin/style/ManagePageTemplates.jsp','portal.style.adminFeature.page_template_management.description',0,'','STYLE','images/admin/skin/features/manage_page_templates.png',NULL,1,0),('CORE_PLUGINS_MANAGEMENT','portal.system.adminFeature.plugins_management.name',0,'jsp/admin/system/ManagePlugins.jsp','portal.system.adminFeature.plugins_management.description',1,'','SYSTEM','images/admin/skin/features/manage_plugins.png',NULL,4,0),('CORE_PROPERTIES_MANAGEMENT','portal.site.adminFeature.properties_management.name',0,'jsp/admin/ManageProperties.jsp','portal.site.adminFeature.properties_management.description',0,NULL,'SITE',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-properties',2,0),('CORE_RBAC_MANAGEMENT','portal.rbac.adminFeature.rbac_management.name',1,'jsp/admin/rbac/ManageRoles.jsp','portal.rbac.adminFeature.rbac_management.description',0,'','MANAGERS','images/admin/skin/features/manage_rbac.png',NULL,2,0),('CORE_RIGHT_MANAGEMENT','portal.users.adminFeature.right_management.name',1,'jsp/admin/features/ManageRights.jsp','portal.users.adminFeature.right_management.description',0,'','MANAGERS','images/admin/skin/features/manage_rights_levels.png',NULL,6,0),('CORE_ROLES_MANAGEMENT','portal.role.adminFeature.roles_management.name',1,'jsp/admin/role/ManagePageRole.jsp','portal.role.adminFeature.roles_management.description',0,'','USERS','images/admin/skin/features/manage_roles.png',NULL,3,0),('CORE_SEARCH_INDEXATION','portal.search.adminFeature.indexer.name',0,'jsp/admin/search/ManageSearchIndexation.jsp','portal.search.adminFeature.indexer.description',0,'','SYSTEM',NULL,NULL,5,0),('CORE_SEARCH_MANAGEMENT','portal.search.adminFeature.search_management.name',0,NULL,'portal.search.adminFeature.search_management.description',0,'','SYSTEM',NULL,NULL,6,0),('CORE_STYLES_MANAGEMENT','portal.style.adminFeature.styles_management.name',0,'jsp/admin/style/ManageStyles.jsp','portal.style.adminFeature.styles_management.description',1,'','STYLE','images/admin/skin/features/manage_styles.png',NULL,3,0),('CORE_STYLESHEET_MANAGEMENT','portal.style.adminFeature.stylesheet_management.name',0,'jsp/admin/style/ManageStyleSheets.jsp','portal.style.adminFeature.stylesheet_management.description',1,'','STYLE','images/admin/skin/features/manage_stylesheets.png',NULL,2,0),('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT','portal.templates.adminFeature.ManageAutoIncludes.name',0,NULL,'portal.templates.adminFeature.ManageAutoIncludes.description',1,'','STYLE','images/admin/skin/features/manage_templates.png',NULL,4,0),('CORE_USERS_MANAGEMENT','portal.users.adminFeature.users_management.name',2,'jsp/admin/user/ManageUsers.jsp','portal.users.adminFeature.users_management.description',1,'','MANAGERS','images/admin/skin/features/manage_users.png',NULL,1,0),('CORE_WORKGROUPS_MANAGEMENT','portal.workgroup.adminFeature.workgroups_management.name',1,'jsp/admin/workgroup/ManageWorkgroups.jsp','portal.workgroup.adminFeature.workgroups_management.description',0,'','MANAGERS','images/admin/skin/features/manage_workgroups.png',NULL,3,0),('CORE_XSL_EXPORT_MANAGEMENT','portal.xsl.adminFeature.xsl_export_management.name',0,NULL,'portal.xsl.adminFeature.xsl_export_management.description',1,'','SYSTEM',NULL,NULL,13,0),('ENTRY_TYPE_MANAGEMENT','genericattributes.adminFeature.manageEntryType.name',1,'jsp/admin/plugins/genericattributes/ManageEntryType.jsp','genericattributes.adminFeature.manageEntryType.description',0,'genericattributes','APPLICATIONS',NULL,NULL,2,0),('HTMLPAGE_MANAGEMENT','htmlpage.adminFeature.htmlpage_management.name',1,'jsp/admin/plugins/htmlpage/ManageHtmlPage.jsp','htmlpage.adminFeature.htmlpage_management.description',0,'htmlpage','SITE',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-htmlpage',3,0),('MULTIVIEW_APPOINTMENT','module.appointment.management.adminFeature.MultiviewAppointment.name',3,'jsp/admin/plugins/appointment/modules/management/MultiviewAppointment.jsp','module.appointment.management.adminFeature.MultiviewAppointment.description',0,'appointment-management','CONTENT',NULL,NULL,2,0),('MYDASHBOARD_PANEL_MANAGEMENT','mydashboard.adminFeature.ManageMydashboardPanel.name',0,'jsp/admin/plugins/mydashboard/ManageMyDashboardPanel.jsp','mydashboard.adminFeature.ManageMydashboardPanel.description',0,'mydashboard','USERS',NULL,NULL,4,0),('MYLUTECE_MANAGE_AUTHENTICATION_FILTER','mylutece.adminFeature.mylutece_management_authentication_filter.name',0,'jsp/admin/plugins/mylutece/security/ManageAuthenticationFilter.jsp','mylutece.adminFeature.mylutece_management_authentication_filter.description',0,'mylutece','USERS',NULL,NULL,1,0),('MYLUTECE_MANAGEMENT','mylutece.adminFeature.mylutece_management.name',0,'jsp/admin/plugins/mylutece/attribute/ManageAttributes.jsp','mylutece.adminFeature.mylutece_management.description',0,'mylutece','USERS',NULL,NULL,2,0),('PROFILES_MANAGEMENT','profiles.adminFeature.profiles_management.name',1,'jsp/admin/plugins/profiles/ManageProfiles.jsp','profiles.adminFeature.profiles_management.description',0,'profiles','MANAGERS',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-profiles',7,0),('PROFILES_VIEWS_MANAGEMENT','profiles.adminFeature.views_management.name',1,'jsp/admin/plugins/profiles/ManageViews.jsp','profiles.adminFeature.views_management.description',0,'profiles','MANAGERS',NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-profiles',9,0),('REFERENCELIST_MANAGEMENT','referencelist.adminFeature.ReferenceListManage.name',0,'jsp/admin/plugins/referencelist/ManageReferences.jsp','referencelist.adminFeature.ReferenceListManage.description',0,'referencelist','APPLICATIONS',NULL,NULL,6,0),('REGULAR_EXPRESSION_MANAGEMENT','regularexpression.adminFeature.regularexpression_management.name',1,'jsp/admin/plugins/regularexpression/ManageRegularExpression.jsp','regularexpression.adminFeature.regularexpression_management.description',0,'regularexpression','SYSTEM','images/admin/skin/plugins/regularexpression/regularexpression.png',NULL,1,0),('RESOURCE_MANAGE_RESOURCES','resource.resourceManagement.pageTitle',2,'jsp/admin/plugins/resource/ManageResources.jsp','resource.resourceManagement.description',0,'resource','APPLICATIONS',NULL,NULL,3,0),('SITELABELS_MANAGEMENT','sitelabels.adminFeature.ManageSiteLabels.name',1,'jsp/admin/plugins/sitelabels/ManageLabels.jsp','sitelabels.adminFeature.ManageSiteLabels.description',0,'sitelabels','SITE',NULL,NULL,4,0),('SOLR_CONFIGURATION_MANAGEMENT','search.solr.adminFeature.configuration.title',0,'jsp/admin/search/solr/ManageSearchConfiguration.jsp','search.solr.adminFeature.configuration.description',0,'solr','SYSTEM',NULL,'',15,0),('SOLR_FIELDS_MANAGEMENT','search.solr.adminFeature.fields.title',0,'jsp/admin/search/solr/ManageSolrFields.jsp','search.solr.adminFeature.fields.description',0,'solr','SYSTEM',NULL,'',16,0),('SOLR_INDEX_MANAGEMENT','search.solr.adminFeature.title',0,'jsp/admin/search/solr/ManageSearchIndexation.jsp','search.solr.adminFeature.description',0,'solr','SYSTEM',NULL,'',14,0),('SORLSERVER_ADD_FILE','solrserver.adminFeature.addfile.name',2,'jsp/admin/plugins/solrserver/ManageFileInSolr.jsp','solrserver.adminFeature.addfile.description',0,'solrserver',NULL,NULL,'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-solrserver',2,0),('SYSTEMINFO_MANAGEMENT','systeminfo.adminFeature.systeminfo_management.name',0,'jsp/admin/plugins/systeminfo/ManageSystemInfo.jsp','systeminfo.adminFeature.systeminfo_management.description',0,'systeminfo','SYSTEM',NULL,NULL,17,0),('VIEW_TEMP_FILES','filegenerator.adminFeature.temporary_files.name',3,'jsp/admin/plugins/filegenerator/ManageMyFiles.jsp','filegenerator.adminFeature.temporary_files.description',0,'','SYSTEM',NULL,NULL,7,0),('WORKFLOW_MANAGEMENT','workflow.adminFeature.workflow_management.name',2,'jsp/admin/plugins/workflow/ManageWorkflow.jsp','workflow.adminFeature.workflow_management.description',0,'workflow','APPLICATIONS','images/admin/skin/plugins/workflow/workflow.png','jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-workflow',1,0);
/*!40000 ALTER TABLE `core_admin_right` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_role` (
  `role_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_role` WRITE;
/*!40000 ALTER TABLE `core_admin_role` DISABLE KEYS */;
INSERT INTO `core_admin_role` VALUES ('all_site_manager','Site Manager'),('APP_OVERBOOK','Prise de RDV en surbooking'),('assign_groups','Assigner des groupes aux utilisateurs'),('assign_roles','Assigner des roles aux utilisateurs'),('COMMENT_ADD','Ajout de commentaires'),('COMMENT_MODERATE','Mod├⌐ration de commentaires (modifier/supprimer)'),('CONFIG_GFA','Configuration pour GFA'),('CONSULTATION_KIBANA','Consultation tableau de bord Kibana'),('front_role','front role'),('Gestion_utilisateurs_avancee','Gestion avanc├⌐es des utilisateurs'),('kibana_dashboards_manager','Gestion des tableaux de bords Kibana'),('LISTE_DIFF','Role vide permettant de l\'assigner aux utilisateurs faisant partie des listes de diffusion'),('LISTE_DIFF_ERREUR_GFA','Role vide permettant de l\'assigner destinataires des erreurs GFA'),('MAILTEST','MAILTEST'),('mylutece_manager','G├⌐rer les patram├¿tres avanc├⌐s Mylutece'),('profiles_manager','Profiles management'),('profiles_views_manager','Profiles Views management'),('RDV_ADMIN','Configuration compl├¿te de tous les composants de rendez-vous'),('rdv_agentAccueil','Configuration des composants de rendez-vous relative ├á un compte agent d\'accueil'),('RDV_form','Modification et activation d\'un formulaire de rendez-vous'),('rdv_planificateur','Configuration des composants de rendez-vous relative ├á un compte plannificateur'),('super_admin','Super Administrateur'),('test_lolo','RDV'),('workflow_manager','Workflow management');
/*!40000 ALTER TABLE `core_admin_role` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=1174 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_role_resource` WRITE;
/*!40000 ALTER TABLE `core_admin_role_resource` DISABLE KEYS */;
INSERT INTO `core_admin_role_resource` VALUES (101,'all_site_manager','PORTLET_TYPE','*','*'),(111,'all_site_manager','ADMIN_USER','*','*'),(137,'all_site_manager','SEARCH_SERVICE','*','*'),(150,'profiles_manager','PROFILES','*','*'),(151,'profiles_views_manager','PROFILES_VIEWS','*','*'),(164,'all_site_manager','XSL_EXPORT','*','*'),(207,'mylutece_manager','MYLUTECE','*','*'),(912,'workflow_manager','WORKFLOW_ACTION_TYPE','*','*'),(923,'workflow_manager','WORKFLOW_STATE_TYPE','*','*'),(1026,'super_admin','APPOINTMENT_FORM','*','*'),(1027,'kibana_dashboards_manager','kibana_dashboard','*','*'),(1028,'super_admin','WORKFLOW_ACTION_TYPE','*','*'),(1029,'super_admin','APPOINTMENT_FORM_CREATE','*','*'),(1030,'super_admin','CONFIG_GFA','*','*'),(1031,'super_admin','ROLE_TYPE','*','*'),(1032,'super_admin','PAGE','*','*'),(1033,'super_admin','WORKFLOW_STATE_TYPE','*','*'),(1034,'super_admin','ADMIN_USER','*','*'),(1035,'super_admin','MYLUTECE','*','*'),(1036,'super_admin','INSERT_SERVICE','*','*'),(1037,'super_admin','IDENTITY','*','*'),(1040,'CONSULTATION_KIBANA','kibana_dashboard','*','VIEW'),(1041,'APP_OVERBOOK','APPOINTMENT_FORM','*','OVERBOOKING_FORM'),(1043,'RDV_ADMIN','APPOINTMENT_FORM','*','VIEW_APPOINTMENT'),(1046,'RDV_ADMIN','APPOINTMENT_FORM','*','CHANGE_STATE'),(1047,'RDV_ADMIN','APPOINTMENT_FORM','*','MODIFY_ADVANCED_SETTING_FORM'),(1048,'RDV_ADMIN','APPOINTMENT_FORM','*','CREATE_APPOINTMENT'),(1049,'RDV_ADMIN','APPOINTMENT_FORM','*','VIEW_FORM'),(1050,'RDV_ADMIN','APPOINTMENT_FORM','*','DELETE_APPOINTMENT'),(1051,'RDV_ADMIN','APPOINTMENT_FORM','*','CHANGE_APPOINTMENT_DATE'),(1053,'RDV_ADMIN','APPOINTMENT_FORM','*','MODIFY_FORM'),(1054,'RDV_ADMIN','APPOINTMENT_FORM_CREATE','*','CREATE_FORM'),(1055,'RDV_ADMIN','WORKFLOW_ACTION_TYPE','*','*'),(1056,'RDV_ADMIN','WORKFLOW_STATE_TYPE','*','*'),(1057,'RDV_ADMIN','COMMENT','*','*'),(1066,'rdv_planificateur','APPOINTMENT_FORM','*','VIEW_FORM'),(1068,'super_admin','PROFILES','*','*'),(1078,'rdv_agentAccueil','APPOINTMENT_FORM','*','VIEW_FORM'),(1079,'rdv_agentAccueil','APPOINTMENT_FORM','*','VIEW_APPOINTMENT'),(1083,'rdv_agentAccueil','APPOINTMENT_FORM','*','CHANGE_APPOINTMENT_STATUS'),(1084,'rdv_agentAccueil','APPOINTMENT_FORM','*','CREATE_APPOINTMENT'),(1085,'rdv_planificateur','APPOINTMENT_FORM','*','MODIFY_ADVANCED_SETTING_FORM'),(1086,'rdv_agentAccueil','WORKFLOW_ACTION_TYPE','*','VIEW'),(1092,'front_role','WORKFLOW_ACTION_TYPE','56','VIEW'),(1093,'front_role','WORKFLOW_ACTION_TYPE','55','VIEW'),(1094,'front_role','WORKFLOW_ACTION_TYPE','60','VIEW'),(1095,'rdv_agentAccueil','APPOINTMENT_FORM','*','CHANGE_APPOINTMENT_DATE'),(1098,'front_role','WORKFLOW_ACTION_TYPE','10','*'),(1099,'front_role','WORKFLOW_ACTION_TYPE','6','*'),(1100,'front_role','WORKFLOW_ACTION_TYPE','2','*'),(1101,'super_admin','kibana_dashboard','*','*'),(1102,'rdv_agentAccueil','WORKFLOW_STATE_TYPE','*','VIEW_ALL_WORKGROUP'),(1103,'front_role','WORKFLOW_ACTION_TYPE','28','VIEW'),(1104,'front_role','WORKFLOW_ACTION_TYPE','25','VIEW'),(1105,'front_role','WORKFLOW_ACTION_TYPE','63','VIEW'),(1106,'front_role','WORKFLOW_ACTION_TYPE','64','VIEW'),(1108,'COMMENT_ADD','APPOINTMENT_FORM','*','ADD_COMMENT_FORM'),(1109,'COMMENT_MODERATE','APPOINTMENT_FORM','*','MODERATE_COMMENT_FORM'),(1111,'front_role','WORKFLOW_ACTION_TYPE','201','*'),(1112,'front_role','WORKFLOW_ACTION_TYPE','60','*'),(1113,'front_role','WORKFLOW_ACTION_TYPE','198','VIEW'),(1114,'front_role','WORKFLOW_ACTION_TYPE','199','VIEW'),(1154,'RDV_ADMIN','CONFIG_GFA','*','*'),(1156,'assign_roles','ROLE_TYPE','*','ASSIGN_ROLE'),(1157,'CONFIG_GFA','CONFIG_GFA','*','*'),(1158,'rdv_planificateur','APPOINTMENT_FORM','*','MODIFY_FORM'),(1159,'RDV_form','APPOINTMENT_FORM','*','VIEW_APPOINTMENT'),(1160,'RDV_form','APPOINTMENT_FORM','*','CHANGE_APPOINTMENT_STATUS'),(1161,'RDV_form','APPOINTMENT_FORM','*','CHANGE_STATE'),(1162,'RDV_form','APPOINTMENT_FORM','*','MODIFY_ADVANCED_SETTING_FORM'),(1163,'RDV_form','APPOINTMENT_FORM','*','CREATE_APPOINTMENT'),(1164,'RDV_form','APPOINTMENT_FORM','*','DELETE_FORM'),(1165,'RDV_form','APPOINTMENT_FORM','*','VIEW_FORM'),(1166,'RDV_form','APPOINTMENT_FORM','*','MODIFY_FORM'),(1167,'super_admin','PORTLET_TYPE','*','CREATE'),(1168,'super_admin','PORTLET_TYPE','*','MANAGE'),(1169,'super_admin','SEARCH_SERVICE','*','*'),(1170,'super_admin','COMMENT','*','*'),(1171,'super_admin','XSL_EXPORT','*','*'),(1172,'super_admin','PROFILES_VIEWS','*','*'),(1173,'Gestion_utilisateurs_avancee','ADMIN_USER','*','*');
/*!40000 ALTER TABLE `core_admin_role_resource` ENABLE KEYS */;
UNLOCK TABLES;
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
  `last_login` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'all',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_user` WRITE;
/*!40000 ALTER TABLE `core_admin_user` DISABLE KEYS */;
INSERT INTO `core_admin_user` VALUES (1,'admin','AdminNom','adminPrénom','philippe.bareille@paris.fr',0,'PBKDF2WITHHMACSHA512:40000:2fab846f7b9e5ac90dc748468cba9a8d:4c0bdd4f4788e77b5186654b468bcea427da390aab937d0914e0c27705d5f3890224ec18b57a552c1705059c3bafbb0b75a723157ff957e30517abdec4f5b10e1888148e12b50c89a6c5cab66d19695d58586307a36a4bbb3315df036d9be773d876f1715caf225945b7866a2c621e05a0d38ae1fc5725178f95ffd8a5393a9c','fr',0,0,0,'2022-07-01 13:34:00',1678454561626,0,'2022-03-10 14:22:41','all');
/*!40000 ALTER TABLE `core_admin_user` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_admin_user_anonymize_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_user_anonymize_field` (
  `field_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `anonymize` smallint NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_user_anonymize_field` WRITE;
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` DISABLE KEYS */;
INSERT INTO `core_admin_user_anonymize_field` VALUES ('access_code',1),('email',1),('first_name',1),('last_name',1);
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_user_field` WRITE;
/*!40000 ALTER TABLE `core_admin_user_field` DISABLE KEYS */;
INSERT INTO `core_admin_user_field` VALUES (53,13,1,7,NULL,'SRU_MOM'),(54,19,1,10,NULL,'AgentRdV'),(55,57,1,7,NULL,'SRU_MOM'),(56,58,1,7,NULL,'SRU_MOM');
/*!40000 ALTER TABLE `core_admin_user_field` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_admin_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_user_preferences` (
  `id_user` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_admin_user_preferences` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_user_preferences` WRITE;
/*!40000 ALTER TABLE `core_admin_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_admin_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_workgroup` (
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `workgroup_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`workgroup_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_workgroup` WRITE;
/*!40000 ALTER TABLE `core_admin_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_workgroup` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_admin_workgroup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_admin_workgroup_user` (
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`workgroup_key`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_admin_workgroup_user` WRITE;
/*!40000 ALTER TABLE `core_admin_workgroup_user` DISABLE KEYS */;
INSERT INTO `core_admin_workgroup_user` VALUES ('TestBTIQ',14),('TestBTIQ',15),('TestBTIQ',16),('TestBTIQ',18),('TestBTIQ',24),('TestBTIQ',26),('TestBTIQ',27),('TestBTIQ',28),('TestBTIQ',29),('TestBTIQ',30),('TestBTIQ',31),('TestBTIQ',32),('TestBTIQ',33),('TestBTIQ',55),('Titres10e',14),('Titres10e',15),('Titres10e',16),('Titres10e',18),('Titres10e',24),('Titres10e',27),('Titres10e',28),('Titres10e',29),('Titres10e',30),('Titres10e',32),('Titres10e',33),('Titres10e',55),('Titres11e',14),('Titres11e',15),('Titres11e',16),('Titres11e',18),('Titres11e',24),('Titres11e',27),('Titres11e',28),('Titres11e',29),('Titres11e',30),('Titres11e',32),('Titres11e',33),('Titres11e',55),('Titres12e',14),('Titres12e',15),('Titres12e',16),('Titres12e',18),('Titres12e',24),('Titres12e',27),('Titres12e',28),('Titres12e',29),('Titres12e',30),('Titres12e',32),('Titres12e',33),('Titres12e',55),('Titres13e',14),('Titres13e',15),('Titres13e',16),('Titres13e',18),('Titres13e',24),('Titres13e',27),('Titres13e',28),('Titres13e',29),('Titres13e',30),('Titres13e',32),('Titres13e',33),('Titres13e',55),('Titres14e',14),('Titres14e',15),('Titres14e',16),('Titres14e',18),('Titres14e',24),('Titres14e',27),('Titres14e',28),('Titres14e',29),('Titres14e',30),('Titres14e',32),('Titres14e',33),('Titres14e',55),('Titres15e',14),('Titres15e',15),('Titres15e',16),('Titres15e',18),('Titres15e',22),('Titres15e',24),('Titres15e',27),('Titres15e',28),('Titres15e',29),('Titres15e',30),('Titres15e',32),('Titres15e',33),('Titres15e',54),('Titres15e',55),('Titres15e_Notifications',22),('Titres16e',14),('Titres16e',15),('Titres16e',16),('Titres16e',18),('Titres16e',24),('Titres16e',27),('Titres16e',28),('Titres16e',29),('Titres16e',30),('Titres16e',32),('Titres16e',33),('Titres16e',55),('Titres17e',14),('Titres17e',15),('Titres17e',16),('Titres17e',18),('Titres17e',24),('Titres17e',27),('Titres17e',28),('Titres17e',29),('Titres17e',30),('Titres17e',32),('Titres17e',33),('Titres17e',55),('Titres18e',14),('Titres18e',15),('Titres18e',16),('Titres18e',18),('Titres18e',24),('Titres18e',27),('Titres18e',28),('Titres18e',29),('Titres18e',30),('Titres18e',32),('Titres18e',33),('Titres18e',55),('Titres19e',14),('Titres19e',15),('Titres19e',16),('Titres19e',18),('Titres19e',24),('Titres19e',27),('Titres19e',28),('Titres19e',29),('Titres19e',30),('Titres19e',32),('Titres19e',33),('Titres19e',55),('Titres20e',14),('Titres20e',15),('Titres20e',16),('Titres20e',18),('Titres20e',24),('Titres20e',27),('Titres20e',28),('Titres20e',29),('Titres20e',30),('Titres20e',32),('Titres20e',33),('Titres20e',55),('Titres5e',14),('Titres5e',15),('Titres5e',16),('Titres5e',18),('Titres5e',24),('Titres5e',27),('Titres5e',28),('Titres5e',29),('Titres5e',30),('Titres5e',32),('Titres5e',33),('Titres5e',55),('Titres6e',14),('Titres6e',15),('Titres6e',16),('Titres6e',18),('Titres6e',24),('Titres6e',27),('Titres6e',28),('Titres6e',29),('Titres6e',30),('Titres6e',32),('Titres6e',33),('Titres6e',55),('Titres7e',14),('Titres7e',15),('Titres7e',16),('Titres7e',18),('Titres7e',24),('Titres7e',27),('Titres7e',28),('Titres7e',29),('Titres7e',30),('Titres7e',32),('Titres7e',33),('Titres7e',55),('Titres8e',14),('Titres8e',15),('Titres8e',16),('Titres8e',18),('Titres8e',24),('Titres8e',27),('Titres8e',28),('Titres8e',29),('Titres8e',30),('Titres8e',32),('Titres8e',33),('Titres8e',55),('Titres9e',14),('Titres9e',15),('Titres9e',16),('Titres9e',18),('Titres9e',24),('Titres9e',27),('Titres9e',28),('Titres9e',29),('Titres9e',30),('Titres9e',32),('Titres9e',33),('Titres9e',55),('TitresCentre',14),('TitresCentre',15),('TitresCentre',16),('TitresCentre',18),('TitresCentre',24),('TitresCentre',27),('TitresCentre',28),('TitresCentre',29),('TitresCentre',30),('TitresCentre',32),('TitresCentre',33),('TitresCentre',55),('TitresLouvre',14),('TitresLouvre',15),('TitresLouvre',16),('TitresLouvre',18),('TitresLouvre',20),('TitresLouvre',24),('TitresLouvre',25),('TitresLouvre',27),('TitresLouvre',28),('TitresLouvre',29),('TitresLouvre',30),('TitresLouvre',32),('TitresLouvre',33),('TitresLouvre',55);
/*!40000 ALTER TABLE `core_admin_workgroup_user` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_attribute` WRITE;
/*!40000 ALTER TABLE `core_attribute` DISABLE KEYS */;
INSERT INTO `core_attribute` VALUES (1,'fr.paris.lutece.portal.business.user.attribute.AttributeComboBox','Profil','',0,0,0,0,0,'profiles',NULL);
/*!40000 ALTER TABLE `core_attribute` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_attribute_field` WRITE;
/*!40000 ALTER TABLE `core_attribute_field` DISABLE KEYS */;
INSERT INTO `core_attribute_field` VALUES (1,1,NULL,NULL,0,0,0,0,1,1),(2,1,'AgentGuichet','Profil d\'agents d\'acceuil permettant de g├⌐rer les RdV - prises - annulation et export',0,0,0,0,0,2),(3,1,'AgentMetier','Gestion et plannification des RdV',0,0,0,0,0,3),(4,1,'ChefDeService','Profil des Chefs de service, DGA, DGAS',0,0,0,0,0,4),(5,1,'AdministrateurMetier','Profil des administrateurs RdV - WF - messages - formulaire - gestion et planification',0,0,0,0,0,5),(6,1,'ReferentLocal','Profil applicable pour les r├⌐f├⌐rents locaux',0,0,0,0,0,6),(7,1,'SRU','Profil applicable pour les administrateurs fonctionnels',0,0,0,0,0,7),(8,1,'Teleconseiller3975','Profil permettant de g├⌐rer les RdV - prises - annulation et export',0,0,0,0,0,8);
/*!40000 ALTER TABLE `core_attribute_field` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_connections_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_connections_log` (
  `access_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip_address` varchar(63) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_status` int DEFAULT NULL,
  KEY `index_connections_log` (`ip_address`,`date_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_connections_log` WRITE;
/*!40000 ALTER TABLE `core_connections_log` DISABLE KEYS */;
INSERT INTO `core_connections_log` VALUES ('admin','127.0.0.1','2020-11-13 14:07:04',0),('admin','127.0.0.1','2020-11-13 14:07:08',0),('guichardf','10.16.197.202','2020-12-23 09:13:32',0),('guichardf','10.16.197.202','2020-12-23 09:13:41',0),('chef13','10.16.197.202','2020-12-23 09:14:29',0),('guichardf','10.16.197.202','2020-12-23 09:52:55',0),('ducellierc','10.16.200.134','2020-12-29 11:34:05',0),('ducellierc','10.16.200.134','2020-12-29 11:34:14',0),('ducellierc','10.16.200.134','2020-12-29 11:34:21',0),('ducellierc','10.16.200.134','2020-12-29 11:34:36',0),('ducellierc','10.16.200.134','2020-12-29 11:34:50',0),('benoitq','10.99.9.49','2020-12-29 14:22:16',0),('benoitq','10.99.9.49','2020-12-29 14:23:11',0),('ducellierc','10.16.200.134','2020-12-29 14:39:55',0),('debuignem','10.16.198.203','2020-12-29 14:50:03',0),('marc.debuigne','10.16.198.203','2020-12-29 14:50:09',0),('CORONELS','10.99.8.69','2020-12-31 09:06:42',0),('CORONELS','10.99.8.69','2020-12-31 09:07:02',0),('coronels','10.99.8.69','2020-12-31 09:07:18',0),('Coronels','10.99.8.69','2020-12-31 09:07:35',0),('coronels','10.99.8.69','2020-12-31 09:07:54',0),('CORONELS','10.99.8.69','2020-12-31 09:08:29',0),('Coronels','10.99.8.69','2020-12-31 09:09:04',0),('coronels','10.99.8.69','2020-12-31 09:09:29',0),('coronels','10.99.8.69','2020-12-31 09:09:46',0),('ducellierc','10.16.200.121','2020-12-31 13:26:13',0),('admin2','10.167.7.96','2021-01-04 10:26:42',0),('dvlr.andresw','10.99.8.136','2021-01-04 14:20:49',0),('admin','10.167.6.221','2021-01-04 17:31:04',0),('admin','10.167.6.191','2021-01-05 09:49:37',0),('breuiln','10.16.248.83','2021-01-05 11:12:00',0),('breuiln','10.16.248.83','2021-01-05 11:12:13',0),('breuiln','10.16.248.83','2021-01-05 11:13:14',0),('admin','10.16.204.1','2021-01-05 15:25:19',0),('admin','10.16.204.1','2021-01-05 15:25:34',0),('admin','10.16.204.1','2021-01-05 15:25:52',0),('guichardf','10.99.10.14','2021-01-05 16:46:20',0),('admin','10.167.7.30','2021-01-06 12:01:48',0),('admin','10.167.6.231','2021-01-06 14:41:34',0),('guichardf','10.167.7.30','2021-01-06 17:56:10',0),('admin','10.16.204.2','2021-01-06 18:04:49',0),('benoitq','10.99.9.49','2021-01-07 16:53:21',0),('breuiln','10.99.68.207','2021-01-07 17:23:24',0),('admin','10.16.204.128','2021-01-07 22:20:01',0),('admin','10.16.204.0','2021-01-08 08:58:08',0),('benoitq','10.99.9.49','2021-01-08 10:29:23',0),('admin','10.16.204.0','2021-01-08 14:36:47',0),('admin','10.167.6.217','2021-01-08 16:23:43',0),('admin','10.167.6.217','2021-01-08 16:23:54',0),('admin','10.16.204.128','2021-01-08 23:41:03',0),('admin','10.16.204.128','2021-01-09 01:08:24',0),('admin','10.16.204.128','2021-01-09 01:08:31',0),('homandm','10.16.200.120','2021-01-11 09:17:46',0),('homandm','10.16.200.120','2021-01-11 09:18:27',0),('mhomand75','10.16.200.120','2021-01-11 09:19:23',0),('homandm','10.16.200.120','2021-01-11 09:19:39',0),('homandm','10.16.200.120','2021-01-11 09:23:25',0),('homandm','10.16.200.120','2021-01-11 09:23:51',0),('homandm','10.16.200.120','2021-01-11 09:27:34',0),('homandm','10.16.200.120','2021-01-11 09:28:27',0),('breuiln','10.16.248.91','2021-01-11 18:02:11',0),('admin','10.16.204.128','2021-01-12 10:52:28',0),('admin','10.167.6.191','2021-01-14 10:12:53',0),('ducellierc','10.16.203.141','2021-01-14 10:31:42',0),('ducellierc','10.16.203.141','2021-01-14 10:31:53',0),('ducellierc','10.16.203.141','2021-01-14 10:32:04',0),('ducellierc','10.16.203.141','2021-01-14 10:32:14',0),('ducellierc','10.16.203.141','2021-01-14 11:24:24',0),('ducellierc','10.16.203.141','2021-01-14 11:24:45',0),('ducellierc','10.16.203.141','2021-01-14 11:24:55',0),('ducellierc','10.16.203.141','2021-01-14 11:25:51',0),('ducellierc','10.16.203.141','2021-01-14 11:26:05',0),('CHEFLOUVRE','10.99.9.103','2021-01-14 11:39:54',0),('benoitq','10.99.9.49','2021-01-14 11:41:49',0),('ducellierc','10.16.203.141','2021-01-14 12:22:12',0),('valletk','10.99.9.93','2021-01-14 15:26:22',0),('homandm','10.99.9.103','2021-01-14 15:33:36',0),('homandm','10.99.9.103','2021-01-14 15:34:11',0),('admin','10.167.7.106','2021-01-14 15:34:41',0),('homandm','10.99.9.103','2021-01-14 15:35:02',0),('homandm','10.99.9.103','2021-01-14 15:36:05',0),('homandm','10.99.9.103','2021-01-14 15:36:42',0),('homandm','10.99.9.103','2021-01-14 15:37:37',0),('homandm','10.99.9.103','2021-01-14 15:37:59',0),('homandm','10.99.9.103','2021-01-14 15:38:20',0),('homandm','10.99.9.103','2021-01-14 15:38:38',0),('homandm','10.99.9.103','2021-01-14 15:39:38',0),('homandm','10.99.9.103','2021-01-14 16:01:07',0),('homandm','10.99.9.103','2021-01-14 16:01:33',0),('homandm','10.99.9.103','2021-01-14 16:09:56',0),('homandm','10.99.9.103','2021-01-14 16:14:12',0),('homandm','10.99.9.103','2021-01-14 16:14:51',0),('ducellierc','10.99.8.136','2021-01-18 08:47:57',0),('coronels','10.16.200.172','2021-01-18 09:13:34',0),('coronels','10.16.200.172','2021-01-18 09:23:08',0),('admin','10.167.6.229','2021-01-18 15:45:15',0),('admin','10.167.6.108','2021-01-19 09:33:16',0),('breuiln','10.16.248.234','2021-01-19 09:56:59',0),('benoitq','10.99.9.49','2021-01-19 11:06:13',0),('testbitq','10.99.10.14','2021-01-19 11:32:35',0),('testbtiq','10.99.10.14','2021-01-19 11:32:48',0),('cheflouvre','10.99.10.14','2021-01-19 14:44:35',0),('cheflouvre','10.99.10.14','2021-01-19 14:44:46',0),('guichardf','10.99.10.14','2021-01-19 14:47:08',0),('guichardf','10.99.10.14','2021-01-19 14:48:03',0),('coronels021','10.16.202.225','2021-01-19 15:16:16',0),('agentlouvre','10.99.10.14','2021-01-20 11:31:20',0),('ducellierc','10.99.8.136','2021-01-21 10:28:43',0),('admin','10.16.198.101','2021-01-21 12:55:24',0),('admin','10.16.198.101','2021-01-21 12:57:03',0),('cheflouvre','10.99.8.54','2021-01-21 16:54:36',0),('admin','10.16.204.0','2021-01-22 08:31:58',0),('benoitq','10.99.9.49','2021-01-22 10:23:35',0),('admin','10.167.7.17','2021-01-25 10:11:27',0),('admin','10.167.6.126','2021-01-25 11:56:01',0),('homandm','10.16.203.49','2021-01-25 14:11:25',0),('VALLETK','10.99.9.93','2021-01-26 14:43:01',0),('VALLETK','10.99.9.93','2021-01-26 14:43:16',0),('LUTECE','10.99.9.103','2021-01-26 16:15:03',0),('hom','10.99.9.103','2021-01-26 16:16:13',0),('guichardf','10.99.8.54','2021-01-26 16:59:13',0),('guichardf','10.99.8.54','2021-01-27 11:51:55',0),('agent3975','10.16.248.119','2021-01-27 14:05:26',0),('agentlouvre','10.16.203.132','2021-01-28 09:27:12',0),('guichardf','10.16.203.132','2021-01-28 12:23:05',0),('guichardf','10.16.203.132','2021-01-28 12:35:17',0),('ducellierc','10.16.201.185','2021-01-29 11:10:00',0),('benoitq','10.99.9.49','2021-01-29 11:10:48',0),('benoitq','10.99.9.49','2021-01-29 11:11:39',0),('DVLRVALLETK','10.99.9.93','2021-01-29 12:56:05',0),('homandm','10.99.9.103','2021-01-29 13:41:07',0),('DVLRVALLETK','10.16.196.77','2021-01-31 17:57:58',0),('cheflouvre','10.16.203.39','2021-02-02 12:16:48',0),('admin','10.16.204.2','2021-02-02 13:55:00',0),('admin','10.167.6.197','2021-02-02 15:51:48',0),('guichardf','10.99.8.54','2021-02-03 09:06:28',0),('guichardf','10.99.8.54','2021-02-04 15:12:20',0),('W78_rec','10.167.6.108','2021-02-09 15:24:33',0),('W78_rec','10.167.6.108','2021-02-09 15:24:44',0),('guichardf','10.99.8.54','2021-02-09 17:05:57',0),('admin','10.167.6.108','2021-02-09 17:07:27',0),('guichardf','10.99.8.54','2021-02-10 09:14:26',0),('guichardf','10.99.8.54','2021-02-10 09:14:34',0),('guichardf','10.99.8.54','2021-02-10 09:14:45',0),('admin','10.167.7.53','2021-02-10 09:58:14',0),('coronels','10.16.202.161','2021-02-10 14:27:39',0),('coronels','10.16.198.22','2021-02-11 11:18:43',0),('admin','10.167.6.196','2021-02-11 17:31:02',0),('coronels','10.99.8.62','2021-02-12 10:19:44',0),('cheflouvre','10.16.248.41','2021-02-12 15:15:52',0),('cheflouvre','10.16.248.41','2021-02-12 15:16:06',0),('cheflouvre','10.16.248.41','2021-02-12 15:16:52',0),('admin','10.16.204.131','2021-02-15 13:42:27',0),('homandm','10.16.201.16','2021-02-15 14:06:38',0),('valletk','10.16.241.36','2021-02-15 18:04:45',0),('debuignm','10.16.240.197','2021-02-16 10:41:13',0),('admin','10.16.204.2','2021-02-16 11:47:18',0),('admin','10.16.204.2','2021-02-16 11:47:24',0),('admin','10.16.204.131','2021-02-16 12:14:03',0),('admin','10.16.204.131','2021-02-16 12:25:40',0),('admin','10.16.204.131','2021-02-16 12:25:50',0),('admin','10.16.204.131','2021-02-16 12:30:02',0),('admin','10.16.204.131','2021-02-16 12:30:12',0),('benoitq','10.99.9.49','2021-02-16 14:10:26',0),('test','10.167.6.92','2021-02-17 13:41:54',0),('admin','10.16.204.1','2021-02-18 17:40:56',0),('debuignm','10.16.197.40','2021-02-18 18:21:11',0),('admin','10.16.204.128','2021-02-18 18:58:38',0),('admin','10.16.204.128','2021-02-19 09:09:59',0),('admin','10.16.204.128','2021-02-19 09:44:33',0),('admin','10.167.6.136','2021-02-19 16:47:48',0),('DVLR.VALLETK','10.16.200.118','2021-02-21 17:19:35',0),('admin','10.16.204.129','2021-02-22 17:58:53',0),('admin','10.16.204.132','2021-02-23 10:24:29',0),('admin','10.167.6.171','2021-02-23 14:12:03',0),('admin','10.16.204.131','2021-02-26 11:55:52',0),('admin','10.16.204.128','2021-03-01 10:50:54',0),('admin2','10.167.6.155','2021-03-04 11:22:17',0),('admin','10.167.6.155','2021-03-04 11:25:10',0),('admin','10.167.6.155','2021-03-04 11:32:48',0),('admin','10.167.6.248','2021-03-09 13:24:38',0),('admin','10.167.6.248','2021-03-09 13:24:50',0),('admin','10.167.7.133','2021-03-09 17:06:45',0),('admin','10.167.6.157','2021-03-10 12:38:21',0),('admin','10.16.204.130','2021-03-29 10:57:42',0),('admin','10.16.204.130','2021-03-29 10:57:49',0),('admin','10.16.204.130','2021-03-29 14:47:31',0),('admin','10.16.204.130','2021-03-29 14:47:42',0),('cheflouvre','10.99.8.54','2021-03-31 15:43:02',0),('cheflouvre','10.99.8.54','2021-03-31 15:43:13',0),('admin','10.167.6.144','2021-04-01 14:26:37',0),('admin','10.167.6.144','2021-04-01 16:24:03',0),('admin','10.167.6.191','2021-04-14 15:44:40',0),('admin','10.167.6.135','2021-04-22 11:29:46',0),('admin','10.167.6.124','2021-04-22 15:50:10',0),('admin','10.167.6.191','2021-05-04 11:45:25',0),('agentlouvre','10.99.8.54','2021-05-05 15:09:10',0),('admin2','10.167.6.65','2021-05-07 14:44:21',0),('debuignm','10.16.165.7','2021-05-11 19:02:55',0),('admin','10.16.204.147','2021-05-12 14:09:13',0),('admin','192.168.99.68','2021-05-12 15:06:05',0),('admin','192.168.99.68','2021-05-12 15:06:18',0),('guichardf','10.99.8.54','2021-05-17 16:08:03',0),('guichardf','10.99.8.54','2021-05-17 16:08:13',0),('admin','10.16.204.157','2021-05-18 08:57:22',0),('admin','10.16.204.157','2021-05-18 08:57:29',0),('guichardf','10.99.8.54','2021-05-18 13:44:00',0),('juillat','10.16.173.232','2021-05-18 15:30:40',0),('juillat','10.16.173.232','2021-05-18 15:31:02',0),('juillat','10.16.163.223','2021-05-19 11:44:31',0),('admin','10.16.204.160','2021-05-19 12:07:53',0),('admin','10.167.6.108','2021-05-25 14:06:26',0),('admin','10.167.6.205','2021-05-28 10:23:28',0),('breuiln','10.16.170.208','2021-06-15 12:28:50',0),('admin','10.167.6.135','2021-06-25 11:10:49',0),('admin','10.167.6.99','2021-07-29 18:01:58',0),('admin','10.100.36.157','2021-08-02 08:56:40',0),('admin','10.167.6.108','2021-08-30 15:07:24',0),('admin','10.167.6.205','2021-10-29 17:53:34',0),('admin','10.167.6.205','2021-10-29 17:53:39',0),('admin','10.167.6.205','2021-10-29 17:53:49',0),('admin','10.16.169.60','2021-11-02 14:19:09',0),('admin','10.16.174.23','2021-11-03 16:49:21',0),('admin','10.16.160.103','2021-11-05 08:59:59',0),('admin','10.16.166.245','2021-11-08 10:07:54',0),('admin','10.16.166.245','2021-11-08 12:31:17',0),('admin','10.16.174.255','2021-11-10 10:56:18',0),('breuiln','10.99.68.207','2021-11-23 14:26:46',0),('admin','10.100.40.157','2021-12-03 16:10:46',0),('admin','10.100.40.157','2021-12-03 17:47:56',0),('admin','10.100.40.157','2021-12-06 09:56:13',0),('admin','10.16.172.243','2021-12-07 16:08:17',0),('admin','10.16.172.243','2021-12-07 16:08:32',0),('admin','10.16.170.232','2021-12-22 14:00:37',0),('admin','10.16.173.67','2021-12-29 10:14:37',0),('admin','10.16.173.67','2021-12-29 10:14:42',0),('admin','10.16.173.197','2022-01-27 11:21:56',0),('admin','10.16.172.199','2022-02-01 12:07:43',0),('admin','10.20.1.234','2022-02-10 14:00:50',0),('admin','10.16.172.22','2022-03-03 15:08:47',0),('admin','10.16.172.22','2022-03-03 15:08:51',0),('admin','0:0:0:0:0:0:0:1','2022-03-07 16:50:45',0),('admin','0:0:0:0:0:0:0:1','2022-03-07 16:50:51',0);
/*!40000 ALTER TABLE `core_connections_log` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_dashboard` (
  `dashboard_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dashboard_column` int NOT NULL,
  `dashboard_order` int NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_dashboard` WRITE;
/*!40000 ALTER TABLE `core_dashboard` DISABLE KEYS */;
INSERT INTO `core_dashboard` VALUES ('APPOINTMENT_FORM',3,2),('APPOINTMENT_USER_CALENDAR',3,3),('CORE_PAGES',2,1),('CORE_SYSTEM',1,2),('CORE_USER',4,1),('CORE_USERS',1,1),('WORKFLOW',3,1);
/*!40000 ALTER TABLE `core_dashboard` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_datastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_datastore` (
  `entity_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `entity_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`entity_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_datastore` WRITE;
/*!40000 ALTER TABLE `core_datastore` DISABLE KEYS */;
INSERT INTO `core_datastore` VALUES ('captcha.defaultProvider','JCaptcha'),('core_banned_domain_names','yopmail.com'),('core.advanced_parameters.access_failures_captcha','1'),('core.advanced_parameters.access_failures_interval','10'),('core.advanced_parameters.access_failures_max','3'),('core.advanced_parameters.account_life_time','12'),('core.advanced_parameters.account_reactivated_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.account_reactivated_mail_subject','Votre compte a bien ├⌐t├⌐ r├⌐activ├⌐'),('core.advanced_parameters.default_user_language','fr'),('core.advanced_parameters.default_user_level','1'),('core.advanced_parameters.default_user_notification','1'),('core.advanced_parameters.default_user_status','0'),('core.advanced_parameters.email_pattern','^[\\w_.\\-!\\#\\$\\%\\&\'\\*\\+\\/\\=\\?\\^\\`\\}\\{\\|\\~]+@[\\w_.\\-]+\\.[\\w]+$'),('core.advanced_parameters.email_pattern_verify_by',''),('core.advanced_parameters.expired_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.expired_alert_mail_subject','Votre compte a expir├⌐'),('core.advanced_parameters.first_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.first_alert_mail_subject','Votre compte va bient├┤t expirer'),('core.advanced_parameters.force_change_password_reinit','false'),('core.advanced_parameters.lock_reset_token_to_session','false'),('core.advanced_parameters.maximum_number_password_change',''),('core.advanced_parameters.nb_alert_account','2'),('core.advanced_parameters.notify_user_password_expired',''),('core.advanced_parameters.other_alert_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.other_alert_mail_subject','Votre compte va bient├┤t expirer'),('core.advanced_parameters.password_duration','120'),('core.advanced_parameters.password_expired_mail_sender','lutece@nowhere.com'),('core.advanced_parameters.password_expired_mail_subject','Votre mot de passe a expir├⌐'),('core.advanced_parameters.password_format_numero','false'),('core.advanced_parameters.password_format_special_characters','false'),('core.advanced_parameters.password_format_upper_lower_case','false'),('core.advanced_parameters.password_history_size',''),('core.advanced_parameters.password_minimum_length','8'),('core.advanced_parameters.reset_token_validity','60'),('core.advanced_parameters.time_before_alert_account','30'),('core.advanced_parameters.time_between_alerts_account','10'),('core.advanced_parameters.tsw_size_password_change',''),('core.advanced_parameters.use_advanced_security_parameters',''),('core.backOffice.defaultEditor','tinymce'),('core.cache.status.appointment.appointmentFormCacheService.enabled','1'),('core.cache.status.asynchronousupload.asynchronousUploadCacheService.enabled','0'),('core.cache.status.BaseUserPreferencesCacheService.enabled','0'),('core.cache.status.BaseUserPreferencesCacheService.maxElementsInMemory','1000'),('core.cache.status.DatastoreCacheService.enabled','0'),('core.cache.status.EntryTypeServiceManagerCache.enabled','1'),('core.cache.status.LinksIncludeCacheService.enabled','0'),('core.cache.status.LuteceUserCacheService.enabled','1'),('core.cache.status.LuteceUserCacheService.maxElementsInMemory','1000'),('core.cache.status.MailAttachmentCacheService.diskPersistent','true'),('core.cache.status.MailAttachmentCacheService.enabled','1'),('core.cache.status.MailAttachmentCacheService.maxElementsInMemory','10'),('core.cache.status.MailAttachmentCacheService.overflowToDisk','true'),('core.cache.status.MailAttachmentCacheService.timeToLiveSeconds','7200'),('core.cache.status.MyPortalWidgetContentService.enabled','1'),('core.cache.status.MyPortalWidgetService.enabled','1'),('core.cache.status.PageCacheService.enabled','0'),('core.cache.status.PageCachingFilter.enabled','0'),('core.cache.status.PageCachingFilter(CAUTION:NEVERUSEWITHUSERDYNAMICDATA).enabled','0'),('core.cache.status.pathCacheService.enabled','0'),('core.cache.status.PortalMenuService.enabled','0'),('core.cache.status.PortletCacheService.enabled','0'),('core.cache.status.resource.resourceCacheService.enabled','1'),('core.cache.status.resource.resourceCacheService.maxElementsInMemory','500'),('core.cache.status.SiteMapService.enabled','1'),('core.cache.status.StaticFilesCachingFilter.enabled','0'),('core.cache.status.StaticFilesCachingFilter.timeToLiveSeconds','604800'),('core.cache.status.workflow.alertGruConfigCacheService.enabled','0'),('core.cache.status.workflow.notifyGruConfigCacheService.enabled','0'),('core.cache.status.XMLTransformerCacheService(XSLT).enabled','1'),('core.crypto.key','8384f7b46e7cd86417d089cd0fcfdf5bfc430ad75875b09b2cd12c0d68633fbb'),('core.daemon.accountLifeTimeDaemon.interval','86400'),('core.daemon.accountLifeTimeDaemon.onStartUp','false'),('core.daemon.AlertGruDaemon.interval','3600'),('core.daemon.AlertGruDaemon.onStartUp','true'),('core.daemon.anonymizationDaemon.interval','86400'),('core.daemon.anonymizationDaemon.onStartUp','false'),('core.daemon.AppointmentReminderDaemon.interval','600'),('core.daemon.AppointmentReminderDaemon.onStartUp','false'),('core.daemon.archiveDaemon.interval','86400'),('core.daemon.archiveDaemon.onStartUp','false'),('core.daemon.automaticActionDaemon.interval','60'),('core.daemon.automaticActionDaemon.onStartUp','true'),('core.daemon.changeStateDaemon.interval','10'),('core.daemon.changeStateDaemon.onStartUp','false'),('core.daemon.chooseStateActionDaemon.interval','10'),('core.daemon.chooseStateActionDaemon.onStartUp','false'),('core.daemon.crmClientSender.interval','60'),('core.daemon.crmClientSender.onStartUp','true'),('core.daemon.databaseAccountLifeTimeDaemon.interval','86400'),('core.daemon.databaseAccountLifeTimeDaemon.onStartUp','true'),('core.daemon.databaseAnonymizationDaemon.interval','86400'),('core.daemon.databaseAnonymizationDaemon.onStartUp','true'),('core.daemon.ExportWssoAdminUsersDaemon.interval','3600'),('core.daemon.ExportWssoAdminUsersDaemon.onStartUp','true'),('core.daemon.fullIndexingDaemon.interval','86400'),('core.daemon.fullIndexingDaemon.onStartUp','true'),('core.daemon.incrementalIndexingDaemon.interval','3000'),('core.daemon.incrementalIndexingDaemon.onStartUp','false'),('core.daemon.indexer.interval','60'),('core.daemon.indexer.onStartUp','true'),('core.daemon.mailSender.interval','86400'),('core.daemon.mailSender.onStartUp','true'),('core.daemon.relaunchAppointmentDaemon.interval','3600'),('core.daemon.relaunchAppointmentDaemon.onStartUp','true'),('core.daemon.slotDaemon.interval','86400'),('core.daemon.slotDaemon.onStartUp','true'),('core.daemon.solrindexer.interval','300'),('core.daemon.solrindexer.onStartUp','true'),('core.daemon.temporaryfilesDaemon.interval','86400'),('core.daemon.temporaryfilesDaemon.onStartUp','true'),('core.daemon.threadLauncherDaemon.interval','86400'),('core.daemon.threadLauncherDaemon.onStartUp','true'),('core.frontOffice.defaultEditor','markitupbbcode'),('core.plugins.status.address-autocomplete.installed','true'),('core.plugins.status.address.installed','true'),('core.plugins.status.Admin Authentication WSSO.installed','true'),('core.plugins.status.appointment-desk.installed','true'),('core.plugins.status.appointment-desk.pool','portal'),('core.plugins.status.appointment-filling.installed','true'),('core.plugins.status.appointment-filling.pool','portal'),('core.plugins.status.appointment-leaflet.installed','true'),('core.plugins.status.appointment-management.installed','true'),('core.plugins.status.appointment-management.pool','portal'),('core.plugins.status.appointment-mydashboard.installed','true'),('core.plugins.status.appointment-mydashboard.pool','portal'),('core.plugins.status.appointment-resource.installed','false'),('core.plugins.status.appointment-resource.pool','portal'),('core.plugins.status.appointment-solr.installed','true'),('core.plugins.status.appointment-solrsearchapp.installed','true'),('core.plugins.status.appointment-titre.installed','false'),('core.plugins.status.appointment-titre.pool','portal'),('core.plugins.status.appointment.installed','true'),('core.plugins.status.appointment.pool','portal'),('core.plugins.status.appointmentfactory.installed','true'),('core.plugins.status.appointmentgru.installed','true'),('core.plugins.status.appointmentgru.pool','portal'),('core.plugins.status.archive-client.installed','true'),('core.plugins.status.archive.installed','true'),('core.plugins.status.archive.pool','portal'),('core.plugins.status.asynchronous-upload.installed','true'),('core.plugins.status.asynchronous-upload.pool','portal'),('core.plugins.status.avatar.installed','true'),('core.plugins.status.avatar.pool','portal'),('core.plugins.status.blobstore.installed','true'),('core.plugins.status.blobstore.pool','portal'),('core.plugins.status.bootstrap2compatibility.installed','true'),('core.plugins.status.calendar.installed','true'),('core.plugins.status.calendar.pool','portal'),('core.plugins.status.captcha.installed','true'),('core.plugins.status.contextinclude.installed','true'),('core.plugins.status.contextinclude.pool','portal'),('core.plugins.status.core_extensions.installed','true'),('core.plugins.status.crm-form.installed','true'),('core.plugins.status.crm-form.pool','portal'),('core.plugins.status.crm-formengine.installed','true'),('core.plugins.status.crm-formengine.pool','portal'),('core.plugins.status.crm-mylutece.installed','true'),('core.plugins.status.crm-mylutece.pool','portal'),('core.plugins.status.crm-mylutecedatabase.installed','true'),('core.plugins.status.crm-mylutecedatabase.pool','portal'),('core.plugins.status.crm-mylutecedirectory.installed','true'),('core.plugins.status.crm-mylutecedirectory.pool','portal'),('core.plugins.status.crm-rest.installed','true'),('core.plugins.status.crm-rest.pool','portal'),('core.plugins.status.crm.installed','true'),('core.plugins.status.crm.pool','portal'),('core.plugins.status.crmclient.installed','true'),('core.plugins.status.crmclient.pool','portal'),('core.plugins.status.digglike.installed','true'),('core.plugins.status.digglike.pool','portal'),('core.plugins.status.directory-googlemaps.installed','true'),('core.plugins.status.directory-pdfproducer-archive.installed','true'),('core.plugins.status.directory-pdfproducer-archive.pool','portal'),('core.plugins.status.directory-pdfproducer.installed','true'),('core.plugins.status.directory-pdfproducer.pool','portal'),('core.plugins.status.directory.installed','true'),('core.plugins.status.directory.pool','portal'),('core.plugins.status.document-export.installed','true'),('core.plugins.status.document-export.pool','portal'),('core.plugins.status.document.installed','true'),('core.plugins.status.document.pool','portal'),('core.plugins.status.elasticdata-appointment.installed','true'),('core.plugins.status.elasticdata-appointment.pool','portal'),('core.plugins.status.elasticdata.installed','true'),('core.plugins.status.elasticdata.pool','portal'),('core.plugins.status.extend-actionbar.installed','true'),('core.plugins.status.extend-actionbar.pool','portal'),('core.plugins.status.extend-actionhit.installed','true'),('core.plugins.status.extend-actionhit.pool','portal'),('core.plugins.status.extend-comment-extendable.installed','true'),('core.plugins.status.extend-comment-extendable.pool','portal'),('core.plugins.status.extend-comment.installed','true'),('core.plugins.status.extend-comment.pool','portal'),('core.plugins.status.extend-feedback.installed','true'),('core.plugins.status.extend-feedback.pool','portal'),('core.plugins.status.extend-opengraph.installed','true'),('core.plugins.status.extend-opengraph.pool','portal'),('core.plugins.status.extend-rating.installed','true'),('core.plugins.status.extend-rating.pool','portal'),('core.plugins.status.extend-statistics.installed','true'),('core.plugins.status.extend-statistics.pool','portal'),('core.plugins.status.extend.installed','true'),('core.plugins.status.extend.pool','portal'),('core.plugins.status.filegenerator.installed','true'),('core.plugins.status.filegenerator.pool','portal'),('core.plugins.status.form-compare-validators.installed','true'),('core.plugins.status.form-compare-validators.pool','portal'),('core.plugins.status.form-date-validators.installed','true'),('core.plugins.status.form-date-validators.pool','portal'),('core.plugins.status.form-exportdatabase.installed','true'),('core.plugins.status.form-exportdatabase.pool','portal'),('core.plugins.status.form-exportdirectory.installed','true'),('core.plugins.status.form-exportdirectory.pool','portal'),('core.plugins.status.form-include-opengraph.installed','true'),('core.plugins.status.form-include-opengraph.pool','portal'),('core.plugins.status.form.installed','true'),('core.plugins.status.form.pool','portal'),('core.plugins.status.formengine-facilfamilles.installed','true'),('core.plugins.status.formengine-facilfamilles.pool','portal'),('core.plugins.status.formengine-outputws.installed','true'),('core.plugins.status.formengine-outputws.pool','portal'),('core.plugins.status.formengine.installed','true'),('core.plugins.status.formengine.pool','portal'),('core.plugins.status.genericalert.installed','true'),('core.plugins.status.genericalert.pool','portal'),('core.plugins.status.genericattributes-address.installed','true'),('core.plugins.status.genericattributes-address.pool','portal'),('core.plugins.status.genericattributes-googlemaps.installed','true'),('core.plugins.status.genericattributes-googlemaps.pool','portal'),('core.plugins.status.genericattributes.installed','true'),('core.plugins.status.genericattributes.pool','portal'),('core.plugins.status.gfa.installed','true'),('core.plugins.status.gfa.pool','portal'),('core.plugins.status.greetingscard.installed','true'),('core.plugins.status.greetingscard.pool','portal'),('core.plugins.status.helpdesk.installed','true'),('core.plugins.status.helpdesk.pool','portal'),('core.plugins.status.html.installed','true'),('core.plugins.status.html.pool','portal'),('core.plugins.status.htmlpage.installed','true'),('core.plugins.status.htmlpage.pool','portal'),('core.plugins.status.identitystore-openam.installed','true'),('core.plugins.status.identitystore.installed','true'),('core.plugins.status.importexport.installed','true'),('core.plugins.status.importexport.pool','portal'),('core.plugins.status.jcaptcha.installed','true'),('core.plugins.status.kibana.installed','true'),('core.plugins.status.kibana.pool','portal'),('core.plugins.status.leaflet.installed','true'),('core.plugins.status.lucene.installed','true'),('core.plugins.status.matomo.installed','false'),('core.plugins.status.mdph.installed','true'),('core.plugins.status.mdph.pool','portal'),('core.plugins.status.mermaidjs.installed','true'),('core.plugins.status.mermaidjs.pool','portal'),('core.plugins.status.modulenotifygrumappingmanager.installed','true'),('core.plugins.status.modulenotifygrumappingmanager.pool','portal'),('core.plugins.status.mydashboard.installed','true'),('core.plugins.status.mydashboard.pool','portal'),('core.plugins.status.mylutece-database.installed','true'),('core.plugins.status.mylutece-database.pool','portal'),('core.plugins.status.mylutece-directory.installed','true'),('core.plugins.status.mylutece-directory.pool','portal'),('core.plugins.status.mylutece-notification.installed','true'),('core.plugins.status.mylutece-notification.pool','portal'),('core.plugins.status.mylutece-oauth2.installed','true'),('core.plugins.status.mylutece-openam.installed','true'),('core.plugins.status.mylutece.installed','true'),('core.plugins.status.mylutece.pool','portal'),('core.plugins.status.myluteceuser-gu.installed','true'),('core.plugins.status.myluteceuser-gu.pool','portal'),('core.plugins.status.myluteceusergu-crm.installed','true'),('core.plugins.status.newsletter-document.installed','true'),('core.plugins.status.newsletter-document.pool','portal'),('core.plugins.status.newsletter.installed','true'),('core.plugins.status.newsletter.pool','portal'),('core.plugins.status.notifygru-appointment.installed','true'),('core.plugins.status.notifygru-appointment.pool','portal'),('core.plugins.status.oauth2.installed','true'),('core.plugins.status.openam-identity-client.installed','true'),('core.plugins.status.openam-identity-client.pool','portal'),('core.plugins.status.piwik.installed','true'),('core.plugins.status.pluginwizard.installed','true'),('core.plugins.status.pluginwizard.pool','portal'),('core.plugins.status.profiles.installed','true'),('core.plugins.status.profiles.pool','portal'),('core.plugins.status.quiz-exportdirectory.installed','true'),('core.plugins.status.quiz-exportdirectory.pool','portal'),('core.plugins.status.quiz.installed','true'),('core.plugins.status.quiz.pool','portal'),('core.plugins.status.referencelist.installed','true'),('core.plugins.status.referencelist.pool','portal'),('core.plugins.status.regularexpression.installed','true'),('core.plugins.status.regularexpression.pool','portal'),('core.plugins.status.resource-adminuser.installed','true'),('core.plugins.status.resource-extendableresource.installed','true'),('core.plugins.status.resource-mylutece.installed','true'),('core.plugins.status.resource.installed','true'),('core.plugins.status.resource.pool','portal'),('core.plugins.status.rest.installed','true'),('core.plugins.status.rest.pool','portal'),('core.plugins.status.shoppingcart.installed','true'),('core.plugins.status.shoppingcart.pool','portal'),('core.plugins.status.sitelabels.installed','true'),('core.plugins.status.solr.installed','true'),('core.plugins.status.solr.pool','portal'),('core.plugins.status.solrserver.installed','true'),('core.plugins.status.subscribe-mydashboard.installed','true'),('core.plugins.status.subscribe-mydashboard.pool','portal'),('core.plugins.status.subscribe.installed','true'),('core.plugins.status.subscribe.pool','portal'),('core.plugins.status.swaggerui.installed','true'),('core.plugins.status.swaggerui.pool','portal'),('core.plugins.status.systeminfo.installed','true'),('core.plugins.status.theme_city.installed','true'),('core.plugins.status.theme.installed','true'),('core.plugins.status.theme.pool','portal'),('core.plugins.status.themecity.installed','true'),('core.plugins.status.unittree-profiles.installed','true'),('core.plugins.status.unittree-profiles.pool','portal'),('core.plugins.status.unittree-sira.installed','true'),('core.plugins.status.unittree-sira.pool','portal'),('core.plugins.status.unittree.installed','true'),('core.plugins.status.unittree.pool','portal'),('core.plugins.status.workflow-alert.installed','true'),('core.plugins.status.workflow-alert.pool','portal'),('core.plugins.status.workflow-alertgru.installed','true'),('core.plugins.status.workflow-alertgru.pool','portal'),('core.plugins.status.workflow-appointment.installed','true'),('core.plugins.status.workflow-appointment.pool','portal'),('core.plugins.status.workflow-automatic-assignment.installed','true'),('core.plugins.status.workflow-automatic-assignment.pool','portal'),('core.plugins.status.workflow-automaticassignment.installed','true'),('core.plugins.status.workflow-automaticassignment.pool','portal'),('core.plugins.status.workflow-createpdf.installed','true'),('core.plugins.status.workflow-createpdf.pool','portal'),('core.plugins.status.workflow-editrecord.installed','true'),('core.plugins.status.workflow-editrecord.pool','portal'),('core.plugins.status.workflow-evaluation.installed','true'),('core.plugins.status.workflow-evaluation.pool','portal'),('core.plugins.status.workflow-fillingdirectory.installed','true'),('core.plugins.status.workflow-fillingdirectory.pool','portal'),('core.plugins.status.workflow-mappings.installed','true'),('core.plugins.status.workflow-mappings.pool','portal'),('core.plugins.status.workflow-notifycrm.installed','true'),('core.plugins.status.workflow-notifycrm.pool','portal'),('core.plugins.status.workflow-notifydirectory.installed','true'),('core.plugins.status.workflow-notifydirectory.pool','portal'),('core.plugins.status.workflow-notifyesirius.installed','true'),('core.plugins.status.workflow-notifyesirius.pool','portal'),('core.plugins.status.workflow-notifygru.installed','true'),('core.plugins.status.workflow-notifygru.pool','portal'),('core.plugins.status.workflow-reassignment.installed','true'),('core.plugins.status.workflow-reassignment.pool','portal'),('core.plugins.status.workflow-usergu.installed','true'),('core.plugins.status.workflow-usergu.pool','portal'),('core.plugins.status.workflow.installed','true'),('core.plugins.status.workflow.pool','portal'),('core.plugins.status.workflowtest.installed','true'),('core.plugins.status.workflowtest.pool','portal'),('core.startup.time','11 mars 2022 à 11:16:10'),('core.templates.currentCommonsInclude','Boostrap5Tabler'),('leaflet.icon.icons.default.installed','true'),('leaflet.icon.icons.green.installed','true'),('leaflet.icon.icons.red.installed','true'),('leaflet.icon.icons.yellow.installed','true'),('matomo.site_property.server.http.url','https://mtmdsin.rec.apps.paris.fr/matomo/'),('matomo.site_property.server.https.url','https://mtmdsin.rec.apps.paris.fr/matomo/'),('matomo.site_property.site.id','446'),('matomo.site_property.widget.auth.token','fa72556f171fbb3ba1137f11b9b8d47c'),('mylutece.security.public_url.mylutece.url.createAccount.page','jsp/site/Portal.jsp?page=mylutece&action=createAccount'),('mylutece.security.public_url.mylutece.url.doActionsAll','jsp/site/plugins/mylutece/Do*'),('mylutece.security.public_url.mylutece.url.doLogin','jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),('mylutece.security.public_url.mylutece.url.doLogout','jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),('mylutece.security.public_url.mylutece.url.login.page','jsp/site/Portal.jsp?page=mylutece&action=login'),('mylutece.security.public_url.mylutece.url.lostLogin.page','jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),('mylutece.security.public_url.mylutece.url.lostPassword.page','jsp/site/Portal.jsp?page=mylutece&action=lostPassword'),('mylutece.security.public_url.mylutece.url.modifyAccount.page','jsp/site/Portal.jsp?page=mylutece&action=modifyAccount'),('mylutece.site_property.default_role_keys','front_role'),('openamidentityclient.site_property.autologin_after_reinit_password','true'),('openamidentityclient.site_property.jcaptcha_enable','true'),('openamidentityclient.site_property.lost_password.notification_recipients_bcc',''),('openamidentityclient.site_property.lost_password.notification_recipients_cc',''),('openamidentityclient.site_property.lost_password.notification_sender_name','noreply@paris.fr'),('openamidentityclient.site_property.lost_password.notification_subject','Votre nouveau mot de passe'),('openamidentityclient.site_property.lost_password.notification_template.textblock','<p>Bonjour ${account.login},</p><p>Vous avez perdu votre mot de passe ? Pour en g├⌐n├⌐rer un nouveau, cliquer sur ${url} </p><p>Cordialement.</p><p>L\'├⌐quipe Paris.fr.</p><p>Ce message a ├⌐t├⌐ envoy├⌐ automatiquement. Nous vous remercions de ne pas r├⌐pondre.</p>'),('openamidentityclient.site_property.lutece_user_validate_attribute_key','user.validated'),('openamidentityclient.site_property.max_notification','10'),('openamidentityclient.site_property.validate_account.notification_recipients_bcc',''),('openamidentityclient.site_property.validate_account.notification_recipients_cc',''),('openamidentityclient.site_property.validate_account.notification_sender_name','noreply@paris.fr'),('openamidentityclient.site_property.validate_account.notification_subject','Valider mon compte'),('openamidentityclient.site_property.validate_account.notification_template.textblock','<p>Bonjour ${account.login},</p><p>Votre compte a bien ├⌐t├⌐ cr├⌐├⌐,pour valider d├⌐finitivement votre inscription, veuillez suivre le lien suivant ${url} </p><p>Cordialement.</p><p>L\'├⌐quipe Paris.fr.</p><p>Ce message a ├⌐t├⌐ envoy├⌐ automatiquement. Nous vous remercions de ne pas r├⌐pondre.</p>'),('piwik.site_property.server.http.url',''),('piwik.site_property.server.https.url',''),('piwik.site_property.site.id','0'),('piwik.site_property.widget.auth.token',''),('portal.site.site_property.admin_home_url','jsp/admin/AdminMenu.jsp'),('portal.site.site_property.avatar_default','images/admin/skin/unknown.png'),('portal.site.site_property.back_images','\'images/admin/skin/bg_login1.svg\' , \'images/admin/skin/bg_login2.svg\' , \'images/admin/skin/bg_login3.svg\' , \'images/admin/skin/bg_login4.svg\''),('portal.site.site_property.email','<webmaster email>'),('portal.site.site_property.home_url','jsp/site/Portal.jsp'),('portal.site.site_property.locale.default','fr'),('portal.site.site_property.logo_url','images/logo-bo.svg'),('portal.site.site_property.meta.author','<author>'),('portal.site.site_property.meta.copyright','<copyright>'),('portal.site.site_property.meta.description','<description>'),('portal.site.site_property.meta.keywords','<keywords>'),('portal.site.site_property.name','AGENDA by LUTECE'),('portal.site.site_property.noreply_email','no-reply@paris.fr'),('portal.site.site_property.popup_credits.textblock','&lt;credits text&gt;'),('portal.site.site_property.popup_legal_info.copyright.textblock','&lt;copyright text&gt;'),('portal.site.site_property.popup_legal_info.privacy.textblock','&lt;privacy text&gt;'),('portal.site.site_property.portlet.title.maxlength','75'),('sitelabels.site_property.moncompte.url','https://moncompte.rec.apps.paris.mdp'),('sitelabels.site_property.nom_site','RDVQJ'),('sitelabels.site_property.nom_site_xs','Rendez-Vous Quartier Jeunes'),('sitelabels.site_property.siteformtitle','Rendez-Vous Quartier Jeunes'),('sitelabels.site_property.sitetitle','Rendez-Vous Quartier Jeunes'),('themecity.site_property.banner.buttonLabel','Demo'),('themecity.site_property.banner.buttonUrl','jsp/site/Portal.jsp?page=appointment&view=getViewAppointmentCalendar&id_form=5#current_step'),('themecity.site_property.banner.image','images/schedule.png'),('themecity.site_property.banner.text','Use Agenda City Packs in order to set appointements for any needs'),('themecity.site_property.banner.title','Appointments made easy !'),('themecity.site_property.bannerMessage.CloseButton.checkbox','1'),('themecity.site_property.bannerMessage.Duration','5000'),('themecity.site_property.bannerMessage.htmlblock',''),('themecity.site_property.bannerMessage.Position','bottom-right'),('themecity.site_property.bannerMessage.Title',''),('themecity.site_property.bannerMessage.Type','info'),('themecity.site_property.footer.about','Lutece is made for cities, by cities, upon open source principals.'),('themecity.site_property.footer.cookieLabel','Cookies management'),('themecity.site_property.footer.cookieLink','#cookiecitypack'),('themecity.site_property.footer.links','[{\"Our wiki\",\"https://lutece.paris.fr/support/wiki/home.html\"},{\"Read our Terms & Conditions\",\"https://lutece.paris.fr/support/wiki/home.html\"},]'),('themecity.site_property.robotIndex.checkbox','1');
/*!40000 ALTER TABLE `core_datastore` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_feature_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_feature_group` (
  `id_feature_group` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `feature_group_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `feature_group_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `feature_group_order` int DEFAULT NULL,
  PRIMARY KEY (`id_feature_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_feature_group` WRITE;
/*!40000 ALTER TABLE `core_feature_group` DISABLE KEYS */;
INSERT INTO `core_feature_group` VALUES ('APPLICATIONS','portal.features.group.applications.description','portal.features.group.applications.label',3),('CONTENT','portal.features.group.content.description','portal.features.group.content.label',1),('MANAGERS','portal.features.group.managers.description','portal.features.group.managers.label',5),('SITE','portal.features.group.site.description','portal.features.group.site.label',2),('STYLE','portal.features.group.charter.description','portal.features.group.charter.label',6),('SYSTEM','portal.features.group.system.description','portal.features.group.system.label',7),('USERS','portal.features.group.users.description','portal.features.group.users.label',4);
/*!40000 ALTER TABLE `core_feature_group` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_file` WRITE;
/*!40000 ALTER TABLE `core_file` DISABLE KEYS */;
INSERT INTO `core_file` VALUES (125,'export_users_csv.xml',125,2523,'application/xml','2005-10-10 10:10:10'),(126,'export_users_xml.xml',126,259,'application/xml','2005-10-10 10:10:10'),(180,'post_it_yellow.png',205,118118,'image/png','2021-01-20 09:37:13');
/*!40000 ALTER TABLE `core_file` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_id_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_id_generator` (
  `class_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `current_value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_id_generator` WRITE;
/*!40000 ALTER TABLE `core_id_generator` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_id_generator` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=1437 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_indexer_action` WRITE;
/*!40000 ALTER TABLE `core_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_level_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_level_right` (
  `id_level` smallint NOT NULL DEFAULT '0',
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_level_right` WRITE;
/*!40000 ALTER TABLE `core_level_right` DISABLE KEYS */;
INSERT INTO `core_level_right` VALUES (0,'Niveau 0 - Administrateurs techniques (r├⌐serv├⌐ DSIN)'),(1,'Niveau 1 - Administrateur Fonctionnel (SRU)'),(2,'Niveau 2 - Utilisateur m├⌐tier avec gestion d\'utilisateurs'),(3,'Niveau 3 - Tout utilisateur m├⌐tier');
/*!40000 ALTER TABLE `core_level_right` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_mail_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_mail_item` (
  `id_mail_queue` int NOT NULL DEFAULT '0',
  `mail_item` mediumblob,
  PRIMARY KEY (`id_mail_queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_mail_item` WRITE;
/*!40000 ALTER TABLE `core_mail_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mail_item` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_mail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_mail_queue` (
  `id_mail_queue` int NOT NULL AUTO_INCREMENT,
  `is_locked` smallint DEFAULT '0',
  PRIMARY KEY (`id_mail_queue`),
  KEY `is_locked_core_mail_queue` (`is_locked`)
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_mail_queue` WRITE;
/*!40000 ALTER TABLE `core_mail_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mail_queue` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_mode` WRITE;
/*!40000 ALTER TABLE `core_mode` DISABLE KEYS */;
INSERT INTO `core_mode` VALUES (0,'Normal','normal/','xml','1.0','text/xml','UTF-8','yes','yes',NULL),(1,'Administration','admin/','xml','1.0','text/xml','UTF-8','yes','yes',NULL),(2,'Wap','wml/','xml','1.0','text/xml','UTF-8','yes','yes',NULL);
/*!40000 ALTER TABLE `core_mode` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_page` WRITE;
/*!40000 ALTER TABLE `core_page` DISABLE KEYS */;
INSERT INTO `core_page` VALUES (1,0,'Home','Home Page','2014-06-08 17:20:44',1,1,4,'2003-09-09 00:38:01','none','default',0,'','application/octet-stream',NULL,NULL,1,0,0);
/*!40000 ALTER TABLE `core_page` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_page_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_page_template` (
  `id_template` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `picture` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_template`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_page_template` WRITE;
/*!40000 ALTER TABLE `core_page_template` DISABLE KEYS */;
INSERT INTO `core_page_template` VALUES (1,'One column','skin/site/page_template1.html','page_template1.gif'),(2,'Two columns','skin/site/page_template2.html','page_template2.gif'),(3,'Three columns','skin/site/page_template3.html','page_template3.gif'),(4,'1 + 2 columns','skin/site/page_template4.html','page_template4.gif'),(5,'Two equal columns','skin/site/page_template5.html','page_template5.gif'),(6,'Three unequal columns','skin/site/page_template6.html','page_template6.gif');
/*!40000 ALTER TABLE `core_page_template` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_physical_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_physical_file` (
  `id_physical_file` int NOT NULL AUTO_INCREMENT,
  `file_value` mediumblob,
  PRIMARY KEY (`id_physical_file`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_physical_file` WRITE;
/*!40000 ALTER TABLE `core_physical_file` DISABLE KEYS */;
INSERT INTO `core_physical_file` VALUES (125,_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:output method=\"text\"/>\r\n	\r\n	<xsl:template match=\"users\">\r\n		<xsl:apply-templates select=\"user\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"user\">\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:value-of select=\"access_code\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"last_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"first_name\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"email\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"status\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"locale\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"level\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"must_change_password\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"accessibility_mode\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"password_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"account_max_valid_date\" />\r\n		<xsl:text>\";\"</xsl:text>\r\n		<xsl:value-of select=\"date_last_login\" />\r\n		<xsl:text>\"</xsl:text>\r\n		<xsl:apply-templates select=\"roles\" />\r\n		<xsl:apply-templates select=\"rights\" />\r\n		<xsl:apply-templates select=\"workgroups\" />\r\n		<xsl:apply-templates select=\"attributes\" />\r\n		<xsl:text>&#10;</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"roles\">\r\n		<xsl:apply-templates select=\"role\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"role\">\r\n		<xsl:text>;\"role:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"rights\">\r\n		<xsl:apply-templates select=\"right\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"right\">\r\n		<xsl:text>;\"right:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"workgroups\">\r\n		<xsl:apply-templates select=\"workgroup\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"workgroup\">\r\n		<xsl:text>;\"workgroup:</xsl:text>\r\n		<xsl:value-of select=\"current()\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attributes\">\r\n		<xsl:apply-templates select=\"attribute\" />\r\n	</xsl:template>\r\n	\r\n	<xsl:template match=\"attribute\">\r\n		<xsl:text>;\"</xsl:text>\r\n		<xsl:value-of select=\"attribute-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-field-id\" />\r\n		<xsl:text>:</xsl:text>\r\n		<xsl:value-of select=\"attribute-value\" />\r\n		<xsl:text>\"</xsl:text>\r\n	</xsl:template>\r\n	\r\n</xsl:stylesheet>'),(126,_binary '<?xml version=\"1.0\" ?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n	<xsl:template match=\"/ | @* | node()\">\r\n		<xsl:copy>\r\n			<xsl:apply-templates select=\"@* | node()\" />\r\n		</xsl:copy>\r\n	</xsl:template>\r\n</xsl:stylesheet>'),(205,_binary 'ëPNG\r\n\Z\n\0\0\0\rIHDR\0\0 \0\0$\0\0\0@ßD~\0\0\0sRGB\0«╬Θ\0\0\0bKGD\0 \0 \0 á╜ºô\0\0\0	pHYs\0\0\0\0\0Ü£\0\0\0tIME█%«R⌠\0\0\0iTXtComment\0\0\0\0\0Created with GIMPd.e\0\0 \0IDATx┌∞╜kÉ,Θ¥╓≈{■of]║√▄/3s╬Ö╗F≈¥iñò`w╗xπ≡φâ aç²à0DÿXû¢D╪µ╞▐a;∞ì░cYâw½╜H▓╨é$V▌FÜ√╠╣twσ√■²ß}3+½║·£εs·£Öæ▐G¬Θ╙UYÖYUY¥ \'ƒ ≤áóóóóóΓ°╩Å\\α╦?rß│? ≤≤│/<R?ÿèèèèwÜ·TTTTT	╥ß ÷⌠ù₧▄n.═Üf┌┌ñ1╡ì⌐\ZW\nÇ⌡kp▄RùH¥╙uë┼~bqúc±≥éε7÷▌O µ⌡x╗▌»KEEEE% ▀¢Éç3Éτ═╢[;╙Ü╬¢╕dΓóαΓ░\r╠Fτ¥∞I▄4τM»±rk╝<╝÷≡─▐|∩φ[_·Wï┼φQe ∩┬╙I}*****6ßƒ|∞|Γ3ox∞τ?ví╣╓ª∙⌐Éµf:ò─╣F:?ùL║äΘ\"Φóαé;gHí╤▌≈n║≤ª├½╔⌡JL╝╝∩╝r+ÑW≈▄_■Æ;o▄î∞╜m≈╫oMo■╘_▄¿îⁿ¡≈¥α■ï╖ΩçWQQQ±FU@*****┼a·┬VαéëºÇ┤Γ⌐I░kìΘæF\\6╙)5êgé╙8*-X¿¼╘üä{:£Er]R╖ùⁿ╓$Θì▌Φ/∩9▀▐s╛.±╒Fⁿ╦ïì	xmπN╒Kj∩\n╘?╫+°ⁿ\'Nü─│ Σ═ò√?²╤S╙╟µ═vv±■`|áò░1=╒ÿΓóë╣ÿ)█=ⁿ6L╞_>α	:ç²Σ²φì╬²ò²─7≈_▌K|i╫⌡àë╡ƒ╥╦7▌¢_z}q≤O|moE∙{╧g%Σ▀²lUB****▐ë¿\nHEEEE┼^░Ä≈ïf⌠╥\'[∙╟&A╧5AÅ╢ìφÿi.1&╜╝qα≥û6¼\\σ?╛|N└Öÿ├¥▄º]≥7\"∩╗²ôM≥o	 ≥\r≈╧εJ ▀╣i≤E╪{eu =╘+****▐æ¿í+****\0°╠\'N≡±║T>■╧╧┌½[φà⌐ΘëS¡=╗╒╪ºZ╙≤ìΘÖ╞4i\Zíá⌡│J▒çK 4¥5& εαeûâ·°Φ▄ΣÉÆsúsn%τf≥┼¡─7vú■VΓ│╖: ⌡╖: ≥¡ö╛√b▀ⁿú┐yk0¡√▀°C≡w~ü?⌠Ñ»≡╖╛V?πèèèèw¬RQQQQQ╚âVZó■│	┌n∞╤⌐Θà3¡²εyk╧m╡║╥ÿ¥╦èç2ß≡2Kδ7+ôw╫ÉB>≡╔ù7O╦╟╥r∙iÇ`bÜ╘n;Wn?{3≥ü╫IƒîΓs⌐╙/═ú>|²└δ¬â▓****▐Yº¢·TTTT|π╙?xÇ·ò╫ç√■▐│█╙\'τß╔i╨\'N²≡Nc?6\rzj▐jΘ∩╚─]3d&BÇ`K≥╩╧±)╟R!\Z)µ╟rδï	OÖ£╕π╕ô@╔a?æ╒ÉΦ╝²·⌡Φ_║╤Ñtú≤_┘s ∞+]·┌_ ε═ƒ}iòzⁿùOµ]°╦┐U?≤èèèè╖U⌐¿¿¿°~╟Z╝╟ ÷∞|z¬╒≤┴⌠#█ì²─╝▒o5:=▒Γ¼ΦùB&MÇªY▐éσ╟B╚dño├r2┴Φo1µ[W~ªÿëê╩Obfö┤[ckn╝7╕=î√s1ª_£Jƒ■╖╬M Θg_┌{}σu╓KnòÇTTTTT╝}°>~Ç·╠▓N ½╧£nÖδÖë±⌐φ╞~l⌠â│áφ6+$┬àcåBM#5\r┤\r┤-┤ô≥∩BD¼öu⌡ú\'1B╫┴ó╦?c─╗æ║L\\bö\'G)¢C╠±VyZd8;╗ü¥╬²BB╔fkΓƒ»εï7≈_√┘o╨┴R∙°ΘKù≡g^z⌐òÇTTTTT╝]°╗>=█iy#}ΩLú▀┐╒Φ∙SìmO-x\0K╒ú	àp┤0Öl╕╡	H?v7ìêG[,╩¡ⁿ█`é.╖{)F ·⌠≤╥¡=/╢D└ª¡∙≤ôÿ╬║δ┬Cms╡▌÷_°Y▀¿ƒnEEEE% o~ε∙ⁿ╪g▐X╣ ≥LW[±█ºª¥=;7¥Ü\Z+═O╜╫#\r─c:=xk\'0i 4╦÷½ü|îH▀ó╒╖qY\0[á$éùƒRWÿOD)a₧Σô╗Çα0═I	µ╔⌡■φ`mr┌á÷═?≤┤∙╖«≤▌┐■¥╜└ƒ-╩╟º╩δ■┼zHTTTTTRQQQQ±α≡╫>┤.╖║0	<77²─╘°ms╙⌐╣ì╥4dÖ⌠╩╟@>f0ƒ├l│)Lª╣²╩Bû&£2àj4▌¬┐╧\n`áÉòB<≥¡r%{╚ñ∞à╟ô ╢É =╤`ís╡[{hk█~÷V&dë: ½óóóóÉèèèèè√Ä▀√┘δ+┐?5	g\Z╙LñOl=7:▀\néFE║Tª\\ì╝ô)╠fÖäL∙hÜL*\0ÅÖp¿≈|╞≤æ	╜├δ²4▀BtBâR>K╣g■óQ╞íêÿ¢L	SnÆ╖ÇrWOl%┬ó┴\Zⁿ┼ƒ╝zj∩≤/┼Wn f≡ ≤G≤·■╗»╫âóóóóóÉèèèèèà⌐⌠H#²«F·╤¥á│█Aÿ2/░\\╧eó≈~4ÖlL∙Φë╩Σóδë┼h╝nJ╦æ╗╔Gj╚8dòÉΣQ╛!≈X╡½Ωr░1ë \'æòÉD&N¡ëÖú3\r╫~░≤tδ╠V:≤íçΓ╧ ▄╫∙\0?|.»«ÉèèèèJ@*****N √ç/≡╛≡]\0■┌√C╕╪N╬L╧L┼±üëi½╡!╬╝äÖKÿße┤«Üb>oZ░&ùGG⌐[ëQ7»█τzñe╓2òynú╩┐·╥3B▐ⁿ▓U+U┼æ9µ òû,σf¡ ≈LB╨╠▒Eα╤ë±C█Añë}≤Gº÷µ?╪K╫⌡|Ç Γ±)╕≤W ⌡~=H*****⌐¿¿¿¿8QîÆ╬»nM╖∞├ì±┬v╨≤á▄Ië!lP}¬yo═r\nû)è~éUƒ±╤¡Å╫ìxQ?╝W=2╡(yåÑ╫k£ó▐Sá₧░αy⌐\"╨!≈∞æ▄ë╩╗fé╞D¢≤`Oƒ≥╘φ\'√╞GÜ,▐²7■√oε╜╔rKòÇTTTTT£$zσú╟äµ\\É?\'x«5.5ÑεOÄùz_Lßè╟Cxr≡.¢├ôù÷½∩2∙≡Æφß]$ò÷*∩╒ì▓-╔└r╞êåm⌠─\'S%_╢e!ñ<!K┴æfÄy╩DD`>Σ┤{\0\Zí╣íàΘëY≡▀vvó¢│─╦└?°½_█α≈£?Å╗≤┐÷Z=X*****⌐¿¿¿¿8iÿç╦┴╥G=ï47ë┬=r⌡>(#≥aÖ|╨%H]&	=AXt°■_,HïÄ╪u─I1ß₧ò∩[»╘ôëσ═╠0X0╠ÖÉìçΘY²L,a2ÆyQAä·╢-ûóJ#ÿ╤╣ª≤Σ/∞╕Θ½ ÷%{∙ƒ_O»|±V*╠ä¿╞ÑWTTTTRQQQQqó°o«]▒K[▌⌐╞╫ZΘ╫ádⁿ«<Ç*O╩═è▓ⁿ╙ßΦ\"R\Z┌«╝ï°■é┤┐?ÉÅ.Fb╠¬çÅ╔G╧FE┐╚$î╚ÿêΣÿÅBtåuΣ>+╣eOêzi%2ç 11ÿ╫<Ω╠\"°w/\\¥7▀=▌≥┘/▐┌α z⌡╒zpTTTTTRQQQQq╥╕r■╞╝OΘ=S╙σë9#╨IZìδáƒÇà-=1\"@V5║H┌_≈tï]ë)æèτc┼_▒╔lßÄpó;]JX∞╔H&!┴îδg√xUZÆ	∩òò%?!╚▌Zí¥F8:u3Ω╖¥jl╫▒!ÉèèèèèJ@*****N\0≤╣3\0ⁿß╧σΣ≤I`+êº$₧n┼Θá\\┘\'╫`≈Nö╬¬eëƒ█¢R÷y ╦~ÄÿH]ñ██º[tt]Gù⌐\'╛:>╖o╜Zƒé5,+æ\0Këdå%#├=æ▒?}┘æÑßg▐F∙ù/═Φío┼2ΦL│ÖΘ²;┴▐─⌡+▀:≤╡╧▄▄╣▀tÇ∩╥%\0■ùÆÿ^QQQQQ	HEEEE┼▒α+╩CcÜ▐â⌠ö─l░Yh┼fAΩï{æÅXÿ		ONΩ:║.▓)>≥a░╤Sßk≈k╙YEq\'y\"Ñ¼édÆ≈╝o/√Ω╟à|x&A╨JDA+┬╢Θ|<ô╧╜pv [8⌡╩┐°█▀ß¡z¼TTTTTRQQQQqÅ°├ƒ{sσwímÅWü╢/°ô₧æc=0ç╪Å╕Mie<«):ï.Å1∙p≈┴X~(!\ZÅ┬Z┤¼# ¢æç─±α┘R┌¼ÆT╚Ä╚╡0≈¼~╕╘Æ▄[┴─╨V	]▐KΘ┘│-▀Ü√.dRòÅèèèèJ@*****N;éçÇï¡ùV½íφ╩√Tqò\\┴▄je.r┴▀√5]ñï+\':I*òö≈ä╙½\Z\Z°É·iZú⌐Z9É░┤f╔╦OH&f}º7:=╗∞5í▀\0■u=:****ε?¼╛∩R\"±AH<▐s■²kíqτ¼α£úS╔^êç}IBóCL₧o╤ë)c╦¬Gs╞G\Z⌡x⌡$`¼d¼óoÆ┌îu⌡d¼Ç⌠█╬&≈σ╚α~ñ»¡▌┬╚ ╤jà&&µA╠ìf⌠°╝╤µ\rÅ}`vqVÅ¬èèèè√Å¬ÇTTTT╝½Y╚╤²ôO╧Üçºv.ß¥rÿ$░T,┼┘Q╘\räwé\'R╩╞n║Σ─±Σ╦p┴ü\\▄ºùZ╚LJ R&*┼└óB\\¼σ#ƒëQ╥┴\r<&&å═╙EΓJr▀Å_╝∙òÅw≤»■φo▌¿VEEEE% ▀wH┐δε■■╫Å╖╛°┌nh┌>ô£s└û;!╣ΩëçïΦÖhh0ƒτxB#C▄}PF╞Σc╜⌡Ω^[▒╓ƒ?VTR≥L>▄å┴Z9DHÄ⌡\nLßh┴èi=A₧p&B[▒╤Ö╜Σ∩9╙≥▐Yα%α└ⁿΣ6ⁿÅ_¡|ñóóóΓ$Q[░****▐íX╢¥■╩½ñ²=╢RΣTrµ▐OÅr_╢\\¡▄ûDcyK∙■C█½╠;πú²Kex░·±╗┼2n┴\nêá|k\rbbbººé&≤á\'╢=s║╒N=≥****ε/¬RQQQ±6π╖╦?ƒⁿ┌╧ ²╠p°∙Ñ≥ß∩àεß¡&6\nímÜ╨4\rì\Z£û─DFCδ┴XSî╤¡U╟V│≈╒owg┐≥▌ε╜{{ΘQ£¡╘Å<╙C##║]Yy0(ßτπÇA=░wj<à╦┴╒ +τûEΣC.!╓4EA┼î.ÿH$â╝¥Wg╞ô√«3²╓■FU>*****⌐¿¿¿°^DoY╕-╢¢qΘ,pq8/τ╝¢╬╨╪Ä¢╢╠j▌¼AÆ,$é÷±p≤ΓÖ╨∞F;≈╥¢▌π╫oñS]JtεX┘╢)gj╦÷½X╞αåÆ╟!/ò~±å╝o╓qⁿ@δW&Öl,∙	╕ Z>N¡╙L─Ñ⌐╕║p╬├╢αå╫#│óóóóÉèèèè∩	ⁿ═E≥▓u\r╬>ç■Åƒ+ò≤╧\0≡ÇÅ²÷¥i;▒IhÿÜΘtÆ.╔t╣1R░K╗H╨ñï2¥A┌!h╙╠MÖ&╔Σ4╢á	7¢⌐Ñ¡╣7│=▀╛╛δ│E─ë	ù	s╘æï≈£$εKóß	Ñ£D.┐╙½√G╘É>\'dmoD±₧Å■▌╖┤∙2äd╨&┬─875.∩┴∙τΘ╢?√mnp,ïEEEEE% ∩PH╖/m╧¥í=\n<)x┌Ñ╟║\"│çtÖ╞vh╘lé4Aj1╠\Z╠L&#öæP┤ûÿ6╤é{╗ï&¡¢Φ╨!áΣÿ9╤y±R#zn┴+e~N_Nƒz;ßΣ⌐Vn╦}Θ▀▐~ ûF$▓!=öä⌠╞¥╫╘µ┴╬∩+¥ ╚<¥Ö\\e∩W╛╔ó¡òÇTTTT╝k±Θ╢@≡C┐zÇ öo\0▀απWαo>rjzVi╛m╛3¥äGCk░á≈+≡^LÅ!╗îΘ╥L\Zù■Z▐·æO>·7σ≈üⁿL╕D,icßDµ╨ßÿεRêùxt╖▄₧╒Oÿ\ZªTΘ╙É5)─╦■ñ5┬ß½∩N!!┘7ÇFx╩!Ü╠îφ[╬àAτ?<	» \n▒ÉèèèèJ@****▐▌╪$|ⁿüÖ\Zsóiφâm╦≤í▒≈à`O¿╤%5∞`Ü#¢\"Z$╩Φ*êÇÑQ╒¡╤∩Öh`é.ALxτt{]ùH₧═┘τíónÿá#╖_⌡JMH╦½F cU·p[ê╚°╜L╬@ÜQ3⌐σ¡3▓Æ\n!	Ö|╨íë£▀╞.!╛	▒║╨+****⌐¿¿¿x≈ß3/lü├╟φµp▀_∙░┘Gªô╔9│¥!<9ô>2\r|4╜`ªºd£╧╝bΣ╢Φ█íå┴N«üh⌠òvO>╞$$ª£▐╫9╛HxL┘;!)ó£∩QHHτ┬£┴êÄôÑæRßkT∞{OR0±X╬┬╥\nΘ\'sP@·╖╟ù^ÿï º┤éë\ZΘⁿL║äYME»¿¿¿¿ñóóóΓ]î╡\Z}*╢╬╚₧9¡≡╔ÖΘú;A╧╢A╫¼╤)≤í¬ÄÑΓù»·╛≈öF\n╚x9fÑ%+íMtéτV,ùHêΦóL¿┼br╠@	$çd╚<½\"ÑÉ╧╛-½ⁿ╖¢g╓╘∩ûKe»─s║⌐( ╣\rï \ZCτ\'┘≡?¡mEEEE% ∩*ⁿΩGv└¥Å²┌▓ôτ₧ƒ┤Sk.╖╥╙ºâ^╪6²ÄÖ±|k<┤lr╡îgçèΓüÉè0Γeª¼J╣=`⌠▐êL^Σ9ⁿB	ÜMY<)ô╚jÇp,9f╩¥\\â▒█1≈í-K₧ƒkkΣπüτéh⌐\rûù5â ╪.#╫R!┐ƒVêHy∩═─ΘëtV╨╓#╕óóóóÉèèèèwè╥╨πo?Gñ≈╠ÑÅ╧═~|K·≡ΘFWf╞yíó,⌠φPkj╞╕╖êB>╞}F}í▌╧╚Ek│r9┤▐ ß╣²*/ΣÑ@╛╥é╡≈≤Bxû╣%«J7n F3≥α»∩Uy?UTÉAaΘ)⌐Θ╨V#φÇ╫≤cEEEE% ∩ⁿΩ≤;H≡┬o\\ε√╟┌Ö4û▐cΓçf╥ºª╞∩lìkìûSÑÆôG91╚R!Ñƒ,Å─Ek≈╦Ä}\Z*±╠\Z<9{g╖{)╨ABæÑ┼╩J*·`Φσé¿╪A▓^⌠╣äö╟)╗ @1\"eε	H V⌠I∩Ω├{R¼2fb┌└Ωæ\\Qq<ñ┼_╠+┌ƒ\\╜D░°ï∙╗╕vE% \'å╒°~h{n┴ƒo╤º&╥┐13}`\'Φ∞──óx.åbÿÑC>JⁿδIFZ#àî,79\ZQ½╤ε8,║─K╖/εè7bßü6d#╢\'êà`(eδ╚8ÿ<╖c%\'╙#ñ\0°└[»Ä≥÷»■c╪7+┐e/ê2RZ▒d01ib╦╪Éèèèc^╪ⁿ╜¼╣₧òÇTTTT£8~⌡#█ ±▒__*┐ⁿ[mx┐I?\Z─ÅΘA╠BR╡╚E┐τë╣ÆòÇ<▄≤p+æû]V%╤{U	)îd╕ƒÑ2;τì╜─wnF^▐╖(Ç╦╚┬Kƒ%Æ╔P≡¼äΩFYVE╠│æ=╣ôJH▐|qîöBCz;)ëÅL)σux~TZ╧4\nVnY▒≡ΓS≈ç)╟& σ∙╔uôIæ╤UσúóÉèèèè√W≥«T¡ °├[█┴⌠æ`·╤ ~É>`╞╠√₧\'πJynÖ░¢V9äÿgΩ3:4║áXö·║!$úï╬╦√╬7nF╛}3≥Zg¿u&F₧éàæö¥ε>°@▓\'dT£;X╩]bQ╚d *zç°A┤$┌⌠┴ö╞ûÖ>J%o┤2ß╖óΓ√µ∩╫╔AxD░δ≡▌_}E% ▀∩°⌡τw\0°Φ╚≤±ƒ▀⌠î─∩4°1╧#┌2Y╫≈=╣jr%,≈qÉynm\nàtXyD╜Y╝ⁿWkeC_5kTÇôα═à≤¡¢ëo▀L\\_8¥;SONDäùtA/½┤B6╘º┬`N7çαNL₧█╖▄±^a⌐|▄≈╓¼⌡\rhC%5÷Γ╦ù~VcS\0,Oεé╤⌡n£èèw$YXⁿ╣|x╖ΩD╓gâr±▀óno2≡÷Σ\r╬ñ ½2|┼Σìπôⁿeù╡@½ⁿ╜æ/ⁿ1αqα_»ï·⌐UTRQQQqƒjaÇ⌠ⁿ÷V∩ò±πAⁿ>âôP▒(─âö\r²i}Φ╢bödQL▐íä÷æ1	9░}┌₧ëΣp}?±¥[╬Wo$^┘w\ZºUÿëG:oHfÿ,@╩*HƒzÄ-= 6dà81e∩HJë╚ldC╤█ⁿ!°ß╠GdÄìδ⌐W{A▄╩<▒óΓ√\r)\0Åö╦	x╚ßÜ≡	¿+▀╫ÇPε{τ\Zy|u\\\0ª└▀ⁿZ% òÇTTTT£~π╣3\0|Σ│o¼▄?╫$~╚─ºL<Ü;É<╗#I╩∙*Æâìⁿ\Zúαè2±jI.╘Å÷╠τ╦*[²╪¬╥╟uúâ∩∞:▀┌M╝║∩∞%8╙@k░ σ¢;rúò!σV,wgß#╡`Σ²0 y&719Q∙■▐2«√∩√T¼Mè╟╪√┴╕╜Jxë╓Z┘ö#oÿⁿ║CWÅ≡èτ╚ï?ù┐Wô{S.zσ├²OC&^Äc%kpM╩ùnÿJ¥&├ƒ╘αL$⌡╞▒Φ`,÷»\0OÉm`QΦ¬─πàLî	╚í╟Kü+└╞â2₧.$ÑóóÉèèèè)&X╜╚■Ög╢âMuN°│?aΓc3║╡)╣╤ù%é?E~╕∙α¢LτVHê\r∙â²âCÑì╗╝┤ù°≥═─w≈rK╫vsâ`à4α∞ªt,Σû¼╪æJ2·╨▓Σ^┌«TZ╢≥-\01⌡√Æâ\nm╘è⌡á╤Å,╦╝Æu ╠80~╕ºo┴1╚▀2x=╒+╢≈δ»╞Irº!{-¼╠╚{─ß¬r▐h,_W#+WY╞α<î╕JQ,ûö┴τ└╓hä─╪╬_╝húΩ∩/å┘z(i∙╡*ëòÇTTTT£$>·╣Uσâ╣╬║ⁿL·┴ ₧.\'r╦UWèαPjßC▒¼í÷σ∞╫σc⌐x⌠$ñ9╠è╚▓Ñç[╔yi▀∙╓«≤¥=τFäφ\0≤ &F&18¥\'Σ)+ìß\n$àB<Γ@>é+W3σû╩-÷▌^⌐OH╧*ê{.▓╓º`¥╪t¼\r╩èσc⌐▄0Ür5Q<2╒╗πöΘ├ óë╫L╝\"≈╜zä#-■\\Ö⌡ºNl¥j:»;²Y)¬╛┤I-N╗vÉ╦Ñ╞í-_\ZW^ªUƒÑ┘∙5α▒¼SÆ@╫╚èE+Φ≥]U÷d⌠Σ*╬∙ß╧╞Rtàæ╗L║<W╛IúIsσù╫ /╫G╘1nÄ¼y òÇTTTT£,\\\\u±{\Z±;Zq6╖ríε^┌¼r+V>ü\'▓|múiX┬╡Ü¼g,e+5└8■cæ£W≈¥/▀H╝╕∩t│\0≤\0S╦ù1\r1æqÜΘΦhÉ	9É░≤Ñ$\0Q^╚ç≥╩%╫XûKd?R┘╖⌐à8\"e4\"+≥σ?├∩ûÖαα╣ü─╦A■b2▀¡Gt┼²âZr█Rî>ΓpE╣.δ[¥≡pY«?£A\\┴	σO╚╪≥e╦╒╪÷σeï■+Pö\rû╦ì╛₧╦fD¡\\ X\'w°\n«dòτ\'Fφîε∩ÉayòÇTTTT╝█≡╦╧₧FêO~>+ ┐ⁿ■Sjª~┌î≈!>)°É├,:t)ƒ}sAε┘ªí╛^⌡+x⌐8ûèCê≈∞dφLF∙{	^_8▀▐u╛╡τ╝¥y≤ ªû/ë÷c\"║3±Hù\"d┤╓áÉ≡I╤s╗òτ▓▒\n$╖g┼─2Æ╨lhs\Z.ÉÄæ╗VB╩≤|├≤V3=V≤=åmI [Ä▀M./∩m╩─p/êW\Z∙KëTÉwδàÇ²ƒ╞%¼²3≈┤))■)┼v(╠Sj▌╜}[ï}K¡k⌐d╚╦t(\r\neτ╨╨±(≡╪h₧▌5ë╟└█\\░½+«	ò÷ÅΓ£]≈Z	7Z■5╧Æ>¿XKyQS╡N╥╟k6╟ìÄ┘äû cIeΓp\n╪░IU>**⌐¿¿¿╕+(τï│	}ñ5√┴F<æ`{7σëW▒ñà\'12öτû⌐w(º≤╛¥║┤j∙ÜD╦\Z┬ç@╜~ò╬°≥¡L>n9┤û╔╟╠öëèû√/σ╢¬╣G:∩╪Kæ\Z,\r╗<ß╩!Γ±ΦR╛⌠jΩMΘ*╙▒Ñ¼δ\'a╣╪┐╧ù;UrKH½─├J%ñ≡êY&²Pπ╛OK%o%&ºK~╦¥W&ëWR⌠²zñ┐K	£xΩä`B÷Z⌠╕RTï~\nT»X<Rn├rêGèbùù╪╢Fδ█bUíXW.·┘Z¡┌°wI╥é6Γpç9┘║√╧ ?√£αÖ╘²∙]╣«½²5ñóÉèèèè╗┴\'? µ┌┘V╣°äπ║░∩╬┬±Σασráòë∙╦t<V<²$¢░^0¼^cö▐┴▐╣≤Vr╛│∩|s^φ▓|V┌«┌!C∙╨╚Ö+╤╣Ö\"╤)Râbâ▄±╪╦e█«T[í╧)~gkñ~LN╩S╗╠V«ºjâ7dx╡δ╩╚Ü╫cE∙╖ZòLô▐£ƒì≡%─Q┬╠≥$/σa╞Ñ.eéé{Σσ»)±╩t?╝~≤½▒ÉE:╖√M■∞ë¼ocó3▀\0\0 \0IDAT╝ÅR₧¼-<SJ┤₧ì█σ[Ñ▄╠(û╩E╛░▀*+╤EC∞-╫<µ╥úZÉ«╘TÅ\n=:┌¥Gü3δ⌡╝╓\'╖¡√ÑF$b⌡╗╨φ{»┼¿┘iàdX├F>▒·Σ├╫│·╕6Sì\rKz&PùΣ:ìtâ\ZHXQ	HEEE┼╜π ╜÷|p ≥cÉ>¥Φ─tl╘Nπ3n_║îHç╞Å\rπcW«Z║å½ⁿa┘B┴¢¥≤[{╬7÷£7c~ΓV3c⌐|°jK╥py╒▓┬q#-ê╤Haå╠h█H└qOñö[▒║bódc║ò└┬╛={Z╩δI9£0½%9PΣΣ╘Éóz)∞e╦Ds+D╟╠0╦µùLå,{k<σ─4ìΦZπ⌡.±m7╜ⁿë÷╞⌡zd?X▄╟┘i3αí\"(\Z┘O±0âêXjí+α/╟╩qà¼d(?╫╖ä╢F═æ[é¡æ╫\"¢┬╤f┼B½▀╗├X┴!\ZG_@≈⌠╜:LO╣¢⌡û?g	▒ÅΦu\ZoE% ╟╞7^╪A└╒_╦⌡Θº?tv∞╖ÆxÅñ≈9\\ε<W4╣	%g╒H>î╘═╢╤8\Zwδ*πoùÖµC╦╓°╫~R╓┬¥¢	╛│p╛╛τ╝╝ÇN0▒L>ªª╒─∩5b╩äbµë¡┤ &c▀\'╕¼i1OÖB%w:£PªbàÆ─~;├╩╦δ5r░íF*-c╢╣l┌ñîî~∩╒æí≥¼|¿≈íö┼mà|⌡#öÉE+\rkÖWòx0╤╡Γ█¥±5Oz╡ΘG,0o²T&╢[■▐╚╟╚½æ║ƒ1▄)Å|≤öZ╣7╦åC▄3o]>╘0r╡Æ┌eî:DKΣq┴5≈₧ ≡8\Z⌠z»E<&t-∙\\e╣SÉ┐ô½╓∞U┼ΓÇαEàÆΦ│tihs╣.╞Åü┤╢▄φòÅ╒=║▌r║=}Xyⁿ╬╩╟:╘Γl╗3╜u²V╡ƒWTRQQQq»P│{±\\c÷!ô¥δô╬;/úz∩╟Φ≥ºÅN▌qÄùVª\rì█∙9#ú»GnD°µ╛≤¡}τò.Wl[n╜j\n»Åucv_\"4└)\"b┴qAöP╙dRÉ\nòè]\'L!!Σ	Y&,e{à£Ñ┴╗î∙rsBJ╕└dÑF╖m┼║M╔¢»O≈Σú≈|hD▓╩zâ\níä₧äPvRÖuiÿαò£«_¢è/╣∙⌡╚>Ωºß\'«\\¿(èW╦∩c┼óƒ ╡\\.gZîòìrT▓\r>φσ╢û\nE u4≥}≤Qì╛=.╗ÄPê▀Q╡8íwε╢┐sτ²<ß▌)εYαO■ìù_╛∙\"5ñóÉèèèèπß┌»¡vµq▐ßÇ≈╪ε╚ìαxB$╧│≡┬┴R╜Φ╜Ko╟hl╘╧CεG(ª≡¢^YΣ╢½ù:g╧E3°>4X¡√vñ╒b⌐ⁿ&òΩ═┘RÅ∞º{╔Éª\ZB;Ω4O^fjf%─!σ·╛\'½ENΘA│\\¬║º¼N╕ÄOB<ìö/¥√Y∙04x?L┬éí╨á&dΓaÖêΣÑ¥ΣÑ<r╟≤φ¡\0_₧ëq0°|ßâα├_ⁿΓ≈a╕∙S┘ù3 \'▓>¡\'] Iô╘ΣHr│V9├bá▀ε.áuh\n[D^ïiBJO\0W│FE<Ät╡Éë▐k1║JÄ┘1─└÷╨µ╕r╕o╢9T.F₧ú\"Jf╓0┐m⌠¼MïMÅa4ö82ü9¬bß|▒G]╧°±;\r▄=╛≥1Zj╕£Θ▒* òÇTTTT▄+║┤p▐ù£╟ôh╦(Wók≡D⌠═ß+\'fW±Ä>dp£|.∩/µ;¢╥2╡τ≡Ω┬yqæ╔╟n*╙«┤e╠εr╘▓&ÆVKÄ~SÖ╝É8¥÷╕┼^jHí!┤φ₧¿<FÆºí∞¢bp\r╫£╡^/%ìÆ |DBûô¬\\½═\'δ\r.╜τcÿràùû½B:D1¢[&mMô	HOBb╫=÷■/	ε▀5∙&!~íQ╖:a└½g÷h∞å9Γr!	ìαÜ├%-#ozΓp╕\\ε,Ä■ì▐&+}┼╝\r╠╡:jU▒╚ç╬╓&⌐a╙=~ä·≡E─â⌡Qδ>¡G╟·p∩a?·╧╠¢╢z@**⌐¿¿¿╕√Zδw^α·[{;_èΘaë\'ô≤pτ·⌠░öçA-GΦÄè⌡l└W▀ΦYzBL\":∞ôìµ▀^8/-£[)▀≤\03[Äσ╡Qα▐╥ƒQè√\rMsS=lyiƒ[:fk5ΓbOYà1£EiÖW╩#¿TÅa╞≡╚π2┤╬ù─⌠<╡¬⌠╪KCΓ└Jëº±┤½╒V½╒Cå├ÜÇ┌6É₧äX┐ô╟E$&ä\'╠╜3ⁿ╗é/∙W■┼δ/Ä?τwè≥ß╖■x~+µΘ▐J╨æW#] )S÷Px	çi]4Eer4*n5╦#Æ╢äσ⌡æÿ¥╗╧Σ<	<ΩM▌O¬╨s╧┬á4₧(≈≈╦=ü┤u(┘Äï±ß¬╒π╖ƒJO▐╥gß\r▀:Pä√ZMεE¥╤å\r∙mè∙ú⌐G#	\'⌐X▄²4½╗%D+≤Ω<w:▐╕▒╗Uª_	HEEEE┼φ≡╧_╜1δñç]║f╥ç¥²8ÿF>≈⌡åìegòX⌠/?ⁿ«<ε╓ï▒:√K£╖:τÑ^\\87Æÿ1+úvs╩yQX5¼»+δg■^ÑÖ╩ü∩n▒/╟\'s\Z┬$╫⌐.çñΘz?å<+	dY	╔¢h≤ú∩╩╩ÅÑR .ïO·╟╡ⁿ╡∩╪╔─j≡zd╠░░ªüIφdI@┌&╦2╤±┤╚ƒIî(E⌐kßs.■▒╨╖▐╤ñ≈Σδ│mαΓê<Z~\Z╝S▓Bq) ε\r┘¿}⌐|$}«à╣╪╠GSñz%CúC,pPß╪ÿkq╗yLÄ^i⌡ª⌡:≈(∩▌âV6ÄCFNè╘▄╦zÄ─÷$╒¥#Θδ_Sç0╢èJ@*****£J_(g═_╦?oσ+╢W$]5Θlτ┘£▌╣ù▄Å<Gg⌐éhy:R▀c«<\'¼╒@▐τù╟\rK╥∙½╝╝p▐è╣│Θö┴▄≥Ñkcp8xLX⌠¡_╨╥ì╦■Y╔╬ÿÆHqƒ`óK-ÿè)=Æ≥kΩ2	I┼ô▓Φ╫Ö|╔zzòg╪ª\n	ΘëG▀Ö╡£b╡▒,)ä╩╞?{ΓaY⌡░ªAô	⌠╖^²hÜÆ≥▒Çöñ▒±ö0O▀iΣ┐ε≥_Mëù√═╜±πº\0τ╠/▄▌4^┐⌡╟31█·╦\'SèÄöÅ⌠µ55Mπfñáâ▒{∙Éq5.╡┘cA4╨ßÜπ■Φaû¡QO\nñ╝ ⌐├ÖOJ<£	ê\Z£º│±f]δ┘┘╜\0ß»╗│û≤ΓE¬É╞╣┌╜╥╕╡:╖ZC@╬qï±┐u¢\"~¥σ▄ï≥q₧Ä├╢Θç╝F▌a¢▄a¥Gyìûküwµ7n.Ä│íèJ@****╛▀╚zá-─cÅ\0\rZf~ñ±┐┘Vu░▄╬ç╤╝\ZH╔áö(°√╬╨z⌡f╠E°╠─D¼ÆÅ;L╜║φl£2▒KΣ╤╝ô╕ v╗$â╘NI╓ ¢ÆéH{┬╗)F:O├:╞¬┼╩ï/wÄ¢°{-Gì╦═╒}+úuü╨τ{4\ríi░I╗J>&ô¼éäÉƒ╝Φ≡╕▌é&.▐Ñ╬πK╤╙τΘ3₧÷┐░{δµ¢\'Y▌╟*j\\+ïs=/=▐òe«ò█∙≥X,7 φ\0│æ╚╢S₧╫W·ÄVï~┌╘î;Tæ+φR╥rä▓▄;v▌~ñ/Φ▒Φ▌≈I═{£⌐X\':╢δΓ=2Öo5ß6░óÉèèèèèòS⌠»»■n╞╢τTΣçæ7>\"⌐W0|╡\r½OΦ»∙ÄτΘ⌠^Å╨ôÉ≥╕ñ╝>ç]ç7:τ╡╬┘u▒Sé¢R=ÄòÅM╔Θ░ô;║═x»·	º┴æG≈êQ,Ü@\rI\rQ╣Gº1∞)ÆH┼2┌N▀x#ó╞i«~Æ╒α≥╚?GW╘ç╓+f\"⌠╩G╙Σ█dÆ╔╟lèOº╨N▓ñi≤Θ:êIt┤╪Gq⌐{#æ>ƒ<²r≡ε7O²╥═σΦ]w╬▄c`ΓX▒≡δ▄ìù|	m)∞G[─p╡.à|H@½∞╜{-µ╕?<ß≡öαR╓2)ƒzfê╟O\0O!o╞í|╘º±ºΓkÅ╗XUσ╬ùA¢Φ¡»LûZQ▀V▐(m╪#6«∩≡║⌡(è┼φε┐¥Bp\'┼▌0¿ô≥tàD└▌M┼Γ.^πa»╦τêKgïdwxa¢6TIJ% \0A╛]╫(║Üq≥y_s√╪2:ô÷╖q≈╚°■@▀éòïyL∞\'τ⌡╬y╡svï┐óòÿXÖt╒ô-═τπSw(¥6û?gΩt{∞φö╪LëmKÆ╤Y ┌i▒└S$ªX╝-e]╔q╙╩δδ▌╠ªh8É:iñiÿè%	ò@┴îªx=¼m3╤ÿL`:àΘ, £L 4â≥┴~{╗h∩÷ë▌\"z┐Äºƒ╓²|≡²o≈√≡/ º É½/■æâù°∩\rº╚\nDG÷T<╩¬\"╔\n├5£≤ΦαrZèkM1l∩Σ¢Oïb5.╥Ry¢╖╚ΩE│¼W?≈├ÜÇV:î£├8╞╣▀)╡πaE√Qè∩√⌡:⌠Çƒwº⌡▄»⌡µ╙ö<╜≥╩\r▌ådêâû╣:╢╖Éèèèèèßδ∞Ç?ΓΦb┬├r∞«ΣLΦ╦█h¿CΩ╨╫╖╤-yn┐z+┴⌡öâ█2Ä╫╓╥	¢thëáâUÑ╩zr½┤$öhß£╬îZRΦ4a!ΦLÖäDσ╖#à╟▌O╦@▓D&\Zº)h9p7KCÜy░L<Bä╢═ΣcR╚╟dèO\'0¥ívÆ=╚Θ:┤Xê╜]tδ∞∩ßï²δ⌐δ■uZt┐ó╕ ΘΘ/▌ⁿ▄╕x·²∞▓jzδÅÿBh1k]2ßδσÆτ0x5B-╨H*╩å;¿+	╨O┐$XÇµ└╙Σ1┤╜Z╤óP\rΣV¿º╔²≤²P¬╤¿ΓR¡-√£å¡«jK#≡╪!íC=δφoδÆ┘(à[ç▒6¬o+ ÷\rÅm<B²┐╢ⁿQ\nδπzCαpàΣ(u≥╜Lí║ôºπNl≡~N┼║╙zhü-wª╖v;╗├ë█XQ	HEEE┼╗\n╬îµ£*mgSZÑ·3Ωα ╨µ⌐X}aW:öV<!^|$Vµ¥Fw║Σt#▓╥╖{YYv¿H╡$▒</ñB\ZD█O¢Ü╤bÅÇπφ&SbXä)√!░░@╖XαqAL▒°êU≥£\n▀╪è} ┘┐\"$C&lE⌡hÜÉ²c╒c2]¬ô╢d}8,pδ▄╕7«π╖n└ì¢{▄┌√è]┐⌡┐ª»▀ⁿ√ΘE~C╖ºj█Wò²g8ΘÆò±ê├U9╫p╬bÆ╩║ë▓ó╤w┘⌡▐Fs\n\Z─ε3û╙ó┌σ╖Ö0Φ╕╡Γâíτ▄╜bp╡τI)╟iO:εz▀╬⌡ΦüεÅñ├ƒªG&mç,╝ëä@m┐¬ñóóóóóαc│╣╥■)α┤{.$╙║╥Q\n∩─É¿L\ZùÉε½uúû╤ ╣í?g\\dΓ┴@<┤F>z│╗ΣàäΣφÖ|p├h0Ωz╜:ªQjz⌐~sΦßH±Dô_¡╟ ╡┌h╒░/╪7╤-Dèñê{\"ûWεjLµsì╔çA╚7àÇΓÜèH[Lµ╙	>Ö┬téÜ2j7%╪▀G╗╗Γ·u╕y÷n@┌┐ß╜∞≤┘╫∞C╛:√O╛Æ~°Θ╙▌┼½[╞ì⌐÷÷█╝;╩¬ä√6εO\0OO:\\(	\'╦Å╤ëêm┴c8O\"₧\ZΦBÖ*&∙ΦσÄt	_z]ûƒ╧Zv\ne8ÖâΣ¢ú╝╡«Ll╛J«⌡Y╚ç╓u≈¿<[∙8¬ùâ#ε∩aδ<εδ>ΩzNJ∙8εp¿█¡τN\n╔I+¢=&^&(cqfoo⌐ÇHåñ▌I	⌐dñÉèèèè∩O°∩╗▄∞╜╡8m7u┌ôO≡┤T/·╦πë═╛8Σ╥^Q2·)XVGW╬└╤3!h╩i9òd»ΦK║ìªg⌡\nC≥Ñ?äφ9½⌡a?ε7ΓJ«╚░»╜a8%X∞#w┌╪1m\'xhëôå²&░╫6∞w║EGè]6¿√R8H)ëh∙▓ú▄rσ2É!ñÆδA╙áªAmï┌fI>·[╙Σ╒EH√░┐Ç╜[p≤&╝⌡╛╖±²δlào≤°à▀╘│Å|ïÅ^y.=~ε²▐╪₧»╧p¥gupYâ┤M±Z¿(+LMâÑe▒═x¬±ü╥N¢█¥#╘ú≈M╒8io├â⌠|▄ïºπ~¼τ¿∩╧qε┐╫⌡£Láαë}b╔╙W╛≥J ç└f│û[╖ç} ╬≈╧x▓J@****╛p╖g▌|\"∞b═OYa┌^ç╛╒╚ù≤K√√┘@Få√FWä}	ΘX*\"ìDSjαΦ╩╤┬╡V27|H à«ùìÄú9F X	.┤o╘¿îvç╤\"!O▓7äªe┌S∞¢╪7úδî;R╩╦÷⌐ùT%CV│Ç[ Y└¡┴-αí╔cu-îI1B∞ FX∞├▐n& √╗`√pJ╬Θ¥WNφδÅφ±▒ks▀Ü|╙%Å$▀₧╬≥╔╥k1N▀ε?&1Üφ┤ë╠∙º▓q¬╙è\n\"▀p0Äƒr╥╙íε5≈ΓÅ»Gæ⌠\n╟æö╕│┬pBpR	σ\'í|▄Θ⌡┴╔*╟ML┐σπNV╦▒¡UâÅ;═│╧>|\nx╖n-╥>╚JB*⌐¿¿¿°₧ü▀!ΘRúΣ[s£fEqX#╜ ce├╛FD┤zûφcÆk≡vù)à<Ü╖ƒ╝5┬bÑφE#\"▒2±Φºuvº32<;⌐δê╔s╛F╙2m[f!α¡█ûE\n∞w\rïÿΦb$╞∞\r╤PΦτ $î(├╩/ô░≥┐N┘b₧C╗Lf√àu┘≤▒╖√{░╪╟gBW╢ß±3╞{/ε≡╪┘G╣╝sÜ∙$\nNô|V╕cK?ó╒╔d╦╢Å J/┘]╘moWmu╥\rm&≈²Ü└;⌡Z┼Q╫sRè┼;A∙╕≤@Γ▄G?zσ=∞Å²≡▐▀∙;ƒ┐±═o╛╣w6y╗▀+*⌐¿¿¿xGC\'┤\\>╞Æ√\\yJQƒ]3Ykâó∩Θ±5σπ Y╔SÄ|»g<Ö¬W1╞Σd╜╚\r╓π≤÷¥├▀·mh╙╣^½W░╜╖ö1%HïæÉ\"φñ┼┌fhÑZÿX──~11&▄╙á*HÖpä≥3ô%&{Oöbæâ─>.>ß)Bè9û¥╙█]£;∩╜ê▐{╤x▀σù╢g$?╖b╓┐₧>ÑERVsS|σ▒⌡ó[+ös╙¢}\'Γ>{4Ä╜]ß[±áöÅ█-ö≈√v»k╜1εφR>Ä½Xê{≈ÿW∙╕K▀Ä╪Ü╧█ç₧²≡#▀ⁿ╣S bùâ└oG6¬ñÉèèèè∩9rrΣ¬kcXDƒ3ôç⌡+µ~ä▄╞Γ╦z┐7¢≈πp√\Z.ö║.:─nkîfC¡q█δô¢jô╤÷╓_YWiUèεC\"zù:┌E`╥ÜÿX@AxHnt╔ë)æÆô|i¬Φ≤Lé£å─╘¥IL4D,	δ\n≡ö═µ]ù≈&\0█\r£ƒ┴C█p⌡4\\9WN├┼m85]ïñ┐▌ß╟<tεf=G▌╬╗╠úq▀òÅô≡tE¬·^S>tƒ |æ╢$|o╖ï»┐~╦≈≈π╕█s9▄ßp#z%òÇTTTT╝+H┼Qε?∞rτß$╣EgBN⌐╬1╛6^ù±,V<!¢╟8}╜\\╥Φ∙=█i┤$ ïbH≈ó└¼^⌐_:ÑÑ╒$δ5ç\\╫(┌Z┬╡╓╥\"▄I)ây\"àbÇ&0mÜÆßæ╟δ&A2#y! ├ä/σ⌡7JLL┤┴1K╚JfêXNïRÖΘ╗╒ατµpσ4z⌠,<y>%N╧á\rÖÑ┼─╩ñ\r╣w╠a╪t(╫[q╗\"∙8δ╣_╙íÄ╚╔╦±xα╩╟▌z:8d;▄σvεñá└╔+q=w≥ÿ▄ï≥q,%Ñ	┴╢╢╖º│¼∩╡╡k2¬$ñÉèèèèw#Ä█Op¼yCeNk₧T█╧Z=ñhX╔\0±═>æí∞⌡├▀\'╚S▒R▐┬╘J╘à;{q¡ijj8&tm«∩è▐¡σ╙⌡f≥■u,óSd?&÷║HkFî╞J╗òô`X╨@ô≥$┌B╖é░╞P\n∙Lσ¡┴¼╔j╟⌐	£¥┴┘9£¥íss8╗ºf░3╔╦YnÑ⌡▌µE⌡░9¬≥q»o≥²T>t╠»╙I_A╗<\"z@»≈A+\'Ñ┤▄▀╧├Lg╬£₧=⌡₧º.|δ∞Ö┘ï²▌+WKû≈Ñ█░¿èJ@****▐vºb╝╙∙Äg╓öâ=╧¬╥(┼bs)3Σ=p░]~σ■H8÷kï·h─ε─DL╬\"┴\"┴~Ω√╦ëπΣq/ªs▌╣+h├~x]>R>4\Z.;6O@Q7╤íKëàDcó51ikf\rm≈;╚H²╧ª┴╧Mα⌠ƒ╖0\r╨\Z╠[8=üss╕┤ì╬oσ∩La┌éσ,/!)\Z_ë▀ÉΦ}8g╜▀▐è;¡τ^º^q╫╖Θe╝S<▄σvO¬╪^»Ñ█τôP,√¼t╥∙╤╓#i½m¢K█[╙│ô64ú\'⌡äπ░Xw\0,╜óÉèèèè#ôτ°².Gn╖┌≡<_α)µ@≥N9φzeEπÄÑ▒▓▒╔~pX>∞XÅ%Z¢ÆN▐▓▌╣ò╝¿\n²╕]▌╛¡Ω⌡╒íoε<φ*√┌╫í╤ÅÄc(Aph▌±T≥ⁿ·╜⌐[N7≡▐≤≡₧ï≡╨N&É═0¡┴$dòc┌└ñü&⌠╠g├¢}╩╟¥G?Γß⌠=V3⌡c█NΣZ┴Qù╗<≈√Ü╔I)∩,σc|¼xrïñ²EΩ≤N{─8$\"ºóÉèèèèw*9╩Ö}¥+PÆx7æÜMdEÇ┐·¥▒=;█sl▀ ┘ªòk£0╛l┴ZY╣F@è─╫<#C┬yV\Zá┼Θ\\∞Ñ<-jó<¬6/╛LB▄┘f╚┌;┐│úñuz╟ΦM╙2_ñƒvò∩╦╙¡ê₧\'Xyq╦$çE─αæx Ex∞ÜOù∩ûù)\\^╘¥■KƒZ┘╓x ▐~┼ε.wπ~Oç:µ·|≤τ≡≈πNò:╬δ9Äºπ^ö╗¥zuº╧÷^╝!:Θ£█∞≈╤ëëâ╟Σi▒ê▐u▒7á█┌╡ÿx	╣╙XQ	HEEE┼}\'\ZG╣O╖!┤¡Ié²²┤ë$÷R$ÇÅ|┘» ú╔¡╫f∩i▀┤Y╗ö»≥≈co╡ü⌡ñ╡3τÿîîòÆßço╬╔╧ó≡ÿö╤╣σYÉ`¬L<·ß▓IKººtxi╕⌐sd╪╢ùÄVY▌┌{α`&ÜΓ∙ÿ1\rb\"\'ñδòÅ±╞J»Ö[Äb∩}!A╪└r¼├ΘA*\'Ñ┤¢▐σ■q}o½≥qö⌡₧öé┬}z¥wsàx²≈é╗┐▄▌╗.∙■~⌠]k╫nt╚ƒöJ8*⌐¿¿¿x█╬╥2╦à~î~╗╩aS÷ªKáZ,·JûµG~°æv6\r╢╗█∙σK≤pσæφv2\rè╔Ytë╪%¥{ΓL|÷ôº≈}∙;ºτ_°╬σµ╦»φ°δ√;/a^24n▀█╒O╟BZô1!ö?áÜ¼ºQ&7√)≈ä▌è²%EaVB√)]Z#┼Só#0╕â¡Uú╟▄72╝^∙ZÆÅYô	╚ñOpL1¢─Θ¡%ZU4J╦å)\'¥\'&YΘ└^·!o·█¡X└φ»$√┐\"≈ΓIßêδ╗ìRq∞╝Åúε ╜*╟U\\8\"ë╣╫⌐W~╥t┐Æ╬O\"∩π~∙c╘åá¡vb3▓C╚ªk8w:ÿ+*⌐¿¿¿╕#Äôt6<vµ⌠Dε╬δo∞f¢╕δ┐ü≡?z Ñ¥¡0╜±╓^║reτ∞Co_iZ¢┼Σ)%Oε°╬┘╔Θ3gªàº╢Oº╕┤ß_╜7~·ºπ+╗Ñ-Ω`ì░╥nσçdé°j`!:HJ╪≡£a\\î▓▌┘ì∙yV╠±[&í√ª2Fº÷«\Z▀7√[6²½9╦┌h═ÿú┤rÜÿ0Å╣U╩ù┴Ω+AIΦ╗▓Äw╕╝ôï╖╦r╖S»NZ∙8¼(╛╟φƒê≥q»ƒφQ╖╟	φ≈▌,≈╬B:╜╡▌>~÷∞ⁿí┘¼i╓»Y░jH?vÆ∩+*⌐¿¿xÇx█╬Lô6τ=t¥v9Æ±≡╡╫≈ámÜ≡_ Wƒ│Y╨k»φq∙ßY╕ti┌ék≈V╘■~dæÿLB3¥5M╫%█▌ì\nª0i¡XL╬═¢1φφE₧yµ∞σ+Ål?a╞|▒▀┼┘¼╣╕╡╒>aªφ¥╗Gƒ╠Üïm╨Ü╖█║╝¥⌠╪Ö╙÷∙ù╢»∩Æc╜kCKä6ö>^▓▓}¼p╥^ƒ╩âz─J╒▐╧╫jsä:{)Åσ╜ÑÑ\Z╙O█â«▓d╜Æ▓⌐u╩½=√ƒ#σC⌠mhÖà2±jîëëëAâc⌐$ÜºDΩSì╔╨*Sst¢÷A(G⌡å£T▐╟&zwö┬≈q}π╒¬ßⁿ╪S»╕═~▄ìbq/^¥{I:?∞3>ε~▀Θ°Çô≈åΦäNw≈^Öi▐╢ßΓt╬ä`ßó█£jKV% ∩2▄ì╜°Dp∙≥\\╗╗æù_┘Mw▒Åε[t¥ ─∩~ⁿr█╪Σ╓nèg╬█∙¡m╗è√¼[xè1yLë╨äsM«║√ñδ<q╛	vÿ╣τíLÑ√g&q╩¥ÉÆ╗─╘L;@3ö├.éi¬─ªåiδ:=m┬vÜ╓h║8îs┘t&5-¥òδ╫≥ⁿÉ)Y├}Z]n╝è±eB├iε╬ìÿ╚-╓┘▀9\rZ█_S:6ûc~≡\0YQ@|⌡~öºp5#»Gcóíƒ.=\'ƒ¢;&_]g1└╗âe2xú$¿;╡ä┐¥è┼Iµ}£D■ä▀┐»÷}KÄ╞╘╗\0\0 \0IDAT:┐W┼Γ¥6δ8√}£²|╨y\'|rRr∩bτ)╞┤nBOln├z\0vE% ▀╗╨╗e BPI╡╛-i9¼ü∙\0╛±═pΘΓ,ⁿ⌐ƒⁿH3ƒφ∩\'∞╤φp∙╥╝i\Zô╗╝┐É\Z\ZBh╘Ä.░O┤]ùΣ?┤²╨÷v√ö╨4&∩B╦CM├ôεl╖Mè)YJ	d║d┴₧t≈Y█x\'t╔LW╘≤├═G?╦≈ò╤X\Z.ºö_v\nåµ-vjB3k╝▌O4√Ic╚╥1:ú·mx╫åû½2╧isr║≈gl\rK9╤┼óîómz%ñD\'åRDÜ⌠å╢g╦zΣ⌡POzzòE4╩¡¡Adâyîñ▐δQöíP┬{Γ$_«╦}Xojlu@τ=y:ε⌠u╝┼Γ(█;╩zÄ;%Ωv√∩\'░╛Cû;▒╝Åú╛?≈ΩΘ8εt▒π^╦╤1?ç⌡╟7φ╧²≡åσ5▐iεφt&L63S█Gùr{╚ªk$G²2TTRQQ┴█¿@w╬O┘▌ì╝∙╓┬∩ß5└K/∩≥o■▐╟.╖¡51z<╡╙^ÿ╬∞¬dSwE \n└╕Çⁿ*ó:í&«ü&@─Ö9£ráΣ0╟²ö;ì╔R%ük∞8ä│=≤ΣâÅy(ΓZ¥|I@╝,Σ.Æsß┴p£0	ä│SÜ3S&7;Z┼<╫ \0╞╜╖╗íú%ºÅ∩≈ó\"ÿ£╞3ë╝YöÉêÿ1│▓v√ú┬∩≡⌐≈¬Ä⌡ñ#d╥╤¿┤fÑHùRûÿRb╝╣ü°öu╕/\'t·äwH╓┬$Σ∩⌐∞x╨\n╔q╓s7δ:qs≡■é▌»╝Å{Q,εµ}|ÉS»▐)▐Éw╞⌡▓l{6π▒φφ╔σΘ44k▐zí╓╚çSëG% ∩BΦ{} B)² ∞╜YÅ-KÜ%┤>3w▀≤Ä∙D─Ö╧≥▐¢s╓ÉòUY╒]¥]╒U▌jÉ¿åPï@≡é─▀ßàƒ└à@HHíå╖¬ªÑ49▀╝≤tå÷▐ε÷±αô∙<Ö√▐q╬v)N£êφan>Ö┘·╓╖╛Θ\nΩ╘Ö²>√ⁿûα▌╖Σ≤_╟R\n⌠Γ┼\nÅ═Σσσ╘ÜL,XR≡zú░Zy4¥H9¢I+LùûÉR\n+\\¡l\\σ.εM.gSδlf╕R╥Ñ⌠îê&r┴Aû±ê₧p|\0é\"║^ªê▒µ%┐¬T2Hq·AàWb≥¥╣²δúYHpéÉ√s²j╪Æ\0ä#ü├	─rDú╧»ß êµ#┼~p▒\"!ΘòGàδ>Σ$ÖÉ╨⌠Å╪gBT└ää╛|èXÇ═■└∩	\n¥G\nÅâ░┬WP╬7╘yHè+⌠a╫≤á<äµ\"≥ αá<p¼ü╤»â$ H)αYÄcAå)Xàb⌠>4UφöφG\r_╗╛¥┴╣Στ¬¬W%╧ºq┐Å.≈╡═ui:⌠6╜EÄΦMï▓╧w╧Θ╝╗·úIAÆΣ─qΣ╥▓ñHìóâ╩ué{]╚Ç∞╖²╢╙█╢ô!⌐╥\\Æ├CWW.no=U06┌^~E⌠∩²╙\'τ ╚⌡╩Uçç÷Θd*∩Σ0ô╟fHëS!q?K<!ΦDH± b,@íTaJäàΘÜ°?ô@┼ÜlÜ\0■~>\\á	kσñZê\0(ä└+@°;NñZàƒ3çLº╥░Æα#$ßÜ+t\'`$íÄ&áσcK`zoäáC╙9 5╙û*\ZX≤	Ñ▒ë¬X)²ê«═─áα╫╩i\näì îÑ└êûê╕èù@¡7eñ≤≡S«dÉF┼Ja═\n╩c0╠G≡wB╗Ä\"H\'c≥æ₧\0iS┴Y≡&¼æ⌠╬ë╝6]¬P⌡σπA[\ZN¬┌█╢▀G▐B╛∞~φJ╒½ª≈f09╖4d╙U»╥├d^╛=╪╪É²╢▀vqd█╣■╢+Ddü╨dPσó┘⌡╦/WÇ▐z:╖■├┐yj	╕π²o╩╟Åf ║╜⌡áâÅÑìÑ╥│Ö%g3[z₧≥@Dùτ╙√╙ë⌡Ç¡öφY▌ù=c╠L«.@D|Iäg@É2%ΦRq╤⌠▓r┬█!4▄#]≈─╤82∞NÅ$└╨üI⌠s╚|}«8╦8hƒñPÉûä▓%▄â¼σû#ß└Va╨+aσ═ñëÉ^╒·ù≤╘9ßüÉ╚y£A─√▒V1┬`░ îéNRΦ┴yàΦ.ñ[∙┌\r\0tF1├⌡<OA)▄7÷»U└h░^D)Γ«B¥K▄û\r@æÇ7╢ß═`l╟εèÑ»\nU╝.U╠╫lφö⌡⌐-S╨╡jS▌╧ç≥√¿úΘ¿ΩmH╙δ╫U█╥╞í╝Φⁿ∩≤í/H»|┴÷TÇê\0Rä&≈@d@÷█~k1\rNL&[s├╛ù═:ÿ╧m\\]╣≡<V⌐Pùk╩ùg√?√O▀=ç`▒┘(>>ƒM\'÷Ñ/ⁿâ╦E\0	ïNÑñ√≡S∩=!ΦLJ║	>c1Gñ÷ådƒ╒fÜ\Z│Aÿ╓δ6iδJ\0}±Σ√f$Ym▀8╒\nJqñ±┐Uû\"└O╖.Ü├÷êÇ%░ü#_\"	#\0N(τéçæ≥gT╬∙<¡╤»á╥«Å■&╩╔ìJ\n┴éoZ╚╠≡┴òäæ (≥╫∙~i^÷Ö\r\nÇG╚vDîçδ∙@├S~e+ÿ╔3√└CäáéπsóP≡╬╛c÷╘├ƒ3<Ipg╘bL╟╩≡7a$LU│2Θπ▒mµúµy∞²>z║C1(╗≥|QΓ╢0á╛■·╞\Z!H(┼M╩±▐ò└µ~█É²å=alµO1M╧\'\ZL_╝╪\0\0╜⌡la²═┐ XJïαyîw▐Z╚ïïëöÆ╚uδ╡éδ),ù╢£╧-╦≤\0╫e\ZÅÑÅÑD─╠|╗≥<█Γ┘╙∙²┼▄~\n@zèò%┼)┼3\"rê░A╚\\▄\'_k!xDt_:»sfTπ2r@TΘ▄(║╞ò9╘wΦ@ä)J9R┼⌐Uß∩= ▐Å╠lü÷│T╥ò▒ⁿ╛S╨°±{xµÇû#¿Ö\r9Æÿ¼╓è▒a`úΘ?tMên╪Ü≡%@\'AH·▓┼@,╓RΣºφS\"£H@P lbßêÄ1ïé -K√2├G¼A╬ùåº|≡\n81#1Pî╧ôú{L£ßΘnÿí┴¢ÅÇâ1hb√U░<Nëa·¿BU┤_Y╡ó:±ò╢\Zì╢τçåφΩ7a>╕πP█╖▀GU;ªÿÅ4\0úè╢Ü2\rmö▌`>2φT» ▓┐⌡εΘ⌠∩■■ú\0í{╚O┼j\\▄o{\0▓▀vtk\Z╜7╣°oèóÄ}º>BO│ÖE/_║@Σ╫▄m| φ├Θ┐ⁿÅ▀║éH)µ≤≤╔┘tj]┴≥<V╠■αl;tfYtÉ`&ûÆ╬äá°⌐O^╕û#┬öê\0╚ ╤îêµ╨╨ÿLßk0┬ü|Z■Φt╔╫Fm≡ÿäD└âπ⌠ßê╤P:Kí▒┴w╧K╬\0Åt*W▓iQ║+	Çª6¼├1°d√∙-▀¼αy«|à{«=\nδσÇæ⌠%K▐ªÖá⌠£g╠:\0╥╓Ä~5/Çß)`¡]GO2ö\"xD≡α\né╦ÇTí╓ââja░í╬â\"╢(æ-σ*¼lÑ]âäP≡¼<Eo9é<\ZCî,óå»ªÜ2╘Ä╔íò\r═E≈╔╨ÿ╥tti╟╘⌡Ω¢∙║+φ╘m▀┐Vû-û²W∩?∙⌡o₧▀ⁿ▀ µú½δδMÖ╚~█É²╢úo°]üL═l╡╣yól%í\Z\0ºPk±≥Ñ╦\0Φ▐┘╚■º⌡@╛ ▐╥:=)ê</Nƒ╙QGXπ▒┤ûK[╬ªûdm\\à¢╫Åñ|≈¥âçKτqrFΓímë╟\0Ñ8╘Z!±@zΓ╫`\"êΦ¼▐e¿ò+ûP└\\TE╔è\'ⁿ╚¿╗pAÉ>╥QgN.\rbΓ ▀≤B¡\'X╧ï┴G>≡╚j@Γ╝╔╟@)åτdXÄä╖pα¥Na}âΘ╡ï⌡¡ç+▀┐╨¥\0æ3yΓ⌠¬@H*δÖ╣rPF8╝ÿ?XΦδ┌ÉáQ┼╛\"<2<Åù	σδ?ê97å RäU┤Ñ\\à┌\\D┌ö@ⁿ/(B√Ü%▐╤╓╔Σ╚╠«ì╗Ví¬3}nó*û⌐■╫=ƒ╘╗╠>╞ⁿ>Ω·fT╡W\'ûeÆ∙ΦΩ?Rç⌐¬δ▒╤\'c1\0≤æ┌ñô╦╦σΘⁿ┴├σ ≈≤╧»»»7@~5¼:¥▌o{\0▓▀Z╠█\0\'C2┼½╬v}nzLÇΘ─W╫.!f	┬╧╜.â╪|F÷⌡ƒ┐s±≡ßⁿ■tb¥$òb/ÿαAX╢8╡lqi[t_:Aé#÷äêhµk-(î╧h/dÉ°42ß╣═ÜE√ê■╡┬ä╣√&╜7é%4╟δ░TlZ≈▓^╚nä┌YÅ$╨α{Æ Θ■─e└\nL,╝ëì╒∙⌠σ\r£O«`+╞ê╖D~Θ█Tæ█¬τ╝j│if!¼$òδ!Æjê┤²TΩ╤á°Yâß;àbuW1¼@C*E#í║╓y╡2]πAa^à∩Çé0F£╞τâå½╫.└B`r<ü8Ö∙\0DqO├µ.V┼Ω;~┤MµúΘQv?år:∩[c▓½Zá₧ƒKår]σ▐▐l<Ñ8oh╠${└▒ wnú} z±┌µgV?┼XS╧I· ú}««]\0└╙\'3τ\'?>«╦Σ)╞[Oτ≥Γb\"mï@Σwà ,ûû5¥XQΦu<ûûπH₧╙╒╡δ╬ªû⌡ε█≤╦úú╤│±X>│ñ╕└Γ╨╦┬_╘╣DÉBèK!ΦÖx&t╗-╣wîE|∙ⁿ@9╖lº╖╞ü╘:α#;cÑ┘] ß{|éhöù ■g:≡α£⌠-ÇñÖÉd?\0Ç\\åτ2\\╟┬═╔tr\r{≥5lï0Q+fl<╜o@ÄÑ╬?∩Jr^@2╩<╤╤C╬cN▄╓²⌡╨9&Ä^/╥╣°╫╤# Ké▓╗╛½#%è⌠2D>Éÿk┐ºá7z·û╧«l@x%hΓ`z:âs:⌡╜VB╙ûJµúΩ]Θ╩lT╡╒Uú╤┤ ²C╢╞|┤∙╝.│╤ÑZ╪P\Zô*MGU≡¿cQu╝╛ÿÅd?ë G#Θ,#[\nQö*¥Ä╙∞A╚Ç▄╣m┌r¢]Fÿ╢∞E┘▀ò╥¿╙ëñ½k╨t\r0└Xⁿ⌠\'≈ ╦ Γ▌3╧UP\n⌠°±⌠|╣░╧\0H┼∞▒éb4ûτ╢-εà\'Ñ╕\'ä8\'é\0FÿQ2%┬éêΣW~q░¢┬╡₧\0E~ïnÅpW&bê\Z⌠╘∙MB╙~dtV£b;┬ #Jò╩~«ºb%⌡#e^ aWCß╕╗±╔«\r8Ü\0gSL╟p^«▒╕UpÖq½ÇM└┼║]¿¡PR\r+u▄Σ║üí\'╣Ñ⌡¼aö┤¿=¬öyû B╬0¬\0τ°ΘVñ1ü+:╟îG·\\ⁿsñH¼«ë\0¡Ñ└jb┴>Ü`|▒└⌠lµ╗áçNè╞¬PφbU¼m┼æRαc[╟▀9µú∞zu¡mÅj]V╦ï╦≤∙ô∩≈Γπ∙▄∙⌠ï/»|ìbB╪âÅ=\0yM▐É╫σ8Mê.ß\r¬Mòi-Ωè╧ä∙≡ü╖₧═£|∩Pn6~ÑgOg≥▐╜æ$\"?╖▀cHïpr<Æ│Ö%╫kEW╤|f╦Θ─J1yπ·╞uÅδ{▀=ztx`?╙╪\'∙╪▒┼C,V∞îàeYΓæÉ⌠0╝éB╨#!─▒Ö█π[δ₧T═¬δ╞|╘I⌐Ñ\ZφTG\0ër⌠Öƒ│\"╙4(H0╩_ƒ*Vαê╙¬<ü7º└rò[+┼╧║≥àεû\0&£ú	╓g3î_¡1√≥¢ì┬KAXq∞┼.°≤┤Ö¬X£,LDTΣÆΩ+(⌡ç⌐δM1è⌡úXKÆR⌐C╔É1╤JδΩ`ä╙└âc▀M¥ô╒┴pò┬┌ûP╟S╚ïFº3î#ƒÆQM▒δ╞á┌j:╨▒?u█-j╦≤│lï∙0σπQu]¢h>ÜK·«èE0╟X⌠Ñ!i╫«4¥═£╙╙╙Θr<╢è\0╟╢╨┘~█π╠┼╨\0á∩~╘ U!∩║╣╡Bτúæá█[─╒í┬²<d╦δq╒╠√ ⌠Σ°_■\'╧N7Aè\'O&τ╦àu╩ÇTè=fVBÉO¼s█g∞τ\"	╟ÆτR╥ΓL┐╓°£╚╫M0â∙╒í8^óZ▌Pôuwf÷æε+┌╪╖k«µâ╣▐ò\n╜>╥ΘP▒₧#■┐τ┼α#¡∙≡ƒùvòS┬7dV╥∩╨	1|xâà║ºéê╤Gx⌡≡\0tπb÷jì∙cBäòµ·═9│,QNÄAè±ÅIö]₧▒╢0ßTU¼─ôºk6┬ké╜/∞âΣx░ä√Kmφ¬ÿ2ê╦≥r*éæ.ML>\\»╝Öä|xÇ╔│#8ïQ╝sπ8K█g{h_æ╢├║┴÷^µú(₧5t<╤TU¼╗µ≈╤╕]╓╞s╩Y╖∞A╟Ç∞╞ô:╨HhΓ°m,]√£ì┌É&╟ëf█\0|êGº÷╗∩╠┼zúH┬[Og≥ⁿl,@Q:[╤┴ü-\'K║«?\0═τ╢£Lñ|∙rπ9÷∩²≡≡±╤æ≤@)R`!ºS±╪╢┼ÇÑbx\0╗\0┘û-KICá!àx,6;╡Ω(Y∞kæ▐Ö0_~½≤Q7Z5┤knQdNöZδd┼µß╧öI╟Jâ$\0CRpÄL¬ò ÑΓΩXÜ╜:É├ÇÇ│W!Φ	)_î~u╣Ç⌡rà∙\'/1╛┌`▒6î└;#`A⌠½ñW┴J£.╒╦/┴E╧τ#{╓.8iαCÑQÅ╓\'ªtiîIäê°{ñ5 ñ}╧úQ	>▓QîW\nc╟OÄ0v{jG9xYφÉΘ*Tu█⌐≤yô■ÿb\n┌j.R dp═G╒u∞█╛ε▀uelÜj:εé╙yτvÖÖ=╧S\\b@ê/σ~█ÉA└E╙É╚É\0ñ╬╧M₧&!≡┌τ9\Z	▒Z%ïpK√[É÷√╩ ■┘┘∙┐°₧¼VK)─╖▐Y£╪º╠ááJö\'%YπëÿR\0	╟τûEºa;B`ND╙h∙Aîpä÷╫:Ds\nY\ni?∩~{MD╙·¬@<╘±δ┤█¥)╫½LEτHè═upßÅα½|$ ╧î╠ ≤\0H─~pv)É~\"┬~{₧┬f\rxB`s<às▒└═┘K8+\'/╓╩┼\Z└Ü²¬X*ä)FR?₧g▀ÿ~F	yîH▓│}H>ÆLGz\0a°ΣTZU╠ê0dT╨7O╟BH≈τ╠ÆL0░ßÑea|8┼ⁿφc╜uΣÉî∙`Qñy¬bu}╧åb>┌ª╥≈q|╞░Üc■╨U▒^;µ#Zc(┼εfπ▒τqBù│₧!T╗âε╖=\01:óR╦Q ~╙└τ@ú	7<┐ª98╡Ç╬jÑ\0=x0╢ƒ<₧	╧eXû└πGSyr∞H)ëî═å!╤╔▒#g3K¼╫èöbZ,l9KíΣyî/╓ε╜{cτ Σ╔±▒sΘy¼ê`-µ╓πæ#∩3│D▄«d[=Æ\0>\0▒,z,-M▄\nB╪1[Q\'zU~)c¡E]ìF╙(æë²¢┐m\r·╝c·ü─\0â½Åæ¥╟îG≡s(╤AHΦ∙ß╨æ(	\0ÆH╗╩zpⁿ<i?\'»í≥|\r┘bbπµxéWù,W.µ«╗^└Å⌠ç¼C╚\"P╔║î2 ( ╡ªêƒëç■31\'gφá<░_EÿRmà-╞m░\0ä	L╛⌐!M≤æISîò-▒9c·`ë┼ú,ε═ 	æ÷#?K╚d¬:φ╘ëq═Θ╚S╨░=«8Ω╩╝t⌡═hz}½εk[º≤6²1ÑΘ╕+~▌┌%\"╦▓Σd4▓!H4<X╒╕▀÷\0ñv₧H¢Ew▌╧åb Üåüδ«sÅß8é╓kd½By╚»ΦÖ╓dΦLåⁿ┘ƒƒ₧ ≤v hu5r,δ▌wfK√≥+Ñ╪ôÆ∞∙╠>wlq┬╠\n Θ8Γ┬▓─1é┴L!äX°╠3|M┼\\ª⌡çTP═3`4(¼*5∩7z╙W⌠jα╝mπ8╣nÉZ╝f:(,*▓■⌠wN|Θσtô¼çJ|ΩBÆ)X£,σ¢z≥·û;└ (b▀öOJlf#|≤°╥SX^»▒X╗8å_╪╝6┬t&]à∙¿dpΓ░åbAU┌5=¥µ┼ô╧¼\r	íDü₧#b!êü≈0E│┤╠h>ó÷└X{\nW╫.°╪┬°¥}τªºSX╢<UC,┤kU▒·ô╖G4≡XdJ╙╤öA19µvup∩s╬╪µ╓α>ùJJ▒X,GÅ╬ε-NºSG»┌]╢>▄î=\0iç½▐└ªóτ║o∩P5eí\0)╧¼╫>sq ■╪╛1¢\r├▓ê<ÿ╚úCG\0╛┬╞U░ñG╟ÄÿM-ßyè\0ó┘L╩æ#┼≤∩■σ╪∙ô?>yrr∞£{)Ad-╓S╟ƒ▒`fW\Z9╢|,%]@GZûx\"-≥»N╗6f.ê┌E┐ó╒ïJVE¥╕Γo⌐µc▀7≤╤⌠°u&╬nU▒bφG≥s_╝£¥K8P5╟áâ4≡íòf@É2Dè╤XÅ╨\'D■!\0╤\0IªO⌐╛τ]f▀äà┬╞▒α¥╧1║▌αΩ╙Wp«6Xxk╕₧ç^èá╤x╝@τá0╒╝r=└G∙╛*phµ_ª╩oóöHV╣\n┼τ╤¬üú·Öí┐çn4ÿ═ƒ≡»⌡¡^┴YÄq■■)╬>8┼Σ`ö≤ⁿ4yQsΦφ╥N╙4⌠«╛UφU0Θg╢▓ΩU¥πu╣m5@╗┼~Yl┤\r+Äé▒┤J├╙4■xWⁿ>Ü\'!iΓî¼ôΘ╠Y:Ä╘/ φA╚Çÿ#T\0:èΩ╘QÉ(z0δ╛⌐m¥╡½ÇSε▀╪6ë═å≤ÿêtu(ñ~/R?ΓΩû╬_ⁿú│≤┐°┘∙╤╒òº╞i≡▐Γⁿ≡╨>b≥\\Ñ<Åòe	{╣┤/£æ<\n£╣¡æ#/,ïÄ┬δ/%═àáiÉ⌐!äê|-\"M+∙LF└l╦üy;≡╤6Æ╥à⌐Φúª√δ┬|Uï2ÑY$ÿ]ƒæº²αî╖G▐∩3ετæ╓âs\\╒πτàK<■É│╢≈<^1lG┬ZÄp{6╟ç▄╕8▐xÉ+x∞≤₧≥]╒ô:ë\"=E╓äïûKÜszÄ(Y÷V╖■\n╦#b>(╛÷3\"\"¿~║Ö▓ªâa╗ò≥óDεò»φ\\WßV\n▄N0}tä≤╬p∙╬1╞S;`?┌>≈CW┼js╝>╞8╙╠G├╚voc¼⌐▒▓πuδ}¼▌9ìF┐φ·├╕ºö≥4zz=\'\n╓G√m@\Z┐iö≥~╫Çêû²m¢T[7|E\0α√X@\\£Å¥│SGl6█!zp9╢╧X°\\╢mA╟G╢Oñ╪lÿáâ[L&R╕.ôδ2╛∙fπ=}2╠┼╜═å=!itx`?Å┼╣R σ▒bå\'%ìF#∙─▓Φ<≡╣░-K<2ms╖ë.╩ΩgJà+¢ï≥╜⌐ⁿ▓v¡âûφUE±┌D▒·d>P╥┐a¬b∙╠eε\\!¡NU╜Jk?è╛T3Æ▌ùS)W£ Iªâr₧°¼∩\r3┼N∞$≡òö°J┌8û╛-&é░┤|║r	│V╡è┤º\'T_Pt½J▐╤<≤┬Φw1:╦╟\'¿@½\r¬ö!!{h:4_8nåU»└a/²²δ╛Q└¡╟≡ª6╞OÄq°┴N▀:┬┴┘,4u	║Uw╤gÜ▒h╥Nù*\\ªÖéµú│▀G╙≤B├≤⌐Ü#L9¥├≡}HÅ½}jCεª▀G╔%ùBÉ-ä░╡xFæ	ß~█#└äJÇH⌡VTèBQE⌡Qï┬╔c╣.I═#[\rJ╫VΦ╞╞:δ1·╟~∩Γ╧~zzpuφz≤àσ|√²∙∙ßü}Dg3{╢-£┼┬╛░q¿+!╚₧îσ╣më├`╬≡+^I)h!&┴zJ\nh-┤4m┐*-D4A∞α=╦$ç╖┬ÿ}0}TF▓┬╠╤ñ]«░Æ²?ττq┴ó9ú²@╛÷#:╦íRLH¬║sxíî∙ Qæ÷#╥eñ$╚└ πΩ╒\Z┐·⌠≈δ,?┘α╒è≡₧É╕/<╠DHiåL∙ieêàΘΦHyÅä,]èF│<û(«}Θ\'Dp»┬╗DIo\0%/ⁿ,°\"m┤T≡╙╜ⁿ√u½Ç»7îΘrî≈ⁿ\0o ╔#£N;>Ä}0CjC·b\nÉ█è£∩bU¼«Ü6p?▀ÿ¬W╔╡ò│╔╚z┤£ÅN╟#+┤H╥╬Y7ε╔Ç4₧	╩Lf¿êáΓ∩Üäû╩▄┬Q$≡º≈ε9≥Φ╨«╦ì╬∩ìΣbnF,p\r}-╞#!=╧»\Z5¢Ii[B|≤|π╛²╓|≥g?=}rr∞£║.{ûEúúCδ╔h$ε╞FJÜ8Äx*-║τ3Σ8╢x\"$MÆ╜φF═çàqè╡⌐┐τ╘%ìyèµú├Pw@ε½┬LQ⌠¬	╓4è╒╖FñhÆm├αöE$ï└G■⌡╨â░╤~öU\\\'@Hü÷#S:ù≤⌠£e8Ä╣∩╥é∞óí\"¢ÄE░,ü█[_|qï_ⁿ÷■═ç╫░┐\\ü-üCï▒ àCσ/╩#e8S╘7╜≥ûε√æ≈äqΘêzÜPé\0	▀σ╨40Ä╟%ü²i╠î╞ÉD└Cªδoæ╨╪ò╨Σ╨c└e╞╞c¼-	u<├≈0±\0\0 \0IDAT┴∞¡c<·╤}√ôÖ╕₧içÜDhδF╢╤pL2σ≈╤4┬▄┤╜é²î∙}╘å¬èE-ƒæ╢¼x¥~ù╡S5g∞Æ▀G² L¡;j<Ñ )Σl4ÆK╦E¡(Y?εu {\0R∙äû▒U┴8╘\0öD╒D«ù`,╥╠D·∩\\\ryI¡E°wú┐ⁿ┘┘∙²ß╤┴½+╧;<░G▀■ααⁿα└>P├S¼<Å╜æ#╞╦√▄q─íR≡ñÇ=Ö╚s█óC)\"K╥éìâ8R╩êÖ╨┤$)d,ÿÖê&φ\n~┤ëz╒ÿ╚T╘¬o╖█!+╠┤╣ε█èJR²⌐YSó ²*╔D ½φα<µ#∙=⌐AÄ╧G╪N~·U╕Φo`&A \"╝|╣┴/±■Ω%n_n≡═-π └¡-`OÇ$pb+╠ ╓\0\\èR╠t└òÿiSiⁿ)√Ä▄\':φ^₧ÿß├èVüÖ`ÿΓ\Z	å\"s] φ;ñ√└@mêT⌡,ƒÉ╡Q∞¼╖╞7╖Fτ<·╔C╝²╟q∙÷╦æƒàíΩ─│┌╛mÆ«²i╙╟mG║MkDv╒Θ|¿~┐.╠GOC=~δk/AhBbFä\n╥|wO|┐Ö u╝0╥@Bñ~\'jö╝░J┤╣üí═┘⌐#K╕.├q¥¥:r6│((-╧₧╟Σ8DGGÄÅ¡╫JÉ Z.,1Ií├⌡╧ƒ╗ε√∩═º αOO₧9\'δì≥l[LÄÅ£\'π▒<\r>\nWZ4Å─Si╤)3é¬Q⌠DH\Z\'┴Z.Ω═lëwU⌠*∙y>≤æ╡╔e>8MM\Z\Zö⌡½m₧m╒└m*ΩV╖=SQ¼║╠JÄ_\'¬W╒┐.πyÆ∙±D9╧sµt9!ⁿ╓╙╢2╛@xα\\┐¼Φm*═a[ √88▄╠/B?²\n\0V+_}╡┬»²ƒ~tu│┴╩cⁿ╩XµB\0#╞∩[└<`B\"╨úÇU¿┐f▌ï#▒µⁿ%QvΘL	c╟∞+°u ─Wå╞╖Iäs9N⌐╩Σ£╚7M?┬ß²█(╞J╕GO±╓Oα▌?└±╜╚Ç½kk╢┼X╘ñ√p:7▄^%Ab┌i╜╔°╨╟╪Åå≈î=GM┘uSsF╙▒╜╦·▄l5-╥à]╠ éx·Σhⁿ≈ ·c\0cu╤·ÅkL₧√φ\r UáúΦ+d±IJA║SzDL╗qS*╕ºWô\n≈ƒⁿ∞╧╧╬°ââ∙½Wur∞î╛≤¥σ∙ßü╜ÑXìGrtt∞£Å▒≡|¡┼h6æτû-û`Γ└░ÿI└▓$-äá13+,)─BîÖ╡~,A┤ ┬~µéπaú=τ┘R╡▄MG╔åno¢╤º╛┤+=U┼╩i6+8τíºa!ænò╓âñ5ò▌eäBh╬ñu╒Yº1τƒg╝`&╪╢└zσß½»W°Σπk|·╔5₧╜é≥~Ω╥τ≡▐7JÇ╟└√pf3B┴^û╝≡╒αá ÷ù÷(╤=Bê╩àΦ:íÜ╤`╩ΘAÖb╖r╬µD\0>CóF%\\?8╤▀\0≈ßvú≡Γf√då?║─;⌠o²ατp8₧ù╜½C0ªÿûª√╖ac┤G█dc╖1÷≈5GÜ╘å`└≤┬n╢\\\"█û╦┐■½≈ Ω╫▀▄ⁿ┐ ε≤½¢¢═ªµ┴≈iX{\0╥\Z|D√2#≥ⁿ₧c╧τû╪l╞#IººÄ5ÖH\núÿ₧╟dY$f3╦▓-!=┼░$╤|n	)ë₧┐╪x▀∙`1√│ƒ₧<9:rÄ7╡Å─⌠⌠t⌠d4\'Jüòb└╡,ÜM&≥ëe╤136B╨─▒┼S!╔A╔╨Σ=S■T^φKQù▒@├Φ╨,Γ■Xù∙Φ½vz▌hS▀fèóX¿╕ÅU─:\Zæ6ÜÄ&7M╬ú╛oê╬|dà£iâ╣(.EσtYa{QG╥■╠i└æ îô≡Sôno=|·╔5>■°\n╧┐Yπ÷╓âÉïÇ╖è±≤\r┴e`D┐o+,	8PKß∙╒ºnUáⁿPΘ╗└ëR╝┴òë¥╧u╡:S≥LÖú2╗±\0╖òΩ\rÖ⌐£█O╜Jû╓àXⁿhîo╢H:░æo>┬╤π╝²ôçx∩ÅΓ≥╔£╣╕\n∞σU╜\ZÆ▒h▓_┘τªÿÖ║ï╛m∙}⌠φ¢╤u∞Gï~7±Dj┌NNτ█`>╠╖/Ñÿ<|xp÷G?~ⁿ╔o√⌡═══&∩ªσië≈αc@*GGΣ8énoò╬V¼íòÄª┘? g≈N▐o╛x±┬⌡╬N¥╔∩/╧kÇσy¼F#9=<p╬[,ö≥┼▄╙Öun[┤`└#é┤,▒äæKä%-Zó▒VJ┴é$hå\"é%£▌ê`7}┐z╬│Ñ╛óV}D┐å¼E▀g⌠pφÖu±MÇ.╞Rf╤3!£åº╙Ñ8G╙æv\n╫ .╘ÜΦ╟π╘Ü¡«äé;┴É╝x▒╞o~≤\nƒ||â═åADæτê\0`α2≡àG°W╖äo<╞ç±╛ ▄gàs┴xNä»\Z∙qT╥╠pY3≤k1r$\\╙├t½Tu+^╠yé<.n3¬xl\\╞Z)▄z└⌠▐o} o ┴}|√ÅΓ┴█GMφ ╖«φs╜ìjV}2&╪∩╢~}╠Y█√∩R┐▀Pµ#gHr]σ▐▐n<EQ2┌Å*q·~{H¡0½R└φ¡┬d\"─┼∙╚■÷τ╗▀^Lf3╦╣╜⌡ΦΩ┌├W_m°√▀[,ⁿç╧δx╜Rεx,f\'\'úºÄ#ÄCµé₧m╤|2▒₧X▓é+$MG<Æ∞┬@Kâ*╦X┤ë─╟i╟|⌠ßΓ[3jòva&}⌡╚╠Gù╝▐╢╤/╙~e┌ò:╒¼¬┌∞ói¥j[ò+o▀║U»èÇGï┌ⁿ≥╧£±»YK¥╩·upí\'HΓjq₧»G■≤ÿ⌠⌡H^∩É┘╤╔B°╠╠⌡╡ç»╛║┼╟]ß╦/oßzJ)p ╓╢╚Ç▌°╣▄Ç\0██└±ÿqÅ=╚╡{├└Ü!\\åE╛c°J∙%q#▌îµóó│Γ\rK1╤AêJ╠≡\\\"┬Kû(VZ?T└|xéá÷╪╞±;╟x ╧₧α╜▀╟ú╖Å0ZÄ|µcúb ╫iîÇí▒ªm;CÅqy├Aµúi-SîàΘδ╥l.εv╝.τ▀u@φl╗²H;*G┌│Öc	AM*¥µ}V=└∩╖╫ÇT=ë∙δ√▀]┌ ╤┐╕8ⁿ╟ Φ∞╜\'Å\'9rΣ;J┴UÅ3)iIä13╢%┼éê╞»┘üS≈ô╗┤ìK╫÷5\"*fê▒ ╙╤Sy╢mú5»SQτ:├╨sä\n≡Q╤>#ù<╧7■K	Öûyzh\Zµ╘╛ö\\¬ÇH╤y\nA9╖╖╛·rà╧>╗┴╫_»pu╡	JsFÿA\0╚SP.πàö°═dî{τ#<╜a∞m0√Σ%Ä╛╣┴╚█`í╛a┬\"╝pú|ñ:æ╗ê*°B0α%╥▓bÄ$φÿ│ ║8¥AQ^.4oJ▀ZÑÑ^╣₧┬jφAI1╡qⁿ°\0╧~të╖~xüw~xÄ{Å0\Z[╠GÜÄ.φ⌠17⌠4╞QƒU┤v}∞∩½▀C╡│φ╣d;φ█û\\▄┐X>■■w/?■█ ±▀~÷╒W╫\0ë,RW▓gF▐0\0Æ7ÆgB▀·╓╠■┴≈ùgùú,÷▀Hï₧Fè╩┬@I²g╔g.\0\"ª·╤Å∞~Y╞┬d┤┼D⌠ºnöía╘åS√â║⌠█D₧m▀f┌V╜Ω╦∩ú⌐ªúnàjy?≥·V─R■∙µk44ÇPßÇ^╚éh@F∩\'τ°dΣüÅd5&JiBBä$¼V>√∞\Zƒ}zâ½+¢╡JªrÄαDÇ$éσª#`v8åu╣└·╔╧ƒ╠≡b│åσHLëÑ}τj╦U░6a\nπûk¼╪└ è5±	(J1≡(tHO┼è╙╥╕¿V@óo8\\0┐ò\0)\"≡╪é│aq╣└π∩¥π√?{å╖╛w\'gS╚ëUâ∙ΦS╙╤┤¥ªN∞ª£┴kÄqEΦ╣w┐ε6╫tf⌐½«φ«16MµÇ╢ a╫ÖÅⁿC\n!&ï∙Φ∞▐╜∙┴hdè&(y╧|╝a\0$²─µ¡T╝w▀₧ìε_Ä9Äx`¬;┘σ?F}┘╛ó_&4&Æ«╠G_òA╢┴Tÿ≥1=4}ó₧╬úí▀τ»ëèÇF█≈ù\\°\"╓C[-ºK÷²}µ├O╜ <ù±Γ┼┐√Φ\Zƒq╧\r╡~ⁿ≤f(▀£╬Hα≡╨┴∙┼f╕x┤─²≤	µç#▄(ƒ/Gÿ\\╠1√Φ∞O_ßαïkî_¡▒`àù\0^ßò\0np├\0)┐┬û`└╒>ï╓cG⌡°≈Qych┌\r─á-wN¡╗öbx«éδ16\0╞#£>>└â≈N±÷/≡°âS\\<=─ßΘ╥êjⁿV¬WvU╙a>▄ ÿ`ó╜!²>vì∙Φ:≈φ┬│╢═τ¼╞╤ⁿ╣![ö/B÷&ä{\0╥j⌡├û=╦S)Φ~íöΓ(WE¬▓(=f>ÜFí┌F│Li:å≥═h├|p≤ü²1ægk*èW5╨û9úß≈╤àyΘ╥NG⌠év\nY▓╢╤╜Γ≈å9▀zÅs╝.≥ôÉ▓≈#▀ü;Å∙≡}?ÿüδ_╜┬gƒ^π¢»W≡<\0{±Qñ$╪6a2╢ppαα■²9▐y≈\0═q∩▐≤àa	¼╕ÜÅps0ü7a>s0v$µ_▌`t│┴°V┴vùqσÄb▄äî|»\rùW∙ΘYai▌░\ZUtïÿw0t;Å╙⌐▓╛!¼▌c▀▄É²Ω_Ä█p╞Ä.±∞τ°╓∩]Γâ?╝Å≤GK╝Kè5ÿ]╫tTìm¥┴δÄY5ÖÅ¬ö½╓╠GUV╦╨sV╫ÇîiìI╫≤jsnf²8Ω¥çë{Pv8Q\n₧τ)┼▒a⌐sQ≈█@╩BñΣyÉD┬\"\"┘<Y╡╞bêv╢⌐Θh╡!╙╤¥]`>·╞╓CDƒ║0m┌í╫ú█╡IV│J┴å¿*V\\ï3:]CBÖ¬X═·ÿ_∙Qéeno=|²╒\nƒεk?^╜Z╟«∞~σ>(0fs≈╬&╕╕£Γß├9./g≡░m7,EK~I▀═┴╫c	∩xè¢╦%£/«ß|~à╤W8·≥\Zπùk╠<à[f¼ßF\0╫\n╕	δ(q9.3Φü}½aµ╠ö═ü¡:Q╚êP!\"-O╦»F¿|æ9ú╣âú≤Nα≥[\'x≡╬1╝sî│ç¥N!,QcY░k╠Gƒ╓m;¥≈u|S∞╕)º≤]╘ÿl≤εε\\╩╠∞y╩s7çå▒¿fB·~Q≈█ T≡áêW»<^o°F)▄└/┼█2┌╨5j╡k╤û«Qèû\Z╜Üú≤▒¡╩(ªk╤╖¡ó╒$JdR#╥û▒Pó╧z╒┤─║ó∙Bâα#∩;ùT┐ó╣^σÜ╜╕p{πΓ│O»±∙g╫╕z╡┴&╨6)0&ƒ∙8=πΘ│%₧<]α╔ôÄÄ╟Åⁿ║½╡ï═Jí>─ÆP╢─φ╘┴µ`y:╟°δ╠>}	τπpª6¼/»ß\\m░Y+╕▄x\n/]╞ò╦╕÷╖è▒&`├■ù╦Ç╦Å	√`─â$╝á^╣╟■∩┬jVî╪πDÉ⌠ë╪á▒àσ╜.▀9╞ô∩£ß¥^α■█╟8:¥@î|¡╝ñµµn0▄r¼»;o⌡0╞e,ó╕b*╩∩úδ£╒╒Θåµ\"Ü√┌0}1\\q╛²2±úK╥▓─╪v,;¿éÑo┼⌐X╝!{\0Rwô┐·╒⌡·πÅo>Z╠σoºSy#σ╢▄dç@·}h#z╘ål¥∙h\Z²Ω+Ü╢-åf¢îE¢²\nΘ╘⌡K	┼3ò▓╩┤%OºK±╢╤╝°\'éá╛δ2╛■fì_■≥%~≈ß5V7\n╩3G`╣┤qr2╞σσ3\\\\╬p|<╞lnAJƒ⌡P½ƒ9┴S÷╝Q`Aá⌐w$qs0╞·r	±╓\rΣW╫░╛╝é²⌡-╘ï£ùk╪╫î»╓ÿ\\╣Xo6\0nßºg¡ÇæÇ	qß▀00\0$í«C«R╛¿▄Écú╣â±rä╔±ïïÄ.q≥Φ\0gÅû8╛ÿπαtèΘbΣ│╠\r╟H24╓┼á1ºtì¼w]¢╜n~ªτÄ];»]▀(7he┘b╛<?╕w>?O,┼\"⌠╝»=°╪ÉZ38²Ω╫╫ε/~q⌡┼├π╧∙╪Ygƒ╢î`╞7úm┤Ñi╘b╫*q4e>L⌡ºMàÖ«òV║D√┌2m5\"]S┌É¬≤╦9&qìδ]}O8\"tÆ█\n5ÜÜìí∩\0l\\àδk▀|│╞φìç╔╪émë8σΩ▐═±∞┘g≈ªX,╪╢⌠Sÿ<?ò)⌐ôV■₧Öí÷Ç,k,ßÄ¿┼t6âX{p^«0²≥Σ╫É_\\C|u∙ΓúoV?┐à╖÷	µ\r7#▓R▒Fd├W∙Lê▓a·U`₧ΦPû╞∞σ│ô)τs,∩╧q·Σù∩πΣ┴╦π)αH└Sæ	╗╔*WφÖÅ:Θ▌C2(]┤▄},ΓÜ≤σ-ó┘╨X8äoåiª⌐╣úδ▄╫÷▄·`>¿\"╪≤ælWJ1O∞╙∙┬9pl)╩╓É»\Z█oH¡P│mìFB\nA2*8▀∙o½û{▌╛╒ìN╡ìv`P2Θ1u»σ.9Ä┐n■!C0u█⌐K╘á¥·Aâ└d<*┬⌠º▄\'Æ¢╝Fφh!ôΓ╣)Çm	╪╢└h,qpΦα∞▐G╟#î0Y\0¢ìéR>δk\\t≡■╞»\\Ñÿ▒┘xP╠6 ╤7Ä°`~x\0╛qüWk8/V░^«0z╣é║^âW.╝[δ[δòï═╩├zú░┘°µK!≡≡`)\0[éFblAÄm╚⌐9s`-LÄ&ÿƒ═0=\Z├Ö∙L╚∞pî±╠,╤Γ┘n3f¢\Zk╖⌡₧÷█á>·║{ÖïM≈g4&we+ƒKÿÖY)σy¼T∞ó\Z~	4+├╗▀▐0\0R;╧σvÑ°·┌s=Å7q}╠6r╫╝▀╢/°6ⁿ>ÜΣ7u:τ£hWh>`╛?¡+╠ÿvNÆ∙▓ÜU█v\Z>KTº¥ó√╬µ^\n]╬o&* ╘lå b<▒pyåôô1&cë╔╘┬|fcqαααp╟æ\0\0╧cl6*!¼≈╫Éö\06Q⌡-ó¿|»╗±φ╥cÉ-┴ûÇ\ZY≡&╪\0bú o\\╪╖╨φt│_¡í«6≡«]x╫ln\\╕+ε╞/¢½α│JÉ>╞Σ─å£9░#î╞-Gpû#LGÿOAô`¬Pê\rV\\ÑU╖¬│6R╧W5å╓¡µ╘W-╘ï\Z;¥okî5=V∩╥\\\\5Fö∙ÿ4¥Gδîò&╓ΣeZÖ╛éç╔÷	DdI\"I╔┼G]G⌠6ó┌²÷Ü\0É2@ó?0≥√▀┐┌ⁿ²┐~■╤ ≡▀ ╤çÅNn·A╪ªómåóT¡ú-}D¢r░\"5╣ûª»OSì╞δΦ£▐w5½.φ4!)¢┤╙B¢Ciµâé┼║ ] ¼|±[eεX▐/4╠~*╓┴╥┴(\0╢-é/ée	HI≡<ƒΘµvf╒╕■q\0|\\╫wùè!,[\n╨┬ü\\î` ÖA«▐xP╡±═ öτâÖ0rH1IaÉ-Aûät$ñcAÄ$ñ# 4╥è*╥üå¬B╡-v▄D [╬4t0°«2w┼├Ω\r_|Zb6¥╪ù╦╤Θxlà╬τ£zy╙ÄΦuΩΣ∩╖7ÇΣå\'äÇP\n¢o₧{╧⌡¢¢╧∩Gçδ≡Ö	J╥τ8ÿwìZ╒ì╢\rσ≈╤$┌b@╙æ■]âx\Z║2H╙√█⌠z╢⌐à_7èeé∙Φ½ÜZ╢Sπ╔ⁿÖ╬ª╒e>Ω/╘¿α└!	?#\n_t┐█ΘÅBª\"61⌠_ôΘ╠┬≥└üöiCÿ9`<J%Y]┴\\e╞ M\\ù#≤?0áñém(GB9Y#	i	Θ_╖╨\\ÉV│≥█A╔▀(╧M_╪µò≤∞yÜ╖J╠╪5½╤aφ╥N[v╝Å■╫╗\Z3ª╬½φ[εçf>L8»7¥ïï<ñÜ\0ô!²>¬µS╟╔╢╧┴\0HRÉσê┘dl/m_Æ╛êM≥₧\r┘É╘╙ß╧mq5y\"\"Ö(╙i<j╡mµcê|╘û∙║╘6j╡═╩ C3█b>LU│BçvZ╩│¿~;TR!7eG\ZM\0₧²*f@(Q\'àrÅª9╡9 ░\r┼╛ÿ\"¼f∙ÇpÖëbß8⌐	╥)Ç^┴ ër╧ ░≥╙╝╓_|εyi∙áêä╛∙U╝äáXdô8í╘x└7½5░δs╠«█N¢πm½=⌠ñ∙ΦcL╝kNτ]█┘√}~■ΩÜε+aφH)÷▌%ⁿ└Y°ÉH$c-▌┘l╘¬n;}G[¿τv╨¡¥(èⁿS█Θ╝MtmHªó½µúN½/µ├ä6ñΦ^U╡SCÆE╦c>JX4┴Oà≡∞ä«15£é≡ÿigs╓╓╒ö¥┌I/°╙Lê»╤¿∙αÑ>╨╔Σ╟`%`]\\σ;£+åτ,ΘºüI)ΘS$	,*xAd(ßπó▌7JòU&▌τÑ╙ÿ▌c╤ñ¥.sD╧φuf>·╓┴Öf╟δ╬┼CyOÑ╟Σ╛}L║Äφ█h╖εZí@√æ└▒/GwS«Ω,6¿Γ╞ε╩Äoóτ÷åäWWεj╡R╣.├╠^±3U5└U▒t&ï\'ÿ╚┼\'ÿ╦ΘG√v╕»¿≈p^C1d°╣Φ≤9BO╧uá≤Qwí]╢\0Å╛Gτ┤) 0 ╘ΩX¡ª_nµ{X₧╢D┼K░é*`D┌|╦╨£ßJ┼·/╨æΦÄφI≈∙⌠é½δX▄╘sÑ∩▒┐I;m▐!âµ▓Æo╜ÅIM╞,εí_}ìíª·Mƒ▀«╢[wN) fV╧ƒ▀å>¿ÿª┐÷\"¢=\0⌐±÷&▓ê⌡\'φΩ┌sWk⌡àδ≥g╠X╒╖\\▒╚M∩W÷y╒$┴%Qâ▓■P╦■╘mçj÷=╒S╣┼ºEô\\Q┐ï·├¿ƒg[τ╝╪╨⌡l╙^U+∩o≥ie}(┌√5iº¿▀eφá║?îΩ\0oÿ«C╔┐Å*;╡╚aÄ5┘öñPδæªSjΣª.σ]úÉ)!╥YN|┼²óH╟íδB⌠╢¿╞┬æ¿≡═>º■σº(îπ óÆó°$°(Q]╞Γ6nß}ì²Φ8å┤φ▌÷\n₧╒≡AoV⌠αs├╣úΘ█v╠¼;º╖lE²!Cc╜⌐9╗ε2¬╔£╥ÿn╖╬£Ru╔√≈F\0l\0ñºa_Æw@j«┌Q┤ó!?τJ æ\'⌠mδ:╔¢Ä~┤mºe╘èÜDL₧Ln╧Σ⌡∩δ°╘C¿çτ:∙╖:CQⁿXrn%½|▌%RÉè4 ┴XôM%óÆ╫-╧¡▀Ñ∞«T▓╒╧┐ⁿ·P$<O₧w₧₧ä;<;╗┬XP?≈ús Mì!CìI}╠}ª▓`åf,·`⌡çzå▐║∙:╢\\ⁿ⌡_╜≈≡[▀:;ì¼¬,┌Æ╫gδKä₧rb?╒╧e░[&7╔│D├²Lüä.╡╠δ╕°v═│M}^Σ≈²Üj^û╛≥lM╗╒φ╞[W≤Q┤▀>Mè┤ô½Θ╚┘/]$ïu@A	≤<ÉΩCba84qy2φJ_Φ\n╨àáατdUªXáN Fó2û«G	╞ñDƒ⌠┤▒d?δ-ñ╥φ┼╫äjÅ6ö.╥≤-Q╔╝~#*)S£¼f╒~hJ╙╤≈╪?ö▀GK═EeLh(═G_c╙╣ÿk╢S╖\"f¥9í¬ƒu┌ΘΩÖ╒┤¡║φΘt^│ ┴nû%&O¥²╔O₧|·┘g»V½ò[D¢P┘k=εΦ6ö\0ΦσKwu}φ~┤^½▀1πv°h¢╔(E▀òAEΘhΦΦ╧«3}E▒·zÄ·8Å&µ&·]F┐√ƒº┴Fε╥╤~ödó 9α)ª%√zP∙kS∙╬σÑ░$Yù∞≈╕4/Eá!■█∞9%I▐yF⌐XÑΘ$ΘUz╢!ï>╟~╙l{â÷jQp&ÖS°╢╔╔É▄µc╚÷█ïv=Ñ╓kOq╓=═v╘╔¥█3#wd│zn_ç┬⌠≥Ñ╗~uσ~q░┤>π	»¬r═E╔ÜV╜j\Z╡Φ╚Xÿ¬ë_¢∙h²i┌∩╢╗iªói4¼Nt¡I_┌8¥7uª½kσ∞KuÆó╚|∙²Ä½UÑ╙¼òΣ═Ñ8┼îñ■6XÉç╢!1ÆdD⌠Æ╝ö╨Qd╜<¬╬/²7aσ¡$ΦH╖ù,O=╙╙┌▓ $∞R╙42ó║µ«cq╒╪f┌δ	-╞²»y<cNτ]ÿÅ!=¼LV╜¬\"Ü>G]Y²╢╫▒i[╗╥~█kæ°ka█RÄ╟ûö[Æ7ä░í╚τ~█ΓfÆß¬Q-╘:╓τ²çÄ~╒ig╚¿^ç┴é·êZ⌡╒oá╜«╤íí≥╢wAc╥å!)>F6{ëƒº2]2,@ⁿ╣ñ▒!⌐┐î└â╥@ [N7▌τΣ╜<9/┼½°▄╥Çó▐W|╛╛╧æñ·T}º	=>√Cî┘}▓π█¬ó⌠τt~W*9÷5╢Ö£c╕╟≤Ω√~≈╤~W;`█r~ r∙≡√▀╜<¥N¥┤!ß^ê■\Zo}2 z╣$└RIAé(\r|·è╢╡e>·ê\"╡9»Ü╤ÿ▄n╓e>⌠i∞t▐ò⌐h\Z\r½{▀½₧▒ªR·|≤·Wvo┌:¥ù∙}ΣTMσ,û╕≥Ü▒\"YƒTΦLFΦΣMP⌐▀ßδ6ⁿ╩N*S,(▄/{╛¼iNÆ%:(!ΩÖï╟*┼ò¼¬ÿÅ╘╧ó<}¡)╤²Eè\0Z╗w½ε#√╒	\0\0 \0IDATÿ▌5`▒+~\\πL:¥∩╕≈╘α:╠«cr]º≈=≤╤╝²dòE)┼⌠`9╣w~╛<Å¡<\0▓!{\0╥iS\0╪╢	BÆ$\" ╤lºf┌Θ▄öïo╫ü╢ì√*òtò»╩1╜═∙o├Ö£╤_╒½!úzM█⌐è\\Q╔╟U╠G│w▓╪d;√<EΘTQΘ╪t$╤C]ê▐Å0╜èÖsLª)╤Å,9ªjQí^$:8┼░Pσ╡êR┼JÖÅ┤äè≤╦SXUδ>╞┌>╩ç£#║╢╫	vôå√√\'╗╠5ª╤Mƒπ₧∙(i╙q%α(J═┌º]φHε(ì$₧╟╩sy¡»}PrWÿ╙╤ÿªQîéπqj?Γé╦╤Ñ▀uⁿ>ΩFæLUdiS⌡¬╬\"╜¬╜¬s¬[à¬mU,âÜÄ▄¬Wí▐#τÖ¬⌡,Θï■dòÑ8á[ΣêN(ß£àD╠─z┐\nVBB\rê╧ê$Ö\"Ç┴■Γ£cfG»╛ò_%ï²LV│¬≈n╟╟α╥5¿¿ατñÑÑú.dOº⌐TPΓùr╧½ÿ∙╪6cazÄ`C²»9╞US3µtnr╬jRy░φ\\îèv`¿▀}:╜╖]─∩:≤üÜ╧Tç``bf÷\\O1√G₧a╡íS±\r┌âô▌·¿éUΣ\">ⁿ▌φ·ôOW┐╗╣Q┐e╞M│τvh═╟64┌í▓«M÷~├Dƒå╕╘Γ9Bâ2═⌡ÅQ\\═╢baÉ*\'+B▌ëê⌡é\"ÆIK╩⌐\rò63╘RpPôA╣·¼$Q╔¬Wq⌡+\n£▐ïÅñv%╘▓DÜûT\ZV╘Θ~)╘R ▒Kσ}i4^G┐Å!µ¼6cu╫≤╥[Θ.¼]ΘNï┴∞yJm6+Ñ¿\0ßTü┌≥à┘o-╢╛5 ë╤ε╫┐╣┘ⁿⁿ╫ƒ?~4²4Θä▐╘7ú-7]Θd¿\n⌐ ù2£¡▐V╔T^r╙	Ñk~r^y╥:╠ç)╞óCRvMJⁿ>á;ÖSè∙áéK_∞é¢î°│╢ ÄâRΘ┼r¼▌╨|<┬⌠*÷Aä h:h\Z▌┘¢ GiS>├└PQóRu~╖₧Fσ L9¼\0Ä]E┌ælÖ`╩⌐≥àLJY║bÉïεδ░\'╔√│MM╟«3=∙}ΣU│╩Cπ╞ⁿ>╢5g5]√5e$å`>Ωªy╡9/~C1ª²D≥»+äe	╟╢àMDóα\0M⌡{µπ\r Eo#v╡$█&╪Ió┤z▌{═╟╢5\r√Mm·mΩⁿMµ/w╣ε}hSL£╧ÉQ╜¬\0Pà6ä≥■▀┤▀▌╡!▒µ├Θ╧Ç╘@BRpÆH≤¼≤\0┴∞ºjÑ<:ÿ~αì╡ö,=Uî3⌐d╣k╞\\FDI3Fæ\0#┘*W:≤!D÷│─~5┤#1░Jâ┼.c[ô▒₧Å╛4}x>╘ⁿ\"smÖ\'√╥X⌠}/Li>╢u^╗╓n▀╟í─¬╤▓Σ|y0╣~▒8Åφ╨	▌*E┌Å=ΦxHU┬{öÆ╡┘0»W╩U7 A⌐≥═¿èB╡}▒vD╙Q╒?N²╛Æ∙┌φ╓4≤▒+U┤è÷5═XΦ≈╤ÿ∙hó1ë√ª1σ9ì╟δ░∞∙ßâé@>j=bA:«δz?┬▀+╘U0(Q,PÅΓT!█╝τ5╬!∙{¥±\0t╓é)dYû#	B⌠4│ÿ)«ûò\0o)V\'	Bå╥t┤iº═qv╠Θ╝\n|0WLeªuuªµ¼«~u√mó?╝τ╒e▌RòR▌\'≤╤e▌UΩññ╔tbƒ-ùπ╟æ\"d41l≤α∩╖;@Ω·?■╒ù½_■ΩΩw▀√ε≥├\'Å\'7╗à⌠√ê■⌠─┤P╫~¢¬0bóÜ╘]¼óUgⁿk║_▀╟+ÿPj1m╪«╒N║\nò╛»/4O■m$0G╝pWLQu¼4≤ßò╕/¼\0êÿ=Q	í{>╥NU┴BXΘkJ}▀ña`╥╤=═dΣ}σåB¡H≤æAö│■%\rê┼H┼á⌠=ºt9Åª√⌡9╫æ`jSÖÅí6╙U»≥█c\0èYy₧bï╨QD÷%y≈\0ñä$fq! ö┬·├▀▌> ═oo>∙╜«┌?└]+l⌠²i\Z╡k╡j─|ÿ¿fU╒╬╢ÿÅ!óùUïp╙îE╧~ENτåÿÅD▀â╪çúΦ▐ΦΩÿQ É`êαs╔>úôf>Γ┼╡6┘|äFüÉ░¬V6ï4+▐╬K╗J[9Φ¼B(\0⌐½,└)├▀ë#R_≈ü╠|^▀∩c╫4hx£.Ä╓╬âkÄτö≈«╓)\"╥╫\\≤║0CƒWô\nèMûSEc║	M	\ZÄ±f╦1IDÆ▓\09?WEO≈█@2ô╡f:ªÿ+e\rêΦ√è■4ë┌φbt╟dö¿╧h┌▐∩ú^┤¬{10≤┴▄tⁿá╪TP\0é)u°└Cä)XîΓ╚╛▌≈╙║|-H⌠╣≥ï⌠2¼òµMûΣEΓ≈Eπ\\╪_²▄3,E%\0╤üG|$╪æ▌ç╬║Φeî≤╬g;Zî!┌Θ║┐ß1Äåfiå╓3Ü£Å∩éç╒Ps╔6█∩ƒ`ÉûÿMº╬â├â±╔hdºì≤#({÷c@*V┌┬x^T╙R8Ä·▓ç┘1Ö}╖ß≈╤$j╫╥∩#}┌VeÉ.X·`>Ωj,ΩµSEM1V╧╩°}░╓¼9µúl?*(£É∩îkt╜Ç\0ä:í╗Äº∩{<ºΘαCCíƒs¿\r╔,ó£▀gzJ·ó>▐Qñ¬_┼║$¬Z	ü|Φ D╩≡gM+RÉ╛ò./£t\\╧ô▓6╗^═\n5▐ms\0┌ìqì¥╬δ┐¡I╙1«K;uµΓ!▓Ω░■MµÇ║kÄ¬\nèª┴╟«·}ö_ΦWÆélG╠ºgΘ82╝!í}_⌡j@Z¡÷╙oá\n≈±\r|╔*╕C:¥w¼B╒*Ü╥í¬█╓╨╠G▐u▄åsz_√Öê\"╓╜▐0t▀╨≥9ΩK≤Q≈]╦εô(╔½W╝@L>─α∞sºï╙C-ç~£X7éΣ┼ï╚⌠2Ñx⌐D║mIΦ▓»Éa>┬ \'ÖÅñ≡<]+═ÇΦ₧%uéφD&₧│ªc╢ëv┌¼5å╘hte>`xLóü█Aç1╦┤Nq╚≤z¥6\Z╝-≡≥σ¡└└A└ºÄd>÷\0ñ≡ÖJA)03╓┌°L═ó_{┐Å─τ┤╠G^■≥╢¥╙δ▄π.╟╢π≈╤ó¥▄¬Wê├÷ÑNτuƒ┘bµ#.gï─╧⌡├£2µ4Σ│@:5èsú■Θ4-╜rVÿ╞ü═8=║¬T∙(∙sè±( E\ZÉⁿ┤+ ╝à\0HáPt^kip\'ÖÅ6cv█÷P1╞σ\r5MÿÅª┴/ô\Zè&cµ╠Gƒ:┼.Zá6τgb1_5ºÿ├°}ñ»1%≥A²ogºs;XùÆ6₧τü _\'╥ΣÑ┌o»1\0)T┐^▀x½⌡Z}Σ╪Γ╣ÿæ6╥╥4j╫$*╓â6ä┌FæΩ\\hgêhZ╫¬\\uÜ6╟7q▐C┤C9├╡	╞óI;╘α}L[ê°≈JQÉèEGæ\\█öΓBΣâ¥E	ÄÿÅ@á«#┴>≡u\"òwE╗ª┘\nUHΘ>⌡ÑñLë] wRèêëÅl¼Σ±▓«δIp╤dí5c╤ªQ²«s\0╒Cw╞╞L#╕╟~uφ╧╢╡!}¼7v▒▌╛Å╙DK┬p9 \' Σ╜? σù╫ⁿΓv╜÷6⌐B7tò≤√⌠á╢!o8\0)\n╨φ¡╖Y»╒τεX}jô░ë05òΦ+jWφ≈ñ\r1╬|╘╜>]}4┌║·╢¡▌^w╤êΦ▀ca¬¥N╠╫êΩ╒c⌐$σï(╔L─ZÉ∞QO┐\nσ\"ÿéXäáé\n}-B╨ 3J┼·Åÿ	┐╫Hê└u@öf>toÅ,Æâ1#HyäñüáW╗╥√╞9òÖ·e>L∙üta╟√j╔%√0 âÄ;ìëu╟÷╢s╤«0mƒ╟«sFε&ä╗∞≈Q╤^≡k█Æ╙╖▐:╛≈╙ƒ>²ⁿo ÷▀~╢^{£sΩè╧≈l╚@Ωp¿lI┴D*C²=á≥6Q╗mWí\Z*·c┌æ╝käe[■!uÄC╧G▀φta>¿çwìJ±Ek9\0δíG ╫7,«CoÉl█I-I6⌠ΩX:°╚T╛ΓÆ%%ìu└Tµp«╤ô\ZÉXl.B╞DêD╩5=[ß¬∞╜⌠┴┘«1C░╒}╡W≡░\ZïåÜ#L^ùm0{º≤÷╟í¡╡╟`÷<VεF⌐░:8▓îG┘ñ╡g>▐`\0Rû⌠ƒ°\"≡└∞%\r║Vóαû√∞J⌡¿0ZV╫E╖»╩ ]úrMâC╫n»¬0ô~ñ∩ ≤Qtφ2ù¿}5+S∩Ü^ε6[e*▀?$╥Çê╘░├\ZI?\"Ä▄└}┬æH>(├ÇΦ%~π■µ┐ûY≡~╧+╗¢¼åù▄╒Åñ$¡A╩ö░╝ÆX▐è≥ôî╤Éîà⌐v╚≡╨1Ç║5µ├╘£ååcj╙1▀╘£eZº┘╒∩ú╧:»≤æ9S\"K\nΘ8ReÇàΘÜ╘√m6╤c█E7[<▒Y▀▐x╣.╚î≤ç«z^	w&▓MdΦ╝¢⌠º═√Në6à66⌠lφ╨≤Q█$∩Yjδ%B-▀5╩Ör≥⌡iQur1ÅDΣ?]Ü6ß¥!π╢■ùH²YV┘τ\"Q╖ⁿ⌐┐Kσ╡-╟é àÇB½x%@$2é÷∞WZ╥µY25å6ô`pL\"├c\\╢&up&╞¼>\"ε▄ß║╢δM╧&∩▀«m╗┴|ä≈╠▓┼ⁿ┴âσâ∩≈≥d6u╦╪\\ B╦~╗#¢)ñ¼Ç╕■E\0Φ∙≤═··┌²l>╖>ì─¬▄sª╦ß√Ä⌡╠|ä9√àüäí½tÖ«┤╥╘╟úi½.CSτ:6¡fU┼ó₧█I=K╤9σ≈┴5\"lf#█iτm=┼)╔äp\"Ü~ε/D(DÅ┐G}Pä0 è8(&»	╙í²∞\'<~▄^:\rK╫¿T3 ·┬┐ÿ±(¬å²L)ìç╚╢ô╧nd╙▒┬sM▀Åjµc╫¬Y⌡σ≈╤▓╜╩⌡⌡╠G▐S╞µΓ╛ï:²4ß≈╤7CTt╛w┘Θ╝Y{û╙├â╔╜╦╦σßhlσ²│=╦±É¬º^Oαä■N\rQ┌5═UL\\C║╪╢⌐≥:T╤2}ⁿíóæ5┘ïNN╫}√}Φß8▌)Å⌠úöCyh*Φ D█?└ZJ7ÇPÇτ┼ZÉt0çU│┬ƒ╙\0ä√å─}H»3≤äΦ:Sæ«ÇòδB╪╚ñlΘ¢«zU«I≈╖▐}Eτ√┌φxªτÇ₧²CêzçL═5&█19µ▐U┐╞▌╒~⌠Θt▐¡╜pêCΣ\0\rNü\rΣ\0É²╢ σo«mä Aë\\z~&ú-å+zT2TM3²j¢4äFúN╦t┤▒Ω|╥Q╢▓(Vƒφ ƒ∙\0÷√h│ƒ╛0O3!! ╚g╥αâ(}¥4_Éö\'iµé!Γr─\n°└\'∙s|1 öìéV┴J\0æº⌠t╡½∞3D9}J▓H█g,Ü-Ä╫╡ 5Åg╠Θ£Ük¿º▒\Z-ÄWu▌w╔∩ú.;oÜ∙0⌐²Φï∙Φ╩╪dÄ╦J▒τ║J)(÷ⁿ@\0┘│ o8\0)zcúâe,ïä$c3Ü«╒vLE┼å¼Bò0²Θï⌐║èV¢τd[╠╟6┌)`>\Z√}P≤πe┌i≈>UâÅ$K3,═½3\":ê≡/EXφè\":│╬öΦΘW£ⁿ{á&\0Iè╤├╛Θ@\"╔jNΘ\"Ç3azWÉ»y╦⌠C{&▌%┐ÅÆ÷zu9▀u»º]ƒk¢╬-}═)█n╖╬╪╜═~SxçX)÷<O⌐d║h)πA9/x_ö▐~╗\0ñr╪╕╠è▒a`\r@▌µ├D;\\4Γ;∞≈╤G{MóXC╫╓╫\'╢!½bσ\\ºN╠╫êbÖìlèπëçrAG¼┘á.⌠cMH\\┴*HíR\08Yr╫gG(ß21)╫─τ@╣Z▌─∩g╥HPP╛V$■╗l┌U▓φñ╞#φ≈A█è<\rH≈√┌|▄▐5┐«q\n\\îε\Z;¥─▓≈╞|└≡±·Φ╖I╞ón┼ª∩├P╠çë÷√aT$,)l█ûë2Xê╦±è£▀U▒{FΣ\r E╔ΓΓ╖▐l>²ⁿ÷π┘╠·p:▒:T┴\Zé∙Φα`▐d?Ω│▀C·s⌠╤^¢(╓δ╩|Tk╪i┐Å.╟π()ÜL╙╠çετíTÉèò`<8g P≤k?╥µä⌡Hè═@╩╔\\ σp₧ ╔┐╫AF▐\Z╕▌√CcΘδΓ≈a┌σ╝nåÿ│L,─¢î╤ªï╢ümΩΘ╝0└╗╡╦φ¢bTⁿáÉe╦┘┴ß⌠■╜{ïô╤╪Æq(Nτü.▐~╗ú\0ñΦ\r┐°σ╒µτ?┐·∞Γ▐Σ╙ú#¼ΓqeÖÅ*îpj?jπ╤╨&JV7Ω╓W-·!¬hÖ╘êö▀d5+T⌠ºΣx¼}F9╧Tφg⌐ε╗T≈╜¼w╝\"n*¿ ¼W╩*\Z/êÆ@\"d4╥ $┴>Hª]à╫[gRjM╦9NΦ	@ü°≤lI▌ⁿ∩:cÆ²¬╓┼╔δ\\╜~ε[╙qWⁿ>jz2u÷√j╬j:÷7╜╞]Y±▓┼╛ë¬X]5-&≈C9¥├╨=«ZSt╠`	~┤ñÿNº╬┘┴rrΦ╪û,8PQU,┘~{ìH°0░πì$	AqE/╤╕!óM┌ím≈╗Mt╟d¡&Q╝íÖÅ:╠WTKåñ4eóÜ╒╒│▓ƒç:ì╕ZÑ╓{í╔á_┼J╡δΘT:╪Höⁿ»Φ═`\nÇ	U┴óóe\rà╜LT;╓Ö╥╬#⌐╤öΓ\nW:p╨üÿ╬Ñ╡(σ╧÷ÜÄ>█R3╓6¢c¿|√mº╛¢b┼MT≤┌k>åyMhwC\r[.·╙╙░╝Pó?{≡▒ 9░╫╥<\"x⌡╙òNå≥═H²ƒ┌	QW- ç¬¥n*/┘t{múçªÄ▀G5½è¬VEQ\\]MΘg	1úXΩ≈╤µ]Ω\'▓¥-\ZD\0╚\n╧S-·!(Q¡*{⌠Æ┐∙	s≥ ╤~\rJSS\Z?$╡∙r\0Jæ÷C┐N▒Xƒ«c╥┼L└░⌐Vâ\r┤│M┐ÅJ║δ╨å√█.TM:┤ù▀╘T≈ⁿ║2W]≤}:¥w±1]Q¼pΣ$\"$\nY¬qs╙╤6E╪owÇä¢°_■╫╧╫┐²▌⌡G ▌√^£Onδ?CWj⌐m┘à¿U_╡╙√Φ ÉU╣║D╤║Fπ·ê@Ñ╞fJ/éåf,╨Γ¥ñå²A┤êªè▄!╜jV▓╔à{▒÷\0Γ╟\\c▒ÿf@@$┴bd+[┼╙pÜ\rA«+|(δ6FÜ╥t4}∩a¿¡«∩U╔⌡á>u╗8÷¢ΩwòªúïNq¢τ╡╦[ƒ∩oGJ1¢N∞╦σb|2\Ze4 efäe₧ {░▒ ë⌡ü╕╜U¢┐√√ù╧²¢δO>xq½-08╪ëΩ=└}τ│╩│═╦├τ£vêε≈Py╔}╡╫╘u╖J#Ruⁿ▓ë┤╬shÇ!)e>8┼|╘yû·╠┼o^½¼▌╝⌠ú╝╩Oi┐É┤┐G╕x╧!	αæ∙N5╣∞╜╓Eτ1	┐s⌐Ç]┐:Çj2>4c>L1_e∩fOLE+ª»j∞nR⌡¬φ∙∞·╪Åå²n½Θ¿╗x▌à≤j║m├Θ╝├╥7≤A╔uƒdKk9¥┌ç╢-Ω:íí┌⌠d┐\"o\0╔<D`╦\"╡┘°qE╧ ╗ú≥!úzåó-{┐├╫u(µc MGU¢╡ÿÅ6nΩM█1┼┤ö▀=&ùÉE\n|Σ1$T╕\0\n½`∙┌*≡·¿«~U>▓«Φß~Y?ÅlzUZÆdr╥ ╟Σ╪fÆE6±▐╢|O:φ3ä▀╟«·f1µ6iºÅ9├╘3∙║╖▀/≤æ╛¥TÅ▌(J╙Γ-^°²╢C\0$Bÿü|\0 ╦\"┴è▓╠ç⌐J\'åóaìóMU»AÄ6Σì÷√0╤^WµàJ\"R&5M¬gU»6≤Qv╬&▐t|&S¡░╛¿F|ä~ zE¼,°á╠uLâî≡s▀¢#⌠²╚┼αâ\n@Hv┐<├└XDÅ╠τ1xa\r─PA┐▓╬≥■╧}1_e≈»)+╓Σ]∩·\\╓z≤√Çß1█⌠╪_≈╛æí±ío╟⌠&n▄îßÿÅ╗α≈╤d,h▀N┤εÜUJ╓É∩ QBLEE÷█ \\░:K<δ╡Z╣.ñ\\~As\"µ#(mÆ╫)j╒7│`║╩Lƒ╤₧.Nδ}Yu8╡ëR⌡╔X┤iº]tÅbO=ï\n4yu╜┌ùh-¬⌡(·~I╞&%i$d¿ñ╒}«δÄCi:ví:Uì÷hH-G╙1█öGò⌐≤kZà¬o▐╨≈φun@≥ÇÖ_╛\\àèêéÇ*\0\"√m@JWy£^á╒╩[o6ΩS╫íÅ-Åê0m▌i²i║_╒q[V╜╩«TD¡ΩD#√v▀ É╢\Zæ▓π¢¬z╒▓¥<φG£▄╪B≤C∩zy\'½£╗├èO║╔`°√ÿ±¿SEï5¥eL½∙T2ü\n≡PnÖa²:ΣΘOÿï£σ╙╠çY¡ÄÖτ¿═╗▐÷╣Dâδ\0╠G╫¬Wu╟∞:m\r═|pâτ├ö╙{▀ε&Xë▓▒▐⌠Γ▐┤╙y▐▓«½åñ╘É q|<▒αºτs┬⌡<|Pâï▒▀^s\0╥⌠U⌐ç½ç¿╫0\rd¿¥╓è]e>┌╘n╥i▌ c╤╣¬≡°ΦÆ#╜█~ Eφ$╙¬b▀=╡⌐^ïL\r⌐æ\0]ƒ½ì┤ª#Θ≤AZΘ▄ñx>»¡~▀gôÜÄ╛ÿÅ╗ΓtÄ∩c╫9┬ö½|▀²1ò=╨0╝~╗╪ojtG╬■≥/╛u ▀²ⁿ≤¢/┐╕Ym6₧d@H▐\0N-¼²÷É─[ªⁿ_\\?*Qhç«¥₧┌╖╨Θ£┤]╣α╜4Θ÷Z7J┤Mµúìj┐N╒½¬ü▓≤QW_Q╥Ni╒+jΦt╬ΦùE∞»¥∙╨üEÜ▒╙Ü╥~ Eà⌡è█╠∙k╤*!z╡K;\'µ╦ñ(╜X╙ÆW⌡+┘▀║Ü║om┌i≥εÜz₧j╢╦};¥¢⌠═é!║?]τ>╙εwü∙╕k~u┌a╪û£╛≤╬Θ∙?°╙╖╛ⁿƒ■τ τ≤═╞S¿v=O╤≈ Σ\r £┌H╝%╫7▐j╡Vì╟ΓCißS░v┘∩úAtç║DL°ÅÿÄ╩Ölo∩≈Q┐╩!ε&c╤º╞$NWJ ƒrAkΘ6D5M⌐z¡Z>≥$Böƒ_V;╥dî∞≥╛≈U9p╚~5┐╢╬|ÿÿ│L,nç∞O¢╣x∩t▐▀q¬zU8╗3öR∞z*╧z⌐¿o┘oo0\0╔[1▓>s╝zσ¡nn╜OºS∙▒παsQ»╢╤â₧ó;αo*?-█┘UµúÄvúNÜT╙τ¿\rC╥ö∙(╥âhCj9¥ú&≤╤Σ▄╢┘N5½ÖdB≥5ßτ▒P=¥▐äH╝₧╒åPαÑÆ5jU⌠æI,áÅS╞⌠t2²|èÿì|µc8¡Ä⌐√┌■▌E├1)╡ ╬0ª⌠|u»K╒≤1T║╬┼M╕}iH╢═|∞é▀╡C$HK\n*èσ _▓ª▀▒M⌠\04jö╥LÑ`╒YⁿΩEñ½₧┼║φ4Ö(√èÄÖΩO█U╙Ω8}1╘±q║Ü:▄╖<┐Å║}¿╥Φò}N-÷k≥LPçw╢I─-«2òτr/ⁿ│≤ûε<▐÷▐ª]╠²\"┼\Zæ4CS\\yk╚▒o¿v┌▌_3cRΘ74&÷5Fÿ╦åΦw╕₧╘╙yεÖÅ·c⌠\0}█│ç/┐≈¥╦ô╔─╔3$╘;+░7╝│█64 1·Dé 3B*`w┘∩#îûU┤Cmú1-√│╡ΩT]»k▌*Vm¬lö∙}T╣°╢⌐fUº?E,φ≤ä▀ç÷│iττ╬∩\Zj▐├n∩lQE½¼û#╓äöº2òOöYªäƒa}_╜┬V╒°ûù▐òe|Æ²«f>v¥∙j[╩Σÿö≤`╒÷∙Φkîφ:GÿZ¼Ü«f╒u|╪5º≤*╜aù╢δ╠╗Σ≈╤╡zû ≈╢öôôúΘ╜ç╟#+\r@è╥«╩τ=0yCHi]>╦\"ADV╜º|ù┤!¿Ä¿\rεb2╣K╛φ╬ΘEφ╓m╫óæ%∙▓╘çªú╔│D╝k²√åΣ╡V╕╩·B┐ε⌡!\r|Σ/▓w.9Nùδ╪╫║Mº≤]÷Θ2╞Ülç╢xNm√3ö╙∙δαò▒δτ@] ▄╧┴\"\"óB\'tⁿ₧P]G┐╜\0ñh╒{≈2X)lÿyâ\\¬`█.╛5úV\\¡ª╘τ╘7Su▐}E»¿╔mî8ºÅ╤-╣Ω╕}·üñ₧%è_ö∞íL╝#u«╒P:,3╟+»\n ?Y║7■╠ ;╜╠oaⁿñΣ╨█KÖ\"ª# ╝¬½[╡╜█f╛L╜¢-█πè≤áªsG╫1╢Ω₧ve╟█V.¬╗╪4⌐»3y^h°ⁿÿZ|¢Nu*(╢9N▀~φ«▒┐.dσzèòΓ⌠═o½≤╪âÆ▄─Ç╟J┐æΓπOnW_│∙h╜µÖq╙=┬╒Σ╣∞)▓Mdªÿj%┴é.╟5}]ç▄┐εÇnΓ∙h╔XP┘│mJ╙╤σZÜ:₧	-J█1óLPε∩jGÆ_ê█ ÷▐ε╟û%╦Z+3≈▐╡w¥:Uτ£{∩9τvOwOwOO≈π±╟|╪╪{ÜaêWk┬ ╝Ç\0±┬H< √e\0ü°z░FÇxäîday<~@Ç█┤√÷╜τ~u╧¥ε√q╛j∩╠┼Cφ]òòòæ▒\"b¡╚╚▄R▌s½vε+>2\"╓·┼Z┐├τªτå\\|mT▀Y╫wZbmÉÄ⌡─q╓8τ╪»£AçΦÉ5TG]═6\0\0 \0IDATJoΘyªuµ£≥YV¬ÅÑbHêÜª┘φvMC7í>KîÆî>ü2f~ √/╢∩■≡σ╟o>Z}@≈ßU8ba≤FÖ<OoS∩╫╕╚çï¡MÄVv(εW⌐÷6/u╫├cδoεx┤σ║≡üÉÅ÷│¼¼W.c╩}G║}ÑìÉ╚╞ÿ«TÖ▓g▌╜%┼⌠\rwΣ≈$ÜÉ;π█Åi\\╡µüº<gªs╫5Njìu]√c0¥C└\Zy,|Æ╞ 7âΓ∙>╠φDD,╦ó*╦ó╕ò╣â¢⌡*ºπ=räà-@Yêó²Æèí≡¡╟òΘ\\¢φU:ªBôùC;╖╛/HΦτ╥╚9≥}╕╠Ñöb:BΣ⌠wº>tZç°²ê¿╡f┼Äïô«o$y(ì▐É╟sc¼²┌⌡e╛╜2/╛╙V^UσΘ∙∙·Θô\'≈₧£▄	B7e╜2)╣íb;-\0@▌\04Dç4╝/₧ï/∙01¥w>G-∩WÄKLàVî╟3\"àö╕.αí<(φ\r╥\'+\"sèΘÇ@}xkD?≥AnÅÉ╡ª_∩.├τ±\0}⌠╞╒╜TÆτî|╕÷Oj╝R▒▒⌡ÿ▀çK&E-πc,╛%9√pÅ▓*6º≈Vo]<Xƒ»V┬p\Z^ô±╤■NFA-1b@╚░\Zτ>╛ⁿÅ ô∩≡Θg█gpΓ·RJ▌W÷⌠lúÅ>.⌡∙╢▀╫C+µB╩╦#U┐6≥aa┐π╗ë╙ß├≈í╙\"╟σI!V%Fî┼ÿ£Ic≤}╪Dº└≈1╓┌zΦ⌡σ√╨ê\ræ▐#RÆ╞U(Éûâ7■┌≤─Ö╤╠╫▓8¥\\(╒h»\0B±Θº█╦▀ âÅ?{ ²ù|≤δº»∞╢¬╓╜w)Σú╡╔ëx\\⌡Å═≈ß{_x,■ö34┐	╡?δÖSΓLτ▌·\\ΣLü_┬oì0_ì╥mΓ┤▓ïà╦ë═≈aiÅ▀çΣZ#╣÷K8e$ïP9⌐≡}@α╝\0╧≈\rk╖─X\'é|⌠/Å{O\r┼x!CA2Iñ─╬éE\0W▒ï┼M╒╗]╙└¥4╝)▒°v~┐⌡╡T┬}╜5Φ∙^J╢C╥╦81√A\'R¬êà\\*} 1}ñ¢k[H÷)Efrqy>sd¼,_▒┤I∩╣ ▒╬░⌐2¥δ╩⌐╩b│┘,ƒ£▀?y╕∞\'\"∞ÆQì	ûQb@Ü≡≥≥&∞c▒(J╕à┐φo^╗	╟÷▓\Z╝(╜∞╘£zÑε┘║╓\'═V½òEï\"╘Orl▀aás	äÿ╬S≤l│>6]R═.╞Yw\"0ôï≡}u┐t²>k┤Σ┌∩zpÄ╙í╣g╕╢k\nY»\0dÿ╬ºé|Z≈┤░eü╦▓8┐w║<_-ì1 \\#$╟Çd─8k	\0á,\0í≈╘─d±ò╩DΓôä[ƒ┤■1│r╣ΩαZlVßÄ╖╗ç iªsΦï╪Y¿\\▐æ╕Y▒£╟╒kM≥m┐δ┌ªæ═J¢╫GhMBT╘/┼╡_r-\r╤\'v6/ì96u∙⌐e╗▓╚i╤4=~Y@\r√kYDP\0\\ ⌠-╕⌠g╟╩FH6@ε£:orφ∞n÷\nMΣ├├I9Φδ╡r±\"I\"c╦πzôñ╜h▄v]!σ2¥¢<▒\\-&Bαï┤ìíñG9ª>₧k─¼▓ïI -Z╧3╟Eî∩C*m¼╡╫╥╜5≈ ╫vI#Æ▒sG>x∩∞⌡╣»u*<;[UçsjïK⌐K>╪gp⌠=åN═╞╔HÑí╬;o█½W⌡σn╫|╪4⌠9Q7%ob1¢φU\ZΩ\ræG²Γφæ╬.ôΘ╝≤∞¡k»╛1▒\Z)díJMƒc╚BCN╚≤┬Y┤╝ÿ╬cε5c─å─îΘáπ-▌?sæƒZ╠ç[Y.½╙∩■µ╧=}⌠h≤░¬è╥`\r╢╤É!f⌠\\▓╥┐*╜|Yo╖[·╕«Θ\"x┼?⌠]√;╢d±2┤ƒδdª╛»Qδkx¥╗┌»>)╜mr9▐Ä<⌠∞¢<«■!²╥Φ╚!C}hx«º∩█╚╟¡«╪≤}▓é6Å⌡╨\\π╠I¢>]]R╥çπ}#K?¼lC▌6\'Ahì[ÄO╜.≤└╥ ]┌∙█å╤╒╧╡aB₧{î─Ü$╣÷s▀G╥█w¡σ÷úT╗|╧í┌≥m{	x╘┴]3}uû╓kα#ÇjQl~■[o=■ì┐ⁿìδ⌡┬dÇ`τ+òU&ùÑJA	,╨éσ┼≡É╕0¥ºΓ█V\r∩î$#╣ï\\Θ±αñ<≡\"\ZτRHAjîΘsê▒Éj?x╩æèΘÉ╥G|σç≡`n╙╟c─ª°╞thφ!α░fì╙A Oá9Oº$#╬]═!H[@W─╒C^─íδYy≥ΣÆ¿rôû≈j¬0\\ï╥Yí╞Γ√Éb═=6╛Å└q⌡nçMN{#%├╫Zu÷åù─╠zDÉ.Å(δc{╫╞jl╞xΘ∞bR▒=₧φ!\Z6Dé∙>┤x3B╫~n▀╞èƒs▌√ñ«ÖM)µ├╢τH╒!╔3D½ß·~≤⌡*∞\Z╪»1H≤ΣóPb]┴Ω╗╗p=a^╛l^∩╢⌠a]├3Ç6#zl╓α₧▀┘|╛ΘT│╠î═≈┴=êI╖├ENk┴l║│÷╪îΘZ·pτ╘╪|(R╝Z\\F∩fΓ|ΩLτJ▄Rjkyî¡╜/ΣÉ½╣≈Míh╧⌐5┌4ñ╦Ey·3_>≥K┐≡⌠┴z╜8 míEτ\'╟üL¼─@@lk±┼≤▌σδ╫═ç\'\'⌠|█▌█L»ìeD>╚b░Kx┌╡ÿ┴}3Ñ╠≈a[l%3╠╪£(LΣπp@hyd√^æ▒=█cΩ├▌Xτ╩¢í¡╖o ┌╓,_fp╫5í≤ⁿh╚╟X╝RÖï|╓≡┤>t┘÷╚╨âwLΣâ¢A1─▒Éæs⌡yUò¢7¥>■╩╧\\<8╣!$∞│l8^üîv⌐b5HÇ÷┘»j╕òG╤╞+úö╦çµ«┐ä┤≈B╥δ4╛ÅX▒:ª▀q\0ûΣ═¢╟c1Rrb┼b─êΘ╨▄╖àæP⌡ÿ⌐X¥╨≈P¬∩}┼C╫lé⌠│^┼rÜcó≥╥α\r╣║}àEY`▒O╤k364 ÷\\ffÇVíδ⌐ZXP@ï¼k%/ΓΣCèφ5╘c à;▀╖▌ìs åé═t.Θô╟├6╖3oFX?ª╞∩;>æÉçQÉÅ╝\\»│δ╕jú⌡\0ⁿ└|ù∙#àPîì|ñ└≈┬sPF\"hΩåÜ]MMC╖╥ìr2─⌠┼ädΣ╚\ZX%»\rÉ▓D└,░DΣ╠╬1╝⌐▒╜║x¥|å\rà█y▒y█bx åÿ╬]µR,─\"FV,≡xgcdßè┼<{═J5-&≥╗■Φxî⌡V\n¡ƒ\Z╙∙ÉÅ╘·╪_Q]7⌡v[7╘▄ÖÅ▌lXC╞I6>Ä╘\01¥jo╤M∩j\"║║~╡â╗d	áε²#ïφä▒<φ«^┐ÉL+╣ ╘ÄXLδ└╪≡4▓b\rΦ▐?D w╟▐╬╡êc╠BòÆ£╘πÑc$ƒ\'K_DG>┤╨q⌐½í╥{ç⌠▐╟¥╙∙αÅA¼¼W\\t▐¡}êPVeYö╫,Θ²╞å)≡<ó\'^èδ>╠╥Γâ_n?√l√ß÷▓yƒΦÉ+─SÉ╤╡6\0Θ3ZÖM╞╠╩òZ6+r34é8c┬äε#\'FV¼⌐díB%}\"¡Y∞╧S═╨v╓+Ñ·¥▐GΘ╡┌w_Æ╘ç\"╡Kδ≤|èë╦╞tΣ╨U·┼┼µ±π╟gV½¬∞X:à┴╪(<╜`╣îPR \",╛≈╜/╢∩╜≈≥├ï≤σ√ºº≡*Ü≈Å║╞ε}}∞$╟╛g╦æº╔\"ì|H!/«²φ*çµR;½\Z1∙>lsvl─┬7╞$≤fñâX°ε╟A>z│╦i╡g¼84ε≥W⌐=K¬]«π\'uÇùÆ╦═áΦSWjY»╕ks.∩≈╥¬*6≈╬VÅ<▄<X▐d┴Γ\"!C\nd├ΣH\rÉ▐╙]Y\"ö╟æ%òå≤╒╨ÿ█3╥≈ù╡c4╞╠2π╥Åc─Ω`τ}cñb,Rb:O9ò╧╒╠.▓Fî┼t3Fú%qäuH2s^J▒╛ε1│yΦ Zrcö╘▓^IÅ;v=.V▀ò,\nXÿrÖ╕b|╙╦⌐(æ╣LΦ«|τ ∩8─╣╚ç½>┌1\ZsC>R═è5╨Ω¢┌4É⌡*o9⌠iµ═pδW▀z@¿}╓M■_²╡Éε|+₧╧Uw.óτ╕║¼í1▓y┘┌z╨╒Æφ4ePö@>$µÄñv{╬5╛┴ß-╚å╚ê%ëÉ┐²?}x∙ƒ²?ⁿ≡∙≤║├äε2ù<ε╡÷~M√■┤⌠éº≤í┼\\.Q ╪≈ò╤<ù░≈₧uª\Z╙!%\'Flτsi}ñ╓êÉ√╘¿X▀H≥£Ö╬%èV<_JLτr\\πτ┤÷ö▒σj╫wª-Gn.WU▒┘lûÅ╧∩ƒ\\¼û╒!δ⌡|┴╞~₧â╤│b₧u∩≡Ω≥w ≤~≥╤╟»ZAΦ\0D@D}+\r&▒≤╣╔k╙zε·W▄≡╪J¥J¬º>╓vr╝Wmy&∙╢·AH₧t²«φZd9r·ª εæ▓₧╣╘:─ÆlÜK─X╠▒gNp·è,⌡┘3«▐!r╕sÇ+σ└└₧¬OΦ\Zß2«\\â╞#Æ<é~╢≤├\ZM┤Å╡Ω[│┴a-]c]τΦú▒╫H╚!ï╤┬u∙Φ=û\\ε╕`@]▄5╚╓╟1Σ╕┤» 9\"$\" ,\\¥,.ε▌[=X.{Ö╨üiÇp=K╣ôRû¢My╜rφ╢T@q;`W█√\'ΘE╥⌠─B*|╜Xc╘/æ5î█┐å▀╜æÅ9díÆÆôB¬oa╩êELΓ`E\"bgΣC:ïw═╥X√!p^O\r╒╫<╞räô▓ε8s97Äß▒h±├LâúT0Ñ2j¼║&x±ó╛6â╦\nK\0hε╛╗\Zç[ƒàTz.╗@QY*δº]┐φs\n╘º╜╣╕ªo9pε\rcñw`¬rñ7▒⌡I╜╡Σ\r\"¬k¼╘\Z1╞ß┌e╧╥Ü R{$Fε\'-∙\ZAεxr≡&ⁿï¿┘▀ä1e╜2y?┌dà▌½╣æ╥╔v\'⌡┬σesY╫⌠QY╥ê╕A∞\"4«┴Qh╨é·724y/lQ[f█µ6└ê╝░ê<╫vác²í²hδ█∩·╪┬H╔:╨$╛ê}δ\"-s╚WÄö>£▒÷╤╟aì≡Z╥\\µzΩπ\"=√1⌠ûögK{m\n:╟└±╓^│Bτ!ùh5╞₧à·H╡╦Ñ┐QI«»3└enH¡uΘ╩A▄g┬+#äΦ∙≤╫ç°D$║≤σ┬ É°ù╦ÑHIÖù/δφv█|X╫⌠>└üDΓΩQ7`▌╛n¼o╚√#uUïS»┤<δ▀h²(ëá╕ñU┼ß│(;Ñ%0ƒΘùτ|⌠û╥╟╫╦åBsSïä+d\\}Σä\\#JòxPb┤╟òΩu]╦cΘ¡╒~φ~îy²-#\"rp│Yû\0P\\CLΦ.FH6>Ä╘\01D*]═í█qç▄X\0C╒uM╘î=Üpé░zΣx?╟\rDK₧)¿î╧\r╒ç╘o╗÷iô├╤┐O╬aÄ`½·ε\\┌pG╡╛1└ü:m╧ü┼√RƒÅ▐▄wdHÄ╦╪·Ω3⌠N°⌠Åδ\Za{m╦ñδ╗∞╥Å£w8TGywé╦╗▌▀\r:ùj8╬k⌐╡▀e╗⌠I╜]╫∞ÉvàÄùD ╗╩o»-╛Aτ▄5s*rl╞GG╬╛╦û╦j≤¢┐∙sÅ∩▀?╣¿¬Γî^XîÉîxd─iE┐₧▌=\'─π?ä|h{ñæàσü@┐àz⌡B╝â▄÷α▌PÉn╢:╡m╜]⌡±=─║╙Bk≈⌠\\█─É⌐zàσ▒â╨╡æùXk┐δ┌å#Θ=5Σ#▓Ææ»πƒßπσ▓▄ⁿ┬w?■═┐·═δ⌡ó0X;m+░ê0as(U:\\OéW»δ╦▌Ä>¬x┐ x6wτû╧▄ªû╖¼Uφ▒R≈Z5ε╟j▌╖╡╡ú²╣Tî≈\0!ªâ╒]Æ┴╜¼╢kî²≥÷ñ\ZS█▓ Ñ8╛c\Zφ9«w±CbCB▐⌐╨½v{yda:\'.║V{╞X√9k$╖╛rñ┌·>Å!ƒ╗Wrπc╞jÇÉ>▄τqáVD4^å°?\n╚Aτ╔ûñb@₧?»_┐▐6╘\r=#ÇWb^+6≥!σæù÷~┼║o∞Ω}û║_∩:«⌡à⌠_╧w╔eî\\6Eù6k!-cδæ⌠╧■ë╙ó≈Hà╪\Z╫Z╗1F:V¡qìì|°\"∙_Å4Σô░Ä)Φπ╛V┴≡=║!┬1:+ù) MC\05\0∞≡*}\Zx▌{╛s%æ≤y√9╬·╔1┼JH▐█α▌{%!²l²%¢b½╧7╞σp╜=W1Ö╞╣\Z╙αs 6DÄ═█Ñ⌐Å╧F;µE36ä⌠÷æ├%s╒ï⌐º-µ├H8╚mÅD?█╞ò╞╦w\\Ah~p╓Hφvi╞|H╔7p&\\Ö╛qg╢≤┤k█Cπα\\╓V▀4,σµ╦o_<■┼∩<yprrδ\nVⁿÉ|⌡* ├Ñ,è\n▄g;≤Z▌Ör╛▐⌐{╢í▐\Z\ry\Z▐ñ╪êEHî	sl{τ╕╧Ig▌Cτá╧╪─╬èò\Zb!Yƒ½>⌐!-\Zπ7≡╝\Z±áVv1εg═52ΣC║┤⌡ö╪τ╞É7b!╙╛+▌U╣y≤ì{O╛·òçNVU7╜;╪ÿc@°╠Θ╣D()─Ç\\¢┐ïBüX\"Bu√─╫≈ò₧√║╞ÿ░|>╓²Xyα O:╝TîêIφ±░Θ▀y╢W,7µcL▐⌐ÿ`÷ÑKL╟║Æ\Z\n╚ë╔≈!)µA└ÜD╢ T-╛Å▒╣₧B╢Kù5RBÄDs╓■É■ë┼#╥╒àσú≡\Zφ≡Oç7è▒,╦óD─>■Åf`cq10▓!räH{°ëj║║å┼≡╥Xµå >╧q?}▐╫╙ÇBzJ╡#ìçφα@î╣Σ¬;⌡ü»Aó	╠-⌐9¬▌ÅR┘╝µ╞o;P√Ä{╩▐bì5\"ΘçB≤#⌡╖6├∙T╧ÆG╦≈aεôªnÜf╖½≈a ╜FFƒUâûàÉ<6╛\\f`Ç⌠Ü╞?·╤½φ≤τ█ÅN╓┼√K*^┌╜66Σúuù┐w■╟÷┤╗\"Æî¬!φ░y½b÷úÅ≈╧ñºNj╔l╟s`Ea:╦τc\"\\∩¢Åτ?$¢╙TæûÉ╣═E,Bσ╪╞%\r\r╠fàJ⌡ï2}╗ $▄¡╤╢FJ¡╡▄5╘wÅΓ╓è|H#41⌠ù┌τôC,,mpôC╘╘T∩vM╙í┴\09 !6Æ┬ld$T╞ê1£■á°┐≈∙÷âÅ^~p∙║~Ç^≥_─╛d<╫{≡╥╕g╦±╓HµΩw±vI╟rh÷ch.{ε\\Ω;\0╣lF\\4b,@Hƒ9>sV\n▒╨╓{.Y▒B╦Tb>ñ·1╛i}|π╡┌{^J┤%5▌\'╚≈1∞â└ó─ó(░@^,tÿⁿ9d─ÆJ\045└ìü╦≡É#R╣▄╣àP»╚u±I╞êH!Æ▐╚Äε╘56¿⌡Uƒ╣ï7C▒αx▒Rß1Ü¢╢9óJr8π%ìh┼í\r\"\0{ä»▓╧⌐╘?E╛ë╡O:Nä┌σCb█C$╤\\╛⌠ÉÖ\ZOçö⌐Xö²!╡*7δ╖?9╗X¡¬ε╦ïåê╔║╦HH6@ε╬X,\n@,pÿ╚r`\"ú╓²iΘ{Ñ╛≈v}σ·.\0í1\"í1Ær|µÆ)6ä·@jNr╖Æ·tδ¢Jlx╩┴─Σ╕\ZZ╥²║&AαZó]*{äo|íTL╟XφÆgM∙⌐g╜┬äΣ┤ÅH▒9╗┐zⁿ╞ú╙ï╒I╒eB╖e╗Ω√e#$ì2v\Z▐[I╗ ╬|t∙╖~∩â_╛¼▀\'éùfoç╔Γ▐ï#╝·╣35╡x<ñs╤█^┌P~S;ñ°>\\rΓ√⌠╖½[Ä÷╢╫╡┼≈A╨ÖK]JΩ╝!<Sα═ê¡w,9.kû╦\ZC╧¡q6╛Åk▒┤G?ñ╕$∙>$╓,ê┤÷i╡ï╗╡K≤}hrfp⌠├@²mkt*<Rr╨cεÿV*Çî╫¬\nFC≥u½lÇ«ê°╜≥∙δ ≡?·>∙±┐Ω─Çhτ╓τx$c4ñ∩kΣf≈⌐?V╗]b>ÄÖ7c\n╠δ1▓P┼èΘÉÆ3 D∞5ε≡gn∞çt\\∞=Bj═Mò├J{ⁿb╦\r┘τBÄA)⌠Ej▒(\0D┤ a±{╪\ZôìÉDJ∞+X╜o[Y\"¼╫%~±┼Ä\0\0.╖═ε÷│£╪Å╓z∩Θ╟╚Γz/╘≈▐«t-Θ·╗╧à╞tÇº╙5ò²≈¿⌡y▀\\Bôùè;╢C╞ÉdV¼▒y3ªó≈╪r\\▐╤ÉX╬╗δ│é∩▐Ç<[╓+nV,k\\╠,d┌1R<sΓ√0╔òµπΦ╓#!«<Ü1-\0UU¼O7╦╖╬∩»/V½▓∩\nV_σ╢¼╣í╥[ΩÜαï/v╫ôcQ╒≡D	σhÉ║g+φ!╨Γq╜/₧:▀τwƒ╗∩─ÿKå∩yÅ╡iSM5╞b¬zï⌐5╚⌡{Ä╧a╠;√\Z²¡1çò⌠<¢j╠Gî\"å0W▐É╜┤▓(Vδσ┼┘┘╔┼rY!ÿ∩y┘«\\íτ┴(ùÖ\Z ╘√&^Mï≥·!┬█∞²≤&êΘ▄µ²ßfW2═δX╠Θ╛▐K╔·╟╬eo±V┘ÿ╬⌐∩É;UL─éc─#bí5«Æ┘╡\\│éI!.╠τ£æ_⌠vj╚çvv-I╞tùCÑ6▀w∩ÑzñÉÅ╛äLSC,tæÅk╓A,«vfD|∙r█└₧∙»ÇU¢σm\nF7ƒ?s9\näá «╬ß┐ì⌡σ╖╬δT2â─bN═V%]¼î.«w¥ë▒»ñûàJ▒HU∩╣╩¢y][₧eGφ¼\\SA>ñ≈\Z)öä█àæ+9c╔¢7≥qg╦\"á╒¬║6\'\Z46·«i	,`╣Hû\"EÑv5]6\r|DD╧ëÇ╗│±zn\rf╜\n═┬═µDÄ⌡·d¼▒╡â¢Ek¼·╡σα└x└~₧└Mα+▓^╡τ┤ê,	╞╦B5$ç@.ô-Fo¼lVr╞╬╥σ√£ñ╘ƒ{╒φ┘«ε|ε╗╞╞ΩGΘlN!kƒ╘₧┼⌐╧5╬▀■ù9ß▐m3z╓C₧k╖µ gX>ε╦í█ù╦r≤W~πo¡╫╒EYb┴╪,∞)ys╔H╟\0┘6ùuM4\r<ÇùßZñ┘^╟b:╫bπì]┐┤£\0╧₧≥┴ò»┴ÿr╕c-Ö=k,9Rπ¬¥üo,╞t-y&qc3¥kìçXE▐│╞╬µBφ╨,∙ºƒ·╦bYn~±ƒ>■εw┐⌡p╜^ûp≈û╠arBF.╩ÑJQ⌐óD┌O«µ╓i\rWGεd+Æf{%╦AM*FC;µ┬⌡Nºc╝F;··½çΘ╝[▌⌡╫¼╦9╜¢l\nL▀S`(ô1~╚ÿK%¢Uê▐í∩░ñ<█π\Z≤1f╢½ÿ▒1≈¼1▄Ñ│^Ñ╩tN╠╡┼g?òëΦπ\'á@(╩═╓«) ╜Φ,┘└╚H)ä╓ñ┴;s╞yΩL¥ΘGjçt?j┤ú∩╗dû#ù<·Ç[▀▒3ö╟ûë╖KJ∩╨τScNùnÅ÷x°«σ▒÷¼╠t₧■£Äí	Äy£q \0h¿iêΦfsn}╞G▀∩┘Iñîuk≡N╔δ╦µ▓«ΘúªüF⌠v∞8^ t╜g╦╜+}▀VïA▄╡~╙p┼b0╖╒▀w?╖ì|tb:∞╩╪⌐qÇ;F#å@3ªC2÷a.r·µ8wìë\r±╣ïó7y¼!┬≥l▒╬1ÆφH36Bcà¼╔1▄C√MèΘ`8µ├ù\\\"╞┬╢g╕«	Æ¼±¿0╓å~█╝\\öδ/┐}■µw╛²ΣⁿΣñ*zÉ█╨ qΣ╚α¼■Γï·r╗ÑÜå▐h wªì╧=aô╫F3ª\"Ey>╧ç╓/┼ΓδÆ∩Ç╝╝9╥Y¿@░>\rå≥9╔	Y#\\δ}ùÑX╛⌡\n╦Sc:e·╓Z[]╫▄▒c:ª≤C>@║╚w╧ÿÜ>\\=»,É┼ó▄<~≤∞╔╫┐÷≡ß·d╤wÑ¬{σ╩fmeCdΣÆΣ¼ª!jvDp├ê▐Ä ░≥}H▌╢ ╡ÿ╬╣/╜δ╜iεüXÜ┼╫tä╞ú»Ä╓│D¡Ñfê∩├,b╙=àÿÉπ█.-9╛╝c╞¬╕▐┼Oì∩├σ╬╗$╙9)╡gî╡_ó>Θÿ_}]┌r╪╒Ä)╤î∙░φB▄:A╔&4⌠╥ë∙Φ∙╝(J¼¬¬,±:d≡jU√│«┴╥5HHáA╣L╨\0ΘÖeÇP\"B	¿ù⌐H;ª\"Vîå4s9w≤≤e0▀▒%╧τb≥ftδï═P>╓╗µ;wª≤[om²-▀├▒Γ╨RY√c╒;Pj▐H∩U!zºz▐öΣ╟#H?δ╒░\\\"á║ªf╖½¢G!≡áM╬╡+ù√╡╣╠╚\0i:] êE%\"û╨Ä<B>\\╝¿\\∩ïDfy\ZY╣·₧\'O∩É»W╧äÿp╜U¥∩Qδsÿ∞¼W╢1ÿK*▀zªèXHe╧!╜5Σä╩│</╬t«ü|hd=Jg⌠▌â@░]!rb!Φ9▀B⌠I\r▒Ç\09Y»|σ5MS╫╗åZ╚ß▀┬a╩ée3Xr9rñ5═êíáz≈*╨√σδ\rôF┤É\niy╥êàö7╥⌠y4╔!ß\\_ÿz*⌐zªèXL5{╛╙┬Yº╘ÿ╬S╧.:_┤2║:▒╞.1ì¢sF,╞╬påX EëçX]½╒d|áß╣╪âÜ╦É ±δφ╦ù⌡╟╦e±A╡ÇWwτ⌐tü4Rß╦≈!ì,H╡╟╓>-»^\0▀╢₧╟Vå₧ñ∙>╞î┼\0üzªéXî╙┴y╖╞αε√┌½\0\0 \0IDAT╟≡Yôî^ñÄA\"ëΣ°¼²!πΩrHè┼≈║a@┐╗$╤ε/▀â╜»ì1{ô╦₧Ü\Zbæ\Z≥▒?¼.è⌡∙┼·═╖▐:;_.YY░l╚H√≈ldîPR╠éà °{_l?■╤σù[zÅ^8~¥ΘEè╔Lε╒\rφÉjÅm!ö╚fÑΣ!FpöX▀,ΣÉp hdΘèüXHe╧\ZKÄd÷#φ5äσ┼╩.&▒ûå¼⌡Z{Ph╗Ræ+e(┼>═QÄº▄²σⁿEUnεƒƒ<y⌠╞Θ├╒¬,{^ó>πóÇ¢îXhx∙8)|sQ(I\" ê╨fBgxoB╝Hc0ô;fÿQg:mO¿W\rπa≥Vu₧Ñû£62{δkhPoh╖ïâÉ╪╝;S╔BJ·L▒╨bD≈yG╣∩pdΣ├√í╞t╬E,└qMÆ╚╞5Ω%╓·╨5τcΦ▐ú⌡╛äÄ\n╦sæδ│º°«╤╛}⌐┴>∩/«■{╗ú8dâ«F6DÄ╨\0í⌡I	╦büç╗~ZÖARg&Å¥Ek∞ÿÄÉ±Θ0≈aD╧╝:r╞Ä▒\0a╜%bl(@OP╥╦│?PkOÅòàJ¬╛X┘¼bφA┌{O¼│▐°>µ╩ÿ.\'ùê\Z ╕än20êi|⌠Yφ∙Z╓\Z ┼ ?╛┐=;-?·¥▀∙Ω¢╙Ωò┘╗├╣g-üThσÉ;ïûD{B°>0l<L1Σ≥┴σ√α╞åp?¢7CKgâƒb!5n▄ì▐⌡ÉXÅ5!y╛ΘX¥XA∞╪æ▒æ█₧íà|Hg╜≥æù*bô∩├]nUδ═f∙╞²√\'¥É«░íkU▌┐e## ╖VóΓ∩²²O. ▐▀ Σ╒wδ╔{,_°shyë┤ΣìòE╦╖=RêEHlH≈½╛╚ç═!₧cö\n≤║4»êv√A░²)Ä╜δí⌡╢#y╛PÆ║åôÉ⌐=Hj/üæτ¡╦>ôèε⌐\"iì9ûEq▓^><;;y░\\û%Üî\0{@╟âô╦î\0\\,N7■⌠╙-\0\\^6[h╩_\'Fú√ìyÇ\Z¢Θ\\Ü╡vª⌡╛.≥1┤Yπ]u╪╚çûù*─bLªoMäd\n16 ╘.╬╗Ω╣╫F>äÖ╓Gδo╬Z)æà╩W╬ε>ç╚▒∙H┤▓^à╩K▒H3δ╒▌s_ü\0\0eüeδ╪}ΘçÅ>C #!GmÇ\\»░█-┴┴°\0\0XTE9<1╞╛∙█[ò2▀G*w±SD,4⌡÷⌡╛σ╪┘ÿ╘ⁿvl╞Bh0▒■÷▌k┤Σ─fpù▐Sb£√RÄ%╬|N}E\0\rA│ƒ6£δVCFH{ü╠F╚æ\Z }&3\0\0╘\rmëαc\"z	\0k;≥1Vîå┤<I∩ÑK²íσ╛²m2>l|¥¼W╖■6┤╔╣µnƒ+o╞Tb:8°æ\r« █╞╧▌k╡Éì,^)\"▒▓Y┼╬&%┼∩║ù∙╓*_2ïVjêàf,èm\rΓ╦φ₧√êê^╝╝lâîHtº■Φ1Br║▌DJJ< wv─z╫\\╓u≤~╙╨╗\0m>φ▄Ωα°╝┤<pöè⌡âG?║╞t°d┬▓±}─╠┬4U▐j┐∩\\ò≡ÆÑÇX°≡OhsA`  ¿▒&I¡φ╛r|╫àX<⌐]┌gPf9ß╟╗-q▒(»∙=:╞Gƒ┴åH.GlÇX▌pt├B²_ºü╣D¥τåbm9▄τ%σq6σ╛÷ÇC²╥²Σ*=>o#x;╛≈╧a╧τCrεΦ▐mxm8}@₧rl₧∞⌐\'ñ>█┴%Doë~\"╞~ß╙Å 4α┘nù±ÉÆτ╪»DW?&âπ╬τ«π═}^ó┐C>wY≤c¼í.≤æ╙.n√|╧k6╣Råô┤■d╪3É9?╣k:╚r]3╡σ°╬=O╣√.Z,╦ô┐⌠┐■FUτEüçlX⌠s~\0╪»`eCΣH\r½▒ï╫Lûê≤E>b≤Γhy█ªä|L5¢╓z▌D▓>Θpír%σH2tk╚c«─ú\" 8╧R@>B╫Γ╠tnƒÖ∩#«¡wεvY-½═ƒ·ÑºO~δ╖╛⌡`│Y ╙┌A├Kä┘»$IDx°ƒ╦╦µ▓⌐ßc*ß(αM\0╪▄<óæDïù#46à[┐δéΓs_╣» ]│Y┘2öt₧Ñ╓!¿²vÿ╨╤ò╟â╦┬eB;╞b*▒(9╢y¥ZV░X▒\n\Z≥┌σRÅ∙pφoêTÅD6+╬\ZεÜüÉ╜▌é▀╟XLτc≤}pπ	}τ`è1æ▓i!bY┼ó*o/T╢@t\0^`PHÅTÆF@^╝h.w;z┐iα]ónê╦<╒\r	=%╝y>φµ■«äê!Ü≥cB,Rπ═ê╤«▒\n>≤R╨ëùD╠ç─┌*╓!▒É▐3B≈<⌐~╙É»5÷∙HG■ò╠║ífW╫D╫æ▐ë╓τIèu╕╩eé╚φ,X55p	\0ùp+úü⌠╜_Θ√╢«≈ùⁿεAw▀òε≤╥▒,Φ(giΦ~>½q@:┌1√▀	nnτqσ░cCLsI+╞B2ªC2à,z╗╚I¡]\Z▒:└W╬\Z\"╜╞∙▐┐Ä≤a[▀$cbñbñb:8≈÷%≈⌐╪º-]X.\'Ä0$ÄAR^H¼åö£ÿ1≥{╛G\0ï¬<∙╥╙≤7┐²¡\'τ\'½E┴X<å,φlddñ*\nD@¿αΩ¬åy╤b─h°zbxƒ\0dbY╕▐J╫°Ä∙í╝ XÄáwî~L	ëæDl4│C┼v≡Iú┴╥rb¥5┤φ=C{∩╤∞∩XuëoFö3EΣ«Æ╠\0┴bQ₧>~δ■ôoⁿ∞O╓ïC║▌íîW╪YìqΣN;╩RÑ¼▄büÇê%\0û╖LαΦ╣⌡]∙3$r╔≡cS└±y╫√╩╛╝.1.=}G-9╪≤rτ@hlê╔√d█√8Äb─t╪⌠ûα╗α⌠#≈≤╪<╛w±╡°P|╓$ß5╬√í\Z≤æjîì╦Ü∩2Å|÷ìvà╚	φ7ûƒ\n▀çäsFô5~\n1û UU,ï▓,≡X█ ΘS.ºß═S╣Θj2±)V[Ä╫╔E₧φ@½┼£╬e╙╞└~⌡A>|<╥─ê²`╩±zNÜΘ¢K▓▓ÖI╔¢1^JNî╤φ6≥\Z├åHp{SD\"%╫▄X{LΩg\'md\"fF0	94Γ≈]≈░▒√╦╥j\Z¬δ║iê¿▌A&tN▐≤\\Ä╠\0Θ⌠O?█n╖█·πσ¬°\0\0^Ö\'╣Ff	»ö½w&4+╫╪∞╗\\Σ├╥&ΣπÜ∩ú{HΓf│2-└\\ä─÷WÅ|▀zÆ¡ë3C╙Ñ▓Yq√ç+çs0ë┴α⌡I╔c«q╬Y»└qφÜ*≥!ìèç«╡á▄«╨Cñ2ß▓τ°╚ù╥█&=uΣ«╜>c₧*≥a²>555╗]CD─M╜╦╔ûòæ╚%╒,X\0≡O╛ ┘÷ºƒ^>½δµç0╚ä.}?6VîåtV.ε≤Rµ▄g▓bì╩t╬òOBr$\nÆ╝Æ▒*«²3vV,≡öô\Z▀│╬Y»|╫║T│ï╣╓ùjLç╘▐2»&\ZkÉTû)Ü╪ÿk╬╒¢╛└q╒░]│2f#$bI·\n╓σeCu╙4DPâæ	¥≤\"─Γ√≡}c!╛^╜.▓╤²₧/≥╤æcD>|∙>L⌡┌ô▐.1!^\"¢╫L▒ô7C3╞⌡9Rk£\'▓ß╠≈íü|áB┐ä]°>b┼tH]1ôµ√@ß■╦┌¥*≥ß#+t╠╡∙8@X.W∩²í╡*N╬╧╫Å▐zδ▐²σ▓*zü≈a3\\H≡%╦eB╡&\Zê«HìtLàVîå┤<▀÷pÆ└╛n╔B>(`╠\\σ°╞th┼X°É₧╣╢kJr|╫ê⌐Φ2┐ç>FÑ·╟Ä╒σ∙+ªcJ╫╙±╚eº;ú╧\"╞ö∞╗b▒(7ττ\'O▐x≤▐├╒╔-ñ╧á8(X└═ìƒ>#àôk>ù#0@«\'└∩ »m┐╣ⁿ°_°φôO╓çÉ!/ï═óûb½+ïûF{\\Éë╪É₧g∩ê=\\╗┌@√·Q\"¢òï╟U\"ª├$╟vHÖ*â∙£b:\\∙>Σ│DE╬ó╠tε3«á4«.ç/m┘ucqφw	┬GεíQ¢Θ▄W∩X╚çï¥╗ºîì|h╟1⌡F@,░(\n,░▀sr08║┘░l▒!╣D.)╟Ç ├▀■≡≥_∙╫ ╧ƒⁿΣº╗ß┘{╜&C8TεLτ╛φæ@>b1¥âƒ£Σ°>╞fL?å,TR1 $\'%~Θ5.û~1c#╕∩Qî╪É╪φJ╡dª≤±Σ─Æ╦öO\0D╘QwÖ╨√^Pa!╔àQÆD@V½.╬ù≡±Å^\0└σe╙├ä«Öa&╘█\"¥E╦∙ê¥═¬[┐%╡Σ┤╙y▀·ZL╛Åí√┼ÜY¿\\ΣW>öÉw╓6╖c Dπ¬ò%j*|ce╙vh¡⌡╢gÑ╣ª\\╦╘°>b#.Ä)ìlRZ|((▀/ªñ¼èô═z∙╞²│ô≤VHwQα C▒!∙┌╒▒\Z »_7≡±Ånn\\UVp¡æ╬0╩≈╩≥\\█∩Z┘¼B╙╢@>1Ü▒!α⌐┘ê┴\"ëX─î1A╜}·)d\\%╓¡5å\r╡q\Zk\\}╫R¡╡₧3û\ZÅë╦~æ║ⁿ9#Z▒Ü1<∙EYö\'¢σú√≈╫V½è├äÄ`÷Ü\r±å╕x\"rÖï╥-eë╨6@Φ└>â╞.▐∩U∞,ZRHZ^rôù2ö7ú≤╝)ªπÇé▄A>|æûí÷sⁿY¿ñ│kììXä -▒cZ|6Bx╫cf╤╩|ßk┤MÄÅ▒ÄÄrñ⌠	9∞╞Γ√ÉÆ/òÑK;█Wóô∩CB╛ƒ▄¢s_üÇ\0Eüσ½W╗╠╚ç╔Θ\Z-«╙lîôRH├â>R1v-⌐lVí}Fßu`∞lV╛δ╩%ªÅïkJ▒:\Zk\nîñ┐σ{;[T*π\n·° ╛≤!#z≥τÄXh¥æ5τ╣⌡4\r5eëCΘu√<SφlX!o.g√)(╣█5;\"·äê╢D╕/²/q█+Nk¢√╣ï<█\"π½GnW╛╔Kc½-Ω╚éü·¿º>∞∙*]±Ç╨┴>9£}∙╨╨ƒ╘│YúY▀▐>1⌡9|╬ò╙EHH@;BBé⌡I┤ƒ≤.╕╩ß╠#N╗\\▀u█╝uφO╦≤DW?&é┴;ƒ√╠lÅöbΦóîº╘╥. \\b«⌡í≥QQ╛ä<	9Æ∩g╧Éù╡╪╫P╞A╜»╧}√Åù╦r²■ⁿ╫▐\0Ç≤ó└·ß²ó╙É▄8AbX`┘\0I┤ \0└δ╫═╢nΦ=\"x\0^║┐¿╛╠α«≥PΦ%îσIΓΩÄrc▐┼≈±┌î═ÿ>å╫⌐Ü⌡ì2ÅªÉ²╔≥╝3╙╣0╙zpª>Θ±É\\├C▓bír╗b∞\'Üu═╣s╓+Cf╡¼6┐ⁿ╦o?∙φ■[╫δ┼ßZU▀╖░v╕M6>J¬W░n═╩╫»δ╦ªªgT╨▒─\0░╢{%└ΓUΓ|.¥uJï∩├╗!═≈╤~╓ªG▀G\'δ╒⌡ƒçb:`└+π╔?┬₧!| s╚BÑcíÖàè╦?ΓÜ=╠σα¼█¢Θ£╫0⌐v╗~ε½gìÉÉâ┴=DÄv╠X╓xiªs╫C╡d╢»╘∙>|╓Fì╣ê\\╒pQòσjU┼═ìôæ╤à╝çxBrëTRD@ε¼≡»_╒ùM▌|D╧Ç≡U·╚ç6▀çδ\"0G╛╨╤\'99c≤åp6aƒqèüXh╠#ëv╧∙σ═≡òr░è┴πüæ█ÑUb!╟╞t₧zƒæ≥x`êj┤½¢f╗¡║╬l3x|╚8ë╒í╣$nÇ▄)uDäùD╨├ΓSßz┐┌vöÄσ░▌3F╧·}σpc(▒!ä╖3[r\nΓ╟▒∞ÿ«ç┼½bè\rZù\\bl^$╔NL@▄ÿ▀.éb╗ï»½┬╒ç╗▒º≤ß╦B\nφv²▄Wε\Z╩i┐D£ w╧\0ï\'α╩òè╔╨╥ƒ└-É;╛r8FC╚\\╞Ç╣π:≈$σ╞ö└bQ£╝²⌠ⁿ╤╖~ε±²╒jQÇ¥└£r7ú┘\01(ëê\0E	êoÆH{¥┤ÉiOT╛¢úÇë«á»g,O{Jêàï╫J\"U!Z╩▒:Aƒy9\'Σ╟C;ª┴u∩É╪3ñ█í½ñ¡╗v=⌐f╜JIÄv{σ╥ò┴▓XTºOƒ?²µ7▐|╕>1╞Ç⌠ó¢,╣ÿN╣@z1 }ù■í,┬┴ëÆï <╖╜φαΘ\Z╦a{q}╩Cσ8≥fPδ╘■█I√Çdδºív∙≡F╕≡è╪6╩ÿ1\Z╝!>1Z1.φµ;è╩·Ç╟\ZΓ≥∙╘c>└qmσz╕╞║$îK£ ΦφsÄè≤æ*▀0≈ƒ─╛N%->╬\ZêsI\'VèEU,V╦¬*\n┤!\ZC± }╧σ╝GhÇ⌠╛┴ï2τ¿╓ò>iµt-ªuWÖRr╝YΦ√nK1¥sσä╬	∙╥╝$ñ7Φ-┘Å!rCµçª>J≥P¢≈$&»ÄDë┼πí╡ghφ%k°dΩI╒ëz╛╒>O$¢╒\r╒╗]▌4D«0Ya.GnÇ\\ùó@(«Φ/└÷Σ╨╩Ne;pi3º√z╖B╝4>SQδk}Lτ>·°0¥√2╕Θû\"b┴1╬bdí2ì-τ▌\Z3+Vƒ╛1│C╣╩hç∙Ç⌡ç \Z─â\Zê8╬k╫5=t■╕Φ)▒ºî]Oh¡Päè;}æX}╓╚öΣ▐⌐àÜåÜ║&║^τε\Z╢¼Xª½[╣dñ5ú\ná\n\Z_∩òû╖6╙╣ⁿj½╟τ·ëM┤kl9▌C╫▄-╧╢∩≤⌐y┌SC>b;δRπ╒ë╒./T╘=u╣0≥Ä¡ƒ$bAo╜±Eä}▐▐áR[╓+äß;╫\\»M.s6@^┐nv╗}RV⌠π≡╡²E⌠═Θ.q_╪4oC₧wìΘ░-\0╩╝╘Æâ=r╨Tƒ»>>1\\█▄ÉD,l┘¼╞F╕▐╖╘y<|cu8∩«TlS₧-÷]=┴Zⁿ% $GΩ╛<Wƒí╡/╛->═ÿÅí╡95╛Å$┼ûQo¼╪Å⌐≥êt»Uqrv Σ╤o▐╗┐\\ûàa╗FF±α≡ÇΣÿÑÆr¼δ ≡úù»? |√▐nG? é²≤#fv*)■╬K+æa╞τ╗Φáú∩¥│^Ifí\nm Xzôé> ñ$áÅ⌠╕Ä┴t.,Å¥⌡*%■═±╨Γ±ÿ+▀G¼rL|⌐≈┘─xD÷≈`¬E╣9?_?yπ═{ÅN·│`í┴\"┤eÜ1m└∙┼.ô@@■╦ Ω¥φ÷u≤∞╖√ΘW½Γà▌δé<⌠}GÜ╣▄∙ÉBhLP`îà	∙8@ñª¼XF»æb┴ëΘ f}ª÷K#Æ▒!ªCæ½\r}@Q╬«%9╥Hüúg╒9δg\\&─╠è%%Gèy▌!ü└vq╫viªs⌐├⌐╢_k╧öÆc█\'\\╫╓t│RΘ╞o▌òÅ\0Xòe╤ë\r∞ñí½Y╨≤≈íCSFEKΩ< \0┼≈╖~╕²k ┌▀²ⁿ∙╦▌3\0xε╜ÆPK╔êÉà╩√╗₧₧ΣÄQ¿╫&v÷$)─Bië╔ÿ₧:büæΩ╙B\n,≥£∙>|▀-╛ÿ╨~╤\Z_Σc¿σ╞>.d9π╦ò~ù√e A▌4╘t╢:rPNÜu1çÆ4rvV┴├+°ß╗╧\0`╗m^┴5╠&q▀V\"├	G<∩╙Ω┼▒yIêà∙└Ä╚▒╫ÿ_dâ█Å696oùoåTîëb┴9 ì┼çé·s╓ÉX| ⁿ£dV,ëCÆ╦ⁿ@9C{P╛⌐╪	φ¼W▄╜+v─Æâ \'5&┌╚çåⁿ╬ß╡,N6δσú√g\'≈╦r(½L;█ò) ▌Æ╦▒\Z ƒ╛â/╛╪] ^]&tΘ√µ\ZïΣòδ⌡æ├\\PY╚îÖ½╔∞Y.z°╚ëíO≈╨ò\ZoFJ²¿y\0|^ì∩#⌡∞bírQh╛─µ√ú»R/∙≡7╠º:Åè¬(7╒≥╤∙²ôç½eUéÖ▌ⁿ`\\⌠┼ëÉ┴Hi =_╡:2Σz└Θ╢âál}v┼(üä~fL/ï/╫¢─E>\\b:$╟ï;╒«]Qk≡╨∙ÉF,ñ▓g⌡ìëbß├<.u_8$╞@▒αdíBÉß√≡A>╦ó╠tî∙╞╤O√╣δ≤Æ11Σ╕¼φ\Zç]mªs▀├Ω╘Éù█Sì═G∩¢s\" @Y]&⌠εù9,ΦΦα1╚Φ╚╠\rÉ■7¥p║ò÷║ix▒$æ▀,T╥Y▒╚^rΣ╞F,ñÉ╥╟w╛î╔πßh+▌~9¿4«┌{Æ4▀╟X·ì═SΓ¬7Fûπ╗GLÑLüΘⁿÿÉù= u╜»Hìë¿!:x;ßÉÄ╫t_╗²\\1`äm╢9\"Σ║4D█åα╟Ht	\0K─nÉüφÇ╦ïÑà|╕ .!,╛û,T╘z[╕⌡5(▒eL≈⌡÷╠ò╟├▒H!+ÿä£É5D(ïû▀╝!φ╒╚╞⌐Å½╖»æ=5Σ#V╓+)²SE>┤bgb┼fHd╙╥╥{╕≡v╞+ z²z╫ÇÖ╤╝{╜¬»S2¬1B)ªñl]╙eS╙3jα\0ê╦|è═b≤\n╣\"á ╟í\r╪w\0r▌╨┤°>RêEáä⌡æÅ╨┤╨Æ⌡i╔	]C@xMj╜oΦ#Oπ∙²\"5«k╜ö⌐=B{Üéⁿ9#Ü╬⌡ë±}╕┤╤uüΦ╗óàæ;- SRv≈oG\0█¢	dcΩ&µ╦╙■Aï╝vlÆ-ï╚φC]c#║ƒ│>r╨┐█ⁿ6≥A7 OpuMε·s4î⌠Θ[\\₧âü⌡à½÷îç╒╓uεÿΣ⌠⌡?ZµÆÅ>╢\rè⌡ûj?τ9wW≈sN√\\·ü╣í]²ÿÄ├τ∞5N½=1√E║>Äh?τ=Σ¼²«∩│ÅⁿÉ¿ñ■─\\├╣²èürå÷_9╢∩äÄ╡╦┌τ#W+â-S┐²c╦Ey≥δ┐÷╡G\0pÅÄ╪R±Öb@╨p&╬FH6@α\0╜ò√ö≈:∙z\r|╝=>ê┼XLτ├âΓ^ƒK?╟╬zBrRΣ±p±bÑäXH╝»╥DhSσ√╨nO¬╚ç═┴)ëågΣCG■\\╬╡⌡Ü·∙y°¥[«¬═ƒ■σ/?²¡∩■ⁿ├═f┘M╖k3B·,╩┬▓dâD¿L*d╗mvD⌠c\0ⁿ\0▐ÇM╙8<╫≈w)µr.╗kL╖&│P]#]╥AW╛}|b:\\⌡▒!M}có═π!⌐Ol▐ì,Tá╖╦≈╡ÿ┴c≤}82¡ï╟X╠æΘ£│╢ÅS+ªDJ¡■0┼	Ä┴D?Uªs«├,nV-D(V╦▓Z»equk(πò-V╫╨\n0╚izâ╩ñÉù/vù╘╨{@⌠\0xεnöJ#%▒╝=Æ1í±\'▒▓Ñ╬≈ÉJV,W9╟½è∩iêú╠≥╝3≥!î╝╟FäΩσ½Å╙∙s*╒╜J[ ╣#SD>(¥■%áφ«⌐//kj▌FmEδº√R≈e├2-\0╣│▓█┴k\0h1ów_èÉ{╬C▐\rn,çOîX╝=▄╪[}└╘┐πm╕■s\'÷π·δ4≤ßrÅ╫5µC+╞─Σíü╣f≥╓└Ç7╟cé7╞üƒßd╠╪ÿ>ûδ╜gt|╫Cb ╓$[L╟¥ÿ╫╪è╪1R▒┌1&╛1╥≈αc╟|h%Xæ╨?D₧)å─u|╕▒(.c\"¢î5[b.╣\Z≤q⌠»¬b⌡⌠╔┘├o~πì│╒¬,,¢F┴≡ÿ╣x7r9ñ(αΩ┌Xσ?°╥╚éVîêï~R┘│,u┼║@╥SC,$╞╩┼kö\"bæbl╚ÿ▐?[╜1ÉèX⌡k!\rRφôDá·~ƒ·ò∩⌐≤êh⌡┼£ΣÇτ^ôó▐·╙òCf▒,Oƒ>╜ ⌠¢▀|πßz╜Φc;∩3B·εΓVf6>╩ñb@¬¬\0D,\0░∞┐Å└=öà≥m╪₧ôf:Gív╪⌠∩╘iΣ√@F≈Lë╟â├ä╬æ╙7&Ü╝ªä⌐≥oh≡Åpc4lkàkEΣÿÅk5┤°>$c:╨±=⌠=áh─ÿ¡┼≤ê[_¬1Z·K╔ôè!æîE╤µ═âΘµÆ½■W▀+╦┼ó\\¥£Tïb∩Ñε±╪ΓB\\ÿ╨s*S@@«▀▐┼óyxR╙Kö▀·δ*╥=SD,$σ─îΘÿBlHêT£w!≤i╩╚çTL╟╪qZⁿ1εΘπΣ╞¼τ╪╩!q=Sïü┬â∩ªiΩª▐φÜª!Ω¢öCΣâ.╞B╬é%Z&àÇ╝x▒█╒5²╕¬Φc\0|σÄ@╪h╛≥ñ╩╗╧üÇ«ùí∙Φz[∩4ôδ²▒É╩è┼Y(S╩B%%G*¢ùk*φ¼Xα±âττ₧êA≈▌Γ\"$j╠φ)2¥{⌠½╫\Z┴A½┴q>r≈p∞/i╣┌⌡ñÜ⌡*TÄóû*╙╣v6-)²ëÜåΩ║nê·πτÉ∙åK╬tÑP&≥ε{ƒ_>~∙^]7? ΩcBw⌡╬╕zoRß√@Ñ:>╟▒∩ΓºêX°╚ÖKV░)╟Ωh╞H╕╩ïφL¢▀çf┐je ╘ÉKn╠z▓â9¡~¢@÷7Z░Müτ∙JûjI╣eu65Q]7[╕ä[üF«ⁿ\\∩ìdîê≥!àα╪╝L∩S¢Θ╝{%δε0ü=uvl─B\"╞ä₧ t≡\Z┼èΘÉÄ\rA9<╛₧φ!}B⌡≈D─c?RE>$∙>$⌠F I─	║«m▐j	╣▒δIàºC+6GÆ7CíH∙pº╩¬<╣²≡ì7ε¥-ùUw≤CªAaCG2rä╚¡rq▒ä¬─¡Y░R@>å⌐╪█w╔C S ╒\0\0 \0IDAT!9!▒∩;[╧>yÄ╣δs╕^K(╩	}w4╜k¿,-ååt╗RG╛B┌╟]▀42j╖-%╣c╒3╢~╟╥╬ë═ú²÷╗Xö¢≤ï═╙╖▀xrr\'Vπy¢─£▐g┤Σr╠╚?°├Ov≈ⁿ¡{╦Å\0»φ^ïX╚çbΓmô`:çFsá╓╫ZrÉ½╫δa;αÜ┌┼i┐mq#ü~£Z*=/T─B\"≤è≥üü≥zµ¥8╙99╬{⌐∞b▒Ö╬aα¥EÉïΘ╨÷°K#┌rÑδ╤F,ñb6ñΣ╪÷	ë├;%.WaAäó,▒¬╩ó,≡ÄpéßÇsô±æK6@n╧╥≤▀■G[\0°╔Åƒ²╡w╓δΩ∙≡K3≥ß[┐4ÅyΩ▀~;åH¬^%)ä─WÄ&b1ñç╢╔±╨öú} π╚K∙Ç╚πüü∩/w=Eí:rIwOHAÄ╓\rRÜùa╛╦╚\'é½ ⌠åÜN:⌡\0vä├%w~.s7@╬╧≡═»ƒ┴■╤ƒ\0\0└«ªù\0P█¡jW/V¼æH<\\}z½o▒¢¢▓b▌Y¼Bb:8åΩ≤E~|σ⌠ì▌▓PqÖ╬]R²╞@,$$╓?Σ├╢Vñ½n²µ]ƒFBù∙¢∩C·≡ï∩#5─BZÄz+=ù┤£\n║▒%UY¼6δ┼â√g½│┼▓∞v┤	\Z╢]╖B╦ñ╧F╚▒ ƒ}╢à δ ■Θ⌡Ç/Ey{bH{▒4æ¡+R╚G√ ╣1&!^Å1b:HHÄÅ╖+┼╗°6─åä⌡íÇ∙ó╤■σ⌐! ▄-╜B╓Sì╡6≤}─»│o∙4!╣:²RTE╡)Wo^£»₧¼¬C╚P#l5╬╜╘îåïB≡·u╙▐│D\0Ç@┤╧╧ämèn/û≥┴⌐▀╢9j±f■î¥»ÿÿ╬╟╬B┼Y╝Bb:╕r┌ƒÅ╔¢;ò╦åÆèo√É▓b╚╟X╝!≤╓P.▓!▒╓rbCb╟&p√w*|í≥ª&GbL╞α√ÉDl@Ñ_ñêBPûE╡▌╓╖â╨m═ G≈o∙.┼äuGyì≥ür═╙=½╧╝i╔≡c:╫£ÅSd^≈Öùé₧;DG⌠C¢┐$ñ┐4<╜╛1\Zδeè|A«╢■∙HK~î\'╥æI═U1*S6¼╪]6@ªVΩåv\0≡\'T\\!W¿H;F`╚║n│4░w?τ<╧⌐▀╢\0╪▐!W²;▐▓8\'«┼Γ\rHƒ£;NΩⁿ╜╖▌Σ╜ƒδ≤¿H╔Θ[SB\r«╫ç#╟ö└₧πΩ├ÖK}▐0╙£s╒ç[▀╨FF²Φú?╚│∞[t╡y▐$╥⌡s>τ<╠±α~▀Wot╘{Φ∩£5█┤F╪┌╠=EΩ╨(%WZb«╜6y─▄3╕rbΘ#²Na└;º-╫u∩\n¢½êpuε#\0 ä┼ó\\²╩ƒ√╩C\08█▀Æßl~ªT╝äσφ╬e«╚v╫\\6D∩┴;@≡R╓ïΓ╔ù≥óI\"(R(M¬₧mT╓[B╬ÿêàMÿΦ╕J╛┐ÜLτπ9≥1å├/$ª├wL∙ê5∙Hπ:u╛▌▓ZVº÷╧|∙Θw Ω╧=┌lû%⌠▀┐,á?oa0R╞\\g_ªÆå╖╦ê╛Ñå₧Γ;êp\0δßâ^(ï0\'òk«∩fj≡µ[│YφƒCôN╥ⁿ#▒!!1Rr·µ@¿«íæàJïy¥s└±═>eδƒD∙>Tc>lφAÉ╦Bσ\Z╙ß├≈üÄkφX1╛{B¬1í▒*▄=cL&z┘£XîΣÜr]≈.üÜ\n,V½┼Γ⌠tU÷±ü⌠h188▒┘0±,ôD@Ü\Z.¢\Z>ä₧└ï±╜O)z╤B9GªèX╠16$&b┴5ÇS╘[Ω¥⌡ò╟x╪▒í╚G╚{!æ╩béÉL∙ÿ▓ⁿ╘╬iS97jΩ⌐S/f¢h╖¡δ╫»wmFÉ!«Å.Qaa1B\\8CrÖ½\r╝\"Çùp+πük,╟╨f╘w┐┌v_┘µ=2╒π\Z╙┴ë1a╚A\0└├┐φ╪█╜τÉNlê»╙xç╩æèi≡òππ┼J!ª├σ└*¡7\n≈╗╦¥wΦëφ╕╗[╣─╕─|°Äkê╫vÿ╓Hφ╪tX│}b\n|σä╩9 j┼|Ç@┐r╬«±Rφô╨╟u¡╒î╙ÆèÆ╛╓╩½gQ½╟Å∩?°·╫▀╕╖╝J╟█╫Ö╢ëdcD╧W▒Ä▐\0@@¿≡Ω\n÷≥5°>|σÑ╙ß+╟%└Ü[Θ¥σ▄ù⌐fíJæ∩▐╫├ƒ╤â≤â[ƒbæ2≥íÆæÅ8≥τ\\ª\Z¢1u∙çφ∩Ω¬δbYn▐~√ⁿΘ╖~ε¡G¢⌡▓\0~ûετE+*ÿNêτ─ùb.7╜Pí∞╗«φ0╒╔Σ√╕f7oδ╓9$▒Ωδ÷üTlHj1&í| ╢■ß╩ë═¢ü╫¢≤₧∙Ωey^£Θ▄σ╬=éLlº■∙>ⁿ∩·ºS`s*H╦ù╥ƒ√|hîxÄ╟\0k<┤c>b±}h╔τ⌡SüX.ù╒j╜^,÷1 ╢╕\r╙u½÷∩b├\\Jq£═Äu╧UÜΘ▄╡ùΩτîî⌐ÅTV¼¼╖╠°sΣ	f¥Rτ√pm╧XE>25bC4█5udΓX║⌐g╜╩╚ç╗πè\rñiÜz╖kÜGíπók▓·Ä⌠£¼_&ëÇ`üê\0ö7ô╞à∙▄÷╣bßÆï≤≥z \rw¬?tòë¥9iI▒p⌡ó╪⌠Θ{&VV¼╘▓Pi\"Lτ·;╚│┼s$├tε¢]L╦3.¥═*ö1]╤	æúì|hδo┌╟ñ3@╞f:╫f₧τ¼A╛s)F6-M∙╢v\\?FMCM]7M╧r<2l▐≈/ZAÖ-¥Y&i┘xφX$δ[3F─∙ê╙ß╘╧╢Flê½⌐ìòσîàXñ¬╖ûÜg6ºÖΣ╞-ìöh≡fh╝sZzO9«!╟dΦ»⌡c╦▒N⌐÷πX·[█A└╧°c26\n╕ΓÜ╛7ç2IΣ⌡δzG\0\0»▌╜!1\"£ÿ¡ÿªΩ\Z╘≤╡!╛Ä>)≡opë± Φ╧É╧Nü7c¼╪╬F%ë|╕\".kë-µπ║è╪|╚ÿGCk[╛Å}ñΣ°╢@ûÅ#ûº]Zi─\"╒╪£X|Zs)2!i≡╕╡ú¼è╒┘┘╔âGÅN╧û╦▓`lφÿ8Z,╓G_&ëÇⁿΦ╟ù█╫»ΦY╙α;\0°\\~∞C948sS ª├&√@ÆzC┬r Æ>α)g«|c╟Ωä╬\'Ä╝öÉÅÖ¢byÄS╚è%▌wÜ²ëΩlσ⌐Å7N\\ïⁿ=ε▒Xº╓O?>{xr▓(┴╠í╨w½╧╥,@ε*G.=eÆ╚▀²?~ty║^<√µ╖╬▐)+|ß╦ßδE3-α.▐╚É∞Q╨/╟╙q@Aε ÜY¿P@ÄD Çamq╤╟û═ë└¥q;6bæ╙;g╝$æÄq\'ä<tæ┌?çZ⌡K─tä \r£qYkÑΣ╕«5\\#[┬│╬╖╣2¥s╫Φ╪r4Öτ╡▓F┘«B╟ê╔╨╬¬en\"eëïjQTX ╫█c·}╚Hü₧╞µΓQ&ëÇⁿ ╓?╪²╥»²▐g»^╫∩⌡1íKx{4Γ6\\¼{!─ΓΦÉÅ╘°\'Ä¥∩c,/ªåW7tæ∞)╧■▒ Sß√╨.╟─ti▀öÖ╬cî;O>Q╙P]╫t╚é┼²r±p5B2·q╚┼┼ σ±╦╫â╜▌6/\0á╛;B┘cM╠π\\÷]p£½6ån«■=LτΣâ░U╜╙╣≤╕╔╙ß├`╬a^τΩ═aΦ╢yƒR`(ùbh≈æcz\'\\ÿ╦)αyµ⌠₧\r▌╞t~-û÷Φ╖~╬ÜùY▄ç╣Ü+╟╖]▄■üæ┌┼9J╠╫zñ⌠╖φ▒Ö┼╡σH0╧k1¥Å9ù$Ö┌m╞╟░ⁿ¬,Vδô┼┼┘╜╒╜┼ó┤e¬\Z\nD2BÄ┴╥╬H_∙∞╙K°▀■≈Å«\'UQ`■─è₧ñæ∙>£Σ°zbfsÆöôy3╥Æ#φ]	∙└εYk 	Ü₧Knù⌠ZkÄ┼.x$·;▀╟µ▀╪+¬▓:=]╜uq╛~t▓¬Jα3í╗\"┘*ôèiα∙ï▌⌡∩σ\r╚╒T=░╧`≈4 #╥≈w\r╛Ä£!╛Å╬τ∞ÿÅ}Ç»»≤s]}RaL∩¢Sσ═CÄ╧FΣ\Zkc{∩·▐ßüy7ö⌡\nææ=┌î≈#eFp)s)>	âXô AC╛ö■⌐1ïºπ├oI┘.Y9S╙▀/½╓═╣»@(¬¬\\E╤],L╨╔ß≈«n╙ÿÅ|╒JíLÜß▒¼É∞ôbè|₧rε|├√º═2╥ëΩ},r┤╞dƒsf:ù:T°¼_c Rµ)┤+ù≡=3÷ⁿKAN╠B3¬╟├8&\0j¿═ä>tò\nαn╓½>%▓óT¬)┐]D░#éO\0h\0\"\"╛|6»ë╔║╠5╚≈üª≤í]2╒êE¿▐à▒x3RB>P░|╣{\\ΩZR,╧┘É\rgªsN╗\\?O∙êëΦH2¥k≤}ä\ZU▒⌡ƒ+b∙αrKI╚╒£Kc≡}╪╫É█7^ê./δ·Éí╘╝h0<·Æ£²JáL\Z┘╒═ûÇ▐#Ç\0└K9/Äδ=Γ)!sb·Ä⌐7ΩM#÷úµx─îy╤_[╡∙êúÅTlêv¢Ræ½]OF>╥ò?s╛{ªi¿¢àª╗A¡≤owR└╦dÉQæc6@«á6x\r\0»\0░÷╧p#òA%$¢òâ£δΩ█╚╟>#╧╨τ▐φlV╛┘│LδÇV÷¼n¢|│Güç╙M#╔ë¥Ñï▒δê╚δ8╟l┘«ε|>┤6áß▌êò=J3ÆF6+╣l_╛YÉ└▓╢9£è╪{FαΘKTΘlb╢╡╫5+Ä¼ÅM╛─┌µ▓╢ó┬\\╥¬G\'½╓bQ«■╠ƒ■╥\0╕╖?πr«;²k3:▓rî\\]╣¬\0`ß▀û▒Ö╬}u@╦+ ß╓êΘÇÇ~æ?º,Tc2ÿº\Z+╓<ÉM÷÷╘b#b ÖΘ<╛■∙HW~F>┌÷╩rUm■▄ƒ²╩╙▀°ìo<:▌,\0hÿ¢bCl≈G]<╣┤J5eσp\0ƒ\0┴Åß1\0n·ττ^╣o6+╙τÜL▀}Lτ`ë∙p═fÑ╙az▐7òrv▒▐⌡)àlV▄v┼Æπ\Z≤┬9╪Hdç\næg1>╪1ΦX┐F╠çFläVLçφOì┴=⌠░ò:╙y¿<Θ±╦₧1÷8ô╟┌∩^lªs╔>╥æ_X«7ïσ²│ô¬(»aΘ£á∩AπñK\\òïgÖ4R \\B∩└?Ç/Σ,∩<╛:h±üdå≥,GBÄ\riσ∙æûïD÷∙öb#┤⌡⌐≤ÿ│ ≥╤\'#1σQ│▌╓╗W»vWù⌠∙w2√Γ?ldå╣½éÇ\r\0╝é#zwÄ╪╩]∩╣rP╣\0sô:d╢:░+w₧δU╦\'V⌡╢▌╧òf(τΦ\"ºoÿ╝6>≈ZC╙┴ΓEÆÉC Γz╟█G íwùú÷╪V╠çk²\0εL▀▒c#RëΘÉfpτ╬τπ╪╤`	vj\0Ö╪₧╘·╒┤≈b`?Æ≥8k3àk╚M¢Θ£[¬▓\\╜⌡µ┘┼╧~φ╤ΘrU⌡!C1C┘░ñ<$╣╠┴\0╣:æC	WW╔╨mNá╟τ^#─ó¥Θ╩Ö∩C┬│M∩aF\ZΣ╟úo\\b#⌐≤}ä¼┌╜╪╝\ZcæBLG╩{╛÷╪`─w╬≈p{lEs>╥─⌡Wh]9Äû╦r≤σ/]<²÷╧?~┤Y▀èΘ3.LêG≈│íƒ\\|ì┼┤ílMµü╠ò─÷b*≤fPKN¢Θ▄¢∩#6oFlårß¢┴\r>&oåφ9`╢╦EÄ¡/81c≥}╕≡p0Öc?╕·º╚¢┴ΘƒTc:@⌐]Rç0m~ëX╠▌⌐⌠½╔3╩≈!5╬ç¥▀GΩ1╩φ╕╡&#û½Uu▓▐,û√Φ ª┴\ZΓq16▓Q┬,╙N├╦₧╛╚çöW/ñ_Σc╠,TÜ┘│2b1n√╣^+φLàσaΩ1▓Bi╫ç╟:fÖ2≥1≈2╒╪î⌐╦W¼ÉΩåΩz╖g╣[Θ╨>{:)╣└─É▌Ä÷LΦ≡c\0xe?╪∙z#}7╙ÉlN0Ç|`Gd*ê┼P?àdíO}$│k⌡yàRA,ñ│Pà !²─¡╟G₧E╛3≥éΣp█╙≈£δ╗n²α┤╢!─EvB«çí╨LE«{Å½|Θ±╒B┤ö#┘_╢╜F#[BΩ┘¿╘█╤]ô»¥▓DMCM▌æmrÜÅ«Γè╤b╕ΣP&ìÇ|■∙÷▓«Θ]║╩é⌡<╠;$┼┬òδα!¼^\niß.∞SìíÉjWΩ²ú╙!qÿæ<╨(û╤æ-4V║\rS╥;┌Σë╪Ä┌)ßvΓµ╘σk╫s╦x▓Z├,╞å)2?$e╥╚σδå¿üW\0≡«│`┘<█6/ó/ê o╞¥Ω>u\rëΘP╨{≡9QÄT╗db┤x3╞@,8≤ê#\'&▀ç-6∙>Ç∙.╞ê▒p┘/c╟ó╪╓d█║█│ε╙\Zτ-ΣGΩ╫╘°G└s₧Io╙ΣßP»º¡╞¢╡ª,ïσ┘┘╔┼├çº≈ûïÆ╦╒╤gäå┐5=▀═| e╥HUÇ╕├ä«═┼ú▓│s÷¿┤σ╠▒êσ²\ZS═xö)9╪b╟åñ▐╟s╗1┌ƒæÅi╦ÅT÷Y|ï≥⌠Γb≤Σ╔ô√O╓ïx╣}▒╟c2─2┤gTä{åƒ▓≥?|≈ï·Γ|±\'τï╒C»ç╜&£ÿì∞I9¥ÿÄkπúÅΘ«aQd╜9r$ÉΘ±≡ì\rÖ:b!ïb·>╚±D*£▓N⌡╚│e╡g:≈ygm⌡Jd≤Y}⌠+½R¼¼QZrÑc4┤æÅöT\ZÅÉ¼\\╥k»ä±í1W#┤ú│v#bQU┼j▒(E1ÿ«╨D>ön\r╦Pgt─P&ìÇⁿs ╥ ▓{πg■¢?╣▄6=1 R1Zσ⌡íΘσè╙ß▓ÉÇP?╞É+6öσp#ÜzÅUR╠óà	⌠&╓≈⌐g│Ü·⌡φcb:?vG≥─x8Æ¿Ç\0¿ihW╫MCì╤≡(Ç╟h┘5>╚≡|F><╩$É⌡w~\Zⁿ» █\0└v╫<_C╣δ≈Üpc:╕fx3L1Σ≥íòà╩%δ⌐╪É╛╣d≥╬ºêX°fírß1qæc¢3Hæ\'≥æ▀ç4oF,th6/-}$╓>gÇ≥!█ô\nb!╒>Θ±╨è≥Y3CτRL>┴z¼k≥U)K\\«Oτ≈NWºïEa2\Z∞HG&╠╚▌≥? ■\0t3⌐\n,╩■Y⌐ò!╩Và╫ü\\9╛⌡┼≥R\rΘδ≤£┤╜Cft\\ⁿ╡╟Gi\"ÿ▐²Σ)≤}p√%eO÷XY▒b≥qLeÑ8_╥τéêc¥ïk)½rqz»xⁿαb≤ΦΣdQ@┐G│█ß8`⌡qîÅ|╒ΩXÉO>y▌·\0è├▄8ñ_C╝┼┌g≡«pbC\"≤f8!R▒C:à╩ëìXh -╢â└Xê╔ë;ó╒╥╚ç0╙zr╝1ï╘┌r╪¢*▀(╔▒╨µ√╨çëgúr6óñ│^▌■ⁿ·─äBüP-╩E]7\07Y½╨pΦk\Z▌½Y6däîÉlIZJ1ú╢á√cÆ^gƒ╪\rnÆ╧6t╖╦ß╞\0¡Oj\Z╗2öK┴∞ÿ÷δ,!╟ÄúHì7#6C√φé─·*σwæ╗µL⌠H0{╣G8/ái¿┘φÜ╞░1Ü¼▌n·]S\0zaææìÅc1@aG\0?%\" \"└}▒{ih└;Ç¡╧	°yô≈àεz« î¡+W¡╧»┼YΣ╓╫≈■ÿΣ⌠y5%Σt√╟UNw<Lò«╘{(µÆ╔YBNÄ0|>╘▀69á╧P∞Θδn?⌠╔π╓k·|α]\'║·A∞≈ñ▌∙£▐i╙\\$╟±\0f╗┴2Å└í_ñ⌠╤jùm\r⌡▌█ÑΣsφò>âä╩╖φa\\y─\\3}σ╪µ╣ï╔± σqFç╡$┤ì╛q╔tv╪3¡┘7τ╛+}U▒ⁿS┐⌠Ñ\0╕╖?δRÅ!üå\r▀ûK░Q┘\0Ö║rID╧α\0xσεi╨`A≈Σ√≡╓GÜ1<9▒êτm≤AÅ}yLby%æÅ▒°>╞`(╞┌ò≥╛>«û╣Ωû╧â╝=gèΩ»ë░ZU¢_∙ò»<²K±δÅ6¢e	w╜Ä6#dΦoS^Æ)╒L┌▒Çg\0≡\08Çôao╧X|√╧î|>¢7#v6+ß∞b\"┘│·╓WFt╬·3òv¼\n0τöD╠èÑ~µ²ay╛Å▒x3\\▓BiΦπ≤üφµ╛o⌐╞|p¥\0c≤}ñûmMk<4│¢q3)J1│^	╞û░9ÜX₧₧.WδEYb7≤òΘ\ZA√\ZV¢⌡▄┼τPfüÇ╘;┌\"ß√≡.\0╝≡¢°Z│|Ö╬c#c±oÇ▓ê¼╖VæB\ZR⌡2╬╔3;e▐)─\"F╠╦╪sÜscΦ¥yCrI╖QsyY∩^╜┌6MCd9DÖÿ╨√&YÄ≤╚Hkó5╨ └KⁿvW\\╚²i¢u╧╜ç▀æs²╡6≥A=b;ƒ│⌡qm╩æè▒0yL\\cCΓ─ó╕─t¡]í1▌và╞VáéΦ«╝╛╧-⌡≈┼|▄vÅAp}>4å┬6ùlwµcΦ=∩bhîëoLwφτ╩╒èM╤╥*15╛▒K╢=L*╞àµQΦÜÖR=í±yV╦┴╝vckm╖ö¬,ûo╛y∩ⁿ+_y╕Y.½x╫\'8±!C╧σrl╚~ÄûpuÑ¼PC,4╝OêB·h0}Ke┼╥≡jÑ╙a{~êàT« )x-1ü>₧{xîv┼«cJ·º⌠«╤ä┌ò│^M¬∞φƒσ▓:²≥ù.₧~τ█Om6ï÷u*S\Z^┬>╓t¡,GUµ╥Ü8╪ÜZL▀╢àäy?╒╚≈ßúÅ&oå¡Bb:@Qoifu[ É├£ï═`\ZcΓ┬╖┬²`ôgk0x>ls▌5÷ü╗Fä≥fHK╟╬αε┌o┌∞╘⌐≡}h≤t@\"π¼S2╛Åb>π⌡å⌡,\n,ON¬⌡ΘΘrUûç┘╕√/±╚Fêg)r╕zíPAFÆBφÆ≡bM▒smëìXHg│éë≈¢╘z1å£╘┌┼ƒÉ╧3yræ7áªí║«¢åê╡Ö\r)}≈Wçε`τ┬(╒î┌r╚Zp ü╬▐H¢≈├fσΣPK÷╚12¥╟╬╥èXh1╞çf│\nE╛l²#)g─┬╫│¡ÇT8!Lτ╫_±═*ôΘ;B\0Äφåêφwi╩ß╚ù╬éñ⌐j╠Γ╥╚éi/H=╗g═¥Kc1¥ºé|▄ò█4╘╘5Q\'f,πy2╕6±|╟±φs1x{εΘI┼╪>c╩┴!9!Y¿4╪▌╡Æ⌐\"Ü▐┘1∙7$╥IÄ┘ƒ┌πε╗^h╚I93Nl∞µá[l╜Åí╩Nl▌╡?₧Æ╫àwh┬ó\0~`∞┐H.=e╚nK55≡S(α\'Çpë∞â¥2oå	∙8\"â|}b╟t╪┌╧Y─9zK╟ΩÿΓ┼\\╝_╢▄φ⌐≤o╕╚ï∩├σ╨±╝{╤╨0gRΣ═α⌠Oè1|Z11>kBê|i²SC,┤σÇ╥8h#+Æ|c╞ûîü≥▒╫╖,ïσ╜{\'τlNùï▓ä╬1LΘçÉ█åæQæNÖ≥∙τ⌡v╗├gD≡\0|÷é(≡o┤æ┤╔Ö*b1▐îcù#à┤ñ╨┌≤Nó4x3ñ┌;ª#≤}LW∩¢ô╦ä╩>╓bQn<╪<}≥Σⁿß╔z╤5@L┴Σ┼ÇWÇ┘(≥w/│@@▐{÷Ω≥∞▐╔│√┼;%╨s√é∞╔`╬òcD>|Ö╬m⌡ÄìX╕╓7╙╤≈╣φ\0-½#ûk\n1ÜY╕B⌡∩mªsN ╕<τΩ∙å	à+bí╙\"φx	ì¥êòMKJ cC>$cdå÷\"-M▓Äëf╒RC>:obYU┼j╡,ùeQ╜Ç}ä╢ÉâA╙ù)+[▐╟dÇⁿσ▀·╜\Z\0>}²┘_ aYΓ₧7êôòì┬Σ83¥K,╚40ñAn}╛r`r|ƒ#Hâï\"d;╞╡7σ╪î¼7╬dÅe╬┴╚╔σ╩>╓««¢zb▓49├τC╞îΣA\" ╔M0·O≈ûε_\0Çªi╛\0(wß▒ª├ôE╬æçkW╘ytjêE¿▀ÿΦ⌐⌠±E>R╦B%à┤° ▒6y|╛ε1y3\\_▒│püÉ£▒c?@¿ m·╗ü>≥µé|H#Q▒bç8{BF>ε¼╫ª╧JYα≥Σdq ⌠t╡⌐Ñ)mn7(çô\rö\\Ä┼\097┐cuwBH!\r₧rÉ#╫iëüÉpî\Z	ΣCl6@\\Σ#òÿ╫ÇFÆ3·█ƒêÄæ9Ñ╛öèEÖR6»⌐═[φ9ùï\\ª_╩E╣╕WûO\\£>Zƒ,JΦB∩C,║;P<ÿεì#╪≤╙τ27ñ2aqcP_Aêä<δ▐3₧╗⌡δ╙∙\\%╞°ΦLΦ╛A▀A>V¬ÿrlc!ïV0▀ç+╙9≈░%═¢è|╕─óñ╚P>V╢\"⌐C┤åä╝╘i9ª╡σsΓτßúΣâΓ÷τ╛íBX,╦6:τ^░)√Uæ¡k┘23&th╙ÿ╝\Z≈⌐º─¢A┌c.°\\jrªεìL1δU\n}üë╒ç3|wRÜ¿8çτêXd╟q\Z²úTQ4⌡⌐íµå\n─Θll╦öàë┐D╔ùY! DP└O÷0~Z╧S\0\0 \0IDAT\"▐⌡L⌠═╧,T▄ÿ¬╧Gƒ╘¢n.r┌cï┼Σ┼\nE,ñxCl╞¥T6+-Σ├┼½ª┼≈┴E>╞Σ═α╝█▒│Yq╫ê⌐\"⌐╩ƒJ┐J#;á4í≥]┌ù(G¼z╪h╡î▐▌s╨v[█╨ÅεKèû┐!≡╤╗ƒgδ║eσ═ª╘Ms┘╜K\0 \0^║-\n▒Æ#Uñïc╧└2U╛═∙öó╝ÉwY½⌐±}ñû═\'2╞1σºR≥Ö*ù┴v█≡Rφ┌Å«R>∩l╧ÑSµàÇ\\┘┌/α9\0╘÷MA8⌠╞åáo.}·dà╞P╪┤▒│PÖ₧ù@H `<┌⌡îëXäΦ\r╠z┤⌠Å═≈ß╚┤i≡W_╜%█┌rÿïΘ\\:ûa.êà6▀ç÷8╕rVà╢!g╜r3·	U╣ⁿg~±╔²?·G∩¥┬\rçΘïCåäΘ▀íM&[µef1 Ç░\0Ç% m±A,by5bUαHΣLIoJ¼²4!²╟£)#1┌º÷Äª▄╞\\r╔E┤∞1Å╒¬┌ⁿΩ»~⌡Θ?√╛÷h│YÿùδU£`⌠╝¿0J5│	╖Çƒ└\'\0≡\0NU∙>«π;╚l\r╔1╓\'ëX°╚╤╬BeôèX╕\"$╛φo╦N▒pòÆ¥╩W¢\\ïù╠∙ß/ë╔¢ß█┐Z·H╞¬î¥I∙╨╥_i≡òôz,\nX╓■╘bJ\\µ─æÅ┴│êg╜▓ΘWX₧▌[¥<zt║▄g├j7╢╗╨u;╜Ç■XÉ«íbz⌐µ∞¥.│B@ÜÜ╢H°.|\0╛Éπ═0ⁿ?\n╔±╓GjAï!g¬1&▒ê╧B⌠ª√±ïoFj·╠ò╟c\\-)╚╔%[üF¼ÜΦ≥▓«_╛▄÷e├▓`Ö▓^¡≤│═╔q å2»É\Z°?áφ╟ì▐╙Γ∞ê| 2≥9±x─╬Bò\Zc╝O6+«1&:Äùk╜\0Θ#c±f╕≡6─╨G;+8>ù:≥!¥┼i«<RH`¼qê=Å8{NΓ╚GΣ¼W6²╦▓X<zt∩∞g╛ⁿp≤ç ≡┘º\0ù}ïe_0╧╨5¼íXÉ√┴,≤è┘╧╖╜aàrH├\0≥ßìé╕.îcr╠	▒Ç,Glâ£[Iì7#╓┌ó╤?S█▐╙╘√ÖôôK.=Sï\0û╦Ω⌠╦_~≡÷w╛≤⌠╤f│∞cDºúmÿ`G40±7⌐2C&t(»&\n\"y)zÉb:∩│∞Ñx3lV∞¼X«_╜5_~╛ùÑ s>≡É#ÑÅtî─ÉÅ▒y3└q═è╔πü Å∞H{Φc╞p╓xLDo	─╟Y╩α╥╬ª%-Wb-ML╛z╓+┐╡╛(░Z»ùδ│{½UUYc@8┘»L╦FçcÖB╫ôíÉÖRY¿ñ2Θñ╩VLr2╥└▀⌠Rh╫Kj╝╟▐.<Γ9öK.╣┐ù╘4MS╫M╙è2öN╖╧░ ├≤┘\0±(│B@èj╕╔é⌡Z\r!8─╨■⌠⌡Ü╪¼z)─┬╢i╬▒Éèìß⌠A¬<α¿╧X╠Θ]u±U&Σ├6ºÑÉi┼≈░¬ìXÇR Ç▀Z+nÇkf╥¿g,₧Θ∞x╛≤╪╖¥SA╨|╫┌äΣ\'ç|▄QÅÜåÜ║!Ω	BΦ╧Ve#*4e└▓1íτ╥>│╧⌐1\'½≥5 ╝WLΦ╧)húτ,£RêElüîX({\\F«oèk_╩LτSµ═ÿ*â{.≤∞╙|.╦%·▄\'\"jÜå╚0²L¿F[P|₧É\\ÿeV╚Γñláª\0≡\0∞3¡V▓aQñû╖{µ*r╜\"⌐≤f╕╚Ör6/k¡#╕⌐∩Rτ±░╡Kï9▌\"Å¥9┼Yÿ*oåb14╟╞bp≈/ƒ«d$p\\πRπ√▒╨Γ═ÿ*Åêδ\Z/mDN	∙╒ Ω≤▓─σΘΘΩ■┼┼z│Xötb┘Φ\Z!}─å┘aûy┼Ç4ä{új╤?	0`╬╟╛O=W╛Å⌐2¥kΩ¢╟â╨╠±9v▐î╘▄Åß╜Ou╜╬σ╕\n¥■╒ó▄<x░y√╔ô≤Gδ⌡ó/û╔Zµ─ä┤ Fåτs1ì═£\ZS∩¿ÇOï[┤zt»╙ånSV,π&á═¢ß*G▒α{%t_╞x«╖K▒αuqÿ╬CΣ1█∞EC├ª╚¢!%╟∙≥m?:╬ƒ÷à£╡│i┼⌠H≤}h╔qmglµ∙⌐ h▄╡Vó.Ñw-\Z≥¿ ■δb╡¿╩ô╒¬Zuÿ╨█éh└ê░)üâ#╟ä╩¼ÉΩ∞wδΩ∞w?┘╒┤gB|╤╨≈p%σ╣èß¥öB,r6+=94Γxhl╝\Z·I÷O╩s\'vLGµ√ê»w\nrªR≥╣.½╜╘╘M│½wM▌ÿ┘9ók║]ór⌠ÑÜ╟√≈÷≈╒┐╗║∙╝¬╩¡yC▓─|tπ=ε0¥╧¥7<⌠ëæ═+ò¼Xn₧~╬)Uªs╔,Z╖wà█∩x≡}p√╟σ9\r▐îÉâí/b!┼c\"σE¥:▀ç∩<p5╞SC>╞Æπδ─HÖΘ£ôAQb«*!,ú\"■·ù%.NNg¢═bSUEß°Æs═M▓åá°ú╖₧grδ▀▌ {eÇêÑ}vJì?\n-\\9\Zzg9πù╘ÿ╬Å╤YôrlD∞îzÖ∩π°▐√\\rÖ_)σ≥¼,₧<|╕y┤>Yé╞╣^─í╘╗YCIåΦµnÇ ÷▌ò┬Γ╞0╟+╞$∞╡ó┘ëMª╞¢*\'g┼2ÅùΘ£ôà╩%ªΣ╕⌠mî,Z└α√≡⌡åì╔¢ß≥}m─┬%ª#≤}▄╒▀┼⌠æ7ΣCk£º╠≈┴═áÿæI²£êBà░\\T½╜¬\rc!░≤⌠%┘αPèy6╤▄╢1│Y┼ÄΘæ\nrµök╠∞b«ç#Θ2╡¼WR∩≥T⌡╓α.éÖ═ü╪:gΣ#ù\\bnYMC⌡σσεÇ~∞%«A└gF╧	│Tsl\"╘\0≡Y╦0╟^Å+¢\ZªPèê╟Kô$─┬ù1₧δMh*▐ë╪\0╜¼W1°>BÉ`Φ/c!ü⌡₧\n≥ô∩C┬π.▌»ízM¥╫EÆwÑo¡Å;ñUùƒê:╧ç£■ê╖âw╦¬X|√█Å╧■ß╜╖\0▄╙┌b<·╬┐┘k└(│D@è/	α╝\0»²\'~\n|cfíJß·Γ£ï1⌡╗▐╘╫▄ö▓Bi 8úw0µ╝┬	╬╫1K╛≥>δq Ü₧■t⌡│ZU¢_ ╒»>²≤┐■╒G¢═5î\r╙╧┴h)αå╜╧╔êú╠)\n▄╤√ê°\0▄Ç╒≡\"N¡_{bCp\nêEî,Tα╨■í═2b!½#àX─êΘ░}>F-I╛≥ÿ█1▓Bì┼≈í¡≈▒──Æƒj┐å\";£╡ àq╨ΓsßΩo[≈CΩè└≈qK¼╘YZïΦv)¼εƒ»╫o╜y╢¬╩≥9└╓σσΦ£w»∙g├┬τ¼>╟F!└╢\0|å\0∩\0└swÅÆb1w∩$7¡α┌u╠1╥²0v;RC1º¬wF>r╔%ùy\"j./w╗//δå£í£>ñúmê Φ1W╬╢╠3ä░▐ƒ└Ä÷óδÿ#╙yw«αTï╘▓Pq7√T│ï┘Σ┤?Å╙a╙╟Ñ╧ö▓hë≤}á├\\Æd·µ;⌐ì|áÆê╨«É²x,ªs╔X╔≤╔╪ê┼ö│R╡▀ÅP>W²Ñ█α▓V│OΩÄkvb·╛_û┼Γßâ╙{_z√b╜X<√°R█╡,Çß+V9»í╠4╓╡U┌ß┴Ç╡≈▓S╚B%ÑOjI\nzS@ πùÇ▀┴}0Æ£⌐Äk╓;ù\\rΘ┘µ`╣\\£■╠╧<|√~ßφGº¢σ!,F┤\"}¢i76$╟üöj╞sqOm~∙└█±b|sτ═0╜½>^╓ÿ|(îΘÜ┘¼\\c:B│S╣╬â╛╧-╧≈!▄╬╚GH╓+ΘlV╪┐└Éƒ\"Å╟\\│ iδ»═╙ß:>S╔₧{ièªèuh#▄5;U²√σVδ⌡rs ■╔║¬è!ñé¢⌡jΦ╣>╣α°┘∞Kq═B>ñ╝è0é£╪}7ºÿÄ⌐f│Ü░≤ä(íu ╡~£ÅGj²sz¢╙4▀X╔k╢|kÜåÜ║n\Zó^ªsôüQÇ9±á#q¥╩L┌Wxÿ@Ç╜╚hi°>LçÇc@,╞êΘ░!zK╞å╪>wA>@H╫[¬ä|╪╝dêÄs(Éi=Y╛ùwR2+û∩\Zß┌«╘b2å║1\Z⌐!\rSτ√\0%╣▒µ╤ÿ╬╣k7N╣ΘÖ;tEÄ▐╘5]ôñ|ü└╠╥w╡\n┐g»┬@Öm▐╢L[ ╦Kα:Ob!(α1ºc#SèΘÿéΘìc≡*ªƒÑ╤û╨╫c₧7c╦K¡dä\"ù⌐MYóªíªi¿!~væεä┐u«∞<_Çv.ßÖòÖ\" X└g\0≡S\0╕ñ=║üVΣCâ7π[√C⌡ε>/┼≈ß+ç╙êxΦπ\Z#≥,╚Cƒ╟╠;δòfv▒n=▒∙>4⌡qEP@╣]╛█Xδ▒Ö╬A╣²╟╞≈!-╫╡ë║F@>Dc?b!4x~*╩b╣┘,╧╬╧╫¢EU╨oä⌠v7┼âtƒ┴╬┬█]ÇÅ▐èƒ)é[\0|Ç∩\0αs≤B╦½¢C d│ƒ;b1eεuæl{ú▐₧*▀çª>có»ô┘+ ù\\rÖY,╩═â¢╖ƒ>9┤^/─é╢à╥ö╣¬ ╤╟ê^└plI.0Sñ«q\0∩%╜╧▌æ╙&ò2≤xJ╝4Æ▐9ⁿª∩√d┼▓╡MâΘ▄σ≡╩lçs∞ç+┬Σï|─B\Z8πªÑO╠¼X┌╚G,åjφ╪ÆTy:ñΣñ╩≈1v∞2√▀╖-∙p«g qüX-ù╒fu▓8)»▓`æ├í├4íl⌐z3Ω1PfëÇTgú«╬■╞Ovu≤\0=7\':┘XRöú╣qç╘7\'ñf¬╧T█1%▐\r}Ä5+╓▄K¢\\ræ,D╨╘u│½δªªå|^─!4ñ╧╪└½5ÿB⌠∩∞\r÷\0\0Üå>└▌+Ö≤ßjm╗z■Sσ═ÉÉ3U╞°êçWäk╘┼@\\Σë0¥╗0╕╧!êÖÑk*▒	╢⌡nj|«åä6o╚Xr╞ÜGª°╛⌐ h.k┐√I▄m═NLº╜÷µoeëï╒¬:▌¼\'UU┌6┌n∞╞║═8╔┼PfåÇl≈?We▒,è[iwúx2τæ│YÑ)G:½┘öÖ╙ºähΦ3%.íc(Ö∩#■ÜûKg~)½ryvv≥⌠ßâM;─ΣßBï\'d(V6BÿeVΓp█║*░\0áΓ:4φú?≡`┌╟╬B┼eU╢Y≈\ZHK▐-╞x	ªs░|.üXp│bà2¥√╚π÷═ßπX╚G\n╝£~ï═π!ü┤╕∞ì▒∙>ñµ⌐≤}╠MN¼q╨ûû²P∙░φ5⌐#Zkà═ÿΘïk╥Å▓@Däσ¬Zùσ¡É>╬Å>ñm`qädπâYf╬äNî6Äßσö╨\'#≤öô∙ª≤Äí╧öxLRƒ#s\\gr╔%ùí#!5DåVmaxqç╥≤ΣX╞R═|«°@÷å}≥q╝Æzº G:V\'öäâÉH3ª3c4b0¥½#£÷k≡fä╡l┐δü≈X▓M=VC\n┴ôΩºX≥╟µ√É4 ò▓F⌡ÑCÅå|h≤í╪╫╢█τ>\"á▌«!╦╦╙]Hm^$g├┌ùy# [\0x\0~\0\0»n»#S⌡NÄ╔≈æé⌐\"uσ#%hJ1\Zcì%Fs⌐q¥*╙yµ√╚╚G.╙>±∙ùÇ^_ε±h░╗|7ô!╥╖A²╦_╠{₧AC\0_└\n▓σYδπ┤²34τ╠W█▀τ╘gÜ╦&9╚╘█ûφδSN▀│▌τPHôΦ╚║&jK+▐│í·há¡}·ç╩3íB╫«Ñ»╤╒╧⌡▀4Ω\'╧±\0pCπ╚a≡p╨█╢_╣┤h¡±╤█Ñƒ8qöK╠5╫u£Cσq╟ç+\'┤╣kª∩xsmwò»¡╖½■ Pç╦┌╟42┌kr{╜6¡π)Θ╧^3\\╞éá¼è┼╖╛∙°\0l\0\0m1┤\Z╢4╜╣ï▓≡\n\0@√╢óÅæ¢╦rÄ\rÖª£≤}$σE¢RlF₧Å╟∞¡╧1U╣ΣÆ╦ì}▓ZU¢_ ╡»╜²½┐≥╒Gδ⌡óä■lXCû}√oEτφΩA:Ω2δ¼αs\0°░ìÇd▐9╜╟╘ghÑAÉ╧«╒≈Lhlê¡OÑ∙><σ┘ε	½╞|─Σ═Éîìê╙æ:╙9≈=N5µC2╞Bc|ñ·1⌡ÿm╜╟╥ƒ│Våêp MÆ∩├╬ù..l6O₧£ƒⁿπ∩}ⁿΓσ╦-\'¥e▀╡\0≤╒Wâπ(πBµÄÇlüα=\0°>\0|q⌡┬æ├$₧╦rû3M╜%ΩÑ	╢├τ=≤}5t┼─Σ└äτ└▒Φ£KÿíÉï╣¢(Å╟MW4ù»w╗ù/╖u╙Pƒ\'hêl░\0┬QÇ¥╝≡Φ╦╝─\Z>éOßÆÉ:[╙▒≥f╠M╬┴#d<\\ïP╛Åí·ñ°Clƒ∙2¥╔╙hÅvV,Θ·lsx,╛ÅX╚çδ┌2ûⁿ⌐!α⌐@>Ä╘yDbΘo+%╛Å■Æé■\Zc!¢U½,▒║╕╪£>yrv▓Xö6Σ┴¼╠┐í╟K|4eεY░╨╚X)░αO╒╦⌐Öà*3»╟¡OR)╩ï┘₧1╤╟╪1S█╗pΓ≥s╔%ùë₧`╣¼6_∙╩âº┐°Om6╦C╚É±ab£,Ç╧2tUδh╦¼@\0(⌐\0╝@░g╚3oFÜ1/▒╙m▒sτ√h?.┴≈ßr0DÅ÷H┼Xä\\╡bQb╟┤ÇR ─≥êKì∩Töô:»╦╘µæ∩^P╫¿Lτ┌|≥»╓╠ó─┼Θfy∩Γb╜f  }	└p▄G▀s╣⌠ö╣ºßE(áñ~╦├sπH!6dL▐î)!sîiÖ3▀Gîq═|ΘÄk.╣s╔E⌡`H\rQS╫╘æδK╒fDτ!ö_`sÖwQM\0ƒαO`{3⌠╛1ªC@¼lV>rå┌&ÖàJ▒░╔æfî7!$╛∙HEî¼SΩLτ«φæè▒p┘╞ÄEë╙║_Ä¥EHJ■\\ïÿ~I╣▒τ╤╨ σ8╥B╕kv¬·╟Θáªíªi÷G╨τ\\│Ω√n╬₧\0sG@.üα]°■₧É╨▓─╩╕√^z\nYÉ≡ê⌠╓╘G▌l∩}æÆ╓o}9Ñîz╟:^)╖*²ÿ╧U╣ñ0l\Z¬δÜ\Z0¢ £E┘£~8c├σΦπ@µ╥@â\0ƒCƒ\"┬%\0ε²c±]H╔æµ═ÉhGN,─┬Go\rÅ╝kl</!╧à∩âk<J≥}ì╫ÿ|╢w`J╚GΩ▒\0`YS!P∩P#o*|,⌐gÑÜΩ<Γ\Zeé₧²╛5√└Çn]│}╟B	╣Qæ√√EYT¢═≥▐²√\'δjQûE£znP╣)Öu╬╛╠\ZA\0$Ç\\²╖Å8╟Ç|H-É«E,╜AHoH@∩▐òì6F²c≥}ÇΓ;?U.í⌐═█9╛╧╣Σ2σów_T╒Θâ¢╖ƒ>=c│^p7Vƒ╤²Θ╦«┌≈w2$╣└╠║ÜXƒ└g\0░=ÿûh╡ΩSA,ª╩¢a½w,─B\n▒j≈╧H╟@>ε▄#▐¢⌠¼q╨Γ/æα═α4╟û3UΣäσ╒ô╙9(╖_é╧d\n|S¥G«²«─≈!\Z√∙╨ÄC█ƒ÷Hü╒rY¥«╫╦ô▓*p`╙4!&├ñ╧╚p1:Ä╬8Ö5R£■═]q·7 ∞c@╨i╝cg╢	yn\n₧ cΣ√H▌[4÷┌¢7c\ns\'#y»╬%|m╦%ù╛E═ ╧▐¢5IÆ$Θaƒ║{\\yTUfUWw⌡1╫ï▌¥Y.αε)╝ä≥»≡!E└ç╚ÑÇB<¼@p¡Ç┐\"Σ_└vf║║ºτ┬,║║δ╚W>DDeTñ╗█Ñjnµn&[█ôæΩjç½ÖΩg¬_╗σ█φm╗σû}<≤í½Y╟┐½á╟╥8ë6Iñ}∙?∩É═ sê\0ⁿ└═]D└5Ωæbæk*D╓{Ω╚çƒåE?¼úhC≤Φóº/▀çD*¢±eùÆô{╬ç⌠~+\'`lñA[N¬9>S[G6zº╩≈1&≥!┼≈╤/╖¬¬┼rUƒ¡7ïusçÇ╕V½2U╗ΩCJx└æÖ¥╖=Iñc5T∩ÜΣ╘°@4\rn╚≤r╩Θ╚MN\noI╧º─µ<V«\n═`\rNu≈)vª┤╥RmMS-//╓╧«»╬o6ïCêïúßJB8äåö*Xô█╚╟]Dáíó}TÇy╖╪ê!é╪╒£BσñRà*û▐&9ñ,τxⁿ$°@L╧væ╫ºƒí▐LτC╧╖S8÷[\"ç┬µ@ù\Zây.╣	ªâs¬|⌐!\r⌐╔Ö·:╥Γ√α@;>$:╙╣φ▐:F▒¬jφ│~¼âuMTâ╓½f│?▓àÇíCï¡RÆ╨OZ5ï^@²vε;ùA╩╤Rë∩i╚╤¼₧ò+≥║╖}«4s:Gyi²╟8gΣ#µ┌*¡ ¼⌐┘ÇÆ≤1Åy┐╡-o_╜║┘b_k└o≥Ω√«_╤└!º8\"sr@ÿi╦á»∙méê@┤√ë-╝n2ⁿ▐$ºδ{6r·?m╜√₧╟=▀δïnÉπ≤|Σt}╫╡_╢r²/å╛╟c∩#»╧F2îⁿF╠w5ΓÅδ─┐O?╖}╛M┐L∩\0╟╗K/\n7}L²÷ò├°╪⌠û▀≈▌]╫E╚╚╟╞╣╩3¡O_9╢δOZy╩qò/╡ÄL2ñ╫EÆOk╦╞O▓┘í}É╢░┤Rk┤√∩i▀v\\Φ;>Éⁿα╜s\0\0─▄δ@╪\\├B╧wM▒ΓÇ╠ ╚uα9ƒx╙┐R╚\r╤îö═⌐\nU«╒┼µn¢r╩∙╨¿fUcy╜_%τú┤╥┬£₧╔î╒¬9√│?²■ç∩Å┐≤x│Y╘Φ╬▒qBgΘj└├ΩrBf≈5≤XΓtα9?π─╦√ká≡f╚<oL9R²▓òs<∩!≈Z5σ╛ε¢≤╗èù»ì▄█ö£▄sc:ù«R5v«åTεÆ╘8┼Æ+We∞±x╞dÿ╬#±}XΩ_W┤x|}v±±╟Å6 ■»±≥σ╦S5¼π Ü°>åPöS╣│m│@@êqCî╧┴°	▀/╓íù\"º{αÑ\nU^r$σ══ªQdÖ⌐┘ä1╟)7¥bQZiÑ╠h_┐┘▐╛|y│m[╢╜w┘σpt▒íwσÇ⌠9.│m│@@h■\Zä▀⌠å≈δü\no╥B>┤½YI═k╫wBÉå?Æα¥èÄ|°≥f╕╚æb└å├ZÆbp\ZùT°>`┘┐⌐2¥k )╧sn<\"▒⌠wφG└3\n▀ç¬▄║ªµßâ⌡µ╜≈.╫ïª>6µ.╝ }U«╚┬¿╔¥E¢K@¿└TâmWy«l─EÄî£	&ÿ#┐|)╔æ╥í Ñ∩ÑòVZ~√▀ε?╦es÷¥∩\\?√╤ƒ=>?_r@|╥PÆy╗¼·YV╞jf▓Γvü@▄/(╝π╩ü░£í*T!≤╩Äí║∩ª1ï└bèÆ⌐#┌| «╓Ts:L6\"Vd▌u▄ñåX9c±¿h3}ºÄ|hδ=û■\n|\"à∩Cy-1└ä¬ª┼┼┼Ω≥ΩΩl│X╘Σ⌐É\r║Qó)=¡*C ±┬ªV╣\'\'9R| ╣G┌ºVE+º∙╚5ºcΩv╡┤Θ╢┬≈Qµcⁿ.╖-╖m╦o]:╟G╫╡¡╩p«ªbΦεZ3ú╛└;6t▐gÇÉ╔â·}╠*TΣ`@b\"\rr4π√╛∩ïÉεèÉÉÉ<\'ÄúhZ╚Y«ôƒw$fNçï▐░|₧k┐ñ÷⌐▄ÑOìΘ<t\\}Ö╛╡⌠+ºD╩±╗¬û@?ó!▒╨L-ΣCLn[n█-▀╣ ÷//w8ClτCΣ0ªgL╢═	⌐\0╘:╥╧²6Ä£j√k \rsD,R»z5v¡≤Ü\Z╙yl╜╟╢s╘╗,K+m\Zì■s╦φvkσ⌠▌│Γ ¿,ÆRk≥ì⌐≡\rÇ αåσ││¿B5ñS¬╝╣U3!$╟┐ôΣ√░9;V╜ß√≡9P╗îÅTÄE╚┴╨ù∩Cózû═x√÷╧7▓.▌╠Kê▐&█B#╦qupr══╚Aï╪ÅQæmd\"E∙;[^U╘¼7ï│╦╦╒z╤T╢êulC£ &dd╓╤Äy  L7`z╨OhτêÇτ<\'╛Å⌐╩1!-╣÷R/Vα╝ª0ö╤╗\\Z▒ƒ1▀Θ╥J¢ε▐╡X╘gWWg>{÷≡±f│¼╨_k╚Ö8EChα¼M₧╔d█<Émuαs╘φOÿΦ¢;x╠▄çñ!≈jV▒s:\\⌠⌐╓d\Z█╚U┤╘∙>\\╟\'fU(Φ}·<ƒ£Ä>9ª⌡ûJU%ì┐»≤:UΣ#╛(╔MAï8■∙G■■δUEï╒¬╣╪£-╧ÜEU⌡j┬0!\r8)p\\å≡ló\0≤`B┐°╫[║°╫┐f┬g╕çÇΣCFN«ê┼Té╘┐┴Ñ¬_c)ò╙QPÉ8πRÉÅy╢é▄öµ÷Z2ÿ█ûo╖█v╦m╨¥WΩ8Wƒµåæ╬Ö4┬/ ÿüΩ∞▀∞ºÜ #o°.	q½PÑ╩¢aÆô2╩ÿ╣:]/]⌡*╛[g4%╛╙;ú\nùk J╡\"y⌐1ª├b}j╠s*98)¡╙c{áäα¿\"&█£*ƒê\"▓┬@ET/⌡f╜Z¼Ω╗åΓ▌PεG╣v╒╤&ìÇ0 >^%⌡0íΣ╦º⌡╖ñ \'6bQ°>╥ò\'±|N┤RêEj{e\"s╩∩AiÑòû╒,Ω╒â╦⌡│δδ≤╟¢⌡\"┼░é\0\0 \0IDATä	²pûε#!∞KPƒ}¢4Rm■Ω^ÿaWâù≈\\ α}-,zwìiTíéß≤öy3$⌠åó▐╛îΦ&9\n╠Σ╓Q╪╔KÆ∩├u-┼µ√ÉÆÆ╙1VN┴TΣτé4H#;Ht₧\'Pì╩Θ∩à∙>°(4¬╩≤a╦-%1Viµö≡╛Φ.╒5Qìj╜n╬Nÿ╨ç&╜O9▓°▌╨wg╔27&tP▀-ƒ≈╗5ï╨!ÉêjΣèXΣC&Zò+▀çö£▒≥╝┤∙àrC>µ░eòVZiZì&\"Éí£ì.úΩ∙ÄΘ╗└╠Æf^ì[^µù°@Γ[à¬∩@0u▐î▒⌠6╔æfî∩π1=[é?äçσe├≈!Q=╦fnc\"1°@ñσ╪8í9≤4îì4h╦╔í╨Æ[ε9µP⌡╩┤εR══╨«ª⌡vxΘ¡<&03o╖╠û£28*d╪ägUMan╚\0?≡\0╝╢sv}úS▒úÑSα═`E}b≈?yç½T⌠î±N⌐┬]j≤ò╩Z┴Dτ8╢¡(¡┤▐y&~⌡·ª┼>Σ╬A|!√£\r|û▀)╚-α?ε£æcRK6xßºEå>╖ò╙╖Oσ⌠9╤}╧#╦⌡m+╟Woô¢.·pO≡üΣt}Å-╫B╫▀╪|Å\rrÅ₧╧|w_°°╬≡ß▀√|Φ∙}c╚å∙φ╖i-┘Φa╥╫Fƒ.9C·└┴Θc╙/╙┴4T{┌:ëM?D~ƒ▐«{9{┌hù⌡º!Gj>ñΣ▓τ▐ôè■╢²ε╧á═φC▀▐┌╫╜Lb~í0╟∩Ω_╒U≤╜∩>>░@╠F╕|╚≡°░ó█$¥d\".∩b »Ωƒδ╤╥) \rSB,JU₧Θ⌠¢\"»╩x-╨╠╫Y╔▒╚½äÑ╠│α#ÿ▒Z╒g?■│∩?√ú?·°╕\ZûΘ~x▀▌╝c■Åcgúéb2├4½Z\0▀xα╢{²▐î~9╥90╝╦6r4su╚q╛Ä╟QÿoC$τ#4ùEú▀╥├1½k┘╝╦Rε⌐3Tº╬t₧J⌡,Ækr_G#⌠cö¬W╣≤}h═±²V╫╒Γ╔ôï╦∩~τ·∞│╧~⌡Ωσ½█jX.hçK.╚l┌¼▌Φg\0>≡╡█BƒCy\Z│ σ(╚GZQ¬£╕1R½èò┌°ñⁿ£éXöVZZ╢?≤₧0°═¢██ù/o╢▄2;v▐ªoA<z┌¼mⁿ└»╝ß²:ó┬¢a┘ƒ>¥BÖ▐MZiÅ&tâ∙Tæƒ╚▓ë1▌e-┴±{⌐U┼ÜKñ╣≡}äFµ╡æ└⌐2¥gR²φ°½V⌡*≥æ\'▀çφ▀W╒ùδ═ô╟τ½ª⌐]»8\0²╔OÇÖ%²⌠oJ¼⌠∙ε>₧q║╟¼fà╧3E5ªèXöHjl≈?-RµΓê⌡î⌐╧wΘgiÑò6|▄Y.δ│∩|τ·â²Φ├╟ττK[Ft≥aâx╠▐x43δ∩!¿F\'aß═≡ì\"ΦΦú═äεU⌡ë╓H≡çlâ|@∩∙╓5σ}°@lt╛q≥╘ûrB▀╡┬╙á½wΩ<R|A╡ôG>≥ß√░z╟ÿP╫╒Γ≥r⌡α±⌡∙┘bΘ╠ê▐τx╪\\╦Ωδ°l┌Éz∩xæⁿó₧*GÇ╧µ1V┐ªTHæΘ£]ÅΘz&M∞]₧r¬╠MiÑòvΣç┤▄╢-│πgïrTΦ.╜;{$ñÖ┘Bk|≡p╙àütGCå~ƒ3╙≈@d`≡`σèⁿHìÅt«NBBûπ`╥kHªA₧uσWdAÜ┴r╞`:gK\"6╙╣╧|∙:í┌Uä$⌡O\r▒╨û:/▒r3┤Σ╞╓_X~Σ├┤NRG>╞╘≡┘▄2╖█û╣\'¥-^VSΓ9Yl>│k≤B@7╠°)Ç┐≡é&┼Ä≥┬Å⌐wj·î²▄▒mQ(╤S╠~LòΘ<çuÜ¢▐%Mj¥╩aá┤2;┐É╣m╣▌n█û¡è`▌c-∞Éî>4─E╞ñ┌╝Éû╖\0■²ä╫²Q¢ìó≡fÿ┐ù[u1[²Åτ▀T╦6╩9Ç|XG╤h`¥ªÇXh\"╢òZ╪R╬╨Z╥α√0¡I)gP√.}¿■╣ c╔±y?4╓æö#5vnI`?ó\"!{ì»ⁿ∙>l╫╥n∞¬¬j╓½┼┘┼∙j╒4┴.7mÿC¥┤1Ü│≡Ég╟äN;ºδ-:╛⌐UεÖ╗£Éô╘æ\n¡£\n╪öô}ì#¼Gèlrô[∞▐╝µú┤╥ªhGïEuvu}■∞┘çƒ£¥-+╦├╫ª╨╡ëTås6\rl╚ô7s½éu`B åü[z╦\0Rx3┬⌠╤╠Θ0╔Ωb╘#{ΦÜXH╒½#▌E°>å£\r▀¬X!1_─Bè7ñ≡}ä┘8φ±ÿ≥ÑyÄ╔├í╣Nò·aB>·>Ωâ62e∙▒æ├∩]U╒b╡j.╧╧Vg═ó«÷τD>r\\╨ê.%L╫¡Ä≤Eå^î╔í\"≤bB? ½[: ½»@°≈zawÉö÷╕º.gΩLτ%Æ$3┐╥·É≥╗\\°>╞[gE╬⌠[╔╔(≤1é!Ç┴▄╢|╗▌╢&⌠É¿╧1Γqj▄K■╟I¢┬/ ┴nå7 f≈3╤»╝&f0háê┴¢í]+─b¼£ëqΣGè╛kÜ+	╛ƒhR╙£ä2`├ßÉ╩Θ╨α√É░5Üπ∩¬┐∩ü{Ω╚ç4ïA];ºDKσ~⌠σs\r.╓ç°LßôC>NDTD⌡bQ»W½fY╫ò╥p║AÜ¬a2┬}½f▄o¿çê0Æ≈¡bx]σîëX░ó▐╣╝╫1⌡Σ─⌡ôK)äDï∩ú0¥Åk≈ª┤εK+¡4▀≈╢Y╘½╦ï⌡│δδ≤╟¢ìæ	Γ\r▒IFƒ¡C2ΣÇ|╝²Ö≈â°░bx∩îP╖mZΣÆQ═╣ \Z9«πΦ├≈a[ë$▀ç+≥Γ╘à\"$Æq)─┬ò∩$eª≤ÿ|╚═\\i9╢{Qj9%┌·G âìVE>L╢ÖτAz-Qrs|`²á║ª¬F╜^/╬δÜL╚┌t3¥╙Ça)╚,¥dB}╖╠ñíR`}╓öôB¬┬≈í╫RBH┤╥\'╡5@3}\nb1╛-HI~∞τö∙╬}╕σ÷σ╦¢-÷êÑ/I0_½Ω╦\rÖ²5¡fû»\Z3â≡φa^ëw▒4½P\rmû╣≥f╛;┼$╟Ñ╕φ≈Ñr/ñ∙>|sN|x3åΣt┘U@6Æ-àXäΣtäDΦCΣäî[J≥Ñ╟55─\"6»K¿ⁿ╪9╥·G\ZSU+╡£Å«}6:Sxók)m\'z_L¿*¬>■°j≤ ■?Y╪Ñ╦ECN»d≤E@n└°└ù\0n╠k(Σà*êE\\╜σK┌≥b>hs╫X/\Zê)╜τ╚x^sX╖∙m2ÑòVZìw o╣j╬■ï?√■│?ⁿ╤çO╓δ┼ío╚┘┌╖\Z╓lZ3╙⌡v┬τⁿ└áG╗\0Clªo╙µò:oäΣHτ╞£≥w░τ≈M╧Æ¡╔≈└┤nàX°≥f─@>B▐I9ª╡-┼┐Æ╙╣tN└Tï⌐≡║Hτdî═t₧S╒+╙║K¥Å#û■Rs|⌠}Ω║Z╛≈⌠≥┴╛ Σ∞º?²═½W»nB█jX}_ÿ╨º┌ê∙å└╧■@Γ| ▒ƒùk¬9ΣhHl <Y\\s■4¡jVú[3öûú²L┘VöVZ╩δI)Å╤▐╝┘▐╛|u╙╢╠6╞ΘY║Åä░┬≡╡¼¬π╗6ÄJ÷mûZ\0╞o@x≤«▀£╙w¬╝6╤å}L╧═ì	E\\║>7|┐╦áë≥}H .	,⌡r▀╙■H!Æ<ízx¼Eº2V╡\"i╜]╟UZNΩ╣(PÆ+\'╩πΘ}êR⌡╩┼╬å╩╧¥OD~Ä⌐¬Ω≤ï╒·ΩΩlQ╫╡φΓσô ÷σx⌠%û╗\"!ôBGf╩R¿DU≈╗æjNGê)─BC∩╙τ▐BV╨A\n▒(╚╟4⌡.∩}^¡ ,Ñ%j ÷Ks╣l╬╛≤╔πg°úÅ_£[±üÿî╛jXº¢Pr2∙╓╠x±A_|¿çepxM▐÷╘y3l┐¬ÅvÄ	cÿChΦáΩë|tE╩∙>║é(C╧·╛	▒É╠\ræ¿\n¢y▄&Æ·╝╨\r4≥!]Eh¬<cU7âÆ▄╘╫QΣ~îV⌡*&▀ç╞\ZMÅ∩├JoÜ║Z>x░~≡Σ╔┼∙r┘T0\'Åß┬Σ\\åô9\'ƒ2W&⌠└7Fn╚TÖüs»èòjä╟▒H-7$6≤8%2c╦╒~NA,J+¡∞UΘΩ═;én[▐ôS[	Φs °Φî▌çz⌠!!╢╬L÷¡Ö∙[C∩,┬Ç├;g▐î▒⌡rJBÿ╬Mr	╛ìπÅ{Pt¡=█τ2╒¼lσ}╧µ9c#╢Hïδ&¢{ñT∙>`i[bσÉΣZ▌llΣ#▐¢>ΣC4≈#≥RA╤u4⌡≈}W╫â█╢m█û[0█á«\\É.ºó2L°Σ	√┌\\bá╞ε_e┐æL17DC╬ï▒·+àX╪╩ú_┌(ê╓√Be▌û~ûVZyçÆzN╖ìfÇ█û╖╖╖ª\"XFß&6tH╔Ötcn	°└7╪qé`▐╝⌐δcè¼╕\">É#≥╨);╬∙x+┬åq▄π∙^Q*Mªsë╣uA,α)g.UÉbδ?U₧ΘΩf╥≤É9G¼~L∙É╢┘╣Ωo╖╖TD═j╒l╬╧ù½║⌐\\╢·£⌠tñ²Φ·¢Æ2AΣ╠_`GD°\r%æ╙1ª├¢\ZÅG∩\\j╣0┘P∙4≥╟ΦW⌐╨ö▀√Vµª┤╥ª╣╓)ól╞bQ¥]]¥=√≡┘├╟g¢╖U░╪QÉφ╒*¢jXôo≤D@╢█[\0ƒú«óo║=Γí╡û;oFjêào⌠─ûΘ£ƒ¢ÿ╙Mπq$ú+Æ&┬t.ìX@HÄTU(¢w═┤ûlÆTs\\╟M;╔=U╛ì*hÆδ8UñKKn«╝4\'÷°╘NGe:╫D3c0¥ºÄ|╓∩~«¬j▒^/£_¼╬╦Ü`Wå≈T0├\\Ä≈≡▌╩r`\'█µ╔ä~±ooΘΓ▀■Dƒ⌠┬o#╔57D╙Ç╞Ω╚W«≥Cc3┴ôτxRFδW\n!I9≡T°>ª)º┤≡Cji╙£ç▐1┌U┴j[▐n╖m╦-√n\"}s╚7ΓÖ]2·¼~∙└\0¬═┐┘Ow⌡▐Ç≈3Nsα═z╤c#.π8d£ñ╟╙┼∙E>·lù¡~1ï1ÿ╬Mk┴\'º├gφ°8m!¢hß√ÿª£T╓ä╫╧X╣%ü²ΦC6Fa:╫╬påkI#τc@o*ó║i¬╒r┘,Ω║\Z:8qç▓}îΦ╟ÄE╒±╗í|æ╔╖Y! |=╤²┘w╣₧*≥┴û)}bFCRC>H╕?s@,l√?╛ÅÿwíSæWÉÅ╥JK½M√h⌡Ω┴σ·âδ½≤╟¢═┬û	}h░lÉm*bMw╠τ⌠·T¢┐Ωp└ÿçF▐ a ≈^╝⌐±f╪\Zp■M²Æ¬.vⁿ╣m }⌡╖ì║ú;R&è|≡≡≤âÖ╨m╓Ö∩·\Z;[─B\"º├iqqª▀ç£▐∙É]G1⌠╬i¥₧╪π{ΩK#ª<Dφ▒╩ü∩#╓Z\Z╛Θ┴╝¢t¬k¬Ω¬9█,╬ïwÿ╨}7▓ê$┘8ô¡å5w&tú╛ .─¿èòr┤ü∞?E╥?╓|H#%╛LΦ±_╣■ƒ5r:rµ√╚	∙HM»\\∞pε╬╠╧E╠¡Θ▒₧3/⌠Å²╓╡φur°.;:*┘╡93íâüáùçy&Ç└d`D≥╘√╝÷¬PÖ£⌠«∩√\"Æc╦t~·=S╒+█Φ╒└⌡+ΣCè╟├┼ûJτFä\".9\Z|∩╢╦ñÄ|äΩ¥*éóàDσèái3└+≈├┘ m²╡▀Θ°>┤╓Æ_Ñ:ó╖≡└fn{¿MÖíç┘T┼Ω·nßÖp╗≡3\0ƒâ≡µ▐═½ñú⌐3¥█DΣCΣî=╬i╝╟α±α╚δ╩▒╔╧è┴ª₧C¢z4ôè₧Ñ═¼ò╡$9╠αù/o╢╪τÇx·ñ╘ßå½`⌡²²d█╠▐é≡²\n└C\0╦]αt.╝>zk0╞╗╩±σ√Çσ°ÜóW=U»ÄÖ╬╔à┐úOgƒ£ù¬X┌╣&╜O√¡æbZ█S¡éñÑ┐T⌠25B·î╡Ä┤⌠╢¥▀─∙>εëÑ{ºN£6√≈▒æXεU⌐¼%┘w½«¿■≡┘├\rÇ%\0bvV¿½\Zû+║═U¡∞╤æÆ,└X╝¥l╥|╘XrR¿B5╓]jiD%▀ç/≥B#ìïª▐!9╣ %╫`>[N╬ì≤~sYKI╬╖⌠xÉgW╦Us÷π ┘ⁿ■O╓δªé╣\ZVºGƒ├╤Ñ`5αêL╢═\Z┘/¼W ╝c█}_▀╟Sƒ\"b╤⌡εHτtÿΣäT#z«M╡<_╛Å╛╣≡E>ñ¬b┼Σ\ræB,\\r:LƒO╡\nR,∙«6╤u]┼F,rσuAï²ª≤íÇæZ╒+I╛Åÿ9╚`-)Σ}1╨╘╒≥â≈>°█√²≤τ_ⁿ═δW»n┘á,≈ⁿnêhpΦ≈│i│F@ê∙å└?≤_â≡B«╓ÿrbWíÆ╩ΘÉΓ)q}«º╝╤æè$gL╜}rCl?≈ΘWlnöö∞╧lvà╠Σûf?╣WúÜ╩Z╥╝┬╛╧3┐╣i╖»^▌╢m╦«èæ;╒└∙█─É>c2käÇ-Ç ┬/╝b:₧▌)≤f@PÄOd█UyÄ╗Θ╣ª\\ÆcqLτ╢╤░É£τ0╛Årl·5ΣC:\'B+ε{ {ε╝.╣«úí~╪╪j[▒G÷╕+7/+╛m>╙{ôÜ■║kƒ*¬╬╬û╦6Ft╫Σçéz£ù├╬dε╬;ä**Ω$DÅµhN▒pqBσ@H╧∙HûΘ£FZw>zkT│J9¬6åⁿ╘φUΩ÷│┤╔¼¡é|Lt~àmΦ■8▒\\╓g▀∙Σ·┘■Φú╟τ½PFtô┬6╒░&█f₧B\'¼@╘ë┴¢!┴ÿ½\nò)¬┴\'╬:	╚\ZO╦;ëÆ\rmh╔0¥█\".lpFÑ∙>å╓6Eö3╖*HR≥╡sj\\τIÜ7D;┬_╓æ╣6╢Z╚	ëå|░Çφë╔DN√j·ç«═²÷9 «>}zq▒Z\r2ó╗(8Tj╫ö Aå├`╢ê╚▄½`a∩|4÷½Vπnyî¿┴XσZ╣╥	sSa:Oì∩C╗ÜUj╝1▒∞╟ÿzº º┤8-sª≡I0¥∙1⌡cÇÖ≈ ∞╓?┴╠±╤u⌡¬δ;║+bæ┴Ö╔▓═¢ä┴╝dαn∩OkΩ╝⌐2öK╔qσ√0!.Ä╚G_ö¼ô∩├d╪µ─≈├;\"U═*╙yΦ&\Z+b-¡.╠Γ╣≡}H¡úÿ9┌U╡llá├A╥┼C\"#7V{ë─k≤}H≤ö(µ}1╨╢▄n╖mk≡@l~Cez╤π`£■}╫åù}¢7┬╕πg\0■\Z└£]█╚ea(ùùπ≥²╘r!|ƒƒ+▀çΘ}æ¬fâΘ\\k₧iä⌡ö┌xL╜òq}î¿Σdñú?\'¿w»Mn█╢▌εn\"∞KDƒì!ÖwHï-┐A┼┐ß╒n╢º└¢9╒¼\\¥)Σ├4₧₧≥H\rT┼r«z5e╛Å!├₧≥æC╡╙╣╓xî═╙æ╥┼#¼úP?$▀Ñv▀â|êσ~─D>B*(J╪≡⌐ú▒├{5½e│▐lû╦║«l»1£v░∩└╪σÿTN╩ñ█╝y@v \Z╗▒Éî£ª┘╓ûú┼≡E\\B╟C½_Sπ√0EòrB>r▄µé|ñ₧ï2à≤Cµ╚┴dÉ*·G╖⌡î┼ó▐\\]]<√≡┘ú\'gg╦C,÷|Hπy╒ßl£µ}╪T▄╔▐╪╠;dyMáù\0╢wnk▐S░¡╙≈b╔┴αK▌É╚∙░▒û╧τôgG╧z∩çDò┤°>rE>ñ°@|√σ#╟U╛╘▐¢Θ<5─\"ò∙╓µ]ë┼N¡äLê»½S⌡c!1╞G¢Θ\\Z«÷s\"┐√{\"╕¬óσz│xxy╣╛X.┬]^rX╨ÇÖP≡⌠w√ÉIΣâ╠\Z⌐╬ σmu■/┐ßS\0/║Wÿbß=H\r∙pe0O╡:Uh▓b*|╣\"R| cE╒b¡▀▄é`4Q9Sl1╞F±╠TÉÅëΩ╤╓∩Y¿█û╖█-oy╟äN¥∩+▒{Z\r½δl^íT┴Ü^πù á┌ⁿïâß·èüWα²╠Æoå▀àä¢╧5⌡▒}GÑs>Ls╞\'∩»∙╚Æ∩#&≥!╔`.┴▓A╛Åß±╧▒╚=╟╟╒╞Ñª┐Θ&I¬╚G∞∙Üo-ª≤Tæφ▒É├\0UMS-ïjQφr@|«_u!!}çºÑT┴Ü`¼ºâ\n▌╒δ╬▒ê)É╧╤`ÑòáφÖJ«Äâ╣/╥Æ▓à)|╙æSZrs@Ö#7e~ôjMS¡//V\\_ƒ?>█,*°1í¢«[u¥┼gwƒ%BΣπ.ÜRcW■α`j╠á{%▒rα═ÉDP┤·a²m⌠φ°╛	∙αÄ╧DÉ▓G└=º├V/¢ì6äW$fnê╦µW°>t⌠NUÄoFîuñy╪π╚≥àr\'Äæì.>&uªs╔├6∞ÜF╒+	╣╥{Ä╓╗σ&ç≈5w⌐⌐⌐n¬┼┘fq╤4uσ°▓░┴▒aEƒM+LΦws▀▄_Rä±∩Γ╟F,ñ°@|√?szA>\"Φúæ\"▌?I╣sΣ√ÿbAÖ╩Ä∙££æÅ)╠═\\o?9╠h_╛|│┼▒\\n&εÅ├∩ktτÇ%ñOå¢7╚▌¼2░πΣâ═R{ú╥╝CQ£D>BΘ£I²=ÿ╬¡úhSG>l£QI─ûrR╦Mê%W√9SG>LδO\ZíÉµ√áδHπ9╩╚GƒóÄ|H╬âKeD)¢öô·╕╢äêε¿╨Ö@äΩΘ╙+\0╦²3%ù?ê£è├∩*├µ;yDñ  ╗v┬`ⁿ└¡≥æRDÜàΣä⌠+⌐íèVA><yƒaZG>╧KU«÷<Σ├_╧R¡h4∙╠ƒ2┐║╢╘S╬■j÷r╒l~ⁿg?x÷w~≈â╟½Usα	┘@MW»Lçü╔9$└α[\0╧	°└îGwW░N╫QJ╝╢çD╢°}Lñ┼2G├Z!ª≤┴JW╢╤₧ÿ╚çë─┼≡·Σt°Σå╕¼╔íìñ0¥╦╬sεêà6oå6≥í═3æ)╙╣-▓A╣≤í°¼e¡x╔∙Φ╒╘⌡≥├=·╜▀√α≥τ_²═¢╫»o┘╤¿╕T¡r)s7ÖjX┘═µ\rƒ°á▌╦I!ÇÉ▀*TR╣!Z²äπsÑ╟_½?Æ╣:1úZc2»ª≤⌠Σ═¡║TA>ª┐&è■ßÄy■╢₧┴|s│╜}²Ω÷└\"5	C¢Φ) ╟å(Z+\0o┴°-@┐≡Ü≈≤JΩU¿\\╫▓t*@&7D⌐░~«\'╙∙╜ƒM≥L}╥f0╖ß	ëê╗≥}╪l\0╥IJ╣\090¥╧\r▒ÉΓ═╨^G┌rcσûD\ZƒS¢¥▀ç╔fK:▒°>B⌠N╗rUδ⌡byq╣j¬║éσµo;1C¼τ}╝ ôKB/\0╨[ºô╠ç⌐▒#─ZU¿Rµ√p/iªs-─*╓╝jδm}╥╥{ⁿ≡E^≥å ╕ò╚╕¼φwδ∞UrK╞╡I	á▄√%░\\4g▀∙Σ·â?ⁿ╤GÅ/╬W>9 &r╩åNÄÄI÷¡  wº╤èüjù`B,b±f⌠╜▒∙>l₧gsHûµ+▒¼óe╦≈A&µtS≡C¢┴▄Ñ*V,╛─BÆ=Ñ\\\0ì£ÆX9+SA,╪≥┘⌐!Ö≥pX?\'░}Lτ¥[wé·;█Zi¢æ2▀Gé9≈DÜªZ>z┤y⌠■√.Wδª\n8─în\"+$╧gd╤\nbφMº┘╓µ√ÇÆ▐Z≥L╬ó╘åÑ▌ƒTæ\r─.gäD;ºñ iîWî└πTr2\n▀Gæ?å\rU┤┼Ç┴ÄG√!ú/┐â6A¢JYY╢éÇ▄M⌡▌Σ\"µ╘╖╨]∙@RD,bV╧rσ√░òg╔tn═≈aèΓ¢£f5+X╚±5└╥╣(░Xg>ëO 4rrB>┤rU╞F,b±qh╬│Å═┤òƒiU¡╤Ö╬c═│û═HY╛╢\rò═Åc╖╠█m█H╥mò`╟êå+3z⌐é5┴V╙;σ└Z1┌]7T¡¬G⌐T╧è!╧Γ√Ω|c╧½╘f▒≤aDO\'Rí½_εûbδCè≤P\"╓ú>º òƒ¬ì┐ºo╖▄▐▐╢[f∩ΩA}$ä}┐∩2>}hJ╩ÑU+╚╬╒e\0»xI└vg°x└│6E┤╣\Zz├QÄ-▀çö<C?î╚Gh╒+⌐£╙ZHÖ∩├ñ»≥# Åêöⁿ╘╞U║zû⌠xAYεT¬QEµ╦╚∙p┘K$F9╔]¢R¿ε░ì$B╡\\╓½═f▒¼δ*ûí₧╡qB╚a\0│k┘╖[f■└O|3╝êºÄXh3p╟ÆG╟≤½φI-ºcL╜M¢AΣ#uv^$6╧c╚íäΣΣ<\'ε╟$ÿ╬ïⁿⁿl█┴qd4ï·∞ΩΩⁿâg╧=>;[¬`▒αÅ {r√f≡·╒dZA@\0ámoxÄ¬·D/åL[!G─┬⌡yRHE(s║/▀G╫╠(G▀≤┘£Ä╪|ª╡Ü≥æ\néα√î¼wj╝!PûúUòj¼jT╥τσy4U╜ó▄°Pl*(J╪è£Ö╬]╫f$█╢ ╕«¬σf│╕zp╣╛\\«Ü\naexm£[⌠úΣÇL⌐╤∙┐║Ñ≤⌡s>≡┬nφ╠¥∩#ΣCdπ\nGDÜφ¿QN╚ç╓¼|Ü:╙y.êE╬9%1╓⌐¡├ó~ajƒª■Zêàé£}9\"ny╗m╣σûYαa╟ ¬ú≤╖⌐jV√|æ¼┌¼É÷█ù(\0\0 \0IDAT\"Ç6 b╖┌¿·%ü_▌wñ╡ïíèd⌡¼╘É╞S∙p«z5²Θz■Θ|u⌡╟%º#6▀ç@╘╚è1=ΣÄkSΓ\0ù╙╣v %·\'y╕╔╡Ü<m│»|%■ù>ΣC,≈c∞¬`|▒Éi>æ\\l}ç£]╢¬«½f╤TuUæ+Ω0t╪b;?8▄ß£ác1w-╝l╨æéÇ¿xΘ)U╧è%\'Σ╣\n╠ΘjU»RA╛Rï>à≡ß$Z>║╜íäµ9σ±╩íHy∩\ZS²RlÜ·τiδ¢ª^_^«?╕╛>╝┘,mÿ╨⌐G╤>■Å╙▀≈}ÅíWÑb╘6kñ:√∩«ª\ZäΩε*α.ⁿBµ\Z»Q¢hå4│║$π╕`Ä╞`T├π∙b╚ç+	 ├¢ßZ=╦7jd╩U·∙·6\0I>▀~∙╚qò/╡±Ñ╩t.▌)─\"7äB¢1₧╢YδpÜ:▀ç⌠ⁿÜ╓æ$B1&≥1╛Å╙▀H?¿⌐⌐n¬σ┘┘Ωr╣¼╗É╢╪O_R2D>N╚,óJywÜ╒,╟íå;û£öæ╣c#í≤í=▐í≤α}ÆΓI-\Z3\Z¢:▀I¿£ö½^ΣC╞íQ?s²╒τaε╚╟╪²d-%h└δ;═ ÿÜ╤P¬`¥.│αW`:└$¢╙aÆCBrL)9Z╣&û╠ΘbLτ«²ÆΓ√░¡Äσ▓FRe07}₧Rñ)≡}╕n╢⌐±tΣ╩≈a\Z ▄°>ñ\'D¥∩┬πcs╦@·je¬╚ç⌠┌ºz▌ò├b3┌&t_ÄÄ!■Å╛∩LÆ╜  ∩╢[Ç>ßK\07~8Ñ╚╢êBÄF0sz╧ª╔ì∩#5≤\\r5\n▀GZê┼dé}╖┬≈1«|╠\\ q½g13┐|y│┼>─±¿AåM▒½:Vù╤;«Ü┼┴¥JñΣ▌cε-Ç_≡└\0▌kHú\n╒╨\'ò[ßó»`Äå⌡s-½S▒┴	QC>\\ï╨jV.H4ÉÿPΣ├T╦┼fjσf╛Åa45Σ#v5-Θ├Tl╛ß▄Æ╔≤}H╚ù«Fe│åf╚≈a)º\"¬ƒ<╛X╬â╠╬╘ù╥àé⌠σÇÿÉ#öL+╚ΘD2j\05°0⌐▒½PAHN∞ê╜`±²QÖ╬í╘oΘhQlΣ#╖√╨à∩c^╚Gß√]~ß√ÿ¿■±}²╞r╒l~ⁿπ|≡;┐≤▐π╒¬▒⌐åσb ·╞)Γ┴#╒VÉ╙ô,ß└\0φ!$ å)Rí]═╩E,q	Σ├±~0iU±2ìüOnê╔p√DúB¬t╣WB¬bì]QelΣcl╛Åé|╚»#DZG>╢yd∙╤°>┤╞╟⌠ëâ▓vNå┌«ÑwéòhΩz⌡╤GWW?·ßGù┐·╒ï¢╫»o]`╚.╟ßÿU╜┘ ╪▌k.9 Si─╕!╞τ\0>╤ïε⌡9UΘì╚ç¬╝╘¬PI=?╡¬X╩Q¼╤Σj?g.U¬4µí ú╩/|ëΦƒ¬▐iUJd0▀▐n╖»_▀÷%ú█(ab0»╤¥ 1öÆ}+╚;væ╖\0~\r╨╧╝<▄┬ódÖ╟]σ└ \')Ç░<C?N7▓╖Q4X÷█∙pA,LrL≈|m\rº»êb┴û┐∩█\0\n╙╣∞srg:╫µ═(╚ç²°+≡ëL₧Θ\\Γ9▒¬Q┘ε]Y∩╘ÉÅ√U▒V╦ª9;[6UU∙÷Θü¿Å¼░/▓A\nï`⌠VÉ{├Q┴ε╩ê⌐¢╥ !╟╡ÜU¼ΩP«▀º■M═╔)x╛¿£XLτcΩSÿ╬\'╕wd8∙U~A>╤?U╜█3÷4╘╦E│∙Σôδ■│?ⁿΦ·Γ|Üb\Z╕«äsεqF▓▀T\nr2≈T┤â├ê▐ë¿º─┐ß\"╟ÑÜò)bZ╒ï~÷`:∩|;╞]ógÜHC,ªsù*^╛9╢k╔ª_!r\\╞Mr3ìqw╒;59ª┐Kí╨Æ╗Üôp?╘æÅ⌐╬C,╛┤▌e∩±▌├B≈a94M╡║║:╗·αâç╓δª▓0~.ç▓îlÿrYµéΣ■D╓\0\Z*<┤╗n╕\Zw±ÑÉ█Cà½■\n╚┼Ä>ÑÉc#±<▀¿╤X╒╝b╝Ω╣Ω]x:µ╖-σ¼~a:ƒµ:Ü*ZN▒⌐═╡¬ík9┘╖éÇ╝╗<└k\0/	╕e\'Σâ╓₧»ù{°69╢çΣ╨*Z«çw≥aE│ìª÷╒r7═¢φτc ╢╡ΣMl∩í╝ p∞Wî\\\0ì£-²ºZ¡Jï7c¼£⌐├╦X╒£ä·\r∙HàΘ<╛ë▄Æ	W╗\Zxα╢σv╗m[╦⌠íI_9▌!ÄÅ╔Fx\n≥«±╝½é╝xw╡ñÆ╙!σ═º─≈aQEïäÖ╙¥√Ö+≥í┴cÆ3BÆ3╙99ô¢MgfΣτP╔ìÖªⁿÖσ	2s╗σφv█╢>e░6╩├\rƒd⌠,\riA@Ä[ï-└┐Bà/Axy7╦▒¬P╣╩▒æ≥<W╛í*ZΣâh13F╤l¬r9<▀:┌π¢c!u╧7ä∩â=·:å╢ëO 4rbT╙Æ╥n╚Gî;⌡RδHC∩▒y,ƒslô¡l6ºδ3▀çö|m}╟«Σ7╝Q╡X╘╦╒j▒¿δ╩ª|ÿ\r╝Φïä£~ù-ƒæd+╚²y½yτÿU≥U¿l^ φ£iñ\"4:bK*¿¥¢┴^δ└¢\n#z2∩uΓ·∙╪ä\"\'▀∙Ha\\\n≥!│τÑ¬?e8▐⌐∞ç╣g4M}÷ΦΩⁿâg╧]ƒ¥-U░╪≤┼&├∩åÄcGgg≈éÇ╝;τα└═~æφπ╝RU¿L;,σ°µt▄⌡Hå∩#R-#≥!═7╥\'∩tⁿ║·;╘\'Θ(öf«í╡*ë|ÿÉΘ═/▀ç»■∙╨=(ª^M+╞:5┘>A\'D∙╨╩╔╨╬▓╡╤R∩Çƒê⌠j#5Σ╨;╫u╡<;[^=|╕y░Z6╟,µïóO^Γ1)Å░  ╟φK▄╥∙_>ßS\0/╠╡╘bΣt─êlKm▄┬U»ÿà⌡ôƒ▒m└╪zk!Ñ┬î╜m)rΓ╦ƒJ.¿r?╕Tú\Z_ÜI #Σó∞≤╨Ö╣m[>$í√6å2|^\rⁿM╢/HA@\0≡╦ u7k¢┐▄²ù≡%Çùt╧┴╫F,\\ú\Z╥╣(R|C≥°>╚ç▀├º?]dÑ.9.I╚ⁿ¢⌠2Θ3σ\n&╣±}╠\r▒╚Θ╬╛ª\\φ¬Z╩²Φ½zem│S¢▀╛q╧ÖΘ\\2NjKq╧ΦÉ│δnUUUS╫U]UΣzÇ╩≈rN·>wY¼╔╖éÇ∞ºδ▌#fÉg,G▒H¥∩├σÑ╫α√(LτßδQ0j4è£╪╕«w│ π╡) à∩C╓╓º&┐0¥τ▒g╝█M╜╛╝X╜}u■x│Y╘\nïñ╦	⌐,à	=≈Fgybâ¿&BuwpτïÉ╒d╟D,lσ╪Vo\nσ√≡¼óσ╠≈ßÜ¢╩_╥≈7c≤}⌠╔±╔\rq	¬Σê|ñ\Zq╧iÉε¢çXz├`├\n▀ç[ ╡∙D|ƒc├9ïΘ\\∙-╫┤I²{∩KεRSS╙T½≤≤σσ▓;D├╦δK4∩S╕0íO╔\'┴«│┼!╖∩╧S╔\rü≡≈RΓ√╗?\ZrYÄc:FÆ3ªⁿæÅöMjÄ╣à∩├,û&┤F╦ⁿΩε=ö∩|3≡≥σ═v∩Ç░α▓?8UÅτ╫ù╥τ!ûÉ£î7çiñ╖ù√µ\\▒pìR╪µh╪F╟|⌡╖Σ√8▌╚£æÅP■yU¿llC( ê½>Éí▒,╚çîφi╨û:^c!à∩π¢lm│╡ï⌐╬âm%EΘ9₧2▀Gñ¬W\'z▌¡Θ▌)≡Ω╤┘bn&f╤ΣB?╣αÉ╥╡╪╕π│$[A@║█-Çƒ°5Çφ╗SÜ\Zba┘f╟┐ùµ▒°╛*▀GH┤½ïà╠½ñ£1ót∙╨╒oJrb╔¥è|σw¢h\"9Ü∩±▄æÅT√Θ╖G,ù═µ╧■∞√|∩╗Å/ù═ü─τü╟êç¡╙╤\'ºΣÇL¡1°└τ|αoxh%ëëXäΣ4╧&\'@∙8ëÆ¥:b╚ç-╙yh«ïìs#ì|╕ 1pöcZ█Æ¢B.╚çû■⌐!\r╣Σó─XG╚hÖ·æ+▀çt ª╦3t(B╚çi|≤@,Tσ0úi¬╒\'ƒ\\_ ╤}≥α╖┐²÷7o▐▄║\\!íÄàa\"\'t¡åò]+H≈¬╣%┬s`╟Γ6τc3k+#│e:;Üò:ÅGomû²(U»ª9⌐╜┬m|ÑjZ·%Æw╚αφm█╛ys√ûD╔≡ ∩╩┬∙╚╓hñs6yα7\0²└½╗+Ç▒╔±═æp}nΩ╚çt«Äi,C*Ét=çá[½/Xc│6BÖ╬SG>ñ½M▒╨b\"╫ÜçXπ¿¡┐»¡t8╘∙>öæ±yΓ╙╝▓Y°>bφDDïE]»╫ï¬¬¬íÆa`√ê>4ñé9╚░\ZVA@W∩∩%9\Z	φΘΩTíd¬╚ç╦⌡⌐óL▒y<r╗∙É2M▒╚-≈#≤£îÿ≥i\n╚Dß√╨╙;╡Jë┴╚\0`▒¿7ƒ|r²■■Φú╟τ+ùÉ!╧·⌠│╙╝É«\\æ╙¬Y¼0hQZA@¥3¬√═¡b1Σ╗ΣåH!ª{╢J╚╤ε[#╢≈t%scñ½P∙DiBy<l√╒⌡L█▄í▒¬^ìì|Lì∩#42o╩âK╡Ω╒X╚çtd$ΣC£∩Ck|L╧ü≥°k⌡aè|⌐rM1└äª⌐V╫╫g╫~°Φ┴z│¿`ƒ░╘ed║Æä║Æ╬m■┘4ïÆò∩í5É:∞╣╚±╤J╚⌠{,ä@¢╟#u╞⌠Xr╡ƒ3⌡\n3Z}╠╜RQîgΣckiΩ|)sMæ⌠k@=₧\rtÇsu8èb╣&x┐\0√á=\0ÉO┤Fú*û4≥9τ┬:τé╧wß√⌐Bek≡\\¬kIΦ34ªÆU▒bWÑJ∙É╓;u₧)╛åé|î*≥╚ç6▀GHP╨w»ê═≈æ\ZGöε▐├\0╖m█n╖▄▓[║═╜o¢ä	Ω╩.ñ8 ▌ì\0╘┤\'£íáì>$▓¡Ö╪IæΣ⌡π°·ò╡í$╣τ╧çv╘(û>╢╚G╩Lτ·Aê┤⌡º─Σñ▐╧1√MÖ╩Fáô1ùy(|iφ\n¿⌡ε┴m╦███¡½╥u Θ║JUaùW2TΘ╩t²*½VÉ╬s/3Ç7\0^h≈8êE┼⌠2JU┼2!\0Z╒íσ⌡1¥▀√╣9\"}Bx<╕╟ß▒eBâΘ£-#>╝!\Zêà6▀ç╘F;Γε¬wj╒│┤é#▒∙82τßÉε╟ΦLτ╣╬âå\\MΣ{Xh╚\\P≈]¬ª⌐½╒óΘ⌐éσΩä╕86Σä┘╡R½█▀≤╧ⁿ└7vΩXU▒ñ\"╢╠Θ₧²P╦²ô7C{b÷?─\"τ\n3TΣî.╖¼U{⌡╙∙⌠⌡Oφ=Iug4M╜╣║:√α┘ƒƒ-U░8`æ%æò▐φ╦)9 ôhm{├└s¬¬╧ÿΦú(╛s\Z▒wæδó┐∩ß╒Ç|XG╤╚≥²\r╟P°╨(ìbaB.\\r:l\nh─f┐u▒▌>z÷╔w-╧K∩⌐╩±╡æ⌐±ê└╤╓&╩\'\r∙╨¬F╒⌡>k0¥kδ/╣τ⌠}ƒ!╦SΓÜ≈òΩ╬╗+Xu]¡╬╬V╫¥=X¡çδRZ╪┴	▒ë╚dδíñ½²7 ⁿ╢: τ_\0°öÇ»wK1&b!ìÉh!.5ÆΓ#!┐τ½τΩä\ZkΘud¢╙AJ}╘╝guª⌡.îΘ≥≤æúⁿ∩\Z>öi╦OÑΓ]Nyé┤s├m█é≈9 Üe√╪╧½üs{vF╣  G¡²÷êPm■rw╝¡¬»ⁿΩmpê╞B,ñÖ╬ò°C£æù2┌º{─┬5W╟T╦╫∙2¥Kσt╕ -.Nú▀σ║n¿c±}╠\r∙╚òΘ<≤¬Zú#╣╠CäK*G├⌡=ÆΓ¼≥}W3@▌\0QUUU]╫UE∙≡\\┐G₧NF6╒░è≥╬¼╤ΘÆ╢¼uá╔╙!!ç»Ωò∩fï┐Σx±ÉÅ¢π≥=St⌐≡}─▓&2zºVφ¬D}╙Z[Æbºé|╪┌÷▓ûª╤φy▐²w╤╘δ╦ï╒√╫Wg╫g¢ex╚╖uê╟╓ó≤C░┼I■╡:√╦S#VâKà≈ôyGE#àX°z√╛Lτæ¬h9#«H:╛∩S╦┤ëI╫\\≈a:≈⌐₧╒⌡╠┬≈ß÷εΣCw>rσ√╨╩2⌡ú v≤ ═t«òS╥╖▀j1¥KqVIεc┘Z;╣╠╗ú555M╡╛8_=\\¡Üí╙jh│9α\nf$Σ8¥₧ΓÇ$σYjWéºBYµ█pΓ√ÉµæΓëÑ	E>L╜≡}╚╜S1╞ú yΦδY⌡ÿ╧ZÜ╙y\n·8╩%òTï╛£ÅSâI!\"£Jcâqs7├L.▌╜╢N?ô`DùΓ√Çƒ</╛¢hÆKÄêIåB╥\'G\"7┬ò∩#vnêM \"╘\\W▌╝ñúgsC,µÄ|╪«╦─∙>·5₧Å▄µ!òujôñ+7ª╕gΦóεD|wπà	▄2ê}εô│┴╔ ╦╧│jÑ\n╓p╗ß9┐\0p╗[â.≡eΩ|╢╧╒α√╨αß╚π\"9╛·î┼≈íì|─¼VD	╔¢[ò¬I·û&b¢τ,_╙┘ôö3g┤ⁿφJh_╛|│┼₧─├Ww!∞3Éç▄B£≥û*¡  Cì▒ß|┬└%H▒0E)\\∩ç≥}xV╤π√αüƒ}█±▒ù╨hÅbß╦≈a≤∙Tsb╔Ou\\Ñæ$:cσdh■\"±}▄+uVë┼≈\ZΦ▒]G▒°>B₧ò\Z≥æ╗M:æ╗ƒ\Z\"Tl√≤3φrD¼ΦcAτºäz&é0üèX▒#>JΓPâº┼SLâ∩├╢▀>²aßqëí╖Å╫|ÉöÜ6▀GL>_╜0╜b⌠╖≡}─q6╞£ç\"_O^¬{╞╕6i╣l6·º?x πÅ»«ùï:ñ\Z╓╨U¬\n≈I	Mⁿ4α}$┐╞pΓ-└mwtßα`▓σß║/Jq*/ƒⁿδ√~ƒ^}╧φ╙úâ∩â{É┌/>$óôà<πï∩█╙sÅ┬\ZF9&╣#óC╤₧í∩Qá£╙ΦÆ	5sΘùΘαε╗)HΘ[>├L£Θ[4é<⌠Æ╥╟┼ªH═	╠│¡═⌠▐ö╞┼⌠Æy╬┴&¢lv¬·Gô»╜Ä\\≈ÇPy6╘WN▀ò¢Mz≈=jÜj⌡╜∩^?■√ⁿ¥çgg╦PFt█|Å╛èXY│úd8@tK└s\0?≡Ba]7Æ▄6₧╧yδ`hEgB⌐∙Éè>ìà|H≈1Wªs-∙⌐!⌐τÉΣ₧≤æ9≥ße│S│1ΣsåπCëΩH\n∩₧û\r\'½Ñ▒▌r{s█2│┌┬Φ╦φ░⌐åòM+9 â½Ç╖\0~	╨s0^≥~╩)╕ÜòmÄå╔@Æ┼▀I≡ç£Σttmj╟ƒ{≤}╪▄δ╡¡f%Y],─α║T│≥òc\ZSëÜ≥}sÆkòÖ▒⌡û║╧£K⌡,-╣▒r2┤╟%╙╢ì═NU ▒ΣK«#⌐\rù╜╟╫ûHWÇL╔&à╔%Ωª¬û╦║\"╜╛2╥⌡╜,°@\nb^⌐-\0█ñ▒¬bIG┐m\",+Oñ?>ëµ√(òcΓï|ñI5\'#û▐⌐!╣\"S¬ªEE QτÖf>┐)V╧J∙\0Ç┼ó┘|≥±⌡√?·╤╟╫τδ\ZεW░╚αP╪8&ç$ïñ╧éÇÿJ\ráµ=\rx╖╓XU▒åå≥0%δ\"G>┤╞q(Jπ·╛JT│\Z·[╫¬X╢k#ö╡╓╫╢┼è┤KWLÖ*O╟X╒╟á$7⌡udÆ/┘W»z╣Q_ƒ▒⌡yF╩êE╩}σεx@ÜªZ=╛╛xⁿ±G╫7¢Ew╢∩:â═┐>\'µ°≈╛L∞┼I½U\0╕¿!áΓ{kIéY[ôí¢⌠■å(≥≤Å╟⌐»Tí4≤╝Σ╕æ▓¡δá1XàsbÉNì\r8ºXNNr╟xÄ≥3h\næ}₧└ZJU∩╘°>Æ¡┬EDD	╜S6╚╞±íöª▓xï2hδ\0▌\0xá%Æµ±pòπRa╦╞├≈DN_║`╛¢τ█T│≥òπYq╔Θ≡aBwò#US^╗╝φ┌9áH>g¬<┌╝╣3¥╟FåöægÄªæ⌡7>iÅ┐╤ªåΣπMòΘ<4û╣my╗▌╢ª,⌠$b(╔╝ÜÇ╫\\~â	ßg\0^╨█∙÷ëáÅÉú!\"∩¿┐]╫«î/<╔=?hSC>Hp~á▄»\\s$⌡O╣&~è▓┤╟¬ ÷ΓºÆ╙P╓R┌╢>Σâé■ö╝m█÷v█n╣emÑÄ┘╬OæÉ\n├w»yñà^æ╤bα\\ß9▀εf:$τ├7·Γ¡`N∩c:∩▌αlúU\Z╠φî╝É[─óo<}½b┘⌠r\\σK┘╞TÖ╬Ñ√»╒╧╘½¢Σ├Nⁿ╘æ⌐ud┌3┤⌡╡!∙σ¥▐┼`⌐i¬f▒¿¢¬¬|ìz_rτΘaá±░¡éEûQÉä[E¥≈εl#φ╥ç.è⌠=▓s>é₧oz?τÇ|─«èòq⌠)	²SΘ \\*Θî╒∩	áDyδ_╓RD2┼\\\r\r=MSo=:{ ┘│ç╫gg╦C,▀Σñídt8]r¬]ë╖ΓÇùo≈ô┌Æ1\ZπδdjUç▓ì\0X\"b|6┴Ç¬ï┴R`╬╖`ï±∞φ\\ìúOQ⌡ƒ*OGl▐î╣µEεç:≥1╓<PµδH\Z∙@Ç╝╘█ëD÷₧²÷[╫╒Ωⁿ|⌡°Ω╤┘ú⌡┌⌐\n6|Σα|░┴╣I«Éí÷7°O°éƒ≡ì.Åç∩ü└╫Θ╢öù,╙╣å£ÿ≤á┴ÿ₧rt}\n|E╬⌠█╞àbUú╩yrd:╫╨+Ñ=Ck╬σ≈fp╦,Aà>T∙¬\ZP╛B≈╒¼¼ZA@║╫╖ L\0m■\0┤ⁿ·=≡\r≤~åI*bo≥╠mΣ▒Ç▄X╚ç-╙╣¡╝π\0B¿¢M*▒0!.îΘ$╒Θ\\?îΘà∩cÜrb═â╢\\W¢Ö(ƒH4ΣC½\ZU¼y╨╓▀ö[b¢MQ▒9â┤⌡Aα£δ∩=í¬¿¬h≈^▒çé}▄pHl>╧╩	)H_Θ]├▐┐4ZⁿÆ90bcΣ|╕|¼Ωb«rbΣtÿ~_°>≥α√Hü7$╫▄å)í5\n}í)Σdÿ÷(öw )Y9σíæ╪▓lÜjsq▒~zuuv╜┘,j╚┴iªⁿÄíÉSºäQr@2▌v╚╟±ó½Aáúáâ░ ┐ⁿí≥╤ƒ╤É¡\\¡\n\'!êàc║╥b│┴█¼╡╣T+*╚G\Z≤É╩:éÆ|!¢─Ä&uΣú≡}╪∩Mc4ä≥√Σ~îëXhσíΘ┌▐▀╖óªó┼ó▐\\^¼«WïCΓ╖╢τtZ\r½╧i╔Ω*Vq@∞├K⌡;à╤¼_öîÿ╬ë\"Φ Q═è∙░ò»æ╙í▒!Gê⌐╩╒~NA>╥Æ_°>┌3Nε╚MJ²ƒ3Ω~w|∙Ωª▌; | Γî╩αÿ«f±ÇτUÉâ└φßL`Ω^╥Hàì|yÄLτI!!ΣÅí╤pi─┬╡zVN|┌r≥æ╞<═╧å!╟┴ó«SO÷╚ç⌠:╥B>\\≥≤|t\'╦}┬VÄö-	╒\'º╜ç»¥vπΓb╒\0¿│⌡âl∩▀S└τº▀M╥	)U░∞┌-Ç»\0ⁿävƒëεσ1Å░ê¼;╣∩Æ²æ«.╞╞═a\\¥╛τ\"\'4▓₧e▐ZΓ·ºªù6\"úrMƒßGd«┐┌₧ù╗■)≥}HW╗╩╖\"Γb┘¼ ⌠O~≡⌠┘»ï:4─╔Φ;╪LpÆW│èbs£%╛e≡sÇ?°à┘í╩%:╬Ω╦ó₧∩│σs-σ±ë╙A%x╔E?╫■╪Φ∩3.Σ∙εÖ⌠&â▐Φ╤ëz╛ç₧∩qÅN}Q,╢Φπ╨ÿ╗╚qò/e ñ⌡╖²~¼qò╥╟╓6H╧│ö|m╣▒⌡Wû░╤ç╠ó≈@Γ═e╢Ä·ΣwφM>c╥╖≈░ºΘ=├Wƒ£÷₧╣╠X4⌡·√▀{≥ΣO■ΣÅ╬╧VC╣ ╛ñ₧├â)τ#¢<ÉΓÇ╪¡é[>≡Ç∩«╔▒°>BQ<╛I$╟D╥τ┘Å┬≈1r⌠)fDÖ2╥;w}r╙oΩ·OlçUk┌7O8ß±Hm╧╚u∩Θ╨¢\0s█2o╖φ╤φ+╒E╨U\r╦─É₧t+9 6+ü∙ä_âΘK^≥█58▀G`-τ¬W&²Ñs:ls]B╟▀¬ß₧#▀G«╣\0▒Σ≈¡Aô\\m_¡\n3╣═│╘í,≤¬Z╢¿═┤*ÿQ╛╢■!πd│╕╛√ñ░╞Sô3V\Z÷╣└DUUQ╙TD├∩¥O╘▓ï²ÿá░δ│╙Då╬î₧R√5┘év╒v?ÅäTH┤ê^Lφ■ñ╚t₧▀G╠Φ╙Ö╘τéáΣ₧3æ{N\"r~PæU~╩ò\rsAcI_ε■8▓X╘δÅ?╛z·ú~t}~╛¬ß_Ä╖┼0²Äö═)êφ!╘4⌠zΩ|]τx	╛[ú$┼»┼tεí╔ì∩ú ßNt╚╗&~«U⌐ªéáEΓ√ê╬t₧xU░¼σK!^πª¬WíæΦ;m+\0ÜªZ=y|■ΣôO«¥¥-+°!\n&$Γ4╖─ª<»δ3èÆô/b╖Ä$Éèyc≥}X0¡ïîú┤soSZ07╛Å5╤söOÖ╪òT·Uó╒ú>kRLτE╛╛╛)±tΣ╩≈a±VVDUED▓ò║«U¥■\\í√┌ò╔Ij≤+ê═▒⌠tu╜M╤Γ√òw≥}ï∩├╡?.▀ôê|äΩ}∞┤╪F│|ΣHDwrï(K╦╫µ╫p╡±╣≡}öuΣgCö·QÉÅæΣ≈σjΣáà∞c╩B»╪\0\0 \0IDAT!Lτ⌐█$m╣╬71╕m╣▌n█÷└Æ.Φäl£¢VÉ<ZÇkÇ\Z\0▌¢W%ñBE▐~≤▓«z%φÉ`îweD╫₧ç╚)≈-╦Φ╙╚zº╠╡ó╙T*QQΘ├ΦπC3ƒπ½giî]L╘╜ +╠αv█noo█╢σ(█ùπæσ⌡½ΓÇ╪╬>tα\rÇûëÅfZ⌐Éf\Z∩c═%╫Dtaª⌡ Σ├ªzûk$┼uÄ¥ƒ╘É⌐√╗6r}⌠≤}Ä∩åô╥ÉKà╠tEεç)áJÖ!7Ωδ3\'²5Θ=#E[.·σ∩ÄQT╫U│X╘uU⌐;º╢N¥ÉQöΓÇ╪m[\0_ß9Ço\0┌¢-ΣCæ5¥Bs9\\upA,$ΘhG«╚Gε≈n)Q╜sE~R^G9Ωs\nª┘τ╠╫Æå■SE,µ`#MSo=:·┴»╧6╦C,⌐à2Σ`⌠9çkY-ε3X·½Ωî╓èb╙┌φ\rÇτ¿¬OA⌠Γ■∞I#pö╗╧O72∩¬W╣≤}╪╚±ßI\r∙≡æπ║╔hG¼%+╣HΩ-¡FÆk▄8╙u╘\'▀tÑZ∙»z9╨Γπ╚Y ╘°>rA>b█:âⁿ²╓]╫╒Ωⁿb⌡Σ·Ωⁿ╤f│¿⌡d0&ε≤⌠╜U╟\"a╕╓⌐╖┬b│L┐■· ε▀}αS\0_∩f44X╗┼╚ÿ\"▀çΘ≤ÉÅö∙2bδƒΩxÉB R╘/≈±╤ª╙Tr\Z\nèª┐çª≤1Σ2â≈ B&╨àτúΩp6¬^»VÉí┼⌡φ @¢╢√∙⌡²%Çù≈úPí╚çm4═≥√lΘΣRê₧&τ=%╛ÅPΩ(∞ß┼`₧3≥1åΩTïRa&»ud╥;U╛Å▒æΘ⌡Öô■⌐≥}ñjï≥▒uDá²?_cH=ïnΦ┌╒±╙·Éd╧ïΓ¿╪ε│╕=.·æ≡≈,┐OÜM,╛¡¿Qƒ>Æ| pÉô≥╜█ÿ╤X╩┬LC╬ÿ≤£úⁿKì&0>4ü∙¥▀GΩv)┴jZ4M╡╛╕X?╜║:┐┌lûºäü╥p8öT░cH∩·îG|ÖèΓ<δ{Σπh╒5╪▒ó∩gsGBw─ ÄQ╙╦kï<╛ε\ZE╦à∩#≥┴²Ωf╪2íKDuñσLì∩├╒µªåX╠¿┬LÆ·K±┐ ╨f#±∙═u}╞BXRσ√pæ├å}4╒èï2r£╘T┤\\╘gùδGδ⌡ó╢p@╚aA\rz╒≤≈ç▄Å╓α╚\0ë$ó─╜╒2σ∙\'φ▄ΩwJ╚Gh┐|╟gÄ╤\'⌡≡Ab²ƒ;▀╟TÜΓ°╙öµV½Ω#╛Æm[ècû:Å╚X éd▐c┤c(⌐µ4\'ñ∩sε±«K¼M*[▄ß√╗Xí╒í|¥Γ╖.y≈FªÄ|HU┼J\r∙0=O*7─ºoCδº≡}äδ=7Σ#▒\n3╔Φ»<■╤Éφ±1┘\\ΘuDy╠∩`e╟▄∙>Lk(⌡JyarΘÉ±▒GÖ╣e┘π|╫üó╧┴ΦBDÄ╤Éd¥áT┴r|?Φá/\0ⁿ\Zÿï·=c╗ù5º£¢∩kWÅrÅPäΘÆ╙a·}.UÉ┤#Äöá▐\ZrR£τÿδΩ»,ƒ(\"≥Q≥?Στ1⌠N▒RΓ╠┘=#·╦Wo╢√3!┐╬6ⁿç│|5▓vnq≥?Φî»°Ç%└ù∩\" &╗/Ü╚t~Ω|╠∙Ç≡<⌠}╧ö╙aBH╨!gl~ï\\y\Z\n≥æ╞<Σ╛Ä╞Ω6[j|J╒½n∙.%⌠÷╡⌐≥}HÄÖVÑ<Ep╧ê~v╢¬▒╗₧O╠╬ïsê@¼/í╝╧╔pas╜$─#⌡╛ÄΩπÉ╥≡µ5*≥!à°H;Ω!╝\"Ü|)≤[îü|ñ4⌐!±╠Yrc?\'w>á c=g|┼&-═·O■≤∩?}≥Σ≥¬i*)B┬« vò▀5U├J║─∙@╦╝ ╖?⌠≈σ∙╪,ⁿ╙┐∩ôG=▀∩qD*╛uLlσ>┐≤s	9╢∩├┐Üòï▐d╨√Xù▒rΘ:óFYGR«┤■R≥b╚!96┴,₧\nÿo-╣▒ƒú, `¢EâI66P{HiiΘ▀7┐«v┘Vo_[B┘╢Tµ\"ª▐î┼ó^ α∩╜≈_■°w«..╓>σxM░Yùôa{σ*i\'ñ8 n»┼-╛≡S\0/║╫o¼(\n	╦y╛╥└╞═tx#Ñ±╧àmV█fM∙╚#jWÉÅ·ASAnr^G%τ#9╛▐╠αûßMë≡Bt!▄±R£╕ÆΓ┤°└W`·?╝ú░σ√èH9┬|⌠╢╪╪4s>Bx3lσ°µ╕≥«t╒1∩╦╧░σ√0ìi╩╣\0╒┤bΘ/-╧w~┤ε/╧½┬L:·╦ƒ▀G¼▄Æ╪·√╛»s╦∙╨▐{b8t≥╢éT¼)╤≥tPNùD.HA@▄█v »▌M¡#Yá╒ówê╨S¿<╫ù^37B:j╘≈{Ä╪ ÿ}╘░h╚ƒrσBßΩ(πk:¡Lg.┤\Zg¿A>f⌡N∩o└,⌡·πÅ«▐√ß?║:?_┘·,&[▓▓*ºs}A@▄[\rB\rá∩WI≤L⌠x∞º╚çsM∙╨ÆïΘ▄åΘ▌à∩cH▀⌐│═j╦╫f:▌°}¡h`╞fó¼Sσ~Lå∩#VU*ôìNEù╜\'≥σw%ù\ns1▀B╙T½\'O.₧|≈╗╫Wτg╦ƒzx╧.╒▓╚α╡ÖH	Mç₧ΓÇ$∞≡φJ¡5ⁿ6╜¢zVÅ+├╢═┌δp>óEp\\·#%\'╢▐]|ƒ\ræáwAs╬sbRƒ*│8e*ƒ2ù╧Ö▀Gæ»oïµ└vs∩QZG;\Z¬¬¬«½ÜH∩Vƒ│q@<╢G≥░Rq@\\V└«╛≤└-\0f\Zr&C°>║nΣ#4è|HìKhä&ToX╩z&ä·ÿK.@Ωⁿ┌r\\▀╡▒r3µ║Ä\"=g4Σ#21W∙1r`$9æñ╕ªµî║╚\'▄╢╝╜▌╢mkùàεx\0∞eF?8 ╘│ ]£ÉQ≥BèΓ┤ⁿΦûÇ/°╝Φª	ì≡°>Tú\0}æ¢■╧DÉBΓ3#ú╖ïsfÆ%▌╔=·D	╩╒Éô┌G	╦d._∙9Q≤=\n2O~╩HbA▌π╔;d╗╡⌡?£tz¿░¡vàç┼╞ß)HÆ[φ╢┌°9*■)▀ÿ╜diª±ôMMìΘ▄╡?@XÄàTJJoäD\Z∙╨f¢à╨╕\Zδ⌐#s⌐0ôy5¬▒·QÉÅë╔ùX/ÜêEJ6ié╚╟æ<¿¬¿nΩ¬¬∞▐k█╩A]επ1;3╔T┴*ê√R$┌πn$\Z9 ╟u(╣êÖ╙┴êÑëòïóü|Σ\Z}BΓzOAseV*·Å>>öí∞X{X╬╢-÷▐[>LhÜz²Φ╤┘╙≈?xx╜9[¬`à,ÉcGí╦▒áü0ⁿ.)#XwOÿw╡wΘ╚╣zα╥|╨y╛Q ôc1▀çI⌡l8{\"╞T\"Γ┌rÑ+Å╠\r▒ÿKN∞u╣ª+4s>öΦ<\"Zδ?æ₧¢M╩═╓YΩ╧\0êQ╫╒·Γb⌡▐πδ≤½═fY#]Φ╦≈ΦzaåêMî∞Z╨N¡≡Ç╕,≈-nΘ\r~╬;&⌠od6FI╛¡τ█\nRß√0(_}╚a\n╙╣Ä╝┬<▐<h╦δ9Ü](|0π┘!═│)¼±╘lRN{O\Z6Öπ┐8tΓp╪$á&⌠∞Åù╛¢╣═?e\07ⁿ·╧╩αα}	^2-┐@ΣC¼ΩU,▐î▒°>·8Ωc≤╬µ£É2╙y.Q=Θ■Aa₧%·¢y5¬{≥ò°P╘½^i≤╣─^ƒiIτ╬àΦ═┘$¡¬W9T╙≥s)\"ƒ∞⌐├δ√]¬Rr@▓rB▐¥«[║ú@≈Xå╣	$XE╦τ∙A╝1∙>\\┐+Q═½╦H┘M{├ª&/╡Vr3╞╒?w╛*k4·sª╬≈A»úæ≥êhÜj}q╛~∩╤ú≤½═z)┼änRΦPéw;αäá╟19MD═!)ê═lo■i╫╕Uç9c▐eñ╙]╪╦╥ùF>Ö╓∩²o-▐it└ñO(≥├p╧3I╡\nRn≈o╟F\Z┤σñèPîqÅòÇ░τDπ√P╥▀┘FR\"r╡ƒ3W╛ÅlÆ╢¡░{∩xß@uE╦E}■αr²h│Yÿr/|╟iδzNWΓ∙ß{}NH╫í\'Ü3R▀┼┴¿w┼░÷∙ΦLüδ>≥ß≡|▐î╪|«êào┐$ú/S½Æ▐½:M9▒ΣNE╛╢·SBΘ(≤∙-|i╪≡\\½i9>çvg~\"ó╫»oZ▄U┴Æ8îú}á╛jX&∩y⌠Vƒc03â░=Lú∙╨f:dZ∩té√■^é▌░∙╗!º!∙░I─ƒK$m²SC\ZrA║b╦EΓδ╚u]	d╘∙>ñ⌡Å]ò*uΣCC∩┬≈æª▄░τJíεé╨╠╠½╒ó┬]B╕Åb╘│¿√£SI▐ñ#<Ñ\nû_█é±\0_▀≤=B6\nó╚ç	▒É¼f%σh█T─	A>\\σΣPq$ùjM>s│ \ZrJ╦w]ì▌ç\\╟ç3¥_NP╟╘+·σ&Wα9,û═·∩ ╜∩╜w⌡Φ∞║⌐½\n║n&^Éíùî1,êùIΓ[&~┬º\0╛█╬\'┘═┐╡#BÄδ╔÷√}ÑÑ}Σ─0▄6∩¢d┐ñ\ráµµ£δíKr│Fbrè#R▀⌡º¡┐f∙µτ7σR╓s╜Üb╞ó⌐╫δo=}·_²W┐{uq╣vIF╖I∩·lΦ∩L╠ΦI╩,ƒeIt▐; î≈@╕|≈ ┘ù█s║fMW│å«^\r]Gr²■±╧]Ñl]ƒ+e8╕╟a╒\'┤_Σ╤w█∩KòΘ╒3û■Rzτ é≤si∞]Z·G\Z6Σδë^╜\"à⌡#╡|⌡ù╛.├B÷NJ∩>9S░m«çw¡╡\ZδÜª┌╗µ\"╕o1V\'ƒU.╔╦╨½(RÉHmó_⌠▀┌»Θê	ƒ,ve`╫è@─ΦY8F%Jö₧╝╣$ƒùu4¬ⁿ╙|=5╜sF2s£_¡+Ds▒IîY#╜,╛h╪αX \\ß>R⌡8ú2óù+X₧+éÇ-╖√:X√ÇXùô┘â|0▀]╡Ω╗r⌡÷≈▄│■Ä╫\r█? ▐≈MrçΣ²lπt╗>/D>∙g╙o╙wmß⌠.9╘≤LWKg#7÷ù╓L╜sûπ▓vSÉ√9«╢╥U<\'ÿñ?t⌠╖~NΦ·Dñ∙ò║µ.Ñ≈⌐£█&e#╡m¡╘K«≡Z┌ïY,Ω⌡G^=∙â?°≡╤∙┼¬å]eƒ£:!ⁿ«pì▐èΓ▀j∞$Ω&Hτ|╕«▀£[9Zàñs:|╞S√▌-δq⌠₧h8$╣▒ƒú$ ∙ ═£ëπú±£\\sV4⌠₧#\ZK3▓;?úi¬╒{∩]╛≈²∩>╣:?\"$┤±å·╨╗:ô╠ò½╙V«`°╬≈c	6≈vM⌡ñ▒Åáz╔╓∩=Åd₧∩,Gè$VN╟i ·ε\r≈ì╒∩▌╞╘▀G₧T.Ajr|▐∙┌╣*▒₧3r╬Gp┘▌╪≤αkk╟╓┐╧>KÉ·àî╟s>┤Σ╟▐sLτ▓RÖê¿«¬║n¬Ü*ÆTåa«p╒ìΓ╜D=¬Σs°áæƒ∩*çö⌡åσ≤Cσ─ê\Zσ~∩û2y≈ª&\'w╣▒ƒôk╬G∞±)─ÿzπQ≥╨µ▒τα-╚╢m╖█m█r╪m╒.∩Ü£\r╙∩Æ¡╔_ m¿╨0P┐uüç╫[2¥ôk%\ZΘ¬OCƒKV┼rElåë■≈!$R╤φΦôñ╤f%²5æå)V╜\Z½BK.╚çr?╘æÅ╪≤j│]╧N▒⌠≈╡Z{XA>≥╡I▐{(╖-╖██v╦í.H┐B]╬äëîÉ;╛ùzq@ⁿ╖Ñ╖IΦµàK≈▌ºM╦╡¬T(BÉ\n≥!à \r²l¢@.aL5èü\r\r²╦=δÖ┼n2U;≥kⁿsG>(ß±(╚╟LmUUu]UoY╥π╜╢ⁿ6╣!┼I█²└ûÇ_°└╖²K═∙░Äó╣▐MöB,┤ÉÅ9Crå▐├£rb\"+╛·╛Å4µA{}jÅKñ~DC>b±ehτ▐hδ║τHÅçë#è╟ ╘=GT_AÜªZ?|╕y∩²≈\\¥¥-+∞Æ╨cDç▓τ½²┐╢τ∩GuBèΓ│î[▄π9*|\n┬╫╓çâΦQ4⌐▄-ΣC·y!╚\r8\"¼╨╟Σó7≥9a╜τû≤┴»ú1l^¿╕╪9╣▀╙╧M~¬¼Θu╧F> F]╫δ╦╦⌡{Å_\\o6K¢2╝╥╩█╘µ╚Kq@─█δ÷å_mƒ╙úσº\0╛ε}╔MQ2gªs╫(K╠ƒ:äy]é╔£-ú#ä±∩▀Äq∩û₧3\'Σ#╞=hRXGêá╖┤|Ñ~8█∞P²]mùÅ|(╦ºLσK┘e\n|/s¼└ù;▓óf½I@Tƒ#┴\' ╗δ{─c;r$¿8 Z¡║·┐`█╛·≤τ|k¥!iµr█∩kτXH╜g¿7y>ô#÷1ùΦPr>R¢Å\\╫Q╞²ÿ≥æ½■9 ⌐«σé|î ƒ¡ⁿ a┼╪│3}ñäÇ]n:££ΓÇñ╥°σƒ`╨µ ┌∩Mtáe▐╧Y▄zæ█h^j╝▒*Å°T≤:■;WΣ├σ∩∙>BîwA>╥ÿΘτå╩╔┤¬û8≥1\nöσº╩τ\"ò½\"Ö≤Æ║M*╚ç╦úÜªZ¥ƒ»▀{⌠Φⁿ╤■\nV+ⁿ╥÷9ºêç)²≡7-JHF▀_s┤gô≈h.UJ*:4oFΩzτè|X8╕IΩ_ÉÅ4σ#s²╦°╪╔/╣Cn{F▒I╙{ùu»òR]W½ª╣x≡`s╡┘,+°3í╗┤├sL &Γ┬ΓÇñ▐¬│z2├0Ω·┴╪a!─|Σït╠1∙FæCÖ╬╡x3l√a½wHnê¡^6╚G¿ë(KnòAµÜ½æ8ô≈Tæ	)∙&äâ4xubÄÅTεP,²%s4$÷█Jèc∩9áεc3¥╦┌|µqD¿¿¬ëHâσ°ÿ├ú╧í096w╨ú9&┼	╖æ█╗ΘïU⌡JèΘûr╞µ√═∙`APóDπ╚¢[«FYGπßqÖ╓·ƒ≥╤σ╕Ñ.w╢Γ¥!b┤╠-╦±╥ÇéΣ⌠3[D&ji▐ΓÇä¼7┬-└_üΦo\0<0\"╬U»ñÖ╬Mp|¬|╛\nYÄc.╚G╩≥sA\Z$√\'▒ëµzº>û|σ±W»z+ºGÜ)<5²╟F>$÷╙╕σbôRG>Γó╜;╥A:╢ⁿΩ╒═:9CW⌐Ä weahºπ╕U┼ìZå╖╠°└O\0╝╕τ|Yn\\6|2ª5\"OZÄû▐Σ(\'f⌠ÑD¼πΩ;v╙║B½}57w∙╩╧▒╢┘)ÅεδSz╧æ╓[\Z▒ÿ½Mè╔\rc═╛²æV╦ª▓p┤¥Æ>4äFñΓÇΦL=1ÿy0R╞╝√≈vscâù╬ûåë;╛Oü▀πü╡h·╝OV╘π┘ò[├û∩`╫w╔cîª*▀w═╪~?9Σ±«j╜kSò∩·W▒º6┘±s▒3â∩·üºφ¢║■Zδ2d╧╚┘&┼ö½a+H≡]░°{M│·π┐≈▌\'½½║ª╒ªL96σwGi┼æ⌠>╒æ╙┌qEL╧òÄBIδπ┬t)·QΣ\'\Z╜╥Z╦⌐⌡s¬≥òƒúÄ|─▓Cä<╤G-²SÅ╣V╜Ü╩▐▄φü,⌡·w ╓√O ╗ ÷≈«./6.σxÑ:98\"úb╔	Öqµ-Ç»@⌠9Ç≈\\╛╗]s>╞Γ√Φπ═░}Ä∩≈B⌠Ωùδ²▄1ε∩┌î],ª≤∙Ü,╛S«zÑ%╖0¥ç=6╙9ƒτ)Φ»╔Y%┼≈Aÿ.▀╟ÿ╢xnªúºWDU╡╦Qr6*tWr8LI⌠<ÉéÇä╡[\0_°\0^Φµ|╪|_∙╨r╩%⌠	A>R╜┐;F⌠F≤jF*²ƒ{5#Ü╚ö╚■8πô½■)τ,Σ#╬;7₧|nÖ█ûY`ïr\Z*├τ4≡\"w╜╪ä╚å╢8 a+â	╕%αå÷▒3r>║ε╒┌ }ƒ╗>W*?⌐»B£δ²\\¢{▀}╚╟P╬ç╧²e⌐√╗6rc▌Å\r¥cë√╢⌐⌠ ⌠{1τ;å▄T╫QΣ~ÿr;é»bìòô!5╧▒⌡g!²Mz╗µW\0²ò]∞ÜämïÖ╖ù¢\\═w┴╓/╪?g ƒfQ¡>ⁿ≡╤ô?°²»╬╧Wu└C₧\n╤╔▀í-║SÉ≡U╪∞ æ²z\nE>|─╟╩∙≡}₧2\"┼ë2º(╤╘kΓº<^╣╩ì²e∙¬IµúεφÖΦOΦ=\'.#╬LnJm╫╟ES»ƒ>}≡⌠√▀∩ΩⁿbσôΓôº1¬,╛7╩µ[r@d£╕\ZGX╟²£█{«╢|╥╝}δ0vNG▀╧«<╢║ç▓▀║▄▀5═=É╟²╪Ts,BsQñ≤£\\ .5╣▒ƒú,?\Z▀ç╔ª╞ùæ╗■⌐±}ÿ÷îP¥bµ6ñ&7÷s<rHwαjU╫U╜X╘uUæφí╦uBiα<┌àå₧┬7cx║┼j--|æ╚à+c8╩æjΣ■┬δ╫⌡╖¼°.ò√▒#M\"ΘÑ══T╓╤¿≥ilÿΩsr╒Lτ╒O~|vw±╣▌╢φφφ╢σû%7ñSgσ4üⁿ87Σ⌠oçr?╪αß$┼╞D╖|αg\0╛⌡≈¼ÑæÅ╨¬X╢∩ît⌠╔÷=σü≈ç!┼\Zrî$½≡ΣX$T^j╒│┤µÑ ú╩¥Θ<rÉ╦:Æ╥_Jo╢▄[bεc ÑΩòá|n[▐n╖m╦╠.ç°Ér£ªjX}╧╡\nVq@BÄ_U╡≡%ÿαE°f&à|@XÄ»▐080╝∩i.≈nsîn1µ%LU┐é|╪ëƒ\no²ô∩≥1W¢DUUUê┤\"ö]Äå¡2Σ┤DuBèz#bb~╦t╣;Æ┘▐s╒Γ±ò#ü|Hσt╪Φ}*╧7è╒╫Åε▌║┌»┬≈ß÷╜╘°>┤σf╬\'óÄ|─₧çP¢=²csVà\"(c╪┤▒ΣCYnπ├@]W½╦╦═╒ô\'ù7δ┼ü»C:╩h╦±╤τpD/╣[ìô31PæH┤G▒êì|Hσtñ└tΦ\"ö⌐■Ñ┬╠▄L]▐Ω╙D╞ƒè■jδ2z\0xΣw«á·ó≥\01Üª▐<xp÷┴╙≈>>;_I0í3║δAƒ:çD≤.┼+▄OP╜$lS╗╤W┤▌vΣÇH!C▀ù«R\Z5r═19²;[ΣcΦ*WHe╜SÅ>I#,9 Ñ┬î▄ª£JnIΩ╚çV5¬X≤É¢■ZHe┐åñ■cσƒσnδb∩¥ƒkÜªZ_^¼▐┐╛>|~╢öp@å╔PΘ][Td4╧╗8 !│▀ⁿ∩α5┐∙╟?aα┼▌∞Äφ▒═▒╨èkτ¬⌠}ª]⌡Jï1<╩*MT^⌐03o╜#=çr╧╔ê╡~r╘?E─BJƒ£Q≈⌐╪$OφΩèûM}~y╣z╕^/4É╛╥i5,[■ÅÆä₧Cπ7  -■b ╛!`╗¢Fäü_&)Å╨▄ê╙ƒ╡½y┘≥}H╫n/|■≥\n≥!≈╬i╚òz■╚²0¢ëå|ñ>┌·Kσhÿ÷W─┬╢ «√▓I_¢$qα╬=º$»[çèWDüUU5G9Φ┌ç{[σçÿ╤Kz°tÜÜ▌─╥▐à≥}hE\0╞F>Br:\n▀╟╕╧)╚╟<╫2ƒXz²≤┤C)»┴\\Q≈é╞╛\rv└-oÅΓ\"Qq╣``█≤▌¿hHq@<Z╡ⁿïô)#`╟åbÇiτú1╣EE┤x3|ƒ!╜}s:L|&9í╚╦Ñ{2RG>B⌡.╚G╪;º⌡.√╩I∙0!ö[nLƒ¼T╫ºfÄå═▀J┘·ÿ╩ÉMJuƒ2≥ß :)╣╦`~²·ª┼ε\nV╚ü▐5╤¿/∩âƒò+X╖╓~╔H≤f─Ä─╩Θ çΦPß√╨╙_B∩é|Σ╒2ƒ├Çy\"πô{\0+Φ[╨╪y┘║lo\r╨ó⌐╗ÿ╔%^ó╙â8C< ;nòVí4ëπ┘ûü_1≡-╙.=ä⌠nüüíC5[¼├c9dÉcz₧m6W╜┘QΩ°▄%RG=rL²πÄ≈uHÄ/╩─pπ\nòO╧╖╜Ñ⌠Æεƒ∩<à■╜╢|φ■│≥$5ÅÄ╤╬ß⌠╖▒╡(7Γ°≈ε]íπAÄπ┴æ≈ë├»Σ£É▓-óêkI╙µ≈âü┼óZ²▌┐√¥\'δ⌡ΓQU╤!¥^Z[\'Φ»~e·NöVæ╫éoⁿ└_xa╒ÆêΦ╪¼+ëC\n9>╧µg█╧b─ò(Q┌πÜóám╟sù_Üƒ¡¥√xL▌&i9╔inª▓╞Σ┌ói╓τw?x·?ⁿ≈┐²αr½\Z9m\r┐╩ ò+X│╬tα\0ƒx┬┼╗/┐4oå»£╪|┌╒¼Bε∩rîΘ░∞!Å√▒ñ 7V«éδ≈s╜SƒK╬╩H|o┼τ┬≈j│} N[x╛»«{ü∩▐╩Γ#\'7Äá\\9¼\\¥1a¢Já¬¬¬ª⌐+G3Bc╩∙\0åæô¿╣ æ	2l┴°Ç╧|c∩áJ!Z╚ç½▐>▐╪╚G₧╤]∙<ßùU√¬Inz╟Æ»ⁿ£├ò+⌡≈Ls²Σ╛>Ñ≈iùΩ₧AÖ╜╙1s22FYÿ╕m╣▌▐╢-╦J_ä│ï±╝╦ß¿αvm½8 Θiê	tCá7jyW╦ΓÇg¢ca{?X·zHN╟Pd┴ö≤╤w»╢OÄ╧²]┤╥⌡╨«y»TK╛φ▀∙Σl°î¡ª£«±Æÿ(╧sN≥]ƒπ*vƒ╙╤τpêσ|hσd╕╩ù>°µdhÅO_I└╛à╚Θ╦!±┘3ål	█$I[╫τ|─╬╔ÉÆ/¥Ow\" c│¿V╧₧=zⁿ{┐≈ßú≤│U\r∙╚₧mGÄK╖▒º\0\0 \0IDATƒ\r^═)ê▄B¿q─ΓAp═▒=,·F:|╤╙╒è▒╓#Gqrµùáë╩Iy╝ª*_∙9∙H`δ╙╥ΩêEÄU»8ú±w]-Üz²■╙çOτw₧^_\\¼\\Æ╨Ck╫5½├Y▀╟âV¼Æ\"≈b╓\05╗-Q¢7π⌠{&c!═≈╤τ4╕Σ┤H≡xä▐▀ò╚²ÉΓ═≡5ác╫èƒ▀ç╘╗µc4≈â─Ö╬ìÅ═àΘ<VnÅIF╩·çΣXHσ∞Hσóh┌ñÿr5╬ªc┘Ω8πODU▌Tï┼ó⌐½*Z¼▀╫u9\'º╨P∞ÑΓyDnA┐%£╣sñy3H╪\0ÿ⌠▒AΣBrC\\s>r╔M╨µ√╨É_jδ\'fOªb3╫;g$3G²S╬Yÿ+≥k∩¥w3s█╢█φm█╢╠π)r 3¢{Φc≥ï\"3▌╖\0~╔α╧	°╢\r╪ .╚çv┤╟!░E>L╠Γ╢LΦc▓╓┌Äë┤Qò«Æ╥Éè£\\½iiδ⌐&ä#yΣ#╓·╠M ╘ïXrñτD[n¿~¼=┌┤≈▌}▒my╗▌╢-▀9 Ü&lX╧√╛cδuè:$┼æ0╜╢|Aî╧\0|\r▐]┬\"rE,|æ⌐hùï-ΣC;┌RóD:≥µ╞YÉ+kq¼τ(╦º▄æ²¥÷î)╪╢▄PqM╣c<\'╛═&óè¬wNéíèH█ⁿδ2]ƒqîCMq@Dû3╢`┌└≈gMèºCï∩├$ºk¥█Φπ╩πa½{¼(V╚ªƒ\Z▀ç&b!¡ù╧ªæ[\rⁿTÉÅ─s\ZL╚GpεG∞y░	╩H╩MU ▄)■æ∩£6WSÄhlΣ<@ΩªZ=x░yⁿ⌠ΘâG¢═▓B8íëáM∙]Σú8 )√ ─¿xW	ï╪╕n┤sC$╨!·°╩bcös⌠ISJ┤ s╛g\'\\Æ╡|ÜJ⌡:╩D«÷s\n≥!#ƒ3|&bô:╖CFS╫¢╦╦═√∩=╣||vTå╖∩Ä║╧ì,£Éh¡8 \"δ¢oAⁿKlδτ\0╛u»\n%Öb│ª┤σ╪µtä2í█Ω¡═t.i⌠b2¥√╚╙D,R╩E)╚╟¿≥\'ç|H?\'ΣF╩~ñèX°Φ╙╡╫i╜s╘ßäñbδb?g∙{▀«B°ε\næfóiWº╗£ì╙╧║rBåÆ╧┼¥òΓÇH°═ ╔\0^≥¢▓╦1:ñZ╣!╛Q█⌡═ûk┐∩∩\\s¥µ}╥╘╩êEA>╞{4┼O%JJÖ╧o⌐Rò╨╔ú╝)╦▀╢▄2C╛\nû⌐▓N£⌠|f¢ór╨)H@k▀ⁿch±∞ù╜╨ε.aIV│èë|É┼µ#Ö╙┴ÉG,Bk╔╗FWy±}°Θ┬≈æç▄╠∙D╘æÅ▒µ7╫u║τH█ΦXêE¿>]√[╩¿╕ª▄)\"∙╘u╡:;_^?|╕y╕^/|r@|«U64≡╤╨ï·¬Rτx@\'3,U═J\Z∙·▀í╤\0éC╣║ó/9Dë\n▀GZ≤æÑòÜ£æ-mî⌡ôr\Z%8f£Θ;¥s5¬┤ΣWMU¡½çn«╧6KM&⌠S║Ωxû\r≈╟Kz!\"L╬4/■Γt║îÜ└\0c_ìùvIτK∙≡σ±0+▀£ô£╪∞╖╢r╟¿Y^ÿ╬eσ─Üm╣R╧╣╤ÉÅX≤0V╒½╘sVñ⌠╓B,ñ⌠!ß1╦╔╓┼▓╒┌6╧O▐ô~U\"╘U╒TU⌠Hè⌐oeÿ°(ò░è\"?φ|DH\r∙Ç┼ü┌⌠Ö╔@┘\"9≤}─▓£á▐s¼0ô≤:B₧πCS╗ç₧{╒½√╬XzE¡<*p¿╬=Åh&╢Ä áen[V█╠√r4Äæ¢jX&╧╖8 Θ¢╛≡\0/\0║ >╜ï%╔≥B√≡x╪\"$69ª>─f┐╡▀╪≈c}rKªÄ|@Θ¥ÿz╒½D#πªΣ╠h╚GΩ╣Sc:ù¬zà\0╜║)}Bu╙É½mδb╔╫╢ya·▀½x┼α7on[ä≤Ç╪∞·^Ä\nµ▄Å╙<⌡V╖A╘Do°á╧└x±.\n2tá%ÿæå╒GlsCB∙>4ú#Ñ2H┌πZ*╠─φτ≥Äh╞ìτPªπƒ2▀G6#G╜╟╪;╙¼╥V∩«`i▌∩4╨å¬au9!╤Zq@d*┤ßäL√Ñ┬Gδf╚{╢ë≥▓├:▒y^ù╝╙h├£╙1än≡ë¼«≥╙]rl╟íONΦ√─=╤)┘ª{├╛sì\0yRzÖµ╥WSÅ▒τ┴÷∩4╫æ╦<î╘µ²z≈▀╜iÑ@⌠#÷<@°9⌐Φ∩½╖i╧p▒#{å⌐/>÷╚G_çô₧íeδb╔w}N·3╨4╒≥≈ ├+\0░#½╓HFw⌡╥L/Aq@r⌠@÷¼~wmæÅ\n°«*ó▒╓gv┐╘9P2òq═9τú ²bsÅÆÜl{n·K╜\Z9sBus¡ªs∩HyZ,Ω═°╤√ ╙ °├\'lHLC╟ƒG18┼æ£qª[b·%ÿ₧âΘ█ ┬░ïbuEi|╫éM⌠iΦàπôC	ƒ╚┤╤╗!±ë▓I╚Θ╖>«ƒæÅPä@AæF,Nâ8⌐F]₧½!GKE∙╟H╚!Q=╪Ñî|î¡┐oD_∙ò#ìXH∩=.2$P4m[ù├¡σwì0c▒h╓▀∙Σ±√ⁿ╟▀{|∙`]xò╢╠╤╘≤Ö~Ä╓è\"╗ºm┴°└O\0╝░7 ╛╣!╛Q#i╛═(╒Φnef≥Ñ\ro.Q░╣Φ9Já¬4δ⌡ôδ<Σc>6)ç╒▄m÷nÜªZ=y≥α╔≈╛≤Σ╤∙┘:Σ\nû╦╡)╢4LUç 1∞mÑ\nû∞δ└\0n\0╝░σ²|Q∩Zô¬èe·₧k5½>ñ$ö∩├⌠<úô∩CéΘ\\╗ª;αWâ^╗Γèo?5δ⌡lr¼¡ßuñ╪█¬VöKU░P¢█╓┘┌<).ª▒ÿ╬√÷┌╘╕ªL6ë [ü/ºjT╢╬L┌6¢ê¬ª⌐╦U╙╘5æéé╢₧;9ⁿ½!WÑ8 Γ/╒x╦êεΩ┴º╩≈╤\'7ä∩úT╜Æ»Θ.!/╒Ü°Ñ┬╠xδT±94ò{Γ╣╦ùz╞£*r│Ü»q⌠gÇ█û╖╖╖φ╢eÄ\r⌡▌U½╨_%kΦjVq@╥w?ê\0T╘T4y╛Å!9.▀≤¡╣«═≈┴F)f$?Tnï»ö>1∙8b\"⌐╦W~N2Lτ┌╚D«≥Cæü⌐\"Z{O¢e╣c█Tì╜YÖ⌐¥â\'╧⌠╜cτNHù├╤σ¿tAp]NNq@≤¢╕+└█░ï=╨Γ√(╚çp\"E╣î∙Tÿ)╚╟¿╧)╚G\"≥5₧Aë╬█£mc\Z6/τ¬`ΩJƒ▓ó≈Uü19!C₧╖ΦD≥\'▐≡+\0_0≡-⌡.jå]εàT┤\'47─äΣè|£╬çDT╦⌡P!╔tN╚▒!\Z%\"72e∙#⌡#;Σ#wdE\Z⌐ê╡çìòï\"╜≈─░ucΣí┼░╒R╧ë¼?3╖m█n╖-+▀└Ωc1╩⌡@çì\'ñ8 Æ¡jo~«>Φkµ╜Bñ5r╡°>l■6GΣ#èïè┬t>⌡y.╒▀µí«╚GΩs<G╛ÅéL▌╓╤ε¿Åⁿ÷╒¢>$ò█╘╟Å╢ÿè\":≤3±L╖j╣≈\0\Z;┌╙\'▀∙░╔ò╚1τC├ I?+ñaî\n+íƒ{NFΓfLeè▄ê»╧>┌h¼è£bè≡─Bè4lªV5¡Tm~jhxçΩ║^^£»=╛╛╝\\»ΓTyaCT├äêD±^ï\"┌jÇQ╕╞╜$⌠!ú║ΦÑX╚}öíuÜC⌠)faè╘ó6⌐Ußè19╔δ9ZΩSƒA╜)S╜╟┌├r│æ1mfÄò\'⌠N∩çªiΩ═âçg<} ßô≤≤U,&tº─Ñ\Zklè\"·₧T╗▐εs@h┐CæτVSNƒA╚∙Φ3Üñ _:\nò*b!ÖÅëPH▐÷φä╞%±\n3ΩU»b#P}▓RG>ñ⌡ƒ:▀ç┤££m],²c⌡c²hÜj}y▒~z}u■°ⁿl╒Dp@L9.┐g\'─╗Dr╓¢?g\0▀≥¢┐°öÇ»∩ûbj╚çï╙║│σÖY⌠π o∩▌z$I▓⌠░∩ÿGfWU∩∞BI∞\n┤⌡ =P?Cz└ C#=¼@■AoÆ▐=HO	εpfgwëφ₧₧Ö╛_½╗¬½2#2π~≤¢]<\"+2╥/µεæYτC¬2╥├╠▄▄▄∞|÷┘9º│÷ƒ¬b!y]╬kíµ{~h±O%Ω¥I╣]¡]ò≈▐╤SyτΦ╠█ÅGx\'║+ƒÑ>xⁿΓO ⌠┘÷<;é╒fé?¬╪%╪^│═x^ç£ö╒╒J√àÇ┤a╞ÑÇAù ╙µNpùα═vm <x₧m*>╗\\çF│≥▌╡8òs╖╛∙<║R>┌╕çC╦δR▒8%_öcû█┼ó÷ÿ>\r-⌠╙ôS>┌«τ▒█/∙>║-ºε£t«Ö╬█⌠-yσú√≥Ö┴Ö¿D╒Sè║r└╔√í|≈xÿÿ≡¿,S	}hk(╨>▒úçc┤k┼éZ*ºnτ╕vÄσ?e╔*\\╛Ä£±╝╪⌐·q¼■!ê PσI╛GO╝|f\0vl[è┬[5U⌐√¢zäAtg(\rù┐╝?▐ê,Çÿ╫\0>$▌_ä╗R>┌╚Γ│kpΩτwδ⌠[╫sW;ÑºÉ7Σ}╩≈╤╒s>v√;RrÄûΘⁿÿ╧≈⌡╨æ┌/∙>Ä╗FTò█÷3*Ö╬ƒN∙DL√S`ÆÜCÄ_┌α¬Φ\n∙╟h:≤ñ¢%╩0pαG\0½m8╢├\'à╢2ÿú┴wÅ∩\\w?Ç╙>╫+∙>ykK█┼╥│¥╬s▄╜osR╫╤┤╬}φ|·σ+E]VN─ú(╥ò┬\nΘ▄\0e\"\r\"≈É|0ε÷ûS0^v\'åƒbQ4₧x»¼▓r╩T▀√BA╗⌐%π¿¿▄ªφDâg╘⌠≥╩█W,°└râÅY╬▒₧C▌v:û║j┐o∙╛π¬n╡£²=ÿÉt▌?¿ÿK█₧ô╬Ñ²mòτ│FqârÜ╬φ]¡E≈qs]┘=┤┘~<B t▌~Ç|?╒∙ªⁿ,!.?Φ= τ ⁿ┐°G\0■└6/╫∞$¬┘íE╬σ>∙?|=! \'è\0≈|A║xQ█R/Ω|╖ï¥½s▀}Ω▓Q>┌▀:┼rÅ]╧Ö√ûÑ║¿çÄ⌠£j╘½≈5▀╟9¡9EF²╣û\n╧òq╤₧²╖ ═■τ ├ ▀²π?√│τ]σíΣ#╧╚Sⁿ└çÿxC|@║`pá?╤/ε┐dtαïT\'»êÅo╚ε╡E⌡φOm£▀φ┬çñïr}δ:à|ºZN▌gå#≈[▌v=ò|ÆΘⁿß8m3/╟1s╡Y╧╣µ¼zlƒƒ⌡⌡T3¥ƒJñ┐π«[╒ého▓óé╢PÄ¡O⌠.─⌐s╨┌F∞╪╣╘Xcl┤Xä╖╜ °ï? │τùù╜∙ævhΩ&,█ëæ< gfα\nD?°»ⁿ╙n²▒|C╬1▀ç(OgI╞╤╔ù/∙><┌-╩ç╠m∩s╗╧i╬╬▒╣Ör2≡▌▄g┤KV╦°Fù⌡ΓX/ª╙⌡`0ÿ⌡ï(\nE╚N{7╩å\\^▌╗yB≥ÿ3wABäÇt2∞ëñ\0bdΘ█╧·ª╤¼Ωd^GI9y;8E╫¥B╢┘.╦m╛╦r°|BgVN╫╗ió|<j∙∩Mª≤SWcE∙8n9u╫₧«╞R╫°ΦHsR²√(V,\n|>(º«¥»▐╤	╗Q.8S.îuëN═ÜÖφª6\0clÆ$&t╠ûêö╤.ëc╜v∞¼\"Raö«╟ô⌡DkkÑ╘jçâ┴lz{;_▐▄.├╫?Å╫q¼Äw9∩HVæ╙y▐g¥¥Å╥≤▐·Ç¿v&:α┌C2¥?⌡▌ùS▄╜i+C∙⌐òsn╧ßÿπ\\öÅ╙Φ:╙{σπ²Y├Äσ≤qn∩t┴iíB┼Γ■≈î▒±r▀Xδ┤Räa:¥L╓²4╒ëR*Pèa6[╧~z5∞ça¬///é½½Θ∞╫┐∙║u5ì_|x8╦£$┌9fî▒£$╞Θ╘░╓ûô╘╕$╤î÷|░≤╬≈φ3n╡╟Ä⌐ñ■*u! gB@éli>Vªs⌡m :ƒ«°╝ë@¢┘f╗╠bδ{ºÿ∩π1╦⌐·^gΩ¢┤ ╨τ╬Ö╬[( ╔Σ√ΦJ∙¿\Z ó|╘+τP⌐k%╩╟┐▓+bxΓ╣ü÷╩gªìrz¿PΣ╪║ö┐╤Q«X╪L▒╚Σæ}┼┬üî╢I£ÿ╡│╬╥ P╕NVπΘF╣T░\\╞½δδΘ$èR▌δ*PD ó██∙Ωï/▀Nû╦╪|≡┴e≡²≈â╒/o&╚N╜∞e╩Sε■%±1ó\'W/ΦUY╙;╦å.ñ╗╜ng¼t▒╡?ªÄu>∙ÿ╗9τ║K╘╓╗~jσo£v┘|z\"² v├E∙8ìw«δ|╟h ▒úR±CRÿº\\∞\\º╡ìû½x`¡3JQ«ô╔d▓\Zñ┌&ü\nÑöÇ╔t5}⌡z8êc¡/.éα═¢╔⌠╫┐∙ª?╠ô~¿═Q.c¼K├ÄÖë\0¡3σ┬9ç╗≤WY╜\'┌9ù)Z≡└│:ç∙╤&.!\"y¼║╬∙}! \'░&;╞⌠ä\0ULç·tTììªÖ╬ßY_╙¥ò«│═₧≥ε╓12öƒJ9]⌡W¢ïW╩Åo∙╟┌═<uσπ▄ƒC╫j∞⌐+ºΩ\'╪╢_` ╩sÜô▐═∙═úCσoP╨÷╧╛ral¼╡\rÖ┘Am┐ñìì╙─ä█δ┤╢q£ΦÉLZ»ôσd▓₧\Zδ¼RJ-ß▓▀ƒNπXδ^╨S*╚╚══|∙∙oªaÿÿ╦╦^≡⌡7²σ½Wú	\0ì√╟É÷C╧Só╝δêájÆè6Be·.èΣ╣█B8ΓÄ┤É.á`╕b╞Å,┴┼∩l│ñC╞ç»≥q*\n╔⌐φn¥z╗σ£⌡y┤√╠}Kê₧╨√▄u>ús(ƒΣ▌?ï9πT≥e╘Q,vµ┤╢ßb▀8╟F)δu2₧LV¡m\Zö)î\'½╔½╫úAÜZ█δ)⌡·⌡x≥¢┐∙f0.╙~l}+ÿÖ	D┌Xù─[eΓ▌Ñ╡ß8~ºXñ⌐a\0/╨▓£─|râæK╪pU■¢≤]! gA#α\\#╓■.J╙hV]Σ√8dù-o╝ƒC╛Å¬>ò|φû╙⌠Y£jäÖ3Å¬u2╩G¢;╓]╠ÅÑ╞Rï≤P¢φm[æ┴#òs∞τ\\5\'U½╤■╩┐╗;╛l-î╢w╩â1n½X╕M≈ïîèαN▒p∞@DèH1└[σ┬ZτöR4¢ç╦~:Imz╜@)fá▀ƒ/┐°≥φ$è┤╗╝╘_^-▀╝Ö∞*╟R,╕Ñ┴S⌡ÆT]K5\'7▀üKDÑ3÷+ñ;\n0╨úφ½▄èæ╒àb!╩╟╙h╖(τ╤nQ>▐ƒ±sn╩\n=±w≥\\²\r;.?WαwèEj╫╦U|π;ÑáV½d4¥åú¡QA\n╠<\Z»╞»_Åo┤▒6ö·Θºß°7≤φ`2Yδ^jÄGºûôT╗m ¬T[ù$Ü¥╦|/êê└α┤cσbC>N)─#ú▐╬q▐5y╦nQ╞≤<╥ö<	9≥|Θ\0îë╤+ mΣ√≡┘5⌐¢∩π╨▌▀≤»ºÜ∩ú¿²î·╟/}·╡I▀╛/╩╟1}J║Ä¡Å╩ñ¿Zgº|tφ;tΦ£Y╖²m╧yº¬X£Æ/J7╧ßíb▒½LÉ▀&@N^6╞╕pk∞°Zd╩EfΦCkÑ⌐ë6╩Ñ┌FIó├¼,óσ*^Lª½iF@êf╙p╤╠ºijL/PA(r╠╕╛₧-╛°Γφ4Iì╗╕Φ╙O▀,»√│	\0â╟⌡╡¿\Z°\\±{*¼╟&(hí->╬µy$ä*î╔┌m╥ Φ²╥Xs·W?2xqXÅ¬	╜-┼Γ\\3¥ÅU╢;∩ê≥qZσKVai[φª≈░Å▐╟¿W\'Ü3f│TimW╦U|╦G\0¡V±h2]▀dQúT(RÄÖGú╒Φ⌡╧πkÿU@⌠≥σφΦo~√φ═|Ö╧/╒6\ZTFdÇ4═ó@m|/@█╠╦⌐qq¼]╞ºεïq▐╛╟TH|ÄX╒I╕K4╣Ä;òäK|@╬¼ *{é┐▄>║ ¢┼Σ▌UA┌╬P~Φ«Q[σ<vT¬«#╠╬▀τúj▐;àr║╛▀║⌡vQN╫kZ╟∙>¿═w¡╦τP╒∩º\Zü╧╟ªh│▌u╟σ√=+┐▄√9-6σVEÜ╣wá%W▒`c\\ö╒@0╞FZ█êæê═╬?oïmcRmú41╤6╧à\"R╠ασ*₧Oªδ┘╓wc:]╧²∙Tkcâ^¿╓9╟o▀Nτ_|y=3╞║^O╤\'┐╜╕╜]L±N╣h¬X(╝kw╙╔Ç\ZLmô\rnΘ·.&╠}c░Ω°ò∩ï₧τ╥·ó%ñ[á░¬V╖ÜLî](τ¿|£k╢╓Sj╫9dLù¥²╟m■√╤Φ1τ╠sj╖¿σ╡τE╬Θ6╥4S,╢«V±p:]▀ZδLÉ∙Z╬▒ù├╫?On┘1ô\"·■√¢ßo ÷╗█σ*6/₧_█W5Mì╦öï¼è$5£$┌▒╦Iµπ┴Hεöï∞║8╦╥²aK¼ìÿ╧≥Ñhô¡╖╡+ôG8PA@≥\n÷HEKºc╝êB@┌╜[σπ▌ÜM\0⌐φúσ═½HV≤«ïª∩╫╣(╟*┐Iº¬X£z╞⌠╟÷)æ|Ñäπ`▀Å«}2║«τX╩G█╢╧SW,╩√ï{è┼■σUy-6m╗╙;▐╜\0l,┤qí╤64╞╞╝ÉûêêÖ┘\'⌐	╙─äijcff\"\"Rñ╪▒[,π∙t╢₧üëAá╔d=f3c£φJ=Ñ¼uⁿ≤¢╔ⁿ╦/»º╬1ö\"|⌠±Å≤╔d=E:5╪δ╠.|-╕ß└k▓â┼\rv╝Ä⌐@áσ·⌐ºê|Σ²?∩:ƒù»╒│ΦB@Ä╝∙╤εBδδ)εb╜»╩ç╫á¬┘«S╬ÿ.πΦQδyR╩uT╓▒|$▀╟π╖ïLyZ█⌡bµ≤¿┐XDcg¥█&┴Çìra╟π╒ΣºW├┴gƒ┐|ⁿ±½Qª÷┼ïï`[PÆf╤á╢àºëvqûτ\"╦─¥	H²N▒  Ä╡≡\'h.╢0+÷#fΩεèà7φ>α√╟$y├í\\\rq{äò=ƒàdB?}ε┴ä1Ç└≤çiz¿┬á⌠=»∞δR⌡^ƒ╩nX█φ<┤²m┼SR,3cz¥r╗z╓Æ∩π▌╫Äò∩úΘ╫÷;}¬╣ç┌«τ╝≤}Σµ┤á▓√┘ú¢ ┐[{╬8gîì╖≤ò╤.╠~╬b\"╨¥»à╢╤╢¿45QÜ┌hδSíêöcv½U▓OV╙██σx4Z.¼q.Φ╜# A(k-_]Mƒ}■f≥╫┐·zó╡[ S,°L∞M¿uïCHíⁿxO¥¥░sU ╕╞τ▄É¿╘ì\"σú\0Uæ╖≤╖L\ri┌çì\'=! ¥0_╤K■r│K╤2æ?$*û(╟) TïS~2Ä╡Q>₧≡3~jè#7eA┴╥ÿ&f╣Z\'úφ\'ïEt3ƒàC╟∞öó PJYτ∞αfq√÷═d┤ò╛■fp≤≈ ±σ0Ä╡{■ⁿ\" \"03╥╘║xúJñ;è┼╗W)╗.Iìïó╘Y╦[ï2&Vτ▄≤╜=é:¥i U9K7Q Ü,öu@â¥ß>╛Ω·²z]┴	)\"+Ed─╟ü╣▒A\"ñ[\n┬ h ╦ê₧σE~╥ƒF∩t[Q▒N-Γ╚▒#╠┤┘■sR,Ç╙═tÄû╟ÆΣ√h:à╡CHÄσ√Q5G╥ëù█u=ÅáX▄╗$Å(τ╡╪U.╪8╓┌å┌╪╨\Zù∞∩∞d╛`ml£ª6≤╡╨&π╬╫┬9gτ≤h6¢Gs╩ªQìù╙¢¢┼▄9τé@⌐ Pü1╬■⌠╙h÷⌡7²∙û@ⁿ÷o┐ƒåa:█ry╩EQR╖}ƒ ¥├*├ⁿÿQó┌ M╛╙Tü≡%	╘ÇÇ∞>╫║ë;  U>╗dƒî╤ΩB@║▀╥	▓~÷Y┴#*¥QW₧δxèèàd:ù√Éτ≡~.im>C¬■ê2s)M═Ω¥»E<σìb▒╜lC╠h┤\Z╜z5\Zⁿ±╙7âO■≡zóS├╧₧]¬]è$1n╦ÖÆ╪╕$yτSADΣÿ╟Ö¬▒-?I╠╓╫┬çæ5Θ─SP Ü\Zεáç~µ√s┘▌ä\0°╘╫ä$ò]_ñh\0²@∞µg╗∙[ªÇTeS?°╣Θr¬f▓\0O\0\0ⁿ9ê~ß≈▐SMó┤ô	²╪┘o}╦=⌡3U² èE╒zu╩∙>┌K]+gUδh∙>╬4*╪╤ⁿ`Å⌡Ω■g~èπ▐╞>ôå╠U:│⌠¥q╓Zo╤Yö¿w1│╙┌åZ█x{V)IMñS3ÖpA╩:gû╦d>Ö¼&╖╖╦╔h╝Z:╟∞8{≈zJimφ¢7ô∙?};∙≈²╒└┼è┼nδU╬Q╔≈≥êc9+wQ>ù£62p√ΣñΦBü`╧	ú(WBP≈|^^«  ΣA>▄∙╚≤)#2¥î[! ▌Ná+²αƒ°º⌡wò┌≥ΘΦ*JQ█±▒╩φ║╔≈╤ⁿ~Y╞╤còOO)ï╖D╜jº╝è2÷¥┬7»pÆÜyªc\"(τ╪═τ╤`>\'`░RñTªXΦ┴`qsu=ü\"k£√ⁿï╖7 ≡╤Occ-?√αBm├╪n2m█(╓.Mì█╕î┐cr╠╟╞EaΩ6|µ├=√l╙╪?╘ÿn┌₧▓P»m*uòçφτ╬âσ}^≈{∞╣ÿµæ[òeùÉl╔╞«ƒH▐_¢CDε√Étb<\nΘv)a\0	▓(Xµ▌ê»ú|┤ß╙Qvm¥y┤+àΓ╪f┌l┐Σ√8∞Y£[4-▀rN<¬╓úτ√8╒¿Q]╧uφ╘S¡\\ΣlΦτ║Z▄S,î╡.@pû╫┬²┐σ┐\0\0 \0IDAT%╪(╕ºX╕$ï║─.MmµküL!E╩Zgµ≤h▓XDRD╬▒▐.ª╖├σé9S.zAáÆ╘┌ù/o\'▀~w3┐╕TÜ\Z≈╫┐·zΩ╧±@z)⌡í@âδ5╨╗0ⁿ}saöÅ¿K║÷üα£k█R ╩«½Rèå2┬─\r₧╫MÅÿσƒr─φæò¬ΦXÆΣ|8╚╓$╧9¡-σö╙tS\'^n╫⌡H╛GgX■Qó^¥π│8Wσ├ú,┌!&─ë₧Gæ₧Qα£3≤Y4ÿ/ó)\0VèÑTá╡M√â∙á▀_L╢G₧>√∞φαwƒ╝\Z;╟°αâ₧\"\"8╟êm╙─╕¡é╟zôÖ;#4¢δ8èR╟·ε║═≤\'\r,7mµ8dé⌠5T╣Ñ╧}╛╫ª┴\r~_C╝╬│≥ëDσP_ü¿║╬wWåkÄ»²|√─├çÇ∞¬ «Ç└9\'l₧ÆóîälûxFs┼ó«Oço}Å¥∩c┐¡º[▀g▒ù|⌡╦D∙x¬╩╟╣╝╙▌ö[¼XPIt¿£z≥}-vö▐Q.h[_ªTl|0╢╛ij#¡m▓úXî╦x⌐▓ƒφφ═r2-ù`@èz=$ë╓▀?£| ├φΓΓ\"PIb∞╞╫bæ╙1[ó(37∩|╢ ╜╢╬èr¥╧«·!Ä╙>Ç╧é╔-÷à»▒╬{φ«½@4φ╙2π▄╟╫┬7ΣoôêZ╗ío█z>>äk ΦUq╚ïÇUû\'ñ╩ΣÉq%Σ╪√p┼{┘Mïª-∩{ñ.█/∙>₧~╣╟«GöÅ\'=ûεH╒╕÷■╟z┼z║Q.⌠lïh((ÑTá(H╡I«»τâ┴═|z╤é$5·╙O▀~ çƒ\'D@»¿8╓6M\r3ΓH█$5îw╤íα#îR╗½Xl■²Eë╤┘┤├O- ╖⌠=▀∩╘1\\δ*Mε═ùö-è┼Ä√T╤÷¼Å+╚─ε8⌐δkA(?■ö≈}▀╚W╗åƒ»╥▒ ²\"g⌠²πU«Σ ┼G║Z5|äÇt╗:\0\0╩ⁿ@<7>┌≥ΘαVw±┌/ºδ3E■^Æ∩ú√rÜ«┴ºûGΣ▒█▀R∙Å₧Θⁿ▄╘╠m╖╨F╣└├$NΣOΩε√ZXm-º\03¼16▄ⁿ£òJ v[┼┬%DP∞╪&⌐ìî╢╔F4!Rñîqz6╟╦U▓öR╞Z{s│ÅF½üεöï8╥·╗∩o╞?╝╝]~p┘Saö┌┐■╒╖cdQó╢╛yèE^GùEçj≤δRüáu∩░.▓s≤▀ß┌╨äΦpE9T╙╕»C■£ºíq(ΘΣé╧|²a|sòôy╤s┘»#/τG┘?ûòGBΩV! ÅH@W╠x	`╬W╒δφ╛uφ╙Q⌡ε<Ñ(9m╖[≥}╬e╕Jª≤âµ=¬Q≈«»àcD▒Ö┼▒₧)ó₧▒£╬ga╣èg)RJíù$&╣╛₧≈ooù│▐E─▒╓ⁿπ¢■?};%·α2≤╡░╓qkùª╓æ\"pµSaô─lÅ|üê`¥Cª6ë5ô╩|/2\'≥{╛>╬╧√₧∩±í║åV╙δ┌T%Ü┘╟≥ 8$╖╧ßî*\'gƒz|╬è∩Æ▌╝úDy╗\n∞a|S┴╕ú=óÆτ¢RÑ@°ÄS« (Tú}\\≥╝≥┬εû╡#∩V▐┐e╣AδB@Ä┤.2)	`0T╣KX÷y]▀É.ó^║≡waª╦¼╦OU▒8ªo:KÅòçπX⌡£║≥±X╧ß■£┴î=┼ó¬	√╤íΦ^d┐U\03¼╢┌9N▒Q$îqí╡εN╣ \"rÄ¡╓&4╞ÑDñ│Mô∞gÑ(0╞ª╙Y8^¡╥U¿@½onπ±x╡\"\"(E¬¿ î╥⌠█oo╞?■4^>{╓û╦─ⁿç_▀)@╛┴{?∩▀ÿ┌#¬└⌠5Çδ8Wô╛╞tó╬¡:\n─!jE¥▀q\rΓ╓╢îÇTò_╒■*_üªNµE─╨╫A║╠Θ╜╬x¿R ╩┌┬≡∞δ≡^D.PBèT« ▄6∙r0\0\0╘}≥╤Uªsëzulû)σ£┌≤α\'0qt╘ DτM╩»ÑX∞¥<┌(q¼ºqbµJQ╧ù╠fa╡Jµ█dy*á ëMtu=δÅF╦∙┼E╨├4∙²▐⌠?√Γj▐üó(╥6╒╞)Rp╬qª.I\r╙╓╡£ê¼u╝S¢$╞╬±╓Φ)ïσ▌\'∩j]G▐ª?╫∙]J@╤╣∙║$án╜U▀#Å√π2UÑ$ö▒°<g≥ªæ»8╟╚ªÆ6⌡	ò⌠ò½┘>ƒz¬╞_₧A%≈¥ºtáΓÖ°m«Φ?« àE	\n}êIδΣCH≈∞├ü0╙\r@╤╗¡ºªÖ╬█è₧U\'Üß9µ√(Zkq@=OU▒8V⌠(xlⁿáÑτAΦ╬\'ú¡÷√~┐a∙Å«|╘{º²2r∩²¢ú\\d╩Äa═}┼B║╠╫Γ╬╓wÄMûí█i\"óL▒░í▒.Ñ═uèHimôΘ,¡╓Θ:TáSú7ï╤t«IE*Φ)«╙Σ¢oπW»╞½g╧.é┘<2┐■═w#\0½MCw≤SEü┌5▐╩▀,▄us°Σ~(2å½╩±▌q«9¿⌐π9ú₧rSd ·*>{╒.U√Θï║ä½⌐Q5æTE{≥├\\1^½î÷\"┬ärÆ≈}α░ñÄ╛Ωè∙(#%>╩çyr{ÿ │░rΘ ≥ÇE■╙Æ|g·tÑ£\'∙<₧≡}╨Eú┌≈0≡Q╢εσ╡`D▒Ö$ëY*Eü╓6₧═╓²⌡:Y)EJ)\nΓ╪äWW│■x╝^^^⌠é╒:I>∙²╧╫_~╒_⌠z\n┴¥»EÑVk╦ƒ\nÄBφÆ╘8┬Ä»àu╝Z\'6I+Edì█:x╫±╡╪\'¬─É¿c╕╘∙]Æ@≡█=≈	sz,┬\'√x▌ú0Tbⁿε≈WÖ\ZS╫)╣Φgƒ■óct@∙╙÷σæ∞ª≈σ╙╛\"ƒÄ║╛ y╨∙└≈ë=τâª╟▒╒G─╪âD╡F8äÇN ê║ⁿe6║ÿ\"\0n╗■≤f√æεÆÑæå║∙>¬╩y,σúh«>VVßªRU4Θ█≈E∙8û∩D╙z╗²╟╩╛G>ZR>≥╩i2yá╗(QÖræ:╟f\r╩l|-⌠F▌ ∞(╓▓&9╟6Mmh¼╙Jæ╥⌐M&│p«╙0Φ)ò&&µúΘl╜VèH)ÑzüR½UÆ|²═`⌠µτ┘·┘≤ï`2Yº┐∙φ≈c\0δ*TÑ\\┤ò╫ó╠ ¡┌▒obö╫!ees├Ç=╩⌠5╩|£ù½î*F│||@?\0ç+uⁿq¬∞2c╘≈9∙(e≈Qòg%╞│o▀7U*\\\rÆ_τ8£∩{B₧cç=~H┤+╔rè{ÿL·Y▌ƒ≥┌╩≈q«╩╟1ƒ╞)û≈╛)τε¢qî÷?⌡⌐╢»┼~3óHOÆ╘¼öó₧╓6£╧óδ0LùDñö\"BE:╝╛Ü_Oº╤≥Γ2Φ-ùq⌠╗O^_≤φ═Γ≥2PD@jº╡eRÖ2å⌐M3┼é╢èà1ûWδ╘ªëqJîq@û8÷OX`	çen\Zü⌐Φ│*c╧╟á¿≤=ƒ·è\"U⌡[╤▒»*_j@°¬îSƒ¥·¬╝eφ█ÅZTτ╤▐≈╒GΓÜDò≥m_]b ║:Dú«RS\' ê╧{WF<èê/{╢æk╬ec«êd╢J2äÇ{9╛°σ■╙╦|AÇ└│l\'╧W∙h▓SzjÖ╬ÅÖ∩ú\rσµ)+Uåo╩G¢╛Å⌡Ω╛%▌µ√αM▀(Q∙W▀)░╞Ñ╬▒&ér≈ïL¡ Ç¼c¡╡ë¼eM\nΣ∞;┼\"╙>êêá╥╘─ôi8è\"=$ëëoï╤|¡UÉ)*á`▒êπ»┐▀╛¥ç/₧_╖úe·█┐²aêL╣╪¬╛J─ecó╢╬DQe\0╒═ê╠-]τ█µ*├¬Φ8Fô]τ:╪c(ç∞≡√½);µô_é=√╡ëoJ]ƒ▀÷Um┬╫▀┼╫GärΩ÷Q╕┴8≥UXΩ$ßΣ∩¥½A└}╞êÉ3╪ 4╛\"╨K\0	α├w*Jî_eπòÅs+ )+]µw9weσ	°û╒╕M¬╛²{╛QñGZ█╡R╘KS╬ª╤uÑ+Eñ▓╝ñ┬0]┐};φ╧µ╤Ωâé▐|»?·▌δ■≈▀ùùù=Ω⌡ö\"Ç┤╣≤╡pjú\\¼╫┘╧áw╛F[^¡¢ñåò\"φ╢δ┘/Z`Ç╠£╗P71t\0?▀_Rπc,√åU¡╩ PWü≡1N≥2P╗é▀ó@╘ë,à\n2╘àAφ¬≥}≡m_ò/{N«╒G}¬Ä\nU╡»,Hτ≤Cvƒ|▐ÅªG╣╞<äéwΣÉ·|^δDC╚#\"█uñαÇ╣█â⌠┌ⁿ¿│úê╧╟!σ°öOgP~U┐┌µS(º+ß1|JÄ⌐¼╦╖Σ■τ╒╤ír╚Eè╩öåmXYk\\Γ¢;σB╗╨:gvΩ\"τXkmC╖∙▄:6ijBg┘*E*IM4¢Fú8╓Q¿ èu<Φ/F≤EüRü\"RüR≤y}∙σ⌡Φ║?Å^|x⌠ï°∩■εºÇ≈┬╩ó?φ6ÄσéK&äª┘îßad╒¥t½¼╢C▐6Q Ω(u^ê¬0¡U╧è<\rv_2UE─┌V ╩·▒Nt¿▓à╤7Ö_Y▀59ÄL5ìα║>\neQEΓÉ@╛FWí½│Qß√√╓│£9-⌠░╔╥MÅs┘⌐}_òÅ▓Mò╟*╟g]|_₧≤Ö╜OT@≥εÉR▓≈]vÄ7╩E╕Q.╓╙i╪Å\"╜Vè╘╓▀\"╙σ╒⌡∞z╛ê╫ùùAo6ì╓²ε⌡⌡╦ùú╒│g=┼äaj╡vÖa,»╫⌐M╡aE─ÖbJ╡u½eb╙ìbæj╦¢9±O\Z,v√Q,╢╗ânÅ|ö-Ωuw²=▌$:Tφ╦3÷÷wÖ}ⁿ4èε}?;4ò∞>╕\nâ▀gç▀╫i║¿O╩|ΩF_╩k_┘╬<┌╖▀?ng¼;ö⌡íé∩Æx╧glíb╠BFï«⌐√▐U%═¼ë¬a9d₧p₧d║εⁿ┘d╡i▌Pr[ü┘ÿ\0tα/@█cmd:≈yù¬▐ò╢ì░╟╩t▐f∙ä╙P\Z║,º\rß1òÅ.╟╥aσ+┤ù╫\"τw;ª╪┼é┘n≥Whc\\Φ█;èA[_:▐(ûuÆ)&;╜D%ë	g╙p\'&▐d▐Ä·²┼h╣îú PÖ╗┼lå_~╒n╤ïτù┴█½Yⁿ≈ ±º!2σb╫╧bw0⌐énQ{╫╤ÄbQ7₧╧⌡╛f¬~╬3ö¢µ½@\rπ■É661·|ô6ë:Tñt°>_ƒL╤>╟â¬ε*ƒÄC_╥êûi▐æ╖ó>±╔ΩMΦVü≡q╛nôÇJ8¬₧)8G═;çï.êèÉô├\0╕ß%Ç \n└?)▀δ┬ºπ╤i╪Öù▀F√°─╩æτ|⌠:ε╚Gë»φ]¢).î╥æ1.RèzIbû│it╟:Tè╘╓▀b╜No»g²σ*\r?╕é±$\\²├G»·»^ì╫╧₧]¿ Kk¡¥├╘\ZcY)\"¡¡█·ZHe╝\'╒ûù╦╪ñiv]Ü\Zçw╩E┘±ƒ8╪[_ïC£│╦╬╒√U⌡T9öù)	ym⌐ú@°╢═U∞*°Æe⌡√*u≥╝╧½|¬«╪¥úÆ√╔√₧██ì¬½@áä¼R	±⌐C6┌èNV╘_\"Å▒_Gü└▐╪>4╪B]\n▀¥⌐C?»sm°╢£äÇ╟£ad░╓\0o│÷╢₧╟âÜ╖░p╙áΘ8∩2Å╚■▄F╡╗I▀╢Ñ4tΘ≤╨Uª≤sR>÷jcT(≈¢τkd╩à▌*┤½\\ÿì╢A\0æs.╒┌å¢δöuNº⌐\r┘▒%E*I⌠z:ïFibÆ PAªa┐?«Vi|ºX⌐╔4\\■σ⌡p8Z%/^\\»^M┬°Φ╒@äç╩D^^ï╝▐┐n½\\Tφÿ·*uÄ)>uUe≡nÆü\Z╞UÖí[Ñ@°─≈»┌ß»πôPGü(S╕f?T⌡┐o√è&t▀ⁿu\r∩ªaïQ±\\≥₧[▀▌≥*é─╧	5Ω±uL≈yδ.&M₧y¥║█R\'║\"\'GDäÇìâ ╪⌠w^≡√\ncδ▄o²}n≈√⌡Ω£úiUUδΩ>qq╞┘0╥Cc\\¼⌡Æ╪,f│Φ:IL¿Jæ\"¡╓╔ΓΩzv╡\n╙°≥\"Φì╞δ┼G╜║~≤f\Z>~╦åë5&≤╡HS╦δub╡vN)Γ═,JS├ïe╝ì\"EIrO▒h║░?╚»░πkß├[ü¿\"(>τ╩½2∩┐\0Σa┤WΓu≤°∞≡ôτ≈|ƒ├?╗xí⌐zNu┌╟¿>7Oä∙Éⁿ╛c░¡ΦduìO÷|Fm╬«ñn▀,ßuH\0╡DbΘâ6ê╦ôåÉπ!╪ⁿ▌█b=─τúÄ\rPg}h├ ∩>║╬t▐òbSºoO-O╟1ú^uUn±²τ·ZÉGεï=┼\"ff╖U&îqgÖ╣7\n┴V▒p!3[d╛iÜEï▓┐\rE\0Γ─¼º│hÿª&\räδt▌∩/åß:ìâ₧RAÉy|Å\'δ╒g_^╟ôu·Γ∙e≡├╦ß·πÅ_æ)º[óH▒╪?Rö╫óΘε~₧a╟%åî∩.{╒b▀╘∙╡ëâi¥|M╬ß∩\Za╛╗╦\\π9Uà╡E\rΓS5F¬·é<îM÷ \0>q¥#/yI⌡╩╤!\nDSú╙╫8o½.ƒ∩╒ì⌠VUNU▌ºñ@ï ╝ù$D╚qA\0Φßè}H&⌠6ÜtNσv]╧SW,║îzu╤┤¿¬=⌠╨╟bτsg£	ú⌠╓ZNòó Ä⌡|6ì«╙╘─*╦i\0ä╒*Ö_]╧»ú(M..éαv╕Ü⌠±δδ½δY⌠∞┘Eá2Wñ⌐uδ0╡╓║ìàu½UbîqÄ(c)Dä81n▒ê¼▐(q¼╖╩┼ç¿à$o2q%╟ÑPbΦ9£6ì⌡_σ@▄$ΘÖ∩NA▌φ╝δ¥╤¿R:|Wq?\\╨g╛;&Ey7≥┌τ½─PE ⁿê*à	┐½¢Θ┌g▓=ª┴╘S╒gu}\ZΩ▄│Å┐╔▒εΦ┌╟0d₧,9röíE└└-Çê\nτƒ&Ö╨}î┤c√fK∙Φ*▀╟íφ>╒ΦY]G╜¬.╖:»UÉr┌s╜╕∩ka¡ìq13,j≈Zfdèåuí╤6╥┌┼[▀îmt¿8╓╦┘,\ZjcuáT░Z%╦~>èB¥=EAáh4^/? Γz8¥EΘ≤g╜o┐╜Y²ε≈on$╚ö╬▌╞½C╝,»┼÷sòπk╤Σl╜ÅßUF╕ayuî\nC▓╩▌╟╟åQ▌É╕╛Jço╢g_E└y╝£eGï|ê:¿½|Aè╛*\"r┌ª\"≡TêªJBS#╕M∞cα∩φ1(! OƒÇ\0o°üÇ╢¿⌐╠░∞┌7Σ▄|\0║n ⌐·¬╝\'Q»¿Σ=(╦ë- p6è═φzòï°Fk¢dj┼û╫Ébf╡╙┘αf~²≥╟Q ôO▐▐▐▄«Γ╧/▓îy\0Æ╘╕⌡·N▒@Æ╖\\&╓╦üRL*+1Ä╡¢/b│ì\"àÜ\\\"╦⌡πs⌠╚\'Bô-I¬╖o0æ*1ïMπ░Φ≈>\nä»»à╦╣?x⌠a╒Q\'* \\ub∞√*är%┼╟╝∞ÖES\"Åz¬▀τUòH░,:Y]gµªä├ç┴≤¥8─α\'╧∩Jz¢\0ê!r\"äÖ(às\0≤p÷+R>┌╩t▐e╛î▓≈╖½¼╤]σ√hR^╒ªπ)E╧j▐gòïóΦPσbW▒0╓┼╚┬░Æs.1╞E╠░DtºX╦⌐16d░#\"▓vπ{ß╪\"ô.É)ïE<O┬±φ═rÆ─&Θ⌡öm∙GVµd▓^}∙u°½_7·ε╗╤Öb▒»P²╝oαφg∩VDw╡╩î▓}π░n╬â2R÷P╩v▓}H┬╫ê*█ß╧≤m≡igâoΩküé÷°:Σ√⌠ù⌐┌:Tü≡5░δ(qMo╘╕_ΓS╬íaPÅ¡@t⌡}Q B@╬Üâ0\0.Ösj}ô∙öòÅºT~φ;%┼é║╣╟:Ä▐9èà╡6ì\"=╪äú\rΓXO≤°zú\\⌠öR\n ,±Σ║?╗N╡╤A╨,\'}⌠·Ωv╕J^<┐êê@Ü\Z^»S│^ºv╜N¼5╠*ámè╗î6!Ä╡¥/\";¢E∩ï]├╠\'ƒC▐N1π╛»÷╚I▒(┌ßτ\néR╟Éj▓├_╒╛╝≥£çA₧º┌4U |öΣµe╛Eæ₧|█τCä¬ ò%5≤ì■σCPΩêçÉÇ&Fi¢\näÅGô{≡═|~j╞∙)²tΓφ9[8&Ü≤@╠¢≈ì\n▀A▀u┤Θ;▐ò≥qε∙>U>S▒╪Å▐╔ú]ô<<╝n?Jö╡.╩óE┴Γíb└╬qjîì▒æ6YT⌐ìºàâúX╧τ≤xd¡3* ╡\\$ï┴`1L¥÷zü\néîÇ▄▄,τƒ}±v╕Z\'µ┘│⌡ç?^->²⌠zêw╩┼~nàⁿΦP╗╞jÇçèE₧▒YE═₧δδ╪ZfÉ⌡╧╟╫⌡à≡1½┤UÖ▄░}╛æu╩╚y\\Su∞╠\'║SUT.▀e /rzo#▓╨1╔Gô≈½.!iK¡ßÄε å╕∙! Ot±/Çº ·/$▀╟Sl≈ÖD╧\"?┬±≡╫┘Zφδ(╓7δU╥_.ô[c\\║⌡╡@f╤≡j¥L7ïδ~⌡ ç╖╖ôIÿ╝xq(òÑ▀LΓ╠╫┬1│\"Γ(╓n╣î¡╡╬)ÑáT╓ÿ0Lφl│ë\"╡Z%└xº\\ö▒╣\"┼b√;│ù╧óJü╪═r▄$τA╒ó_Gü≡═)P╡├Qµ╠∞╙╛*√Éä>α█╟±<Å╚εÄ¡c*╟⌠h├╣╗I|°&╫╒╔÷▌f╜╟╝÷1@!\'! τ\n╓ fK@╢»≤\Z ²╨ßû=τà║■çûπ[εS╔≈A5╩:5┼BφÿH┌─bδ`G`fæ│.╢û#fvY«èL░ûk]╚\0@╓║Xg>n)V1qbµïe<£î├ß≡v5MSú{╜@mM1É└├╤j∙┘╫╖ ▀┐²z⌠·╒t@∩uè╩Θ─ó(F╗èå┬Cσó⌐┴QWü╪┐«εÖ▀vT╒[σP^7╓╛k╪╛2g∩╝6V%å+¬╗êÇT%D≥5╪½╚G╙╘uëXß_╤ΓwÄAbè[ó-Zü@╚ôΦoU╝╤v╘½c(-Æ∩πqn;Åÿ╨Ä)ƒì\'δ8èó┤╧GEz╕X$}k¥VèzÖs6≤bæonù╫╓:½Ñ««fúÅ?■∙z:ì╥/.z\0âæ&╓«├T»Vë].τ¼c¿═└σM4[≡:╘n:φdZdè┼e├<∩╚ô┼╗ΦPM@¥cDU\0¿ù╨»ó¼*1Γδ\0τ┴Φ}IUì▓~¡╩?RE└■╟¥┌$\0╛åµí╟¥KüΦ╩╕n3─ε⌐\Z m+!5! é;σπε\0à;smY ┐îΦÅò∩π▒3¥ƒB╛Åⁿτôφ┬≤²ΦPe╦┴=⌡δ¥¥H\n╬£\'£πÿ7û│[δ\" ╦╠╜²Æu.╢åú,╗æ5.6╞Eî¡bAèÖ9î⌠l▒êçÄ┘)E┤ÿ╟│¢█σPº╓⌠zJ=Ñÿßâ┼⌠│/·├$1÷Γ\"P≈≈?╬╛·ΩfêL╣╚╦cQΣk▒²y╫â6èEÖaQf▄9├┤∞τ.| ⌡v≥╦~_Gü≡1╪╔π·:ñ«╤╘á¡╩┤▐f╓in°¥c+>╟ï|B∙R├╢Æ[≥?B>B@à╗%¬(▌╫╙U▓┼\ZÅÇr┬Cm■k-GQl·Ö╣NGΘφr≈¥cúêR0│¢/Γß══¬∩6H²ⁿfv√±╟»ïEó_╝╕PDD╠LQñφj¥X0ÿqªn▒HîsÄâ@±╞╫éW½─L&í╡Äíêh6Å,Çg╚╘ï¡æ∞ô%1/\"Æc╛≈{▀0¡U╣-ΩFçjCü¿πl]&╖«Q≈hU▌─äç(╛Y┌δ·2╘Q Ωd╝«¬│\râ╗Ω}ß╦⌡»çºmí:ucY| ! O╢╚2óº\0.7τ∩K,╓╟V>|ì∩SU>p╧VbªM.Éwyè┼╢\\\"E\0â│sm»╢Äcg\\╠Ö±H¢î╓pÄúL╤╚╩▒Äckl\"â├(¥,û╔&\"╠╤dx│kM»¿@ærÄ∙Ωz1∙∞ï■╨Xv╜₧ó_²ç∩º▀}w;BûgFφ5Zφuó╩1≡w3qw╩msÇ4	 ÜGΩf┴n}ëj╢═W⌐cöU%gkôÇÜ▀±Q Ω÷K╤ïUW╜h╥∩╘óß]╟╣▐GühcrlJ Ü8╦╦\0#_ \"8┬TkA╕ß\0 %Ç│eε\\öÅs╬t~Hò╗J┼^o£╛¡sδ8╤âm\'Eí╛Y-╙üsl3σ3▄b\råúUƒALP⌠µφ⌠µwƒ╝╣^»S√ⁿ∙àZç⌐[¡+E╝Z%n▒ê,;vAO1ü╙bÖÿ╔$4ÄèôiΦÉ)√╔≥╢lòºⁿ╛▒ö%╠|G>≥z╚ùXPàQσP/ùà≤`¿M	└>1ij╝61░╦ê&╞uæ∩E[m,zQ▄üåfS┬\' H¥659┬╫ªq▌╡╡(ü@╚{┴?êÇÿÇ .\"\rÆΘ|≈≈█hGD╛µ;hg▀╧lQv∞£π°╬rq9╟±╞α╛3▐¥█·`@k\\d¼ï±╬╫\"`fFz┤\\\'ú¡⌐╕ÿ┼πßp=▓╞┘  J9fw}=■σ⌡╨9░R²  ε¢±?oæ9W╕»B∞·R∞e√Qñ6╤í¢ñσy\n┴∩¿M¥ΦK>╟^¬ÅδFEΩÆÇöeá.3ó|ù╥\0\0IDAT P Æ6╧SR |&\'«A▄Üµx,\'∞n╖┼ü@╚ôe}Nx\rδ\\2¥úï┌°╩╛½═╬⌐+&Xk╫qj█_\'▒Θçδt`-;\"⌠6─┬╬q4Z@─D└δƒgâO>y3ê\"mƒ?┐TJ13»╫⌐[«╗-o╜N═rÖhgö\"übx>Å∞x╝╬≥Oa4Z[\0╧≈\Zƒτô@╟╠=╦░|╫\0U╩àoΩ║╗αy┴▀╫ó,£»!z╚ε╛/ë¬┤Lü ╘OBX6·δºª╧╪ç¼┤Ñ@°╓WFf┌$pO╔°ºû┌$╤ùüÉô5¡ÖÇÇ!Ç┐\0ß∙v@╙u√42¥≤╓\n&\" ╡»8¼∞«≥qº\\lû╗w╩xs1â7ƒG█B¼═|/6∙,\\δßz¥î╢%/µ±h<\nG╓:*)δ╪╜╜Ü┐°▓?▄å╢²■▀/F»_MG└âα\n∙╤ó÷\r╧╝ⁿ√╩┼í\n┴?oD¥0▓Mî╙║å`]ó-Rvom░M█╟₧/~Rª▓°d?ä4╘U ¿A▀╖aTï±■▌ç@ ≥$a└╕ß%@	αƒ£}:BQ{	¼s«│╓.Smo╢FLΘ~╕╓ff\"\nê(pÄφr_ìº╤\0r╠x≤≤⌠·ƒ^╥╘║>╘z¥┌╒:5è─╦Ebτ≤╪∞é@A)τf≤XÅ╞k│m╓αf╣U,Ω$+R ╢╛v∩╪Tò±[gg█╫Ém├∙╣è0σΓ>*L]Ég∞6Q |·εÉ╚Km)«%B╪±¬Ω3>≡√U²wN╞▓(ü@êáπò&≤eê\0Z╨╝▌ß?╪τú▓P¼\\É∙t √∞╪:╟╔¥ÑΣ8▄±╜ êù)ê▀\r┘MT⌐¥╝6î⌠mªπMⁿ0^╠πßdÄ¼eVü\nz)k┘╝╣Ü\r┐ⁿj0ê£c■┐■∩?»«C√Zl?█?*┤»d(\0ñ┴9÷5Ω≥ê║▓¢\ZºMi½Hò±\\µÅ+mFjCü¿j[S╥å╤╘ùüp\\ú╜kΓ1rT£\Zä|! éR(═ê~Rö⌐╖┘Q.ÿa-/Smoæ%`┤q¼»ΓX▀▄)á₧uN/╔⌡d\rE─≈Ω⌡⌠·Åƒ^▀hm▌≤τJQF$û½─«╓ë▌f▄^,│X─å│RDAO1;≡h╝6├╤╩êÿ├ßZπ╛»EYJQï╠9╜¬π¬B╦V√Ç+Ω⌐CP÷ê║╤ù≥Äxσ⌐?Uφ;$T.y÷í╧\0≈Ua╨!¼≤=>≡■┌■^U █Pµv\'71Σü@╚╙qF<é¡ÖN~V}┴J╣╔kq\'Ñ&≈₧r┴░╠oJev2s╝I╢Ωü╦\r─┘╧╠╓f>DPÄ┘Fæ╣\r#=&!C{3¥Fc0╗ PJ)Ωiφ╠¢╖≤¢»╛╜⌡zYπ▄ ■~t;«╟#\\ß╛#vQ^ï]Bmê─«∩à┌(]+m%í¿}U╩E╙▄╚!uô▐∙\ZùU¬R╙z¿!±hó$°]δ╥╪B B@▐W≡;πâ╨I╕*jº¼πÖ▒ε@└6M╠¢$╤╖¢¥ ▐╞╫\"]«Æ╖≤yrKä└Z╢»₧╛²ⁿ≤■¡╡Ä{*X¡R│^ºF)3x>Å╠b[\"r╜,»π0₧¼⌡p┤6è▓úM│Ylp▀╫éJR╩1∞vwΘ╖╞╝▌┤┐(3½Ä╤]_û▌9Oü(R¬x¿╢¥«⌐é¼∙DmjΩñ]≈u<ötÑ@tí<ta°ƒéA▄ù@ äÇ<┴±&\n╤«▄░╜\0àL√σp≈▒sälº▀XêvèP╠p\0»Ö╖è┼V┴╕≤╤ \0=τX╟⌐$ë3#pÄφjæ▄╠τ╤╪:\"\nEü1N ⁿf~≤╒╖├q/PAÆ≈┐■o7ÿ╧ú╤ª╝]_ï]eb▀╫\"Åöm▐#\ruw─¢ε≥╫U ¬Ç*╟≡*╠≈╘í░»óB5┌WùÇ┤m⌠·(G]\Z█]╒⌡¬╚ëεδü@êáÇü└≡ûü\0,[:╪qc\0╬₧⌐π²ì)0≤às£hc_icn@Xπ∞φφ·τ∩╛▌\ZφÉç▓A£Lgæ¥/╟Ä╔Gπ±┌Lºæcµm^hm╤,═αfΘδ░^\'\Z└ç₧å(òäÖb╤╘±≈ÿ\nä»íΣ{╝⌐═3√╛Q¢¬£╟üΩåu█x,P╖╬SW ╕ò┘Hzü@ y/âôC ╕[Θëû\0ÿ-Ç5ß.\Z╘╓┐┴Xü8h½p¼É)=d─f╚@╠å▐▓π!\0lTî₧1V/W±╒φh1\"Ñéσ*u π┐°?≤i║▄k⌐┌îì`╟\0▀:╬∩s┌¬wñéè2ºqçµ\nD1á\Zee╚n[ü8äÇ╘Θ¬±╜2Vfÿ╫M░╫╡í▄FYºª@╚1#ü@ î\0└%Ç¢Oµ\0^m₧E\nαG\07╚£┐╩>Å°æÇÇw«ú┴¥╤hî╤û┤╢ê\"ú├ujujíì#c¡╫)┐ⁿqd> ¬∩£cÜNcä+c<█!\Z\n≈C╘ε~₧τ╗▓k9dë\0▌6ñ»\'αC\rC¥ΦP╛∙Ü\Zû])8áì╟0£╗$ä╟M.whmI!%ü@ \"¿4\\\"\0oⁿjC4~fαzK@xµ]è\0@┬[F┘╧¼ΘΓ_╜m┴\0R\0é^O⌡ê@Z╗}├╞\'RU╨Ta\0Γƒαs²■=P═≥╩r2b8¥«ê:+W┤╡kC²╘êS¥Kü@ \"¿ä0≡{\0/æEyJΦC9▌\\╖╡■Ö▓á╢√K9a¡│╕∩δ░\rτ≤( >∙ÜÆ\n« \Z╛D⌐ê\0░A8╘<$o─!╫71Ωδd²>ªß▄à!╟óü@ 8H║á{░■7Yg_ⁿ╦û╦²╫\0¿¬\\*∙ùrê╔EG«Ωî¥Cê║╟}¿┬└»≥944j╒wÄ¡@tAΦuü@ xΓΣ(ñ+¬Gu.╪%>*è+¿ÇJ╩.#uⁿ9ÜΣ¥¿R┌⌠δh≥╜╟V ╕ß\0π·┬gαr├∩\nÖüα╠ \n╚╙╛\\@h∩║²#X(! ╘Ç╘ë^U╫8%Å≥Ω]c~─µn87êæ/ü@êαáτKñéJ«═3╘δ¬Åí@┤M\0CüΦ▄p₧r\"üáΘé≈₧ÉT%$½√∩~e!w}î┘S\" ç╓!\nä@ 1HÑΣyúⁿ╚U╙1╙ªq■X╤ùDüü@ \"ΦhP╦πª-╥ª╙▒(ü@ B@\'°▄╗Mî c\Z■u!%ü@ B@\'>&╕a²b∞ü@ ê▒)É±╨99▀ü@ ü@ ü@ ╟â(gü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ ü@ x?≡ƒ\0\\ì\'\'╛^&≥\0\0\0\0IEND«B`é');
/*!40000 ALTER TABLE `core_physical_file` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_portal_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_portal_component` (
  `id_portal_component` int NOT NULL DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portal_component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_portal_component` WRITE;
/*!40000 ALTER TABLE `core_portal_component` DISABLE KEYS */;
INSERT INTO `core_portal_component` VALUES (0,'Porlet'),(1,'Article'),(2,'Article List Portlet'),(3,'Menu Init'),(4,'Main Menu'),(5,'Breadcrum'),(6,'Site Map'),(7,'Tree View'),(8,'Site Map (Admin mode)');
/*!40000 ALTER TABLE `core_portal_component` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `core_portlet` WRITE;
/*!40000 ALTER TABLE `core_portlet` DISABLE KEYS */;
INSERT INTO `core_portlet` VALUES (6,'HTML_UNTRANSFORMED_PORTLET',1,'Intro','2022-03-08 16:40:37',0,1,1,0,0,'2022-02-17 09:36:30',0,'none',4369),(4,'HTML_UNTRANSFORMED_PORTLET',1,'Available Packs','2022-03-08 16:14:30',0,2,1,0,0,'2019-05-31 11:55:16',1,'none',4369),(5,'HTML_UNTRANSFORMED_PORTLET',1,'Other news','2022-03-08 17:27:41',0,3,1,0,0,'2019-05-31 15:01:47',1,'none',4369);
/*!40000 ALTER TABLE `core_portlet` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_portlet_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_portlet_alias` (
  `id_portlet` int NOT NULL DEFAULT '0',
  `id_alias` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_portlet`,`id_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_portlet_alias` WRITE;
/*!40000 ALTER TABLE `core_portlet_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_portlet_alias` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_portlet_type` WRITE;
/*!40000 ALTER TABLE `core_portlet_type` DISABLE KEYS */;
INSERT INTO `core_portlet_type` VALUES ('ALIAS_PORTLET','portal.site.portletAlias.name','plugins/alias/CreatePortletAlias.jsp','plugins/alias/ModifyPortletAlias.jsp','fr.paris.lutece.portal.business.portlet.AliasPortletHome','alias','plugins/alias/DoCreatePortletAlias.jsp','/admin/portlet/script_create_portlet.html','/admin/portlet/alias/create_portlet_alias.html','','plugins/alias/DoModifyPortletAlias.jsp','/admin/portlet/script_modify_portlet.html','/admin/portlet/alias/modify_portlet_alias.html',''),('APPOINTMENT_FORM_LIST_PORTLET','appointment.portlet.appointmentFormListPortlet.name','plugins/appointment/CreatePortletAppointmentFormList.jsp','plugins/appointment/ModifyPortletAppointmentFormList.jsp','fr.paris.lutece.plugins.appointment.business.portlet.AppointmentFormListPortletHome','appointment','plugins/appointment/DoCreatePortletAppointmentFormList.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/appointment/portlet/create_portletappointmentformlist.html','','plugins/appointment/DoModifyPortletAppointmentFormList.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/appointment/portlet/modify_portletappointmentformlist.html',''),('APPOINTMENT_FORM_PORTLET','appointment.appointmentForm.name','plugins/appointment/CreatePortletAppointmentForm.jsp','plugins/appointment/ModifyPortletAppointmentForm.jsp','fr.paris.lutece.plugins.appointment.business.portlet.AppointmentFormPortletHome','appointment','plugins/appointment/DoCreatePortletAppointmentForm.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/appointment/portlet/create_portletappointmentform.html','','plugins/appointment/DoModifyPortletAppointmentForm.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/appointment/portlet/modify_portletappointmentform.html',''),('APPOINTMENT_PORTLET','appointment.portlet.appointmentAppointmentPortlet.name','plugins/appointment/CreatePortletAppointment.jsp','plugins/appointment/ModifyPortletAppointment.jsp','fr.paris.lutece.plugins.appointment.business.portlet.AppointmentPortletHome','appointment','plugins/appointment/DoCreatePortletAppointment.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/appointment/portlet/create_portletappointment.html','','plugins/appointment/DoModifyPortletAppointment.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/appointment/portlet/modify_portletappointment.html',''),('HTML_PORTLET','html.portlet.name','plugins/html/CreatePortletHtml.jsp','plugins/html/ModifyPortletHtml.jsp','fr.paris.lutece.plugins.html.business.portlet.HtmlPortletHome','html','plugins/html/DoCreatePortletHtml.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/html/portlet_html.html','','plugins/html/DoModifyPortletHtml.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/html/portlet_html.html',''),('HTML_UNTRANSFORMED_PORTLET','html.portlet.untransformed.name','plugins/html/CreatePortletHtml.jsp','plugins/html/ModifyPortletHtml.jsp','fr.paris.lutece.plugins.html.business.portlet.UntransformedHtmlPortletHome','html','plugins/html/DoCreatePortletHtml.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/html/portlet_html.html','','plugins/html/DoModifyPortletHtml.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/html/portlet_html.html',''),('MYDASHBOARD_PORTLET','mydashboard.portlet.myDashboardPortlet.name','plugins/mydashboard/GetCreateMyDashboardPortlet.jsp','plugins/mydashboard/GetModifyMyDashboardPortlet.jsp','fr.paris.lutece.plugins.mydashboard.business.portlet.MyDashboardPortletHome','mydashboard','plugins/mydashboard/DoCreateMyDashboardPortlet.jsp','/admin/portlet/script_create_portlet.html','/admin/plugins/mydashboard/portlet/create_portlet_mydashboard.html','','plugins/mydashboard/DoModifyMyDashboardPortlet.jsp','/admin/portlet/script_modify_portlet.html','/admin/plugins/mydashboard/portlet/modify_portlet_mydashboard.html',''),('MYLUTECE_PORTLET','mylutece.portlet.name','plugins/mylutece/CreatePortletMyLutece.jsp','plugins/mylutece/ModifyPortletMyLutece.jsp','fr.paris.lutece.plugins.mylutece.business.portlet.MyLutecePortletHome','mylutece','plugins/mylutece/DoCreatePortletMyLutece.jsp','/admin/portlet/script_create_portlet.html','','','plugins/mylutece/DoModifyPortletMyLutece.jsp','/admin/portlet/script_modify_portlet.html','','');
/*!40000 ALTER TABLE `core_portlet_type` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_role` (
  `role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `workgroup_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_role` WRITE;
/*!40000 ALTER TABLE `core_role` DISABLE KEYS */;
INSERT INTO `core_role` VALUES ('front_role','Accessible uniquement aux parisiens','all'),('restricted','Accessible ├á tous (parisiens et non-parisiens)','all');
/*!40000 ALTER TABLE `core_role` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_search_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_search_parameter` (
  `parameter_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parameter_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`parameter_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_search_parameter` WRITE;
/*!40000 ALTER TABLE `core_search_parameter` DISABLE KEYS */;
INSERT INTO `core_search_parameter` VALUES ('date_filter','0'),('default_operator','OR'),('help_message','Message d aide pour la recherche'),('tag_filter','0'),('taglist',NULL),('type_filter','none');
/*!40000 ALTER TABLE `core_search_parameter` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_style` WRITE;
/*!40000 ALTER TABLE `core_style` DISABLE KEYS */;
INSERT INTO `core_style` VALUES (3,'Menu Init','',3),(4,'Main Menu','',4),(5,'Breadcrum','',5),(6,'Site Map','',6),(7,'Tree View','',7),(8,'Site Map (Admin mode)',NULL,8),(100,'D├⌐faut','HTML_PORTLET',0),(101,'Fond color├⌐','HTML_PORTLET',0),(200,'D├⌐faut','MYLUTECE_PORTLET',0);
/*!40000 ALTER TABLE `core_style` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_style_mode_stylesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_style_mode_stylesheet` (
  `id_style` int NOT NULL DEFAULT '0',
  `id_mode` int NOT NULL DEFAULT '0',
  `id_stylesheet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_style`,`id_mode`,`id_stylesheet`),
  KEY `index_style_mode_stylesheet` (`id_stylesheet`,`id_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_style_mode_stylesheet` WRITE;
/*!40000 ALTER TABLE `core_style_mode_stylesheet` DISABLE KEYS */;
INSERT INTO `core_style_mode_stylesheet` VALUES (100,0,10),(3,0,211),(4,0,213),(5,0,215),(6,0,217),(7,0,253),(8,1,279),(101,0,285),(200,0,310);
/*!40000 ALTER TABLE `core_style_mode_stylesheet` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_stylesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_stylesheet` (
  `id_stylesheet` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `source` mediumblob,
  PRIMARY KEY (`id_stylesheet`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_stylesheet` WRITE;
/*!40000 ALTER TABLE `core_stylesheet` DISABLE KEYS */;
INSERT INTO `core_stylesheet` VALUES (10,'Rubrique HTML - D├⌐faut','portlet_html.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:output method=\"html\" indent=\"yes\"/>\r\n\r\n<xsl:template match=\"portlet\">\r\n<xsl:variable name=\"device_class\">\r\n<xsl:choose>\r\n	<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n	<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n	<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n	<xsl:otherwise></xsl:otherwise>\r\n</xsl:choose>\r\n</xsl:variable>\r\n\r\n	<div class=\"portlet {$device_class}\">\r\n	<xsl:choose>\r\n	<xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n	<h3><xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" /></h3>\r\n	<xsl:apply-templates select=\"html-portlet\" />\r\n	</xsl:when>\r\n	<xsl:otherwise>\r\n	<xsl:apply-templates select=\"html-portlet\" />\r\n	</xsl:otherwise>\r\n</xsl:choose>\r\n</div>\r\n</xsl:template>\r\n	\r\n<xsl:template match=\"html-portlet\">\r\n	<xsl:apply-templates select=\"html-portlet-content\" />\r\n</xsl:template>\r\n	\r\n<xsl:template match=\"html-portlet-content\">\r\n	<xsl:value-of disable-output-escaping=\"yes\" select=\".\" />\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n\r\n\r\n\r\n\r\n'),(211,'Menu Init','menu_init.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"menu-list\">\r\n<br /><br />\r\n	<div id=\"menu-init\">\r\n		<div id=\"menu-init-content\">\r\n            <ul id=\"menu-verti\">\r\n                <xsl:apply-templates select=\"menu\" />\r\n            </ul>\r\n        </div>\r\n     </div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"menu\">\r\n    <xsl:variable name=\"index\">\r\n    	<xsl:number level=\"single\" value=\"position()\" />\r\n    </xsl:variable>\r\n\r\n    <xsl:if test=\"$index &gt; 7\">\r\n        <li class=\"first-verti\">\r\n        	<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n          		<xsl:value-of select=\"page-name\" />\r\n	        </a>\r\n    	    <xsl:apply-templates select=\"sublevel-menu-list\" />\r\n        </li>\r\n   </xsl:if>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu-list\" >\r\n	<ul>\r\n    	<li class=\"last-verti\">\r\n		 	<xsl:apply-templates select=\"sublevel-menu\" />\r\n 	    </li>\r\n    </ul>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu\">\r\n   <xsl:variable name=\"index_sous_menu\">\r\n         <xsl:number level=\"single\" value=\"position()\" />\r\n   </xsl:variable>\r\n\r\n   <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n		<span><xsl:value-of select=\"page-name\" /></span>\r\n   </a>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),(213,'Main Menu','menu_main.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\"\r\n	xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n	<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n	<xsl:template match=\"menu-list\">\r\n		<xsl:apply-templates select=\"menu\" />\r\n	</xsl:template>\r\n\r\n	<xsl:template match=\"menu\">\r\n		<li>\r\n			<a href=\"{$site-path}?page_id={page-id}\" class=\"first-level\" target=\"_top\">\r\n					<xsl:value-of select=\"page-name\" />\r\n			</a>\r\n		</li>\r\n	</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n\r\n'),(215,'Breadcrum','page_path.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n\r\n<xsl:template match=\"page\">\r\n		<xsl:if test=\"position()!=last()-1\">\r\n			<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\"><xsl:value-of select=\"page-name\" /></a> >\r\n		</xsl:if>\r\n		<xsl:if test=\"position()=last()-1\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page_link\">\r\n		<xsl:if test=\"position()!=last()-1\">\r\n			<a href=\"{$site-path}?{page-url}\" target=\"_top\"><xsl:value-of select=\"page-name\" /></a> >\r\n		</xsl:if>\r\n		<xsl:if test=\"position()=last()-1\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n</xsl:stylesheet>'),(217,'Site Map','site_map.xsl',_binary '<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n\r\n<xsl:template match=\"page[page-level=0]\">\r\n	<div class=\"span-15 prepend-1 append-1 append-bottom\">\r\n		<div class=\"portlet -lutece-border-radius\">\r\n			<xsl:apply-templates select=\"child-pages-list\" />\r\n		</div>\r\n	</div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page[page-level=1]\" >\r\n<ul class=\"site-map-level-one\">\r\n	<li>\r\n		<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</a>\r\n		<xsl:apply-templates select=\"page-description\" />\r\n		<xsl:apply-templates select=\"page-image\" />\r\n		<xsl:apply-templates select=\"child-pages-list\" />\r\n	    <xsl:text disable-output-escaping=\"yes\">\r\n		    <![CDATA[<div class=\"clear\">&#160;</div>]]>\r\n	    </xsl:text>\r\n	</li>\r\n</ul>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page[page-level=2]\" >\r\n<ul class=\"site-map-level-two\">\r\n	<li>\r\n		<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</a>\r\n		<xsl:apply-templates select=\"page-description\" />\r\n		<xsl:apply-templates select=\"child-pages-list\" />\r\n	</li>\r\n</ul>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page[page-level>2]\" >\r\n<ul class=\"site-map-level-highest\">\r\n	<li>\r\n		<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n			<xsl:value-of select=\"page-name\" />\r\n		</a>\r\n		<xsl:apply-templates select=\"page-description\" />\r\n		<xsl:apply-templates select=\"child-pages-list\" />\r\n	</li>\r\n</ul>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page-description\">\r\n	<br /><xsl:value-of select=\".\" />\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"child-pages-list[page-level=0]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"child-pages-list[page-level=1]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"child-pages-list[page-level=2]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"child-pages-list[page-level>2]\">\r\n	<xsl:if test=\"count(page)>0\" >\r\n		<xsl:apply-templates select=\"page\" />\r\n    </xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"page-image\">\r\n	<div class=\"level-one-image\">\r\n    	<div class=\"polaroid\">\r\n		<img  border=\"0\" width=\"80\" height=\"80\" src=\"images/local/data/pages/{.}\" alt=\"\" />\r\n         </div>\r\n	</div >\r\n</xsl:template>\r\n\r\n\r\n</xsl:stylesheet>\r\n'),(253,'Child Pages - Tree View','menu_tree.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n\r\n<xsl:template match=\"menu-list\">\r\n	<xsl:variable name=\"menu-list\" select=\"menu\" />\r\n\r\n	<script type=\"text/javascript\">\r\n		$(document).ready(function(){\r\n			$(\"#tree\").treeview({\r\n				animated: \"fast\",\r\n				collapsed: false,\r\n				unique: true,\r\n				persist: \"cookie\"\r\n			});\r\n		\r\n		});\r\n	</script>    \r\n	\r\n	<!-- Menu Tree -->      \r\n	<xsl:if test=\"not(string(menu)=\'\')\">\r\n	    <xsl:text disable-output-escaping=\"yes\">		    \r\n            <div class=\"tree4\">		\r\n			<h2>&#160;</h2>\r\n			<ul id=\"tree\" class=\"tree4\">\r\n                <xsl:apply-templates select=\"menu\" />        \r\n			</ul>	\r\n			</div>\r\n		 	 <br />\r\n		</xsl:text> \r\n	</xsl:if>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"menu\">\r\n    <xsl:variable name=\"index\">\r\n    	<xsl:number level=\"single\" value=\"position()\" />\r\n    </xsl:variable>\r\n		<li>\r\n    <!--<xsl:if test=\"$index &lt; 7\">-->        \r\n          <a href=\"{$site-path}?page_id={page-id}\" target=\"_top\" >\r\n               <xsl:value-of select=\"page-name\" />\r\n           </a>	   \r\n		   <br />\r\n		   <xsl:value-of select=\"page-description\" />\r\n		   <!--<xsl:value-of select=\"page-description\" /><br />-->		   			\r\n			<xsl:apply-templates select=\"sublevel-menu-list\" /> \r\n			\r\n		</li> 	\r\n    <!--</xsl:if>-->\r\n		\r\n</xsl:template>\r\n\r\n<xsl:template match=\"sublevel-menu-list\" > \r\n	\r\n	<xsl:apply-templates select=\"sublevel-menu\" /> 	    	\r\n\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"sublevel-menu\">\r\n   <xsl:variable name=\"index_sous_menu\">\r\n         <xsl:number level=\"single\" value=\"position()\" />\r\n   </xsl:variable>\r\n		 <ul >\r\n			<li>\r\n<!--	<span> -->\r\n				<a href=\"{$site-path}?page_id={page-id}\" target=\"_top\">\r\n					<xsl:value-of select=\"page-name\" />\r\n				</a>\r\n			</li>			\r\n		</ul>\r\n	<!--</span>	-->\r\n		\r\n   \r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n'),(279,'Site Map (Admin mode)','admin_site_map_admin.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n<xsl:param name=\"site-path\" select=\"site-path\" />\r\n<xsl:variable name=\"current-page-id\" select=\"current-page-id\" />\r\n\r\n<xsl:template match=\"page[page-level=0]\"> \r\n	<div id=\"tree\" class=\"jstree-default\">\r\n		<a href=\"{$site-path}?page_id={page-id}\" title=\"{page-description}\" >\r\n			<xsl:value-of select=\"page-name\" />\r\n			<xsl:if test=\"not(string(page-role)=\'none\')\"> \r\n				<strong><xsl:text disable-output-escaping=\"yes\">- #i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text>\r\n				<xsl:value-of select=\"page-role\" /></strong>\r\n			</xsl:if>            \r\n		</a>\r\n		<ul>\r\n			<xsl:apply-templates select=\"child-pages-list\" />\r\n		</ul>\r\n	</div>\r\n</xsl:template>\r\n    \r\n<xsl:template match=\"page[page-level>0]\" >\r\n	<xsl:variable name=\"index\" select=\"page-id\" />\r\n	<xsl:variable name=\"description\" select=\"page-description\" />\r\n	\r\n	<li id=\"node-{$index}\">\r\n		<a href=\"{$site-path}?page_id={page-id}\" title=\"{$description}\">\r\n		<xsl:value-of select=\"page-name\" />\r\n			<xsl:if test=\"not(string(page-role)=\'none\')\">\r\n				<strong>\r\n				  <xsl:text disable-output-escaping=\"yes\">#i18n{portal.site.admin_page.tabAdminMapRoleReserved}</xsl:text><xsl:value-of select=\"page-role\" />\r\n				</strong>\r\n			</xsl:if>\r\n		</a>\r\n		<xsl:choose>\r\n			<xsl:when test=\"count(child-pages-list/*)>0\">\r\n				<ul>\r\n				   <xsl:apply-templates select=\"child-pages-list\" />\r\n				</ul>\r\n			</xsl:when>\r\n		   <xsl:otherwise>\r\n				<xsl:apply-templates select=\"child-pages-list\" />\r\n		   </xsl:otherwise>\r\n		</xsl:choose>\r\n	</li>\r\n</xsl:template>\r\n    \r\n<xsl:template match=\"child-pages-list\">\r\n	<xsl:apply-templates select=\"page\" />\r\n</xsl:template>\r\n    \r\n</xsl:stylesheet>\r\n'),(285,'Rubrique HTML - Fond color├⌐','portlet_html_background.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:output method=\"html\" indent=\"yes\"/>\r\n\r\n<xsl:template match=\"portlet\">\r\n\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n		<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n	\r\n	<div class=\"portlet {$device_class}\">\r\n		<div class=\"well\">\r\n		<xsl:choose>\r\n			<xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n				<h2>\r\n					<xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" />\r\n				</h2>\r\n				<div class=\"portlet-background-content -lutece-border-radius-bottom\">\r\n					<xsl:apply-templates select=\"html-portlet\" />\r\n				</div>\r\n			</xsl:when>\r\n			<xsl:otherwise>\r\n				<div class=\"portlet-background-content -lutece-border-radius\">\r\n					<xsl:apply-templates select=\"html-portlet\" />\r\n				</div>\r\n			</xsl:otherwise>\r\n		</xsl:choose>\r\n		</div>\r\n    </div>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"html-portlet\">\r\n	<xsl:apply-templates select=\"html-portlet-content\" />\r\n</xsl:template>\r\n\r\n<xsl:template match=\"html-portlet-content\">\r\n	<xsl:value-of disable-output-escaping=\"yes\" select=\".\" />\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>'),(310,'Rubrique MyLutece - D├⌐faut','portlet_mylutece.xsl',_binary '<?xml version=\"1.0\"?>\r\n<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n\r\n<xsl:template match=\"portlet\">\r\n\r\n	<xsl:variable name=\"device_class\">\r\n	<xsl:choose>\r\n		<xsl:when test=\"string(display-on-small-device)=\'0\'\">hidden-phone</xsl:when>\r\n		<xsl:when test=\"string(display-on-normal-device)=\'0\'\">hidden-tablet</xsl:when>\r\n		<xsl:when test=\"string(display-on-large-device)=\'0\'\">hidden-desktop</xsl:when>\r\n		<xsl:otherwise></xsl:otherwise>\r\n	</xsl:choose>\r\n	</xsl:variable>\r\n\r\n	<div class=\"portlet {$device_class}\">\r\n		<div class=\"well\">\r\n			<xsl:choose>\r\n	        <xsl:when test=\"not(string(display-portlet-title)=\'1\')\">\r\n				<h3><xsl:value-of disable-output-escaping=\"yes\" select=\"portlet-name\" /></h3>\r\n				<xsl:apply-templates select=\"mylutece-portlet\" />\r\n	        </xsl:when>\r\n	        <xsl:otherwise>\r\n				<xsl:apply-templates select=\"mylutece-portlet\" />\r\n	        </xsl:otherwise>\r\n			</xsl:choose>\r\n			<div class=\"clearfix\">&#160;</div>\r\n		</div>\r\n	</div>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"mylutece-portlet\">\r\n	<xsl:apply-templates select=\"user-not-signed\" />\r\n	<xsl:apply-templates select=\"lutece-user\" />\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"user-not-signed\">\r\n	<form class=\"form\" action=\"jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp\" method=\"post\">\r\n		<xsl:apply-templates select=\"lutece-user-authentication-service[@delegated=\'true\']\" />\r\n		<xsl:apply-templates select=\"lutece-user-authentication-service[@loginpassword-required=\'true\']\" />\r\n		<xsl:if test=\"count(lutece-user-authentication-service[@loginpassword-required=\'true\']) &gt;= 1\">\r\n			<label for=\"username\">Code d\'acc&#232;s :</label>\r\n			<input name=\"username\" class=\"input-normal\" id=\"username\" autocomplete=\"off\" tabindex=\"1\" type=\"text\"/><br />\r\n			<label for=\"password\">Mot de passe :</label>\r\n			<input name=\"password\" class=\"input-normal\" id=\"password\" autocomplete=\"off\" tabindex=\"2\" type=\"password\" />\r\n			<button class=\"btn btn-small\" tabindex=\"3\" type=\"submit\"><i class=\"icon-user\">&#160;</i>&#160;Connexion</button>\r\n		</xsl:if>\r\n	</form>\r\n	<xsl:apply-templates select=\"lutece-user-new-account-url\" />\r\n	<xsl:apply-templates select=\"lutece-user-lost-password-url\" />\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-authentication-service[@loginpassword-required=\'true\']\">\r\n	<label class=\"radio\" for=\"auth_provider\" >\r\n		<input type=\"radio\" name=\"auth_provider\" value=\"{name}\" checked=\"checked\" />\r\n		<xsl:value-of select=\"display-name\" />\r\n	</label>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-authentication-service[@delegated=\'true\']\">\r\n	<a href=\"{url}?auth_provider={name}\">\r\n		<img src=\"{icon-url}\" alt=\"{display-name}\" title=\"{display-name}\"/>\r\n	</a>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user\">\r\n    <p>\r\n	<strong>Bienvenue&#160;\r\n		<xsl:value-of disable-output-escaping=\"yes\" select=\"lutece-user-name-given\" />&#160;\r\n		<xsl:value-of disable-output-escaping=\"yes\" select=\"lutece-user-name-family\" />\r\n	</strong>\r\n	</p>\r\n    <xsl:apply-templates select=\"lutece-user-logout-url\" />\r\n    <xsl:apply-templates select=\"lutece-user-view-account-url\" />\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-logout-url\">\r\n   <form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n   	<button type=\"submit\" class=\"btn\"><i class=\"icon-off\">&#160;</i>&#160;D&#233;connexion</button>&#160;\r\n   </form>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-new-account-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n		<button type=\"submit\" class=\"btn\"><i class=\"icon-plus\">&#160;</i>&#160;Cr&#233;er un compte</button>&#160;\r\n    </form>\r\n</xsl:template>\r\n\r\n\r\n<xsl:template match=\"lutece-user-lost-password-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n	   	<button type=\"submit\" class=\"btn\"><i class=\"icon-lock\">&#160;</i>&#160;Mot de passe perdu</button>&#160;\r\n   </form>\r\n</xsl:template>\r\n\r\n<xsl:template match=\"lutece-user-view-account-url\">\r\n	<form class=\"form-inline pull-left\" name=\"logout\" action=\"{.}\" method=\"post\">\r\n	   	<button type=\"submit\" class=\"btn\"><i class=\"icon-edit\">&#160;</i>&#160;Voir mon compte</button>&#160;\r\n	</form>\r\n</xsl:template>\r\n\r\n</xsl:stylesheet>\r\n\r\n');
/*!40000 ALTER TABLE `core_stylesheet` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_template` (
  `template_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `template_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_template` WRITE;
/*!40000 ALTER TABLE `core_template` DISABLE KEYS */;
INSERT INTO `core_template` VALUES ('core_account_reactivated_mail','Bonjour ${first_name} ! Votre compte utilisateur a bien ├⌐t├⌐ r├⌐activ├⌐. Il est d├⌐sormais valable jusqu\'au ${date_valid}.'),('core_expiration_mail','Bonjour ${first_name} ! Votre compte a expir├⌐. Vous ne pourrez plus vous connecter avec, et les donn├⌐es vous concernant ont ├⌐t├⌐ anonymis├⌐es'),('core_first_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive ├á expiration. Pour prolonger sa validit├⌐, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera d├⌐sactiv├⌐.'),('core_other_alert_mail','Bonjour ${first_name} ! Votre compte utilisateur arrive ├á expiration. Pour prolonger sa validit├⌐, veuillez <a href=\"${url}\">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera d├⌐sactiv├⌐.'),('core_password_expired','Bonjour ! Votre mot de passe a expir├⌐. Lors de votre prochaine connexion, vous pourrez le changer.');
/*!40000 ALTER TABLE `core_template` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_text_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_text_editor` (
  `editor_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `editor_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `backOffice` smallint NOT NULL,
  PRIMARY KEY (`editor_name`,`backOffice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_text_editor` WRITE;
/*!40000 ALTER TABLE `core_text_editor` DISABLE KEYS */;
INSERT INTO `core_text_editor` VALUES ('','portal.admindashboard.editors.labelFrontNoEditor',0),('','portal.admindashboard.editors.labelBackNoEditor',1),('markitupbbcode','portal.admindashboard.editors.labelFrontMarkitupBBCode',0),('tinymce','portal.admindashboard.editors.labelBackTinyMCE',1);
/*!40000 ALTER TABLE `core_text_editor` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_password_history` (
  `id_user` int NOT NULL,
  `password` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `date_password_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`date_password_change`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_user_password_history` WRITE;
/*!40000 ALTER TABLE `core_user_password_history` DISABLE KEYS */;
INSERT INTO `core_user_password_history` VALUES (1,'PBKDF2WITHHMACSHA512:40000:453079100ff4d8d07eed3a7a85c025c9:913e4f870e5fe95dff24341a11f5f7cdb8314ac983e4ea6fa2c00d80ae70bfb8700ce9ea80f8d0fb23c75a276e94e10d58ee165e797c5498015dd8bec56353f36f7fefe505f4a15d9b6eabe676ee757c4efc4ca1f180669fc3fd13981dc35ebc0a76930a3a22b65aadcd95d3970f46a7ab15622cb3895a06121f44b68e747986','2020-11-13 14:07:25'),(1,'PBKDF2WITHHMACSHA512:40000:0ef18c08a4f10534fc516d8e3a5ecb7c:b5c51a942366278ed207df9011cd6eef4e1dddf27137b6ce95b63078d0bcb66b3e9e2a2ec4d8452eb0522ab82669813cf82cea01e4ceb8004905c461cd3f5d1a4cb106d14d1330285b74e5bd4d57122cfd42d324d7788c83e648398665e0a8ef4dba44b25d04605dc380374ba4b880f0138b7dd6a7ccdc4960d506b0e0fdc2fe','2021-10-29 17:54:06'),(1,'PBKDF2WITHHMACSHA512:40000:a7698aee8e8301dcf7e01451a7ceccaa:5312265041ea9f479b972de8e94910037e5ae140ed176fe90c30e58ee6f576dcd6058b26e0af5442b5c93355de82176f33343b821dfd117bf67da8e62983e1786fbe2a8f9f5854ed7c4c0d9b459576f1dd3c110b3dc4161df6fb358c2d1fb7f4b54cce1f4fdacab2bef81f5234d323ce5493b38ce6ad3d6bac3a8edabd435ade','2022-03-03 12:33:42'),(1,'PBKDF2WITHHMACSHA512:40000:6244ea1f0ba167d83c3ce6df3db308ec:87da8233548e2b51ffc803a90749f9bc5ff1b7b255dcf7952e08185d8eb19965a58d5a01eccb84cd8d30a58799ac32895bc7bf18cf0ead5027eece7d999b65fd80f7933e6559b6cd933fdbb7ea48b957631b2e4f5790756cb297773986818ca879de106aa7369953b0cd3c9d0027a8d214b374c9b1e341425160f8f0923c8acf','2022-03-03 12:34:00'),(13,'PBKDF2WITHHMACSHA512:40000:475a1403b563c6bbb6e2e2df1242e849:6b69f203303b2c0bf2ff1ac36732b5dbdfbbe7427d2fd2666692b93ff718eb03e5cc3c0a5c42ee505319ea3fd49a0db26e23633fa9ff2c6d16fad4d3e58af805e805e1cd518c9ba790121ab46468b9028934dc9847857982059164df0460c49cdb7c1cefc708607655d34feb5f048e42157f364c2930756f63da7bba02a49a99','2021-11-23 11:05:15'),(19,'PBKDF2WITHHMACSHA512:40000:728eb31b4d020a6f65de8ec20f381779:683a43c47c669ba2a10e51665a062f232a2667536b75edfefe24d8c30d5396775508164b7a6baca322052813fae280c5d51f55a1a88b363b4eb4626c59aaa7ac9100d8afaf30b52e4db8d1a4381cc3ca105f6dae1e36b6c6a8ea588ca3c1187436814f3ba3819be0f425a796916ff720b561169a1ef034b6c99aa56b7466902d','2021-01-05 14:28:58'),(57,'PBKDF2WITHHMACSHA512:40000:230772a6d7556c4e38bd9c2c5f94e95a:f2c95299dda690117df6bb417ab2a5c7995259f644894a98325fd1cffa25cf6dae144532a50fb9ba5f4ae6e75bd3456f649404b2371e25256a97762de35ef83328d17c04a52d6a43b0599bd06e5ea03b8118d22d750031609e399b146d14712a14ba03f3ad49bfd1fc71b1209a8e75dece806c30759f0407f4fc35bbb1ff3e37','2021-11-25 09:32:22');
/*!40000 ALTER TABLE `core_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_preferences` (
  `id_user` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pref_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_user_preferences` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_user_preferences` WRITE;
/*!40000 ALTER TABLE `core_user_preferences` DISABLE KEYS */;
INSERT INTO `core_user_preferences` VALUES ('1f407a85-de92-441e-a57d-df2d0d810687','mydashboard.dashboardConfigId','2-260549');
/*!40000 ALTER TABLE `core_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_user_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_right` (
  `id_right` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_right`,`id_user`),
  KEY `index_user_right` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_user_right` WRITE;
/*!40000 ALTER TABLE `core_user_right` DISABLE KEYS */;
INSERT INTO `core_user_right` VALUES ('APPOINTMENT_CATEGORY_MANAGEMENT',1),('APPOINTMENT_COMMENT_MANAGEMENT',1),('APPOINTMENT_FORM_MANAGEMENT',1),('CORE_ADMIN_SITE',1),('CORE_ADMINDASHBOARD_MANAGEMENT',1),('CORE_CACHE_MANAGEMENT',1),('CORE_DAEMONS_MANAGEMENT',1),('CORE_DASHBOARD_MANAGEMENT',1),('CORE_EDITORS_MANAGEMENT',1),('CORE_FEATURES_MANAGEMENT',1),('CORE_LEVEL_RIGHT_MANAGEMENT',1),('CORE_LINK_SERVICE_MANAGEMENT',1),('CORE_LOGS_VISUALISATION',1),('CORE_MAILINGLISTS_MANAGEMENT',1),('CORE_MODES_MANAGEMENT',1),('CORE_PAGE_TEMPLATE_MANAGEMENT',1),('CORE_PLUGINS_MANAGEMENT',1),('CORE_PROPERTIES_MANAGEMENT',1),('CORE_RBAC_MANAGEMENT',1),('CORE_RIGHT_MANAGEMENT',1),('CORE_ROLES_MANAGEMENT',1),('CORE_SEARCH_INDEXATION',1),('CORE_SEARCH_MANAGEMENT',1),('CORE_STYLES_MANAGEMENT',1),('CORE_STYLESHEET_MANAGEMENT',1),('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT',1),('CORE_USERS_MANAGEMENT',1),('CORE_WORKGROUPS_MANAGEMENT',1),('CORE_XSL_EXPORT_MANAGEMENT',1),('ENTRY_TYPE_MANAGEMENT',1),('HTMLPAGE_MANAGEMENT',1),('MULTIVIEW_APPOINTMENT',1),('MYDASHBOARD_PANEL_MANAGEMENT',1),('MYLUTECE_MANAGE_AUTHENTICATION_FILTER',1),('MYLUTECE_MANAGEMENT',1),('PROFILES_MANAGEMENT',1),('PROFILES_VIEWS_MANAGEMENT',1),('REGULAR_EXPRESSION_MANAGEMENT',1),('RESOURCE_MANAGE_RESOURCES',1),('SITELABELS_MANAGEMENT',1),('SOLR_CONFIGURATION_MANAGEMENT',1),('SOLR_FIELDS_MANAGEMENT',1),('SOLR_INDEX_MANAGEMENT',1),('SYSTEMINFO_MANAGEMENT',1),('VIEW_TEMP_FILES',1),('WORKFLOW_MANAGEMENT',1);
/*!40000 ALTER TABLE `core_user_right` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `core_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_user_role` (
  `role_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_key`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_user_role` WRITE;
/*!40000 ALTER TABLE `core_user_role` DISABLE KEYS */;
INSERT INTO `core_user_role` VALUES ('all_site_manager',1),('APP_OVERBOOK',13),('APP_OVERBOOK',57),('APP_OVERBOOK',58),('assign_groups',1),('assign_groups',13),('assign_roles',1),('assign_roles',13),('COMMENT_ADD',1),('COMMENT_ADD',13),('COMMENT_ADD',57),('COMMENT_ADD',58),('COMMENT_MODERATE',1),('COMMENT_MODERATE',13),('COMMENT_MODERATE',57),('COMMENT_MODERATE',58),('CONSULTATION_KIBANA',1),('CONSULTATION_KIBANA',13),('CONSULTATION_KIBANA',57),('CONSULTATION_KIBANA',58),('kibana_dashboards_manager',1),('LISTE_DIFF',13),('LISTE_DIFF',57),('LISTE_DIFF',58),('mylutece_manager',1),('profiles_manager',1),('profiles_manager',13),('profiles_manager',57),('profiles_manager',58),('profiles_views_manager',1),('RDV_ADMIN',13),('RDV_ADMIN',57),('RDV_ADMIN',58),('rdv_agentAccueil',13),('rdv_agentAccueil',19),('rdv_agentAccueil',57),('rdv_agentAccueil',58),('rdv_planificateur',13),('rdv_planificateur',57),('rdv_planificateur',58),('super_admin',1),('workflow_manager',1),('workflow_manager',13),('workflow_manager',57),('workflow_manager',58);
/*!40000 ALTER TABLE `core_user_role` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `core_xsl_export` WRITE;
/*!40000 ALTER TABLE `core_xsl_export` DISABLE KEYS */;
INSERT INTO `core_xsl_export` VALUES (125,'Core - Export users to a CSV file','Export back office users to a CSV file','csv',125,'core'),(126,'Core - Export users to a XML file','Export back office users to a XML file','xml',126,'core');
/*!40000 ALTER TABLE `core_xsl_export` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `crm_client_crm_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_client_crm_item` (
  `id_crm_queue` int NOT NULL DEFAULT '0',
  `crm_item` mediumblob,
  PRIMARY KEY (`id_crm_queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `crm_client_crm_item` WRITE;
/*!40000 ALTER TABLE `crm_client_crm_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_client_crm_item` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `crm_client_crm_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_client_crm_queue` (
  `id_crm_queue` int NOT NULL DEFAULT '0',
  `is_locked` smallint DEFAULT '0',
  PRIMARY KEY (`id_crm_queue`),
  KEY `is_locked_crm_client_crm_queue` (`is_locked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `crm_client_crm_queue` WRITE;
/*!40000 ALTER TABLE `crm_client_crm_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_client_crm_queue` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `elastic_mapping` WRITE;
/*!40000 ALTER TABLE `elastic_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `elastic_mapping` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `elasticdata_appointment_data_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elasticdata_appointment_data_history` (
  `id_data_history` int NOT NULL AUTO_INCREMENT,
  `data_type` mediumtext NOT NULL,
  `time_until_availability` bigint DEFAULT '0',
  `time_until_category_availability` bigint DEFAULT '0',
  `id_ressource` int NOT NULL,
  `sum_nbPlaces_before_appointment` int DEFAULT '0',
  `sum_category_nbPlaces_before_appointment` int DEFAULT '0',
  PRIMARY KEY (`id_data_history`),
  KEY `fk_elasticdata_appointment_data_history_idx` (`id_ressource`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `elasticdata_appointment_data_history` WRITE;
/*!40000 ALTER TABLE `elasticdata_appointment_data_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `elasticdata_appointment_data_history` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `elasticdata_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elasticdata_indexer_action` (
  `id_action` int NOT NULL AUTO_INCREMENT,
  `id_resource` varchar(255) NOT NULL,
  `id_task` int NOT NULL DEFAULT '0',
  `id_datasource` varchar(255) NOT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `elasticdata_indexer_action` WRITE;
/*!40000 ALTER TABLE `elasticdata_indexer_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `elasticdata_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `filegen_temporary_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filegen_temporary_file` (
  `id_file` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL DEFAULT '0',
  `title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `id_physical_file` int DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_file`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `filegen_temporary_file` WRITE;
/*!40000 ALTER TABLE `filegen_temporary_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `filegen_temporary_file` ENABLE KEYS */;
UNLOCK TABLES;
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
  `is_editable_back` smallint DEFAULT '0',
  `is_indexed` smallint DEFAULT '0',
  PRIMARY KEY (`id_entry`),
  KEY `index_genatt_entry_resource` (`id_resource`),
  KEY `index_genatt_entry_parent` (`id_parent`),
  KEY `index_genatt_code` (`code`),
  KEY `fk_genatt_entry_type` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `genatt_entry` WRITE;
/*!40000 ALTER TABLE `genatt_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_entry` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `genatt_entry_type` WRITE;
/*!40000 ALTER TABLE `genatt_entry_type` DISABLE KEYS */;
INSERT INTO `genatt_entry_type` VALUES (101,'Bouton radio',0,0,0,'appointment.entryTypeRadioButton',NULL,'appointment',0,0),(102,'Case ├á cocher',0,0,0,'appointment.entryTypeCheckBox',NULL,'appointment',0,0),(103,'Commentaire',0,1,0,'appointment.entryTypeComment',NULL,'appointment',0,0),(104,'Date',0,0,0,'appointment.entryTypeDate',NULL,'appointment',0,0),(105,'Liste d├⌐roulante',0,0,0,'appointment.entryTypeSelect',NULL,'appointment',0,0),(106,'Zone de texte court',0,0,0,'appointment.entryTypeText',NULL,'appointment',0,0),(107,'Zone de texte long',0,0,0,'appointment.entryTypeTextArea',NULL,'appointment',0,0),(108,'Num├⌐rotation',0,0,0,'appointment.entryTypeNumbering',NULL,'appointment',0,0),(109,'Regroupement',1,0,0,'appointment.entryTypeGroup',NULL,'appointment',0,0),(110,'Liste d├⌐roulante SQL',0,0,0,'appointment.entryTypeSelectSQL',NULL,'appointment',0,0),(111,'G├⌐olocalisation',0,0,0,'appointment.entryTypeGeolocation',NULL,'appointment',0,0),(112,'Session',0,0,0,'appointment.entryTypeSession',NULL,'appointment',0,0),(113,'Utilisateur MyLutece',0,0,1,'appointment.entryTypeMyLuteceUser',NULL,'appointment',0,0),(114,'Image',0,0,0,'appointment.entryTypeImage',NULL,'appointment',0,0),(115,'Fichier',0,0,0,'appointment.entryTypeFile',NULL,'appointment',0,0),(116,'Num├⌐ro de t├⌐l├⌐phone',0,0,0,'appointment.entryTypePhone',NULL,'appointment',0,0);
/*!40000 ALTER TABLE `genatt_entry_type` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `genatt_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_field` (
  `id_field` int NOT NULL AUTO_INCREMENT,
  `id_entry` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `height` int DEFAULT NULL,
  `default_value` smallint DEFAULT NULL,
  `pos` int DEFAULT NULL,
  `value_type_date` date DEFAULT NULL,
  `no_display_title` smallint DEFAULT NULL,
  `comment` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_field`),
  KEY `index_genatt_field_entry` (`id_entry`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `genatt_field` WRITE;
/*!40000 ALTER TABLE `genatt_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_field` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `genatt_referenceitem_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_referenceitem_field` (
  `id_field` int NOT NULL DEFAULT '0',
  `id_item` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `genatt_referenceitem_field` WRITE;
/*!40000 ALTER TABLE `genatt_referenceitem_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_referenceitem_field` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=1334 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `genatt_response` WRITE;
/*!40000 ALTER TABLE `genatt_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_response` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `genatt_verify_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genatt_verify_by` (
  `id_field` int NOT NULL DEFAULT '0',
  `id_expression` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`,`id_expression`),
  KEY `index_genatt_verify_by_field` (`id_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `genatt_verify_by` WRITE;
/*!40000 ALTER TABLE `genatt_verify_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `genatt_verify_by` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `gfa_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gfa_appointment` (
  `id_resource` int NOT NULL AUTO_INCREMENT,
  `id_appointment` int NOT NULL DEFAULT '0',
  `id_form` int NOT NULL DEFAULT '0',
  `action` int NOT NULL,
  `date_appointment` date DEFAULT NULL,
  `description` varchar(255) DEFAULT '',
  `status` varchar(50) NOT NULL DEFAULT '',
  `number_relaunch` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_resource`),
  KEY `fk_id_form` (`id_form`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gfa_appointment` WRITE;
/*!40000 ALTER TABLE `gfa_appointment` DISABLE KEYS */;
INSERT INTO `gfa_appointment` VALUES (14,658,4,198,'2021-04-02','TAKE_APPOINTMENT: rafik t test1 modifier Email: rafik.yahiaoui@paris.fr','KO',6),(15,660,4,198,'2021-03-26','TAKE_APPOINTMENT: rafik t test1 modifier Email: ryahia46@gmail.com','KO',6);
/*!40000 ALTER TABLE `gfa_appointment` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `gfa_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gfa_config` (
  `id_workflow` int NOT NULL DEFAULT '0',
  `id_form` int NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gfa_config` WRITE;
/*!40000 ALTER TABLE `gfa_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `gfa_config` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `gfa_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gfa_error` (
  `id_error` int NOT NULL AUTO_INCREMENT,
  `id_resource` int NOT NULL DEFAULT '0',
  `date_error` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `error` mediumtext,
  `action` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_error`),
  KEY `fk_id_resource` (`id_resource`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gfa_error` WRITE;
/*!40000 ALTER TABLE `gfa_error` DISABLE KEYS */;
INSERT INTO `gfa_error` VALUES (19,14,'2021-02-23 11:38:45','There are no time zones available to make this appointment','TAKE_APPOINTMENT'),(20,15,'2021-02-23 11:58:53','There are no time zones available to make this appointment','TAKE_APPOINTMENT');
/*!40000 ALTER TABLE `gfa_error` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `gfa_workflow_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gfa_workflow_mapping` (
  `id_form` int NOT NULL,
  `action_wf_begin` int NOT NULL,
  `action_wf_relaunch` int NOT NULL,
  PRIMARY KEY (`id_form`,`action_wf_begin`,`action_wf_relaunch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gfa_workflow_mapping` WRITE;
/*!40000 ALTER TABLE `gfa_workflow_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `gfa_workflow_mapping` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `html_portlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `html_portlet` (
  `id_portlet` int NOT NULL DEFAULT '0',
  `html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_portlet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `html_portlet` WRITE;
/*!40000 ALTER TABLE `html_portlet` DISABLE KEYS */;
INSERT INTO `html_portlet` VALUES (6,'    <!-- Features -->\r\n    <div id=\"features\" class=\"tabs\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12\">\r\n                    <div class=\"above-heading\">FEATURES</div>\r\n                    <h2 class=\"h2-heading\">Appointments</h2>\r\n                    <p class=\"p-heading\">Build appointement forms for your citizen\'s, associations...</p>\r\n                </div> \r\n            </div> \r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12\">\r\n                   <!-- Tabs Links -->\r\n                    <ul class=\"nav nav-tabs\" role=\"tablist\">\r\n                        <li class=\"nav-item\">\r\n                            <a class=\"nav-link active\" id=\"nav-tab-1\" data-bs-toggle=\"tab\" data-bs-target=\"#tab-1\"  href=\"#tab-1\" role=\"tab\" aria-controls=\"tab-1\" aria-selected=\"true\">\r\n								<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"icon icon-tabler icon-tabler-calendar-time\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">\r\n   <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"></path>\r\n   <path d=\"M11.795 21h-6.795a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v4\"></path>\r\n   <circle cx=\"18\" cy=\"18\" r=\"4\"></circle>\r\n   <path d=\"M15 3v4\"></path>\r\n   <path d=\"M7 3v4\"></path>\r\n   <path d=\"M3 11h16\"></path>\r\n   <path d=\"M18 16.496v1.504l1 1\"></path>\r\n</svg> \r\n								Set Agendas\r\n							</a>\r\n                        </li>\r\n                        <li class=\"nav-item\">\r\n                            <a class=\"nav-link\" id=\"nav-tab-2\" data-bs-toggle=\"tab\"  data-bs-target=\"#tab-2\"  href=\"#tab-2\" role=\"tab\" aria-controls=\"tab-2\" aria-selected=\"false\">\r\n								<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"icon icon-tabler icon-tabler-list-numbers\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">\r\n   <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"></path>\r\n   <path d=\"M11 6h9\"></path>\r\n   <path d=\"M11 12h9\"></path>\r\n   <path d=\"M12 18h8\"></path>\r\n   <path d=\"M4 16a2 2 0 1 1 4 0c0 .591 -.5 1 -1 1.5l-3 2.5h4\"></path>\r\n   <path d=\"M6 10v-6l-2 2\"></path>\r\n</svg>\r\n								Manage appointments\r\n							</a>\r\n                        </li>\r\n                    </ul>\r\n                    <!-- end of tabs links -->\r\n                    <!-- Tabs Content -->\r\n                    <div class=\"tab-content\">\r\n                        <!-- Tab -->\r\n                        <div class=\"tab-pane fade show active\" id=\"tab-1\" role=\"tabpanel\" aria-labelledby=\"tab-1\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-lg-6\">\r\n                                    <div class=\"image-container\">\r\n                                        <img class=\"img-fluid\" src=\"images/features-1.png\" alt=\"alternative\">\r\n                                    </div> <!-- end of image-container -->\r\n                                </div> <!-- end of col -->\r\n                                <div class=\"col-lg-6\">\r\n                                    <div class=\"text-container\">\r\n                                        <h3>Set appointments forms.</h3>\r\n                                        <p>It\'s very easy to start appointement calendar... </p>\r\n                                        <ul class=\"list-unstyled li-space-lg\">\r\n                                            <li>\r\n                                                <i class=\"fas fa-square\"></i> Add as many appointments form you need.\r\n                                            </li>\r\n                                            <li>\r\n                                                <i class=\"fas fa-square\"></i> Manage appontments configs ...\r\n                                            </li>\r\n                                            <li>\r\n                                                <i class=\"fas fa-square\"></i> Add and remove appointement easily\r\n                                            </li>\r\n                                        </ul>\r\n                                        <p class=\"p-small\">Demo user access-code is <strong>\"adminpack\"</strong> and the password is <strong>\"packcityadmin\"</strong></p>\r\n                                        <a class=\"btn-solid-reg\" target=\"_blank\" title=\"[Nouvelle fen├¬tre] Go to back-office\" href=\"jsp/admin/AdminLogin.jsp\"><i class=\"fas fa-external-link-alt\"></i> Connect to admin</a>\r\n                                    </div> <!-- end of text-container -->\r\n                                </div> <!-- end of col -->\r\n                            </div> <!-- end of row -->\r\n                        </div> <!-- end of tab-pane -->\r\n                        <!-- end of tab -->\r\n                        <!-- Tab -->\r\n                        <div class=\"tab-pane fade\" id=\"tab-2\" role=\"tabpanel\" aria-labelledby=\"tab-2\">\r\n                            <div class=\"row\">\r\n                                <div class=\"col-lg-6\">\r\n                                    <div class=\"image-container\">\r\n                                        <img class=\"img-fluid\" src=\"images/features-2.png\" alt=\"alternative\">\r\n                                    </div> <!-- end of image-container -->\r\n                                </div> <!-- end of col -->\r\n                                <div class=\"col-lg-6\">\r\n                                    <div class=\"text-container\">\r\n                                        <h3>Manage appointments demands</h3>\r\n                                        <p>...</p>\r\n                                        <ul class=\"list-unstyled li-space-lg\">\r\n                                            <li><i class=\"fas fa-square\"></i> Esay search available</li>\r\n                                            <li><i class=\"fas fa-square\"></i> Visualise all appointent by months, weeks and days.</li>\r\n                                            <li><i class=\"fas fa-square\"></i> Add workflow on appointements</li>\r\n                                        </ul>\r\n                                        <p class=\"p-small\">Demo user access-code is <strong>\"adminpack\"</strong> and the password is <strong>\"packcityadmin\"</strong></p>\r\n                                        <a class=\"btn-solid-reg\" target=\"_blank\" title=\"[Nouvelle fen├¬tre] Go to back-office\" href=\"jsp/admin/AdminLogin.jsp\"><i class=\"fas fa-external-link-alt\"></i> Connect to admin</a>\r\n                                    </div> <!-- end of text-container -->\r\n                                </div> <!-- end of col -->\r\n                            </div> <!-- end of row -->\r\n                        </div> <!-- end of tab-pane -->\r\n                        <!-- end of tab -->\r\n                    <!-- end of tabs content -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n        </div> <!-- end of container -->\r\n    </div> <!-- end of tabs -->\r\n    <!-- end of features -->\r\n    '),(4,'<!-- end of customers -->\r\n<!-- Description -->\r\n    <div class=\"cards-1\">\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12 \">\r\n                    <div class=\"sub-heading\">AVAILABLE LUTECE PACKS</div>\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n            <div class=\"row\">\r\n                <div class=\"col-lg-12 card-list\">\r\n                    <!-- Card -->\r\n                    <div class=\"card\">\r\n                        <div class=\"card-image\">\r\n                            <img class=\"img-fluid\" src=\"images/description-1.png\" alt=\"alternative\">\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <h4 class=\"card-title\">Forms</h4>\r\n                            <p>It\'s very easy to start creating a form.</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n                   \r\n  	<!-- Card -->\r\n                    <div class=\"card\">\r\n                       <div class=\"ribbon ribbon-top-right\"><span>Coming soon</span></div>\r\n                        <div class=\"card-image\">\r\n                            <img class=\"img-fluid\" src=\"images/description-4.png\" alt=\"alternative\">\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <h4 class=\"card-title\">In my street</h4>\r\n                            <p>Have citizen feedback on your city equipments</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n                    <!-- Card -->\r\n                    <div class=\"card\">\r\n                      <div class=\"ribbon ribbon-top-right\"><span>Coming soon</span></div> \r\n	    <div class=\"card-image\">\r\n                            <img class=\"img-fluid\" src=\"images/description-3.png\" alt=\"alternative\">\r\n                        </div>\r\n                        <div class=\"card-body\">\r\n                            <h4 class=\"card-title\">Participative Budget</h4>\r\n                            <p>Elaborate with citizen</p>\r\n                        </div>\r\n                    </div>\r\n                    <!-- end of card -->\r\n                </div> <!-- end of col -->\r\n            </div> <!-- end of row -->\r\n        </div> <!-- end of container -->\r\n    </div> <!-- end of cards-1 -->\r\n    <!-- end of description -->\r\n'),(5,'	<div class=\"slider-1\">\r\n		<div class=\"container\">\r\n			<div class=\"row\">\r\n				<div class=\"col\">\r\n					 <div class=\"sub-heading\">THEY ALSO TRUST LUTECE</div>\r\n					<!-- Image Slider -->\r\n					<div class=\"slider-container\">\r\n						<div class=\"swiper-container image-slider\">\r\n							<div class=\"swiper-wrapper\">\r\n								<div class=\"swiper-slide\">\r\n									<a href=\"//www.jhu.edu/\" title=\"[New window]  John Hopkins\"><img class=\"img-fluid\" src=\"images/customer-logo-1.png\" alt=\"alternative\"></a>\r\n								</div>\r\n								<div class=\"swiper-slide\">\r\n									<a href=\"//www.lyon.fr/demarches\" title=\"[New window]  Lyon City\"><img class=\"img-fluid\" src=\"images/customer-logo-2.png\" alt=\"alternative\"></a>\r\n								</div>\r\n								<div class=\"swiper-slide\">\r\n									<a href=\"//paris.fr\" title=\"[New window]  Paris City\"><img class=\"img-fluid\" src=\"images/customer-logo-3.png\" alt=\"alternative\"></a>\r\n								</div>\r\n								<div class=\"swiper-slide\">\r\n									<a href=\"//budapest.hu/\" title=\"[New window]  Budapest City\"><img class=\"img-fluid\" src=\"images/customer-logo-4.png\" alt=\"alternative\"></a>\r\n								</div>\r\n								<div class=\"swiper-slide\">\r\n									<a href=\"//plainecommune.fr/\" title=\"[New window]  Plaine Commune\"><img class=\"img-fluid\" src=\"images/customer-logo-5.png\" alt=\"alternative\"></a>\r\n								</div>\r\n                                                                <div class=\"swiper-slide\">\r\n									<a href=\"//www.yonne.fr/\" title=\"[New window]  Département de l\'Yonne\"><img class=\"img-fluid\" src=\"images/customer-logo-6.png\" alt=\"alternative\"></a>\r\n								</div>\r\n                                                                 <div class=\"swiper-slide\">\r\n									<a href=\"//www.ch-chalon71.fr/.fr/\" title=\"[New window]  GHT Saône-Et-Loire Bresse Morvan\"><img class=\"img-fluid\" src=\"images/customer-logo-7.png\" alt=\"alternative\"></a>\r\n								</div>\r\n                                                                <div class=\"swiper-slide\">\r\n									<a href=\"//ama.gov.gh/\" title=\"[New window]  Accra Metropolitan Assembly\"><img class=\"img-fluid\" src=\"images/customer-logo-8.png\" alt=\"alternative\"></a>\r\n								</div>\r\n                                                              <div class=\"swiper-slide\">\r\n									<a href=\"//www.stfranciscenter.org/\" title=\"[New window]  St. Francis Neighborhood Center\"><img class=\"img-fluid\" src=\"images/customer-logo-9.png\" alt=\"alternative\"></a>\r\n								</div>\r\n							</div> <!-- end of swiper-wrapper -->\r\n						</div> <!-- end of swiper container -->\r\n					</div> <!-- end of slider-container -->\r\n					<!-- end of image slider -->\r\n				</div> <!-- end of col -->\r\n			</div> <!-- end of row -->\r\n		</div> <!-- end of container -->\r\n	</div> <!-- end of slider-1 -->');
/*!40000 ALTER TABLE `html_portlet` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `htmlpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htmlpage` (
  `id_htmlpage` int NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `html_content` mediumtext,
  `status` int NOT NULL DEFAULT '0',
  `workgroup_key` varchar(50) NOT NULL DEFAULT 'all',
  `role` varchar(50) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id_htmlpage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `htmlpage` WRITE;
/*!40000 ALTER TABLE `htmlpage` DISABLE KEYS */;
INSERT INTO `htmlpage` VALUES (1,'Text d\'accueil sp??cifique ??cran recherche Titres','<p>Pour que votre rendez-vous se d&eacute;roule dans les meilleures conditions, nous vous invitons &agrave; lire les informations pr&eacute;sentes sur la page <strong><a href=\"https://www.paris.fr/pages/carte-nationale-d-identite-et-passeport-4825\">paris.fr d&eacute;di&eacute;e</a></strong> et &agrave; constituer votre dossier avant la prise de votre rendez-vous.</p>\r\n<p>Pour prendre rendez-vous, merci d&rsquo;indiquer le nombre de personnes qui ont besoin d&rsquo;une carte d&rsquo;identit&eacute; et/ou d&rsquo;un passeport.</p>\r\n<p><br /><em>La dur&eacute;e du rendez-vous est de 15min par personne environ, que vous demandiez une carte d&rsquo;identit&eacute; ou un passeport. Vous pouvez donc d&eacute;poser votre demande de carte d&rsquo;identit&eacute; ET de passeport pendant le m&ecirc;me rendez-vous de 15min. Profitez-en pour v&eacute;rifier la date de validit&eacute; de vos titres et ne faire qu&rsquo;une seule d&eacute;marche.</em><br /><em>La pr&eacute;sence du demandeur de titre d&rsquo;identit&eacute; est obligatoire (le demandeur mineur&middot;e doit &ecirc;tre accompagn&eacute;&middot;e d&rsquo;un&middot;e repr&eacute;sentant&middot;e l&eacute;gal&middot;e).</em></p>',1,'all','none'),(2,'Text riche formulaire','<p>Nous vous proposons l&rsquo;ensemble des rendez-vous disponibles dans les xx prochains jours.</p>',0,'all','none'),(3,'Texte riche Cartographie','<p><strong>Nous vous proposons l&rsquo;ensemble des rendez-vous disponibles dans les xx prochains jours.</strong></p>',1,'all','none');
/*!40000 ALTER TABLE `htmlpage` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `identitystore_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_attribute` (
  `id_attribute` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `key_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `key_type` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `key_name` (`key_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identitystore_attribute` WRITE;
/*!40000 ALTER TABLE `identitystore_attribute` DISABLE KEYS */;
INSERT INTO `identitystore_attribute` VALUES (1,'Genre','gender','0:Non d├⌐fini /  1:Homme / 2:Femme',0),(2,'Email','email','',0),(3,'Date de naissance','birthdate','au format DD/MM/YYYY',0),(4,'Lieu de naissance','birthplace','',0),(5,'T├⌐l├⌐phone portable','mobile_phone','R├⌐serv├⌐ pour l\'envoi de SMS',0),(6,'T├⌐l├⌐phone fixe','fixed_phone','',0),(7,'T├⌐l├⌐phone fixe ou mobile','phone','',0),(8,'Nom usuel','preferred_username','',0),(9,'Adresse postale','address','',0),(10,'Pr├⌐nom','first_name','Pr├⌐nom usuel',0),(11,'Nom de famille de naissance','family_name','',0),(12,'Num├⌐ro de rue','address_number','Champ d\'adresse : num├⌐ro de rue ',0),(13,'Suffixe','address_suffix','Champ d\'adresse : suffixe de num├⌐ro (bis,ter...)',0),(14,'Rue','address_street','Champ d\'adresse :  rue, avenue...',0),(15,'Immeuble','address_building','Champ d\'adresse : immeuble, r├⌐sidence...',0),(16,'Etage','address_stair','Champ d\'adresse : Etage, Num├⌐ro d appartement',0),(17,'Code postal','address_postal_code','Champ d\'adresse : code postal',0),(18,'Ville','address_city','Champ d\'adresse : ville',0),(19,'Pays de naissance','birthcountry','',0),(30,'(FC) Pr├⌐noms','fc_given_name','Format Pivot FranceConnect - Liste des pr├⌐noms',0),(31,'(FC) Nom de naissance','fc_family_name','Format Pivot FranceConnect',0),(32,'(FC) Date de naissance','fc_birthdate','Format Pivot FranceConnect - format YYYY-MM-DD',0),(33,'(FC) Genre','fc_gender','Format Pivot FranceConnect - male / female',0),(34,'(FC) Lieu de naissance','fc_birthplace','Format Pivot FranceConnect - Code INSEE du lieu de naissance (ou une cha├«ne vide si la personne est n├⌐e ├á l\'├⌐tranger)',0),(35,'(FC) Pays de naissance','fc_birthcountry','Format Pivot FranceConnect - Code INSEE du pays de naissance',0);
/*!40000 ALTER TABLE `identitystore_attribute` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `identitystore_attribute_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_attribute_certificate` (
  `id_attribute_certificate` int NOT NULL AUTO_INCREMENT,
  `certifier_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `certificate_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `certificate_level` int NOT NULL DEFAULT '0',
  `expiration_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_attribute_certificate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identitystore_attribute_certificate` WRITE;
/*!40000 ALTER TABLE `identitystore_attribute_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `identitystore_attribute_certificate` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identitystore_attribute_right` WRITE;
/*!40000 ALTER TABLE `identitystore_attribute_right` DISABLE KEYS */;
INSERT INTO `identitystore_attribute_right` VALUES (1,1,1,1,0,0),(1,2,1,1,0,0),(1,3,1,1,0,0),(1,4,1,1,0,0),(1,5,1,1,0,0),(1,6,1,1,0,0),(1,7,1,1,0,0),(1,8,1,1,0,0),(1,9,1,1,0,0),(1,10,1,1,0,0),(1,11,1,1,0,0),(1,12,1,1,0,0),(1,13,1,1,0,0),(1,14,1,1,0,0),(1,15,1,1,0,0),(1,16,1,1,0,0),(1,17,1,1,0,0),(1,18,1,1,0,0);
/*!40000 ALTER TABLE `identitystore_attribute_right` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `identitystore_client_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_client_application` (
  `id_client_app` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_application_authorized_to_delete_value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_client_app`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identitystore_client_application` WRITE;
/*!40000 ALTER TABLE `identitystore_client_application` DISABLE KEYS */;
INSERT INTO `identitystore_client_application` VALUES (1,'My Application','MyApplication',0);
/*!40000 ALTER TABLE `identitystore_client_application` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `identitystore_client_application_certifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_client_application_certifiers` (
  `id_client_app` int NOT NULL,
  `certifier_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_client_app`,`certifier_code`),
  KEY `id_client_app` (`id_client_app`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identitystore_client_application_certifiers` WRITE;
/*!40000 ALTER TABLE `identitystore_client_application_certifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `identitystore_client_application_certifiers` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `identitystore_history_identity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_history_identity_attribute` (
  `id_history` int NOT NULL AUTO_INCREMENT,
  `change_type` int NOT NULL,
  `id_identity` int NOT NULL,
  `identity_connection_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `attribute_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attribute_new_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `attribute_old_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `author_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `author_type` int NOT NULL,
  `author_application` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `certifier_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `modification_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_history`),
  KEY `fk_history_identity_attribute_id_identity` (`id_identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identitystore_history_identity_attribute` WRITE;
/*!40000 ALTER TABLE `identitystore_history_identity_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `identitystore_history_identity_attribute` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `identitystore_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_identity` (
  `id_identity` int NOT NULL AUTO_INCREMENT,
  `connection_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `customer_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` smallint DEFAULT '0',
  `date_delete` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_identity`),
  UNIQUE KEY `connection_id` (`connection_id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  KEY `connection_id_2` (`connection_id`),
  KEY `customer_id_2` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identitystore_identity` WRITE;
/*!40000 ALTER TABLE `identitystore_identity` DISABLE KEYS */;
INSERT INTO `identitystore_identity` VALUES (1,'azerty','3F2504E0-4F89-11D3-9A0C-0305E82C3301','2020-11-13 14:03:46',0,'2020-11-13 14:03:46');
/*!40000 ALTER TABLE `identitystore_identity` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `identitystore_identity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitystore_identity_attribute` (
  `id_identity` int NOT NULL DEFAULT '0',
  `id_attribute` int NOT NULL DEFAULT '0',
  `attribute_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `id_certification` int NOT NULL DEFAULT '0',
  `id_file` int DEFAULT '0',
  `lastupdate_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastupdate_application` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_identity`,`id_attribute`),
  KEY `fk_identity_attribute_id_attribute` (`id_attribute`),
  KEY `ix_attribute_value` (`attribute_value`(50)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `identitystore_identity_attribute` WRITE;
/*!40000 ALTER TABLE `identitystore_identity_attribute` DISABLE KEYS */;
INSERT INTO `identitystore_identity_attribute` VALUES (1,1,'M',0,0,'2020-11-13 14:03:46',NULL),(1,2,'john.doe@gmail.com',0,0,'2020-11-13 14:03:46',NULL),(1,3,'11/10/1970',0,0,'2020-11-13 14:03:46',NULL),(1,4,'Paris',0,0,'2020-11-13 14:03:46',NULL),(1,5,'0623457896',0,0,'2020-11-13 14:03:46',NULL),(1,6,'0123457896',0,0,'2020-11-13 14:03:46',NULL),(1,7,'0123457896',0,0,'2020-11-13 14:03:46',NULL),(1,8,'Joe',0,0,'2020-11-13 14:03:46',NULL),(1,9,'Rue de Rennes',0,0,'2020-11-13 14:03:46',NULL),(1,10,'John',0,0,'2020-11-13 14:03:46',NULL),(1,11,'Doe',0,0,'2020-11-13 14:03:46',NULL),(1,12,'8',0,0,'2020-11-13 14:03:46',NULL),(1,13,'Bis',0,0,'2020-11-13 14:03:46',NULL),(1,14,'Rue de Rennes',0,0,'2020-11-13 14:03:46',NULL),(1,15,'Escalier B',0,0,'2020-11-13 14:03:46',NULL),(1,16,'Etage 4',0,0,'2020-11-13 14:03:46',NULL),(1,17,'75018',0,0,'2020-11-13 14:03:46',NULL),(1,18,'Paris',0,0,'2020-11-13 14:03:46',NULL);
/*!40000 ALTER TABLE `identitystore_identity_attribute` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `kibana_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kibana_dashboard` (
  `id_dashboard` int NOT NULL,
  `idkibanadashboard` varchar(255) NOT NULL DEFAULT '',
  `title` mediumtext NOT NULL,
  `dataSourceName` mediumtext,
  PRIMARY KEY (`id_dashboard`),
  UNIQUE KEY `idkibanadashboard` (`idkibanadashboard`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `kibana_dashboard` WRITE;
/*!40000 ALTER TABLE `kibana_dashboard` DISABLE KEYS */;
INSERT INTO `kibana_dashboard` VALUES (1,'77540810-5188-11eb-ab89-15cb0317af6a','Rendez-vous',NULL);
/*!40000 ALTER TABLE `kibana_dashboard` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mydashboard_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_configuration` (
  `my_dashboard_component_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_config` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `dashboard_order` int NOT NULL,
  `hide_dashboard` smallint NOT NULL,
  PRIMARY KEY (`my_dashboard_component_id`,`id_config`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mydashboard_configuration` WRITE;
/*!40000 ALTER TABLE `mydashboard_configuration` DISABLE KEYS */;
INSERT INTO `mydashboard_configuration` VALUES ('mydashboard.dashboardMyAppointments','2-260549',1,0),('mydashboard.myDashboardComponentMyDashboard','2-260549',2,0),('mydashboard.myDashboardComponentNickname','2-260549',3,0);
/*!40000 ALTER TABLE `mydashboard_configuration` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mydashboard_dashboard_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_dashboard_association` (
  `id_dashboard_association` int NOT NULL,
  `id_dashboard` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `id_panel` int NOT NULL DEFAULT '0',
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_dashboard_association`),
  KEY `fk_id_panel` (`id_panel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mydashboard_dashboard_association` WRITE;
/*!40000 ALTER TABLE `mydashboard_dashboard_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_dashboard_association` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mydashboard_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_panel` (
  `id_panel` int NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_default` smallint NOT NULL,
  PRIMARY KEY (`id_panel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mydashboard_panel` WRITE;
/*!40000 ALTER TABLE `mydashboard_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_panel` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mydashboard_portlet_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mydashboard_portlet_panel` (
  `id_portlet` int NOT NULL,
  `id_panel` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_portlet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mydashboard_portlet_panel` WRITE;
/*!40000 ALTER TABLE `mydashboard_portlet_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mydashboard_portlet_panel` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_attribute` WRITE;
/*!40000 ALTER TABLE `mylutece_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_attribute_field` WRITE;
/*!40000 ALTER TABLE `mylutece_attribute_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute_field` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mylutece_connections_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_connections_log` (
  `ip_address` varchar(63) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_connections_log` WRITE;
/*!40000 ALTER TABLE `mylutece_connections_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_connections_log` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mylutece_database_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_group` (
  `group_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `group_description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`group_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_database_group` WRITE;
/*!40000 ALTER TABLE `mylutece_database_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_group` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mylutece_database_group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_group_role` (
  `group_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `role_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_key`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_database_group_role` WRITE;
/*!40000 ALTER TABLE `mylutece_database_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_group_role` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mylutece_database_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_key` (
  `mylutece_database_user_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `mylutece_database_user_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`mylutece_database_user_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_database_key` WRITE;
/*!40000 ALTER TABLE `mylutece_database_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_key` ENABLE KEYS */;
UNLOCK TABLES;
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
  `last_login` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',
  PRIMARY KEY (`mylutece_database_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_database_user` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user` DISABLE KEYS */;
INSERT INTO `mylutece_database_user` VALUES (1,'laurent.hohl@gmail.com','PBKDF2WITHHMACSHA512:40000:d812ffa87cb979a45099c919f6acd64a:2030e46e70e0b731ee180047daafac227159a5e9b5e33c1d5ddc310e6e410e72777147f8088f4ff5323303db89aa44f8be67fc64565cd06820f18e6e8a2af6699af97c7f7f68a8c2013f33f69bd4c1c2db77ec06136381ab3d62d017f46601c2b1e2e49dcf1816c12e9b31075a2cd7e3447d1a5a98ab7ab7eebe61f8eb321a78','Laurent','HOHLA','laurent.hohl@gmail.com',1,0,NULL,1676652179713,0,'2022-02-22 17:42:59');
/*!40000 ALTER TABLE `mylutece_database_user` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mylutece_database_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_user_group` (
  `mylutece_database_user_id` int NOT NULL DEFAULT '0',
  `group_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mylutece_database_user_id`,`group_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_database_user_group` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_group` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mylutece_database_user_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_user_parameter` (
  `parameter_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parameter_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`parameter_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_database_user_parameter` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_parameter` DISABLE KEYS */;
INSERT INTO `mylutece_database_user_parameter` VALUES ('account_creation_validation_email','false'),('auto_login_after_validation_email','false'),('enable_jcaptcha','false'),('force_change_password_reinit',''),('password_minimum_length','8'),('password_format_upper_lower_case','false'),('password_format_numero','false'),('password_format_special_characters','false'),('password_duration',''),('password_history_size',''),('maximum_number_password_change',''),('tsw_size_password_change',''),('use_advanced_security_parameters','false'),('account_life_time','360'),('time_before_alert_account','30'),('nb_alert_account','2'),('time_between_alerts_account','10'),('access_failures_max','3'),('access_failures_interval','10'),('expired_alert_mail_sender','LUTECE'),('expired_alert_mail_subject','Votre compte a expiré'),('first_alert_mail_sender','LUTECE'),('first_alert_mail_subject','Votre compte va bientot expirer'),('other_alert_mail_sender','LUTECE'),('other_alert_mail_subject','Votre compte va bientot expirer'),('account_reactivated_mail_sender','LUTECE'),('account_reactivated_mail_subject','Votre compte a bien été réactivé'),('access_failures_captcha','1'),('unblock_user_mail_sender','LUTECE'),('unblock_user_mail_subject','Votre IP a été bloquée'),('enable_unblock_ip','false'),('notify_user_password_expired',''),('password_expired_mail_sender','LUTECE'),('password_expired_mail_subject','Votre mot de passe a expiré'),('mail_lost_password_sender','LUTECE'),('mail_lost_password_subject','Votre mot de passe a été réinitialisé'),('mail_password_encryption_changed_sender','LUTECE'),('mail_password_encryption_changed_subject','Votre mot de passe a été réinitialisé');
/*!40000 ALTER TABLE `mylutece_database_user_parameter` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `mylutece_database_user_password_history` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mylutece_database_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_database_user_role` (
  `mylutece_database_user_id` int NOT NULL DEFAULT '0',
  `role_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mylutece_database_user_id`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_database_user_role` WRITE;
/*!40000 ALTER TABLE `mylutece_database_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_role` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `mylutece_user_anonymize_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mylutece_user_anonymize_field` (
  `field_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `anonymize` smallint NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_user_anonymize_field` WRITE;
/*!40000 ALTER TABLE `mylutece_user_anonymize_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_user_anonymize_field` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `mylutece_user_field` WRITE;
/*!40000 ALTER TABLE `mylutece_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_user_field` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `notifyesirius_workflow_save_appointement_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifyesirius_workflow_save_appointement_created` (
  `id_take_appointment` int NOT NULL,
  `id_appointment` int NOT NULL,
  `id_workflow` int NOT NULL,
  `code_appointment_esirius` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_appointment`,`id_take_appointment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `notifyesirius_workflow_save_appointement_created` WRITE;
/*!40000 ALTER TABLE `notifyesirius_workflow_save_appointement_created` DISABLE KEYS */;
INSERT INTO `notifyesirius_workflow_save_appointement_created` VALUES (1,42,4,'99XZD8'),(2,47,4,'97SPNA'),(3,57,3,'94JGYM'),(4,58,3,'99NHZM'),(5,66,3,'95S7QY'),(6,71,3,'94DAGJ'),(7,73,3,'92MB2D'),(9,76,4,'93VPEH'),(10,77,3,'98JPVT'),(11,78,3,'99F3AQ'),(12,79,3,'95FBKQ'),(13,81,3,'96UB2Q'),(14,82,4,'96WCNS'),(15,89,3,'934XKW'),(16,90,4,'993Y8W'),(17,91,3,'95RYFW'),(18,92,3,'97EYMW'),(19,93,3,'98AYQW'),(20,96,3,'92EZCX'),(21,97,3,'99Q54Y'),(22,98,3,'93T55Y'),(23,99,3,'9265EY'),(24,100,3,'96W5JY'),(25,101,3,'92M5PY'),(26,117,3,'929588'),(27,118,4,'92FGH2'),(28,119,3,'92MNF2'),(29,125,3,'92FNK7'),(32,136,3,'928C38'),(33,143,3,'92UVW3'),(34,146,3,'92H7B3'),(35,148,3,'92G7C3'),(37,153,3,'92QAA3'),(38,154,3,'92PDZ3'),(39,163,3,'92SC75'),(40,171,3,'927CF5'),(41,173,3,'924CK5'),(42,174,3,'92CCK5'),(43,175,3,'92VDH5'),(44,177,3,'92YKF5'),(45,178,3,'92QJA5'),(47,180,3,'927P75'),(48,181,3,'92GPB5'),(50,186,3,'928TZ5'),(51,188,3,'92XTF5'),(54,194,3,'92JCV7'),(56,198,3,'92HF37'),(57,199,3,'92NFB7'),(58,200,3,'92TNK7'),(59,202,3,'92XNX7'),(60,204,3,'925NQ7'),(61,205,3,'92PNQ7'),(62,207,3,'922NS7'),(63,209,3,'92VNT7'),(65,213,3,'92JQ47'),(66,216,4,'92URW7'),(67,217,3,'92YBCD'),(68,218,3,'92YBRD'),(69,219,3,'92HC4D'),(70,220,3,'92JC4D'),(71,224,3,'925CQD'),(72,226,3,'92FNMD'),(73,228,3,'9295BE'),(74,231,3,'92ADNF'),(76,234,3,'92GP8F'),(78,236,3,'92GQDF'),(79,238,4,'92AS6F'),(80,239,3,'927X5F'),(81,240,3,'927A8H'),(82,241,3,'922W3H'),(83,242,7,'92BUJH'),(84,243,3,'92VRPH'),(85,244,3,'92DWPH'),(86,245,3,'922WQH'),(87,246,3,'92RWQH'),(88,249,3,'922WUH'),(89,257,3,'92EX5H'),(90,258,3,'92DX6H'),(91,259,3,'928X8H'),(92,261,3,'92ZXAH'),(93,268,3,'92MXFH'),(94,271,3,'925XQH'),(95,274,3,'92CAXJ'),(96,275,3,'927B3J'),(97,278,3,'92GBMJ'),(98,279,3,'92RBPJ'),(99,280,3,'92EC9J'),(100,281,3,'92UF6J'),(101,282,3,'923F7J'),(102,283,3,'92JGEJ'),(104,285,3,'92THVJ'),(105,286,3,'92KJQJ'),(106,287,3,'92HK2J'),(107,288,3,'92AK4J'),(108,289,3,'92JK5J'),(109,290,3,'925K7J'),(110,291,3,'929K9J'),(111,292,3,'92TZZJ'),(112,293,3,'923QGJ'),(113,294,3,'92WQHJ'),(114,295,3,'92YCVM'),(115,296,3,'92QY2T'),(116,297,3,'92Q3AQ'),(117,298,3,'927J8R'),(118,299,3,'92DJAR'),(119,300,3,'922JFR'),(120,301,3,'92EJHR'),(121,302,3,'92PJWR'),(122,303,3,'929JKR'),(123,304,3,'92MJKR'),(124,305,3,'92RJMR'),(125,307,3,'92RK4R'),(126,308,3,'924K7R'),(127,309,3,'92XKBR'),(128,310,3,'922KCR'),(129,311,3,'92UKFR'),(130,312,3,'92TKZR'),(131,313,3,'92ZKYR'),(132,315,3,'92VKWR'),(133,316,3,'92TKQR'),(134,317,3,'92RKSR'),(135,318,3,'92YKUR'),(136,320,3,'92JKYR'),(137,321,3,'92SYZR'),(138,322,3,'925P3R'),(139,323,3,'92FM3R'),(140,324,3,'922W5R'),(141,325,3,'92MZ6R'),(142,326,3,'92PH6R'),(143,327,3,'929N8R'),(144,328,3,'92KJ9R'),(145,329,3,'92MKBR'),(146,331,3,'927PGR'),(147,332,3,'92NVGR'),(148,333,3,'92TFHR'),(149,335,3,'92WUKR'),(150,336,3,'924JHR'),(151,338,3,'92YWPR'),(152,339,3,'92EMRR'),(153,340,3,'92EHSR'),(154,341,3,'92VHTR'),(155,342,3,'925FVR'),(156,343,3,'927GWR'),(157,347,3,'92TM4R'),(158,348,3,'928M3R'),(159,349,3,'92PM4R'),(166,362,3,'924HDT'),(167,363,3,'929JMT'),(171,368,3,'928FAV'),(172,373,3,'92JVVV'),(173,374,3,'92RXKV'),(174,377,3,'925RJX'),(175,378,3,'92VTXX'),(176,380,3,'92XVRX'),(177,381,3,'923WPX'),(178,382,3,'927XKX'),(179,384,3,'93WKNZ'),(180,386,3,'935P76'),(181,389,3,'933QH8'),(182,391,3,'93MUE8'),(183,393,3,'93W3Z9'),(184,396,3,'93SJTA'),(185,397,3,'93BP3A'),(186,398,3,'93RP4A'),(187,399,3,'93NPCA'),(188,400,3,'93NPEA'),(189,401,3,'938PMA'),(190,403,3,'93SPSA'),(191,404,3,'93RPTA'),(192,406,3,'93PQJA'),(193,407,3,'93HQHA'),(194,408,3,'939X9A'),(195,409,3,'93A5UB'),(196,410,3,'93F58B'),(197,413,3,'93Y5FB'),(198,415,3,'93N5HB'),(199,416,3,'93E5ZB'),(200,421,3,'93R5YB'),(201,422,3,'93762B'),(202,424,3,'93P6EB'),(203,425,3,'93P6GB'),(204,427,3,'93N6TB'),(205,428,3,'93JREB'),(206,429,4,'939KUC'),(207,430,3,'935VZC'),(208,431,3,'93DMQC'),(209,432,23,'93HNVC'),(210,433,3,'93HNYC'),(211,434,3,'93NR8C'),(212,435,3,'938XTC'),(213,436,3,'93WZND'),(214,437,3,'9385ZD'),(215,438,3,'93N8CD'),(216,439,3,'93Y7ED'),(217,440,3,'93H7FD'),(218,441,3,'9333HD'),(219,442,3,'9355JD'),(220,443,3,'93B4KD'),(221,444,3,'93H3VD'),(222,445,3,'93G8MD'),(223,447,3,'9347QD'),(224,448,3,'93D8RD'),(225,449,3,'93Z4TD'),(226,450,3,'93G7UD'),(227,451,3,'9345WD'),(228,452,3,'93F9XD'),(229,453,3,'9372ZD'),(230,454,3,'93K26D'),(231,455,3,'93V22D'),(232,456,3,'93D24D'),(233,458,3,'93D27D'),(234,459,3,'93S28D'),(235,460,3,'93K2AD'),(236,461,3,'93Y3JD'),(237,462,3,'9393JD'),(238,463,3,'93W3MD'),(239,465,3,'9393QD'),(240,468,3,'93W3UD'),(241,469,3,'93X3VD'),(242,470,3,'93B3XD'),(243,471,3,'93Q3YD'),(244,472,3,'93Y4ZD'),(245,473,3,'93G42D'),(246,475,3,'93B45D'),(247,476,3,'93G46D'),(248,477,3,'93M47D'),(249,479,3,'93Y49D'),(250,480,3,'93VCJE'),(251,481,3,'93SE8E'),(252,482,3,'93GP5E'),(253,483,3,'93RP2E'),(254,484,3,'93CP4E'),(255,485,3,'93KP6E'),(256,486,3,'93DP8E'),(257,487,3,'93SPAE'),(258,488,3,'93TPBE'),(259,489,3,'932PDE'),(260,490,3,'93FPEE'),(261,491,3,'93DPGE'),(262,492,3,'93VPHE'),(263,493,3,'93KPJE'),(264,494,3,'934PQE'),(265,495,3,'93JPME'),(266,497,3,'938PPE'),(267,500,3,'939PTE'),(268,501,3,'93KPUE'),(269,502,3,'93QPVE'),(270,504,3,'93RQZE'),(271,505,3,'937Q2E'),(272,506,3,'939Q3E'),(273,509,3,'93SQAE'),(274,510,3,'938QME'),(275,511,3,'93AQTE'),(276,512,3,'93ZR4E'),(277,513,3,'937R4E'),(278,514,3,'93BR5E'),(279,515,3,'93XR6E'),(280,518,3,'933Y4E'),(281,519,3,'93NZ9F'),(282,520,3,'939E5K'),(283,521,3,'93PV7K'),(284,522,3,'935Q9K'),(285,523,3,'93RKAK'),(286,524,3,'93ZJCK'),(287,525,3,'93KJDK'),(288,526,3,'93ZWGK'),(289,527,3,'93YNHK'),(290,529,3,'93DMKK'),(291,530,3,'93AAMK'),(292,531,3,'93TEXK'),(293,532,3,'939FQK'),(294,534,3,'93RTTK'),(295,536,3,'93EBYK'),(296,538,3,'93PM6K'),(297,541,3,'93YMBK'),(298,542,3,'93FMGK'),(299,543,3,'93RMHK'),(300,545,3,'93XMBK'),(301,546,3,'935MNK'),(302,547,3,'93MNZK'),(303,548,3,'93JN3K'),(304,549,3,'93AN7K'),(305,550,3,'93ANJK'),(306,551,3,'93DNGK'),(307,552,3,'93FNMK'),(308,553,3,'93QNNK'),(309,554,3,'93UNSK'),(310,555,3,'93YNPK'),(311,557,3,'93YNRK'),(312,558,3,'93DNTK'),(313,560,3,'93QYHK'),(314,561,3,'93YYBK'),(315,562,3,'932YKK'),(316,563,3,'933YMK'),(317,564,3,'93PYTK'),(318,566,3,'93AYRK'),(319,567,3,'93KYTK'),(320,569,3,'938YWK'),(321,571,3,'932Z4A'),(322,572,3,'93DZ7G'),(323,573,3,'935Z9A'),(324,574,3,'93TZAQ'),(325,575,3,'93WZDJ'),(326,576,3,'937ZFV'),(327,578,3,'933ZCG'),(328,579,3,'937ZKN'),(329,580,3,'93CZVV'),(330,581,3,'93JZMJ'),(331,582,3,'93ZZGM'),(332,583,3,'93SZPT'),(333,585,3,'935ZSX'),(334,586,3,'93AZTR'),(335,587,3,'93WZUN'),(336,594,3,'93A8MP'),(337,595,3,'93A9FT'),(338,597,3,'93QB7G'),(339,598,3,'936EBP'),(340,599,3,'933M9M'),(343,616,4,'93R9ZP'),(344,618,4,'93DA6P'),(345,619,4,'93QAVP'),(349,636,4,'93FAYT'),(348,637,4,'93FANT'),(350,638,4,'93YHHT'),(351,639,4,'93VYRT'),(353,641,4,'936UGY'),(355,643,4,'93KWSY'),(358,649,3,'94862Z'),(359,650,4,'94Q6CZ'),(360,661,4,'94PX76'),(363,666,4,'94Y2X2'),(364,667,4,'94U2Y2'),(365,668,5,'94C3J2'),(368,669,5,'9466H2'),(371,671,5,'9469F2'),(366,672,4,'9483Q2'),(367,673,4,'94P3M2'),(369,674,5,'9476H2'),(372,675,5,'9429F2'),(373,676,5,'94UCC2'),(370,680,4,'9486T2'),(374,683,4,'9484C4'),(375,684,4,'94AJ64'),(376,688,4,'94R7J6'),(377,689,4,'94K9K6'),(378,693,3,'94JY87'),(379,694,3,'94K2Z8'),(380,695,3,'94F3C8'),(381,696,4,'94MBVE'),(382,700,4,'94BG4E'),(383,701,4,'947GHE'),(384,707,4,'94ZKDG'),(385,709,4,'94W9TC'),(386,712,3,'94FX5J'),(387,718,4,'94P4XS'),(388,720,4,'956XM6'),(389,737,4,'973R5W'),(392,742,4,'98A499'),(393,744,4,'98RETF'),(394,750,3,'984TXT'),(395,751,3,'985TXB'),(396,770,4,'99F6RU'),(409,777,4,'99HMJS'),(411,778,4,'999MMS'),(416,780,4,'993MQS'),(415,782,4,'99ZMQS'),(414,784,4,'99KMPS'),(413,786,4,'99ZMPS'),(410,795,4,'99JMUS'),(417,797,4,'9A4MT3'),(418,799,3,'9ABUB3'),(420,800,5,'9AAVX3'),(419,802,3,'9AXV53'),(421,803,4,'9AAY23'),(422,806,4,'9AD2R4'),(423,807,4,'9AA2M4'),(424,809,4,'9AJMY5'),(425,811,4,'9A2NW5'),(426,813,4,'9AWS4J'),(427,814,3,'9AVT5J'),(428,815,4,'9ABJMX'),(429,816,4,'9AQUNX'),(430,817,4,'9AGV2X'),(431,818,3,'9BVHPZ'),(432,819,3,'9BCMYZ'),(433,820,3,'9BC2D3'),(434,821,3,'9BM2N2'),(435,822,3,'9BGKN2'),(436,823,3,'9BMKS2'),(437,824,3,'9BRYFA'),(438,825,4,'9BBS4C'),(439,826,4,'9B6S6C');
/*!40000 ALTER TABLE `notifyesirius_workflow_save_appointement_created` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `notifyesirius_workflow_task_take_appointement_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifyesirius_workflow_task_take_appointement_cf` (
  `id_task_take_appointment` int NOT NULL,
  `organization` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `group_of_site` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `site` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `service` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `entry_motif` int DEFAULT NULL,
  PRIMARY KEY (`id_task_take_appointment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `notifyesirius_workflow_task_take_appointement_cf` WRITE;
/*!40000 ALTER TABLE `notifyesirius_workflow_task_take_appointement_cf` DISABLE KEYS */;
INSERT INTO `notifyesirius_workflow_task_take_appointement_cf` VALUES (12,'','','site3','211','',5),(20,'','','site3','211','',NULL),(21,'','','site3','211','',NULL),(24,'','','site3','211','',NULL),(25,'','','site3','211','',NULL),(26,'','','site3','211','',5),(27,'','','site3','211','',5),(28,'','','site3','211','',5),(30,'','','site3','211','',5),(31,'','','site3','211','',5),(32,'','','site3','211','',5),(33,'','','site3','211','',5),(35,'','','site3','211','',NULL),(36,'','','site3','211','',NULL),(37,'','','site3','211','',NULL),(40,'','','site3','211','',5),(41,'','','site3','211','',NULL),(42,'','','site50','789','',5),(48,'','','site50','789','',NULL),(55,'','','site50','789','',NULL),(58,'','','site50','789','',NULL),(62,'','','site50','789','',NULL),(110,'','','site50','789','',5),(111,'','','site50','789','',5),(112,'','','site50','789','',5),(134,'','','1','1','',5),(135,'','','site38','400','',NULL),(137,'','','site38','400','',6),(138,'','','site38','400','',NULL),(139,'','','site38','400','',NULL),(163,'','','site50','789','',5),(164,'','','site50','789','',5),(165,'','','site50','789','',5),(166,'','','site50','789','',5),(173,'','','site50','789','',5),(174,'','','site50','789','',5),(242,'','','site50','789','',5),(252,'','','site50','789','',5),(253,'','','site50','789','',5),(255,'','','site50','789','',5),(257,'','','site50','789','',5),(258,'','','site50','789','',NULL),(259,'','','site50','789','',NULL),(260,'','','site50','789','',NULL),(262,'','','site50','789','',NULL),(271,'','','site50','789','',5),(313,'','','site50','789','',5),(316,'','','site3','211','',NULL),(317,'','','site3','211','',5),(319,'','','site3','211','',5),(322,'','','site3','211','',0),(324,'','','site3','211','',5),(330,'','','XXXXX','ZZ','',0),(332,'','','XXXXX','ZZ','',0),(334,'','','XXXXX','ZZ','',0),(335,'','','XXXXX','ZZ','',0),(336,'','','test','test','',1),(339,'','','site50','789','',0);
/*!40000 ALTER TABLE `notifyesirius_workflow_task_take_appointement_cf` ENABLE KEYS */;
UNLOCK TABLES;
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

LOCK TABLES `notifygru_alert_update_resource_state_queue` WRITE;
/*!40000 ALTER TABLE `notifygru_alert_update_resource_state_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifygru_alert_update_resource_state_queue` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `openamidentityclient_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `openamidentityclient_key` (
  `user_key` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `key_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_key`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `openamidentityclient_key` WRITE;
/*!40000 ALTER TABLE `openamidentityclient_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `openamidentityclient_key` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `profile_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `name_key` varchar(100) DEFAULT NULL,
  `description_key` varchar(100) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `action_permission` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `profile_action` WRITE;
/*!40000 ALTER TABLE `profile_action` DISABLE KEYS */;
INSERT INTO `profile_action` VALUES (1,'profiles.action.modify_profile.name','profiles.action.modify_profile.description','jsp/admin/plugins/profiles/ModifyProfile.jsp','edit','MODIFY_PROFILE'),(2,'profiles.action.delete_profile.name','profiles.action.delete_profile.description','jsp/admin/plugins/profiles/RemoveProfile.jsp','trash','DELETE_DELETE'),(3,'profiles.action.manage_users_assignment.name','profiles.action.manage_users_assignment.description','jsp/admin/plugins/profiles/AssignUsersProfile.jsp','user','MANAGE_USERS_ASSIGNMENT'),(4,'profiles.action.manage_rights_assignment.name','profiles.action.manage_rights_assignment.description','jsp/admin/plugins/profiles/AssignRightsProfile.jsp','lock','MANAGE_RIGHTS_ASSIGNMENT'),(5,'profiles.action.manage_roles_assignment.name','profiles.action.manage_roles_assignment.description','jsp/admin/plugins/profiles/AssignRolesProfile.jsp','th-list','MANAGE_ROLES_ASSIGNMENT'),(6,'profiles.action.manage_workgroups_assignment.name','profiles.action.manage_workgroups_assignment.description','jsp/admin/plugins/profiles/AssignWorkgroupsProfile.jsp','users','MANAGE_WORKGROUPS_ASSIGNMENT'),(7,'profiles.action.manage_view_assignment.name','profiles.action.manage_view_assignment.description','jsp/admin/plugins/profiles/AssignViewProfile.jsp','eye','MANAGE_VIEW_ASSIGNMENT');
/*!40000 ALTER TABLE `profile_action` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `profile_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_profile` (
  `profile_key` varchar(50) NOT NULL DEFAULT '',
  `profile_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `profile_profile` WRITE;
/*!40000 ALTER TABLE `profile_profile` DISABLE KEYS */;
INSERT INTO `profile_profile` VALUES ('AdministrateurMetier','Profil des administrateurs RdV - WF - messages - formulaire - gestion et planification'),('AgentGuichet','Profil d\'agents d\'acceuil permettant de g├⌐rer les RdV - prises - annulation et export'),('AgentMetier','Gestion et plannification des RdV'),('ChefDeService','Profil des Chefs de service, DGA, DGAS'),('ReferentLocal','Profil applicable pour les r├⌐f├⌐rents locaux'),('SRU','Profil applicable pour les administrateurs fonctionnels'),('Teleconseiller3975','Profil permettant de g├⌐rer les RdV - prises - annulation et export');
/*!40000 ALTER TABLE `profile_profile` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `profile_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_right` (
  `profile_key` varchar(50) NOT NULL DEFAULT '',
  `id_right` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`id_right`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `profile_right` WRITE;
/*!40000 ALTER TABLE `profile_right` DISABLE KEYS */;
INSERT INTO `profile_right` VALUES ('AdministrateurMetier','APPOINTMENT_COMMENT_MANAGEMENT'),('AdministrateurMetier','APPOINTMENT_FORM_MANAGEMENT'),('AdministrateurMetier','CORE_USERS_MANAGEMENT'),('AdministrateurMetier','KIBANA_MANAGEMENT'),('AdministrateurMetier','MATOMO_MANAGEMENT'),('AdministrateurMetier','MULTIVIEW_APPOINTMENT'),('AdministrateurMetier','VIEW_TEMP_FILES'),('AdministrateurMetier','WORKFLOW_MANAGEMENT'),('AgentGuichet','APPOINTMENT_FORM_MANAGEMENT'),('AgentGuichet','MULTIVIEW_APPOINTMENT'),('AgentGuichet','VIEW_TEMP_FILES'),('AgentMetier','APPOINTMENT_FORM_MANAGEMENT'),('AgentMetier','MULTIVIEW_APPOINTMENT'),('AgentMetier','VIEW_TEMP_FILES'),('ChefDeService','APPOINTMENT_COMMENT_MANAGEMENT'),('ChefDeService','APPOINTMENT_FORM_MANAGEMENT'),('ChefDeService','CORE_USERS_MANAGEMENT'),('ChefDeService','KIBANA_MANAGEMENT'),('ChefDeService','MATOMO_MANAGEMENT'),('ChefDeService','MULTIVIEW_APPOINTMENT'),('ChefDeService','VIEW_TEMP_FILES'),('ChefDeService','WORKFLOW_MANAGEMENT'),('ReferentLocal','APPOINTMENT_COMMENT_MANAGEMENT'),('ReferentLocal','APPOINTMENT_FORM_MANAGEMENT'),('ReferentLocal','CORE_MAILINGLISTS_MANAGEMENT'),('ReferentLocal','CORE_USERS_MANAGEMENT'),('ReferentLocal','KIBANA_MANAGEMENT'),('ReferentLocal','MATOMO_MANAGEMENT'),('ReferentLocal','MULTIVIEW_APPOINTMENT'),('ReferentLocal','RESOURCE_MANAGE_RESOURCES'),('ReferentLocal','VIEW_TEMP_FILES'),('ReferentLocal','WORKFLOW_MANAGEMENT'),('SRU','APPOINTMENT_CATEGORY_MANAGEMENT'),('SRU','APPOINTMENT_COMMENT_MANAGEMENT'),('SRU','APPOINTMENT_FORM_MANAGEMENT'),('SRU','CORE_MAILINGLISTS_MANAGEMENT'),('SRU','CORE_RBAC_MANAGEMENT'),('SRU','CORE_RIGHT_MANAGEMENT'),('SRU','CORE_USERS_MANAGEMENT'),('SRU','CORE_WORKGROUPS_MANAGEMENT'),('SRU','ELASTICDATA_MANAGEMENT'),('SRU','GFA_MANAGEMENT'),('SRU','HTMLPAGE_MANAGEMENT'),('SRU','KIBANA_MANAGEMENT'),('SRU','MATOMO_MANAGEMENT'),('SRU','MODULENOTIFYGRUMAPPINGMANAGER_MANAGEMENT'),('SRU','MULTIVIEW_APPOINTMENT'),('SRU','PROFILES_MANAGEMENT'),('SRU','PROFILES_VIEWS_MANAGEMENT'),('SRU','REGULAR_EXPRESSION_MANAGEMENT'),('SRU','RESOURCE_MANAGE_RESOURCES'),('SRU','SITELABELS_MANAGEMENT'),('SRU','VIEW_TEMP_FILES'),('SRU','WORKFLOW_MANAGEMENT'),('Teleconseiller3975','APPOINTMENT_FORM_MANAGEMENT'),('Teleconseiller3975','MULTIVIEW_APPOINTMENT');
/*!40000 ALTER TABLE `profile_right` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `profile_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_role` (
  `profile_key` varchar(50) NOT NULL DEFAULT '',
  `role_key` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`role_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `profile_role` WRITE;
/*!40000 ALTER TABLE `profile_role` DISABLE KEYS */;
INSERT INTO `profile_role` VALUES ('AdministrateurMetier','APP_OVERBOOK'),('AdministrateurMetier','COMMENT_ADD'),('AdministrateurMetier','COMMENT_MODERATE'),('AdministrateurMetier','CONSULTATION_KIBANA'),('AdministrateurMetier','kibana_dashboards_manager'),('AdministrateurMetier','LISTE_DIFF'),('AdministrateurMetier','LISTE_DIFF_ERREUR_GFA'),('AdministrateurMetier','rdv_agentAccueil'),('AdministrateurMetier','RDV_form'),('AdministrateurMetier','rdv_planificateur'),('AdministrateurMetier','workflow_manager'),('AgentGuichet','rdv_agentAccueil'),('AgentMetier','rdv_agentAccueil'),('AgentMetier','rdv_planificateur'),('ChefDeService','APP_OVERBOOK'),('ChefDeService','COMMENT_ADD'),('ChefDeService','COMMENT_MODERATE'),('ChefDeService','CONSULTATION_KIBANA'),('ChefDeService','LISTE_DIFF'),('ChefDeService','LISTE_DIFF_ERREUR_GFA'),('ChefDeService','rdv_agentAccueil'),('ChefDeService','RDV_form'),('ChefDeService','rdv_planificateur'),('ChefDeService','workflow_manager'),('ReferentLocal','APP_OVERBOOK'),('ReferentLocal','COMMENT_ADD'),('ReferentLocal','COMMENT_MODERATE'),('ReferentLocal','CONSULTATION_KIBANA'),('ReferentLocal','kibana_dashboards_manager'),('ReferentLocal','LISTE_DIFF'),('ReferentLocal','LISTE_DIFF_ERREUR_GFA'),('ReferentLocal','RDV_ADMIN'),('ReferentLocal','rdv_agentAccueil'),('ReferentLocal','RDV_form'),('ReferentLocal','rdv_planificateur'),('ReferentLocal','workflow_manager'),('SRU','APP_OVERBOOK'),('SRU','assign_roles'),('SRU','COMMENT_ADD'),('SRU','COMMENT_MODERATE'),('SRU','CONFIG_GFA'),('SRU','CONSULTATION_KIBANA'),('SRU','Gestion_utilisateurs_avancee'),('SRU','kibana_dashboards_manager'),('SRU','LISTE_DIFF'),('SRU','LISTE_DIFF_ERREUR_GFA'),('SRU','profiles_manager'),('SRU','RDV_ADMIN'),('SRU','rdv_agentAccueil'),('SRU','RDV_form'),('SRU','rdv_planificateur'),('SRU','workflow_manager'),('Teleconseiller3975','rdv_agentAccueil');
/*!40000 ALTER TABLE `profile_role` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `profile_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_user` (
  `profile_key` varchar(50) NOT NULL DEFAULT '',
  `id_user` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`profile_key`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `profile_user` WRITE;
/*!40000 ALTER TABLE `profile_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_user` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `profile_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view` (
  `view_key` varchar(50) NOT NULL DEFAULT '',
  `view_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`view_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `profile_view` WRITE;
/*!40000 ALTER TABLE `profile_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `profile_view_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `name_key` varchar(100) DEFAULT NULL,
  `description_key` varchar(100) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `action_permission` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `profile_view_action` WRITE;
/*!40000 ALTER TABLE `profile_view_action` DISABLE KEYS */;
INSERT INTO `profile_view_action` VALUES (1,'profiles.action.modify_view.name','profiles.action.modify_view.description','jsp/admin/plugins/profiles/ModifyView.jsp','edit','MODIFY_VIEW'),(2,'profiles.action.delete_view.name','profiles.action.delete_view.description','jsp/admin/plugins/profiles/RemoveView.jsp','trash','DELETE_VIEW'),(3,'profiles.action.manage_views_assignment.name','profiles.action.manage_views_assignment.description','jsp/admin/plugins/profiles/AssignProfilesView.jsp','user-tag','MANAGE_PROFILES_ASSIGNMENT'),(4,'profiles.action.manage_dashboards.name','profiles.action.manage_dashboards.description','jsp/admin/plugins/profiles/ManageDashboards.jsp','wrench','MANAGE_DASHBOARDS');
/*!40000 ALTER TABLE `profile_view_action` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `profile_view_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view_dashboard` (
  `view_key` varchar(50) NOT NULL DEFAULT '',
  `dashboard_name` varchar(100) NOT NULL,
  `dashboard_column` int NOT NULL,
  `dashboard_order` int NOT NULL,
  PRIMARY KEY (`view_key`,`dashboard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `profile_view_dashboard` WRITE;
/*!40000 ALTER TABLE `profile_view_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view_dashboard` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `profile_view_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_view_profile` (
  `view_key` varchar(50) NOT NULL DEFAULT '',
  `profile_key` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`view_key`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `profile_view_profile` WRITE;
/*!40000 ALTER TABLE `profile_view_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_view_profile` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `profile_workgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_workgroup` (
  `profile_key` varchar(50) NOT NULL DEFAULT '',
  `workgroup_key` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile_key`,`workgroup_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `profile_workgroup` WRITE;
/*!40000 ALTER TABLE `profile_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_workgroup` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `referencelist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencelist_item` (
  `id_reference_item` int NOT NULL AUTO_INCREMENT,
  `name` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `idreference` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_reference_item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `referencelist_item` WRITE;
/*!40000 ALTER TABLE `referencelist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencelist_item` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `referencelist_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencelist_reference` (
  `id_reference` int NOT NULL AUTO_INCREMENT,
  `name` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_reference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `referencelist_reference` WRITE;
/*!40000 ALTER TABLE `referencelist_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencelist_reference` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `referencelist_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referencelist_translation` (
  `id_translation` int NOT NULL AUTO_INCREMENT,
  `lang` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_reference_item` int NOT NULL,
  PRIMARY KEY (`id_translation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `referencelist_translation` WRITE;
/*!40000 ALTER TABLE `referencelist_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `referencelist_translation` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `regularexpression_regular_expression` WRITE;
/*!40000 ALTER TABLE `regularexpression_regular_expression` DISABLE KEYS */;
INSERT INTO `regularexpression_regular_expression` VALUES (1,'Fichier JPG','(image/jpeg)','image/jpeg','<p>Expression r&eacute;guli&egrave;re pour les fichiers de type jpeg.</p>','<p>Le format du fichier n\'est pas valide. Veuillez choisir une image de type jpeg.</p>'),(2,'Email','(^([a-zA-Z0-9]+(([\\.\\-\\_]?[a-zA-Z0-9]+)+)?)\\@(([a-zA-Z0-9]+[\\.\\-\\_])+[a-zA-Z]{2,4})$)|(^$)','admin@lutece.fr','Expression r├⌐guli├¿re pour les emails.','Le format de l\'email est incorrect.'),(3,'T├⌐l├⌐phone mobile','(^(06|07)[0-9]{8}$)','0602030405','<p>Format de num&eacute;ro de t&eacute;l&eacute;phone mobile</p>','<p>Le format de ce champ doit &ecirc;tre 0602030405</p>'),(4,'T├⌐l├⌐phone fixe','(^(01|02|03|04|05)[0-9]{8}$)','0102030405','<p>Format de num&eacute;ro de t&eacute;l&eacute;phone fixe</p>','<p>Le format de ce champ doit &ecirc;tre 0102030405</p>'),(5,'T├⌐l├⌐phone','(^(01|02|03|04|05|06|07)[0-9]{8}$)','0102030405','<p>Format de num&eacute;ro de t&eacute;l&eacute;phone (fixe ou mobile)</p>','<p>Le format de ce champ doit &ecirc;tre 0102030405</p>'),(6,'Tous fichiers images','(^(image|application)/(bmp|gif|jpeg|png|tiff|pdf)$)','image/jpeg','<p>Expression r&eacute;guli&egrave;re pour les fichiers de type image et pdf</p>','<p>Le format du fichier n\'est pas valide. Veuillez choisir un fichier de type image ou pdf. ex : image.png</p>');
/*!40000 ALTER TABLE `regularexpression_regular_expression` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `resource_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_resource` (
  `id_resource` int NOT NULL DEFAULT '0',
  `resource_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `resource_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_resource`),
  KEY `resource_resource_type_idx` (`resource_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resource_resource` WRITE;
/*!40000 ALTER TABLE `resource_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_resource` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `resource_resource_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_resource_type` (
  `resource_type_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `resource_type_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`resource_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `resource_resource_type` WRITE;
/*!40000 ALTER TABLE `resource_resource_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_resource_type` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `solr_facet_intersection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solr_facet_intersection` (
  `id_field1` int DEFAULT NULL,
  `id_field2` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `solr_facet_intersection` WRITE;
/*!40000 ALTER TABLE `solr_facet_intersection` DISABLE KEYS */;
/*!40000 ALTER TABLE `solr_facet_intersection` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `solr_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solr_fields` (
  `id_field` int NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_facet` tinyint(1) DEFAULT '0',
  `enable_facet` tinyint(1) DEFAULT '0',
  `is_sort` tinyint(1) DEFAULT '0',
  `enable_sort` tinyint(1) DEFAULT '0',
  `default_sort` tinyint(1) DEFAULT '0',
  `weight` float DEFAULT '0',
  `facet_mincount` int DEFAULT '1',
  `operator_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'OR',
  PRIMARY KEY (`id_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `solr_fields` WRITE;
/*!40000 ALTER TABLE `solr_fields` DISABLE KEYS */;
INSERT INTO `solr_fields` VALUES (1,'site','Site','Site',1,1,0,0,0,0,1,'OR'),(2,'type','Type','Type',1,1,0,0,0,0,1,'OR'),(3,'date','Date','Date',1,1,1,1,0,0,1,'OR'),(4,'score','Score','Score',0,0,1,1,1,0,1,'OR'),(5,'categorie','Categorie','Category',1,1,0,0,0,0,1,'OR'),(6,'title','title','Title',0,0,0,0,0,10,1,'AND'),(7,'content','content','Content',0,0,0,0,0,0.1,1,'AND'),(8,'summary','summary','Summary',0,0,0,0,0,1,1,'AND');
/*!40000 ALTER TABLE `solr_fields` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `solr_indexer_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solr_indexer_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `id_document` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_task` int NOT NULL DEFAULT '0',
  `type_ressource` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_portlet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `solr_indexer_action` WRITE;
/*!40000 ALTER TABLE `solr_indexer_action` DISABLE KEYS */;
INSERT INTO `solr_indexer_action` VALUES (1,'44',3,'APPOINTMENT_FORM',-1),(2,'45',3,'APPOINTMENT_FORM',-1);
/*!40000 ALTER TABLE `solr_indexer_action` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_action` WRITE;
/*!40000 ALTER TABLE `workflow_action` DISABLE KEYS */;
INSERT INTO `workflow_action` VALUES (236,'Validation automatique','Validation automatique',51,170,171,4,0,0,1,0),(237,'Annulation usager avant rappel','Annulation usager avant rappel',51,171,173,5,0,0,2,0),(238,'Annulation administration avant rappel avec motif','Annulation administration avant rappel avec motif',51,171,173,2,0,0,4,0),(239,'Annulation usager apr├¿s rappel','Annulation usager apr├¿s rappel',51,172,173,5,0,0,3,0),(240,'Annulation administration apr├¿s rappel avec motif','Annulation administration apr├¿s rappel avec motif',51,172,173,2,0,0,5,0),(241,'Pr├⌐sentation de l\'usager avant rappel','Pr├⌐sentation de l\'usager avant rappel',51,171,174,7,0,0,10,0),(242,'Pr├⌐sentation de l\'usager apr├¿s rappel','Pr├⌐sentation de l\'usager apr├¿s rappel',51,172,174,7,0,0,11,0),(243,'Non pr├⌐sentation de l\'usager avant rappel','Non pr├⌐sentation de l\'usager avant rappel',51,171,175,8,0,0,12,0),(244,'Non pr├⌐sentation de l\'usager apr├¿s rappel','Non pr├⌐sentation de l\'usager apr├¿s rappel',51,172,175,8,0,0,13,0),(245,'Modification des donn├⌐es du RdV avant rappel','Modification des donn├⌐es du RdV avant rappel',51,171,171,3,0,0,6,0),(246,'Modification des donn├⌐es du RdV apr├¿s rappel','Modification des donn├⌐es du RdV apr├¿s rappel',51,172,172,3,0,0,7,0),(247,'Report du rendez-vous avant rappel','Report du rendez-vous avant rappel',51,171,171,9,0,0,8,0),(248,'Report du rendez-vous apr├¿s rappel','Report du rendez-vous apr├¿s rappel',51,172,172,9,0,0,9,0),(249,'Action d\'arriver sur l\'&#233;tat Valid├⌐','',51,171,171,1,0,0,0,1);
/*!40000 ALTER TABLE `workflow_action` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_action_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_action_action` (
  `id_action` int NOT NULL DEFAULT '0',
  `id_linked_action` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`,`id_linked_action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_action_action` WRITE;
/*!40000 ALTER TABLE `workflow_action_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_action_action` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_appointment_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_appointment_reminder` (
  `id_task` int NOT NULL,
  `id_form` int NOT NULL,
  `rank` int NOT NULL,
  `time_to_alert` int NOT NULL,
  `email_notify` smallint NOT NULL,
  `sms_notify` smallint NOT NULL,
  `email_alert_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sms_alert_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `alert_subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_cc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_state_after` int NOT NULL,
  PRIMARY KEY (`id_task`,`id_form`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_appointment_reminder` WRITE;
/*!40000 ALTER TABLE `workflow_appointment_reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_appointment_reminder` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_assignment_history` WRITE;
/*!40000 ALTER TABLE `workflow_assignment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_assignment_history` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_icon` WRITE;
/*!40000 ALTER TABLE `workflow_icon` DISABLE KEYS */;
INSERT INTO `workflow_icon` VALUES (1,'Valider','image/png',_binary 'ëPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0╫⌐═╩\0\0╝PLTE   ²²²√√√ⁿⁿⁿ∙∙∙÷÷÷≤≤≤╥╥╥···δδδ╪╪╪╙╙╙▓╟█│││▒▒▒ù│╬Å«╩w¥└cÄ╢}}}O~¬GqÿNNN\r°°°⌡⌡⌡⌠⌠⌠±±±≡≡≡εεεφφφΩΩΩτττΓΓΓßßß╫Γ∞▐▐▐███╓╓╓╒╒╒╤╤╤╧╧╧┴╥Γ╬╬╬╦╦╦╩╩╩║═▀┼┼┼├├├»┼╧¡├╪⌐└╓ñ╜╒ú╝╘┤╡╡▓▓▓½½½⌐⌐⌐¿¿¿É¡╟ºººî¼╔ï½╔úúú₧₧₧¥¥¥¢¢¢}í┬ÖÖÖzƒ┴x¥┐v£┐ÆôôrÖ╜ÅÉÉfÉ╖bì╡_ï┤]è┤ÇÇÇYç▓Xå▒Wà░Uä░Tâ»yyywwwuuuN}⌐sssLyúnnnIt£Hs¢GrÜ[htGlìBjÅBiì___@fë]^^=bä<`üVY[<_~PZ`VVV5VtOOOKOR3Rn3Qk2Qm@LT:M^HHH<AC<?A)AX<<<1>I(=Q&<Q$:O\'9J&9I$7I,5;-01!2B&08,,,-=+:\'\'\'#(,%%%$$$(	╦S%\0\0\0tRNS\0@µ╪f\0\0\0√IDATx┌c`└ÿ░Ffló\\bb\ZîX$llìKx90┼\r∙E╗∙░Φÿ«Å)íU╩/┌fë┼UeΓæ║ÿ\Z¼│uè;yYß|V&ê\Z╞S?±Xu╕7╪ÆÜ┤Y└6√¢σ⌡Z╔┬5pV½╓;▓10░τÿ⌡σr#¼fvµ⌐±Æc╠r≡╬£Φ╞ëdºt╣╗gúOtOX{òæJ\05\n╡⌠¢ÑL\nTFq+Kz╝»½ü}Tm¬Σ[BBEÆ%R5╤é£╔«N$&«R╥I▌╧2i	∙z,▒ª╥U╪!Θóê%₧┘¢\'Gp│`ë:%v5ViÇæü\0\0╟K+∙; æ╓\0\0\0\0IEND«B`é',14,14),(2,'Refuser','image/png',_binary 'ëPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0╫⌐═╩\0\0CPLTE   ⁿⁿⁿ²²²√√√├L6···≈≈≈ΦΦΦ÷÷÷∙∙∙≥≥≥µµµ╛;\"║:\"±±±∞∞∞δδδααα▀▀▀╟╟╟┤┤┤;σσσΓΓΓßßß╘╘╘═══╩╩╩╔╔╔┼┼┼╛╛╛«««ÑÑÑúúúááá╦xhqqq╚N7╞M7─M6mmm└;\"┐;\"╜;\"___╝;\"╗;\"║;\"╣;$╖9\"\\\\\\▓8!WWWTTTû.NL<--°°°⌠⌠⌠≤≤≤εεεφφφΘΘΘτττπππ▄▄▄╫╫╫╓╓╓╙╙╙╨╨╨╧╧╧╞╞╞┴┴┴╣╣╣╕╕╕╢╢╢╡╡╡░░░¬¬¬ºººñññ▌ì}ƒƒƒ¥¥¥ÜÜÜÖÖÖ╤pöööôôôÅÅÅÄÄÄ┘p[╓o[═ra╠raèèè╩m[┴n^äääâââ╬fS╙cN╨_I~~~zzz░cTxxxvvv╔VA╬R:ttt┤[Jrrrnnn┬M6llljjj┬F/┬A)ccc¡F2╛?\'╜?(╜=%┬;\"╕>\'╜<$╢=&╣:\"┤:#╢9\"┤9\"░7 ¡6 ó:&í5!QQQÿ1û1Ö/ö0Æ/æ/Æ,é&é&>>>P3.;86e$F/*\\%50.W!B 9\";\Z&&&<N\rI$$$3A7\Z5.- ,.107%\Z&\Z/$(\n\"\r#%\n,!			V¢o\0\0\0tRNS\0@µ╪f\0\0sIDATx┌c`á.░æfcåqÿß1sτk░│A╪üK╚qAÑÿfådÜ¢r0┘╛kS¬7K≥1ü%ºeΣ½Yÿ\nq00╚.ì½4█Φ╟\r╤┬<¥ESK}F▒8¢αªxâIïTⁿíî┬δYxxXf║lInÿ▓╖L╤jWä5ï╢«▒Φ«£è╔;│éÑ`Ndê▓b╤╙7,*Φ█Wó ┼╧\nw/+{Ü%/»jδ╢⌐ß┬ⁿ╠H^ΣΣ6Z£▐╚╦kl⌐!iï∞w&┘\ræ5Må·zmV▒▄£H>√òk\'l-╒╒n╖ÄfG╪æ┤P┘áww¬æ(╨┘-kΣß«╩¢ô╪l╢\'[┴[eÖ║ûfτj.ê?ÿµ%╘⌡∞(Wöbù0▒P½∩X%\"⌡∙∞ë²¬öd°Y┘$L═U╗V	A╠bö[╛]\'╘╦h\'çÉ╬èu▌≥ΓPK╕▄Ed╪┴«Σ╦UvÇå#ƒÿ│=╘⌡l∞«nN6H╤╔c3│q░ΓK\071PδΩúΓ╘\0\0\0\0IEND«B`é',14,14),(3,'Commentaire','image/png',_binary 'ëPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0 \0\0\0 \0\0\0szz⌠\0\0\0gAMA\0\0┘▄▓┌\0\0xIDATx£┼ûMlΘ╟ ≤e╟─═ç¥Å\rdφ╕4┬ïú⌐!(@╘\"N8Jö{╪m├íjÑHæ╕QäáR7┘jÑ*=Çä*UèÉα┬\n@|Σ@Lêl╟▐åuL$\'1¼ëg<╢╟3≤>=ÉD┘¼╫v¬~ⁿÑ≈4∩╝╧∩y▐y■≤\0 g	òn▄┐≈Θ╙ºO≡<╧╦▓£╫4-≈ƒ\0+▌xΩ╘⌐┴æææ▀¼««Γφ█╖╔x<■M$ÖÖÖÖ	â┴┘H$≥m:¥~┐]\0«╠sßΩ╒½┐w:¥wuu²╩φvlAÇ$Iä╠σrH&ô╦±xⁿƒKKKQ╞ÿV∞l\"é$I\\ ìÄÄ~Y	`├∞∞lé╓T(H7╩¢&es9╩f│ö╦σ(ƒ╧SíPáJ511╪╚░Çπ▄╣s┐▐╡kW²╖H╔2ΣdlnÆ╙	NÆ@îüê└â«δe╟q0Msç╦σj\ràB!╛\\	x₧GN╙¥ÜéöLb~dz>▒║\Z ╟q█Zî1∞▄╣│vhhΦ≤╞╞╞v╛┐┐ ╚±π╟Y\néêP]Ws|ZK,}}\0cò\\aQqçp8ⁿ]$YÅ=:244t⌠╞ìI$Yûù╟╞╞╞\0Φδ┴½,X\Z\Z░:0\0çi┬¬δÇ Çπ╩}├┼â[,ä├ßÿ«δ	±╥ÑKWc▒ÿτΓ┼ïƒuttα■²√íµµµ╢±±±?-,,ñcE?∩Ωπ8≡ε╠4 φ\n\0└∞∞∞\0Y óσ`0ÿ¬¡¡=░g╧√▐╜{åa╪Ü¢¢█ê¿¬┐┐ n╖╗^Vd3Φ<ñ╙α%	*÷▒\r	é\0UU166v+ï=\0Φî▒àºOƒ╛NÑR₧╢╢╢]╜╜╜╒╘╘╪▀╜{W╖o▀>ƒ╙Θ┤=╛å$a■ï/P¥Nú╞∩x▄ZY+]Æ$!æH╨╡k╫FE∙f=à<┼^╜z⌡*\n┘¥Nτ▐₧₧₧╞εεnW>ƒ╖(╣£$╛≈╫_ce~m├├░UUü█vêóê`0ÿ\Z²3ÇΣµ\ZΩ\0ûg₧<yóX,ƒ╧τ½≤x<Æ¬(H¿*╥Ö╥ƒ|éƒ·|░è╗°åêó(Γ┘│g▒ëëë»\0d╢^\"ÉR%899ôe┘█╨╨╨Σ±x╨Φpá«│?≤√Q]U\"┌Vα═\0/_╛\\╝}√÷▀\0ΣïX╤u²∩w∩▐²Rûe<■]ç├nçE┴qx₧/[ε¡┴╫╡╣}K9a╬∩≈K╜╜╜≡z╜ÿ₧₧F4\Zà«δ0╫ZPÆñÆYo]¼êyò╝╚««.┐ ≡z╜░┘lÿÖÖü¬¬░Z¡ÿÜÜ┬ë\'αr╣`h═û7▄\nSLÑ\0D┐▀┐o²αªª&:tôôôä├ß@(┬└└\08\0╞╪2,R▒l6[δ⌠⌠⌠█T*EDDåaÉañ(\n]╛|ÖDQñ;v╨æ#GΦ╓¡[DDdÜ&iÜFÜªQ>ƒº▄┌/[UURUò2Ö▌╝y3\0á«$@ggg ╥╥K&ô▀0Môêêε▌╗G╗w∩&\0╘┌┌JW«\\!UUI╫u╥4m#°:@&ô!EQêêΦ·⌡δ╧\0╘ö8{÷∞o│┘,-//`3─¢7ohppÉ\0É╧τúL&Cî▒ì∞UU▌╪»i\ZÖªIÅ?╓ZZZ■\0└öH╬ƒ? Θ┴â╗s╣∞v;\0ⁿá╜ΩΩΩp≥ΣI°|>╘╓╓BÆ$477├j╡é1├0 è\"├\0cü@└8sµ╠WëDΓ»\0J╬ÅûçN¢ª╣Q╙4ï«═π┌úGÅΦ╬¥;ç)ƒ╧S*ò\"EQ(òJQ8ªßßßY\0{░i^ⁿ1p¿¬ZÅ╟╦~╢î1ÿª	₧τq°≡ßìÄ \"Φ║Äl6ï╣╣9HÆ├0\0µ±┴∞JΩ\'é kjj║ⁿΓ┼ï╒rC&cîL╙$]╫╔0\"\"Z]]Ñh4J<áH$BDD╟Ä√▌╓@?µ╙4$ô╔òBí≡i9┌═÷kÜ&╥Θ4^┐~ìt:ìÄÄ┤┤┤@ûeìFτ* \0Çò.ⁿ├n╖╖│b>║∙ QΣδδδk▄nwC{{{CgggM__¼V+\0`qq±╗x<>_)└║▐çBí?Γâiö╗7@ÇZ₧τ?r╣\\n»╫δ±∙|₧₧₧₧╢X,░▓⌡ÑφOòσ%\0É\0╪\0╪╘hÉ0@√o╙z╖*ΦÇ ⌐■M]<6┬H \0\0\0\0IEND«B`é',14,14),(4,'Validation','image/png',_binary 'ëPNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W∙ç\0\01IDAThü═ÜkÉ╒u╟≈▐ε₧╫╬╬╛w÷!¡VBáÆU(▓1╞	 Σâe\"l¿DN╔vBU╛Ñ╩ÄRñHê\r$╬ç`*αöc9E)■αI┘.î¿╪\"HHB╨2√▐ò÷9√£▌y÷╠∞╠⌠t>t╧>,ä^i}¬n▌₧¡¡;τ╬ ₧≤┐╖G≡{h┌┤╟ñ)ñ╝W!ô╩V▌\"\'ÄÑ╛Ü~	(σ╩ èìs≤Rô/╩\Zaï╫w╒φ▐²╔ª╗Θle&;╦ÿyæε─{$≥▒Iδé⌡Ñ°┐$╧α\0▒╒F;]▒è≤╖~i≈g┌>╟\\væ╖τ╬╦-α>╢o#d╘V\'½A■w⌐k)Xrú»ÿD▐U╖{≈\rƒα⌠╘[t┼z0ïRàQsè±╠$\r₧0█¬wƒ⌠ +Ph┐\0┤ ╨÷°⌡└S;1É&Ü¥F\n@Ç ä W╩3ùÅ▒┘zì╛¿<┌√ÇTΓà¢A\Z=ï}Hßx┐&║,█B\nüGy\0¬\0c├?╘o½╛u∩\rƒα╘⌠Y╫IΘD\0üpKìö)e█PÇ╪P\0₧5╪ΓΘ¢a>┐└tn)àπ╕X)Éò╧!#H┴╬Cæ9▄R║í{@╪Γ▀?│Θ│í░┐à▀╠┐ï)%R¬σgσ~╓ÑFì7─ⁿRö╥┤U)ú╓åe└≈C∩╛:_²Wε	∩c09L╛£GJΘFä╦íJZ-XÖ╩ì YⁿºÇ	6ÇΓΦ┴¡ç└å╛─Çδ╝├≈╡╬¬⌠\0!#╚{ïº╔d■+y2}HnÇ└ ?φ¬╗╜πû╨v▐ÿ>ì&BêK\"/ä@\"i¡\n5GXL─.Ä<9~X\0Rlà¬~Φ⌠Θ╛ºt<┬x&╩b!ÄT½ó/─ÜL┤°¢)┘Fâµ⌠ï│╧\0ï@╚÷M▀─BGh▀O╡ó\'╤ïÆMJ4%╤öBôjy«÷⌐6é⌠╞╧ôΩIK₧J\rs@\Z╖\n▌╘ÅT}í¡¬}∩=-≈╤ÅPJjH7┌B╕PR╤hf<=Bln62≥╠°Op\"ƒ\0Jò5o\ZÇΩú┴\ZG┐x╦!q&╠╔eεK▒╩yß╨\'∞m╞▓\\X∞3º_Ü{ç:@░+δ▐4\n	─3≈╢ε╡6╙ù∞Gô\nÑÜÆε╝2Ω=╡T{é╝{çD$u,q*9ä²½╬pô2Psñzƒ_|φüM√NcZöÆn│Z¢]Ω4°ΩI373╣°╠ΦRτªJ╛≡┼φçR0ûC)ö)cß╘L╣LÑF_=∙rÄü∙^3zd÷▓╘╣i\0Ω~\\sxKhδε¡í[85Ü⌐ⁿ4¬\"ä;█╬\\k╘bï2∩L┐E\"Æ8?ò╕,u.≡m:Qⁿ\ré=╪ Aü_pü ß√╠_nüu■HMº_<²∙╬Gëfú╠Σº╤òµPkÇxöAô»æ╔Σ≤3≤æíºG>ö:k|ç╟|║∩Ñ╜-ƒb[ΦV╥┼⌐bÆ▐D≈Câ■▐o±,╧± ,]⌐Σ╖∩j∙├P╨Σφ┘w\\τ▌ì[ RJZ}-öφµ═Φæ⌐+Rg∙;°√|║∩Ñ┐▐yÿ?j▐╟tfü∙l╩εj╕ÅG╖|╣║«⌐ß¢<╧╦@Gç_╤\ZÅ╓∩½⌡╫╪╫■)╥â∞%tM├╨4tÑú+\rCΘÜFâ╖₧j#Hd÷<±H≥╪Γ╔+Sºbè²ⁿτ_l ½Ä&_ÿπ\'ê/%1KY╥┼ΘbèZo-█½w-ì∩╠▌¥╜ì╫8Ä{#pYτ_«»B╝·τ╖¬QJ╤ò∞BS\Zzeh╬¼)\r»µÑ┼f4qæíæßH∩╫₧fÇyápÑ@I≈ε¬╗¥≤▒\ne╟»J7,┌%FSπΣ¡╡ )¡M¢┐ ╛╦i±áΦ\0⌠╦.j╦├{Ü>╓╤┌F$╒φ8»¡u▐p│╤Γô+ÜDó]µΣÅóWM¥è9{@@▓Ér Σè╪eQ%Φì≈SÑ╪U≈1öT;fÜ|Ñ\\, ë⌡+k╘═╞▓5 ╕qÅO≈=⌡`╟τ5GI[)7┌Nô╥Ñ≤¼ñó╓¿!hxm⌠M2=┘c\'πWM¥ò8║█\\╤ß┬⌐╘cÖqµs1&╠If▓s▄^;├╗o≤ⁿÖ±║∩o╜≈V╬H%_xáπ│Jg╪Fô\Z║R╦£»d└»{i≡╓╙7╫╟┬L,╥ ìí½¬:ù(ë─╧╙Y╜)╘▓_▓ûJ\\ WrNJRΓà8S┘╢Vogw°π¡╞.²┐½╛\Z╪[╤≥r≤c¥í╬╜m║â«T╢(/;┐zÜF│╖	s)Cw4bÄ_u*ª╕çΣ│Å~╝±.äñq&3S @)ºV+σö╜ó]ñhinó)÷─C▒╧{⌠i∩╧┤▒Y ∙┴█yï2ù7Ωè≤ÿZúû\Z#─δ^g·╘∞≈&ÄM╜L╗╤╖«╓y└»L▀¥┌╤ƒδ▌╣=╕!}ï p╒je╕:▌óD╛£º¡¬ì╓`¢g▐ÿ9áZΣ■√:■╕²#⌡╗8ù8Æ╡æ╫£ß╙╜4y¢ΦÖΘep`Φl≈▀⌡Åk¿:ù\0¢╫x5g╢zé▒;¬å:O\r⌐b\Z!ä² ⌡êÇÑr₧FmUφHM4>╪▒ƒ▒▄▒b∞ÆÆi╕s╪█L╢ÉσΣα)│≈Åπ┼I@ûká╬Z\0PΓ╫╝╣⌠æ\\2ê}║═╫A¥╖ût)ì┬ì╛t$░tOMRü╙2i⌠7╥Y│\r)}Θ^tÑ╓öNCs\ZW¡ºå\Z=─»çN0~|≥┘┘_╬┐Lß╨»ë:½αé(pÆ≤Ñ█ù╛┘√}a\Z}ìñïiñkó┐¼▌]`∙rÄáQ┼d~$ù╓}M#á∙h÷6Öεfáαl≈ô²/Γ≡>╞uPτ╖T@öxâ≤÷öôï╛┘√├╛6┬■0y+ç-∞UÉεµ\\æ╡Lù≈jy├j┌\nÉ░7Lf)├\'═₧»<^êú└,εßⁿzⁿ÷ë¼dK \\·╛5Vzó\'∙J÷[C¥°5▀▓fwDÿ≤\\╣=[Qù+sàj╡F-^σσ⌠╚µO─₧╧\\0ú8¢╓Σ:Tεj√ afÑ╥ Yτ╡Å¬d▄;â╖Öf3y+τû╓ò█âJg╒*æùkKª_≤╤Σió{║¢ü■┴│∩ C▀║Pτ├\0,â(£(₧╫wiIo∞╛│╤∞o&W╬üK\'═ò║╥╨ΣÑ\rKWè░7îY099x╩î|╜∩±┬Γ·Pºbv¿/┘Σ7S/g▀╩∞ì╜¢╔[Y╢7π╙╝╖;K!ùi%W\r%%╡z-^σß∞╚YµN─₧╧»u*v%moV■φÑ	mô:ù«ï?∞3ⁿ₧÷└&û╩yä░aªVΣqÑ≤·tç:╜n├Ω·√₧uÑ╬╒Xæ{+?il╓╧Öu╔çFòº¡¬▌ykBi╒pgM╤Γi![09sßî┘⌡Å╜ÅδJ¥kP1╦<¢¥⌠n±₧╦╓º«≥TyZ½┌(τva5ê:ú»≥rv⌠c»N<}eµwnXδ\0└Jƒ╔L·╢x╧ÖuÖç²z└╙\Zh├6eaí+à_w\ZV l/ú├cg▀}\"rC¿s╜\0\0¼╘Θ⌠ñï∩£Yò╝3α╘╖Zù┼^ú╖æT.┼√]µ{OFnu*v╜/║¡─¢╔I+i/m_·┤╘DCs L¡ºû|1╟√S∩1q<·l⌠òΘF¥è².oΩ¡∞┼\\▓£- ▓▄V∞êf\'┌Fì±┘╤╣┘╙s/v½ τ8*sü@¥è¡╟o%t 4░rφ▓─qj~Äu¬∙dδ⌡c\rτXi╕kZ8 \n▄@τäm»√╛║⌐÷ φ:vⁿ╖⌐º\0\0\0\0IEND«B`é',16,16),(5,'Refus','image/png',_binary 'ëPNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W∙ç\0\0╨IDAThü╜Ü{É[╒}╟?τ£½+i%k╡~¼vk│dy┌╕`¢üα╠c┌Γt\nªL;i:É╕/j╥!i¢8i3i╙iÿlf╥ÉPûÆi IΘ#0╝═LéÆ█Æ╞▒]cπ╡╜¼╫√╓ΩyÑ½√:²π^i╡█δ@{fε¼V║:τ√²=┐τ\\	▐à±tww┐Γ¡u?Rn▓Çh~«╡.zp0ÇßY▀ ßGffÄá▀Θ┌Γ▄╖£⌠G%▄æΩΘ╣0╙▀ÅÖ╔ÉX╜Ü└≤|┤F(à2Ω33╕σ2σ╖▀ª21q╩╤·Ñ╖=∩ß]∙ⁿ1└ y╔£7ügs╣[ⁿu2¢╜1╖u+Θ╛>▀╟₧₧╞)ò≡δu╫à êVH)æ╔$▒+H¼Zàî╟▒FGÖxπ\r*┼Γ╛Bⁿφ}SS╗≈|ë,¢└╙▌▌²åe√√▀▀╗m¬úâ╩╔ô8∙<║╤@7k=≈Wk┤n├╜çöÿ+WÆεδCK╔°k»15<ⁿ▌#Ä≤τƒ¥¥=\nx╦%▓,╧σrÄ%ô_║p√÷╬DOÑúG±\nt&║	l)α?âyñd<Nv├ΩÑú{≈VNW½ƒ┘9=²╨ ╠ôwFα∙\\εδΘ▐▐{▀s╟TGG▒Oƒ₧τ╛Φàä\0îdÆ╠å\rîε▌╦─°°3≈LNε\0,┬ⁿ8πPτ▀╜e╦╜δ╢og÷└▄ΘΘt,▓║n╝≡∩/$╕.⌡▒1V_q╔t·è½╒⌡/X╓w9G^£╤M≡½»╣å┬╧~6τM╦╖-«╡ªQ¡Γ╓δ╕ì^[N)1L├4ë┼π─ë╣E⌠╥╕d2I1ƒg\"ƒ~╟──á╠<▒$üτs╣ç║╖ly`⌡5╫0√╙ƒéδó¢Vox╡BüZíÇ╓\Z¼J£(·■q*\0q!RY)/╬H╣IGä:╥i:╥iäög$╤p]è∙<y╫²µNN>@8▀\"ï<ù╦▌╡ó╖≈┘╛█n¢g∙à±εXÑ╙º	éÇ1▀▀}─u≈<\\,╛Bÿ|6α┤-¿Ç°╟╗║n╜(╗9g∩RÆNºIªR¡9ÄR╡è]¡≥?ì╞G>ô╧ô0\'µ%÷</ΣrYòL»┐≈▐╬┘Cç*ò%┴δ @√>ºO¥:±≡⌠⌠g_¡╫ÅÑ╚J╡êD{sÇÿ@╟¥Θ⌠σ╖ºRƒεRj[<æá3ô	╜╤mdª\n╧½■]>├₧z²hd£╓ÿù─┐¥N?╢÷å«≤\ZìV┬.¡@:¥εè∙■╤öJ 	îà╚J6a≥╡_M╧╘Ä8╬─╖-δ┼M±x!ú⌡{▌F├L╞πí5x\"ªV╜n^nÜδ^┤¼∩▒á╝╢<▌▌▌ƒΩΩz╝≈û[¿><|	≡4 \n┴à⌐╘\r╫─bπ▀)__8∙CG₧qÇ·≈k╡²=J╜▒V⌐≈╙╤afr9╦BD.Çí₧∩é╦¡┐w─q&\"â╠\'≡;Θ⌠ù√n╜uSml▀▓┬R┘û░≤└GHDD.ùL■Ω╡ªYⁿ≈bq?╦∩óα╝n█º·π⌡╫²]c╒*:R⌐p²╢a(àe█¼5îU/à^¿7\rÑ î}#æ°╫▐m█░ååµΩ|╛Q.#òj╣╕	╛Yòät\'┐vm<^:O\Z≡÷┘÷Φ═ü£¥╜⌐kπFt⌐₧╫≥éÆ╟≤H└ÑC«√⌠╕τ\"/\"|╪▒f≤f*├├h▀ƒ>üτQ₧ÿ`btt*≡²Eα¢≈	!╕rσ╩ü┴/▄	t4τ^&ë╞╬╔╔/4┤■»▒²√╔l▄8/îÉ4Mä▄╜b┼ÇT╙°Æ≡å;:/╗gffQ▄╫\né αKôôƒ°╤Θ╙ƒ╫╛?|t_3▒»ΩΩ\Zx⌠τ#Qv▌O4J%¬σ2┌╢q&&pgf≡èEîFç^├╕X─Zbë─ì┬4├Ü┐@╪σ2E¡ε▒φƒyⁿ└ΣΣº┤▀╓O┌$é\0tú┴σA0≡σLµ|I1=╜»í⌡╛Θπ╟I≈≈âπ╘j°σ2óX─½T╚▒)≥Ç	 ƒ═σnI⌡÷b7uNS₧mπ{Gτe┬v>s ≡≡#ººw5Z╘δ4&&░▐zï┌╔ôx33l≡╝ü»tv₧/	»O╓ffP▌▌¿x)DxIIR)|╧π╛l÷z h}u║»ºX\\$┤\ZQ5xªZ²!aô¬╓╬ßß┴â∙ⁿ.ºPáz⌠(╓╨n>Å÷<ä!É└╛?≡p6{>$⌠1╫}!(\n─╗║┬═Éö!0òB·>kc▒\rCBt╔X┐^oüo*K»╤└\néC«¢\'lPa∙¬φ<05╡½tδéëìA0≡≈]]╦&1É╧O√Z▓½U╠6RJ)æÇ)D&\"áñÇ╬─¬Uh╫¥g}┤F√>ε≡&xÜ$>Z⌐╛eÜ╗ê,╘╛▌┐¿⌡└#+W.ùD\0╡\Z▒L&àÉÆÿBñÑëöRêMφÑ│]╫√₧G╤≈Åv╛àJ0\0jö╦â╟à╪,/ä@D\0«äüGV¡Z	)Q╔Σ<¿H/eö║ä░î\nI╗á[XòB\n6ªÑ$B\0╘ε»╒Oh╜δLαÑ(!╪,σ└ú½Wƒôä\0M4çj/ú≈⌠£8T╥╙·ÇP*ⁿá═·\Z ╚Jy±┘¼╒$qƒm╡ôh[P4I\0¢ò\Z°ç5k╬JB	qA\0₧7^JD⌠║FDφÖäa┤¼xò├ç±½UT╪4î│Y¼IΓÅj╡┴πA░½	╕>Z\\Jë!W╟bÅσrg&!D6▒b┌╢C≡J!Ñ!@)¡½äQß╦\0Jüτ!ë╨≥x╖\\Fx))/┌hÜ+9╟■╣IΓ≈-kp(┬£h#\"█╚Bp¡i|╡ºgëº.╕ ½α╩ÄLmYHÑPæσ@ü\rUó²åt┤▐_!╓┘ë÷<Jçß5%mú└oª╙┐B╪∙ûSAj┐W⌐┤<▒╝l≤─uë─└?÷÷╬#└]\ZXÖ╦í-k^°h¡qÑd─qÄEΣ╜SS»╘&&H«^Mσ╪1ⁿZm╬ô₧╛Oƒa▄D╪╛cτ ╨\"±íRip╚≈wë¿─╢└╖╜6ñdkG╟└╫╓«m\'±í▌▌ûàl4Bδ+BäeP)₧(B┤δôÇW»╫≈8à~d±}X╙e╜╬J├╕ß÷t·2ó÷╜\\≈\nâC₧╫\"1»2EaaJ╔⌡⌐╘└πδ╓φⁿBO╧/I╕qφ╞ì╕úú(!PQ∙Zúòb╓≈÷ñαI@7┤~⌐|Γk╫å╪█É(█¡╣;¥~É╣ä^╬Ç┌≤∙┴c₧╖½e²í$Ñ─Tè3Öü⌡±°╖Æ┘,k:;!ƒ\'f¿(ü]▀º&#«╗ùP╥4\0-╗εÑæ║6mÜAä╓─¬UVH╣σïk╓<\0ñ9à	╘>055°ûδεZ\\6+îRÿJqU&│v²╒W╙8räXä╓W\n≡╡╞æÆ)ò╛├£:ü<X(╠╦σoy╛O╝╗;,Wm$ömúç■X∞π≈g│█Ç$╦Ñë▀Üÿ<Θ√_o&u{5π▄4╥##05E▄4[	∞xÑ `─≤vw£iBaΘ╢\0■░τ²═╘ü¼╣■·≈Oÿ╒*╥≤╕⌐úπƒ ¼½k╦╧çë█O¥zαäτ=╫∞	J╬ù	åR╒*ΘxÑåR°AÇτ√öÑΣ⌐b±ä╟7¡3╙V(ⁿe> V▒\\~╩«╒H÷÷.åá5ëJàÄt:╜5Ö|Ω+a#Jr~ßd²╞█o∩r£τ█½S╗\\håìU█uÖ⌠<Ny▐ε=╡┌	áH█┘P{s╥▌Jφφ¡V áwδ╓xσ═7B@{-2==ÿ==q│\\▐~{:²▐╦π±²»╓δ│,∩v+⌡f╖a|pu<oüÄ≥┴ê^)⌐┘6E█f╠≈¡╧MM}¬α√ºü)┬^DÇ7\Z⌡_Ä┼N\'Ω⌡;│²²╪cc-═╦¢¥%▌┘I·ÆK≡JÑï{à°π█╥Θ╦▀ùN╟^¬VÅF ù$≤o\\p╫▌¥¥╗·b▒G¥X,▐╜u+F⌐ä\né9≡Q╒i8╦b╚╢y╣Rx╣Z²10A -a╣T\'₧╚σ╣h²·■≡0÷╪╪bë,±«.▓╫]G╒q╚ƒ8AúT!p╡▐π├┬S:$dñö¢l╙@▓│ô▄Ñù≥╜╜°\'O┬°8)╙lü7╟u)U*╡,~R½╜≡╔±±/úäº≤Äù\" ü╘╣▄7║│┘╗─°8┬╢hn≤Rδ╓æ┘╝GJjσ2ò╔I|╧ú:5@╢»t÷⌠░▓ºçñ∩πîîáºª0}3┴Fδⁿ╟¬╒8Z¡r╚╢wll∞s≡1╬u╕█6░Γ±\\εë╟╣3V¡Æj∩ªmÜσ0ûJæΦΘ┴\\╣ÆX6ïî╬q≡<t¡FP.ú+D╜Ä╥║╒ñÜûB╨p]l╟ßÿeq╕╤╪²▒▒▒ü╔ⁿ≥Ä╫É╚|5ù{(≈°σ2¥Ç╤V=┌	┤δ¥VU1MdΣ╥fl7½L{┼	é\0█u)7\Zî╕.o:╬ƒê0a╟9╦Ä│Id\r╕/Z╓«L&G╗╙Θk╛o·₧Glü▐_ÿΦ¡╜1≤╖Örü² áµ8öδuªça╫╡vW½ƒƒ₧~2▓|3i╧°£∞\\\Z_ε+⌡·aS╩∩_ÉJ]3═≈X₧ç∩√!0╬p\"1/▄\"G╕uìπPm4(║.3└Q╟yφkà┬_=W.∩ïÇO▓îç|╦φñÆ░≤v■iW╫»_Å Il±δuñδÆé╕R─ñ$╢á├6╜úà└╫Ü@k\\└éÜR╠┴┴Y╓?=Y,╛FX╣f╗φ╗≤ÿu┴╜a≈═▐₧N_qk*⌡ßUJ▌≤²£÷<Dá┤ni¥VêB)<)±ññ&─╘╕τφ√v╣ⁿ⌠½╡┌0aÿú½╬╗²á{ë∩─Çí2═lOÑ.╜6æ╪ÜQjmV⌐Kö+hCαjméαx╔≈╟≈╒δ ²ûuè╨┬U┬¡2≈Tτ µºg°«\"▄j╞#BëΦ X⌠Ys■µôùP█╤╒`εaα ╧Å=╬2Å$:½a>°µhÆ≡Ö;gz╟?╖∙_fl²<%6ñ\0\0\0\0IEND«B`é',16,16),(6,'Notification','image/png',_binary 'ëPNG\r\n\Z\n\0\0\0\rIHDR\0\0\00\0\0\00\0\0\0W∙ç\0\0╒IDATx£φÖ[o╟╟3│╗╝Ö%R╦ö%;û_R┴░╟A\núzyΦS?L?A^·≥╓º╛\n?╘@ ░╗Z┴╫(╢%è▒lJóhQñ─▌¥Ö<,IQ▓h9m*╦à■\0.vf╬∙∩∙ƒ3gvß\08└;\r▒╦⌡~àm ┘Γ░∩å ╓vⁿ▀B 8t▒█º@l┤/\0ΓJ⌐Oà┬IÑö╢╓ε╦P!¼╓ZòJÑo╡╓6!╓ZºP(£ⁿ·½¢ƒ%Æ)i-H╣┐8c╓us∙ú+┐ƒ¢¢√╗ºu▀\Zöû^Je2∙V=▌═aPÜû╘█0FïΘºU{<t9£uë{╓Z¼à╖ò█m█B6ⁿÉàj└ô∙¬5Fw<Ω╨6├▄bô╥bâ±ß$c╣Rnf⌡^±h█ô\"\"Q\\ZgεEìb#0h│9╢C@╔H≈«#┘hL╧¡2W^τtß∙î-╝╤Φ╢▒┤Ω≤á┤╞╦⌡Çä+ë╟\\ñ¿.æ;▌ôπ«\"µHÆ1xY°Γ▐2à\\£sπR1⌡?#▓)¿75wτV)-oÉè)rç<$áI▄U[µm!s1O\"RÉè┼⌐75≤K╠╛hp÷hÜ3ciñ┤≈Æ ûH≈:╞Xε╧╫╕W¼íöΣH.N*&1¼▒8₧└w╖\Z∞ÉR╢┬#@ëÄg}IçtΓσjô█3Uö╓°≡d?πâ	\0îì┤·ƒá{ε▄Γ:╖╛]am=d|(╔P6åáìE	@ÇÆ)RnjhKÄ Eº¡░D|\n∙â}Å\Zⁿσ╓s&åÆ|rzÇ■CεÅ&╥+¼¼|∙á┬l╣┴X.┴┼╔,1Wí╡┴╥≥ç(RÄ8█ll!áñ└æ█Eá\rk-qW15æíÉï≤∩┘U>┐^Σ╥ë,╜▀Åτ╚Äí^▓j▀ôⁿ╨≡╒├nW%¢r╣r▓ƒ\\┌#4cmñäms¥╢BzÉ¥╜J@EC[K>πq⌡gy₧╛hp≤╤\n▀<⌐≥ï⌐!╬ìº#-╖▓m╝σ@█÷▌bìδ *╙,ù&│NF\rNk╖uäxÑ!kw█;äW\"áñ└∞@áªEhr4┼▒ß$╖g¬ⁿ±ï\"∩ì$∙╒┼├êGπZ*à@°╛▓┴╡.≡°yâ≤╟√╣4Ö┼QéP[L╦~/X╗Θ▀Ä$tÆx7▌·íír1Ü!ⁿß╧Å∙°²~saêd½∞6ÜÜ┐▐)sπaà#╔hl┤ñ\"1f≈j╓╢\'Ñá╗╫yc	┴ªîα║Æ∙┼:7∩/æN╣ⁿ≥┬a╥Iù√┼\Z╫╛)s≤Qà▀}<\n└ƒn<├UÆ▀~8┬ÖúijìÇ/∩/rφ÷3«£╔36ÿ\"Lgφ¥·∙7ÆÉ≤Ü$Ä▒(%▒╓2²dàÖg½£∩π∞DkAçå⌐ëºFSⁿπε2ƒ_/p⌡â<??ù#ε)6|M:ß≥δïú▄¢¡rδ╤+5ƒ&▓!╨┌⌠░╜Θ_O╜s jΩ<╫au▌τ╬╠2δ~╚╒⌐F▓	ⁿ╨Ç╡8JΓç╫ë₧÷╘▒\0âI\Z╛╞\rNδÇαⁿ{╬%╕3│─ì√>&sd~¿[Æ┌⌠a╫@F╔╓-í(£ü─Qé╥R¥{│+ñc|rv╧uBìö É╤₧ü└b⌐√ÜB.┌∞Ω╛F\npòl╔$\Zh├HÆO╧Å2²ñ┬╫╩£¥ΦºÉOj█▓-6½ÿH!áW/ñd⌠32J*╕Ró╡σßⁿ\n╧+\r╬LdJúì┼âúv╩>ü\"┌E▄c\0î1x«Γ≥Θ!µ╩5╛√╛╩┌║╧╔#YöÆä╞\";`K#╖à└÷*ä╕J▓┌≡y4_┴Z╕|zÿL╥#╨&¬╫;:÷πaëJε±æ∙L£ç┼\n╙O956╨▒╟¢Tíh\0(%PRR«╘)╛X%ƒI0q╕)ú$█₧H?î1⌠Ñ<.¥\Zfvß%3┼eÄg\ZHíìë|{}CLü`■yò╒║╧díƒ|6╤╤ñ│=å?)ó▄PRpΩh?K╒8Ñ≥*M?α╚`åÿzìä\0\\G▒▐).,úç3╟≥─=ç╨ÿ╓─╜8.GÑ├X╦PÆL╩úT~IqaÖ±╤«╙π<áöΓe¡⌡É\\_Æⁿ@\ZAñMGε⌡9┐▌	[1çc9û*5+50Mö┌$╤!~│╔╤▒A╝«SÅ|ïoδDïê\0╥°üª8_\"é╬ÿ.	IsY<Wa╠╬╗ß█ä╡╧Uµ▓tK╣KB┬║nt^ô{.Ö▌╤~á«δ\nÑDº]jZkU¡V╡╓┌Zk≈eä╘j5ú╡V┤σ¥7·≤v:║│╧d╙╜╛∞t╜_▒▀UrÇα\0╪#ⁿ\0æ$╫i╔8T▒\0\0\0\0IEND«B`é',16,16),(7,'Honorer','image/png',_binary 'ëPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0¬iq▐\0\0zTXtRaw profile type exif\0\0x┌¡¢irΣ╕Æä πsbÄâ╒ln0╟ƒ╧ªñ¬Ωnδ76ÑnÑÆdÆ@,εñY ≤▀█ⁿ r	╬äÿK¬)=ⁿ5T╫°ú<≈▀}╡O8┐╧┐≡₧Γ²/╟═╫	╟!╧½┐o╙z»oÅ▀╚∩l ⌡╕╔π╜Oyo⌠₧°▄╨δ╔Ä?µ;╚≈F▐▌π÷}o¬╗┤⌠c:∩ ²²≡y≥≤τ√É1╞î▄╧;πû╖■╣┐∩ô╝■╖╛±zº┐⌠╖≤₧▀▐º?φg╛L≈ⁿ·δ7√=π=ε┐═qo⌠ÖV·═N∩q ┌~╟J?Gd▌╫ô▌╧òjτ≤≤▀√φ=╦▐δ╬«àd0Wz\'⌡Ö╩∙ï;µ⌠τcëƒ╠ æ┐≤∙⌐ⁿöº=»Mª┌═╙yS¡├╓█;m│█«≤:∞`ê┴-ùyunα+>╗Ω╞qF╨Å▌._²⌠<τ9∞╛╞b╧s½₧╟├\nO₧û+¥σfûOⁿ≥c~?≡²∙σF{+╠¡}╩ù¡ùS╚2yN┐╣\nç╪²┌4√Zs_₧▀ ╔▒╞cµ┬█╙∩-z┤▀▒σÅƒ²\rùå7Ñm₧∩\r0╧Äåê÷I╓G¢∞ô¥╦╓b╟é\Z#wä}╟6ÜΦ&útü╕╟9┼Θ┘|&█s¡ïε^pD⌠╔g\\S}├Y!─É╚╖B5}1╞s,▒╞û|\n)ªörN╡∞s╚1º£s╔5╖ΓK(▒ñÆK)╡┤Ω¬╞ó⌐⌐µZj¡¡±╨\Z≈j\\▀8╨]≈=⌠╪S╧╜⌠┌█ |FqñæGu┤Θªƒ@ÇÖiµYf¥m┘E(¡░ΓJ+»▓Ωj¢X█~çw┌yù]w√≥┌δ╒_╜÷╗τ■┘k÷⌡Ü;Ä╥u∙█k╬∙s+8ë≥s┴Γ±,╨N>{è\r┴╔s≥┘S¥7▐G╟(ú£3¡<å├▓.n√σ╗o╧²¡▀╓²O²µ■╩sF«√ ≡£æδ~xεO┐²à╫f;pδÅâöà╪ä⌠ñ¼╥\\i¬K╛2ñ└s√εaÅ╡τ╬5≥┤	B╬Y╟╩sÿ▄óczXi■îkñ4m▄¬┴└ö╝■öH⌡╜\\≥;ì▌#╞Γ≡úYv╬Σl2O╔╛╬╣╖░qà╞l▐V░╬Ö3εα9åC≥Åçµ═ò╣┌╝AL▌╥∞V╧tA~:╛k╧.9▀üw╗S╒±╨░╘`T\\9vZs÷║│_¡σ≥¿ås8be,HQΦ1à╨█┌╡₧τä4ÿ╠<╤º¬ì▌rQs+ΓuÇp╗╘ôo╤╕8:ªaσ@+╡Ñ┘±úo+p]▀>º=jLô¢,ƒ╔Æ ¡R╓¿mwc╧`⌡D╗Z▓3⌠sñ▀#ƒæ8ó]╙ÅRv¢~ì)1t~ta┤╔τ#m*}╜\'<\'rδe\0iQo\"ª(kY:+ú╡╗≡╠8lî╡ñ┼ì\Z■r	╗φαZ)╜,W34 ~,▐τNio∞M0╚╜╟φ;º5ûƒ<╙φl>ε√╙{Σ:÷!εpäφ■x/φ;■╪÷ôÜ_▄m╧Ö╝▌f╝wWûO╠πô#╗╪┘â╖ô└╞AyΓ£½\n╓8#│├Ω└²1ç3ë,┬╝$▒X┴\Z}%ⁿ╫ƒφq╒┬±ï╥ (4Vƒ\nLáDOn*XOÉ°ÖL╦è╫H╝é7^╟\"xS_╜┬6°Syx╡+τ┌ëàΓ┤¼▄x$░Vë*┌*╥Sxb≥2└P !à┐Ryò▒╔yΓ/cr≡$ ô╛M}ƒy»(δ<ƒpJee╧pxn└i≤á┌£½═585éIN╒╥3▌:╙å╖∞₧«w\nwèr■«┘ôH▀═╓º@░bb╖φH╨Ü╡πα╓⌐u░î╝kr#╟}Ω╓û╓Çα╣ª%ñ╔YΩ6ë\0âÿF╞)Γ∩çùv╣æ<To4à4&\'╫╫Mê╨\Zƒ¡»=1s▐UXB0 ┘ô▄5▓Φ≈?┐╞	v∩▌²:ü╚π╦√xRd¢╤3ε3\nLJⁿαè~ªF┘q$\"ôH%ª\Z┬┬#Ñ╒^Ü\ZUsô\"IÖ:zσ│2cï┌╪╢ï╪Iä0ëG$┼ΘEá╝q╘░ª_Ä╣2╙=■ÇtXóB⌐oöXní(▒▐∩■Φßä3Iü╚▀\'@0g╞öå!τ║PlS·¬∙ΘÑ)RZ;╣Y2≡[╩TΦñu\r╕═64▀╞ñn$=°\ZP9▓0÷╗r∞ƒòúR9~ôí╤Æ└Y !&FM┴¿-┴÷Ä╕≤bZ╗@δ¿e;∞╬_,¡╔X\0çΦ%·±s[≥UK¬═≥≥▄U(\0Ä╨sLyj└⌐e)wQ▒┴oN╨UjΩΓÖ⌐ΣIAFMºn+≈≡Píº])\r¬ïº¡σ╒F?╖Å╤4ÑqeáƒΘä±,±╥·7╣HÆ8¬╥╩G@lmgTç∙¢p»⌡╬vû!∞d:}\nò▓#Ç)½ë»¢&PJ∙║ªq╙╪╞!~┼<δàÅ║xH╠╒åk$*àm9N<DN╛«	¼ƒúk{°Åß&|l╪IY╞ºM╤µbîÆΓ«@╞╔1H	ç|├╕ΩI(@┬tr,ûMLsèv!n∙!fö▀]uGP?Ñ╗▐+Ω║╣Yÿ╚ò╠ª■╫2┐r╬o¼\rè3ar¬ÜH\nqσ`Ç1Ä░\'íVsY▄÷┤\r¿ZêêFLFΦPNo¬²╬ΓR▄r█t&⌡ï@\0╡!¼g┴═╕rJa_≥dK¿b¢ª[¬Hx2\0f▌╬MI&@¼∩╧⌠ëd░│a!ÿΓ»Ω╒╘  ├$xºä=σS±8S╓ªû÷═╖~├╒*\\g	≥hU}≈3ò4dæ\n∙⌡ΓWT└<-\0eè*╙)║`]z~╘▄·úµ«▀jε&ó2\\	JO╛çÉûr¡C╚ß<¿k2~[F≈╓G▀╛╥b⌡■ü╡Z╞^º\\∩ÉêY╜Éá&╗¿f21±d╔Ω	ìwaVå»P$T\0mQ╗ë8≥┼étS(î√34(Ä╓┴φ╩τ╥Ç⌡qƒΣ&Σ+ô\n±Θ╢√#πδÿ╕ö╤*╫╗⌐[=φLBR÷ñ■▀╜┌1σUX∞8N╪2%ÿç»└h|N╡■	∩╬╒}3╕e2╗¢hpσ#αªZ/▒ü∙╖\r[⌐{£╛aα╕é╫vC(Nâè═╘DTeMª═(-sº»=êæ╠X( ≥ä⌡ÆùÉèb59ÿ?µ@æ▒SejzD,░~PPΣv$ä2Γî`╦W!,ÿ4x┬/è▐╟∙½è½~#{$┘TNY(ç╤╜ad═ú${¥:(*∞╙]π≈¥ë»#Ç@≥÷ÿ(bÜô\Z╩î_ó÷π\\╘t▀S;Ñ1P\rTöyΣΣF÷+⌐Fâ¼ⁿQï╞ì@P┬ ·QëÇ█@d╔D\"Γipzb$B\0>ä]ìó]░▓kLτP╧─╬¼Pò²ûΓ	╦E├a√¢ç+∙πΣt<äKxJíé⌠v&u├ñ╨1Üâ»eFÖûZ├g&Φxù╠N┴>V⌐XE\\Æ(▓½╕▌håé■Gαâcvÿá╘h{╝▀≥Vⁿ≤m⌠?^═τÅ·╘úïd╠╢áiIt├CT¢╫¡xèÑM▐Æåα₧╧√╬▄╖╓RδKlÖ│█╖≡1Γ»Édô─C&ü║╠╟Θ\Z╬íEp3ⁿ½▄¼≥╦0ní┬¥(¼G┴R::7DL╖╘*4▀fC░╧Uªïí⌐Å╥NÆC<@!7C#,É¼ÿ\\≤^H\\ÿ╪┴≈ ╦Pƒ!Y°\"élO7mYR║ªS■q[\ZαÇ`¼≥åWDα#x╫\Zì8RgB	≥ul╧°ò Θù∙╝8$jU?ü╔:qUæ*|ó£(╥ëScºRS║2*V@EÜÅ▄╥å*îòzK7\\╙╞å▌ä⌡Ñ╔αCx	¼7RÑ┤ê÷$¡WL╨╥1ê┤ΦªúHè\nεòô\"N£┬∙ m2Ω┤t╩╪ èáÜ┐b¿h*i}0⌐ïl╬╜bûbµÅ\0a╛0¬Xé╕ÿ&ò«F╥á$√ⁿ[╞╢τ± J²aå9u#8j■µ¿ñë»╛;╦kÆñ#q6¿πà¿╖╔ü«╕²iÉ,ΘPæu²ìhw#z╝\r∙r½ïR≥I╥ï7LëPñ╢m)%b1ê8ÜÇΓN?)πÄ^¼e┘ⁿL╤x_úσE\Z╓≡É╡α\Znεª¢┬»\0▒┤╤£lº╬è·\\│≡ÿôXε:Nù!0:4W±²W┤}╧╕ó{ëîGä▀ü\"ºt┤?╛ ░óé$╡\"iÅ≤·yG▐⌠─╘\0\r¢τ÷╘N\rbÇ<¬\0└÷╞8P5τ\Z▐ d¥δñ\Z*IΓ·½⌐¿kA╤╤G╒╓┐-∙ÇF░╝rYáé;±S!·╖7j╜SYæê╠N╜│>IÖ^⌡ƒo\rQ┼┤»Fé\Z\r√Ñæ╚!ÿ╤0D?Σ( $Gü5c!:rX\0]▄%√╟ómcⁿ≥╞▌M[╘	»{2Là╠╤─m┘Γáö`\0╖£├!#≤\0╠\Z?¿e┼7l█\n_╠▀à≡X⌠αnM┴I╣¢┬2qKDv╔ë	└╕└T|╧ïRÅ║╦#ÖpéA·>°-à\0è9σ9*¥▐!┬≥K	GΦ┬≡&├)╫ÆBíΣ]^√≈A╝S2╝4½¢▒wåδT(╛ì▓dê▄Bu£@IPHá▐│óXñP√é\0eÄ%Iö╬C\\E&êk▀ìÜ╦w*¿└≈Sé¡\Zt\\⌐n1Ö7b|Ñîë∙Ñj2[K∙ügn≥▄P è·Ä\\ßφìß%│>âV▐\':x╨π\rU█?Äπ╒╦╙½]£_5╝o∩;<▒ú╓╟`ü°ΣV╔L∙=6⌐0ÄÉ╓ú²sb▌î█<£eåíë:<╚êD┬F«╩∩X╒▒▄╪äéÜ&┬≤hïΩïAæ░╖ò:Å╢U ±>╗T┬C7╕┴C\rFxöéC₧=]?T÷Vc$£w╘¥ÄW@ΓBI\rüníßæ╕Æ┘[*º╓·Hbæ∩¿f▌)åÉèHë▐▄½Γ─ ?¥òαßì▄\'É╜ªb;à╛│C▌É┬╪\ZÖ┼²j%▐ö`┴σ╛└ú┴R┬╘».╡P╬T(╠└u	1)Φ<┬n>åéÅ║ε\"~Γ╢,ºI\"P@hÆiÆ▐╚	&╫Ω$zbZ/ïú╬äôÖ╚u>A~ççcZ╠à▒╗╙A;f5j╜¿U╤oδ~&d\rX└bä+j\0u½8▓7)≈╝v·J╩(ÿb\nΘóc$*`┘■▓\\EÑ╤rm¡┘í_(C[Ç┐ ₧I⌐∞Kè7|⌐σ■ΘQçu{(û╗┤>ç╤9sÄƒN5y╔╚D¼g\0ow\r√Æî\Zè┬⌐⌐╣7~=├ÿ\r3»T╥φá@┼9pƒKΦαúªe\rnì▄ò\'Z½⌠g>L°▒Xv¢ópzè{9∞Θ{Lä√m9║⌐╒╘L√\'aIÉ├>n\n?╒gC ƒ₧∞8t╖₧5ë|;«Yí╓1D▓nPF7°û=¼Ω\n°í½║¿≤^z\r╢1%kP¿°x_~«╤₧b$½(K.(ª¡╚╞í]\0#¼àô²\0╙iq@éíh┴¡>ô¿½ª╝≥╗ΦC╡Pºé≈/╝.uùd±rl$┘\n2cs`_¡φºYR±╛}).╡φ∩δì╣É	┴äC╝D⌡T½L█/æ|]mù╛öαL÷8σ≈û\"╥Tå╣rR¢─_öü█UGìUç√-&+rW%▀∙σ:â\nVÆtH3─aH└[M─àn`å\rJöI. ╟Γ#▒ûHn┴▄αÑVΘ)y/¥─ö∞╣x!╥\Z║ó5┬-Γs╤┬$\\	aMδæ╕&╤╚m≡I\r;?íGφINR⌠v┤R╚`PLƒ┤1╝╤6	╒@ngσY╨ì»L`\\f½▒HεpüTA·⌡4╓ª¼æîφ∙┤KQ8\"ï₧≈[{╫¡!╨K?rîP=╙ó	à±ä╗▓N1èNéεwI^XQ¿ß.QO#╒ÇP\'_\"└ß	ΓÖZN┴░ñ≥°╘■q7?,╥0÷GÑéçW9╡■8qSì░.æ╒╗⌠ó5èï║▓Σr¥║Cq╜!v2\"┬╠√¢\rd╛┐ÖP\0╨8üâ╪⌐ën5⌡╨ß\Z\0£A£H$T(g«£ªa>$\r*│¥ºï▀■>I│PÖAr\0┴IIαΩçJ¢Vô╩|z∩.b>H▀@╫|lEΣ┤^╜t&⌡φ\0ƒvt┤╨%Gì3T	°r╛⌠zΓ╘]ZEô ≡?▐P}╣└d\\ü─çïá£R╛h9CH)╞î■8²}6CS╩╫≥@1┤⌠.ÖÜz╘w╔	+vΓïñ┬è╪╝½%SIs\'C╪▄vdl▀╠Σ]â!	ó·≈MÅ┐|⌡;ΓC±⌡Kî$│ⁿi½Hxa╨φ`▀n╣▒╛╜*αpΣ«└(·╠ε█Fçα1|ÆS+ü⌐▀\\\\π|Lsªd┼*wEM╜Ö\"f¼E^â╠Θ╖╣ºf¥{½Yτ╒.╘jWM½⌠G\r^Σ╝┬9ƒ╟\"·]Näï∙∩2±Φçπ╚ΘÇ■xΘåä6─Ék╖╕╡fƒ─u#6·≈▒╝	iZ1kpd(N╬Γ╛è▌*²∞1╨z:X¼·┬K▓g⌐\rª¿^Ö*ñ.╨┌GV?m¿⌡êä>EF┴hhn┐ä±╩b8>ü>¬vó─~┼┐üîqàƒs░!^εδ╧■7╧┬╙~╠▀ΓΓ┐A═/åêéä║¬├ER/~8IìΘ,╤I>jx└&▀*çÿ¬╗_╤\r┼0ç╖¥Φn Itºù2V╔¥>ôΣ:^-≥*V⌐àë┘ÑÆOo┌ç┼╡hpδ⌐æ┌▒┤6╠ƒ^Å█╞^εφc9¬úpòvha>ëz∙wa^jO±S╣qö╘-╛¿Q¡╡\r─▒R/╕└\\╓┬àª┼K\ZV@*∞»<mû└yµb║=·;≤aLS¿>╞ÑÅ╧Ç╥╫w╚╙▌ªB¼L|çöíáh╒╢í|≈R!j─r┼áûÄ!è╣╒≥4¼3Y¡mG\0üƒs<╤I+öY!öÜv╡d╥üÉif}┌^jö▌>┘φÆ⌐+∞O½¡┼}Zmj▄╒BrñûßçL2våö║}r5╩%-»zÇ_╖*╓GWΦ8uƒ₧p\"md0╘ñiùTà■öR▓ Fîµù°╧ƒ75£E▀≈$ü¿│≈╧╗₧╖┤m>àÖêW┘ü)Ö·█iuç=ƒ≡)┐Ω╫½åç█┴}╩Qv ╢R\0│WO⌐▀öO;di#╩÷╥¬Ç╠çäÆh`┼╨å5^╞æçC-1`ái]¬æc╜¢╗&╒ï(9τ╫┴<b;=■█╝1φ4Ω8M,⌡u░w╓ÆFóV_D>~φÄx}. ÷»Ü¡OeW▌F4=╩à▐φWQûüzπ¼√£emÆ:█ƒZÆ{g▒╬·R┐δKF)─┼░GJ╨3╛¡e⌐LΓé\Zk_å÷└╜mO≈nx╔ÿ╔6ì║îbhê=½╒B\0\rdCLB│_\Z≥Ω╟├ñ╡└₧╔P╞ó\rr╡æ6A\0¥F┘┘▐(4,\rsD║D╘_ì(└╨Γ█≥┤\"T^╗εV╙.ú]╫╓Ωz}òAƒ┴cMuñ¬╒í┼╡@╕┼oëpQε░Æí╬╓²┘8â⌠╤NûÖ»╛QV╕╙ñÖg-Å	½O▓C$m┤±eƒeFZ	¥╗6XƒÜ▒#%H╝ü╦Hql=`CÄh}φR║╦£s⌐ïW▀Ñ?°:╒%uä_.╒ò^HLB/&-ï⌐█6≡╨█Ωεgí e╣Σ]ÿz(8│!0D╒]U╨$N0 :z╚|ó┌r∩┤íÄ╠U°╣A▓J╩«`Nk0┌5Ñφφ_H|fM>)²┤\rù8àw|wÄq╔I╙sè2≤}ÆS╖╗¥╬╙T÷≈ô±Ä\nΓ┘fcçv■Mu6╗╢┴▌╢\rñ¥■┤ñöPV¥*(∙má▓ZX=~│εfiÉo\Z-δVâ°óÉ@ⁿα└j╗<C[íx∞K\n═T{ï╦·z█8]k@Γt¬}O«w$╠X┌H%┼≈┘[f┴▐╒εAB─¿aügç┌=▄E╓n@░Üî{·█?d╕ë█⌡¼▌g╙ΘÆñ│SOï≡ΩD£Ω┴▄╤°Æ┤ïKjπul╤╛Fi\\\0τµö°ßiâ╕┬¬å╕	NΦ!@┴╓½Fi\r┤_}8	α¼.ö⌡Çè≈:⌡ºÄì╘\\)zx⌠≡╙h	º-ε.IR║xΦ,\nV╘lKºOÉO╖πîI2ëëÆ=hc┐Çb*│fT>╘Ra?ê(\"\'εbù║²s6≤█^∞ªΦQw\'≥÷à$┌δ.ÉWHB9²ΣÑPT¿:u[áUìDN)èFCGÅí⌡iü\r╙)æ\nc;Ug╛è╟ùy\Z¥ε¬╬r~k╧F░∙¡┘▐δi?Ñâ╣T>φ⌡7Hç6ä╠\Z╡ZΦT.π»╟c>¢╜l∙òREváΘⁿÿ.▌╜╦▌S{îk≈╗)5z─Oÿ+¼yªF╥kXjƒ.#⌡U~*aá▄e±ñ\"5r╬╧║iK■%╙Ω·9É╞3-\\Jπë▄5ë╖┤}ù.αo²∞*▄¼ƒ}¥Å6lê╪Ö╦\0δ)s²,xXε,╢╒│bδ²╗bà┐7?gé{-n\"╝Z`QFN}¥ÖΓY╥╕╦<O8àÄ÷	UmB╒MÖ─⌐╒ëÖSî╩╛\rMötI═%	Ö:ª┌É|\Z▌┬▐╒τ»∩6\\;-╫ùG╕kƒ▒Ö¥╔)α╖B(U▀\\╡[`2?ÉG√º;Uÿbx÷- sOP∩?≈⌐╥~m\n\n_m╒╨	┘P╡ƒ²┬YF╦┼úi£ñr▓V╣óàt╠\0█≈║UεZä╚kòb+▀àc▄6Ö?+èΩ└\'(ⁿ░òää$▀\0æ■╩!▀ææNuä%¬ⁿJg╒B;≡┤s½c├Oì[≤∞╦êg+∞g║µ│÷k╞∩V╪╧ö╫╧)¡Q▓x\\┌╙╤;@b≤«¿7Γ─C╡ÜV╩╨╓Yj>÷_ö█ª5G¡åT╒K¿■║¡ⁿ│(■\nƒtêK└⌐ÜO▌╜<B▀·ù√P{5wOeng∙╢╟Ωs¡│/ùzO┤H=ç┌aF╚eªRí┌@deqò$╜ÑM:Y╗║F┤Y╙¬6b₧îsê¿{¬¡τ]Γ√¢╧£╜\\b3ç╠¿Ef╛╕L ╔ef─LC{Θ₧Γ┤╔«σÆ_fU9-∞│yN\r£⌐]\ZxG┌¥-KQ;Φfª₧▄]-Ç╒│ZAα?G»ò╙}	é╥▀╡TJ╠░µw╙iWΓ▓≤¼Θ`-m`▒Gφ\rA╪]^¡G|q*=┌┼^îτûE╒ù7αI0J1HD²ü5±₧Ω&Çe½â7Ö╪Whε▌ε÷╟à½Dƒe╔╧╞áww\Z°■╜M╡ª²╜G╡~φZÿA*Xgb╨w▄î~R4╚╫ôXQñ╖∙≤E2K·Γq-h≥±∙½╜ÆXü&-»i⌐ö┘┬TNµ╔^▀o░MîoIå~óò¬ÿ Aïⁿ~\">éù0j)²╒π╫7+èûéSWv⌠?╔Åë5√µy╪±d╣└ΣF8&╒\n╘k╨<╒}╙&Mæ+¡m╦┤∩┌╢╣Lm}-n_Σ▐▀k█⌡{m[[-∞saU;¡░miq½6{ñ:≈½C;Q─TB╧¬E┐╡4┤+α∩╢*╨▌ùy▄ºo<YQiv╨fI}⌡vâ·╫nmdÖ÷4uφ?≥óà9■u≈XΩf½╡!ó|╖▐àK$íπ<¢fè┤LºΦåªvéⁿ┴≡ÜQWî)7}ihòûâH┴│Æ ≈.╡y>∙	*\'l%Φⁿ]?2w\0óπßZéH°Z└π┤P╡$┐╙Γ╞╗≈Γ│/{┐δφª ⌠╦∙▐\n$Θ╤>îσ[n\'úÉ-⌡£(ö╪Θ⌡\r⌐s¢╛Mææ╠F};σpV\ZΩ╗_╘╩ñlJ▌NO:@T┤Å¥j7m╓═@Æ9=φÿ┘-jKî─¡v}j╗à\në₧ù&≡√:╜φ│ε*Vτ0-¬┬k▀<ⁿ¼\Z⌡▓¿╣ñó▓Ω╠┘╗xL╣ô┌tε#─;z╩;^!rx┤δ²cz≤~`ΩⁿàΘ²\r╙q½òL+!╘Ö`_+╩g█φAjφ⌠²¬çεÉ`»*bεε!m6V	FΦ╓Aⁿ≈^√╜k¥─≤6b∞zKαï.]═g╡║êé> 7ΩYî;Æ∩6d}mß9_BSGuδKKª	Gq5╩Sk═|≈D┼gç┐]Rò% ╞@û╫æN╫\\\0\0àiCCPICC PROFILE\0\0x£}æ=H├PàO╙èR*φ Γ░:Yqö*┴Bi+┤Ω`≥╥?h╥Éñ╕8\n«½.╬║:╕\néαê¢¢ôóïöx_Rhπà╟√8∩₧├{≈B│╩T30¿Üeñq1ù_{_ßC\0Aä1\"1SOf│≡¼»{Ωª║ï±,∩╛?½_)ÿ≡ë─sL7,Γ\rΓÖMKτ╝OaeI!>\'7Φé─Å\\ù]~π\\rXαÖ#¢₧\'ÄïÑ.û╗ÿò\ròxÜ8¬¿\Zσ9ù╬[£╒j¥╡∩╔_*h+«╙\ZFKH\"2Ω¿á\n1┌5RLñΘ<εßrⁿ)r╔Σ¬Çæc5¿É?°ⁿ₧¡Y£ÜtôBqáτ┼╢?Fü▐]á╒░φ∩c█n¥\0■gαJδ°kM`÷ô⌠FGï█└┼uGô≈Ç╦`≡Iù╔æⁿ┤äbx?úo╩ß[ ╕µ╬¡}Ä╙ K│Z╛ü▒e»{╝╗»{n ÷┤τ≈8╓rÉRö√\0\0\0bKGD\0R\0R\0RQ═φ╥\0\0\0	pHYs\0\0─\0\0─ò+\0\0\0tIMEσ\n&ΓF\Z╦\0\0\r.IDATx┌╒¢{p╙╫ò╟?┐ç₧╢$c[;∞≡\\₧cüaÜ6óÆ╠fJiBÿLiª4Φ.L`┌MXà╥¡Ö-M¢Mi:∞åQ6dC¢füå&äG0P╞┴?äm²dδ²╙o Él^╞û▒Σñg╞#█║┐{╧≈√;τ▄s╧╜W M2ε╔ⁿ≈i∙└}└`20╚εσ╤α4p°╪╖≈┘úWN²ª.-z\n⌐ε╨⌐8\nü%└ú└ö╬1éæ0■pÉ@$L \Z\"\ZSQ╡\0Æ \"ï&┘ÇQº\'Co─¿╙wv⌐ƒ╗Ç▀╗¼εK_:₧⌡<äñùf╧\01ìαi≈╥Φoßó 2^╒█º>mÆòbs!yµlr3md@x╪i6┘▀■b	≤D>╩∩╣╪╠èi\Z═╛6.x/Sφ?ùR╦\Zm.eä¡\0╗eó \0V}╕±o·Θ╣ü\'└⌐8?╛¡╞b\\÷z¿h⌐µj┤àtJÄ£═ñ∞Q▄e│#ë\"└vαYù╒▌8 |δ²Ö▐c°É╙¿┤rñ╣Æµ¿çüö\\9çi÷qΣY│«▀k·[δ╬m3ñÅ\0ºΓ╨¢üä\"a*\Z╧Q╒±_ñî═╔─╝╥╬á∙KαG.½;£r£è#xÿφi≈▓ ╩Q|1_▒êÖ╠╔/├₧Ö≡!αpY▌-)#└⌐8\nÇ≈ü▒τ=⌡ⁿσΩß┤\0╤\"	Ñtw÷ⁿ∞£⌐öΣ▐E\"Åÿτ▓║/≈¢\0ºΓ╨4mdec\rG╝\'S<φ;!┤PA■&ÿ╛å±Ç╪╖╛╩l°ç╝ßépÿπ▓║»⌠╘^∞╝╪½íì<┘p>-αéç!┤╩V╬δ»╜╬Bm╛º└╗┤`▀·:Ω=╔ëå≤hÜv7≡╟å╛[ÇSqêëñπδUì∙ñ¡\"m>▄╛î┐╠óÑÑAêFú╝≈▐{,\\╕²\n░>╤≈>ºeMd\\▐pÇ?≤]V╖┌WX|╜╢╡1¡αTLƒ>!₧α ╦2=⌠█╖o\'╝óƒ≈╜╧├m\'¿mi\0x ü%yp*Ä9└Å█ⁿφ∞o:ö÷(╗ô\'O╛σ ,└d2<vg²εk■äV┐`ìSq╠Mè\0ºΓ0 QU±αò\nbhΘE⌡>|°¡╙¢┼┬≥σ╦ë╣├αè╞┴+D╘¿╝µT╔X└┐\0#¬¢k$╗ïzÇ@≈\0î1⌡Φ¥≈∩ë^σtS-└≡╢█αTE└3▐@;G╙±oûHMⁿ│ñññ█∩eYÄ»√!╟öS┤┌₧q*ÄΓ₧,`-`<╤tn@└âα^x°ßç)**Ω╢I]]ΓΣ■uóΘ,ÇX╫-ëB╞π₧v/τâ┐ \0¿ +W«Do⌡╞H$┬ε▌╗╤ÑÇÇ┴Z<φ^Ç∩8╟╨ε,αi@W▌R¢vαZ┌▌α╓»_╧∞┘│╗mWUUEuu5·q⌐≈t╦E\09ü⌡\ZN┼!O╢£\r\\H/z|█ °S(//g⌡Ω╒HÆt+IÜ╞╢m█&é~tjå>¿┴⌠<Ö└▄e≤Ç╝:Ñy@╠>╝vε▄╔╙O?ì^»∩╢]ee%¢7o╞ⁿå╘ìY±\0╛v=▀╘Ç3╛⌠·╛\0 fX╖nï-Ω╩ⁿ║ô7▐xa╦R½├Ñ-₧█,₧≈:.)┴Ä┬]╡∩ºòÇαh AⁿφÄ;÷╢φ.]║─░a├0┐µ»ª^ÅE├µa3e╘k\Zw╔é@)P╪ΓOsq#7<÷╪cî▌│S?~<■H°≈][╢	b▄c╝f ┌@▓âá∩¢*¡~¢)ú@╕[ª4┌╥è?|╘?┴w?°n╖S▐⌡RRR┬°±π9⌡oºz»Φîåîg└8%y]Ümô0]&\\4ñ⌡φ√▀é√ε╗Å3f⌠┌|▄╕q>|EQí+VhÜF,CUU|>═══╝∙µ¢lY╛╩┴8=9uΩé\rLe└$Qú┤¬Θ│ÇP%Dw┴Ω╜½1\ZìI=c4\Z{m;j╘(ªM¢Fff&/?≈2≥NÉ≤{∩╗M⌡VúΦ%yñE#Θ{∙╨■q▀ƒ;wn╩√╫δ⌡╝≡┬L=üÄ▌}p╔H`¿Σç√H@°äNéµ╗╡╛$π╘xÇ╥┬α√ƒè¼ ²·█╬∙²òAâ▒z⌡j/^LlI|∞^¡RìÉë⌐@▓\"¬Ü|\"│ⁿN╚╬╬&;√╞ì▐X,FMM\r~ïåÉtÇ╓∩╛√úFìJkÉφ\\L┼┌ô# ¬Fl2 kI=bα_/╛°\"½V¡Ω╓G╧ƒ?OYYul╪░ü√∩┐ƒ▓▓▓┤éâ╝·Ω½πA╩M╥55\r@\'C≥%ƒX[╝x±αâ▐6@òöö≡°πÅ3b─V«\\9 ½╩={÷░m█6,»\'ƒ6±z░&aQHrâ(AUo≤°æ#Gn[ßIçΣµ╞_╗N■A\0┬\"α╤IrΩ₧pÿCça╖█îÇÖ3g▓l┘2:~umw⌐╫┘#Ä┘#ìzIù2eEA╙4╠f≤Çá╙ΘX║t)┌º±{rΦ\0\ZDαⁿu╟QRb\0V½u└PUòÇbFr╧u:Ç\"pFE≥uCRóL Φ╩ΣJv∞╪┴┌╡k1 ─$xó╦C%Ç3\"±╙X1σªö\0Yû∞φ/[╢∙0\'Öhµ╗░üCÇûk▓ÑLíü$@Æ$╓¼Yâz<∙\0ÿk╬Ωⁿ⌡c▒Γw\Zü╩sj|Vï\'╜Nò⌐ö∙≤τú]ÇHÆ{ê┘q¼ò╒o_j▀_q`ÅIo`¿■«~+#-ï%Θ<áP_ÇYo\0╪≤╬wÄu╒wö┌åª─$»wàtK á╝╝≥@7¼≈÷Ñ╓.î╗ Q╒TφPÖo═Añª¢æƒçó╤h┌┴âA╓«]╦û-[░ⁿDK╧φE\nl9\0º5ì#]╝2ΦmÇ¡Y╟Dδÿ~)╒9²àBí┤p∞╪16m┌D╞/└0⌐≈÷-c1╚zÇ¡»╪▄tÉÉ▀¡Ñ┘à)▒Ç╢╢╢┤╨ie·╥Σ┌ùµ┤»_│èä╕¼εv`sª┴─d╦╕~ñóó\"ÜÜÜ╥NÇ╟╧{à$f▄Iûqd\ZL\0?wY▌╛[H╚╧ü╞╤÷\"▌╒ÜEz\rpé 0o▐<÷φ█ç╫δM°ÜÜ\Z╓¼Yâ╝─A=╖5zF█ï\0Üê∩╜┤» πúù¬├3╫î÷╚ÆΣ░.·o<ú/╚╪6╤FYYÆ$í¬j╫O4\Zσ╘⌐S¼X▒é²√≈│qπF¬¬¬¿»»º╡╡òP(ä$IÿLª~Mù,Y▓ä*c%Y╧â`Ω╣²l√T∞Ö6Ç║¼εOn¬Γ▌(╧{é ≡üªis zΘ$g57F▐ú╨■²^óφ0/╡\"ƒü·g╨«;╩<e╩.\\Hqq1ÖÖÖX¡V,z╜╜^Å,╦Φt:DQDUU┬ß0~┐ƒµµf:─å\r∩█s╜WÇJM├∙╩╨	ép\0ÿδ▓║╡	\0H£ó¿F┬╢wkó¿╩ì┴τ2äOwôz\n eüaΓMo%jk|⌐\Z╜╤\Zêå╪}J┴╕╠sΓ;D=ëU┤0┐xF¥^&╣¼εÜ[+C╖ºΓx°C½▀╟;u√║nwñv%1<â╙┬áàñFA╙¿╬-1c|₧ù▓nv▄█═∙\"τ2(├≡O.½√▌&n╖δα┬çù½&~{ä┴ñ3╠\Z,τr«²≤╘É╪δ═╫└I9±²>┘≥α°ºö N4ô⌠╤┘å|╗%`πÄ┼∙à≈│└φTΦ^\Z·╨αƒüφ∙╢µσ═Σ∩Eµσ═$?₧±²░ªvOK┼╤^─⌐8t└└q┼{ò?5ⁿò▒/%pæ»\rΘ ?└ú.½╗╟Er▓╟σu└6α[->■»■≡ùµ«@W&f≥Å╙╚╬░ⁿ7≡D2\'·raB\0^V#a╫W\r╪i▓▐ñ─X╠╘é▒ÿΓ╡Mh½]╓╖ô2S)┘A>z⌐\ZS╛ⁿτⁿI┘╒▓$=0╠ûg╚▓¿4í~A.ít╠╩¥╩─!ÑΦ$┘,=²╓Ñ═┐╜g_╥¢=wöÄ9GIbA1+	q║╣û╛¬?!scφ┼ÿΓ┼ìâ└Rù╒}╛╧y┼¥*ÉpëºÇr}A?g[Ω8Θ;ìûª╓,c╕;╗ï╤±█b?~}såùv«#┬<ⁿ░#aΩg╜ƒSI═⌐ô|▌F┌åQ`═φ╝ª\0σ└+.½╗¡ñªHD<,εΦiΘP≡┌¿6╙IεΓ`¥¥ú¥\\S┘V2⌠]9∩9`+≡Züº£Ç.\"╝ü{üGê▀#┘╡åê⌐ä\"┬jä░\Zφ¬ éÇ^Æ╤K::▓xCl>╝∞Bπcù═¡Ñ╓¡╥(▀;≤\r,∙åBα^Γ╫τG┼@>±k⌠¥¢ÆΓ╫µ»\0ü3$«╧òP]yß{i╙± 4w┐@r÷{.\0\0\0\0IEND«B`é',16,16),(8,'Non Honorer','image/png',_binary 'ëPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0@\0\0\0@\0\0\0¬iq▐\0\0æzTXtRaw profile type exif\0\0x┌¡¢iv9Æä πsä└δ{sâ9■|DÆöJU▌=o(ëLµ°bnµÖ⌡? ╜═±ò├Lê╣ñÜ╥├W¿í║╞â≥▄»√╙>ß|?_ß}ë▀y▐|╜αx╩≤╙▀_╙z▀▀x>~ ┐░²╫τM∩u╩{í≈à╧╜ε∞x0▀E╛≥ε>o▀▀Mu≈AK?╢≤■δ∩ç╧¥ƒ┐■2╞ÿæδyg▄≥╓?≈√╜ô╫?δ?∩≈α⌠HÅ¥≈τÖⁿW√Ö/╙²┴Ç_Å~│▀3▐τ²╖9εà>█J┐┘Θ}▐╞?█∩XΘτè¼√║│√╣óΘ±═╧»÷█{û╜╫▌]╔`«⌠nΩ│ò≤ê7ræα╧╟2 \"Å≤∙S∙S₧÷╝6┘j7Oτùj╢▐6╪i¢▌v¥ƒ├û▄rÖƒ╬\r|áτè╧«║q£⌠╟nùì»~·é?₧≤<φ╛╓b╧}½ε╟═\nw₧ûw:╦┼,ƒ°σÅ∙²ë δƒ_.┤╖┬▄┌º|┘èu9à,╦Éτ⌠¥wß╗_¢╞c_kεÅτ≈/9╓π┴x╠\\╪`{·╜DÅ÷;╢ⁿ±│óß¡ßMi¢τ{L─╜#ï!óâ}Æ⌡╤&√dτ▓╡╪▒αƒ╞╩a▀±Çì&║╔*]≡>ß£Γto>ôφy»ïε>\r╝αêΦô╧╕ª·å│Bê!æoàj&·bî)µXbì-∙RL)σ$£j┘τÉcN9τÆkn┼ùPbI%ùRji╒UîESS═╡╘Z[πª-4«╒xπëε║∩í╟₧zεÑ╫▐ß3┬ê#ì<╩¿úM7²╠L3╧2δl╦.BiàWZyòUW█─┌÷;∞╕╙╬╗∞║█ù╫^»■Ω╡▀=≈╧^│»╫▄qö▐ù┐╜╞╙9.a\'Q>├c.X<₧σ┌╔gO▒!8yN>{¬≤╞√ΦXeösªò╟≡`X╓┼m┐|≈φ╣┐⌡¢┴║ ⌐▀▄ƒ<gΣ║ ╧╣εçτ■Ω╖?xm╢╖■8HYêMAHO·±åUÜ+MuΘ»?{{÷3wI~c╜g≈░wKy╓=╕ ▐ntô╫Ü<╞¼½FÅAKδ╝┌J|Zee¡NÅü+<ù[∙≈╦U╗BÜf│₧Üb∩9¡▒{┘íφX╩≥┌≈a¬òr╒cΓ&vG_≥▓úü╖▄*╓∞▌Ü╔⌠╝\\¡c│ε=╝τ║eτ┘·₧n»iY»╒ö╗Okr\'▐\Z█*«┘Ω╪V╦₧\r53xπd)╝ì╒-?▒fj+╘1G¥+Σ	\Z∞º[Jc½║Nî═L╘┤·⌠Σ╕v₧┴∞╠û	1]ñ╪╝╣_δ~6ÜG/#≈Ö≥└â-E╝░Zαy¼─φjI∞Ö¥∞f&1╖ƒ¡·▌╩l¿═òNâ≤₧I╪⌠z?┌δ3gPÑ┴+?╗⌡\\δ,┼ñA8ej╢=ca╠╗6aN2L>═\n2e0₧φjeEßφf╤q╝uxæwXπ∞εá~c█\'*┤EΓbƒ░(oXñµf╠d	F└-ä&∩è¡\'CπÉ8L≥su▓nÄ8U	l╗N╒┬Z-c╫α┴p:ª,üî╣W¡,╢ε▐≈\"╔╠£äÉ]+k ─ε-àjw¡ÿ└û╢:h[Lg+╛bè!_{ì«f╫ê!.σ╠¼δ┘╔\0>Æ,#o*≤▐)φ¢É┐ε9~╜σZ$,╧6FÅ┘4¢₧dôód£~å(j≈╖?IπÆ·≡Q3ÇΦ■≥╪d═╕Iô√~ôfdeM√æ5q`zδZφ\'T6╖⌐└\Z╪B àè╖r╦▒/<╤êµ∩√=eφ▀≤µ▐εô9F⌐3Ib₧Ö#█Xm╬¡&!Bg!ÿ±$V¿]÷+ßè─M\08WüsÄj▓é7z└:òƒtB▓L┐Zε=φ%∩a~èH╙F╓ε█\\Fc/α% Yç∩ï╠▓e\0φ└X½⌠k÷P■tτgσ\Z$├α╞a6πj╤▌╦I	Mä£²≈c≥¿h+Å1÷¿\'ç│╦aâ	ñ≈áz$╝W6┴zgñ■(5ùmè▌╥╫ xj▐dà≤d─\0╢╨O└α[ñ>ª\\\'Ñ0&0\"kb╦╘[ù╗m$âO╓µ╞Re╙6∞t¡╡EÜbRR╞v¢ΓD▐0█RX₧&àφ:îá ç¢¢≥9£≡#(─╞╣)i∞FhäU+ò┤#ö#»¿─½y#Xíîæd┘?ΘXvU?¿╟╠╧≈╧╣(-∙.┴P$µo⌐∩\n~).xbq█\\¼\\╟\"╫:.R_T6fΓ¿k[n5_cPßÜ╛sº	äΩ9÷φ4\n¡Ç*─*E╛φ⌐í|φí8╩oΩ▄b4ü⌠$4yÉFuè╗qΓ╗π&0ù┬│ò╨@▓╧├Pb\n7ç¥+╞²Cü²╟ƒ8ù╠c8ä¢|≈╣lr╨Nεî,╒ç÷ä!╚3·lqεj▒.nº\nσÉUΩJ&σ2¿M,jBl∞∞∙?	s=Γ\0Σö╚«9\0Kä0Y%i┘┼¬{kè└#\\╓┴\r╝r═dX┌ó▓└√á?á▌∩XW┴Y┌¼\n`╓8╢»B▄@î£O▓eε╛S╙&Bí█║╫ünÅ!<╪¥ch¿xærD1µ\ny┤ME╬Z?à√\0%≡■Ö╨<á▌æ¼≡╗c1	ñ▒/\0├â■éZ╝▓█\'KR\'┘ëê≤3ûσE╔U¬çé2Æ⌠;¥àæΦ≡⌠Ä¡╟╓Σ\n<,¡╖Bεⁿ/╔▒¿⌡δΓ$X¢é9T5Yⁿ`ò─W¡ßn°ìùú\n\'£╞█╔▀ µ¿/;█┘╤■σÖ≈R9Γú£└ût│D╡di`t┤τ5\n!»\rJ√nè╬è∙°eéτæhªp█e║┼C<▒jπ½\\·f╔╖╚=▀ùúFÑ┬¢f┌YE╣W*╦Σ6▒\"⌠╦░å┬à\0UαdCπ=FòÅé╙²Öâ)>D,2ÅΦ\n!ußNª┴`3ù8î*nóßúP┴LP3£(:Ç╠^b4Γ╒ä\rT\Zpz╢è┬δs╜Çu\'?,╩|)c±wA(Ñ¿╦>ⁿ╝(╢█£Θe_º╬┤▓┘\\╟√~┐èZ1≤çî\0î`0▀ÑónÆ╩Sd[│>4òo¿3⌡.■ÿFJ£Q·z½╪▌Æ)$sg╣g√ç\"uû/╪≤▌,!HòòⁿC▓╡φ╓¼.èU«:o╔£■«┴ôg%▒iÆïÉ±∩àxà╧xÉIQ\n)CE┴ö8\0:å_╤X╣·áÄà│|╛¡δ┘	aëc├~>═║.½╡▒M╚\"ƒ┤gW▐6üI%╗åu_╗│ΩÖ═k\\▓╪ú╡≤uûj»`╜ ┼ V▀≥ån╜╠V%╡ûºy║╝Z▒|╝åSQ\r╪ⁿeTrD╡╡▌Oi/αób²\"_ükó┘r┴ül₧7Mφ	í.¢┴k▄<╨û╡╪,ƒGpAyÖ7╬-╜Vt╔áτδ╪\rêÿFkc-ÆY┴3╜┤µ├ÆáA╘┤\\\'║║«k<ß╬═⌐É╕(EÜêRD¥+Ç^	1ÿÿσ─≈/ö█ÿâπ;≡┘⌐⌡ÅJ▄╚╝B╨úçW\"Ö┬rñ∞âΘx U¢üñ(Uⁿj┬|╔U■&W_@ß/PH\\a▄⌠Çb┴çÜ\'uαW└╕á¼N≡(╔─├S@gv∩E@╧σÆGaΣ@:òöâ╔╖á∞ú?≥╤»fï\n╢a·$9ìfÑ8v┤╘pöC╘\",¼ñ+≈=îDT=\\N▒D^Q3⌐▄g\n8┘nMëô║αñ╔πú┼Éî=8¥ZjWñmΩVÇ£ä╓═~╝ïï\'X	uI\'9▀╨ëB╤∙ìWOT{]⌐\'{Y»δ½d▐C╣σσ¥}∙\\σKα`cK√öA┬Q¬¡⌐▌,╝▀O&gΦ╜åÑmÉ4÷╚Æ]ú£┤P%!«v╪(mûïiûΓ#@-K¬╘å[iê8Ä▐àE¡₧20	Γ]╕╬║║J:└╛ì╧G╒ßn╕σ÷J¡FbmΩ3∞ôb%ÇqßO``╟#µ[æ*égC┼╜äÖôà╩╕zöqkt\Z)\Z2Q0AΣn┬▌dqΘçûEe≤æ┤ëëaÜ≈V■êÄ╪jïP°\r0é¬5\"\n&è■ÿMZ╓w#îP╓≤d\0σ╨îÖ@╘\'WÅ▐;uµú≈f┐w¬9mµΣ¡Ñb¿k1áììöà▒░,σΩR═σ╨^▌_ P╩╙?┌µ0╩·2╩.Ω%;dH┤>5)╦M∞▒A╚&I⌡v_╚Yú╢\"Q#┼tHXAzα\'äöh.Ç\"╗+77êv½ª█╫πl\'5╣φ±(▓û┬	C⌐3┐2^√ò■f╪╔î▀≤ΓGZÿ¢∙óÿq*╚φV]16(F[^·QíA╬¼Sgä£╠δ7ò₧rr╠ s╧{ùN╖sùB╣╩÷y■÷\'!6Ç∩dD╥╤IÇ\Z.Σù¼ëF▄1UaN≥Γ	∙╞ƒ╢Çδ╔y╧ú}°¼9ûºZ5Å@bτ╗OædGüá\"ª╝║-Ω3░▄ç\r%`α╦┼`Eτâ	¿╔â!ç@ ╧▒ëWsü╕┘NΘì¢└1ÄlAh÷╪φ/╘¢o!\rÖ·MJô_Ç√¡.╜╝σÑ═∩≥Σ┌6¿┌≡τ═σ╒╧EI╪XXE*R╜üjrµ¬⌡Tc╟≈^sº■¿╟εFê╚▓Q╬─ÜE═█»╟Qê╠\' τé\\│I■┐\rJ4.t£ÑEx█8╡ºßº}îY.Å∞q╝Lò]DëíïÅ∞ å.╔\'M/¥u╠x⌐²oRd╕╘±:▒g`TΓ∞r╘┐J√? ⌠°~è<:F2\'xtpsε┘┐└N⌡7╒f∞*Y-6@g⌡│W╟┌πT╥æ5≤\"e░0j*RìkévL√\"╬<*o┐hö?┐ÉÇ∞ôK╨Ñß├ix¢5╩	_╒Y╚ΩIä╠bP─Æ╛¡*B@¥=ªÜ└┴GGµó┼6üöA▀v⌡╝\')┌áv \ZR°R\"¬V╨N?2¥α:I▐┬%>▓öHå¥½æ²º_X+ƒ>ßC| &²π/÷7▒b@░ñ╩Oñ95╥⌐ⁿΘ∩Ciφ╙_╗Y2─Φ	*ö4(fa┬m█╝┌q²@∙	-D<≈`║╝é;τßkâ─¢\Z`¿Y≥A─h▒úMÜσ?ï.Sτk·Ωε─╦BÇSαÿU÷╙╧á+h╓┘ê}δ;ò7ε≡α┌f5╜*φφcâ║P▐	}Cê₧ÄçÉ*ì+╓D0a▓╪âìΣZHHdYV┌0t┼5WSû8╚\Z¬⌐ó╜ö╔_æé@fë─I╫▓  ä╚π	Iê╓π\Z>▌╚áåBσgUBΩÅσÅÉ┐£!i@╠┬▒Γ⌡+l┘\"│öêá[╜è· öΓkìO#dáÇ2▓I╕-;½¬Vüδ,╤d⌡æ,X╩=─%b≡ΣàR▓⌐m╤_±à╢û₧8┌`αbnïåMíVódCu£▓t╫]└°ƒw!vt╔⌐Hbπ╖p:\r\0][⌡s;sετ┐ƒ╒¼åτy▓úfFÇXΩB╘\\iαπ╠B┴Θz╫Θd?7\\áSP╩π┤Ü└|╤EFß├OJOdße▓Y2\nPⁿ@╝,╔┼òá°-■╨@êó0FnΓ!wQ╞\"█|G▀>jDQ╪°░¬═T┬ôδTrlC,∙íó┬▓	▐ón▐Z½3*║Iαi\'╘#I¼æQÑΘΓé╜¥Bl\"Ä%ºφú║tΣ╓n>╫╒Ω┘φ\\Cx╒5Pï╤i╝9 )²ëR⌡1?¬┤QmùôíP╧±/τΩW╞c⌐┌Ñ∞üΘI┬FU─ú₧g^l╚½\Zb╦ñ╢Öÿ┘#₧ñ╢░;=/\0äk─N\06dá9QM╪≡│F¬\'kφp,₧[\rφπ¢X<╗┤▒rà(°Q¡┐═tì╖û≥É½:6╨\"r!╬Γƒ}IÆ7▐,òb\'┼.a*9vDp=ßCnù█│»\\₧ .▓╤╘xBü╤▄!╡⌡┤Åªyp■A;Æú»zA\0!v═?ú╡╕9*9?ÖêkE█Æ≡╬+┐UQ>▒$¬║I²cü-ƒ╤\0êÅ¬9╧I}Z╪_╫╘┬f╩àƒT▀ªuuñ7┴∞ö═█\Z·└─≈CQH$ ⌠½.ΓR-¿└\'╝ä╖│t≤ÉÇ╙[i4√_¬5╫épΓ╖ï ─╨<Svt kÜ╫X═¥╚▄╘εiHY ╕%í╦■Ñ;vÅxñ╬╬öt─╧╛a╨DÆè∙&½┐Y╜├M╗>S¼íΘUaSσ\Z@%&G\rQΣ·£ì,¼╬╠\n╩╚¥R╔±╢¡7┴Wgè╒uP⌠Æ─Vcgó╜╛}?÷f░±;╦mOU5╥─x_K╖5b▒6Φ}ÇMáΓ¼âxÿíK┌c⌡m═)å[è┌▀nûÇ▄`âp{╒K∙[aÇm█⌠mR█O╧p¥╔ùÿ╔Q┘`(Æ>Kg┼ τ5╣¼╞≥╓°<¬$a∞├rSr%»°ÅN▒>É@-∙\n¢NÄÿL]t?╩f²mêæ,│>ö\"7é¬T║lj/≈Ñ ┤VâûP▀╟Ω≡æπìoƒ?ⁿh╦áÖ╒ûí╝y║%Mù!çYr╚G■@ÇG┘¥ú%Åäl\"₧&╙@íâa2¬6ƒΘ╔²E7≈ç▄ⁿJ┌éÅv&ΣOiHêpñ╚üⁿ^à┬«╩{ªΣL▀\'tF6Æ°╜fï╙òóé$è¡q Θé«¡@g╧ⁿÑP¬Ñü;E▀QYRεΣD╦IP)6▒JDmπ+Φ▄HöH}R,J,^íΘ:RÆyQ:nδ7╦ì¬\r ì£Z▄CJ╛6g^7eênεó─║p╧τôZ╧Æ ╙ñ▄R»■%ëGi\0p╥8¥üΦ╚:	}å╪Φ9ÿ░*¢╚DH0%\r8è╤îë╩Σ╒┼à&╧ªItφWδ⌐EóΣ¿Xí±ê¬5\"Γ─QΩ:∩τE\\╙ÉZε3A«*Y█UjK)ⁿ\0R]jH╠n1(╔\n╧àpÑfi5 2Ks∙τ,m·wûûnτc╕G)ö▄òó:╙$)¬Y■É⌠GsbI∞x╠₧╧3₧èW▒q=5.x∞╥p╪èZt┬╖.nò# ∙┴psâ║(ªC\"xΩÇs·5C\\Gæ6╥⌡¿┘Æ╟Yp4\0SGk╓6hy>nM▀■╘ô┴÷┘å(ü4w\r]╡\nrδαè┬l├ú¿#Wg╚Oår╕ΣXh\0=à*	Ióa«å½\Z┼hB╖█#ñ\'i$Θë║W\'╪*αîëê!5╧2q⌐▐8≥»ƒ╜┴o╔Y¥ú!==\'9µ⌐╒dëd≥MÆ_⌠ⁿEOä	dnº│FÖ£Nτ₧H⌡╙¥≈╙t┴\ZîT5»x₧W1╛4¢e r√æ≡╙╢\0£Sgl;Ωû*G⌐4╜S║╙æLR½à¼▒T╓Ta0^.É⌐¬4≥òëÉc╘┴»ªgk1òU;òFVPÉ╝P3O√ßï58ÿ╦>}⌠yzⁿæ\\!YJ╠:!BÉ≈╢╠â8╨%┬εLÖ≥W7k¬╔┼╢ä┬ªvN7èÉΩC¥OT°A\nlJF╫═g$═ªô`E▌Γs╣⌐«glÉ╨à╛«KcßáO╖8\rƒ┘ª.$o¡Q%[gσÉ░\Z▒╔\Z3┴ª±æN£tε6]■y╕`~µºΘ╠Oì·B:Pó■≥a=:WíI\"ΘêUu░ha▌╞Éò┴!w█═ÄD─½bR┼ ë!-Å╜πà/┴≈»xrr╖t9¥█F²S\0uF╦btTiraÄxπ╦Ü0╖µd╣Ñ!ú▐Äîz y∙Ä¬µ9φ#ü▌εg&╕^<`a%σ▒náö╘B\\D═Ç½]⌡Φε;	\ZN■#:Q╖▌x┬C╜5─Ö(:Qgφ½ftHF┤\'Xs┌Mª1╧}!▌êæ{╥≥╠╫`MnδÉE■₧╧╓¿(WsT\'µ\rV╗│àφh{!╜m╩≈¬Å0√½»å%TtΘ╡¼\"3╒Iα⌡8\n¥ΓjfFⁿk2┘║yäF\n╞≥\r█≤₧k√m¥k√;╨÷²╬º¼7Üçe⌡¡uP%o╬lU▐¼7o─┬ε`>4┬S═╧ëΣαRÑò║EJ2║_º╖S░k&T▄{äI,Ñé╙\ZCóE½P╦¿;½°xk╦R\'±≡|á6₧≥áôù&┴▀>\"Dô╛ÄC┤⌠▌╨Φ≡£ïF₧¡é▀╗Ö╫╨HìΘî∙▒åÄ╚ëWP¥u°╨ z╥$=Iα-I2èñ@╢ÆR±CSz╒ÿ3Z├φÉÇN╣%*ƒa½ïÅ√_?▐Z╘▒úé\00τÿ▌ⁿφJùX±πö╠Yτ ╟┤\0h╔\"╥K═êwσùwßf±╡█ε╥T╩┬ⁿNGEτ,┤;╥░√çúⁿb2Xj╤ⁿ┴T5VòL6j╝}╙ávü╝Mτê@φ¬fæÜb:╪aYïX▌AS>Θ▓\0B3╘█e;a4ùy≥gåzµ2≤¥íJ∞ë╓ ╙íY√╨\0n5u&é╗τ╣▀1fƒΦàF)l:\0ÑZó├Å½δ┤ö¿å\':$I╘R°*ª*┘╢Åº7wXU\'b▓Γ ìM\r │Æ║╠ö_═Ñ@X\\=╧\"\Zë1╦≥)m╥yóÅ¼^:}░Åä=⌠Ω⌠MJIº(åèêQτt░▓N\r╕╬ @φnìτ=ƒëá╣â█ΩôN▀&½Clg8·╧ß┤Q<ⁿ£N╫╧t·╤pz<\Z@nÖd╧M\'ƒ.å9╖┌A╨áôYφC|Æ.B▌Σ≥W£┐≤┘■Y┼τÿ%ï°│4w∩9K½cû;Rƒp╬■%ùßJiª÷bT╜eεà ╫x╞N╡T╨[0r┐├╣D│ .└½╔e7YY£?Ñ░ê└º⌐Ü∩DëQ╒╪ƒÆ+■Æ+/α⌐ΣZD-▌≡Iç∩╙╙PH▀aBäJHºjΩ<!{ö■9Bu░4A½pc─⌠╙Φ╘╓╔┬sµéî▓│╟╥ö▄P8q╙τ╣⌐yΦÇPM(êÅTaΓsg╘║v╛¥┤{\nOHVÑxZ┘b▒^G╡ëHc{-:δD%╫á╢\nMÑÇÇÇ\"¬╟\'VM.Θ▌⌡	UÑ(ü⌐I#D7_╟┬gbQ╬▒à■Φ )¼¿z\r-Bƒë╫╩ìNH╦╨Ül▀½Ü3#δ_■1\"ƒY╤êLi┴ZΩMß═\r╚OVÿ?ñ≥/iaOZ∞╦\'-┌9▓╢┌í²Dε╟p╢²∩£Ç∞\'üu«ß6éE╜j╜£╙ñ^ù≥V┬C]Ω¿∙\n2≥Θ:ΣxDXïó╤─α≡*42j@?£╚f+ßlmàE╔G╨oΦ\\ⁿ≡Æ9└Öª╣\0¢KdºL╨#Ç(Ät½╡(N½f║Ñ ¥%╧i┘Ωƒ│@óY■£·⌡Ü_-¥f╔τƒ≥d}≥DiB╒M┘<┘µDá\0Y█åª╬G8╘11⌠ƒ$$ä╞m-?▄\\τ\0╥Cu«TM£\\║┌₧╗\Z5¡└╗ûÄδαâ	Q╘Qñ@tÆâo(P╦é┤ôD@≤ΦB.┬╞ì;s₧╬╘í¬╕ç8ª┼é|æÿö▐Pc─`UÖq&╠╜ÑC▄T░5_╠d/L│d@╥æ╩█m█╟L\'üI¢~╬¡φm╬Ç;╢·ƒ ò┴┌╓H-^╒)╧Ç╘ÉÑ¿æpσäëNΩσ8Qó3 ╓Θt╔ñ╛¿²¿ u«φΣq█├ôï√\n╕oE╟√#G┘<╜q┴N╘h╟└å(τöGδÇº7îa9²∞ÑTƒ╟ⁿ/eÇf╛TVo\0\0àiCCPICC PROFILE\0\0x£}æ=H├PàO╙èR*φ Γ░:Yqö*┴Bi+┤Ω`≥╥?h╥Éñ╕8\n«½.╬║:╕\néαê¢¢ôóïöx_Rhπà╟√8∩₧├{≈B│╩T30¿Üeñq1ù_{_ßC\0Aä1\"1SOf│≡¼»{Ωª║ï±,∩╛?½_)ÿ≡ë─sL7,Γ\rΓÖMKτ╝OaeI!>\'7Φé─Å\\ù]~π\\rXαÖ#¢₧\'ÄïÑ.û╗ÿò\ròxÜ8¬¿\Zσ9ù╬[£╒j¥╡∩╔_*h+«╙\ZFKH\"2Ω¿á\n1┌5RLñΘ<εßrⁿ)r╔Σ¬Çæc5¿É?°ⁿ₧¡Y£ÜtôBqáτ┼╢?Fü▐]á╒░φ∩c█n¥\0■gαJδ°kM`÷ô⌠FGï█└┼uGô≈Ç╦`≡Iù╔æⁿ┤äbx?úo╩ß[ ╕µ╬¡}Ä╙ K│Z╛ü▒e»{╝╗»{n ÷┤τ≈8╓rÉRö√\0\0\0bKGD\0R\0R\0RQ═φ╥\0\0\0	pHYs\0\0─\0\0─ò+\0\0\0tIMEσ\n╫≤▓1\0\0╛IDATx┌═¢{p\\⌡u╟?┐▀╜{≈ε╙kieK╚╪Æà`╦/lC!╞CÿL%%/¡\'C\'à┤3ñφ@Ië╙tΦ4!	Ö@╥┬4xΩZî=bBmc∞P,â╟┐▒▒-┘û╡z¼ñ▌╜{_┐■▒╫╞û-imi\rgµ╬Hú╣W┐≤²¥≤;τ{~τ* ╓═7ûRΓ└dáÿ╠\0\ZÇZ äâWè@/p°╪∞v\0GÇüó∩╗µ¢oÄ∙Z┼X}(-¥Kû╚@▒à└¡└ì└4öè)Ñσy┬w]öδó|σ√ÑEHYzt⌐δMSa!r└`≡┐@+╨[│~╜ƒQΩ│@√\r7pÖiΩ└αOü╗QΩ*σ√q╧╢à¢╧πµrx²²°╣╩u┴≤└≈QüBÉ4¡B,åûHá╟bΦ╤(Üa(!e!v┐^│,╖~≤µOÇö⌠öv╝╕°║Rjè_,Ωv_vW^o/╩▓ ╪Θ)ªëûJaTWc$ô╚p╪B^\0V\0W¡_∩⌡\\ñE\\\0~K╞_R╛à[(Φ┼Lºú`\0╞╚D?Y⌐@╞πä&N$£NúG\"₧Ér?≡4≡éé╣n]σP--\Z░\0xÑnq-╦┤:;▒██Q∙<ùBD4èQ_ÅYSânÜB¼~\0╝\'╓¡≤*@αδα½└?*╧k░║╗àu°0~_▀╪∩x9æLbNÖé9~╝║~°!≡b╖m¬▀zk∞\0pû,A\"ⁿ=≡ákY╔B[N[╩≤°4Eh\ZíIôêLÜänÜ²└3└┐zJ⌡Ωδ╫Å\0o╔ñÇ\'PΩ^╗┐?£?t»½δ╥∩·0╓áUWml─H$è±αQ_⌐ô┌ ê2v╛°)J}Ñ╪╙╩∩▀_:Σ>â\"πqó╙ªaî∩!^vò:\Z9£╧f J}Ñ╪▌╩φ┘≤ÖU└ ╖g┼εεÉRΩα	]êT√\r7\\8\0ùÖª	ⁿ-J▌W∞Θ	σ÷εE\n|╓E\nΣ≈ε┼εΘ	í╘╜└▀çw∙.ä║o\0┐p·√ô╗wπ≈≈ƒì÷0╬»α`$α╘πÅ|_▀╥╥≥∞áòß▒+»─H&√Ç┐V₧/Dè!Æ£└╦₧eMφ▀╗/ô9²w7`+√\0δ<K¼gⁿ╩┌╙╔lτ░?°┘\\]G$ôÉJ!M┬a┤α}\0╧uQ┘,Ω°q&9Kü?	└l-¥&1cÜiεQ░mp▓ñƒ∙K¿⌠┴≡╕≥╝╞|{{Θ┤?c╫▀~₧HZ░ÇX,v╓|ÑΦhkc╬╬¥▄¬▌gP╗N├@M¥J┤«Äå╦.c╬∞┘,¡¡%æHìFëDúªëahí╨⌐╡α╢τaσ≤twu▒s╟₧⌡UZ▀{ÅeJ1y╝«.≥φφ─\Z\Zàª=.α■0⌠ç▓\0╒╥\"üoí╘SV&╔∩┌U\"/ütÅH╔╒Å=╞ƒ/[F2æ8█zöb∩ε▌<≥╚#|┤w/│µ╧ºy·tª]y%ô\Z¿¡½úfΓDÆ⌐!├@j\ZRê#º$J)∞bæ╖oτg?■1┌¬U<∞√╘ÅÉ\'Df═\"ÆNΓaαY▒n¥Ä∞X┤êÇ╗ ╡W,F\nGÄ£Ñⁿ)\0:\'NdqKù54£≈6/\\╚5≤τ│tΘRε_╢îT:ì«δh║^RtTß^6Mµ]s\rÅ} √|»Pαò5k°╦3\nτÇµyXGÄ`$═4┐ⁿa╟óEçµl▌zvhN&5α>σ√3¼╬Nⁿl÷▄0├└ççE₧GgO╫\\w╡ô&aF\"Φí╨¿ò?¢$Jª╧Ü┼╜▀ⁿ&oII≈Hß1¢Ñp≥$╩≈º≈5\'ô·Ya░¬┤╕╦ü{=╦╥φ÷÷ï╬≥\nΣ≥y╥ΘtYf}╤ h\ZΘt\ZO╙░G÷£÷v<╦╥ü{ü╦¥K\0tòx²ùöRì┼L?ù╗Φàσâwπ±x┼c~╚4╔╒╘░?ê6├ZA>Åò╔áöj\0εt>φIα╧|█┘ú½Z(σQòò+g═Γ>╚╙⌐[ç╔MNº÷°┼b°rá3▓±bÇy@│▌╫7ΩT╫÷<|)╤\rúΓ\0$╟Åτ/xÇ█zê ╨u:╦HòφRB7X0░x12«i\Z░T∙~▄Θε╛°≥╒⌐╪k█α√H)/IΩ¢Jº∙╥¥w╥5s&m#Æº½σyqα╓ÿªiê7·┼ót╗╗G┐óáαyΘÆàeYx∙<σ╪£█╙âo█╕	êKáÿΘ\nÑµhE╙≡à└┐D 8Ä├;[╢PΦùùâùeßöJw╙üz	╠A⌐╕ù╦ì╔╬╔└≈=╟╣$\0╪ûEkk+╡J*ï3√x╣(µHα*ÑT╪─÷.V┬Réτa_\"\0╠hö╗ε║ïw\Z\Z╪░╠▌``\0ÑTÿ%ü╩≤─hb Öbä├ ┼b±Æ\0áΘ:╖~ß▄≈φo≤ó«ô)╟r9öτ	`å\Z}╫Eì╤ÄÖæ\n(\\┬ΓI$c÷▄╣⌠%öSÿWÄâ_Γ9ì¿=}]5ïëF╤ñ$w	Kg╣╛>▐\\╗û+z{⌐.3RD»Vπò∩ÅYΦ2LôÜTèlo∩Θ╦╧╩FA┼÷╓V~ ╥K▄⌐ë2┬`m)	ÿJ⌐╙ò├₧≡Çr]\\wΦ╠[HIUUGóhYe}w┤\0Σpr╣╦dg╛\0╤ûO¥·╕W(H╗úcDΦ¢≥yîª&ªMƒÄ\0\\█■Σ)∙h▀>V¼\\╔╗∩╛ïgYhÜFz┬J	τ╪ïétM\r]²²lyτ«Fd!Rb╘╓óG\"╒╥Æ││┘Φ└÷φτ@╬q`≡ïtÜ·àï¥S:╘▐Ä▐┌J┌≤\0·»╛Ü∩-_╬Γ█nCà*fo¡[╟?|φkⁿ4ôíi$╨t¥°▄╣⌐öÑYñîRFε«ïü┌Lå_¥┬yèó7╠¬\n╚ ╜mO■ΦG╘╒╫s╒╝ycZ9\rÇ∩╙┘╤üÖ═+╧ládæYΦÉÜVGÖΣ┼\0µò_5─9qΩK&p≡╤µ═ⁿ╫è<║|9╔±π╟ÇÄ÷vV╜·*79Ueªδ▓@çÄH]G\\áyjAAq≡3╞4≡U▀g²+»╨·╟?Ä-GPèlW/«\\I╟Ü5▄le╕Ç╘uÇ#:░OhÜÆæê≡╟(∞│ü╧╡╖≤≥╦/│α┌kIUWÅÑ|▓Yr╣B╩R⌠	|▌╖m╫ÑP(É╔dxsφZ╓<≈▀-h(ù»D\"Ñ>$╪º╗É╥╤	├=y▓2Ö\Zp≡╪┌╡∞╪╢ìo╣1ö╦)┼₧;°┘ôOr°╪1äª!╬\0\0█╞s]╝\\∩─	&wv≥¿R,é▓├áûHÇö░K>BΣ⌡X╠(\nQæ+op╧Emm¼yφ5^=╤Db╚╜φΦQ▐\\╡èr9&╩K>╣&τ╦╕└┼s╔y₧Pï╟BΣü:p8óGú)ÅMM`+h~▓a`÷ⁿ∙C&R╙g╬dΩ╝yL▄╝Ö%âömß0z4\np8(ü~αm═4òûLV,c└U@═╬¥¼π\r¼a·ëΩ.┐£█n┐¥▀KI/ƒ\\╕ÄE\0ò╔$Üi*`3╨\'=Ñ`¡É▓¬p-?▄φ√╝°ⁿ≤¼]│åΓî1s█wp|ε\\▐/ú┌{i#F:ìö╥╓·J9┌?:─≥⌐S{ΓïB╙&╪]]PíbåΩ(]Z>√┴─b1\Z¢Ü.íA2òó╗╗¢╖7nΣ·r╥█r⌠ÅDê64 \rc?≡╧r²·\r`∙╘⌐P\'4φ╧qä╫█[1+0é1₧╔≡▄╗∩\"c1f57\ZTF╫u¥x4╩o▐~¢½2Ω╟└é╓:_±kα╡:ΣKÇn█vüùäößÜ\ZDàk·qαï└C¼x·i╢n┘r.uéªΘ╙Ö╓▄╠ε2K]├ε╛a₧0!σIα·J+é₧║=└ΩP,µçΩΩ*╬π\rJ¥╘╫<╚∩V»ªp₧Æ£ì╥<{6√╟\0ÇPm-íX╠V╗╟m▄x┌-KàBÑè└│B╙Ä¢╡╡êHñΓ D)uz┤n▌╩±÷÷≤░VIu:═╔Q \"╠┌Zäª¥\0₧t=Çáòl\'░BÅ┼▄≡ö)ìºBc#α∞█╟╤├ç╧I┬N.F╡\n!O₧îï╣öÜ½w£┘6wVu╠▓α▀à∩Gjj╨\'L¿╕TU┘,φGÅΓ\r¬K·╛╧±c╟¿╗Ç4w░Φ&`û|;≡o▌╢φÄLº%Φ╜o~(\rú;:e\n▓┬╫▄aJ#$╟Ä╟tf╗║h}∩=f1¿Ö⌐▄░ïÖ2═0║)⌡╖\rε!>\'àδ╓)α\rαÖP<^î45U4*H`\"pΓΦQⁿ3,└▒m▐▐╕æ╬m█ÿ{ âHSF<n┐■Φ6<\0\0⌠⌡üºbu╕¬╩3¢Ü║^1\0Æ└ëô\'q,╧u╚fY┐f\r?Ω)ε∞∞ñ±Bò╫u╠ª&┬╒╒>B¼₧:fY┼íΩ\Zτ╚»Äπ±╞╞éb¢b₧ì6¿P¿ö ì1[@░╩≈1├a÷φ┘├+W≥ƒ╧<├τ?ⁿÉ/Cye«S▀╙4┬MMDδΩö╨┤M└w|ÑÄì█┤i╚ ?taóÑEêçyNy▐uà\'ä⌡╤GcvïtJ·Ç▀kâp╫LΘε║9òe+\na65⌐¡UB╙■°ûé]≥<ª_6╗@ÿⁿR∙■\rV&#îy▀░º»╡LN7m^P¼Å\\qf:φ)╖\0Ñ`τp╩ùM»«\0₧TJ}▐Θδσ?■°│13pjVáíüP2Θ!^╛½α└H╩_P}!Φ!₧<\n,≤,+Q8~╗¡\re█ƒÄεåü1iæ║:┤╥┤╚»üQ╨Qε\0╒%Yà┼ï15-\n▄\r<ª|Ü▌╫\'¡÷v▄╬╬1╗`-º¼¡╫╘`╓╫c$ô~0=÷≡[╦≤≥æ\r.Φ╛≡jt⌐ºx&≡0p╖∩8π∞lVO£└δΩ\Z±åΘów\\╫╤¬½	╫╓bîºd(öÑ4D∙`╧Ö=└\0└]▓Mê≡9α!α&▀uπ╬└Ç░╗╗q3ⁿ|~⌠Víi╚h=¥╞¿¬\"Å+⌐δ└[öf7xJ╩É\ZS\0É± r▌▄¼|┐┌w══σp·√q│┘ÄS▓Äí.Gé∙aBíÆ╥π╞\nFhe(Σ	)╗Ç\r└J`ôé■r║è0ΦÉîƒ;(\rO7úTR∙~╚wß9╛m?<╠╚PH!Ñ#äΦXΩ└\Z`»é┬┼LëVÇSr╞yî╥@⌡BαjJwª3(╬	ƒ%Ω¡é─p/≡>░ì╥─°a ╖ú»╧ƒ┤╣Åòⁿ?t∞¡┴▄\n\0\0\0\0IEND«B`é',16,16),(9,'calendar','image/png',_binary 'ëPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0╙\0\0\0╠\0\0\0Θçûù\0\0\0	pHYs\0\0\0\0╥▌~ⁿ\0\0\nOIDATx┌φ¥?r█HçRM09∙Të╬6m▓UéN`ε	¥└⌠	Le¢Ö:ü¿P\'0tôßFCσÉUL╞\r╨(a5▌\r4■░√√¬Xû╩D6≡ß╜~Φn£φ≈{⌡îæñ▒yIR\"i+ie~╧╠╧[╟ñG£⌡Dªíñ⌐ñT╥àσ6╧ÆµdÆ43mPq√s└3╬ÄI╠2-$▌x┌╫-Qèc½LsIƒ=∩≤Ü┼1ëMªD╥≈÷√b:╦└1i¥≤Ä■εñí²^ÿô▄I9&º)╙╕ß+,╕3Γÿ£ªL\0╚\0╚ÇL\0╚ÇL\0ÇL\0╚ÇL\0ÇL\0╚ÇL\0╚\0╚ÇL\0╚ÇL\0ÇL\0▌b╗á╩D»+z=ⁿ▌KO√9─ïñ\rç6èc▓2»Ñz░Ü∞1Öè=δ,F╨O╩╧\\⌡Mªë≥┼æNì{\0z!S*Θüc\'╠Z»hìsDé@√╦╢ hYª1\"A@\\Ö>T\'i▐╩\r╘Ru╖êLDé@i-:æi)Θφü≥¢Z(Fæ)í╜!`Z9┐╧ò╕ƒ!3nKª!m\rα/═\0d@&\0d\0d@&\0d@&\0@&\0d@&\0dó	\0É	\0Ö\0É	\0É	\0Ö\0É	\0Ö\0\0Ö\0║πù\Z█>èτ A;|\r]ªàñîπ╚DÜÇL\0╚ÇL\0ÇL\0╚ÇL\0╚\0╚╨9┐┤≡7╞Ω■P∙·ö⌠αÿ¡T æÆ!ô¿dÜ+î|ù▄╔╧âé┐≈αÿ]½■0«ÉÄ	i\0}&\0@&\0d@&\0d\0d@&\0d\0d@&\0d@&\0@&\0d@&\0d\0d@&\0d\0d@&\0d@&\0@&\0d@&\0d\0d@&\0d\0dhê6v6U?₧Rτâδ│╟$^ÖV╡W╚≈X	H≤\0É	Ç>Ç╙O¢▀Å=±}[JEW╚132≥$FÜ╦\n√°DdéXKJ%M$]Éµ╕Gái╠!°Φ LO1C&ΦôD3IW4┼_í4╢Θ\\&Θ√ëèöΩ╡èêL╨	Cë■8±ht!Θçñ╣\ZFàLp,Ñ[I·\Z╨w·l╛SéL╨3ô╥àXí╗0▀mε{╟ αmZ╖l0Ñ[+-^îj╚▐y_1:ó°╖ë╧≤┘D¿ë<ì`G&(ƒ└K╧╤Φ┘ô╔m─}÷N┌96 ·*╔_û╥╛┌├û╬÷√}b┬₧+╫\ngJ²ú\\ñü\'üf█#Φ─╝|ëuk>7}&¿Lj.ªuD┌Izö⌠┴ê╣hP$Ö}/îL$▌¢╧Pç╙╚òEz¿)╤¥≥√P⌐║Ö=╗Q>\Zcd>╦«+í┌Éi&i▀±╦W:Ü⌠]Ωè⌠d·0│åúÉK┤Ü⌐╗è╚o▒íji°┼⌠ù╜U┴\ZÉ*5ƒ±ÑåPdæ▓è}ñ╟╥÷}\'3ƒ⌡╛Γ÷9ABª╕ÜôñèH╖µè┐=í∩╗5²⌐█\n}⌐ü≥èΣÖαs╣╧z▌I·¿ÜeπÄY(»2║\nuaäB&°K┴ßªéHë┬X\Zleèk╟φ«ö6É	$s╣╓f╗É╓╪█Üïâ½P_m·O╚«²ñ¥≥j╓6└╢¿*╘Ö ò█@╤\"╡█▄&[s▒pΘC]*/f╝]├fX!╜KLφèQαë^╫╞[u7µsⁿp╪fª#CÑÉ)lªÄΘ▌¥¬WBOìñ∩ìH6\'j╓AQΓïñoû∩ÿïSJÜ_TÜ:╝┐8í}Gób╢ε▒⌐W╩█.:hº╣≥íQ╢▄(/╠ QΘ▌~R┌Ç╠Ö▄µG▌¿ü░û⌐¡K iåLDÑc\'ç∩é├\\╒FZ|V+	(HñÄ╥ÅÉ)Rçy▌P4Hjl;Θá═û&╒uicdè$┼kΓ╜.£Γb,│:φåLßæ8£╚┼\Z\rÉô╔~.╘αmtBª0S╝&«─▒αÆ≥NÉ)ll√kó╥AV}ºO*M╤@ª≡D▓-<╠i.┐╤	Ö┬δ/┘▓ñ╣Ä╢═╬╡═æ)NÖ₧µêp▀BÖ\"e(√Y┤D%m4É╣╔îLñxP┐ìÉ)0lçα¼I±¼yF&d:FFSYô!S£î,▀╖ó⌐É	ÄsëL▐▒m½2qé└q\\·ûcd\nâ─≥};Ü╩█\"─É5 êJ}$U²ç8»öù╖│╢>42A╣P²∙PW╩gφ>╩ öⁿCîH≤ tnToí█╚6j#2e=h╨ìº²,z≡}6°QY¿FÅ][2eüöτσ╔2m·<$═âX¿·Tv█æ%[déÿH*lc√░│2┼┼ê& ═âƒ\\-▀wAS5ûµ!S ╕{!:╣Ñx╢kjd╚/╛»┤G≡JmàLß░ΘÖLO=kƒ*ô\"m█ΩÖ┬\"│|_╥╥τΘ█RbU>Åm[mÉ)╬µ¬E╣o{╥6╧¬v├=qi{dè│?╨╓S&Æ>J·w╟Θ]ò∩;ûC±A¬7£h.µΦJ·╒RªeïÆ M╥?$²K╥∩µ3■i■ ┐Æ■╙╨▀^╓H7S╦≈φè┘┘~┐Oö?Γa\'√;√▒▓æ▌}╣º\"≥æµ┼╔@▌<P∞THdâ;+~@ªxÖ╥╡S<ò╙σs·=╤r%FCbñ|■ô\rkòε∩¥ï╒jbfF╘è╪ W▄8█∩≈E¿·D;F╔1{╖ò■px oσ╠εⁿm▐╤▒á	*EΩ╟╖]ñ\"2I÷Ñ@Åk▒y\"╖[D▀væ╩╒╝ös*ΩΦ√}\'ù¢╗╧:Pk(╦öI║τ╝èÆ┼]îÿ╔~¡÷w╙┴rÜW╛J▌p~E╔?#∞?╗ªw╧zg\0∞!Öñ╝<°ìs+:vµDëσv╔╨╘\n█╝[²<?Æ?~P^▒ÇxD╘\ZÜ«ìïH≈:rß╜╚Tfñ|WB\'⌡d∙╗∞Fô¼═±ytîδ╜╒¥qa[G&ê»_║PUΩ?φO2╨52╣Wj/═vCD╥ú,\n3Dª╕X╔¡Rä*·Hì}\"S\\LΣ■⌠└K╙Θ>σ%┬╞E┌)╠`u!Aª╕╪¿┌ñ└üñ:═9PiEæd╛»⌡mdè│ Tu╒áof√╤ëñuKIr+|æπ `dèôàñ╗è█^Ö½uƒúTjóp╒iEÅ¬░ñ¬3t∞E∙8╡EO╛Ob$╕¼▒Å╩╧└E&¿+TñJ═½ε¢╡&ìLPt┤}î┼▄íµj~÷ε¿$æÅyx╡ƒ╩ÄLP╛║?x▄▀Zy▒b)≤Ü╘Lσ▐rδ#¬\"ö)ε╟\Z╪w1ín[Æ½°╜╠P»≈┤╞&ì╒╠\ZΘ;#ª┘æ	tαd^¬╜■╗óXâ▄[:Ji▐▓5⌐╘╣Åû8εL┤≤┌»#2┴╧:∙ïÇó╘┌⌠\rÖⁿHdéclLö║ò²c>√╚╬|ç▒\Z£ELdù╛╘╘╝\'$╤\\-=■Öá¬T⌐·╗╬b½!° òƒæ>√Dsu4Ö└#σeµT~oª┌\n┤P^╬▀t┘╚Mêòö^╛S┴σ7Yï╫ª/_Öáì>╓╪╝åz]└qx$è╜ö$╔L┐gÑ├#&z├ \0ZbëCâ#\n*\0\0\0\0IEND«B`é',16,16);
/*!40000 ALTER TABLE `workflow_icon` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_prerequisite` (
  `id_prerequisite` int NOT NULL AUTO_INCREMENT,
  `id_action` int NOT NULL,
  `prerequisite_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_prerequisite` WRITE;
/*!40000 ALTER TABLE `workflow_prerequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_prerequisite_duration_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_prerequisite_duration_cf` (
  `id_prerequisite` int NOT NULL,
  `duration` int NOT NULL,
  PRIMARY KEY (`id_prerequisite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_prerequisite_duration_cf` WRITE;
/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_prerequisite_duration_cf` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=4277 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_resource_history` WRITE;
/*!40000 ALTER TABLE `workflow_resource_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_history` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_resource_user_history` WRITE;
/*!40000 ALTER TABLE `workflow_resource_user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_user_history` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_resource_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_resource_workflow` DISABLE KEYS */;
INSERT INTO `workflow_resource_workflow` VALUES (841,'appointment',170,51,5,0),(842,'appointment',170,51,5,0),(843,'appointment',170,51,5,0),(844,'appointment',170,51,5,0),(845,'appointment',170,51,5,0),(846,'appointment',170,51,5,0),(847,'appointment',170,51,5,0),(848,'appointment',170,51,5,0),(849,'appointment',170,51,5,0),(850,'appointment',170,51,5,0),(851,'appointment',170,51,5,0);
/*!40000 ALTER TABLE `workflow_resource_workflow` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_resource_workgroup` WRITE;
/*!40000 ALTER TABLE `workflow_resource_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_resource_workgroup` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_state` WRITE;
/*!40000 ALTER TABLE `workflow_state` DISABLE KEYS */;
INSERT INTO `workflow_state` VALUES (170,'Non valid├⌐','Non valid├⌐',51,1,0,NULL,1),(171,'Valid├⌐','Valid├⌐',51,0,0,NULL,2),(172,'Valid├⌐ - Rappel├⌐','Valid├⌐ - Rappel├⌐',51,0,0,NULL,3),(173,'Annul├⌐','Annul├⌐',51,0,0,NULL,4),(174,'Honor├⌐','Honor├⌐',51,0,0,NULL,5),(175,'Non honor├⌐','Non honor├⌐',51,0,0,NULL,6);
/*!40000 ALTER TABLE `workflow_state` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task` WRITE;
/*!40000 ALTER TABLE `workflow_task` DISABLE KEYS */;
INSERT INTO `workflow_task` VALUES (428,'taskReportAppointment',247,1),(429,'taskReportAppointment',248,1),(430,'taskUpdateAppointment',246,1),(431,'taskUpdateAppointment',245,1),(432,'taskUpdateAppointmentCancelAction',236,1),(433,'taskTypeComment',238,1),(434,'taskUpdateAppointment',245,2),(435,'taskReportAppointment',247,2),(436,'taskAlertGru',249,1);
/*!40000 ALTER TABLE `workflow_task` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_alert_gru_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_alert_gru_cf` (
  `id_task` int NOT NULL,
  `id_spring_provider` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `marker_provider_ids` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_status` int DEFAULT NULL,
  `crm_status_id` int DEFAULT '1',
  `set_onglet` smallint DEFAULT NULL,
  `message_guichet` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status_text_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_max_step_guichet` smallint DEFAULT '1',
  `demand_user_current_step_guichet` smallint DEFAULT '1',
  `is_active_onglet_guichet` smallint DEFAULT '0',
  `status_text_agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_active_onglet_agent` smallint NOT NULL DEFAULT '0',
  `subject_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sender_name_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cc_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_email` smallint DEFAULT '0',
  `message_sms` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `billing_account_sms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `billing_group_sms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_sms` smallint NOT NULL DEFAULT '0',
  `id_mailing_list_broadcast` int DEFAULT NULL,
  `email_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_broadcast` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `recipients_cc_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_broadcast` smallint DEFAULT '0',
  `days_to_alert` int DEFAULT NULL,
  `id_state_after` int DEFAULT NULL,
  `alert_subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `marker_alert` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `alert_after_before` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_alert_gru_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_alert_gru_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_alert_gru_cf` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_alert_gru_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_alert_gru_history` (
  `id_history` int NOT NULL,
  `id_task` int NOT NULL,
  `crm_status_id` int DEFAULT '1',
  `message_guichet` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status_text_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_max_step_guichet` smallint DEFAULT '1',
  `demand_user_current_step_guichet` smallint DEFAULT '1',
  `is_active_onglet_guichet` smallint DEFAULT '0',
  `status_text_agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_active_onglet_agent` smallint NOT NULL DEFAULT '0',
  `subject_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sender_name_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cc_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_email` smallint DEFAULT '0',
  `message_sms` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `billing_account_sms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `billing_group_sms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_sms` smallint NOT NULL DEFAULT '0',
  `id_mailing_list_broadcast` int DEFAULT NULL,
  `email_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_broadcast` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `recipients_cc_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_broadcast` smallint DEFAULT '0',
  PRIMARY KEY (`id_history`,`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_alert_gru_history` WRITE;
/*!40000 ALTER TABLE `workflow_task_alert_gru_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_alert_gru_history` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_archive_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_archive_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `next_state` int NOT NULL,
  `type_archival` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `delay_archival` int DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_archive_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_archive_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_archive_cf` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_archive_resource` WRITE;
/*!40000 ALTER TABLE `workflow_task_archive_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_archive_resource` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_assignment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_assignment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_assignment_cf` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_change_appointment_status_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_change_appointment_status_cf` (
  `id_task` int NOT NULL,
  `appointment_status` int DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_change_appointment_status_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_change_appointment_status_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_change_appointment_status_cf` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_change_state_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_change_state_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `id_next_state` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_change_state_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_change_state_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_change_state_config` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_change_state_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_change_state_information` (
  `id_history` int NOT NULL,
  `id_task` int NOT NULL,
  `new_state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_change_state_information` WRITE;
/*!40000 ALTER TABLE `workflow_task_change_state_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_change_state_information` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_choose_state_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_choose_state_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `controller_name` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_state_ok` int NOT NULL,
  `id_state_ko` int NOT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_choose_state_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_choose_state_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_choose_state_config` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_choose_state_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_choose_state_information` (
  `id_history` int NOT NULL,
  `id_task` int NOT NULL,
  `new_state` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_choose_state_information` WRITE;
/*!40000 ALTER TABLE `workflow_task_choose_state_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_choose_state_information` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_comment_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_comment_config` (
  `id_task` int NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_mandatory` smallint DEFAULT '0',
  `is_richtext` smallint DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_comment_config` WRITE;
/*!40000 ALTER TABLE `workflow_task_comment_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_comment_config` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_comment_value` WRITE;
/*!40000 ALTER TABLE `workflow_task_comment_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_comment_value` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_manual_app_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_manual_app_notify` (
  `id_notif` int NOT NULL,
  `id_history` int DEFAULT NULL,
  `id_appointment` int DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_notif`),
  KEY `idx_wf_task_manual_app_notify` (`id_appointment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_manual_app_notify` WRITE;
/*!40000 ALTER TABLE `workflow_task_manual_app_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_manual_app_notify` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_notification_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notification_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notification_cf` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_notify_admin_appointment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_admin_appointment_cf` (
  `id_task` int NOT NULL,
  `id_admin_user` int DEFAULT NULL,
  `sender_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `recipients_cc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `recipients_bcc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_action_cancel` int DEFAULT NULL,
  `id_action_validate` int DEFAULT NULL,
  `ical_notification` smallint DEFAULT '0',
  `create_notif` smallint DEFAULT '0',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_notify_admin_appointment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_admin_appointment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_admin_appointment_cf` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_notify_appointment_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_appointment_cf` (
  `id_task` int NOT NULL,
  `sender_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `recipients_cc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `recipients_bcc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_action_cancel` int DEFAULT NULL,
  `ical_notification` smallint DEFAULT '0',
  `create_notif` smallint DEFAULT '0',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `is_sms` smallint DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_notify_appointment_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_cf` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_notify_appointment_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_appointment_crm` (
  `id_task` int NOT NULL,
  `id_demand_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status_text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_status_crm` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `object` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_notify_appointment_crm` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_crm` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_appointment_crm` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_notify_gru_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_gru_cf` (
  `id_task` int NOT NULL,
  `id_spring_provider` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `marker_provider_ids` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_status` int DEFAULT NULL,
  `crm_status_id` int DEFAULT '1',
  `set_onglet` smallint DEFAULT NULL,
  `message_guichet` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status_text_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_max_step_guichet` smallint DEFAULT '1',
  `demand_user_current_step_guichet` smallint DEFAULT '1',
  `is_active_onglet_guichet` smallint DEFAULT '0',
  `status_text_agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_active_onglet_agent` smallint NOT NULL DEFAULT '0',
  `subject_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sender_name_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cc_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_email` smallint DEFAULT '0',
  `message_sms` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `billing_account_sms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `billing_group_sms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_sms` smallint NOT NULL DEFAULT '0',
  `id_mailing_list_broadcast` int DEFAULT NULL,
  `email_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_broadcast` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `recipients_cc_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_broadcast` smallint DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_notify_gru_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_gru_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_gru_cf` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_notify_gru_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_gru_history` (
  `id_history` int NOT NULL,
  `id_task` int NOT NULL,
  `crm_status_id` int DEFAULT '1',
  `message_guichet` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status_text_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_guichet` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `demand_max_step_guichet` smallint DEFAULT '1',
  `demand_user_current_step_guichet` smallint DEFAULT '1',
  `is_active_onglet_guichet` smallint DEFAULT '0',
  `status_text_agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_active_onglet_agent` smallint NOT NULL DEFAULT '0',
  `subject_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `sender_name_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cc_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_email` smallint DEFAULT '0',
  `message_sms` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `billing_account_sms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `billing_group_sms` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_sms` smallint NOT NULL DEFAULT '0',
  `id_mailing_list_broadcast` int DEFAULT NULL,
  `email_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sender_name_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_broadcast` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `recipients_cc_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `recipients_cci_broadcast` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active_onglet_broadcast` smallint DEFAULT '0',
  `code_event` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type_event` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message_event` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_history`,`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_notify_gru_history` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_gru_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_gru_history` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_notify_gru_mapping_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_gru_mapping_manager` (
  `id_notifygrumappingmanager` int NOT NULL,
  `beankey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `connection_id` int NOT NULL DEFAULT '0',
  `customer_id` int NOT NULL DEFAULT '0',
  `mobilephonenumber` int NOT NULL DEFAULT '0',
  `fixedphonenumber` int NOT NULL DEFAULT '0',
  `email` int NOT NULL DEFAULT '0',
  `demandetype` int NOT NULL DEFAULT '0',
  `demand_reference` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_notifygrumappingmanager`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_notify_gru_mapping_manager` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_gru_mapping_manager` DISABLE KEYS */;
INSERT INTO `workflow_task_notify_gru_mapping_manager` VALUES (5,'notifygru-appointment.ProviderService.@.5',-1,-1,-1,-1,-1,231,-1);
/*!40000 ALTER TABLE `workflow_task_notify_gru_mapping_manager` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_notify_reminder_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_notify_reminder_cf` (
  `id_task` int NOT NULL,
  `id_form` int NOT NULL DEFAULT '0',
  `nb_alerts` int DEFAULT '0',
  PRIMARY KEY (`id_task`,`id_form`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_notify_reminder_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_notify_reminder_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_notify_reminder_cf` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_set_app_resource_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_set_app_resource_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `id_form_resource_type` int NOT NULL DEFAULT '0',
  `is_mandatory` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_set_app_resource_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_set_app_resource_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_set_app_resource_cf` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_set_appointment_resource_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_set_appointment_resource_history` (
  `id` int NOT NULL DEFAULT '0',
  `id_history` int NOT NULL DEFAULT '0',
  `id_appointment` int NOT NULL DEFAULT '0',
  `id_resource` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `id_form_resource_type` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_wf_set_app_res_hist_id_hist` (`id_history`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_set_appointment_resource_history` WRITE;
/*!40000 ALTER TABLE `workflow_task_set_appointment_resource_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_set_appointment_resource_history` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_update_admin_appointment` WRITE;
/*!40000 ALTER TABLE `workflow_task_update_admin_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_task_update_admin_appointment` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_task_update_appointment_cancel_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_task_update_appointment_cancel_cf` (
  `id_task` int NOT NULL,
  `id_action_cancel` int DEFAULT NULL,
  `id_action_report` int DEFAULT NULL,
  PRIMARY KEY (`id_task`),
  KEY `fk_wf_task_up_app_cancel_cf` (`id_action_cancel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_task_update_appointment_cancel_cf` WRITE;
/*!40000 ALTER TABLE `workflow_task_update_appointment_cancel_cf` DISABLE KEYS */;
INSERT INTO `workflow_task_update_appointment_cancel_cf` VALUES (432,237,247);
/*!40000 ALTER TABLE `workflow_task_update_appointment_cancel_cf` ENABLE KEYS */;
UNLOCK TABLES;
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `workflow_workflow` WRITE;
/*!40000 ALTER TABLE `workflow_workflow` DISABLE KEYS */;
INSERT INTO `workflow_workflow` VALUES (51,'Workflow Générique - validation automatique','Workflow complet, générique avec validation automatique','2021-11-19 17:51:33',1,'all');
/*!40000 ALTER TABLE `workflow_workflow` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `workflow_workgroup_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workflow_workgroup_cf` (
  `id_task` int NOT NULL DEFAULT '0',
  `workgroup_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_mailing_list` int DEFAULT NULL,
  PRIMARY KEY (`id_task`,`workgroup_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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

