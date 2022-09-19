-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: default@default
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `ActivityEvent`
--

DROP TABLE IF EXISTS `ActivityEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ActivityEvent` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ownerId` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ownerType` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `relatedId` mediumtext COLLATE utf8mb4_unicode_ci,
  `relatedType` mediumtext COLLATE utf8mb4_unicode_ci,
  `relatedText` mediumtext COLLATE utf8mb4_unicode_ci,
  `showRelatedImage` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` mediumtext COLLATE utf8mb4_unicode_ci,
  `city` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Advertisement`
--

DROP TABLE IF EXISTS `Advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Advertisement` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `externalLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `clicks` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `media` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `campaign` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media` (`media`),
  KEY `campaign` (`campaign`),
  CONSTRAINT `Advertisement_ibfk_1` FOREIGN KEY (`media`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Advertisement_ibfk_2` FOREIGN KEY (`campaign`) REFERENCES `AdvertisementCampaign` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdvertisementCampaign`
--

DROP TABLE IF EXISTS `AdvertisementCampaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdvertisementCampaign` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `startAt` datetime(3) NOT NULL,
  `endAt` datetime(3) NOT NULL,
  `priority` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `client` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  CONSTRAINT `AdvertisementCampaign_ibfk_1` FOREIGN KEY (`client`) REFERENCES `Client` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Analytics`
--

DROP TABLE IF EXISTS `Analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Analytics` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `ip` mediumtext COLLATE utf8mb4_unicode_ci,
  `action` mediumtext COLLATE utf8mb4_unicode_ci,
  `actionId` mediumtext COLLATE utf8mb4_unicode_ci,
  `entityId` mediumtext COLLATE utf8mb4_unicode_ci,
  `entityName` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `Analytics_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Announcement`
--

DROP TABLE IF EXISTS `Announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Announcement` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduledAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `sponsorList` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sponsorList` (`sponsorList`),
  CONSTRAINT `Announcement_ibfk_1` FOREIGN KEY (`sponsorList`) REFERENCES `SponsorList` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AnnouncementUser`
--

DROP TABLE IF EXISTS `AnnouncementUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnnouncementUser` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL,
  `sendError` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `announcement` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `announcement` (`announcement`),
  KEY `user` (`user`),
  CONSTRAINT `AnnouncementUser_ibfk_1` FOREIGN KEY (`announcement`) REFERENCES `Announcement` (`id`) ON DELETE SET NULL,
  CONSTRAINT `AnnouncementUser_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Audience`
--

DROP TABLE IF EXISTS `Audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Audience` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Audience2`
--

DROP TABLE IF EXISTS `Audience2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Audience2` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `opened` tinyint(1) DEFAULT NULL,
  `bounce` tinyint(1) DEFAULT NULL,
  `sendError` mediumtext COLLATE utf8mb4_unicode_ci,
  `mandrillId` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `campaign` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign` (`campaign`),
  KEY `user` (`user`),
  CONSTRAINT `Audience2_ibfk_1` FOREIGN KEY (`campaign`) REFERENCES `Campaign` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Audience2_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AuditLog`
--

DROP TABLE IF EXISTS `AuditLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuditLog` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `action` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `relatedObject` mediumtext COLLATE utf8mb4_unicode_ci,
  `relatedObjectId` mediumtext COLLATE utf8mb4_unicode_ci,
  `relatedObjectField` mediumtext COLLATE utf8mb4_unicode_ci,
  `oldValue` mediumtext COLLATE utf8mb4_unicode_ci,
  `newValue` mediumtext COLLATE utf8mb4_unicode_ci,
  `otherValue` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `updatedBy` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `updatedBy` (`updatedBy`),
  CONSTRAINT `AuditLog_ibfk_1` FOREIGN KEY (`updatedBy`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Award`
--

DROP TABLE IF EXISTS `Award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Award` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `badge` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  KEY `badge` (`badge`),
  CONSTRAINT `Award_ibfk_1` FOREIGN KEY (`badge`) REFERENCES `Badge` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Badge`
--

DROP TABLE IF EXISTS `Badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Badge` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rarity` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `fallbackLogo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `parent` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fallbackLogo` (`fallbackLogo`),
  KEY `parent` (`parent`),
  KEY `logo` (`logo`),
  CONSTRAINT `Badge_ibfk_1` FOREIGN KEY (`fallbackLogo`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Badge_ibfk_2` FOREIGN KEY (`parent`) REFERENCES `Badge` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Badge_ibfk_3` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BankAccount`
--

DROP TABLE IF EXISTS `BankAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BankAccount` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountHolder` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountNumber` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `branchNumber` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `swiftCode` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `BankAccount_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BatchPayment`
--

DROP TABLE IF EXISTS `BatchPayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BatchPayment` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `statusMessage` mediumtext COLLATE utf8mb4_unicode_ci,
  `number` int(11) NOT NULL,
  `code` mediumtext COLLATE utf8mb4_unicode_ci,
  `amount` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversionCurrency` mediumtext COLLATE utf8mb4_unicode_ci,
  `conversionPrice` mediumtext COLLATE utf8mb4_unicode_ci,
  `conversionDate` datetime(3) DEFAULT NULL,
  `paymentProcessor` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BattleRoyaleScore`
--

DROP TABLE IF EXISTS `BattleRoyaleScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BattleRoyaleScore` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `positions` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `kills` int(11) NOT NULL,
  `isPreset` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Blurb`
--

DROP TABLE IF EXISTS `Blurb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Blurb` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerptOverride` tinyint(1) NOT NULL,
  `excerpt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` mediumtext COLLATE utf8mb4_unicode_ci,
  `featured` tinyint(1) DEFAULT NULL,
  `publishedAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `author` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191)),
  KEY `author` (`author`),
  KEY `logo` (`logo`),
  CONSTRAINT `Blurb_ibfk_1` FOREIGN KEY (`author`) REFERENCES `BlurbAuthor` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Blurb_ibfk_2` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BlurbAuthor`
--

DROP TABLE IF EXISTS `BlurbAuthor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlurbAuthor` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `biography` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logo` (`logo`),
  CONSTRAINT `BlurbAuthor_ibfk_1` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BlurbCategory`
--

DROP TABLE IF EXISTS `BlurbCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlurbCategory` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BlurbTag`
--

DROP TABLE IF EXISTS `BlurbTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlurbTag` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BountyLog`
--

DROP TABLE IF EXISTS `BountyLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BountyLog` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `amount` decimal(65,30) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `stage` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `match` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stage` (`stage`),
  KEY `match` (`match`),
  KEY `team` (`team`),
  CONSTRAINT `BountyLog_ibfk_1` FOREIGN KEY (`stage`) REFERENCES `CompetitionStage` (`id`) ON DELETE SET NULL,
  CONSTRAINT `BountyLog_ibfk_2` FOREIGN KEY (`match`) REFERENCES `CompetitionMatch` (`id`) ON DELETE SET NULL,
  CONSTRAINT `BountyLog_ibfk_3` FOREIGN KEY (`team`) REFERENCES `CompetitionTeam` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Breaking`
--

DROP TABLE IF EXISTS `Breaking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Breaking` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `isLink` tinyint(1) NOT NULL,
  `link` mediumtext COLLATE utf8mb4_unicode_ci,
  `icon` mediumtext COLLATE utf8mb4_unicode_ci,
  `publishedAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BugReport`
--

DROP TABLE IF EXISTS `BugReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BugReport` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` mediumtext COLLATE utf8mb4_unicode_ci,
  `osVersion` mediumtext COLLATE utf8mb4_unicode_ci,
  `osName` mediumtext COLLATE utf8mb4_unicode_ci,
  `deviceType` mediumtext COLLATE utf8mb4_unicode_ci,
  `browserName` mediumtext COLLATE utf8mb4_unicode_ci,
  `fullBrowserVersion` mediumtext COLLATE utf8mb4_unicode_ci,
  `mobileVendor` mediumtext COLLATE utf8mb4_unicode_ci,
  `mobileModel` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Campaign`
--

DROP TABLE IF EXISTS `Campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Campaign` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `html` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `audienceSelection` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduledAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `audience` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audience` (`audience`),
  CONSTRAINT `Campaign_ibfk_1` FOREIGN KEY (`audience`) REFERENCES `Audience` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CarCategory`
--

DROP TABLE IF EXISTS `CarCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CarCategory` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `game` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game` (`game`),
  CONSTRAINT `CarCategory_ibfk_1` FOREIGN KEY (`game`) REFERENCES `Game` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CarMake`
--

DROP TABLE IF EXISTS `CarMake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CarMake` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CarSelection`
--

DROP TABLE IF EXISTS `CarSelection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CarSelection` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `car` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `event` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event` (`event`),
  CONSTRAINT `CarSelection_ibfk_1` FOREIGN KEY (`event`) REFERENCES `CompetitionEvent` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Chat`
--

DROP TABLE IF EXISTS `Chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Chat` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `roomId` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `noReply` tinyint(1) DEFAULT NULL,
  `unread` int(11) DEFAULT NULL,
  `requestAdmin` tinyint(1) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roomId_UNIQUE` (`roomId`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CheckIn`
--

DROP TABLE IF EXISTS `CheckIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CheckIn` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `stage` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `stage` (`stage`),
  KEY `team` (`team`),
  CONSTRAINT `CheckIn_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CheckIn_ibfk_2` FOREIGN KEY (`stage`) REFERENCES `CompetitionStage` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CheckIn_ibfk_3` FOREIGN KEY (`team`) REFERENCES `CompetitionTeam` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `companyName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainContactFirstName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainContactLastName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainContactEmail` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mainContactCellNumber` mediumtext COLLATE utf8mb4_unicode_ci,
  `hasSeperatePaymentContact` tinyint(1) NOT NULL,
  `paymentContactFirstName` mediumtext COLLATE utf8mb4_unicode_ci,
  `paymentContactLastName` mediumtext COLLATE utf8mb4_unicode_ci,
  `paymentContactEmail` mediumtext COLLATE utf8mb4_unicode_ci,
  `paymentContactCellNumber` mediumtext COLLATE utf8mb4_unicode_ci,
  `allowAutomaticWinnerFormSubmission` tinyint(1) NOT NULL,
  `maxWinnerFormsOnSubmit` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `companyLogo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `companyAddress` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companyName_UNIQUE` (`companyName`(191)),
  KEY `companyLogo` (`companyLogo`),
  KEY `companyAddress` (`companyAddress`),
  CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`companyLogo`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Client_ibfk_2` FOREIGN KEY (`companyAddress`) REFERENCES `Address` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Competition`
--

DROP TABLE IF EXISTS `Competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Competition` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `showOnHomePage` tinyint(1) NOT NULL,
  `teamCount` int(11) DEFAULT NULL,
  `primaryColor` mediumtext COLLATE utf8mb4_unicode_ci,
  `hasCustomPageContent` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `pageBackground` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `tileBackground` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `gameSelectorLogo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `pageContentDraft` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `sponsorList` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `gameLogo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `blurbCategory` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `pageContent` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `banner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `overviewBanner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191)),
  KEY `pageBackground` (`pageBackground`),
  KEY `tileBackground` (`tileBackground`),
  KEY `gameSelectorLogo` (`gameSelectorLogo`),
  KEY `pageContentDraft` (`pageContentDraft`),
  KEY `sponsorList` (`sponsorList`),
  KEY `gameLogo` (`gameLogo`),
  KEY `blurbCategory` (`blurbCategory`),
  KEY `pageContent` (`pageContent`),
  KEY `banner` (`banner`),
  KEY `overviewBanner` (`overviewBanner`),
  CONSTRAINT `Competition_ibfk_1` FOREIGN KEY (`pageBackground`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Competition_ibfk_10` FOREIGN KEY (`overviewBanner`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Competition_ibfk_2` FOREIGN KEY (`tileBackground`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Competition_ibfk_3` FOREIGN KEY (`gameSelectorLogo`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Competition_ibfk_4` FOREIGN KEY (`pageContentDraft`) REFERENCES `PageContent` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Competition_ibfk_5` FOREIGN KEY (`sponsorList`) REFERENCES `SponsorList` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Competition_ibfk_6` FOREIGN KEY (`gameLogo`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Competition_ibfk_7` FOREIGN KEY (`blurbCategory`) REFERENCES `BlurbCategory` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Competition_ibfk_8` FOREIGN KEY (`pageContent`) REFERENCES `PageContent` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Competition_ibfk_9` FOREIGN KEY (`banner`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionEvent`
--

DROP TABLE IF EXISTS `CompetitionEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionEvent` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `eventId` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci,
  `namePosition` mediumtext COLLATE utf8mb4_unicode_ci,
  `registrationOpenDate` datetime(3) DEFAULT NULL,
  `registrationCloseDate` datetime(3) DEFAULT NULL,
  `startDate` datetime(3) DEFAULT NULL,
  `endDate` datetime(3) DEFAULT NULL,
  `maxEntriesPerOrganisation` int(11) NOT NULL,
  `maxEntries` int(11) NOT NULL,
  `minEntries` int(11) NOT NULL,
  `rosterLock` tinyint(1) NOT NULL,
  `showOnHomePage` tinyint(1) NOT NULL,
  `vipPrizePool` tinyint(1) NOT NULL,
  `replaceAllWithPageContent` tinyint(1) NOT NULL,
  `ageRestricted` tinyint(1) DEFAULT NULL,
  `minAge` int(11) DEFAULT NULL,
  `maxAge` int(11) DEFAULT NULL,
  `requiresRegistration` tinyint(1) NOT NULL,
  `requiresConfirmation` tinyint(1) NOT NULL,
  `streamLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `streamName` mediumtext COLLATE utf8mb4_unicode_ci,
  `streamIsLive` tinyint(1) DEFAULT NULL,
  `advertisementDisplayType` mediumtext COLLATE utf8mb4_unicode_ci,
  `advertisementRotationTime` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `competition` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `overviewBanner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `pageContent` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `gameVariant` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `prizePool` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `liveryCategory` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `pageBackground` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `banner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `client` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `game` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `signupBanner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `gameLogo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `rulesContent` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eventId_UNIQUE` (`eventId`(191)),
  KEY `competition` (`competition`),
  KEY `overviewBanner` (`overviewBanner`),
  KEY `pageContent` (`pageContent`),
  KEY `gameVariant` (`gameVariant`),
  KEY `prizePool` (`prizePool`),
  KEY `liveryCategory` (`liveryCategory`),
  KEY `pageBackground` (`pageBackground`),
  KEY `banner` (`banner`),
  KEY `client` (`client`),
  KEY `game` (`game`),
  KEY `signupBanner` (`signupBanner`),
  KEY `gameLogo` (`gameLogo`),
  KEY `rulesContent` (`rulesContent`),
  CONSTRAINT `CompetitionEvent_ibfk_1` FOREIGN KEY (`competition`) REFERENCES `Competition` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_10` FOREIGN KEY (`game`) REFERENCES `Game` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_11` FOREIGN KEY (`signupBanner`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_12` FOREIGN KEY (`gameLogo`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_13` FOREIGN KEY (`rulesContent`) REFERENCES `PageContent` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_2` FOREIGN KEY (`overviewBanner`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_3` FOREIGN KEY (`pageContent`) REFERENCES `PageContent` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_4` FOREIGN KEY (`gameVariant`) REFERENCES `GameVariant` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_5` FOREIGN KEY (`prizePool`) REFERENCES `PrizePool` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_6` FOREIGN KEY (`liveryCategory`) REFERENCES `CarCategory` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_7` FOREIGN KEY (`pageBackground`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_8` FOREIGN KEY (`banner`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEvent_ibfk_9` FOREIGN KEY (`client`) REFERENCES `Client` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionEventSchedule`
--

DROP TABLE IF EXISTS `CompetitionEventSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionEventSchedule` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `date` datetime(3) NOT NULL,
  `format` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `round` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `team1Score` int(11) DEFAULT NULL,
  `team2Score` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `team1` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team2` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team1` (`team1`),
  KEY `team2` (`team2`),
  CONSTRAINT `CompetitionEventSchedule_ibfk_1` FOREIGN KEY (`team1`) REFERENCES `Team` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionEventSchedule_ibfk_2` FOREIGN KEY (`team2`) REFERENCES `Team` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionEventScheduleGroup`
--

DROP TABLE IF EXISTS `CompetitionEventScheduleGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionEventScheduleGroup` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `event` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event` (`event`),
  CONSTRAINT `CompetitionEventScheduleGroup_ibfk_1` FOREIGN KEY (`event`) REFERENCES `CompetitionEvent` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionGroup`
--

DROP TABLE IF EXISTS `CompetitionGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionGroup` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `number` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `stage` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stage` (`stage`),
  CONSTRAINT `CompetitionGroup_ibfk_1` FOREIGN KEY (`stage`) REFERENCES `CompetitionStage` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionGroupStanding`
--

DROP TABLE IF EXISTS `CompetitionGroupStanding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionGroupStanding` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `rank` int(11) NOT NULL,
  `played` int(11) NOT NULL,
  `won` int(11) NOT NULL,
  `drawn` int(11) NOT NULL,
  `lost` int(11) NOT NULL,
  `forfeited` int(11) NOT NULL,
  `scoreFor` int(11) NOT NULL,
  `scoreAgainst` int(11) NOT NULL,
  `difference` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `group` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team` (`team`),
  KEY `group` (`group`),
  CONSTRAINT `CompetitionGroupStanding_ibfk_1` FOREIGN KEY (`team`) REFERENCES `CompetitionTeam` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionGroupStanding_ibfk_2` FOREIGN KEY (`group`) REFERENCES `CompetitionGroup` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionMatch`
--

DROP TABLE IF EXISTS `CompetitionMatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionMatch` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `number` int(11) NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `acceptedDate` datetime(3) DEFAULT NULL,
  `forfeitWarningAt` datetime(3) DEFAULT NULL,
  `forfeitedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `chat` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `round` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `event` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `stage` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `forfeitWarningBy` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `forfeitedBy` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `competition` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `group` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat` (`chat`),
  KEY `round` (`round`),
  KEY `event` (`event`),
  KEY `stage` (`stage`),
  KEY `forfeitWarningBy` (`forfeitWarningBy`),
  KEY `forfeitedBy` (`forfeitedBy`),
  KEY `competition` (`competition`),
  KEY `group` (`group`),
  CONSTRAINT `CompetitionMatch_ibfk_1` FOREIGN KEY (`chat`) REFERENCES `Chat` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatch_ibfk_2` FOREIGN KEY (`round`) REFERENCES `CompetitionRound` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatch_ibfk_3` FOREIGN KEY (`event`) REFERENCES `CompetitionEvent` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatch_ibfk_4` FOREIGN KEY (`stage`) REFERENCES `CompetitionStage` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatch_ibfk_5` FOREIGN KEY (`forfeitWarningBy`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatch_ibfk_6` FOREIGN KEY (`forfeitedBy`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatch_ibfk_7` FOREIGN KEY (`competition`) REFERENCES `Competition` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatch_ibfk_8` FOREIGN KEY (`group`) REFERENCES `CompetitionGroup` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionMatchTeam`
--

DROP TABLE IF EXISTS `CompetitionMatchTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionMatchTeam` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `hasPassword` tinyint(1) NOT NULL,
  `matchId` mediumtext COLLATE utf8mb4_unicode_ci,
  `matchPassword` mediumtext COLLATE utf8mb4_unicode_ci,
  `number` int(11) NOT NULL,
  `result` mediumtext COLLATE utf8mb4_unicode_ci,
  `score` int(11) DEFAULT NULL,
  `predictionCount` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `racingScore` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `match` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `submittedByTeam` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `acceptedByUser` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `submittedByUser` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `royaleScore` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `acceptedByTeam` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `racingScore` (`racingScore`),
  KEY `match` (`match`),
  KEY `submittedByTeam` (`submittedByTeam`),
  KEY `acceptedByUser` (`acceptedByUser`),
  KEY `team` (`team`),
  KEY `submittedByUser` (`submittedByUser`),
  KEY `royaleScore` (`royaleScore`),
  KEY `acceptedByTeam` (`acceptedByTeam`),
  CONSTRAINT `CompetitionMatchTeam_ibfk_1` FOREIGN KEY (`racingScore`) REFERENCES `CompetitionRacingScore` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatchTeam_ibfk_2` FOREIGN KEY (`match`) REFERENCES `CompetitionMatch` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatchTeam_ibfk_3` FOREIGN KEY (`submittedByTeam`) REFERENCES `Team` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatchTeam_ibfk_4` FOREIGN KEY (`acceptedByUser`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatchTeam_ibfk_5` FOREIGN KEY (`team`) REFERENCES `CompetitionTeam` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatchTeam_ibfk_6` FOREIGN KEY (`submittedByUser`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatchTeam_ibfk_7` FOREIGN KEY (`royaleScore`) REFERENCES `CompetitionRoyaleScore` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionMatchTeam_ibfk_8` FOREIGN KEY (`acceptedByTeam`) REFERENCES `Team` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionRacingScore`
--

DROP TABLE IF EXISTS `CompetitionRacingScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionRacingScore` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `position` int(11) DEFAULT NULL,
  `totalTime` int(11) DEFAULT NULL,
  `laps` int(11) DEFAULT NULL,
  `bestLap` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `player2Score` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `player1Score` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player2Score` (`player2Score`),
  KEY `player1Score` (`player1Score`),
  CONSTRAINT `CompetitionRacingScore_ibfk_1` FOREIGN KEY (`player2Score`) REFERENCES `PlayerCompetitionRacingScore` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionRacingScore_ibfk_2` FOREIGN KEY (`player1Score`) REFERENCES `PlayerCompetitionRacingScore` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionRacingStanding`
--

DROP TABLE IF EXISTS `CompetitionRacingStanding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionRacingStanding` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `rank` int(11) NOT NULL,
  `week1` int(11) NOT NULL,
  `week2` int(11) NOT NULL,
  `week3` int(11) NOT NULL,
  `week4` int(11) NOT NULL,
  `week5` int(11) NOT NULL,
  `week6` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `group` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team` (`team`),
  KEY `group` (`group`),
  CONSTRAINT `CompetitionRacingStanding_ibfk_1` FOREIGN KEY (`team`) REFERENCES `CompetitionTeam` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionRacingStanding_ibfk_2` FOREIGN KEY (`group`) REFERENCES `CompetitionGroup` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionRound`
--

DROP TABLE IF EXISTS `CompetitionRound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionRound` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `number` int(11) NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `group` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  CONSTRAINT `CompetitionRound_ibfk_1` FOREIGN KEY (`group`) REFERENCES `CompetitionGroup` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionRoyaleScore`
--

DROP TABLE IF EXISTS `CompetitionRoyaleScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionRoyaleScore` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `position` int(11) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `damage` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `player3Score` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `player2Score` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `player1Score` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `player5Score` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `player4Score` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `player3Score` (`player3Score`),
  KEY `player2Score` (`player2Score`),
  KEY `player1Score` (`player1Score`),
  KEY `player5Score` (`player5Score`),
  KEY `player4Score` (`player4Score`),
  CONSTRAINT `CompetitionRoyaleScore_ibfk_1` FOREIGN KEY (`player3Score`) REFERENCES `PlayerCompetitionRoyaleScore` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionRoyaleScore_ibfk_2` FOREIGN KEY (`player2Score`) REFERENCES `PlayerCompetitionRoyaleScore` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionRoyaleScore_ibfk_3` FOREIGN KEY (`player1Score`) REFERENCES `PlayerCompetitionRoyaleScore` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionRoyaleScore_ibfk_4` FOREIGN KEY (`player5Score`) REFERENCES `PlayerCompetitionRoyaleScore` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionRoyaleScore_ibfk_5` FOREIGN KEY (`player4Score`) REFERENCES `PlayerCompetitionRoyaleScore` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionRoyaleStanding`
--

DROP TABLE IF EXISTS `CompetitionRoyaleStanding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionRoyaleStanding` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `rank` int(11) NOT NULL,
  `week1` int(11) NOT NULL,
  `week2` int(11) NOT NULL,
  `week3` int(11) NOT NULL,
  `week4` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `group` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team` (`team`),
  KEY `group` (`group`),
  CONSTRAINT `CompetitionRoyaleStanding_ibfk_1` FOREIGN KEY (`team`) REFERENCES `CompetitionTeam` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionRoyaleStanding_ibfk_2` FOREIGN KEY (`group`) REFERENCES `CompetitionGroup` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionStage`
--

DROP TABLE IF EXISTS `CompetitionStage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionStage` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `order` int(11) NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupLimit` int(11) NOT NULL,
  `allowSubmissionVoting` tinyint(1) NOT NULL,
  `showSubmissionVoting` tinyint(1) NOT NULL,
  `matchLimit` int(11) DEFAULT NULL,
  `roundLimit` int(11) DEFAULT NULL,
  `matchPageOpen` int(11) DEFAULT NULL,
  `matchPageClose` int(11) DEFAULT NULL,
  `relegation` int(11) DEFAULT NULL,
  `maxLosses` int(11) DEFAULT NULL,
  `showConsolationRound` tinyint(1) NOT NULL,
  `allowScheduling` tinyint(1) NOT NULL,
  `allowScoreUpload` tinyint(1) NOT NULL,
  `bountyTake` int(11) DEFAULT NULL,
  `startDate` datetime(3) DEFAULT NULL,
  `endDate` datetime(3) DEFAULT NULL,
  `matchCodes` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `demoteTo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `competition` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `event` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `promoteTo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `matchBanner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `battleRoyaleScore` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `demoteTo` (`demoteTo`),
  KEY `competition` (`competition`),
  KEY `event` (`event`),
  KEY `promoteTo` (`promoteTo`),
  KEY `matchBanner` (`matchBanner`),
  KEY `battleRoyaleScore` (`battleRoyaleScore`),
  CONSTRAINT `CompetitionStage_ibfk_1` FOREIGN KEY (`demoteTo`) REFERENCES `CompetitionStage` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionStage_ibfk_2` FOREIGN KEY (`competition`) REFERENCES `Competition` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionStage_ibfk_3` FOREIGN KEY (`event`) REFERENCES `CompetitionEvent` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionStage_ibfk_4` FOREIGN KEY (`promoteTo`) REFERENCES `CompetitionStage` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionStage_ibfk_5` FOREIGN KEY (`matchBanner`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionStage_ibfk_6` FOREIGN KEY (`battleRoyaleScore`) REFERENCES `BattleRoyaleScore` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionSubmission`
--

DROP TABLE IF EXISTS `CompetitionSubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionSubmission` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `stage` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `shortenedLink` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stage` (`stage`),
  KEY `user` (`user`),
  KEY `shortenedLink` (`shortenedLink`),
  CONSTRAINT `CompetitionSubmission_ibfk_1` FOREIGN KEY (`stage`) REFERENCES `CompetitionStage` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionSubmission_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionSubmission_ibfk_3` FOREIGN KEY (`shortenedLink`) REFERENCES `ShortenedLink` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CompetitionTeam`
--

DROP TABLE IF EXISTS `CompetitionTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionTeam` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `seed` int(11) NOT NULL,
  `forfeited` tinyint(1) NOT NULL,
  `parentEmail` mediumtext COLLATE utf8mb4_unicode_ci,
  `bounty` decimal(65,30) DEFAULT NULL,
  `competed` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `event` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `carSelection` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `competition` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `team` (`team`),
  KEY `event` (`event`),
  KEY `carSelection` (`carSelection`),
  KEY `competition` (`competition`),
  CONSTRAINT `CompetitionTeam_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionTeam_ibfk_2` FOREIGN KEY (`team`) REFERENCES `Team` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionTeam_ibfk_3` FOREIGN KEY (`event`) REFERENCES `CompetitionEvent` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionTeam_ibfk_4` FOREIGN KEY (`carSelection`) REFERENCES `CarSelection` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CompetitionTeam_ibfk_5` FOREIGN KEY (`competition`) REFERENCES `Competition` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ContactForm`
--

DROP TABLE IF EXISTS `ContactForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactForm` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191)),
  UNIQUE KEY `shortName_UNIQUE` (`shortName`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DiscordUser`
--

DROP TABLE IF EXISTS `DiscordUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DiscordUser` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `discordId` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` mediumtext COLLATE utf8mb4_unicode_ci,
  `avatar` mediumtext COLLATE utf8mb4_unicode_ci,
  `discriminator` mediumtext COLLATE utf8mb4_unicode_ci,
  `publicFlags` int(11) DEFAULT NULL,
  `flags` int(11) DEFAULT NULL,
  `locale` mediumtext COLLATE utf8mb4_unicode_ci,
  `mfaEnabled` tinyint(1) DEFAULT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci,
  `verified` tinyint(1) DEFAULT NULL,
  `authToken` mediumtext COLLATE utf8mb4_unicode_ci,
  `refreshToken` mediumtext COLLATE utf8mb4_unicode_ci,
  `expires` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `discordId_UNIQUE` (`discordId`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Dispute`
--

DROP TABLE IF EXISTS `Dispute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dispute` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `subject` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `createdByTeam` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `createdByUser` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `chat` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdByTeam` (`createdByTeam`),
  KEY `createdByUser` (`createdByUser`),
  KEY `chat` (`chat`),
  CONSTRAINT `Dispute_ibfk_1` FOREIGN KEY (`createdByTeam`) REFERENCES `Team` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Dispute_ibfk_2` FOREIGN KEY (`createdByUser`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Dispute_ibfk_3` FOREIGN KEY (`chat`) REFERENCES `Chat` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Draw`
--

DROP TABLE IF EXISTS `Draw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Draw` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DrawEntry`
--

DROP TABLE IF EXISTS `DrawEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DrawEntry` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `draw` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `draw` (`draw`),
  CONSTRAINT `DrawEntry_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `DrawEntry_ibfk_2` FOREIGN KEY (`draw`) REFERENCES `Draw` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DrawWinner`
--

DROP TABLE IF EXISTS `DrawWinner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DrawWinner` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `winAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `DrawWinner_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Email`
--

DROP TABLE IF EXISTS `Email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Email` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `subject` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `Email_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EmailTemplate`
--

DROP TABLE IF EXISTS `EmailTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailTemplate` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `html` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Faq`
--

DROP TABLE IF EXISTS `Faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faq` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `category` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`(191)),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191)),
  KEY `category` (`category`),
  CONSTRAINT `Faq_ibfk_1` FOREIGN KEY (`category`) REFERENCES `FaqCategory` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FaqCategory`
--

DROP TABLE IF EXISTS `FaqCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FaqCategory` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FeaturedTile`
--

DROP TABLE IF EXISTS `FeaturedTile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeaturedTile` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkTarget` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkType` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `modalTitle` mediumtext COLLATE utf8mb4_unicode_ci,
  `modalContent` mediumtext COLLATE utf8mb4_unicode_ci,
  `modalCss` mediumtext COLLATE utf8mb4_unicode_ci,
  `modalTheme` mediumtext COLLATE utf8mb4_unicode_ci,
  `modalHeader` tinyint(1) DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `customCss` mediumtext COLLATE utf8mb4_unicode_ci,
  `showOnDesktop` tinyint(1) NOT NULL,
  `showOnMobile` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `backgroundImage` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `client` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  KEY `backgroundImage` (`backgroundImage`),
  KEY `client` (`client`),
  CONSTRAINT `FeaturedTile_ibfk_1` FOREIGN KEY (`backgroundImage`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FeaturedTile_ibfk_2` FOREIGN KEY (`client`) REFERENCES `Client` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Game`
--

DROP TABLE IF EXISTS `Game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Game` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `logoUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `iconUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `color` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `banner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `icon` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `winner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `sponsorList` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `overview` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `shortName_UNIQUE` (`shortName`(191)),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191)),
  KEY `banner` (`banner`),
  KEY `icon` (`icon`),
  KEY `winner` (`winner`),
  KEY `logo` (`logo`),
  KEY `sponsorList` (`sponsorList`),
  KEY `overview` (`overview`),
  CONSTRAINT `Game_ibfk_1` FOREIGN KEY (`banner`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Game_ibfk_2` FOREIGN KEY (`icon`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Game_ibfk_3` FOREIGN KEY (`winner`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Game_ibfk_4` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Game_ibfk_5` FOREIGN KEY (`sponsorList`) REFERENCES `SponsorList` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Game_ibfk_6` FOREIGN KEY (`overview`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GameTile`
--

DROP TABLE IF EXISTS `GameTile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GameTile` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `winner` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `game` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game` (`game`),
  CONSTRAINT `GameTile_ibfk_1` FOREIGN KEY (`game`) REFERENCES `Game` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GameVariant`
--

DROP TABLE IF EXISTS `GameVariant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GameVariant` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `teamSize` int(11) NOT NULL,
  `minTeamSize` int(11) NOT NULL,
  `reserves` int(11) NOT NULL,
  `hasCoach` tinyint(1) DEFAULT NULL,
  `requiredGameId` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `requiredSocialAccount` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `platform` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `game` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requiredSocialAccount` (`requiredSocialAccount`),
  KEY `platform` (`platform`),
  KEY `game` (`game`),
  CONSTRAINT `GameVariant_ibfk_1` FOREIGN KEY (`requiredSocialAccount`) REFERENCES `SocialAccount` (`id`) ON DELETE SET NULL,
  CONSTRAINT `GameVariant_ibfk_2` FOREIGN KEY (`platform`) REFERENCES `Platform` (`id`) ON DELETE SET NULL,
  CONSTRAINT `GameVariant_ibfk_3` FOREIGN KEY (`game`) REFERENCES `Game` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Giveaway`
--

DROP TABLE IF EXISTS `Giveaway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Giveaway` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `gleamLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `emailContent` mediumtext COLLATE utf8mb4_unicode_ci,
  `emailHtml` mediumtext COLLATE utf8mb4_unicode_ci,
  `emailSubject` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `banner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `terms` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `pageBackground` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191)),
  KEY `banner` (`banner`),
  KEY `terms` (`terms`),
  KEY `pageBackground` (`pageBackground`),
  CONSTRAINT `Giveaway_ibfk_1` FOREIGN KEY (`banner`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Giveaway_ibfk_2` FOREIGN KEY (`terms`) REFERENCES `PageContent` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Giveaway_ibfk_3` FOREIGN KEY (`pageBackground`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GiveawayPrize`
--

DROP TABLE IF EXISTS `GiveawayPrize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GiveawayPrize` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberOfWinners` int(11) NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `voucherCode` mediumtext COLLATE utf8mb4_unicode_ci,
  `leaderboardPoints` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `giveaway` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `giveaway` (`giveaway`),
  CONSTRAINT `GiveawayPrize_ibfk_1` FOREIGN KEY (`giveaway`) REFERENCES `Giveaway` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GiveawayWinner`
--

DROP TABLE IF EXISTS `GiveawayWinner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GiveawayWinner` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `notified` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `prize` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `bankAccount` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `address` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `giveaway` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prize` (`prize`),
  KEY `bankAccount` (`bankAccount`),
  KEY `address` (`address`),
  KEY `giveaway` (`giveaway`),
  KEY `user` (`user`),
  CONSTRAINT `GiveawayWinner_ibfk_1` FOREIGN KEY (`prize`) REFERENCES `GiveawayPrize` (`id`) ON DELETE SET NULL,
  CONSTRAINT `GiveawayWinner_ibfk_2` FOREIGN KEY (`bankAccount`) REFERENCES `BankAccount` (`id`) ON DELETE SET NULL,
  CONSTRAINT `GiveawayWinner_ibfk_3` FOREIGN KEY (`address`) REFERENCES `Address` (`id`) ON DELETE SET NULL,
  CONSTRAINT `GiveawayWinner_ibfk_4` FOREIGN KEY (`giveaway`) REFERENCES `Giveaway` (`id`) ON DELETE SET NULL,
  CONSTRAINT `GiveawayWinner_ibfk_5` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HomepageEvent`
--

DROP TABLE IF EXISTS `HomepageEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HomepageEvent` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `order` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `websiteSettings` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `event` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `websiteSettings` (`websiteSettings`),
  KEY `event` (`event`),
  CONSTRAINT `HomepageEvent_ibfk_1` FOREIGN KEY (`websiteSettings`) REFERENCES `WebsiteSettings` (`id`) ON DELETE SET NULL,
  CONSTRAINT `HomepageEvent_ibfk_2` FOREIGN KEY (`event`) REFERENCES `CompetitionEvent` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JobLog`
--

DROP TABLE IF EXISTS `JobLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JobLog` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `jobId` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `error` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Lead`
--

DROP TABLE IF EXISTS `Lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lead` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Leaderboard`
--

DROP TABLE IF EXISTS `Leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Leaderboard` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `multiplier` decimal(65,30) DEFAULT NULL,
  `vipMultiplier` decimal(65,30) DEFAULT NULL,
  `primaryColor` mediumtext COLLATE utf8mb4_unicode_ci,
  `secondaryColor` mediumtext COLLATE utf8mb4_unicode_ci,
  `terms` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `banner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191)),
  KEY `banner` (`banner`),
  CONSTRAINT `Leaderboard_ibfk_1` FOREIGN KEY (`banner`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LeaderboardPointsAllocation`
--

DROP TABLE IF EXISTS `LeaderboardPointsAllocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LeaderboardPointsAllocation` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `points` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LeaderboardUser`
--

DROP TABLE IF EXISTS `LeaderboardUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LeaderboardUser` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `totalPoints` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `leaderboard` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leaderboard` (`leaderboard`),
  KEY `user` (`user`),
  CONSTRAINT `LeaderboardUser_ibfk_1` FOREIGN KEY (`leaderboard`) REFERENCES `Leaderboard` (`id`) ON DELETE SET NULL,
  CONSTRAINT `LeaderboardUser_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LeaderboardUserPoint`
--

DROP TABLE IF EXISTS `LeaderboardUserPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LeaderboardUserPoint` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `action` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionId` mediumtext COLLATE utf8mb4_unicode_ci,
  `points` int(11) NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `LeaderboardUserPoint_ibfk_1` FOREIGN KEY (`user`) REFERENCES `LeaderboardUser` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Livery`
--

DROP TABLE IF EXISTS `Livery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Livery` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `logoUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `number` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `category` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `make` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `logo` (`logo`),
  KEY `make` (`make`),
  CONSTRAINT `Livery_ibfk_1` FOREIGN KEY (`category`) REFERENCES `CarCategory` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Livery_ibfk_2` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Livery_ibfk_3` FOREIGN KEY (`make`) REFERENCES `CarMake` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LogitechScore`
--

DROP TABLE IF EXISTS `LogitechScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LogitechScore` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `email_UNIQUE` (`email`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MatchTeamPrediction`
--

DROP TABLE IF EXISTS `MatchTeamPrediction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MatchTeamPrediction` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team` (`team`),
  KEY `user` (`user`),
  CONSTRAINT `MatchTeamPrediction_ibfk_1` FOREIGN KEY (`team`) REFERENCES `CompetitionMatchTeam` (`id`) ON DELETE SET NULL,
  CONSTRAINT `MatchTeamPrediction_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Media`
--

DROP TABLE IF EXISTS `Media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Media` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `order` int(11) NOT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci,
  `relatedObjectId` mediumtext COLLATE utf8mb4_unicode_ci,
  `relatedObject` mediumtext COLLATE utf8mb4_unicode_ci,
  `relatedObjectField` mediumtext COLLATE utf8mb4_unicode_ci,
  `url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnailUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `transferred` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `category` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  CONSTRAINT `Media_ibfk_1` FOREIGN KEY (`category`) REFERENCES `MediaCategory` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MediaCategory`
--

DROP TABLE IF EXISTS `MediaCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MediaCategory` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Message` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `isAnonymous` tinyint(1) NOT NULL,
  `anonymousName` mediumtext COLLATE utf8mb4_unicode_ci,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `chat` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `from` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat` (`chat`),
  KEY `from` (`from`),
  CONSTRAINT `Message_ibfk_1` FOREIGN KEY (`chat`) REFERENCES `Chat` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Message_ibfk_2` FOREIGN KEY (`from`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Mission`
--

DROP TABLE IF EXISTS `Mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mission` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `task` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskCount` int(11) NOT NULL,
  `triggerType` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `triggerTypeFilter` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `triggerTypeParam` mediumtext COLLATE utf8mb4_unicode_ci,
  `triggerEvent` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `triggerEventFilter` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `triggerEventParam` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `parent` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `badge` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191)),
  KEY `parent` (`parent`),
  KEY `badge` (`badge`),
  CONSTRAINT `Mission_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `Mission` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Mission_ibfk_2` FOREIGN KEY (`badge`) REFERENCES `Badge` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Notification`
--

DROP TABLE IF EXISTS `Notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notification` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `read` tinyint(1) NOT NULL,
  `logoUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `logo` (`logo`),
  CONSTRAINT `Notification_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Notification_ibfk_2` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NotificationGamePreference`
--

DROP TABLE IF EXISTS `NotificationGamePreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NotificationGamePreference` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `inApp` tinyint(1) NOT NULL,
  `whatsapp` tinyint(1) NOT NULL,
  `email` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `game` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `notificationPreference` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game` (`game`),
  KEY `notificationPreference` (`notificationPreference`),
  CONSTRAINT `NotificationGamePreference_ibfk_1` FOREIGN KEY (`game`) REFERENCES `Game` (`id`) ON DELETE SET NULL,
  CONSTRAINT `NotificationGamePreference_ibfk_2` FOREIGN KEY (`notificationPreference`) REFERENCES `NotificationPreference` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NotificationPreference`
--

DROP TABLE IF EXISTS `NotificationPreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NotificationPreference` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `newGames` tinyint(1) NOT NULL,
  `newsletter` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Organisation`
--

DROP TABLE IF EXISTS `Organisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organisation` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` mediumtext COLLATE utf8mb4_unicode_ci,
  `founded` mediumtext COLLATE utf8mb4_unicode_ci,
  `biography` mediumtext COLLATE utf8mb4_unicode_ci,
  `facebookLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `twitterLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `instagramLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `youtubeLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `primaryColour` mediumtext COLLATE utf8mb4_unicode_ci,
  `logoUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `acceptingJoinRequests` tinyint(1) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `owner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `banner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logo` (`logo`),
  KEY `owner` (`owner`),
  KEY `banner` (`banner`),
  CONSTRAINT `Organisation_ibfk_1` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Organisation_ibfk_2` FOREIGN KEY (`owner`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Organisation_ibfk_3` FOREIGN KEY (`banner`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrganisationInvite`
--

DROP TABLE IF EXISTS `OrganisationInvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganisationInvite` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `organisation` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation` (`organisation`),
  KEY `user` (`user`),
  CONSTRAINT `OrganisationInvite_ibfk_1` FOREIGN KEY (`organisation`) REFERENCES `Organisation` (`id`) ON DELETE SET NULL,
  CONSTRAINT `OrganisationInvite_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrganisationJoinRequest`
--

DROP TABLE IF EXISTS `OrganisationJoinRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganisationJoinRequest` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `token` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `organisation` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation` (`organisation`),
  KEY `user` (`user`),
  CONSTRAINT `OrganisationJoinRequest_ibfk_1` FOREIGN KEY (`organisation`) REFERENCES `Organisation` (`id`) ON DELETE SET NULL,
  CONSTRAINT `OrganisationJoinRequest_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OrganisationSocialAccount`
--

DROP TABLE IF EXISTS `OrganisationSocialAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganisationSocialAccount` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `accountId` mediumtext COLLATE utf8mb4_unicode_ci,
  `accountName` mediumtext COLLATE utf8mb4_unicode_ci,
  `accountUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `organisation` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `socialAccount` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation` (`organisation`),
  KEY `socialAccount` (`socialAccount`),
  CONSTRAINT `OrganisationSocialAccount_ibfk_1` FOREIGN KEY (`organisation`) REFERENCES `Organisation` (`id`) ON DELETE SET NULL,
  CONSTRAINT `OrganisationSocialAccount_ibfk_2` FOREIGN KEY (`socialAccount`) REFERENCES `SocialAccount` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PageContent`
--

DROP TABLE IF EXISTS `PageContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageContent` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci,
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `customCss` mediumtext COLLATE utf8mb4_unicode_ci,
  `customJs` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PaymentMethod`
--

DROP TABLE IF EXISTS `PaymentMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaymentMethod` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `isDefault` tinyint(1) NOT NULL,
  `binCountry` mediumtext COLLATE utf8mb4_unicode_ci,
  `last4Digits` mediumtext COLLATE utf8mb4_unicode_ci,
  `holder` mediumtext COLLATE utf8mb4_unicode_ci,
  `expiryMonth` mediumtext COLLATE utf8mb4_unicode_ci,
  `expiryYear` mediumtext COLLATE utf8mb4_unicode_ci,
  `brand` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `PaymentMethod_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Platform`
--

DROP TABLE IF EXISTS `Platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Platform` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `icon` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `shortName_UNIQUE` (`shortName`(191)),
  KEY `icon` (`icon`),
  CONSTRAINT `Platform_ibfk_1` FOREIGN KEY (`icon`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PlayerCompetitionRacingScore`
--

DROP TABLE IF EXISTS `PlayerCompetitionRacingScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerCompetitionRacingScore` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `time` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `PlayerCompetitionRacingScore_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PlayerCompetitionRoyaleScore`
--

DROP TABLE IF EXISTS `PlayerCompetitionRoyaleScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerCompetitionRoyaleScore` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `position` int(11) DEFAULT NULL,
  `kills` int(11) DEFAULT NULL,
  `damage` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `PlayerCompetitionRoyaleScore_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Popup`
--

DROP TABLE IF EXISTS `Popup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Popup` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `repeat` int(11) DEFAULT NULL,
  `repeatUnit` mediumtext COLLATE utf8mb4_unicode_ci,
  `startDate` datetime(3) DEFAULT NULL,
  `endDate` datetime(3) DEFAULT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci,
  `css` mediumtext COLLATE utf8mb4_unicode_ci,
  `showTo` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PopupLog`
--

DROP TABLE IF EXISTS `PopupLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PopupLog` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `dontShowAgain` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `PopupLog_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Prize`
--

DROP TABLE IF EXISTS `Prize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prize` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `placement` int(11) DEFAULT NULL,
  `share` int(11) DEFAULT NULL,
  `otherShare` mediumtext COLLATE utf8mb4_unicode_ci,
  `premiumShare` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `pool` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pool` (`pool`),
  KEY `team` (`team`),
  CONSTRAINT `Prize_ibfk_1` FOREIGN KEY (`pool`) REFERENCES `PrizePool` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Prize_ibfk_2` FOREIGN KEY (`team`) REFERENCES `Team` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PrizePool`
--

DROP TABLE IF EXISTS `PrizePool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrizePool` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `total` int(11) DEFAULT NULL,
  `otherTotal` mediumtext COLLATE utf8mb4_unicode_ci,
  `currencySymbol` mediumtext COLLATE utf8mb4_unicode_ci,
  `paymentClientSameAsEvent` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `client` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  CONSTRAINT `PrizePool_ibfk_1` FOREIGN KEY (`client`) REFERENCES `Client` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Realm`
--

DROP TABLE IF EXISTS `Realm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Realm` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Recipient`
--

DROP TABLE IF EXISTS `Recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recipient` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `opened` tinyint(1) DEFAULT NULL,
  `bounce` tinyint(1) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `campaign` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campaign` (`campaign`),
  KEY `user` (`user`),
  CONSTRAINT `Recipient_ibfk_1` FOREIGN KEY (`campaign`) REFERENCES `Campaign` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Recipient_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDefault` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Rule`
--

DROP TABLE IF EXISTS `Rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rule` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `index` decimal(65,30) NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RuleSet`
--

DROP TABLE IF EXISTS `RuleSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RuleSet` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RulesTemplate`
--

DROP TABLE IF EXISTS `RulesTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RulesTemplate` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schedule` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduledDate` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `declinedBy` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `acceptedBy` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `scheduledByUser` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `scheduledByTeam` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `declinedBy` (`declinedBy`),
  KEY `acceptedBy` (`acceptedBy`),
  KEY `scheduledByUser` (`scheduledByUser`),
  KEY `scheduledByTeam` (`scheduledByTeam`),
  CONSTRAINT `Schedule_ibfk_1` FOREIGN KEY (`declinedBy`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Schedule_ibfk_2` FOREIGN KEY (`acceptedBy`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Schedule_ibfk_3` FOREIGN KEY (`scheduledByUser`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Schedule_ibfk_4` FOREIGN KEY (`scheduledByTeam`) REFERENCES `Team` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ShortenedLink`
--

DROP TABLE IF EXISTS `ShortenedLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShortenedLink` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `referral` mediumtext COLLATE utf8mb4_unicode_ci,
  `clicks` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash_UNIQUE` (`hash`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SiteSetting`
--

DROP TABLE IF EXISTS `SiteSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteSetting` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `key` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_UNIQUE` (`key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Slider`
--

DROP TABLE IF EXISTS `Slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Slider` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) DEFAULT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `customCSS` mediumtext COLLATE utf8mb4_unicode_ci,
  `customHTML` mediumtext COLLATE utf8mb4_unicode_ci,
  `showOnDesktop` tinyint(1) NOT NULL,
  `showOnMobile` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `background` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `client` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `background` (`background`),
  KEY `client` (`client`),
  CONSTRAINT `Slider_ibfk_1` FOREIGN KEY (`background`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Slider_ibfk_2` FOREIGN KEY (`client`) REFERENCES `Client` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Slider_actions`
--

DROP TABLE IF EXISTS `Slider_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Slider_actions` (
  `nodeId` char(30) CHARACTER SET utf8 NOT NULL,
  `position` int(4) NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nodeId`,`position`),
  KEY `value` (`value`(191)),
  CONSTRAINT `Slider_actions_ibfk_1` FOREIGN KEY (`nodeId`) REFERENCES `Slider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SocialAccount`
--

DROP TABLE IF EXISTS `SocialAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SocialAccount` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `color` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkType` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountType` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `icon` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  KEY `icon` (`icon`),
  CONSTRAINT `SocialAccount_ibfk_1` FOREIGN KEY (`icon`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SocialShare`
--

DROP TABLE IF EXISTS `SocialShare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SocialShare` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `platform` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `moment` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `momentId` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `callbackUrl` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `SocialShare_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Spinner`
--

DROP TABLE IF EXISTS `Spinner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Spinner` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `pricePerSpin` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `terms` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `howItWorks` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  KEY `terms` (`terms`),
  KEY `logo` (`logo`),
  KEY `howItWorks` (`howItWorks`),
  CONSTRAINT `Spinner_ibfk_1` FOREIGN KEY (`terms`) REFERENCES `PageContent` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Spinner_ibfk_2` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Spinner_ibfk_3` FOREIGN KEY (`howItWorks`) REFERENCES `PageContent` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SpinnerProduct`
--

DROP TABLE IF EXISTS `SpinnerProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpinnerProduct` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `dropRate` decimal(65,30) NOT NULL,
  `rarity` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `retailValue` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `client` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  KEY `logo` (`logo`),
  CONSTRAINT `SpinnerProduct_ibfk_1` FOREIGN KEY (`client`) REFERENCES `Client` (`id`) ON DELETE SET NULL,
  CONSTRAINT `SpinnerProduct_ibfk_2` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SpinnerProductDigital`
--

DROP TABLE IF EXISTS `SpinnerProductDigital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpinnerProductDigital` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `code` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `claimed` tinyint(1) NOT NULL,
  `claimedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `product` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`product`),
  CONSTRAINT `SpinnerProductDigital_ibfk_1` FOREIGN KEY (`product`) REFERENCES `SpinnerProduct` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SpinnerTransaction`
--

DROP TABLE IF EXISTS `SpinnerTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpinnerTransaction` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `amount` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `createdBy` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `createdBy` (`createdBy`),
  CONSTRAINT `SpinnerTransaction_ibfk_1` FOREIGN KEY (`user`) REFERENCES `SpinnerUser` (`id`) ON DELETE SET NULL,
  CONSTRAINT `SpinnerTransaction_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SpinnerUser`
--

DROP TABLE IF EXISTS `SpinnerUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpinnerUser` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `lastSpin` datetime(3) DEFAULT NULL,
  `availableSpins` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SpinnerWinner`
--

DROP TABLE IF EXISTS `SpinnerWinner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpinnerWinner` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` mediumtext COLLATE utf8mb4_unicode_ci,
  `variant` mediumtext COLLATE utf8mb4_unicode_ci,
  `trackingNumber` mediumtext COLLATE utf8mb4_unicode_ci,
  `trackingLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `orderReference` mediumtext COLLATE utf8mb4_unicode_ci,
  `claimed` tinyint(1) NOT NULL,
  `claimedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `spinner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `digitalProduct` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `product` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `address` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `transaction` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spinner` (`spinner`),
  KEY `digitalProduct` (`digitalProduct`),
  KEY `product` (`product`),
  KEY `address` (`address`),
  KEY `transaction` (`transaction`),
  KEY `user` (`user`),
  CONSTRAINT `SpinnerWinner_ibfk_1` FOREIGN KEY (`spinner`) REFERENCES `Spinner` (`id`) ON DELETE SET NULL,
  CONSTRAINT `SpinnerWinner_ibfk_2` FOREIGN KEY (`digitalProduct`) REFERENCES `SpinnerProductDigital` (`id`) ON DELETE SET NULL,
  CONSTRAINT `SpinnerWinner_ibfk_3` FOREIGN KEY (`product`) REFERENCES `SpinnerProduct` (`id`) ON DELETE SET NULL,
  CONSTRAINT `SpinnerWinner_ibfk_4` FOREIGN KEY (`address`) REFERENCES `Address` (`id`) ON DELETE SET NULL,
  CONSTRAINT `SpinnerWinner_ibfk_5` FOREIGN KEY (`transaction`) REFERENCES `SpinnerTransaction` (`id`) ON DELETE SET NULL,
  CONSTRAINT `SpinnerWinner_ibfk_6` FOREIGN KEY (`user`) REFERENCES `SpinnerUser` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sponsor`
--

DROP TABLE IF EXISTS `Sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sponsor` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `order` int(11) NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `websiteUrl` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `logoUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  KEY `logo` (`logo`),
  CONSTRAINT `Sponsor_ibfk_1` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SponsorList`
--

DROP TABLE IF EXISTS `SponsorList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SponsorList` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Statistic`
--

DROP TABLE IF EXISTS `Statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Statistic` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `game` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game` (`game`),
  CONSTRAINT `Statistic_ibfk_1` FOREIGN KEY (`game`) REFERENCES `Game` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Streamer`
--

DROP TABLE IF EXISTS `Streamer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Streamer` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `facebookLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `twitterLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `instagramLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `youtubeLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `twitchLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `cardBack` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `cardFront` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191)),
  KEY `cardBack` (`cardBack`),
  KEY `cardFront` (`cardFront`),
  KEY `user` (`user`),
  CONSTRAINT `Streamer_ibfk_1` FOREIGN KEY (`cardBack`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Streamer_ibfk_2` FOREIGN KEY (`cardFront`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Streamer_ibfk_3` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StreamerApplication`
--

DROP TABLE IF EXISTS `StreamerApplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StreamerApplication` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `declineReason` mediumtext COLLATE utf8mb4_unicode_ci,
  `email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `channelLink` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `over16` tinyint(1) NOT NULL,
  `titles` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `goals` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StreamerSchedule`
--

DROP TABLE IF EXISTS `StreamerSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StreamerSchedule` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `game` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `startTime` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `endTime` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `StreamerTag`
--

DROP TABLE IF EXISTS `StreamerTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StreamerTag` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Survey`
--

DROP TABLE IF EXISTS `Survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Survey` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `endCondition` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `startAt` datetime(3) DEFAULT NULL,
  `endAt` datetime(3) DEFAULT NULL,
  `fulfillmentTarget` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `popupBanner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `banner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `slug_UNIQUE` (`slug`(191)),
  KEY `popupBanner` (`popupBanner`),
  KEY `banner` (`banner`),
  CONSTRAINT `Survey_ibfk_1` FOREIGN KEY (`popupBanner`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Survey_ibfk_2` FOREIGN KEY (`banner`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SurveyAnswer`
--

DROP TABLE IF EXISTS `SurveyAnswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyAnswer` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `answer` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `fulfillment` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `question` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fulfillment` (`fulfillment`),
  KEY `question` (`question`),
  CONSTRAINT `SurveyAnswer_ibfk_1` FOREIGN KEY (`fulfillment`) REFERENCES `SurveyFulfillment` (`id`) ON DELETE SET NULL,
  CONSTRAINT `SurveyAnswer_ibfk_2` FOREIGN KEY (`question`) REFERENCES `SurveyQuestion` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SurveyFulfillment`
--

DROP TABLE IF EXISTS `SurveyFulfillment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyFulfillment` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `survey` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey` (`survey`),
  KEY `user` (`user`),
  CONSTRAINT `SurveyFulfillment_ibfk_1` FOREIGN KEY (`survey`) REFERENCES `Survey` (`id`) ON DELETE SET NULL,
  CONSTRAINT `SurveyFulfillment_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SurveyQuestion`
--

DROP TABLE IF EXISTS `SurveyQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SurveyQuestion` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `inputType` mediumtext COLLATE utf8mb4_unicode_ci,
  `label` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `answers` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `survey` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey` (`survey`),
  CONSTRAINT `SurveyQuestion_ibfk_1` FOREIGN KEY (`survey`) REFERENCES `Survey` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Team` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` mediumtext COLLATE utf8mb4_unicode_ci,
  `facebookLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `twitterLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `instagramLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `youtubeLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `primaryColour` mediumtext COLLATE utf8mb4_unicode_ci,
  `logoUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `useOrgLogo` tinyint(1) DEFAULT NULL,
  `seed` int(11) DEFAULT NULL,
  `faceitId` mediumtext COLLATE utf8mb4_unicode_ci,
  `region` mediumtext COLLATE utf8mb4_unicode_ci,
  `intelDump` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `racingClass` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `owner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `gameVariant` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `organisation` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `banner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `racingClass` (`racingClass`),
  KEY `owner` (`owner`),
  KEY `gameVariant` (`gameVariant`),
  KEY `organisation` (`organisation`),
  KEY `banner` (`banner`),
  KEY `logo` (`logo`),
  CONSTRAINT `Team_ibfk_1` FOREIGN KEY (`racingClass`) REFERENCES `CarCategory` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Team_ibfk_2` FOREIGN KEY (`owner`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Team_ibfk_3` FOREIGN KEY (`gameVariant`) REFERENCES `GameVariant` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Team_ibfk_4` FOREIGN KEY (`organisation`) REFERENCES `Organisation` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Team_ibfk_5` FOREIGN KEY (`banner`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Team_ibfk_6` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TeamInvite`
--

DROP TABLE IF EXISTS `TeamInvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TeamInvite` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` mediumtext COLLATE utf8mb4_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `role` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team` (`team`),
  KEY `user` (`user`),
  CONSTRAINT `TeamInvite_ibfk_1` FOREIGN KEY (`team`) REFERENCES `Team` (`id`) ON DELETE SET NULL,
  CONSTRAINT `TeamInvite_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TeamJoinRequest`
--

DROP TABLE IF EXISTS `TeamJoinRequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TeamJoinRequest` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `token` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `team` (`team`),
  CONSTRAINT `TeamJoinRequest_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `TeamJoinRequest_ibfk_2` FOREIGN KEY (`team`) REFERENCES `Team` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TeamPlayer`
--

DROP TABLE IF EXISTS `TeamPlayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TeamPlayer` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `position` int(11) DEFAULT NULL,
  `role` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `team` (`team`),
  CONSTRAINT `TeamPlayer_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `TeamPlayer_ibfk_2` FOREIGN KEY (`team`) REFERENCES `Team` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TeamSocialAccount`
--

DROP TABLE IF EXISTS `TeamSocialAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TeamSocialAccount` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `accountId` mediumtext COLLATE utf8mb4_unicode_ci,
  `accountName` mediumtext COLLATE utf8mb4_unicode_ci,
  `accountUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `socialAccount` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `socialAccount` (`socialAccount`),
  KEY `team` (`team`),
  CONSTRAINT `TeamSocialAccount_ibfk_1` FOREIGN KEY (`socialAccount`) REFERENCES `SocialAccount` (`id`) ON DELETE SET NULL,
  CONSTRAINT `TeamSocialAccount_ibfk_2` FOREIGN KEY (`team`) REFERENCES `Team` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Team_altNames`
--

DROP TABLE IF EXISTS `Team_altNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Team_altNames` (
  `nodeId` char(30) CHARACTER SET utf8 NOT NULL,
  `position` int(4) NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nodeId`,`position`),
  KEY `value` (`value`(191)),
  CONSTRAINT `Team_altNames_ibfk_1` FOREIGN KEY (`nodeId`) REFERENCES `Team` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Timeline`
--

DROP TABLE IF EXISTS `Timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Timeline` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TimelinePoint`
--

DROP TABLE IF EXISTS `TimelinePoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimelinePoint` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `date` datetime(3) NOT NULL,
  `label` mediumtext COLLATE utf8mb4_unicode_ci,
  `shortLabel` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `authToken` mediumtext COLLATE utf8mb4_unicode_ci,
  `primaryColour` mediumtext COLLATE utf8mb4_unicode_ci,
  `logoUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `tempAvatar` mediumtext COLLATE utf8mb4_unicode_ci,
  `firstName` mediumtext COLLATE utf8mb4_unicode_ci,
  `lastName` mediumtext COLLATE utf8mb4_unicode_ci,
  `displayName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `displayNameChangedAt` datetime(3) DEFAULT NULL,
  `cellNumber` mediumtext COLLATE utf8mb4_unicode_ci,
  `idNumber` mediumtext COLLATE utf8mb4_unicode_ci,
  `dateOfBirth` datetime(3) DEFAULT NULL,
  `gender` mediumtext COLLATE utf8mb4_unicode_ci,
  `province` mediumtext COLLATE utf8mb4_unicode_ci,
  `country` mediumtext COLLATE utf8mb4_unicode_ci,
  `email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailConfirmed` tinyint(1) NOT NULL,
  `confirmEmailToken` mediumtext COLLATE utf8mb4_unicode_ci,
  `password` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `resetPasswordToken` mediumtext COLLATE utf8mb4_unicode_ci,
  `resetPasswordExpires` decimal(65,30) DEFAULT NULL,
  `facebookLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `twitterLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `instagramLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `youtubeLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `twitchLink` mediumtext COLLATE utf8mb4_unicode_ci,
  `facebookId` mediumtext COLLATE utf8mb4_unicode_ci,
  `twitterId` mediumtext COLLATE utf8mb4_unicode_ci,
  `instagramId` mediumtext COLLATE utf8mb4_unicode_ci,
  `youtubeId` mediumtext COLLATE utf8mb4_unicode_ci,
  `twitchId` mediumtext COLLATE utf8mb4_unicode_ci,
  `googleId` mediumtext COLLATE utf8mb4_unicode_ci,
  `paypalId` mediumtext COLLATE utf8mb4_unicode_ci,
  `paypalName` mediumtext COLLATE utf8mb4_unicode_ci,
  `paypalEmail` mediumtext COLLATE utf8mb4_unicode_ci,
  `paypalCountry` mediumtext COLLATE utf8mb4_unicode_ci,
  `epicId` mediumtext COLLATE utf8mb4_unicode_ci,
  `steamId` mediumtext COLLATE utf8mb4_unicode_ci,
  `playstationId` mediumtext COLLATE utf8mb4_unicode_ci,
  `battleTag` mediumtext COLLATE utf8mb4_unicode_ci,
  `battlenetId` mediumtext COLLATE utf8mb4_unicode_ci,
  `eaId` mediumtext COLLATE utf8mb4_unicode_ci,
  `xboxId` mediumtext COLLATE utf8mb4_unicode_ci,
  `originId` mediumtext COLLATE utf8mb4_unicode_ci,
  `switchId` mediumtext COLLATE utf8mb4_unicode_ci,
  `riotId` mediumtext COLLATE utf8mb4_unicode_ci,
  `uplayId` mediumtext COLLATE utf8mb4_unicode_ci,
  `freeFireId` mediumtext COLLATE utf8mb4_unicode_ci,
  `apexLegendsIgn` mediumtext COLLATE utf8mb4_unicode_ci,
  `followingCount` int(11) NOT NULL,
  `followersCount` int(11) NOT NULL,
  `biography` mediumtext COLLATE utf8mb4_unicode_ci,
  `lastLoggedInAt` datetime(3) DEFAULT NULL,
  `studentId` mediumtext COLLATE utf8mb4_unicode_ci,
  `preferredPaymentType` mediumtext COLLATE utf8mb4_unicode_ci,
  `randomField` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `notificationPreference` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `banner` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `organisation` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `referredBy` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `logo` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `discordUser` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `avatar` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `subscription` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `address` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `lead` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `spinnerUser` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `role` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`(191)),
  UNIQUE KEY `confirmEmailToken_UNIQUE` (`confirmEmailToken`(191)),
  UNIQUE KEY `resetPasswordToken_UNIQUE` (`resetPasswordToken`(191)),
  UNIQUE KEY `facebookId_UNIQUE` (`facebookId`(191)),
  UNIQUE KEY `twitterId_UNIQUE` (`twitterId`(191)),
  UNIQUE KEY `instagramId_UNIQUE` (`instagramId`(191)),
  UNIQUE KEY `youtubeId_UNIQUE` (`youtubeId`(191)),
  UNIQUE KEY `twitchId_UNIQUE` (`twitchId`(191)),
  UNIQUE KEY `googleId_UNIQUE` (`googleId`(191)),
  UNIQUE KEY `paypalId_UNIQUE` (`paypalId`(191)),
  UNIQUE KEY `steamId_UNIQUE` (`steamId`(191)),
  KEY `notificationPreference` (`notificationPreference`),
  KEY `banner` (`banner`),
  KEY `organisation` (`organisation`),
  KEY `referredBy` (`referredBy`),
  KEY `logo` (`logo`),
  KEY `discordUser` (`discordUser`),
  KEY `avatar` (`avatar`),
  KEY `subscription` (`subscription`),
  KEY `address` (`address`),
  KEY `lead` (`lead`),
  KEY `spinnerUser` (`spinnerUser`),
  KEY `role` (`role`),
  CONSTRAINT `User_ibfk_1` FOREIGN KEY (`notificationPreference`) REFERENCES `NotificationPreference` (`id`) ON DELETE SET NULL,
  CONSTRAINT `User_ibfk_10` FOREIGN KEY (`lead`) REFERENCES `Lead` (`id`) ON DELETE SET NULL,
  CONSTRAINT `User_ibfk_11` FOREIGN KEY (`spinnerUser`) REFERENCES `SpinnerUser` (`id`) ON DELETE SET NULL,
  CONSTRAINT `User_ibfk_12` FOREIGN KEY (`role`) REFERENCES `Role` (`id`) ON DELETE SET NULL,
  CONSTRAINT `User_ibfk_2` FOREIGN KEY (`banner`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `User_ibfk_3` FOREIGN KEY (`organisation`) REFERENCES `Organisation` (`id`) ON DELETE SET NULL,
  CONSTRAINT `User_ibfk_4` FOREIGN KEY (`referredBy`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `User_ibfk_5` FOREIGN KEY (`logo`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `User_ibfk_6` FOREIGN KEY (`discordUser`) REFERENCES `DiscordUser` (`id`) ON DELETE SET NULL,
  CONSTRAINT `User_ibfk_7` FOREIGN KEY (`avatar`) REFERENCES `UserAvatar` (`id`) ON DELETE SET NULL,
  CONSTRAINT `User_ibfk_8` FOREIGN KEY (`subscription`) REFERENCES `VipSubscription` (`id`) ON DELETE SET NULL,
  CONSTRAINT `User_ibfk_9` FOREIGN KEY (`address`) REFERENCES `Address` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserAvatar`
--

DROP TABLE IF EXISTS `UserAvatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserAvatar` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `skinColor` mediumtext COLLATE utf8mb4_unicode_ci,
  `hairStyle` mediumtext COLLATE utf8mb4_unicode_ci,
  `hairColor` mediumtext COLLATE utf8mb4_unicode_ci,
  `fabricColor` mediumtext COLLATE utf8mb4_unicode_ci,
  `eyes` mediumtext COLLATE utf8mb4_unicode_ci,
  `eyebrows` mediumtext COLLATE utf8mb4_unicode_ci,
  `mouth` mediumtext COLLATE utf8mb4_unicode_ci,
  `facialHair` mediumtext COLLATE utf8mb4_unicode_ci,
  `clothe` mediumtext COLLATE utf8mb4_unicode_ci,
  `glasses` mediumtext COLLATE utf8mb4_unicode_ci,
  `glassesOpacity` decimal(65,30) DEFAULT NULL,
  `accesories` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserInvite`
--

DROP TABLE IF EXISTS `UserInvite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserInvite` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `organisation` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_UNIQUE` (`token`(191)),
  KEY `organisation` (`organisation`),
  KEY `user` (`user`),
  CONSTRAINT `UserInvite_ibfk_1` FOREIGN KEY (`organisation`) REFERENCES `Organisation` (`id`) ON DELETE SET NULL,
  CONSTRAINT `UserInvite_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserMission`
--

DROP TABLE IF EXISTS `UserMission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserMission` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `taskCount` int(11) NOT NULL,
  `taskCompletion` int(11) NOT NULL,
  `isCompleted` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `mission` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `mission` (`mission`),
  CONSTRAINT `UserMission_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `UserMission_ibfk_2` FOREIGN KEY (`mission`) REFERENCES `Mission` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserSocialAccount`
--

DROP TABLE IF EXISTS `UserSocialAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserSocialAccount` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `accountId` mediumtext COLLATE utf8mb4_unicode_ci,
  `accountName` mediumtext COLLATE utf8mb4_unicode_ci,
  `accountUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `socialAccount` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `socialAccount` (`socialAccount`),
  KEY `user` (`user`),
  CONSTRAINT `UserSocialAccount_ibfk_1` FOREIGN KEY (`socialAccount`) REFERENCES `SocialAccount` (`id`) ON DELETE SET NULL,
  CONSTRAINT `UserSocialAccount_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User_pageAccess`
--

DROP TABLE IF EXISTS `User_pageAccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_pageAccess` (
  `nodeId` char(30) CHARACTER SET utf8 NOT NULL,
  `position` int(4) NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nodeId`,`position`),
  KEY `value` (`value`(191)),
  CONSTRAINT `User_pageAccess_ibfk_1` FOREIGN KEY (`nodeId`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VipSubscription`
--

DROP TABLE IF EXISTS `VipSubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VipSubscription` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `amount` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `amountValidTill` datetime(3) DEFAULT NULL,
  `subscriptionValidTill` datetime(3) DEFAULT NULL,
  `lastPaid` datetime(3) DEFAULT NULL,
  `subscriptionPaymentId` mediumtext COLLATE utf8mb4_unicode_ci,
  `failedPaymentAttempts` int(11) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `plan` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan` (`plan`),
  CONSTRAINT `VipSubscription_ibfk_1` FOREIGN KEY (`plan`) REFERENCES `VipSubscriptionPlan` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VipSubscriptionPlan`
--

DROP TABLE IF EXISTS `VipSubscriptionPlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VipSubscriptionPlan` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurranceText` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurrance` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `planId` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  UNIQUE KEY `planId_UNIQUE` (`planId`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VipSubscriptionTransaction`
--

DROP TABLE IF EXISTS `VipSubscriptionTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VipSubscriptionTransaction` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `transactionId` mediumtext COLLATE utf8mb4_unicode_ci,
  `registrationId` mediumtext COLLATE utf8mb4_unicode_ci,
  `transactionNdc` mediumtext COLLATE utf8mb4_unicode_ci,
  `transactionStatus` mediumtext COLLATE utf8mb4_unicode_ci,
  `paymentType` mediumtext COLLATE utf8mb4_unicode_ci,
  `paymentBrand` mediumtext COLLATE utf8mb4_unicode_ci,
  `amount` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` mediumtext COLLATE utf8mb4_unicode_ci,
  `descriptor` mediumtext COLLATE utf8mb4_unicode_ci,
  `recurringType` mediumtext COLLATE utf8mb4_unicode_ci,
  `resultCode` mediumtext COLLATE utf8mb4_unicode_ci,
  `resultDesc` mediumtext COLLATE utf8mb4_unicode_ci,
  `riskScore` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `paymentMethod` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `subscription` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paymentMethod` (`paymentMethod`),
  KEY `subscription` (`subscription`),
  CONSTRAINT `VipSubscriptionTransaction_ibfk_1` FOREIGN KEY (`paymentMethod`) REFERENCES `PaymentMethod` (`id`) ON DELETE SET NULL,
  CONSTRAINT `VipSubscriptionTransaction_ibfk_2` FOREIGN KEY (`subscription`) REFERENCES `VipSubscription` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vote`
--

DROP TABLE IF EXISTS `Vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vote` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `voting` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `voting` (`voting`),
  KEY `user` (`user`),
  CONSTRAINT `Vote_ibfk_1` FOREIGN KEY (`voting`) REFERENCES `Voting` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Vote_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Voting`
--

DROP TABLE IF EXISTS `Voting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Voting` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `caption` mediumtext COLLATE utf8mb4_unicode_ci,
  `uploadedBy` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `category` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `media` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `media` (`media`),
  CONSTRAINT `Voting_ibfk_1` FOREIGN KEY (`category`) REFERENCES `VotingCategory` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Voting_ibfk_2` FOREIGN KEY (`media`) REFERENCES `Media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VotingCategory`
--

DROP TABLE IF EXISTS `VotingCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VotingCategory` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `startAt` datetime(3) NOT NULL,
  `endAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Wallet`
--

DROP TABLE IF EXISTS `Wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wallet` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `organisation` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation` (`organisation`),
  KEY `user` (`user`),
  KEY `team` (`team`),
  CONSTRAINT `Wallet_ibfk_1` FOREIGN KEY (`organisation`) REFERENCES `Organisation` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Wallet_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `Wallet_ibfk_3` FOREIGN KEY (`team`) REFERENCES `Team` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WalletTransaction`
--

DROP TABLE IF EXISTS `WalletTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WalletTransaction` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `type` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `teamRecipient` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `wallet` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `organisation` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `userRecipient` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `organisationRecipient` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `createdBy` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teamRecipient` (`teamRecipient`),
  KEY `user` (`user`),
  KEY `team` (`team`),
  KEY `wallet` (`wallet`),
  KEY `organisation` (`organisation`),
  KEY `userRecipient` (`userRecipient`),
  KEY `organisationRecipient` (`organisationRecipient`),
  KEY `createdBy` (`createdBy`),
  CONSTRAINT `WalletTransaction_ibfk_1` FOREIGN KEY (`teamRecipient`) REFERENCES `Team` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WalletTransaction_ibfk_2` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WalletTransaction_ibfk_3` FOREIGN KEY (`team`) REFERENCES `Team` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WalletTransaction_ibfk_4` FOREIGN KEY (`wallet`) REFERENCES `Wallet` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WalletTransaction_ibfk_5` FOREIGN KEY (`organisation`) REFERENCES `Organisation` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WalletTransaction_ibfk_6` FOREIGN KEY (`userRecipient`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WalletTransaction_ibfk_7` FOREIGN KEY (`organisationRecipient`) REFERENCES `Organisation` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WalletTransaction_ibfk_8` FOREIGN KEY (`createdBy`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WebsiteSettings`
--

DROP TABLE IF EXISTS `WebsiteSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WebsiteSettings` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultEventsOrder` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultEventsLimit` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `gameTile` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`(191)),
  KEY `gameTile` (`gameTile`),
  CONSTRAINT `WebsiteSettings_ibfk_1` FOREIGN KEY (`gameTile`) REFERENCES `GameTile` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WhatsApp`
--

DROP TABLE IF EXISTS `WhatsApp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WhatsApp` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `errorCode` int(11) DEFAULT NULL,
  `error` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `WhatsApp_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WinnerForm`
--

DROP TABLE IF EXISTS `WinnerForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WinnerForm` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `declineReason` mediumtext COLLATE utf8mb4_unicode_ci,
  `paymentType` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) DEFAULT NULL,
  `placement` int(11) DEFAULT NULL,
  `prize` int(11) DEFAULT NULL,
  `otherPrize` mediumtext COLLATE utf8mb4_unicode_ci,
  `winAt` datetime(3) DEFAULT NULL,
  `requiresBankAccount` tinyint(1) NOT NULL,
  `requiresAddress` tinyint(1) NOT NULL,
  `requiresRosterConfirmation` tinyint(1) NOT NULL,
  `additionalOptions` mediumtext COLLATE utf8mb4_unicode_ci,
  `submittedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `batchPayment` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `address` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `bankAccount` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `client` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `team` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `eventStage` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batchPayment` (`batchPayment`),
  KEY `address` (`address`),
  KEY `bankAccount` (`bankAccount`),
  KEY `client` (`client`),
  KEY `user` (`user`),
  KEY `team` (`team`),
  KEY `eventStage` (`eventStage`),
  CONSTRAINT `WinnerForm_ibfk_1` FOREIGN KEY (`batchPayment`) REFERENCES `BatchPayment` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WinnerForm_ibfk_2` FOREIGN KEY (`address`) REFERENCES `Address` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WinnerForm_ibfk_3` FOREIGN KEY (`bankAccount`) REFERENCES `BankAccount` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WinnerForm_ibfk_4` FOREIGN KEY (`client`) REFERENCES `Client` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WinnerForm_ibfk_5` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WinnerForm_ibfk_6` FOREIGN KEY (`team`) REFERENCES `Team` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WinnerForm_ibfk_7` FOREIGN KEY (`eventStage`) REFERENCES `CompetitionStage` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WithdrawForm`
--

DROP TABLE IF EXISTS `WithdrawForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WithdrawForm` (
  `id` char(30) CHARACTER SET utf8 NOT NULL,
  `status` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `declineReason` mediumtext COLLATE utf8mb4_unicode_ci,
  `paymentType` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) DEFAULT NULL,
  `amount` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hasProofOfBank` tinyint(1) DEFAULT NULL,
  `bank` mediumtext COLLATE utf8mb4_unicode_ci,
  `accountHolder` mediumtext COLLATE utf8mb4_unicode_ci,
  `accountNumber` mediumtext COLLATE utf8mb4_unicode_ci,
  `branch` mediumtext COLLATE utf8mb4_unicode_ci,
  `branchNumber` mediumtext COLLATE utf8mb4_unicode_ci,
  `swiftCode` mediumtext COLLATE utf8mb4_unicode_ci,
  `paypalEmail` mediumtext COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `batchPayment` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `wallet` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `proofOfBank` char(30) CHARACTER SET utf8 DEFAULT NULL,
  `user` char(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `batchPayment` (`batchPayment`),
  KEY `wallet` (`wallet`),
  KEY `proofOfBank` (`proofOfBank`),
  KEY `user` (`user`),
  CONSTRAINT `WithdrawForm_ibfk_1` FOREIGN KEY (`batchPayment`) REFERENCES `BatchPayment` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WithdrawForm_ibfk_2` FOREIGN KEY (`wallet`) REFERENCES `Wallet` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WithdrawForm_ibfk_3` FOREIGN KEY (`proofOfBank`) REFERENCES `Media` (`id`) ON DELETE SET NULL,
  CONSTRAINT `WithdrawForm_ibfk_4` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AdvertisementCampaignEvents`
--

DROP TABLE IF EXISTS `_AdvertisementCampaignEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AdvertisementCampaignEvents` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AdvertisementCampaignEvents_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AdvertisementCampaignEvents_ibfk_1` FOREIGN KEY (`A`) REFERENCES `AdvertisementCampaign` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AdvertisementCampaignEvents_ibfk_2` FOREIGN KEY (`B`) REFERENCES `CompetitionEvent` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AdvertisementCampaignToWebsiteSettings`
--

DROP TABLE IF EXISTS `_AdvertisementCampaignToWebsiteSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AdvertisementCampaignToWebsiteSettings` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AdvertisementCampaignToWebsiteSettings_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AdvertisementCampaignToWebsiteSettings_ibfk_1` FOREIGN KEY (`A`) REFERENCES `AdvertisementCampaign` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AdvertisementCampaignToWebsiteSettings_ibfk_2` FOREIGN KEY (`B`) REFERENCES `WebsiteSettings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AdvertisementToAnalytics`
--

DROP TABLE IF EXISTS `_AdvertisementToAnalytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AdvertisementToAnalytics` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AdvertisementToAnalytics_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AdvertisementToAnalytics_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Advertisement` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AdvertisementToAnalytics_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Analytics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AnalyticsToFeaturedTile`
--

DROP TABLE IF EXISTS `_AnalyticsToFeaturedTile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AnalyticsToFeaturedTile` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AnalyticsToFeaturedTile_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AnalyticsToFeaturedTile_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Analytics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AnalyticsToFeaturedTile_ibfk_2` FOREIGN KEY (`B`) REFERENCES `FeaturedTile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AnalyticsToSlider`
--

DROP TABLE IF EXISTS `_AnalyticsToSlider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AnalyticsToSlider` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AnalyticsToSlider_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AnalyticsToSlider_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Analytics` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AnalyticsToSlider_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Slider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AnnouncementToAuditLog`
--

DROP TABLE IF EXISTS `_AnnouncementToAuditLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AnnouncementToAuditLog` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AnnouncementToAuditLog_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AnnouncementToAuditLog_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Announcement` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AnnouncementToAuditLog_ibfk_2` FOREIGN KEY (`B`) REFERENCES `AuditLog` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AudienceToUser`
--

DROP TABLE IF EXISTS `_AudienceToUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AudienceToUser` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AudienceToUser_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AudienceToUser_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Audience` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AudienceToUser_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AuditLogToCampaign`
--

DROP TABLE IF EXISTS `_AuditLogToCampaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AuditLogToCampaign` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AuditLogToCampaign_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AuditLogToCampaign_ibfk_1` FOREIGN KEY (`A`) REFERENCES `AuditLog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AuditLogToCampaign_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Campaign` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AuditLogToCompetitionTeam`
--

DROP TABLE IF EXISTS `_AuditLogToCompetitionTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AuditLogToCompetitionTeam` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AuditLogToCompetitionTeam_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AuditLogToCompetitionTeam_ibfk_1` FOREIGN KEY (`A`) REFERENCES `AuditLog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AuditLogToCompetitionTeam_ibfk_2` FOREIGN KEY (`B`) REFERENCES `CompetitionTeam` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AuditLogToTeam`
--

DROP TABLE IF EXISTS `_AuditLogToTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AuditLogToTeam` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AuditLogToTeam_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AuditLogToTeam_ibfk_1` FOREIGN KEY (`A`) REFERENCES `AuditLog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AuditLogToTeam_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Team` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AuditLogToWinnerForm`
--

DROP TABLE IF EXISTS `_AuditLogToWinnerForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AuditLogToWinnerForm` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AuditLogToWinnerForm_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AuditLogToWinnerForm_ibfk_1` FOREIGN KEY (`A`) REFERENCES `AuditLog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AuditLogToWinnerForm_ibfk_2` FOREIGN KEY (`B`) REFERENCES `WinnerForm` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AuditLogToWithdrawForm`
--

DROP TABLE IF EXISTS `_AuditLogToWithdrawForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AuditLogToWithdrawForm` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AuditLogToWithdrawForm_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AuditLogToWithdrawForm_ibfk_1` FOREIGN KEY (`A`) REFERENCES `AuditLog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AuditLogToWithdrawForm_ibfk_2` FOREIGN KEY (`B`) REFERENCES `WithdrawForm` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AwardOrganisations`
--

DROP TABLE IF EXISTS `_AwardOrganisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AwardOrganisations` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AwardOrganisations_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AwardOrganisations_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Award` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AwardOrganisations_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Organisation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AwardTeams`
--

DROP TABLE IF EXISTS `_AwardTeams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AwardTeams` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AwardTeams_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AwardTeams_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Award` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AwardTeams_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Team` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_AwardUsers`
--

DROP TABLE IF EXISTS `_AwardUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_AwardUsers` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `AwardUsers_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_AwardUsers_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Award` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_AwardUsers_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_BadgeOrganisations`
--

DROP TABLE IF EXISTS `_BadgeOrganisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_BadgeOrganisations` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `BadgeOrganisations_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_BadgeOrganisations_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Badge` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_BadgeOrganisations_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Organisation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_BadgeTeams`
--

DROP TABLE IF EXISTS `_BadgeTeams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_BadgeTeams` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `BadgeTeams_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_BadgeTeams_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Badge` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_BadgeTeams_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Team` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_BadgeUpgrades`
--

DROP TABLE IF EXISTS `_BadgeUpgrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_BadgeUpgrades` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `BadgeUpgrades_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_BadgeUpgrades_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Badge` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_BadgeUpgrades_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Badge` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_BadgeUsers`
--

DROP TABLE IF EXISTS `_BadgeUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_BadgeUsers` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `BadgeUsers_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_BadgeUsers_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Badge` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_BadgeUsers_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_BlurbCategories`
--

DROP TABLE IF EXISTS `_BlurbCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_BlurbCategories` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `BlurbCategories_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_BlurbCategories_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Blurb` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_BlurbCategories_ibfk_2` FOREIGN KEY (`B`) REFERENCES `BlurbCategory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_BlurbRealms`
--

DROP TABLE IF EXISTS `_BlurbRealms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_BlurbRealms` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `BlurbRealms_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_BlurbRealms_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Blurb` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_BlurbRealms_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Realm` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_BlurbTags`
--

DROP TABLE IF EXISTS `_BlurbTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_BlurbTags` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `BlurbTags_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_BlurbTags_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Blurb` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_BlurbTags_ibfk_2` FOREIGN KEY (`B`) REFERENCES `BlurbTag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_BugReportToMedia`
--

DROP TABLE IF EXISTS `_BugReportToMedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_BugReportToMedia` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `BugReportToMedia_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_BugReportToMedia_ibfk_1` FOREIGN KEY (`A`) REFERENCES `BugReport` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_BugReportToMedia_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CampaignToTag`
--

DROP TABLE IF EXISTS `_CampaignToTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CampaignToTag` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CampaignToTag_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CampaignToTag_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Campaign` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CampaignToTag_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_ChatUsers`
--

DROP TABLE IF EXISTS `_ChatUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_ChatUsers` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `ChatUsers_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_ChatUsers_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Chat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_ChatUsers_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionEventCountries`
--

DROP TABLE IF EXISTS `_CompetitionEventCountries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionEventCountries` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionEventCountries_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionEventCountries_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionEvent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionEventCountries_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionEventScheduleToCompetitionEventScheduleGrou`
--

DROP TABLE IF EXISTS `_CompetitionEventScheduleToCompetitionEventScheduleGrou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionEventScheduleToCompetitionEventScheduleGrou` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionEventScheduleToCompetitionEventScheduleGrou_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionEventScheduleToCompetitionEventScheduleGrou_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionEventSchedule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionEventScheduleToCompetitionEventScheduleGrou_ibfk_2` FOREIGN KEY (`B`) REFERENCES `CompetitionEventScheduleGroup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionEventToPopup`
--

DROP TABLE IF EXISTS `_CompetitionEventToPopup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionEventToPopup` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionEventToPopup_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionEventToPopup_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionEvent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionEventToPopup_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Popup` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionGameVariants`
--

DROP TABLE IF EXISTS `_CompetitionGameVariants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionGameVariants` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionGameVariants_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionGameVariants_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionEvent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionGameVariants_ibfk_2` FOREIGN KEY (`B`) REFERENCES `GameVariant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionGroupTeams`
--

DROP TABLE IF EXISTS `_CompetitionGroupTeams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionGroupTeams` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionGroupTeams_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionGroupTeams_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionGroup` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionGroupTeams_ibfk_2` FOREIGN KEY (`B`) REFERENCES `CompetitionTeam` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionMatchToDispute`
--

DROP TABLE IF EXISTS `_CompetitionMatchToDispute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionMatchToDispute` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionMatchToDispute_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionMatchToDispute_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionMatch` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionMatchToDispute_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Dispute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionMatchToMedia`
--

DROP TABLE IF EXISTS `_CompetitionMatchToMedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionMatchToMedia` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionMatchToMedia_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionMatchToMedia_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionMatch` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionMatchToMedia_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionMatchToSchedule`
--

DROP TABLE IF EXISTS `_CompetitionMatchToSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionMatchToSchedule` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionMatchToSchedule_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionMatchToSchedule_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionMatch` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionMatchToSchedule_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Schedule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionPlatforms`
--

DROP TABLE IF EXISTS `_CompetitionPlatforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionPlatforms` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionPlatforms_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionPlatforms_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionEvent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionPlatforms_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Platform` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionStageTeams`
--

DROP TABLE IF EXISTS `_CompetitionStageTeams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionStageTeams` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionStageTeams_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionStageTeams_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionStage` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionStageTeams_ibfk_2` FOREIGN KEY (`B`) REFERENCES `CompetitionTeam` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionSubmissionToMedia`
--

DROP TABLE IF EXISTS `_CompetitionSubmissionToMedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionSubmissionToMedia` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionSubmissionToMedia_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionSubmissionToMedia_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionSubmission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionSubmissionToMedia_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionSubmissionVotes`
--

DROP TABLE IF EXISTS `_CompetitionSubmissionVotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionSubmissionVotes` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionSubmissionVotes_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionSubmissionVotes_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionSubmission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionSubmissionVotes_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionTeamBountyLogs`
--

DROP TABLE IF EXISTS `_CompetitionTeamBountyLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionTeamBountyLogs` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionTeamBountyLogs_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionTeamBountyLogs_ibfk_1` FOREIGN KEY (`A`) REFERENCES `BountyLog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionTeamBountyLogs_ibfk_2` FOREIGN KEY (`B`) REFERENCES `CompetitionTeam` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionTeamRoster`
--

DROP TABLE IF EXISTS `_CompetitionTeamRoster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionTeamRoster` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionTeamRoster_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionTeamRoster_ibfk_1` FOREIGN KEY (`A`) REFERENCES `CompetitionTeam` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionTeamRoster_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_CompetitionToRole`
--

DROP TABLE IF EXISTS `_CompetitionToRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_CompetitionToRole` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `CompetitionToRole_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_CompetitionToRole_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Competition` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_CompetitionToRole_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_FollowerUsers`
--

DROP TABLE IF EXISTS `_FollowerUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_FollowerUsers` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `FollowerUsers_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_FollowerUsers_ibfk_1` FOREIGN KEY (`A`) REFERENCES `User` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_FollowerUsers_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_FollowingUsers`
--

DROP TABLE IF EXISTS `_FollowingUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_FollowingUsers` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `FollowingUsers_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_FollowingUsers_ibfk_1` FOREIGN KEY (`A`) REFERENCES `User` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_FollowingUsers_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_LeaderboardToLeaderboardPointsAllocation`
--

DROP TABLE IF EXISTS `_LeaderboardToLeaderboardPointsAllocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_LeaderboardToLeaderboardPointsAllocation` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `LeaderboardToLeaderboardPointsAllocation_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_LeaderboardToLeaderboardPointsAllocation_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Leaderboard` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_LeaderboardToLeaderboardPointsAllocation_ibfk_2` FOREIGN KEY (`B`) REFERENCES `LeaderboardPointsAllocation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_MissionUpgrades`
--

DROP TABLE IF EXISTS `_MissionUpgrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_MissionUpgrades` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `MissionUpgrades_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_MissionUpgrades_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Mission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_MissionUpgrades_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Mission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_OrganisationActivityEvents`
--

DROP TABLE IF EXISTS `_OrganisationActivityEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_OrganisationActivityEvents` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `OrganisationActivityEvents_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_OrganisationActivityEvents_ibfk_1` FOREIGN KEY (`A`) REFERENCES `ActivityEvent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_OrganisationActivityEvents_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Organisation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_PopupToPopupLog`
--

DROP TABLE IF EXISTS `_PopupToPopupLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_PopupToPopupLog` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `PopupToPopupLog_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_PopupToPopupLog_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Popup` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_PopupToPopupLog_ibfk_2` FOREIGN KEY (`B`) REFERENCES `PopupLog` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_RuleToRule`
--

DROP TABLE IF EXISTS `_RuleToRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_RuleToRule` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `RuleToRule_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_RuleToRule_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_RuleToRule_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_RuleToRuleSet`
--

DROP TABLE IF EXISTS `_RuleToRuleSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_RuleToRuleSet` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `RuleToRuleSet_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_RuleToRuleSet_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Rule` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_RuleToRuleSet_ibfk_2` FOREIGN KEY (`B`) REFERENCES `RuleSet` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_SliderRealms`
--

DROP TABLE IF EXISTS `_SliderRealms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_SliderRealms` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `SliderRealms_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_SliderRealms_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Realm` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_SliderRealms_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Slider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_SocialShareToWinnerForm`
--

DROP TABLE IF EXISTS `_SocialShareToWinnerForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_SocialShareToWinnerForm` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `SocialShareToWinnerForm_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_SocialShareToWinnerForm_ibfk_1` FOREIGN KEY (`A`) REFERENCES `SocialShare` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_SocialShareToWinnerForm_ibfk_2` FOREIGN KEY (`B`) REFERENCES `WinnerForm` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_SpinnerAdvertismentCampaigns`
--

DROP TABLE IF EXISTS `_SpinnerAdvertismentCampaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_SpinnerAdvertismentCampaigns` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `SpinnerAdvertismentCampaigns_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_SpinnerAdvertismentCampaigns_ibfk_1` FOREIGN KEY (`A`) REFERENCES `AdvertisementCampaign` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_SpinnerAdvertismentCampaigns_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Spinner` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_SpinnerProductLogs`
--

DROP TABLE IF EXISTS `_SpinnerProductLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_SpinnerProductLogs` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `SpinnerProductLogs_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_SpinnerProductLogs_ibfk_1` FOREIGN KEY (`A`) REFERENCES `AuditLog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_SpinnerProductLogs_ibfk_2` FOREIGN KEY (`B`) REFERENCES `SpinnerProduct` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_SpinnerProducts`
--

DROP TABLE IF EXISTS `_SpinnerProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_SpinnerProducts` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `SpinnerProducts_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_SpinnerProducts_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Spinner` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_SpinnerProducts_ibfk_2` FOREIGN KEY (`B`) REFERENCES `SpinnerProduct` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_SponsorToSponsorList`
--

DROP TABLE IF EXISTS `_SponsorToSponsorList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_SponsorToSponsorList` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `SponsorToSponsorList_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_SponsorToSponsorList_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Sponsor` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_SponsorToSponsorList_ibfk_2` FOREIGN KEY (`B`) REFERENCES `SponsorList` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_StatisticUser`
--

DROP TABLE IF EXISTS `_StatisticUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_StatisticUser` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `StatisticUser_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_StatisticUser_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Statistic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_StatisticUser_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_StreamerTags`
--

DROP TABLE IF EXISTS `_StreamerTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_StreamerTags` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `StreamerTags_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_StreamerTags_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Streamer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_StreamerTags_ibfk_2` FOREIGN KEY (`B`) REFERENCES `StreamerTag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_StreamerToStreamerSchedule`
--

DROP TABLE IF EXISTS `_StreamerToStreamerSchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_StreamerToStreamerSchedule` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `StreamerToStreamerSchedule_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_StreamerToStreamerSchedule_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Streamer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_StreamerToStreamerSchedule_ibfk_2` FOREIGN KEY (`B`) REFERENCES `StreamerSchedule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_StreamerVoters`
--

DROP TABLE IF EXISTS `_StreamerVoters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_StreamerVoters` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `StreamerVoters_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_StreamerVoters_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Streamer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_StreamerVoters_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_TeamActivityEvents`
--

DROP TABLE IF EXISTS `_TeamActivityEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_TeamActivityEvents` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `TeamActivityEvents_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_TeamActivityEvents_ibfk_1` FOREIGN KEY (`A`) REFERENCES `ActivityEvent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_TeamActivityEvents_ibfk_2` FOREIGN KEY (`B`) REFERENCES `Team` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_TimelineToTimelinePoint`
--

DROP TABLE IF EXISTS `_TimelineToTimelinePoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_TimelineToTimelinePoint` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `TimelineToTimelinePoint_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_TimelineToTimelinePoint_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Timeline` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_TimelineToTimelinePoint_ibfk_2` FOREIGN KEY (`B`) REFERENCES `TimelinePoint` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_UserActivityEvents`
--

DROP TABLE IF EXISTS `_UserActivityEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_UserActivityEvents` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `UserActivityEvents_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_UserActivityEvents_ibfk_1` FOREIGN KEY (`A`) REFERENCES `ActivityEvent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_UserActivityEvents_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_UserLiveries`
--

DROP TABLE IF EXISTS `_UserLiveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_UserLiveries` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `UserLiveries_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_UserLiveries_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Livery` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_UserLiveries_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_UserMissonLogs`
--

DROP TABLE IF EXISTS `_UserMissonLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_UserMissonLogs` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `UserMissonLogs_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_UserMissonLogs_ibfk_1` FOREIGN KEY (`A`) REFERENCES `AuditLog` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_UserMissonLogs_ibfk_2` FOREIGN KEY (`B`) REFERENCES `UserMission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_UserStatistics`
--

DROP TABLE IF EXISTS `_UserStatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_UserStatistics` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `UserStatistics_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_UserStatistics_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Statistic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_UserStatistics_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_UserTeams`
--

DROP TABLE IF EXISTS `_UserTeams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_UserTeams` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `UserTeams_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_UserTeams_ibfk_1` FOREIGN KEY (`A`) REFERENCES `Team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_UserTeams_ibfk_2` FOREIGN KEY (`B`) REFERENCES `User` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `_WinnerFormRoster`
--

DROP TABLE IF EXISTS `_WinnerFormRoster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_WinnerFormRoster` (
  `A` char(25) CHARACTER SET utf8 NOT NULL,
  `B` char(25) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `WinnerFormRoster_AB_unique` (`A`,`B`),
  KEY `B` (`B`),
  CONSTRAINT `_WinnerFormRoster_ibfk_1` FOREIGN KEY (`A`) REFERENCES `User` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_WinnerFormRoster_ibfk_2` FOREIGN KEY (`B`) REFERENCES `WinnerForm` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-19  9:52:21
