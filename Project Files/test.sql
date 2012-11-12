-- MySQL dump 10.11
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	5.0.77

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
-- Current Database: `asterisk`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `asterisk` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `asterisk`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `admin` (
  `variable` varchar(20) NOT NULL default '',
  `value` varchar(80) NOT NULL default '',
  PRIMARY KEY  (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('need_reload','true'),('version','2.5.2'),('email','kanderson@zee-way.com');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ampusers`
--

DROP TABLE IF EXISTS `ampusers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ampusers` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(20) NOT NULL default '',
  `extension_low` varchar(20) NOT NULL default '',
  `extension_high` varchar(20) NOT NULL default '',
  `deptname` varchar(20) NOT NULL default '',
  `sections` blob NOT NULL,
  PRIMARY KEY  (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ampusers`
--

LOCK TABLES `ampusers` WRITE;
/*!40000 ALTER TABLE `ampusers` DISABLE KEYS */;
INSERT INTO `ampusers` VALUES ('admin','admin','','','','*');
/*!40000 ALTER TABLE `ampusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `announcement` (
  `announcement_id` int(11) NOT NULL auto_increment,
  `description` varchar(50) default NULL,
  `recording_id` int(11) default NULL,
  `allow_skip` int(11) default NULL,
  `post_dest` varchar(255) default NULL,
  `return_ivr` tinyint(1) NOT NULL default '0',
  `noanswer` tinyint(1) NOT NULL default '0',
  `repeat_msg` varchar(2) NOT NULL default '',
  PRIMARY KEY  (`announcement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidlookup`
--

DROP TABLE IF EXISTS `cidlookup`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cidlookup` (
  `cidlookup_id` int(11) NOT NULL auto_increment,
  `description` varchar(50) NOT NULL,
  `sourcetype` varchar(100) NOT NULL,
  `cache` tinyint(1) NOT NULL default '0',
  `deptname` varchar(30) default NULL,
  `http_host` varchar(30) default NULL,
  `http_port` varchar(30) default NULL,
  `http_username` varchar(30) default NULL,
  `http_password` varchar(30) default NULL,
  `http_path` varchar(100) default NULL,
  `http_query` varchar(100) default NULL,
  `mysql_host` varchar(60) default NULL,
  `mysql_dbname` varchar(60) default NULL,
  `mysql_query` text,
  `mysql_username` varchar(30) default NULL,
  `mysql_password` varchar(30) default NULL,
  PRIMARY KEY  (`cidlookup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cidlookup`
--

LOCK TABLES `cidlookup` WRITE;
/*!40000 ALTER TABLE `cidlookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidlookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidlookup_incoming`
--

DROP TABLE IF EXISTS `cidlookup_incoming`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cidlookup_incoming` (
  `cidlookup_id` int(11) NOT NULL,
  `extension` varchar(50) default NULL,
  `cidnum` varchar(30) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cidlookup_incoming`
--

LOCK TABLES `cidlookup_incoming` WRITE;
/*!40000 ALTER TABLE `cidlookup_incoming` DISABLE KEYS */;
INSERT INTO `cidlookup_incoming` VALUES (0,'8883330573',''),(0,'3607196745','');
/*!40000 ALTER TABLE `cidlookup_incoming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cronmanager`
--

DROP TABLE IF EXISTS `cronmanager`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cronmanager` (
  `module` varchar(24) NOT NULL default '',
  `id` varchar(24) NOT NULL default '',
  `time` varchar(5) default NULL,
  `freq` int(11) NOT NULL default '0',
  `lasttime` int(11) NOT NULL default '0',
  `command` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`module`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cronmanager`
--

LOCK TABLES `cronmanager` WRITE;
/*!40000 ALTER TABLE `cronmanager` DISABLE KEYS */;
INSERT INTO `cronmanager` VALUES ('module_admin','UPDATES','22',24,1288879621,'/var/lib/asterisk/bin/module_admin listonline');
/*!40000 ALTER TABLE `cronmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_destinations`
--

DROP TABLE IF EXISTS `custom_destinations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `custom_destinations` (
  `custom_dest` varchar(80) NOT NULL default '',
  `description` varchar(40) NOT NULL default '',
  `notes` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`custom_dest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `custom_destinations`
--

LOCK TABLES `custom_destinations` WRITE;
/*!40000 ALTER TABLE `custom_destinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_destinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_extensions`
--

DROP TABLE IF EXISTS `custom_extensions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `custom_extensions` (
  `custom_exten` varchar(80) NOT NULL default '',
  `description` varchar(40) NOT NULL default '',
  `notes` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`custom_exten`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `custom_extensions`
--

LOCK TABLES `custom_extensions` WRITE;
/*!40000 ALTER TABLE `custom_extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daynight`
--

DROP TABLE IF EXISTS `daynight`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `daynight` (
  `ext` varchar(10) NOT NULL default '',
  `dmode` varchar(40) NOT NULL default '',
  `dest` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`ext`,`dmode`,`dest`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `daynight`
--

LOCK TABLES `daynight` WRITE;
/*!40000 ALTER TABLE `daynight` DISABLE KEYS */;
/*!40000 ALTER TABLE `daynight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `devices` (
  `id` varchar(20) NOT NULL default '',
  `tech` varchar(10) NOT NULL default '',
  `dial` varchar(50) NOT NULL default '',
  `devicetype` varchar(5) NOT NULL default '',
  `user` varchar(50) default NULL,
  `description` varchar(50) default NULL,
  `emergency_cid` varchar(100) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES ('300','sip','SIP/300','fixed','300','David Anderson',''),('200','sip','SIP/200','fixed','200','Kris Anderson',''),('201','sip','SIP/201','fixed','201','Sam Sprain',''),('400','sip','SIP/400','fixed','400','Prayer Room - Main',''),('500','sip','SIP/500','fixed','500','Josiah Otto',''),('203','custom','CUSTOM/203','fixed','203','Kevin Louis',''),('202','sip','SIP/202','fixed','202','Kris - Cell','');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disa`
--

DROP TABLE IF EXISTS `disa`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `disa` (
  `disa_id` int(11) NOT NULL auto_increment,
  `displayname` varchar(50) default NULL,
  `pin` varchar(50) default NULL,
  `cid` varchar(50) default NULL,
  `context` varchar(50) default NULL,
  `digittimeout` int(11) default NULL,
  `resptimeout` int(11) default NULL,
  `needconf` varchar(10) default NULL,
  `hangup` varchar(10) default NULL,
  PRIMARY KEY  (`disa_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `disa`
--

LOCK TABLES `disa` WRITE;
/*!40000 ALTER TABLE `disa` DISABLE KEYS */;
INSERT INTO `disa` VALUES (1,'Kat Long Distance','1111','','from-internal',5,10,'','');
/*!40000 ALTER TABLE `disa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `extensions` (
  `context` varchar(45) NOT NULL default 'default',
  `extension` varchar(45) NOT NULL default '',
  `priority` varchar(5) NOT NULL default '1',
  `application` varchar(45) NOT NULL default '',
  `args` varchar(255) default NULL,
  `descr` text,
  `flags` int(1) NOT NULL default '0',
  PRIMARY KEY  (`context`,`extension`,`priority`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `extensions`
--

LOCK TABLES `extensions` WRITE;
/*!40000 ALTER TABLE `extensions` DISABLE KEYS */;
INSERT INTO `extensions` VALUES ('outrt-001-Domestic','_1NXXNXXXXXX','1','Macro','dialout-enum,1,${EXTEN:1},',NULL,0),('outrt-001-Domestic','_1NXXNXXXXXX','2','Macro','dialout-trunk,3,${EXTEN:1},',NULL,0),('outrt-001-Domestic','_1NXXNXXXXXX','3','Macro','dialout-trunk,4,${EXTEN:1},',NULL,0),('outrt-001-Domestic','_1NXXNXXXXXX','4','Macro','outisbusy','No available circuits',0),('outrt-001-Domestic','_NXXNXXXXXX','1','Macro','dialout-enum,1,${EXTEN},',NULL,0),('outrt-001-Domestic','_NXXNXXXXXX','2','Macro','dialout-trunk,3,${EXTEN},',NULL,0),('outrt-001-Domestic','_NXXNXXXXXX','3','Macro','dialout-trunk,4,${EXTEN},',NULL,0),('outrt-001-Domestic','_NXXNXXXXXX','4','Macro','outisbusy','No available circuits',0),('outbound-allroutes','include','1','outrt-001-Domestic','','',2);
/*!40000 ALTER TABLE `extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featurecodes`
--

DROP TABLE IF EXISTS `featurecodes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `featurecodes` (
  `modulename` varchar(50) NOT NULL default '',
  `featurename` varchar(50) NOT NULL default '',
  `description` varchar(200) NOT NULL default '',
  `defaultcode` varchar(20) default NULL,
  `customcode` varchar(20) default NULL,
  `enabled` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`modulename`,`featurename`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `featurecodes`
--

LOCK TABLES `featurecodes` WRITE;
/*!40000 ALTER TABLE `featurecodes` DISABLE KEYS */;
INSERT INTO `featurecodes` VALUES ('core','userlogon','User Logon','*11',NULL,1),('core','userlogoff','User Logoff','*12',NULL,1),('core','zapbarge','ZapBarge','888',NULL,1),('core','simu_pstn','Simulate Incoming Call','7777',NULL,1),('core','simu_fax','Dial System FAX','666',NULL,1),('core','chanspy','ChanSpy','555',NULL,1),('core','pickup','Directed Call Pickup','**',NULL,1),('recordings','record_save','Save Recording','*77',NULL,1),('recordings','record_check','Check Recording','*99',NULL,1),('callforward','cfon','Call Forward All Activate','*72',NULL,1),('callforward','cfoff','Call Forward All Deactivate','*73',NULL,1),('callforward','cfoff_any','Call Forward All Prompting Deactivate','*74',NULL,1),('callforward','cfbon','Call Forward Busy Activate','*90',NULL,1),('callforward','cfboff','Call Forward Busy Deactivate','*91',NULL,1),('callforward','cfboff_any','Call Forward Busy Prompting Deactivate','*92',NULL,1),('callforward','cfuon','Call Forward No Answer/Unavailable Activate','*52',NULL,1),('callforward','cfuoff','Call Forward No Answer/Unavailable Deactivate','*53',NULL,1),('callwaiting','cwon','Call Waiting - Activate','*70',NULL,1),('callwaiting','cwoff','Call Waiting - Deactivate','*71',NULL,1),('blacklist','blacklist_add','Blacklist a number','*30',NULL,1),('blacklist','blacklist_remove','Remove a number from the blacklist','*31',NULL,1),('blacklist','blacklist_last','Blacklist the last caller','*32',NULL,1),('voicemail','myvoicemail','My Voicemail','*97',NULL,1),('voicemail','dialvoicemail','Dial Voicemail','*98',NULL,1),('speeddial','callspeeddial','Speeddial prefix','*0',NULL,1),('speeddial','setspeeddial','Set user speed dial','*75',NULL,1),('infoservices','directory','Directory','#',NULL,1),('infoservices','calltrace','Call Trace','*69',NULL,1),('infoservices','echotest','Echo Test','*43',NULL,1),('infoservices','speakingclock','Speaking Clock','*60',NULL,1),('infoservices','speakextennum','Speak Your Exten Number','*65',NULL,1),('donotdisturb','dnd_on','DND Activate','*78',NULL,1),('donotdisturb','dnd_off','DND Deactivate','*79',NULL,1),('donotdisturb','dnd_toggle','DND Toggle','*76',NULL,1),('core','pickupexten','Asterisk General Call Pickup','*8',NULL,1),('core','blindxfer','In-Call Asterisk Blind Transfer','##',NULL,1),('core','atxfer','In-Call Asterisk Attended Transfer','*2',NULL,1),('core','automon','In-Call Asterisk Toggle Call Recording','*1',NULL,1),('core','disconnect','In-Call Asterisk Disconnect Code','**',NULL,1),('pbdirectory','app-pbdirectory','Phonebook dial-by-name directory','411',NULL,1),('findmefollow','fmf_toggle','Findme Follow Toggle','*21',NULL,1),('paging','intercom-prefix','Intercom prefix','*80',NULL,0),('paging','intercom-on','User Intercom Allow','*54',NULL,0),('paging','intercom-off','User Intercom Disallow','*55',NULL,0);
/*!40000 ALTER TABLE `featurecodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `findmefollow`
--

DROP TABLE IF EXISTS `findmefollow`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `findmefollow` (
  `grpnum` varchar(20) NOT NULL,
  `strategy` varchar(50) NOT NULL,
  `grptime` smallint(6) NOT NULL,
  `grppre` varchar(100) default NULL,
  `grplist` varchar(255) NOT NULL,
  `annmsg_id` int(11) default NULL,
  `postdest` varchar(255) default NULL,
  `dring` varchar(255) default NULL,
  `remotealert_id` int(11) default NULL,
  `needsconf` varchar(10) default NULL,
  `toolate_id` int(11) default NULL,
  `pre_ring` smallint(6) NOT NULL default '0',
  `ringing` varchar(80) default NULL,
  PRIMARY KEY  (`grpnum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `findmefollow`
--

LOCK TABLES `findmefollow` WRITE;
/*!40000 ALTER TABLE `findmefollow` DISABLE KEYS */;
INSERT INTO `findmefollow` VALUES ('200','ringallv2',60,'','200-202-2146904814#',0,'ext-local,vmu200,1','',0,'CHECKED',0,4,'Ring'),('201','ringallv2',60,'','201-4696846582#',0,'ext-local,vmu201,1','',0,'',0,3,'Ring'),('500','ringallv2',60,'','500-4696581001#',0,'app-blackhole,hangup,1','',0,'',0,0,'Ring'),('203','ringallv2',60,'','5125739010#',0,'app-blackhole,congestion,1','',0,'',0,0,'Ring');
/*!40000 ALTER TABLE `findmefollow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freepbx_log`
--

DROP TABLE IF EXISTS `freepbx_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `freepbx_log` (
  `id` int(11) NOT NULL auto_increment,
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  `section` varchar(50) default NULL,
  `level` enum('error','warning','debug','devel-debug') NOT NULL default 'error',
  `status` int(11) NOT NULL default '0',
  `message` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `time` (`time`,`level`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `freepbx_log`
--

LOCK TABLES `freepbx_log` WRITE;
/*!40000 ALTER TABLE `freepbx_log` DISABLE KEYS */;
INSERT INTO `freepbx_log` VALUES (1,'2006-11-06 01:55:36','retrieve_conf','devel-debug',0,'Started retrieve_conf, DB Connection OK'),(2,'2006-11-06 01:55:36','retrieve_conf','devel-debug',0,'Writing extensions_additional.conf');
/*!40000 ALTER TABLE `freepbx_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globals`
--

DROP TABLE IF EXISTS `globals`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `globals` (
  `variable` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `globals`
--

LOCK TABLES `globals` WRITE;
/*!40000 ALTER TABLE `globals` DISABLE KEYS */;
INSERT INTO `globals` VALUES ('CALLFILENAME','\"\"'),('DIAL_OPTIONS','tr'),('TRUNK_OPTIONS','T'),('DIAL_OUT','9'),('FAX',''),('FAX_RX','system'),('FAX_RX_EMAIL','kanderson@zee-way.com'),('FAX_RX_FROM','sip@zee-way.com'),('INCOMING','group-all'),('NULL','\"\"'),('OPERATOR',''),('OPERATOR_XTN',''),('PARKNOTIFY','SIP/200'),('RECORDEXTEN','\"\"'),('RINGTIMER','15'),('DIRECTORY','last'),('AFTER_INCOMING',''),('IN_OVERRIDE','forcereghours'),('REGTIME','7:55-17:05'),('REGDAYS','mon-fri'),('DIRECTORY_OPTS',''),('DIALOUTIDS','1'),('VM_PREFIX','*'),('VM_OPTS',''),('VM_GAIN',''),('VM_DDTYPE','u'),('TIMEFORMAT','kM'),('TONEZONE','us'),('ALLOW_SIP_ANON','yes'),('VMX_CONTEXT','from-internal'),('VMX_PRI','1'),('VMX_TIMEDEST_CONTEXT',''),('VMX_TIMEDEST_EXT','dovm'),('VMX_TIMEDEST_PRI','1'),('VMX_LOOPDEST_CONTEXT',''),('VMX_LOOPDEST_EXT','dovm'),('VMX_LOOPDEST_PRI','1'),('VMX_OPTS_TIMEOUT',''),('VMX_OPTS_LOOP',''),('VMX_OPTS_DOVM',''),('VMX_TIMEOUT','2'),('VMX_REPEAT','1'),('VMX_LOOPS','1'),('TRANSFER_CONTEXT','from-internal-xfer'),('MIXMON_FORMAT','wav'),('MIXMON_DIR',''),('MIXMON_POST',''),('RECORDING_STATE','ENABLED'),('OUT_1','ENUM/'),('OUTPREFIX_1',''),('OUTMAXCHANS_1','10'),('OUTCID_1',''),('OUTKEEPCID_1','off'),('OUTFAIL_1',''),('OUTDISABLE_1','off'),('OUT_3','SIP/unlimitednet-primary'),('OUTPREFIX_3',''),('OUTMAXCHANS_3',''),('OUTCID_3',''),('OUTKEEPCID_3','off'),('OUTFAIL_3',''),('OUTDISABLE_3','off'),('OUT_4','SIP/unlimitednet-secondary'),('OUTPREFIX_4',''),('OUTMAXCHANS_4',''),('OUTCID_4',''),('OUTKEEPCID_4','off'),('OUTFAIL_4',''),('OUTDISABLE_4','off');
/*!40000 ALTER TABLE `globals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iax`
--

DROP TABLE IF EXISTS `iax`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `iax` (
  `id` varchar(20) NOT NULL default '-1',
  `keyword` varchar(30) NOT NULL default '',
  `data` varchar(255) NOT NULL,
  `flags` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `iax`
--

LOCK TABLES `iax` WRITE;
/*!40000 ALTER TABLE `iax` DISABLE KEYS */;
/*!40000 ALTER TABLE `iax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incoming`
--

DROP TABLE IF EXISTS `incoming`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `incoming` (
  `cidnum` varchar(20) default NULL,
  `extension` varchar(20) default NULL,
  `destination` varchar(50) default NULL,
  `faxexten` varchar(20) default NULL,
  `faxemail` varchar(50) default NULL,
  `answer` tinyint(1) default NULL,
  `wait` int(2) default NULL,
  `privacyman` tinyint(1) default NULL,
  `alertinfo` varchar(255) default NULL,
  `ringing` varchar(20) default NULL,
  `mohclass` varchar(80) NOT NULL default 'default',
  `description` varchar(80) default NULL,
  `grppre` varchar(80) default NULL,
  `delay_answer` int(2) default NULL,
  `pricid` varchar(20) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `incoming`
--

LOCK TABLES `incoming` WRITE;
/*!40000 ALTER TABLE `incoming` DISABLE KEYS */;
INSERT INTO `incoming` VALUES ('','3607197197','from-did-direct,300,1','','',0,0,0,'','','default','','',0,''),('','3607197190','from-did-direct,200,1','','',0,0,0,'','','default','','',0,''),('','3607196747','from-did-direct,201,1','','',0,0,0,'','','default','','',0,''),('','8883330573','from-did-direct,500,1','default','',0,0,0,'','','default','','CO:',0,''),('','3607196745','disa,1,1','default','',0,0,0,'','','default','Long Distance Call In','',0,'');
/*!40000 ALTER TABLE `incoming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivr`
--

DROP TABLE IF EXISTS `ivr`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ivr` (
  `ivr_id` int(11) NOT NULL auto_increment,
  `displayname` varchar(50) default NULL,
  `deptname` varchar(50) default NULL,
  `enable_directory` varchar(8) default NULL,
  `enable_directdial` varchar(8) default NULL,
  `timeout` int(11) default NULL,
  `dircontext` varchar(50) default 'default',
  `alt_timeout` varchar(8) default NULL,
  `alt_invalid` varchar(8) default NULL,
  `loops` tinyint(1) NOT NULL default '2',
  `announcement_id` int(11) default NULL,
  `timeout_id` int(11) default NULL,
  `invalid_id` int(11) default NULL,
  `retvm` varchar(8) default NULL,
  PRIMARY KEY  (`ivr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ivr`
--

LOCK TABLES `ivr` WRITE;
/*!40000 ALTER TABLE `ivr` DISABLE KEYS */;
INSERT INTO `ivr` VALUES (1,'__install_done','1',NULL,NULL,NULL,'default',NULL,NULL,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ivr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ivr_dests`
--

DROP TABLE IF EXISTS `ivr_dests`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ivr_dests` (
  `ivr_id` int(11) NOT NULL,
  `selection` varchar(10) default NULL,
  `dest` varchar(50) default NULL,
  `ivr_ret` tinyint(1) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ivr_dests`
--

LOCK TABLES `ivr_dests` WRITE;
/*!40000 ALTER TABLE `ivr_dests` DISABLE KEYS */;
/*!40000 ALTER TABLE `ivr_dests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL auto_increment,
  `lang_code` varchar(50) default NULL,
  `description` varchar(50) default NULL,
  `dest` varchar(255) default NULL,
  PRIMARY KEY  (`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetme`
--

DROP TABLE IF EXISTS `meetme`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `meetme` (
  `exten` varchar(50) NOT NULL,
  `options` varchar(15) default NULL,
  `userpin` varchar(50) default NULL,
  `adminpin` varchar(50) default NULL,
  `description` varchar(50) default NULL,
  `joinmsg_id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `meetme`
--

LOCK TABLES `meetme` WRITE;
/*!40000 ALTER TABLE `meetme` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_xml`
--

DROP TABLE IF EXISTS `module_xml`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `module_xml` (
  `id` varchar(20) NOT NULL default 'xml',
  `time` int(11) NOT NULL default '0',
  `data` mediumblob NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `module_xml`
--

LOCK TABLES `module_xml` WRITE;
/*!40000 ALTER TABLE `module_xml` DISABLE KEYS */;
INSERT INTO `module_xml` VALUES ('installid',1273601132,'59053fbe9ea6eac25b36e9d942be6bd0'),('type',1273601132,''),('mod_serialized',1288879622,'a:38:{s:7:\"builtin\";a:12:{s:7:\"rawname\";s:7:\"builtin\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:4:\"name\";s:7:\"Builtin\";s:7:\"version\";s:7:\"2.3.0.2\";s:10:\"candisable\";s:2:\"no\";s:12:\"canuninstall\";s:2:\"no\";s:9:\"changelog\";s:24:\"\n		*0.1* First release\n	\";s:9:\"menuitems\";a:2:{s:8:\"modules1\";s:12:\"Module Admin\";s:8:\"modules2\";s:12:\"Module Admin\";}s:11:\"displayname\";s:7:\"Builtin\";s:5:\"items\";a:2:{s:8:\"modules1\";a:5:{s:4:\"name\";s:12:\"Module Admin\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:5:\"Admin\";s:4:\"sort\";s:2:\"-9\";s:7:\"display\";s:7:\"modules\";}s:8:\"modules2\";a:5:{s:4:\"name\";s:12:\"Module Admin\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Admin\";s:4:\"sort\";s:2:\"-9\";s:7:\"display\";s:7:\"modules\";}}s:6:\"status\";i:2;}s:7:\"parking\";a:15:{s:7:\"rawname\";s:7:\"parking\";s:4:\"name\";s:11:\"Parking Lot\";s:7:\"version\";s:7:\"2.5.1.4\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:11:\"description\";s:139:\"Manages parking lot extensions and other options.	Parking is a way of putting calls \"on hold\", and then picking them up from any extension.\";s:9:\"menuitems\";a:1:{s:7:\"parking\";s:11:\"Parking Lot\";}s:9:\"changelog\";s:971:\"\n		*2.5.1.4* localization updates\n		*2.5.1.3* localization fixes\n		*2.5.1.2* localization fixes\n		*2.5.1.1* #2718 fix orphaned call not going to destination\n		*2.5.1* #2067 change recording to recording id\n		*2.5.0* #2845 tabindex\n		*2.4.0.6* #2604, #2716, #2843 fix mal-formed html tags, localization fix, Russian Translation\n		*2.4.0.5* added depends on 2.4.0\n		*2.4.0.4* removed parkhints on Asterisk 1.2, metermaid already does and this creates undesired hints\n		*2.4.0.3* change to core_conf and features_general_addtional.conf, no more parking_additianal.inc\n		*2.4.0.2* create hints for Asterisk 1.4 and above\n		*2.4.0.1* add parking_conf class, support PARKINGPATCH config\n		*2.4.0* Destination registry, it translation\n		*2.1.2.1* bump for rc1\n		*2.1.2* merge findmefollow/core extension destinations if any\n		*2.1.1* fix pseudo hardcoded path issue (hardcoded form missing global)\n		*2.1* Remove settings on uninstall bug #1597\n		*2.0.2* Add he_IL translation\n	\";s:7:\"depends\";a:2:{s:7:\"version\";s:11:\"2.5.0alpha1\";s:6:\"module\";s:19:\"recordings ge 3.3.8\";}s:8:\"location\";s:31:\"release/2.5/parking-2.5.1.3.tgz\";s:6:\"md5sum\";s:32:\"024cdd132a1c3d2900165a4c4ea3ce46\";s:11:\"displayname\";s:11:\"Parking Lot\";s:5:\"items\";a:1:{s:7:\"parking\";a:4:{s:4:\"name\";s:11:\"Parking Lot\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:32:\"Internal Options & Configuration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.1.4\";}s:10:\"recordings\";a:17:{s:7:\"rawname\";s:10:\"recordings\";s:4:\"name\";s:10:\"Recordings\";s:7:\"version\";s:8:\"3.3.8.10\";s:10:\"candisable\";s:2:\"no\";s:12:\"canuninstall\";s:2:\"no\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:11:\"description\";s:76:\"Creates and manages system recordings, used by many other modules (eg, IVR).\";s:9:\"changelog\";s:1291:\"\n		*3.3.8.10* #3605\n		*3.3.8.9* localization updates\n		*3.3.8.8* localization fixes, misc\n		*3.3.8.7* #3108, #3138 Sqlite3 fix\n		*3.3.8.6* #3058 really again, use encodeURIComponent() in javascript, and remove urlencoding from crypt function\n		*3.3.8.5* #3058 again, revert crypt.php again\n		*3.3.8.4* #3058 properly display messages for unplayble formats and revert r6234 for crypt.php\n		*3.3.8.3* #2987, #3011, #3036 sqlite3 install, spelling, remove popup.css\n		*3.3.8.2* #2547, #2983 remove access violation so modules dir can be locked down, fix bug in sound file path, add back encryption\n		*3.3.8.1* fixed typo in recordings_list\n		*3.3.8* #2063, #2064, #2065, #2066, #2067, #2068, #2069\n		*3.3.7.1* dependency to 2.5\n		*3.3.7* #2889 add optional feature codes linked to recordings to be able to easily change\n		*3.3.6.2* #2604, #2843 fix mal-formed html tags, Russian Translation\n		*3.3.6.1* #2591, enhance code so bad directory copy errors are reported\n		*3.3.6* it translations, removed legacy ext-recordings left in error\n		*3.3.5.4* #2426 remove non-functioning download link\n		*3.3.5.3* #2409 syntax error in audio.php could cause playback problems\n		*3.3.5.2* #2016 allow amportal.conf AMPLAYKEY override hardcoded crypt key\n		*3.3.5.1* CHANGELOG TRUNCATED See SVN Repository\n	\";s:9:\"menuitems\";a:1:{s:10:\"recordings\";s:17:\"System Recordings\";}s:7:\"depends\";a:1:{s:7:\"version\";s:11:\"2.5.0alpha1\";}s:8:\"location\";s:34:\"release/2.5/recordings-3.3.8.9.tgz\";s:6:\"md5sum\";s:32:\"10d38eb3324ce51b3e396f0fabb35d94\";s:11:\"displayname\";s:10:\"Recordings\";s:5:\"items\";a:1:{s:10:\"recordings\";a:4:{s:4:\"name\";s:17:\"System Recordings\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:32:\"Internal Options & Configuration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:8:\"3.3.8.10\";}s:11:\"callforward\";a:12:{s:7:\"rawname\";s:11:\"callforward\";s:4:\"name\";s:12:\"Call Forward\";s:7:\"version\";s:7:\"2.5.0.2\";s:9:\"changelog\";s:368:\"\n		*2.5.0.2* localization updates\n		*2.5.0.1* localization fixes\n		*2.5.0* localization fixes, Swedish\n		*2.4.0* bumped for 2.4\n		*1.1.2* #2321 fixed CF AMPUSER(number) issue, syntax problem\n		*1.1.1.2* changed categories\n		*1.1.1.1* bump for rc1\n		*1.1.1* changed ${CALLERID(number)} to ${AMPUSER} to accomodate CID number masquerading\n		*1.1* First release for 2.2\n	\";s:11:\"description\";s:33:\"Provides callforward featurecodes\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:8:\"location\";s:35:\"release/2.5/callforward-2.5.0.1.tgz\";s:6:\"md5sum\";s:32:\"9a538da1acbeb58ad558ef00fdce7e1f\";s:11:\"displayname\";s:12:\"Call Forward\";s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.2\";}s:11:\"callwaiting\";a:12:{s:7:\"rawname\";s:11:\"callwaiting\";s:4:\"name\";s:12:\"Call Waiting\";s:7:\"version\";s:7:\"2.5.0.1\";s:9:\"changelog\";s:311:\"\n	*2.5.0.1* localization updates\n	*2.5.0* localization string enclosures\n	*2.4.0* bumped for 2.4\n	*1.1.2.2* changed categories\n	*1.1.2.1* bump for rc1\n	*1.1.2* changed ${CALLERID(number)} to ${AMPUSER} to accomodate CID number masquerading\n	*1.1.1* Fixed typo Provdes to Provides*\n	*1.1* First release for 2.2\n	\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:11:\"description\";s:46:\"Provides an option to turn on/off call waiting\";s:8:\"location\";s:33:\"release/2.5/callwaiting-2.5.0.tgz\";s:6:\"md5sum\";s:32:\"88a20f5f1ae6300e024e1a03192e855d\";s:11:\"displayname\";s:12:\"Call Waiting\";s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.1\";}s:13:\"customappsreg\";a:15:{s:7:\"rawname\";s:13:\"customappsreg\";s:4:\"name\";s:19:\"Custom Applications\";s:7:\"version\";s:7:\"2.5.0.5\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:21:\"System Administration\";s:11:\"description\";s:147:\"Registry to add custom extensions and destinations that may be created and used so that the Extensions and Destinations Registry can include these.\";s:9:\"menuitems\";a:2:{s:12:\"customextens\";s:17:\"Custom Extensions\";s:11:\"customdests\";s:19:\"Custom Destinations\";}s:9:\"changelog\";s:518:\"\n		*2.5.0.5* localization updates, r7132 warning\n		*2.5.0.4* #3263, localization fixes\n		*2.5.0.3* localizations fixes\n		*2.5.0.2* localization, Swedish\n		*2.5.0.1* #3003 spelling\n		*2.5.0* #2845 tabindex\n		*2.4.0.5* #2843 Russian Translation\n		*2.4.0.4* #2700 block editing of destination field when once other modules are using it\n		*2.4.0.3* added depends on 2.4.0\n		*2.4.0.2* #2558 can\'t edit/del custom extension\n		*2.4.0.1* Fix typo in install script, non-existent primary key\n		*2.4.0* First release of module\n	\";s:7:\"depends\";a:1:{s:7:\"version\";s:5:\"2.4.0\";}s:8:\"location\";s:37:\"release/2.5/customappsreg-2.5.0.4.tgz\";s:6:\"md5sum\";s:32:\"c4791603420dd2a21bf8f3226c01b4fc\";s:11:\"displayname\";s:19:\"Custom Applications\";s:5:\"items\";a:2:{s:12:\"customextens\";a:4:{s:4:\"name\";s:17:\"Custom Extensions\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:21:\"System Administration\";s:4:\"sort\";i:0;}s:11:\"customdests\";a:4:{s:4:\"name\";s:19:\"Custom Destinations\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:21:\"System Administration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.5\";}s:4:\"disa\";a:15:{s:7:\"rawname\";s:4:\"disa\";s:4:\"name\";s:4:\"DISA\";s:7:\"version\";s:7:\"2.5.1.8\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:9:\"menuitems\";a:1:{s:4:\"disa\";s:4:\"DISA\";}s:11:\"description\";s:261:\"DISA Allows you \'Direct Inward System Access\'. This gives you the ability to have an option on an IVR that gives you a dial tone, and you\'re able to dial out from the FreePBX machine as if you were connected to a standard extension. It appears as a Destination.\";s:9:\"changelog\";s:1086:\"\n		*2.5.1.8* #3457, localiztion updates\n		*2.5.1.7* localization updates\n		*2.5.1.6* localizatoin string enclosures\n		*2.5.1.5* #3138 Sqlite3 fixes\n		*2.5.1.4* #3090 replace str_replace with addslashes to better protect all input in sql\n		*2.5.1.3* #3074 play busy and allow another call when trunk reports busy\n		*2.5.1.2* #2996, #3056 allow all numbers to be dialed and update tooltip\n		*2.5.1.1* #2955 check if pinset file exists to avoid warnings\n		*2.5.1* #2922, #2949 allow consecutive calls once DISA is entered\n		*2.5.0* #1784, #2845 tabindex, added delete and add icons\n		*2.4.0.3* #2859 DISA CID not being set on trunks with default trunk CID set\n		*2.4.0.2* #2843 Russian Translation\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* #2463 no password cid fix, extension/dest registry, it translation\n		*2.2.3* #2463 Set CID when no pin, added support for Destination Registry\n		*2.2.2.2* #2172 deprecated use of |, changed category\n		*2.2.2.1* bump for rc1\n		*2.2.2* bump so higher that 2.2 branch\n		*2.2*   First release for FreePBX 2.2 - Fixed compatibility issue with new UI\n	\";s:7:\"depends\";a:1:{s:7:\"version\";s:5:\"2.4.0\";}s:8:\"location\";s:28:\"release/2.5/disa-2.5.1.7.tgz\";s:6:\"md5sum\";s:32:\"2be52882fbaed90fcc53ce5b7fb7e735\";s:11:\"displayname\";s:4:\"DISA\";s:5:\"items\";a:1:{s:4:\"disa\";a:4:{s:4:\"name\";s:4:\"DISA\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:32:\"Internal Options & Configuration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.1.8\";}s:10:\"ringgroups\";a:15:{s:7:\"rawname\";s:10:\"ringgroups\";s:4:\"name\";s:11:\"Ring Groups\";s:7:\"version\";s:7:\"2.5.1.9\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:11:\"description\";s:317:\"Creates a group of extensions that all ring together. Extensions can be rung all at once, or in various \'hunt\' configurations. Additionally, external numbers are supported, and there is a call confirmation option where the callee has to confirm if they actually want to take the call before the caller is transferred.\";s:9:\"changelog\";s:805:\"\n		*2.5.1.9* #3664\n		*2.5.1.8* #3580, localization updates\n		*2.5.1.7* #3380, localization updates\n		*2.5.1.6* localization fixes\n		*2.5.1.5* #3222 sqlite3\n		*2.5.1.4* #3200 and localization fixes\n		*2.5.1.3* #3165 Sqlite3 fix\n		*2.5.1.2* #3000 spelling\n		*2.5.1.1* #2069 Minor bug in change for ids\n		*2.5.1* #2069 Migrate recordings to recording ids\n		*2.5.0.1* changed depends to 2.5\n		*2.5.0* #1795, #2845, #2391, #2853, #2925 add tabindexing, Skip Busy Agent and Ignore Call Forward options\n		*2.4.0.2* #2604, #2843 fix mal-formed html tags, Russian Translation, add oldstyle module hook\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* Extension/dest registry, extension quickpick, added hunt strategy with confirmation, it trans, formatting changes\n		*2.2.16.2* CHANGELOG TRUNCATED See SVN Repository\n	\";s:7:\"depends\";a:2:{s:7:\"version\";s:11:\"2.5.0alpha1\";s:6:\"module\";s:19:\"recordings ge 3.3.8\";}s:9:\"menuitems\";a:1:{s:10:\"ringgroups\";s:11:\"Ring Groups\";}s:8:\"location\";s:34:\"release/2.5/ringgroups-2.5.1.8.tgz\";s:6:\"md5sum\";s:32:\"6d3c0e2b48c3f5e807bac2fd9cac0f66\";s:11:\"displayname\";s:11:\"Ring Groups\";s:5:\"items\";a:1:{s:10:\"ringgroups\";a:4:{s:4:\"name\";s:11:\"Ring Groups\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.1.9\";}s:9:\"phonebook\";a:14:{s:7:\"rawname\";s:9:\"phonebook\";s:4:\"name\";s:9:\"Phonebook\";s:7:\"version\";s:7:\"2.5.0.3\";s:11:\"description\";s:92:\"Provides a phonebook for FreePBX, it can be used as base for Caller ID Lookup and Speed Dial\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:21:\"System Administration\";s:9:\"menuitems\";a:1:{s:9:\"phonebook\";s:18:\"Asterisk Phonebook\";}s:8:\"location\";s:33:\"release/2.5/phonebook-2.5.0.2.tgz\";s:6:\"md5sum\";s:32:\"7d870f78bcadee0677b4a3a4213127b7\";s:9:\"changelog\";s:223:\"\n		*2.5.0.3* localization updates\n		*2.5.0.2* localization changes, Swedish\n		*2.5.0.1* #3009 spelling\n		*2.5.0* #1821, #2845 tabindex\n		*2.4.0.1* #2843 Russian Translation\n		*2.4.0* CHANGELOG TRUNCATED See SVN Repository\n	\";s:11:\"displayname\";s:9:\"Phonebook\";s:5:\"items\";a:1:{s:9:\"phonebook\";a:5:{s:4:\"name\";s:18:\"Asterisk Phonebook\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:21:\"System Administration\";s:4:\"sort\";i:0;s:13:\"needsenginedb\";s:3:\"yes\";}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.3\";}s:9:\"blacklist\";a:14:{s:7:\"rawname\";s:9:\"blacklist\";s:4:\"name\";s:9:\"Blacklist\";s:7:\"version\";s:7:\"2.5.0.5\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:9:\"menuitems\";a:1:{s:9:\"blacklist\";s:9:\"Blacklist\";}s:9:\"changelog\";s:904:\"\n		*2.5.0.5* #3557 and localization updates\n		*2.5.0.4* localization updates\n		*2.5.0.3* #3345, translations\n		*2.5.0.2* Swedish Translations\n		*2.5.0.1* #3100, #3101 changes to work with new inbound route changes and fixes previous bug\n		*2.5.0* #2956 no need to try and splice from-zaptel macros anymore\n		*2.4.0.1* #2843 Russian Translation\n		*2.4.0* minor fixes, it translations, bumped for 2.4\n		*1.1.4* #2416 Enable Asterisk 1.6+ support\n		*1.1.3.6* #2455 allow + and other valid dial digits\n		*1.1.3.5* changed categories\n		*1.1.3.4* bump for rc1\n		*1.1.3.3* added xml attribute needsenginedb\n		*1.1.3.2* #2070 syntax fix from below\n		*1.1.3.1* #2070 fix proper use of script tags\n		*1.1.3* #2061 fixed to work with Asterisk 1.4 (wait for confirmation of 1)\n		*1.1.2* #1638 remove duplicate of zapateller instruction\n		*1.1.1* Add he_IL translation\n		*1.1* First 2.2 release. Fix minor warnings.\n	\";s:7:\"depends\";a:1:{s:6:\"module\";s:15:\"core ge 2.5.1.2\";}s:8:\"location\";s:33:\"release/2.5/blacklist-2.5.0.4.tgz\";s:6:\"md5sum\";s:32:\"b7d04334c9db36c2a2c2cc73dac99465\";s:11:\"displayname\";s:9:\"Blacklist\";s:5:\"items\";a:1:{s:9:\"blacklist\";a:5:{s:4:\"name\";s:9:\"Blacklist\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";i:0;s:13:\"needsenginedb\";s:3:\"yes\";}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.5\";}s:9:\"voicemail\";a:15:{s:7:\"rawname\";s:9:\"voicemail\";s:4:\"name\";s:9:\"Voicemail\";s:7:\"version\";s:7:\"2.5.1.6\";s:10:\"candisable\";s:2:\"no\";s:12:\"canuninstall\";s:2:\"no\";s:9:\"changelog\";s:992:\"\n		*2.5.1.6* localization updates\n		*2.5.1.5* #3399 and language updates\n		*2.5.1.4* localization string enclosures\n		*2.5.1.3* localization fixes\n		*2.5.1.2* #3191 unitialized var, localization\n		*2.5.1.1* #3152 uninitialized variable bug\n		*2.5.1* #3099 allows a return to IVR from voicemail option\n		*2.5.0.2* #3013, #2530 spelling, typo _GLOBALS should be GLOBALS and cleanup display when users/extension conflicts occur\n		*2.5.0.1* #2973 enable javascript to enable/disable voicemail and vmx fields when creating extension\n		*2.5.0* #2754, #2903, #2785, #2647, #2593 Added VmX config, added O extension config, better javascript interactions\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* #2457 vm dial code to vmexten in sip_general_additional.conf, make hooks abort if extension confilct, misc fixes\n		*2.0.3.4* Fix some labeling and make localization friendly\n		*2.0.3.3* #2232 call to VoiceMailMain() need ${AMPUSER} was fixed wrong\n		*2.0.3.2* CHANGELOG TRUNCATED See SVN Repository\n	\";s:11:\"description\";s:69:\"This module allows you to configure Voicemail for a user or extension\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:7:\"depends\";a:1:{s:7:\"version\";s:11:\"2.5.0alpha1\";}s:8:\"location\";s:33:\"release/2.5/voicemail-2.5.1.5.tgz\";s:6:\"md5sum\";s:32:\"17f8bf7825168f20ec7e6e7afbada978\";s:11:\"displayname\";s:9:\"Voicemail\";s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.1.6\";}s:14:\"timeconditions\";a:15:{s:7:\"rawname\";s:14:\"timeconditions\";s:4:\"name\";s:15:\"Time Conditions\";s:7:\"version\";s:7:\"2.5.0.9\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:11:\"description\";s:238:\"Creates a condition where calls will go to one of two destinations (eg, an extension, IVR, ring group..) based on the time and/or date. This can be used for example to ring a receptionist during the day, or go directly to an IVR at night.\";s:9:\"changelog\";s:1270:\"\n		*2.5.0.9* localization updates\n		*2.5.0.8* #3325 timecondition install script fails going from 2.4 to 2.5\n		*2.5.0.7* localization string enclosures\n		*2.5.0.6* #3222 salite3\n		*2.5.0.5* #3138 Sqlite3 fix, localization fixes\n		*2.5.0.4* #2987, #3012 sqlite3 install script, spelling\n		*2.5.0.3* update initial table creatino for new installs\n		*2.5.0.2* #2936 remove warning when not timegroups present\n		*2.5.0.1* tweaks to timegroups, added delete and add icons\n		*2.5.0* #774, #1695: Merged timegroups and timecondition changes from contributed_modules originally submitted by naftali5\n		*2.4.4.3* #2604, #2765, #2843 fix mal-formed html tags, Russian Translation\n		*2.4.4.2* generate all timeconditions when using database mode authorization and deptarments\n		*2.4.4.1* added depends on 2.4.0\n		*2.4.4* Extension/dest registry, it translation\n		*2.4.3.1* bump for rc1\n		*2.4.3* Added SQLite3 support, fixed ticket http://freepbx.org/trac/ticket/1774\n		*2.4.2* merge findmefollow/core extension destinations if any\n		*2.4.1* Add he_IL translation\n		*2.4* Upgrading module version to assist with trixbox upgrades, that have 2.3.1 already, so this needs to be higher. No other changes.	\n		*2.3* First release for FreePBX 2.2 - Fixed compatibility issue with new UI\n	\";s:7:\"depends\";a:1:{s:7:\"version\";s:11:\"2.5.0alpha1\";}s:9:\"menuitems\";a:2:{s:14:\"timeconditions\";s:15:\"Time Conditions\";s:10:\"timegroups\";s:11:\"Time Groups\";}s:8:\"location\";s:38:\"release/2.5/timeconditions-2.5.0.8.tgz\";s:6:\"md5sum\";s:32:\"12efc0fc153a6f6389cc45cf8658701b\";s:11:\"displayname\";s:15:\"Time Conditions\";s:5:\"items\";a:2:{s:14:\"timeconditions\";a:4:{s:4:\"name\";s:15:\"Time Conditions\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";i:0;}s:10:\"timegroups\";a:4:{s:4:\"name\";s:11:\"Time Groups\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.9\";}s:7:\"pinsets\";a:14:{s:7:\"rawname\";s:7:\"pinsets\";s:4:\"name\";s:8:\"PIN Sets\";s:7:\"version\";s:7:\"2.5.0.2\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:11:\"description\";s:103:\"Allow creation of lists of PINs (numbers for passwords) that can be used by other modules (eg, trunks).\";s:9:\"changelog\";s:606:\"\n		*2.5.0.2* localization updates\n		*2.5.0.1* #3240, #3258\n		*2.5.0* #2845, #2764 tabindex\n		*2.4.0.1* #2843 Russian Translation\n		*2.4.0* bump for 2.4\n		*1.2.3* #2393 add support for pinless dialing\n		*1.2.2.2* #2172 deprecated use of |\n		*1.2.2.1* bump for rc1\n		*1.2.2* Put None label in menu hook\n		*1.2.1* #1770 added proper uninstall\n		*1.2* Add SQLite3 support, fixes http://freepbx.org/trac/ticket/1778\n		*1.1* Add he_IL translation, add naftali5\'s fixes where pinsets were being lost when moved around.\n		*1.0.11* Stop potential error where a random pinset is appearing when creating a new trunk\n	\";s:9:\"menuitems\";a:1:{s:7:\"pinsets\";s:8:\"PIN Sets\";}s:8:\"location\";s:31:\"release/2.5/pinsets-2.5.0.1.tgz\";s:6:\"md5sum\";s:32:\"599da0b32fa4fc492c47bcdc396a1afc\";s:11:\"displayname\";s:8:\"PIN Sets\";s:5:\"items\";a:1:{s:7:\"pinsets\";a:4:{s:4:\"name\";s:8:\"PIN Sets\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:32:\"Internal Options & Configuration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.2\";}s:6:\"fw_fop\";a:14:{s:7:\"rawname\";s:6:\"fw_fop\";s:4:\"name\";s:13:\"FOP Framework\";s:7:\"version\";s:7:\"2.5.0.2\";s:10:\"candisable\";s:2:\"no\";s:12:\"canuninstall\";s:2:\"no\";s:9:\"changelog\";s:120:\"\n		*2.5.0.2* updated to the latest version of fop\n		*2.5.0.1* typo in install script\n		*2.5.0* First release of fw_fop\n	\";s:11:\"description\";s:202:\"This module provides a facility to install bug fixes to the FOP code that is not otherwise housed in a module, it used to be part of framework but has been removed to isolate FOP from Framework updates.\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:8:\"location\";s:28:\"release/2.5/fw_fop-2.5.0.tgz\";s:6:\"md5sum\";s:32:\"8e0813a411d46cd23f180b89ddc56b44\";s:11:\"displayname\";s:13:\"FOP Framework\";s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.2\";}s:10:\"dundicheck\";a:15:{s:7:\"rawname\";s:10:\"dundicheck\";s:4:\"name\";s:21:\"DUNDi Lookup Registry\";s:7:\"version\";s:7:\"2.5.0.1\";s:9:\"changelog\";s:65:\"\n		*2.5.0.1* localization updates\n		*2.5.0* #2918 First release\n	\";s:11:\"description\";s:334:\"This module will check all configured and enabled DUNDi trunks as part of the extension registry function, and report back conflicts if		other sites have the same extensions. This does not filter against the route patterns - it will take any number being created and		report a conflict if that turnk could be used to call that number.\";s:4:\"type\";s:4:\"tool\";s:9:\"menuitems\";a:1:{s:10:\"dundicheck\";s:12:\"DUNDi Lookup\";}s:7:\"depends\";a:1:{s:7:\"version\";s:5:\"2.4.0\";}s:8:\"category\";s:21:\"System Administration\";s:8:\"location\";s:32:\"release/2.5/dundicheck-2.5.0.tgz\";s:6:\"md5sum\";s:32:\"a84838a7ed6ce465db31ec55dc48a978\";s:11:\"displayname\";s:21:\"DUNDi Lookup Registry\";s:5:\"items\";a:1:{s:10:\"dundicheck\";a:4:{s:4:\"name\";s:12:\"DUNDi Lookup\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:21:\"System Administration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.1\";}s:7:\"support\";a:15:{s:7:\"rawname\";s:7:\"support\";s:4:\"name\";s:7:\"Support\";s:7:\"version\";s:5:\"1.0.0\";s:11:\"description\";s:77:\"Need support? Let professional trixbox CE engineers help solve your problems!\";s:9:\"changelog\";s:50:\"\n                *1.0.0* Initial release!\n        \";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:9:\"menuitems\";a:1:{s:7:\"support\";s:7:\"Support\";}s:7:\"depends\";a:1:{s:6:\"module\";s:4:\"core\";}s:8:\"location\";s:25:\"release/support-1.0.0.tgz\";s:6:\"md5sum\";s:32:\"aa0b9aee9e9b6eb9b8c3106b9c13eba2\";s:11:\"displayname\";s:7:\"Support\";s:5:\"items\";a:1:{s:7:\"support\";a:5:{s:4:\"name\";s:7:\"Support\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:4:\"sort\";i:0;s:13:\"needsenginedb\";s:3:\"yes\";}}s:6:\"status\";i:2;s:9:\"dbversion\";s:5:\"1.0.0\";}s:9:\"speeddial\";a:12:{s:7:\"rawname\";s:9:\"speeddial\";s:4:\"name\";s:20:\"Speed Dial Functions\";s:7:\"version\";s:7:\"2.5.0.1\";s:9:\"changelog\";s:354:\"\n		*2.5.0.1* localization updates\n		*2.5.0* #2887\n		*2.4.0* bump for 2.4\n		*1.0.4.2* #2329 add WaitExten after background\n		*1.0.4.1* bump for rc1\n		*1.0.4* #2049 remove use of speedial-clean, allow leading 0s\n		*1.0.3* changed ${CALLERID(number)} to ${AMPUSER} to accomodate CID number masquerading\n		*1.0.2* No comment\n		*1.0.1* First release for 2.2\n	\";s:4:\"type\";s:6:\"module\";s:8:\"category\";s:25:\"CID \n&\n Number Management\";s:7:\"depends\";a:1:{s:6:\"module\";s:9:\"phonebook\";}s:8:\"location\";s:31:\"release/2.5/speeddial-2.5.0.tgz\";s:6:\"md5sum\";s:32:\"107a8c403e3584da5a408a3c36ed48fa\";s:11:\"displayname\";s:20:\"Speed Dial Functions\";s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.1\";}s:12:\"infoservices\";a:14:{s:7:\"rawname\";s:12:\"infoservices\";s:4:\"name\";s:13:\"Info Services\";s:7:\"version\";s:7:\"2.5.0.2\";s:10:\"candisable\";s:2:\"no\";s:12:\"canuninstall\";s:2:\"no\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:11:\"description\";s:180:\"Provides a number of applications accessable by feature codes: company directory, call trace (last call information), echo test, speaking clock, and speak current extension number.\";s:9:\"changelog\";s:585:\"\n		*2.5.0.2* localization updates\n		*2.5.0.1* localization fixes\n		*2.5.0* localization, Swedish\n		*2.4.0.1* #2731 fix press 0 for operator in directory\n		*2.4.0* bumped for 2.4\n		*1.3.5.2* changed categories\n		*1.3.5.1* bump for rc1\n		*1.3.5* #2145 add waitexten while waiting for user input, and make uninstallable\n		*1.3.4* changed ${CALLERID(number)} to ${AMPUSER} to accomodate CID number masquerading\n		*1.3.3* Fixed SpeakExtension - replaced depricated ${CALLERID} variable\n		*1.3.2* Fixed SpeakExtension - add macro-user-callerid\n		*1.3.1* Improved accuracy of speaking clock\n	\";s:8:\"location\";s:36:\"release/2.5/infoservices-2.5.0.1.tgz\";s:6:\"md5sum\";s:32:\"0f2a73b3729e24cf0b983cce1b0feba9\";s:11:\"displayname\";s:13:\"Info Services\";s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.2\";}s:8:\"daynight\";a:15:{s:7:\"rawname\";s:8:\"daynight\";s:4:\"name\";s:14:\"Day Night Mode\";s:7:\"version\";s:8:\"2.5.0.12\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:11:\"description\";s:134:\"Day / Night control - allows for two destinations to be chosen and provides a feature code		that toggles between the two destinations.\";s:9:\"changelog\";s:1170:\"\n		*2.5.0.12* #3350\n		*2.5.0.11* localization updates\n		*2.5.0.10* #3318 set BLF in GUI\n		*2.5.0.9* localization string enclosures\n		*2.5.0.8* #3215\n		*2.5.0.7* #3214, #3222\n		*2.5.0.6* localization, Swedish\n		*2.5.0.5* #3138 Sqlite3 fixes\n		*2.5.0.4* #2998, #3004 fix link status to timecondition, spelling\n		*2.5.0.3* #2954 hint not getting written fixed\n		*2.5.0.2* #2903, #2882 more changes, depends on 2.5.0\n		*2.5.0.1* #2882: added hook to associated a timecondtion with a daynight mode condtion\n		*2.5.0* change to create feature code for each index, add func_devstate blf\n		*2.4.0.3* #2734 fixed issue creating index with no description made it disapear\n		*2.4.0.2* #2604, #2843 fix mal-formed html tags, Russian Translation\n		*2.4.0.1* #2591 added depends on 2.4.0\n		*2.4.0* extension/dest registry, it translation\n		*1.0.2.4* #2414 fix other unmatched ) syntax error\n		*1.0.2.3* #2414 fix unmatched ) syntax error\n		*1.0.2.2* bump for rc1\n		*1.0.2.1* added xml attribute needsenginedb, fixed some undefined vars\n		*1.0.2* Added red/green color coding of rnav to see current mode\n		*1.0.1* #2047 got day/night reversed\n		*1.0.0* First release for FreePBX 2.3 \n	\";s:7:\"depends\";a:1:{s:7:\"version\";s:11:\"2.5.0alpha1\";}s:9:\"menuitems\";a:1:{s:8:\"daynight\";s:17:\"Day/Night Control\";}s:8:\"location\";s:33:\"release/2.5/daynight-2.5.0.11.tgz\";s:6:\"md5sum\";s:32:\"37d445153e6f9b302f2cb2f8b026cf8d\";s:11:\"displayname\";s:14:\"Day Night Mode\";s:5:\"items\";a:1:{s:8:\"daynight\";a:5:{s:4:\"name\";s:17:\"Day/Night Control\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";i:0;s:13:\"needsenginedb\";s:3:\"yes\";}}s:6:\"status\";i:2;s:9:\"dbversion\";s:8:\"2.5.0.12\";}s:9:\"cidlookup\";a:15:{s:7:\"rawname\";s:9:\"cidlookup\";s:4:\"name\";s:16:\"Caller ID Lookup\";s:7:\"version\";s:7:\"2.5.0.7\";s:11:\"description\";s:105:\"Allows Caller ID Lookup of incoming calls against different sources (MySQL, HTTP, ENUM, Phonebook Module)\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:9:\"menuitems\";a:1:{s:9:\"cidlookup\";s:23:\"CallerID Lookup Sources\";}s:7:\"depends\";a:2:{s:6:\"engine\";s:12:\"asterisk 1.2\";s:6:\"module\";s:15:\"core ge 2.5.1.2\";}s:8:\"location\";s:33:\"release/2.5/cidlookup-2.5.0.7.tgz\";s:6:\"md5sum\";s:32:\"3d7c34464d1fcb602a714ff5fa0b437e\";s:9:\"changelog\";s:1145:\"\n		*2.5.0.7* backported from 2.6 the fix for Asterisk 1.6\n		*2.5.0.6* localization updates\n		*2.5.0.5* #3345\n		*2.5.0.4* #3260, other localization work\n		*2.5.0.3* localization fixes, Swedish\n		*2.5.0.2* #3100, #3101 changes to work with new inbound route changes and fixes previous bug\n		*2.5.0.1* #2987, #3001 sqlite3 install script and spelling fixes\n		*2.5.0* #2845 tabindex\n		*2.4.0.3* remove cidlookup field from core incoming table - should never have been there\n		*2.4.0.2* #2843 Russian Translation\n		*2.4.0.1* #2541 migrate from channel routing and re-enable functionality\n		*2.4.0* it translations, bump for 2.4\n		*1.2.1.3* #2172 deprecated use of |, changed categories\n		*1.2.1.2* bump for rc1\n		*1.2.1.1* shorten menu name\n		*1.2.1* changed freePBX to FreePBX\n		*1.2.0* Added SQLite3 support, fixes ticket:1796 (FreePBX 2.3 only)\n		*1.1.1* Add he_IL translation\n		*1.1* First release for FreePBX 2.2 - Fixed compatibility issue with new UI\n		*1.0.4* Updated module.xml format\n		*1.0.3* Fixes from #999\n		*1.0.1* Added possibility to cache in astDB\n			Added lookup from cache before querying external source\n		*1.0.0* First release\n	\";s:11:\"displayname\";s:16:\"Caller ID Lookup\";s:5:\"items\";a:1:{s:9:\"cidlookup\";a:4:{s:4:\"name\";s:23:\"CallerID Lookup Sources\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.7\";}s:6:\"queues\";a:15:{s:7:\"rawname\";s:6:\"queues\";s:4:\"name\";s:6:\"Queues\";s:7:\"version\";s:7:\"2.5.4.8\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:11:\"description\";s:198:\"Creates a queue where calls are placed on hold and answered on a first-in, first-out basis. Many options are available, including ring strategy for agents, caller announcements, max wait times, etc.\";s:9:\"changelog\";s:1934:\"\n		*2.5.4.8* #3664\n		*2.5.4.7* #3618, localization udpates\n		*2.5.4.6* localization updates\n		*2.5.4.5* #3400, #3380, various translations\n		*2.5.4.4* #3242, #3230, localization fixes\n		*2.5.4.3* #3222 sqlite3\n		*2.5.4.2* #3200 and localization string fixes\n		*2.5.4.1* #3171 and localize queues_timeString()\n		*2.5.4* #3138, #3147 add the Queues App n option as Retry alternative, see tooltip\n		*2.5.3* #3098 WARNING: subtle queue behavior might change: set persistenetmembers=yes so dynamic agents are retained on asterisk restarting, and added option for autofill\n		*2.5.2.4* #3069 add queue weight option to queues\n		*2.5.2.3* #3083, setting ringinuse causes transfered call to keep agent as unavailable, removing since it is not needed for FreePBX standard agents\n		*2.5.2.2* #2987, #3010 sqlite3 install script, spelling\n		*2.5.2.1* #2970 periodic-announce message not being configured (re #2068 change)\n		*2.5.2* #2073 add a Queue hold time CID prepend to report how long the caller has been holding\n		*2.5.1* #2068 recordings_id, don\'t list IVRs with compound messages\n		*2.5.0.1* #2875, #2768\n		*2.5.0.0* #2976 Add Optional Regex to filter user agent numbers that they can input\n		*2.4.0.8* #2757 allow spaces and other alphanumeric characters in description\n		*2.4.0.7* #2604, #2707, #2843 fix mal-formed html tags, typo, Russian Translation, add oldstyle module hook\n		*2.4.0.6* added depends on 2.4.0\n		*2.4.0.5* #2637, monitor-join=yes not supported in asterisk 1.6\n		*2.4.0.4* #2636 Queues Options member status allways show No\n		*2.4.0.3* #2579 added strict to joinempty and leavewhenempy, #2627 ringing box ignored\n		*2.4.0.2* #2528 add context = \'ext-queues\' when getting destination statement\n		*2.4.0.1* added out() and outn() to install script\n		*2.4.0* Migration from legacy tables, added queues_conf class, Extension/dest registry, #2282, #2487, it translations\n		*2.4.0* CHANGELOG TRUNCATED See SVN Repository\n	\";s:7:\"depends\";a:2:{s:7:\"version\";s:11:\"2.5.0alpha1\";s:6:\"module\";s:19:\"recordings ge 3.3.8\";}s:9:\"menuitems\";a:1:{s:6:\"queues\";s:6:\"Queues\";}s:8:\"location\";s:30:\"release/2.5/queues-2.5.4.7.tgz\";s:6:\"md5sum\";s:32:\"01114fc7f68157c8f15edba532907bd7\";s:11:\"displayname\";s:6:\"Queues\";s:5:\"items\";a:1:{s:6:\"queues\";a:4:{s:4:\"name\";s:6:\"Queues\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.4.8\";}s:11:\"conferences\";a:15:{s:7:\"rawname\";s:11:\"conferences\";s:4:\"name\";s:11:\"Conferences\";s:7:\"version\";s:7:\"2.5.1.7\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:11:\"description\";s:85:\"Allow creation of conference rooms (meet-me) where multiple people can talk together.\";s:9:\"changelog\";s:1228:\"\n		*2.5.1.7* localization updates\n		*2.5.1.6* #3392 and some localizations\n		*2.5.1.5* localization strings enclosed\n		*2.5.1.4* #3237\n		*2.5.1.3* #3192 set dir for recordings, localization cleanup and Swedish\n		*2.5.1.2* #3135 variable initialization\n		*2.5.1.1* #3087 add hook to module code\n		*2.5.1* #2064 Migrate recordings to recording ids\n		*2.5.0* #2845, added blf hints, added delete and add icons\n		*2.4.0.2* #2604, #2843 fix mal-formed html tags, Russian Translation\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* #2158 add recording option, add support for Extension and Destination Registries, it translations\n		*1.2.2* don\'t ask for name confirmation when recording names on Asterisk 1.3 (new option I replaces i)\n		*1.2.1.3* move Macro(user-callerid) to be called with each conf to accomodate future language settings\n		*1.2.1.2* add call to Macro(user-callerid) to get proper CID in Meetme Conference\n		*1.2.1.1* bump for rc1\n		*1.2.1* changed syntax error in meetme_additional.conf form \'|\' to \',\' separator\n		*1.2* Fixed raising asterisk error on empty dialstatus #1708\n		*1.1.2* Add he_IL translation\n		*1.1.1* Updated for 2.2.0RC1\n		*1.1* First release for FreePBX 2.2 - Fixed compatibility issue with new UI\n	\";s:7:\"depends\";a:2:{s:7:\"version\";s:11:\"2.5.0alpha1\";s:6:\"module\";s:19:\"recordings ge 3.3.8\";}s:9:\"menuitems\";a:1:{s:11:\"conferences\";s:11:\"Conferences\";}s:8:\"location\";s:35:\"release/2.5/conferences-2.5.1.6.tgz\";s:6:\"md5sum\";s:32:\"2f3fc653f48441a162c3c79220ba0daa\";s:11:\"displayname\";s:11:\"Conferences\";s:5:\"items\";a:1:{s:11:\"conferences\";a:4:{s:4:\"name\";s:11:\"Conferences\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:32:\"Internal Options & Configuration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.1.7\";}s:9:\"languages\";a:15:{s:7:\"rawname\";s:9:\"languages\";s:4:\"name\";s:9:\"Languages\";s:7:\"version\";s:7:\"2.5.0.8\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:11:\"description\";s:96:\"Adds the ability to changes the language within a call flow and add language attribute to users.\";s:9:\"menuitems\";a:1:{s:9:\"languages\";s:9:\"Languages\";}s:9:\"changelog\";s:598:\"\n		*2.5.0.8* localization updates, r7132 warning\n		*2.5.0.7* localization string enclosures\n		*2.5.0.6* localization, Swedish\n		*2.5.0.5* #3174 fix validation code\n		*2.5.0.4* #3110, #3138\n		*2.5.0.3* #2530 typo _GLOBALS should be GLOBALS\n		*2.5.0.2* fix depends to 2.5.0alpha1\n		*2.5.0.1* r6123 inject macro-user-callerid with required language setting (was hardcoded)\n		*2.5.0* #2845 tabindex\n		*2.4.0.3* #2843 Russian Translation, removal of un-needed code\n		*2.4.0.2* added depends on 2.4.0\n		*2.4.0.1* #2578 use setlanguage to handle changes in Asterisk 1.6\n		*2.4.0* First release of module\n	\";s:7:\"depends\";a:1:{s:7:\"version\";s:11:\"2.5.0alpha1\";}s:8:\"location\";s:33:\"release/2.5/languages-2.5.0.7.tgz\";s:6:\"md5sum\";s:32:\"2932236132327aca4993f55a690378ba\";s:11:\"displayname\";s:9:\"Languages\";s:5:\"items\";a:1:{s:9:\"languages\";a:4:{s:4:\"name\";s:9:\"Languages\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:32:\"Internal Options & Configuration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.8\";}s:5:\"music\";a:16:{s:7:\"rawname\";s:5:\"music\";s:4:\"name\";s:13:\"Music on Hold\";s:7:\"version\";s:7:\"2.5.1.3\";s:10:\"candisable\";s:2:\"no\";s:12:\"canuninstall\";s:2:\"no\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:11:\"description\";s:80:\"Uploading and management of sound files (wav, mp3) to be used for on-hold music.\";s:9:\"changelog\";s:1254:\"\n		*2.5.1.3* #3380, #3443, localization updates\n		*2.5.1.2* #3346\n		*2.5.1.1* #3297, localization changes\n		*2.5.1* #3156 add option to put Streaming Sources as well as downloaded files as music category\n		*2.5.0.1* #3007 spelling\n		*2.5.0* #2773, #2845, #2928, added delete and add icons\n		*2.4.0.2* #2843 Russian Translation\n		*2.4.0.1* #2591 localization fixes\n		*2.4.0* it translations, bump for 2.4\n		*1.5.2* #1923 Add option to no encode wav to mp3 (but recode it to 8K samples)\n		*1.5.1.5* #2193 moh path hardcoded\n		*1.5.1.4* bump for rc1\n		*1.5.1.3* #1969 fix javascript validation, add canunninstall:no\n		*1.5.1.2* #2070 fix proper use of script tags\n		*1.5.1.1* added candisable = no for module admin\n		*1.5.1* Added a \'none\' category that results in silence played\n		*1.5* Fixed upload bug, #1646 could not upload files\n		*1.4.2* List wav files\n		*1.4.1* Add redirect_standard() call to avoid #1616\n		*1.4* Fix an issue of a new install not having a working MOH until they visit the page.\n		*1.3.2* Add he_IL translation\n		*1.3.1* Changed name to Music on Hold (from On Hold Music) \n		*1.3* Bumped version to assist upgraders from the 2.1 tree. No other changes.\n		*1.2* First release for FreePBX 2.2 - Fixed compatibility issue with new UI\n	\";s:9:\"menuitems\";a:1:{s:5:\"music\";s:13:\"Music on Hold\";}s:8:\"location\";s:29:\"release/2.5/music-2.5.1.2.tgz\";s:6:\"md5sum\";s:32:\"9962bfc541e8cd5dd35c79173449933e\";s:11:\"displayname\";s:13:\"Music on Hold\";s:5:\"items\";a:1:{s:5:\"music\";a:4:{s:4:\"name\";s:13:\"Music on Hold\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:32:\"Internal Options & Configuration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.1.3\";}s:6:\"fw_ari\";a:14:{s:7:\"rawname\";s:6:\"fw_ari\";s:4:\"name\";s:13:\"ARI Framework\";s:7:\"version\";s:5:\"5.5.2\";s:10:\"candisable\";s:2:\"no\";s:12:\"canuninstall\";s:2:\"no\";s:9:\"changelog\";s:511:\"\n		*2.5.2.rc1* #3042 remove player popup, embed in page and add call screening settings to phone features\n		*2.5.1.1* #3202, #3203\n		*2.5.1* #3184 SECURITY VULNERABILITY fix\n		*2.5.0.3* #3165, #3077, #2609 and additional fixes related to #3161\n		*2.5.0.2* r6505, #3161 SQL Injection vulnerability that could allow and authenticated user to access all CDRs and recordings\n		*2.5.0.1* remove inclusion of libfreepbx.install.php in install script resulting in warnings\n		*2.5.0* #3104 and First release of fw_ari\n	\";s:11:\"description\";s:202:\"This module provides a facility to install bug fixes to the ARI code that is not otherwise housed in a module, it used to be part of framework but has been removed to isolate ARI from Framework updates.\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:8:\"location\";s:27:\"release/2.5/fw_ari-5.5.2tgz\";s:6:\"md5sum\";s:32:\"beeaec94adc98ca9381281807e115521\";s:11:\"displayname\";s:13:\"ARI Framework\";s:6:\"status\";i:2;s:9:\"dbversion\";s:5:\"5.5.2\";}s:3:\"ivr\";a:15:{s:7:\"rawname\";s:3:\"ivr\";s:4:\"name\";s:3:\"IVR\";s:7:\"version\";s:8:\"2.5.20.8\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:11:\"description\";s:221:\"Creates Digital Receptionist (aka Auto-Attendant, aka Interactive Voice Response) menus. These can be used to send callers to different locations (eg, \"Press 1 for sales\") and/or allow direct-dialing of extension numbers.\";s:9:\"changelog\";s:1180:\"\n		*2.5.20.8* #4013\n		*2.5.20.7* #3732\n		*2.5.20.6* #3384, localization updates\n		*2.5.20.5* localization string enclosures\n		*2.5.20.4* #3245, localization fixes\n		*2.5.20.3* localization, Swedish\n		*2.5.20.2* #3188 clear MSG var if no message\n		*2.5.20.1* Sqlite3 fixes, move ivr_init() to install script\n		*2.5.20* #3099 allows a return to IVR from voicemail option and from busy phone\n		*2.5.19.2* #2987, #3005 sqlite3 install script, spelling\n		*2.5.19.1* #2965 not working on IE fixed\n		*2.5.19* #2865 Add alternative messages to play if t or i are hit, replacing the first announcmement\n		*2.5.18.1* #2948 don\'t allow deletion if used by a Queue and show list\n		*2.5.18* #2066 Migrate recordings to recording ids\n		*2.5.17.1* #2845 tabindex\n		*2.5.17* #2858 Better handing of i and t options, added loop count and ability to loop before going to user defined i, t options\n		*2.5.16.3* #2604, #2843 fix mal-formed html tags, Russian Translation\n		*2.5.16.2* #2687 breakout from Queue to Company Directory blocks voicemail\n		*2.5.16.1* #2591, added depends on 2.4.0\n		*2.5.16* Extension/dest registry, #2303, it translation\n		*2.5.15* CHANGELOG TRUNCATED See SVN Repository\n	\";s:7:\"depends\";a:2:{s:7:\"version\";s:11:\"2.5.0alpha1\";s:6:\"module\";s:19:\"recordings ge 3.3.8\";}s:9:\"menuitems\";a:1:{s:3:\"ivr\";s:3:\"IVR\";}s:8:\"location\";s:28:\"release/2.5/ivr-2.5.20.7.tgz\";s:6:\"md5sum\";s:32:\"2414d6a29dd4a82baf223dbf522b2038\";s:11:\"displayname\";s:3:\"IVR\";s:5:\"items\";a:1:{s:3:\"ivr\";a:4:{s:4:\"name\";s:3:\"IVR\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:8:\"2.5.20.8\";}s:16:\"featurecodeadmin\";a:16:{s:7:\"rawname\";s:16:\"featurecodeadmin\";s:4:\"name\";s:18:\"Feature Code Admin\";s:7:\"version\";s:7:\"2.5.0.4\";s:10:\"candisable\";s:2:\"no\";s:12:\"canuninstall\";s:2:\"no\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:9:\"menuitems\";a:1:{s:16:\"featurecodeadmin\";s:13:\"Feature Codes\";}s:8:\"location\";s:40:\"release/2.5/featurecodeadmin-2.5.0.3.tgz\";s:9:\"changelog\";s:782:\"\n		*2.5.0.4* localization updates\n		*2.5.0.3* fix for proper core localization\n		*2.5.0.2* #3173 don\'t report conflicting extensions with featurmap codes\n		*2.5.0.1* #2461 Localization now works using i18n from hosting featurecode modules\n		*2.5.0* #2845 tabindex, added ability to define default values in freepbx_featurecodes.conf\n		*2.4.0.2* #2843 Russian Translation\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* Extension/dest registry, it translation\n	  *1.0.5.3* changed categories\n	  *1.0.5.2* added canuninstall = no for module admin, bump for rc1\n	  *1.0.5.1* added candisable = no for module admin\n		*1.0.5* Fix install bug with featurecode release\n		*1.0.4* Add support for duplicate feature codes\n		*1.0.3* Add he_IL translation\n		*1.0.2* Fix minor font/display issues\n	\";s:7:\"depends\";a:1:{s:7:\"version\";s:11:\"2.5.0alpha1\";}s:6:\"md5sum\";s:32:\"8a12f2675f0d1f39cb99d731a07c43a5\";s:11:\"displayname\";s:18:\"Feature Code Admin\";s:5:\"items\";a:1:{s:16:\"featurecodeadmin\";a:4:{s:4:\"name\";s:13:\"Feature Codes\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.4\";}s:7:\"vmblast\";a:15:{s:7:\"rawname\";s:7:\"vmblast\";s:4:\"name\";s:18:\"VoiceMail Blasting\";s:7:\"version\";s:7:\"2.5.0.5\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:11:\"description\";s:123:\"Creates a group of extensions that Calls a group of voicemail boxes and allows you to leave a message for them all at once.\";s:9:\"changelog\";s:1274:\"\n		*2.5.0.5* localization updates\n		*2.5.0.4* #3380\n		*2.5.0.3* localization string enclosures\n		*2.5.0.2* #3138, #3165 Sqlite3 fixes\n		*2.5.0.1* #2530 typo _GLOBALS should be GLOBALS\n		*2.5.0* #2845 tabindex\n		*2.4.3.3* add oldstyle module hook\n		*2.4.3.2* added depends on 2.4.0\n		*2.4.3.1* #2632 red bar addressed now also\n		*2.4.3* #2632 audio_lable, password, default_group not saved on initial config, and fix odd refresh behavior after add\n		*2.4.2* #2630 fixed errors requiring register_globals=on to be set in php.ini\n		*2.4.1* add beep only, no confirmation option to vmblast audio label\n		*2.4.0* first official version imported into 2.4 branch\n		*1.2.0* change to use proper multi-select list, fix bug in js validation of empty list, add default vmblast group\n		*1.1.2* add vmblast_group table and migrate from old grplist field\n		*1.1.1* fixed a couple SQL bugs, improved dialplan so you can skip annoucement and messages immeditiately (except if saydigits used)\n		*1.1.0* add audio label, password protect, fix bug for javascript validation to work, add extension/dest registry support\n		*1.0.2* increase grouplist field to varchar(255) to increase the vmblast list\n		*1.0.l* fix: context, redisplay of groups, get proper vm contexts, beep before leaving msg\n	\";s:9:\"menuitems\";a:1:{s:7:\"vmblast\";s:18:\"VoiceMail Blasting\";}s:7:\"depends\";a:1:{s:7:\"version\";s:5:\"2.4.0\";}s:8:\"location\";s:31:\"release/2.5/vmblast-2.5.0.4.tgz\";s:6:\"md5sum\";s:32:\"117b89c675da4835fd9d813548461365\";s:11:\"displayname\";s:18:\"VoiceMail Blasting\";s:5:\"items\";a:1:{s:7:\"vmblast\";a:4:{s:4:\"name\";s:18:\"VoiceMail Blasting\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:32:\"Internal Options & Configuration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.5\";}s:9:\"dashboard\";a:17:{s:7:\"rawname\";s:9:\"dashboard\";s:4:\"name\";s:16:\"System Dashboard\";s:7:\"version\";s:7:\"2.5.0.7\";s:10:\"candisable\";s:2:\"no\";s:12:\"canuninstall\";s:2:\"no\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:5:\"Basic\";s:11:\"description\";s:117:\"Provides a system information dashboard, showing information about Calls, CPU, Memory, Disks, Network, and processes.\";s:9:\"menuitems\";a:2:{s:10:\"dashboard1\";s:13:\"System Status\";s:10:\"dashboard2\";s:13:\"System Status\";}s:7:\"depends\";a:1:{s:7:\"version\";s:10:\"2.3.0beta2\";}s:9:\"changelog\";s:1839:\"\n		*2.5.0.7* #3652, localization updates\n		*2.5.0.6* #3409, localization fixes, updates\n		*2.5.0.5* #3404 correction\n		*2.5.0.4* #3401, #3404\n		*2.5.0.3* #3348, localizations\n		*2.5.0.2* localization string enclosures\n		*2.5.0.1* #3170, Swedish Translation\n		*2.5.0* #3134 add amportal DASHBOARD_STATS_UPDATE_TIME, DASHBOARD_INFO_UPDATE_TIME\n		*2.4.0.3* #2871 do not show Sangoma wanpipe interfaces in the Network Stats\n		*2.4.0.2* #2701, #2843 add proper JSON header to fix some proxy servers, Russian Translation\n		*2.4.0.1* #2620 adjust to new format of core_trunks_list(true)\n		*2.4.0* #2415 1.6 support, #2301, it translation\n		*0.3.3.3* #2365 don\'t make readonly disk devices red when 100%\n		*0.3.3.2* #2469 fix division my zero in cpu usage\n		*0.3.3.1* Cosmetic fix (#2278 - long mount point paths)\n		*0.3.3* Improved detection of webserver failing, More MySQL detection fixes\n		*0.3.2.1* #2246 make FreePBX Connections visible, #2250 check for SSHPORT\n		*0.3.2* Allow mysql server to be on another host/port (#2229), fix image path problem\n		*0.3.1* Fix issue with miscounting total registrations, minor styling details\n		*0.3* Show IP phones and trunks separately (#2209)\n		*0.2.5.4* make always accessible even in database mode, fix minor javascript bug\n		*0.2.5.3* remove deprecated javascript call\n		*0.2.5.2* #2194 don\'t fail when Asterisk is not running\n		*0.2.5.1* disable debug logging, make uninstallable\n		*0.2.5* #2142 fix online phones for Asterisk 1.4 format, #2140 divide by 0 again\n		*0.2.4* #2133 again, #2140 divide by 0, #2141 with temp log to determine real issue\n		*0.2.3* #2133 fixed number format error resulting in bogus percentage displays\n		*0.2.2* #2131 fix Undefined Index warnings\n		*0.2.1* make module permanent, should not be able to disable\n		*0.2.0* Add real-time updates\n		*0.1.0* Initial release\n	\";s:8:\"location\";s:33:\"release/2.5/dashboard-2.5.0.6.tgz\";s:6:\"md5sum\";s:32:\"11e300330a128faae0d2a138684de7ab\";s:11:\"displayname\";s:16:\"System Dashboard\";s:5:\"items\";a:2:{s:10:\"dashboard1\";a:6:{s:4:\"name\";s:13:\"System Status\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:5:\"Admin\";s:4:\"sort\";s:3:\"-10\";s:7:\"display\";s:5:\"index\";s:6:\"access\";s:3:\"all\";}s:10:\"dashboard2\";a:6:{s:4:\"name\";s:13:\"System Status\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Admin\";s:4:\"sort\";s:3:\"-10\";s:7:\"display\";s:5:\"index\";s:6:\"access\";s:3:\"all\";}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.7\";}s:12:\"donotdisturb\";a:12:{s:7:\"rawname\";s:12:\"donotdisturb\";s:4:\"name\";s:20:\"Do-Not-Disturb (DND)\";s:7:\"version\";s:7:\"2.5.0.6\";s:9:\"changelog\";s:472:\"\n		*2.5.0.6* localization updates\n		*2.5.0.5* #3274\n		*2.5.0.4* #3215, localization fixes\n		*2.5.0.3* localization, xml description, Swedish\n		*2.5.0.2* #2969 change default value to *76\n		*2.5.0.1* #2909 Add DND hints\n		*2.5.0* added toggle and support for func_devstate\n		*2.4.0* bunp for 2.4\n		*1.0.2.2* changed category\n		*1.0.2.1* bump for rc1\n		*1.0.2* changed ${CALLERID(number)} to ${AMPUSER} to accomodate CID number masquerading\n		*1.0.1* First release for 2.2\n	\";s:11:\"description\";s:34:\"Provides donotdisturb featurecodes\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:8:\"location\";s:36:\"release/2.5/donotdisturb-2.5.0.5.tgz\";s:6:\"md5sum\";s:32:\"db24bae455ee51f3e8a5f0f7733defe7\";s:11:\"displayname\";s:20:\"Do-Not-Disturb (DND)\";s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.6\";}s:4:\"core\";a:17:{s:7:\"rawname\";s:4:\"core\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:4:\"name\";s:4:\"Core\";s:7:\"version\";s:7:\"5.5.2.4\";s:10:\"candisable\";s:2:\"no\";s:12:\"canuninstall\";s:2:\"no\";s:9:\"changelog\";s:3130:\"\n		*2.5.2.4* #4058, #4075\n		*2.5.2.3* fixed missing global\n		*2.5.2.2* fixed for potential XSS and SQL Injection vulnerabilties\n		*2.5.2.1* #3880\n		*2.5.2.0* #3696 (requires framework updated first), #3706, #3712, #3739, #3741, #3744, #3790, #3478, #3423, #3691, #3693, #3705, #3792\n		*2.5.1.7* #3517, #3653, #3591\n		*2.5.1.6* #3439, #3526, #3534, moved macro-vm to auto-generation (WARNING: custom modification of macro-vm in extensions_custom.conf need to be moved to extensions_override_freepbx.conf\n		*2.5.1.5* #3474\n		*2.5.1.4* #3380, #3451, #932, #3358, #3426\n		*2.5.1.3* #3380, #3358, #3387, localizations\n		*2.5.1.2* #3345 inbound CID routing fix, adds vm-callme voicemail access option\n		*2.5.1.1* #3311, revert #3266 (r7001)\n		*2.5.1.0* #3304, #3276, #3299\n		*2.5.0.4* #3299\n		*2.5.0.3* #3266, #3267, #3281, #3042 (vm-callme context), localiztion fixes\n		*2.5.0.2* #3219, #3241, #3240, #3251, #3215, localization fixes\n		*2.5.0.1* minor bug not showing extensions\n		*2.5.0.0* #3211, and final release\n		*2.5.0rc3.3* #3193, #3200, localization fixes, Swedish\n		*2.5.0rc3.2* #3124, #3180\n		*2.5.0rc3.1* #3173, #3077 auto-blkvm,  auto-confirm to auto generation,  visual feedback to DAHDI compatibility\n		*2.5.0rc3.0* #3150, #3152, #3142, #3167, #3077 (DAHDI Support)\n		*2.5.0rc2.5* #3129, #3144, #3146 and some streamling of dialout-trunk and outbound-callerid\n		*2.5.0rc2.4* #3128, #3140 sqlite3 fix and fixed typo introduced in dialparties.agi\n		*2.5.0rc2.3* #3130, #2750, #3128, #3131 (requires r6519) added master recording disable (can be performance booster)\n		*2.5.0rc2.2* lots of changed to be updated\n		*2.5.0rc2.1* #3115, #3116 remove warning and add t option to nv_faxdetect\n		*2.5.0rc2.0* #3091, #3099, #3100 Added return from voicemail/busy to IVR support, added CID Priority Route Inbound Route option\n		*2.5.0rc1.1* #3060, #3072, #3078 mixmonitor recording dir typo, move disallow=all to top of all sip, iax sections, file call screening nomemory\n		*2.5.0rc1.0* #3053 allow routing in CIDs like Private, Blocked, Restricted, etc. and bump to rc1\n		*2.5.0beta1.4* #3046, #3019, #3047, #3040\n		*2.5.0beta1.3* #2530 typo _GLOBALS should be GLOBALS, clean up conflicts when creating users/extensions\n		*2.5.0beta1.2* #2913 Add pre-answer delay option to incoming routes, rearrange the order of options on incoming screen\n		*2.5.0beta1.1* #2991, #2999, #2993, #3020, #3002, #3041, #2996, #3029, #3031\n		*2.5.0beta1.0* #2976, #2778, #2413, #2974, #2962, #2894, #2073\n		*2.5.0alpha1.1* #2930, #2938, #2922, #2939, #1568, #2949, #2779, #2953, #1911, #2807\n		*2.5.0alpha1.0* #2853, #2925, #2391, #2785, #2923, #2671, #2585, #2908, #2909, #2510, #2976, #2845, #1715, #2760, #2926, #2927, #2838, also added misc icons, links between users/devices\n		*2.4.0.4* #2857, #2848, #2791, #2449\n		*2.4.0.3* #2851 forwarded/followme/ringgroup calls originating from outside fail\n		*2.4.0.2* #2702, #2759, #2763, #2801, #2747, #2828, #2604, #2841, #2835 - review svn log or tickets for details\n		*2.4.0.1* #2693 fix DID editing creating new DID route introduced from #2664 fix\n		*2.4.0.0* CHANGELOG TRUNCATED See SVN Repository\n	\";s:7:\"depends\";a:1:{s:7:\"version\";s:8:\"2.5.0rc3\";}s:12:\"requirements\";a:1:{s:4:\"file\";s:18:\"/usr/sbin/asterisk\";}s:9:\"menuitems\";a:10:{s:10:\"extensions\";s:10:\"Extensions\";s:5:\"users\";s:5:\"Users\";s:7:\"devices\";s:7:\"Devices\";s:3:\"did\";s:14:\"Inbound Routes\";s:11:\"zapchandids\";s:16:\"Zap Channel DIDs\";s:7:\"routing\";s:15:\"Outbound Routes\";s:6:\"trunks\";s:6:\"Trunks\";s:7:\"general\";s:16:\"General Settings\";s:8:\"ampusers\";s:14:\"Administrators\";s:4:\"wiki\";s:7:\"Support\";}s:8:\"location\";s:28:\"release/2.5/core-2.5.2.3.tgz\";s:6:\"md5sum\";s:32:\"f2a2959ac1946a65cee374e097253704\";s:11:\"displayname\";s:4:\"Core\";s:5:\"items\";a:10:{s:10:\"extensions\";a:5:{s:4:\"name\";s:10:\"Extensions\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:4:\"sort\";s:2:\"-4\";s:13:\"needsenginedb\";s:3:\"yes\";}s:5:\"users\";a:5:{s:4:\"name\";s:5:\"Users\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:4:\"sort\";s:2:\"-3\";s:13:\"needsenginedb\";s:3:\"yes\";}s:7:\"devices\";a:5:{s:4:\"name\";s:7:\"Devices\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:4:\"sort\";s:2:\"-4\";s:13:\"needsenginedb\";s:3:\"yes\";}s:3:\"did\";a:4:{s:4:\"name\";s:14:\"Inbound Routes\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";s:2:\"-5\";}s:11:\"zapchandids\";a:4:{s:4:\"name\";s:16:\"Zap Channel DIDs\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";s:2:\"-5\";}s:7:\"routing\";a:4:{s:4:\"name\";s:15:\"Outbound Routes\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:4:\"sort\";i:0;}s:6:\"trunks\";a:4:{s:4:\"name\";s:6:\"Trunks\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:4:\"sort\";i:0;}s:7:\"general\";a:4:{s:4:\"name\";s:16:\"General Settings\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:4:\"sort\";i:0;}s:8:\"ampusers\";a:4:{s:4:\"name\";s:14:\"Administrators\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:4:\"sort\";s:1:\"5\";}s:4:\"wiki\";a:7:{s:4:\"name\";s:7:\"Support\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:7:\"Support\";s:4:\"sort\";s:1:\"5\";s:4:\"href\";s:26:\"http://trixbox.org/support\";s:6:\"target\";s:6:\"_blank\";s:6:\"access\";s:3:\"all\";}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"5.5.2.4\";}s:11:\"pbdirectory\";a:14:{s:7:\"rawname\";s:11:\"pbdirectory\";s:4:\"name\";s:19:\"Phonebook Directory\";s:7:\"version\";s:7:\"2.5.0.1\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:25:\"CID \n&\n Number Management\";s:8:\"location\";s:33:\"release/2.5/pbdirectory-2.5.0.tgz\";s:11:\"description\";s:55:\"Provides a dial-by-name directory for phonebook entries\";s:9:\"changelog\";s:441:\"\n		*2.5.0.1* localization updates\n		*2.5.0* localization string enclosures\n		*2.4.0.2* removed 2.4.0 requirement possible causing broken module issue\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* Destination registry, added missing macro-user-callerid call\n		*0.3.1.2* #2343 pbdirectory script errors\n		*0.3.1.1* bump for rc1\n		*0.3.1* fixed some hard coded paths, requires core modules:  2.3.0beta1.6 or above\n		*0.3* First changelog entry\n	\";s:7:\"depends\";a:1:{s:7:\"version\";s:5:\"2.4.0\";}s:12:\"requirements\";a:1:{s:6:\"module\";a:2:{i:0;s:9:\"phonebook\";i:1;s:9:\"speeddial\";}}s:6:\"md5sum\";s:32:\"cb0ce3062a87ebb3e5d4c32da2e36a78\";s:11:\"displayname\";s:19:\"Phonebook Directory\";s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.1\";}s:12:\"announcement\";a:15:{s:7:\"rawname\";s:12:\"announcement\";s:4:\"name\";s:13:\"Announcements\";s:7:\"version\";s:7:\"2.5.1.9\";s:9:\"changelog\";s:625:\"\n		*2.5.1.9* #3804\n		*2.5.1.8* localization additions\n		*2.5.1.7* localization string enclosures, spelling\n		*2.5.1.6* spelling, localization fixes\n		*2.5.1.5* spelling fixes, Swedish\n		*2.5.1.4* #3196 typo in index\n		*2.5.1.3* #3195, localization fixes, Swedish\n		*2.5.1.2* #3138 Sqlite3 fixes, spellings\n		*2.5.1.1* #2987 sqlite3 install script changes\n		*2.5.1* #2063 Migrate recordings to recording ids\n		*2.5.0* #2845 tabindex\n		*2.4.0.3* #2872 mispelled Announcement\n		*2.4.0.2* #2604, #2843 mal-formed html tag, Russian translations\n		*2.4.0.1* added 2.4.0 dependency\n		*2.4.0* CHANGELOG TRUNCATED See SVN Repository\n	\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:11:\"description\";s:119:\"Plays back one of the system recordings (optionally allowing the user to skip it) and then goes to another destination.\";s:7:\"depends\";a:2:{s:7:\"version\";s:11:\"2.5.0alpha1\";s:6:\"module\";s:19:\"recordings ge 3.3.8\";}s:9:\"menuitems\";a:1:{s:12:\"announcement\";s:13:\"Announcements\";}s:8:\"location\";s:36:\"release/2.5/announcement-2.5.1.8.tgz\";s:6:\"md5sum\";s:32:\"cfa688171991b4d6e79e0e75d3336d0a\";s:11:\"displayname\";s:13:\"Announcements\";s:5:\"items\";a:1:{s:12:\"announcement\";a:4:{s:4:\"name\";s:13:\"Announcements\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.1.9\";}s:15:\"printextensions\";a:14:{s:7:\"rawname\";s:15:\"printextensions\";s:4:\"name\";s:16:\"Print Extensions\";s:7:\"version\";s:7:\"2.5.0.5\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:17:\"Third Party Addon\";s:11:\"description\";s:55:\"Creates a printable list of names and extension numbers\";s:9:\"menuitems\";a:1:{s:15:\"printextensions\";s:16:\"Print Extensions\";}s:9:\"changelog\";s:436:\"\n		*2.5.0.5* #3662\n		*2.5.0.4* localization updates\n		*2.5.0.3* fixes to get localization working from other module domains\n		*2.5.0.2* formating cleanup, code removed\n		*2.5.0.1* right justify Extension heading\n		*2.5.0* remove directdid (no longer in 2.5), change to provide full PBX extension layout\n		*2.4.0* it translations, bump for 2.4\n		*1.3.2* Fixed uninizialized variable errors, bump for rc1\n		*1.3.1* Add he_IL translation\n	\";s:8:\"location\";s:39:\"release/2.5/printextensions-2.5.0.4.tgz\";s:6:\"md5sum\";s:32:\"622d12705883aa3057cb3a5fbab975fd\";s:11:\"displayname\";s:16:\"Print Extensions\";s:5:\"items\";a:1:{s:15:\"printextensions\";a:4:{s:4:\"name\";s:16:\"Print Extensions\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:17:\"Third Party Addon\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.5\";}s:13:\"weakpasswords\";a:15:{s:7:\"rawname\";s:13:\"weakpasswords\";s:4:\"name\";s:23:\"Weak Password Detection\";s:7:\"version\";s:7:\"2.5.0.4\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:21:\"System Administration\";s:9:\"changelog\";s:265:\"\n		*2.5.0.4* #3735, localizations\n		*2.5.0.3* #3663\n		*2.5.0.2* changes to warning msg, moved to Tools tab, System Administration\n		*2.5.0.1* Consolidated individual security notices to a single notice with all details in extended text\n		*2.5.0.0* Initial release\n	\";s:7:\"depends\";a:1:{s:7:\"version\";s:5:\"2.5.0\";}s:11:\"description\";s:79:\"This module detects weak SIP secrets and sets security notifictions accordingly\";s:9:\"menuitems\";a:1:{s:13:\"weakpasswords\";s:23:\"Weak Password Detection\";}s:8:\"location\";s:37:\"release/2.5/weakpasswords-2.5.0.3.tgz\";s:6:\"md5sum\";s:32:\"6d7a9f78dd144db009775cee6102e816\";s:11:\"displayname\";s:23:\"Weak Password Detection\";s:5:\"items\";a:1:{s:13:\"weakpasswords\";a:4:{s:4:\"name\";s:23:\"Weak Password Detection\";s:4:\"type\";s:4:\"tool\";s:8:\"category\";s:21:\"System Administration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.4\";}s:9:\"framework\";a:14:{s:7:\"rawname\";s:9:\"framework\";s:4:\"name\";s:9:\"Framework\";s:7:\"version\";s:7:\"2.5.2.3\";s:10:\"candisable\";s:2:\"no\";s:12:\"canuninstall\";s:2:\"no\";s:9:\"changelog\";s:2073:\"\n		*2.5.2.3* #4223 Security Vulnerability\n		*2.5.2.2* bump 2.5.2 properly\n		*2.5.2.1* re-publish to get packed js library included\n		*2.5.2.0* #3680, #3694, #3696, #3375, #3707, localizations, jQuery updated\n		*2.5.1.5* fix bug introduced from #3660\n		*2.5.1.4* Friendly Warning re: #3660\n		*2.5.1.3* #3592, #3449, #3556, #3641, #3513, #3525, #3658, Security Vulnerability: #3660\n		*2.5.1.2* #3446, #3469, #3588, added lumenvox speech commands and extended splice: r7324\n		*2.5.1.1* #3271, #3324, #3327, #3368, #3380, #3224, #3462\n		*2.5.1.0* #3271, #3309, localization fixes\n		*2.5.0.1* #2792, #3223, #3225, #3235, #3234, #3242, #3246, #3247, #3248, #3221\n		*2.5.0.0* #3176, #3191, #3204, #3209 - fixes SECURITY VULNERABILITY in CDR Reporting\n		*2.5.0rc3.0* #3145, #3151, #3154, #3155, #3156, #3164, #3166, #3165, #3077, #3170 (DAHDI Support)\n		*2.5.0rc2.4* #3131, #3137 several changes to better cache module data and boost performance of page loads\n		*2.5.0rc2.3* #2750, #3128, #3124, #3134, #3131\n		*2.5.0rc2.2* #3107, #3093, #3090, #3113, $3117\n		*2.5.0rc2.1* #3104 fix some urlencoding/decoding re: #3102 changes\n		*2.5.0rc2.0* #3067, #3086, #3082, #3102\n		*2.5.0rc1.1* published wrong, including rc1.0 additions\n		*2.5.0rc1.0* #2913, #3052 delay_answer schema and CSS fix\n		*2.5.0beta1.2* #3014, #3030, #2992, #3026, #3027\n		*2.5.0beta1.1* #2635, #2792 CDR Reporting pie chart errors, and fix bug introduced by #2963\n		*2.5.0beta1.0* #2854, #2978, #2980, #2981, #2982, #2963, #2985\n		*2.5.0alpha1.2* #2957 fix fatal failure in retrieve_conf from change to splice\n		*2.5.0alpha1.1* #2941, #2924, #1539, #2950, #2944, #2945, #2699, #2686, #2946, #2606, #2772, #2565, #1679\n		*2.5.0alpha1.0* #1628, #1715, #1843, #2497, #2604, #2606, #2609, #2686, #2701, #2703, #2739, #2766, #2777, #2782, #2784, #2793, #2798, #2799, #2809, #2818, #2829, #2843, #2845, #2855, #2862, #2881, #2890, #2891, #2897, #2903, #2910, #2911, #2921, #2924\n		*2.4.0.1* #2843, #2701, #2818, #2784, #2604, #2766, #2798, #2809, #2799, #2685, #2676\n		*2.4.0.0* CHANGELOG TRUNCATED See SVN Repository\n	\";s:11:\"description\";s:115:\"This module provides a facility to install bug fixes to the framework code that is not otherwise housed in a module\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:5:\"Basic\";s:8:\"location\";s:33:\"release/2.5/framework-2.5.2.2.tgz\";s:6:\"md5sum\";s:32:\"3ca20962e38eb750f325612a775b1604\";s:11:\"displayname\";s:9:\"Framework\";s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.2.3\";}s:12:\"findmefollow\";a:15:{s:7:\"rawname\";s:12:\"findmefollow\";s:4:\"name\";s:9:\"Follow Me\";s:7:\"version\";s:7:\"2.5.1.8\";s:9:\"changelog\";s:1415:\"\n		*2.5.1.8* #3380, localization updates\n		*2.5.1.7* #3274, localization string enclosures\n		*2.5.1.6* #3246, #3215, localization fixes\n		*2.5.1.5* #3222 sqlite3\n		*2.5.1.4* localization, Swedish\n		*2.5.1.3* #3177 don\'t auto-add vmbox dest to users with novm\n		*2.5.1.2* #3152, #3165, set voicemail as default dest on new followme\n		*2.5.1.1* #2987, #3006, #3029 sqlite3 install, spelling, cidprefix missing fix\n		*2.5.1* #2065 Migrate recordings to recording ids\n		*2.5.0.1* #2391, #2908, #2845, #1791, added delete and add icons\n		*2.5.0* Add enable/disable featurecode with blf support, new confirmation sound file announces cid availability\n		*2.4.14.2* #2604, #2843 fix mal-formed html tags, Russian Translation\n		*2.4.14.1* added depends on 2.4.0\n		*2.4.14* Extension/dest registry, extension quickpick, added hunt strategy with confirmation, it trans, formatting changes\n		*2.4.13.2* #2193 moh path hardcoded\n		*2.4.13.1* bump for rc1\n		*2.4.13* added xml attribute needsenginedb, #1961 enabled to work with extension numbers leading with 0s\n		*2.4.12.3* #2057 don\'t strip CID prefix if no prefix is being added\n		*2.4.12.2* merge findmefollow/core extension destinations if any, and remove findmefollow destinations as a destination since they are handled by core\n		*2.4.12.1* #2002 IF() statement can\'t handle : in the string and can\'t escape them anyhow\n		*2.4.12* CHANGELOG TRUNCATED See SVN Repository\n	\";s:7:\"depends\";a:2:{s:7:\"version\";s:11:\"2.5.0alpha1\";s:6:\"module\";s:19:\"recordings ge 3.3.8\";}s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:11:\"description\";s:358:\"Much like a ring group, but works on individual extensions. When someone calls the extension, it can be setup to ring for a number of seconds before trying to ring other extensions and/or external numbers, or to ring all at once, or in other various \'hunt\' configurations. Most commonly used to ring someone\'s cell phone if they don\'t answer their extension.\";s:9:\"menuitems\";a:1:{s:12:\"findmefollow\";s:9:\"Follow Me\";}s:8:\"location\";s:36:\"release/2.5/findmefollow-2.5.1.7.tgz\";s:6:\"md5sum\";s:32:\"670f11e54579853a42a962130eea5820\";s:11:\"displayname\";s:9:\"Follow Me\";s:5:\"items\";a:1:{s:12:\"findmefollow\";a:5:{s:4:\"name\";s:9:\"Follow Me\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:20:\"Inbound Call Control\";s:4:\"sort\";i:0;s:13:\"needsenginedb\";s:3:\"yes\";}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.1.8\";}s:6:\"paging\";a:15:{s:7:\"rawname\";s:6:\"paging\";s:4:\"name\";s:19:\"Paging and Intercom\";s:7:\"version\";s:7:\"2.5.0.7\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:34:\"Internal Options \n&\n Configuration\";s:9:\"changelog\";s:971:\"\n		*2.5.0.7* #3448, localization updates\n		*2.5.0.6* localization fixes\n		*2.5.0.5* #3208, localization\n		*2.5.0.4* #3138 Sqlite3 fixes\n		*2.5.0.3* #2530 typo _GLOBALS should be GLOBALS\n		*2.5.0.2* #2987, #3008 sqlite3 install script, spelling\n		*2.5.0.1* fix to make sure SIPURI is clear if not default set\n		*2.5.0.0* #2390, #2723 added configurable dial options (so beep can be removed), VXML_URL and any other custom channel variableoption to autoanswer\n		*2.4.0.5* #1939, #2843 Mitel Phone Support, Russian Translation, oldstyle module hooks added\n		*2.4.0.4* #2758 don\'t show intercom instructions when disabled, bogus codes were displayed\n		*2.4.0.3* added depends on 2.4.0\n		*2.4.0.2* small fix so duplicate extension link is displayed when conflicts are found\n		*2.4.0.1* #2559 typo in install script, extra \\\\ needed (you must un-install and re-install or delete paging_autoanswer table entries to take effect)\n		*2.4.0* CHANGELOG TRUNCATED See SVN Repository\n	\";s:7:\"depends\";a:1:{s:7:\"version\";s:5:\"2.4.0\";}s:11:\"description\";s:345:\"Allows creation of paging groups to make announcements using the speaker built into most SIP phones. 	Also creates an Intercom feature code that can be used as a prefix to talk directly to one person, as well as optional feature codes to block/allow intercom calls to all users as well as blocking specific users or only allowing specific users.\";s:9:\"menuitems\";a:1:{s:6:\"paging\";s:19:\"Paging and Intercom\";}s:8:\"location\";s:30:\"release/2.5/paging-2.5.0.6.tgz\";s:6:\"md5sum\";s:32:\"ed5edae74193f06e256d4217ba00ee21\";s:11:\"displayname\";s:19:\"Paging and Intercom\";s:5:\"items\";a:1:{s:6:\"paging\";a:4:{s:4:\"name\";s:19:\"Paging and Intercom\";s:4:\"type\";s:5:\"setup\";s:8:\"category\";s:32:\"Internal Options & Configuration\";s:4:\"sort\";i:0;}}s:6:\"status\";i:2;s:9:\"dbversion\";s:7:\"2.5.0.7\";}}'),('xml',1288879622,'<xml><module>\n	<rawname>pbdirectory</rawname>\n	<name>Phonebook Directory</name>\n	<version>2.5.0.1</version>\n	<type>tool</type>\n	<category>CID &amp; Number Management</category>\n	<location>release/2.5/pbdirectory-2.5.0.1.tgz</location>\n	<description>Provides a dial-by-name directory for phonebook entries</description>\n	<changelog>\n		*2.5.0.1* localization updates\n		*2.5.0* localization string enclosures\n		*2.4.0.2* removed 2.4.0 requirement possible causing broken module issue\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* Destination registry, added missing macro-user-callerid call\n		*0.3.1.2* #2343 pbdirectory script errors\n		*0.3.1.1* bump for rc1\n		*0.3.1* fixed some hard coded paths, requires core modules:  2.3.0beta1.6 or above\n		*0.3* First changelog entry\n	</changelog>\n	<depends>\n		<version>2.4.0</version>\n	</depends>\n	<requirements>\n		<module>phonebook</module>\n		<module>speeddial</module>\n	</requirements>\n	<md5sum>747c10e4e3d35f76a173b4d8dbdba0a8</md5sum>\n</module><module>\n	<rawname>conferences</rawname>\n	<name>Conferences</name>\n	<version>2.5.1.7</version>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<description>Allow creation of conference rooms (meet-me) where multiple people can talk together.</description>\n	<changelog>\n		*2.5.1.7* localization updates\n		*2.5.1.6* #3392 and some localizations\n		*2.5.1.5* localization strings enclosed\n		*2.5.1.4* #3237\n		*2.5.1.3* #3192 set dir for recordings, localization cleanup and Swedish\n		*2.5.1.2* #3135 variable initialization\n		*2.5.1.1* #3087 add hook to module code\n		*2.5.1* #2064 Migrate recordings to recording ids\n		*2.5.0* #2845, added blf hints, added delete and add icons\n		*2.4.0.2* #2604, #2843 fix mal-formed html tags, Russian Translation\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* #2158 add recording option, add support for Extension and Destination Registries, it translations\n		*1.2.2* don\'t ask for name confirmation when recording names on Asterisk 1.3 (new option I replaces i)\n		*1.2.1.3* move Macro(user-callerid) to be called with each conf to accomodate future language settings\n		*1.2.1.2* add call to Macro(user-callerid) to get proper CID in Meetme Conference\n		*1.2.1.1* bump for rc1\n		*1.2.1* changed syntax error in meetme_additional.conf form \'|\' to \',\' separator\n		*1.2* Fixed raising asterisk error on empty dialstatus #1708\n		*1.1.2* Add he_IL translation\n		*1.1.1* Updated for 2.2.0RC1\n		*1.1* First release for FreePBX 2.2 - Fixed compatibility issue with new UI\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n		<module>recordings ge 3.3.8</module>\n	</depends>\n	<menuitems>\n		<conferences>Conferences</conferences>\n	</menuitems>\n	<location>release/2.5/conferences-2.5.1.7.tgz</location>\n	<md5sum>90c16abd43665b4c47a1eb91d9304cc2</md5sum>\n</module><module>\n	<rawname>fw_ari</rawname>\n	<name>ARI Framework</name>\n	<version>5.5.2</version>\n	<candisable>no</candisable>\n	<canuninstall>no</canuninstall>\n	<changelog>\n		*2.5.2.rc1* #3042 remove player popup, embed in page and add call screening settings to phone features\n		*2.5.1.1* #3202, #3203\n		*2.5.1* #3184 SECURITY VULNERABILITY fix\n		*2.5.0.3* #3165, #3077, #2609 and additional fixes related to #3161\n		*2.5.0.2* r6505, #3161 SQL Injection vulnerability that could allow and authenticated user to access all CDRs and recordings\n		*2.5.0.1* remove inclusion of libfreepbx.install.php in install script resulting in warnings\n		*2.5.0* #3104 and First release of fw_ari\n	</changelog>\n	<description>\n		This module provides a facility to install bug fixes to the ARI code that is not otherwise housed in a module, it used to be part of framework but has been removed to isolate ARI from Framework updates.\n	</description>\n	<type>setup</type>\n	<category>Basic</category>\n	<location>release/2.5/fw_ari-5.5.2.tgz</location>\n	<md5sum>7cba9dc631725ab6bb15267e795fb0c1</md5sum>\n</module><module>\n	<rawname>donotdisturb</rawname>\n	<name>Do-Not-Disturb (DND)</name>\n	<version>2.5.0.6</version>\n	<changelog>\n		*2.5.0.6* localization updates\n		*2.5.0.5* #3274\n		*2.5.0.4* #3215, localization fixes\n		*2.5.0.3* localization, xml description, Swedish\n		*2.5.0.2* #2969 change default value to *76\n		*2.5.0.1* #2909 Add DND hints\n		*2.5.0* added toggle and support for func_devstate\n		*2.4.0* bunp for 2.4\n		*1.0.2.2* changed category\n		*1.0.2.1* bump for rc1\n		*1.0.2* changed ${CALLERID(number)} to ${AMPUSER} to accomodate CID number masquerading\n		*1.0.1* First release for 2.2\n	</changelog>\n	<description>Provides donotdisturb featurecodes</description>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<location>release/2.5/donotdisturb-2.5.0.6.tgz</location>\n	<md5sum>c089d816468fd16f39830643266e7262</md5sum>\n</module><module>\n	<rawname>asteriskinfo</rawname>\n	<name>Asterisk Info</name>\n	<version>2.5.0.2</version>\n	<type>tool</type>\n	<category>System Administration</category>\n	<description>\n		Provides a snapshot of the current asterisk configuration\n	</description>\n	<menuitems>\n		<asteriskinfo>Asterisk Info</asteriskinfo>\n	</menuitems>\n	<depends>\n		<engine>asterisk</engine>\n		<version>2.5.0rc3</version>\n	</depends>\n	<changelog>\n		*2.5.0.2* localization updates\n		*2.5.0.1* #3157, #3153, #3077 (DAHDI Support)\n		*2.5.0* #2845 tabindex\n		*2.4.0.1* #2704 Asterisk 1.6 tweaks\n		*2.4.0* bumped to 2.4\n		*0.3.0.1* bump for rc1\n		*0.3.0* #2187 Fix for Asterisk 1.4\n		*0.2.0* Add depends asterisk xml tag, proper error checking for manager connection, center table titles\n		*0.1.0* Initial release\n	</changelog>\n	<location>release/2.5/asteriskinfo-2.5.0.2.tgz</location>\n	<md5sum>fc6def14ed64285abc4b112629acc892</md5sum>\n</module><module>\n	<rawname>customappsreg</rawname>\n	<name>Custom Applications</name>\n	<version>2.5.0.5</version>\n	<type>tool</type>\n	<category>System Administration</category>\n	<description>\n		Registry to add custom extensions and destinations that may be created and used so that the Extensions and Destinations Registry can include these.\n	</description>\n	<menuitems>\n		<customextens>Custom Extensions</customextens>\n		<customdests>Custom Destinations</customdests>\n	</menuitems>\n	<changelog>\n		*2.5.0.5* localization updates, r7132 warning\n		*2.5.0.4* #3263, localization fixes\n		*2.5.0.3* localizations fixes\n		*2.5.0.2* localization, Swedish\n		*2.5.0.1* #3003 spelling\n		*2.5.0* #2845 tabindex\n		*2.4.0.5* #2843 Russian Translation\n		*2.4.0.4* #2700 block editing of destination field when once other modules are using it\n		*2.4.0.3* added depends on 2.4.0\n		*2.4.0.2* #2558 can\'t edit/del custom extension\n		*2.4.0.1* Fix typo in install script, non-existent primary key\n		*2.4.0* First release of module\n	</changelog>\n	<depends>\n		<version>2.4.0</version>\n	</depends>\n	<location>release/2.5/customappsreg-2.5.0.5.tgz</location>\n	<md5sum>ecc05156cd3808abe72355c05f9895e0</md5sum>\n</module><module>\n	<rawname>disa</rawname>\n	<name>DISA</name>\n	<version>2.5.1.8</version>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<menuitems>\n		<disa>DISA</disa>\n	</menuitems>\n	<description>DISA Allows you \'Direct Inward System Access\'. This gives you the ability to have an option on an IVR that gives you a dial tone, and you\'re able to dial out from the FreePBX machine as if you were connected to a standard extension. It appears as a Destination.</description>\n	<changelog>\n		*2.5.1.8* #3457, localiztion updates\n		*2.5.1.7* localization updates\n		*2.5.1.6* localizatoin string enclosures\n		*2.5.1.5* #3138 Sqlite3 fixes\n		*2.5.1.4* #3090 replace str_replace with addslashes to better protect all input in sql\n		*2.5.1.3* #3074 play busy and allow another call when trunk reports busy\n		*2.5.1.2* #2996, #3056 allow all numbers to be dialed and update tooltip\n		*2.5.1.1* #2955 check if pinset file exists to avoid warnings\n		*2.5.1* #2922, #2949 allow consecutive calls once DISA is entered\n		*2.5.0* #1784, #2845 tabindex, added delete and add icons\n		*2.4.0.3* #2859 DISA CID not being set on trunks with default trunk CID set\n		*2.4.0.2* #2843 Russian Translation\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* #2463 no password cid fix, extension/dest registry, it translation\n		*2.2.3* #2463 Set CID when no pin, added support for Destination Registry\n		*2.2.2.2* #2172 deprecated use of |, changed category\n		*2.2.2.1* bump for rc1\n		*2.2.2* bump so higher that 2.2 branch\n		*2.2*   First release for FreePBX 2.2 - Fixed compatibility issue with new UI\n	</changelog>\n	<depends>\n		<version>2.4.0</version>\n	</depends>\n	<location>release/2.5/disa-2.5.1.8.tgz</location>\n	<md5sum>11fc93cdf93341daeb8604bc3228edef</md5sum>\n</module><module>\n	<rawname>manager</rawname>\n	<name>Asterisk API</name>\n	<version>2.5.0.2</version>\n	<type>tool</type>\n	<category>System Administration</category>\n	<menuitems>\n		<manager>Asterisk API</manager>\n	</menuitems>\n	<changelog>\n		*2.5.0.2* localization updates\n		*2.5.0.1* #3191 unitialized vars\n		*2.5.0* #2845 tabindex\n		*2.4.0* it translations\n		*1.3.1* bump for rc1\n		*1.3* Added SQLite3 support, fixes ticket 1776\n		*1.2* Fix UI issues, and \'Array\' message.\n		*1.1* First 2.2 release. Added he_IL support, fixed some warnings.\n	</changelog>\n	<location>release/2.5/manager-2.5.0.2.tgz</location>\n	<md5sum>7dc9bd04af9ea62dd0dce8cd3eecbbe2</md5sum>\n</module><module>\n	<rawname>ringgroups</rawname>\n	<name>Ring Groups</name>\n	<version>2.5.1.9</version>\n	<type>setup</type>\n	<category>Inbound Call Control</category>\n	<description>\n		Creates a group of extensions that all ring together. Extensions can be rung all at once, or in various \'hunt\' configurations. Additionally, external numbers are supported, and there is a call confirmation option where the callee has to confirm if they actually want to take the call before the caller is transferred.\n	</description>\n	<changelog>\n		*2.5.1.9* #3664\n		*2.5.1.8* #3580, localization updates\n		*2.5.1.7* #3380, localization updates\n		*2.5.1.6* localization fixes\n		*2.5.1.5* #3222 sqlite3\n		*2.5.1.4* #3200 and localization fixes\n		*2.5.1.3* #3165 Sqlite3 fix\n		*2.5.1.2* #3000 spelling\n		*2.5.1.1* #2069 Minor bug in change for ids\n		*2.5.1* #2069 Migrate recordings to recording ids\n		*2.5.0.1* changed depends to 2.5\n		*2.5.0* #1795, #2845, #2391, #2853, #2925 add tabindexing, Skip Busy Agent and Ignore Call Forward options\n		*2.4.0.2* #2604, #2843 fix mal-formed html tags, Russian Translation, add oldstyle module hook\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* Extension/dest registry, extension quickpick, added hunt strategy with confirmation, it trans, formatting changes\n		*2.2.16.2* CHANGELOG TRUNCATED See SVN Repository\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n		<module>recordings ge 3.3.8</module>\n	</depends>\n	<menuitems>\n		<ringgroups>Ring Groups</ringgroups>\n	</menuitems>\n	<location>release/2.5/ringgroups-2.5.1.9.tgz</location>\n	<md5sum>344bb004909eaf02c306ed01a0f68b16</md5sum>\n</module><module>\n	<rawname>ivr</rawname>\n	<name>IVR</name>\n	<version>2.5.20.8</version>\n	<type>setup</type>\n	<category>Inbound Call Control</category>\n	<description>\n		Creates Digital Receptionist (aka Auto-Attendant, aka Interactive Voice Response) menus. These can be used to send callers to different locations (eg, \"Press 1 for sales\") and/or allow direct-dialing of extension numbers.\n	</description>\n	<changelog>\n		*2.5.20.8* #4013\n		*2.5.20.7* #3732\n		*2.5.20.6* #3384, localization updates\n		*2.5.20.5* localization string enclosures\n		*2.5.20.4* #3245, localization fixes\n		*2.5.20.3* localization, Swedish\n		*2.5.20.2* #3188 clear MSG var if no message\n		*2.5.20.1* Sqlite3 fixes, move ivr_init() to install script\n		*2.5.20* #3099 allows a return to IVR from voicemail option and from busy phone\n		*2.5.19.2* #2987, #3005 sqlite3 install script, spelling\n		*2.5.19.1* #2965 not working on IE fixed\n		*2.5.19* #2865 Add alternative messages to play if t or i are hit, replacing the first announcmement\n		*2.5.18.1* #2948 don\'t allow deletion if used by a Queue and show list\n		*2.5.18* #2066 Migrate recordings to recording ids\n		*2.5.17.1* #2845 tabindex\n		*2.5.17* #2858 Better handing of i and t options, added loop count and ability to loop before going to user defined i, t options\n		*2.5.16.3* #2604, #2843 fix mal-formed html tags, Russian Translation\n		*2.5.16.2* #2687 breakout from Queue to Company Directory blocks voicemail\n		*2.5.16.1* #2591, added depends on 2.4.0\n		*2.5.16* Extension/dest registry, #2303, it translation\n		*2.5.15* CHANGELOG TRUNCATED See SVN Repository\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n		<module>recordings ge 3.3.8</module>\n	</depends>\n	<menuitems>\n		<ivr>IVR</ivr>\n	</menuitems>\n	<location>release/2.5/ivr-2.5.20.8.tgz</location>\n	<md5sum>09761d3447f2298884ad5ca1cc2957b9</md5sum>\n</module><module>\n	<rawname>parking</rawname>\n	<name>Parking Lot</name>\n	<version>2.5.1.4</version>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<description>Manages parking lot extensions and other options.\n	Parking is a way of putting calls \"on hold\", and then picking them up from any extension.</description>\n	<menuitems>\n		<parking>Parking Lot</parking>\n	</menuitems>\n	<changelog>\n		*2.5.1.4* localization updates\n		*2.5.1.3* localization fixes\n		*2.5.1.2* localization fixes\n		*2.5.1.1* #2718 fix orphaned call not going to destination\n		*2.5.1* #2067 change recording to recording id\n		*2.5.0* #2845 tabindex\n		*2.4.0.6* #2604, #2716, #2843 fix mal-formed html tags, localization fix, Russian Translation\n		*2.4.0.5* added depends on 2.4.0\n		*2.4.0.4* removed parkhints on Asterisk 1.2, metermaid already does and this creates undesired hints\n		*2.4.0.3* change to core_conf and features_general_addtional.conf, no more parking_additianal.inc\n		*2.4.0.2* create hints for Asterisk 1.4 and above\n		*2.4.0.1* add parking_conf class, support PARKINGPATCH config\n		*2.4.0* Destination registry, it translation\n		*2.1.2.1* bump for rc1\n		*2.1.2* merge findmefollow/core extension destinations if any\n		*2.1.1* fix pseudo hardcoded path issue (hardcoded form missing global)\n		*2.1* Remove settings on uninstall bug #1597\n		*2.0.2* Add he_IL translation\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n		<module>recordings ge 3.3.8</module>\n	</depends>\n	<location>release/2.5/parking-2.5.1.4.tgz</location>\n	<md5sum>600f9801ac8a63777d0a7b0d4bfb4896</md5sum>\n</module><module>\n	<rawname>infoservices</rawname>\n	<name>Info Services</name>\n	<version>2.5.0.2</version>\n	<candisable>no</candisable>\n	<canuninstall>no</canuninstall>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<description>Provides a number of applications accessable by feature codes: company directory, call trace (last call information), echo test, speaking clock, and speak current extension number.</description>\n	<changelog>\n		*2.5.0.2* localization updates\n		*2.5.0.1* localization fixes\n		*2.5.0* localization, Swedish\n		*2.4.0.1* #2731 fix press 0 for operator in directory\n		*2.4.0* bumped for 2.4\n		*1.3.5.2* changed categories\n		*1.3.5.1* bump for rc1\n		*1.3.5* #2145 add waitexten while waiting for user input, and make uninstallable\n		*1.3.4* changed ${CALLERID(number)} to ${AMPUSER} to accomodate CID number masquerading\n		*1.3.3* Fixed SpeakExtension - replaced depricated ${CALLERID} variable\n		*1.3.2* Fixed SpeakExtension - add macro-user-callerid\n		*1.3.1* Improved accuracy of speaking clock\n	</changelog>\n	<location>release/2.5/infoservices-2.5.0.2.tgz</location>\n	<md5sum>7699d1a73d13722d53149d9962215e89</md5sum>\n</module><module>\n	<rawname>inventorydb</rawname>\n	<name>Inventory</name>\n	<version>2.5.0.2</version>\n	<type>tool</type>\n	<category>Third Party Addon</category>\n	<menuitems>\n		<inventorydb>Inventory</inventorydb>\n	</menuitems>\n	<changelog>\n		*2.5.0.2* localization updates\n		*2.5.0.1* localization, Swedish\n		*2.5.0* #2845 tabindex\n		*2.4.0.1* #2645 API error - NOTICE: This module will be removed from future versions\n		*2.4.0* bumped for 2.4\n		*1.1.0* Added SQLite3 support. Fixes ticket:1783, bump for rc1\n		*1.0.3* Add he_IL translation\n	</changelog>\n	<location>release/2.5/inventorydb-2.5.0.2.tgz</location>\n	<md5sum>7e2debbb0c51d0424eb2c2fe177d101b</md5sum>\n</module><module>\n	<rawname>queueprio</rawname>\n	<name>Queue Priorities</name>\n	<version>2.5.0.4</version>\n	<type>setup</type>\n	<category>Inbound Call Control</category>\n	<description>\n		Adds the ability to set a callers priority higher before entering a queue\n	</description>\n	<menuitems>\n		<queueprio>Queue Priorities</queueprio>\n	</menuitems>\n	<changelog>\n		*2.5.0.4* #3246, #3254\n		*2.5.0.3* #3214\n		*2.5.0.2* #3110, #3138 Sqlite3 fixes\n		*2.5.0.1* #2845 tabindex\n		*2.5.0* First release of module\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n	</depends>\n	<location>release/2.5/queueprio-2.5.0.4.tgz</location>\n	<md5sum>9a52358ed050ca80b87b837520718e16</md5sum>\n</module><module>\n	<rawname>asterisk-cli</rawname>\n	<name>Asterisk CLI</name>\n	<version>2.5.0.3</version>\n	<type>tool</type>\n	<category>System Administration</category>\n	<description>Provides an interface allowing you to run a commans as if it was typed into Asterisk CLI</description>\n	<menuitems>\n		<cli>Asterisk CLI</cli>\n	</menuitems>\n	<depends>\n		<engine>asterisk</engine>\n	</depends>\n	<location>release/2.5/asterisk-cli-2.5.0.3.tgz</location>\n	<md5sum>2f35d721195202f58946b5fcf2710472</md5sum>\n	<changelog>\n		*2.5.0.3* localization additions\n		*2.5.0.2* description added to xml\n		*2.5.0.1* r6547 Swedish Translations\n		*2.5.0* #2917 execute CLI command direct through manager to remove vulnerabilities\n		*2.4.0* 2.4 branch (added IT translations also)\n		*1.1.2.1* bump for rc1\n		*1.1.2* fix syntax error, extra =\n		*1.1.1* #2070 fix proper use of script tags\n		*1.1* #2006 Fixed display on systems with colored asterisk console\n		*1.0* Fixed security issue, first release in 2.2\n		*0.001* Original Release\n	</changelog>\n</module><module>\n	<rawname>announcement</rawname>\n	<name>Announcements</name>\n	<version>2.5.1.9</version>\n	<changelog>\n		*2.5.1.9* #3804\n		*2.5.1.8* localization additions\n		*2.5.1.7* localization string enclosures, spelling\n		*2.5.1.6* spelling, localization fixes\n		*2.5.1.5* spelling fixes, Swedish\n		*2.5.1.4* #3196 typo in index\n		*2.5.1.3* #3195, localization fixes, Swedish\n		*2.5.1.2* #3138 Sqlite3 fixes, spellings\n		*2.5.1.1* #2987 sqlite3 install script changes\n		*2.5.1* #2063 Migrate recordings to recording ids\n		*2.5.0* #2845 tabindex\n		*2.4.0.3* #2872 mispelled Announcement\n		*2.4.0.2* #2604, #2843 mal-formed html tag, Russian translations\n		*2.4.0.1* added 2.4.0 dependency\n		*2.4.0* CHANGELOG TRUNCATED See SVN Repository\n	</changelog>\n	<type>setup</type>\n	<category>Inbound Call Control</category>\n	<description>\n		Plays back one of the system recordings (optionally allowing the user to skip it) and then goes to another destination.\n	</description>\n	<depends>\n		<version>2.5.0alpha1</version>\n		<module>recordings ge 3.3.8</module>\n	</depends>\n	<menuitems>\n		<announcement>Announcements</announcement>\n	</menuitems>\n	<location>release/2.5/announcement-2.5.1.9.tgz</location>\n	<md5sum>ba7a49040ac5700453fb2df9df798f5f</md5sum>\n</module><module>\n	<rawname>dialplaninjection</rawname>\n	<name>Dialplan Injection</name>\n	<version>0.1.1</version>\n	<type>setup</type>\n	<category>Advanced</category>\n	<description>\n		Acts as a dialplan destination and can execute a variety of commands, then sends the call to another destination.\n              Can also be accessed by dialing an optional extension or pattern.\n	</description>\n	<menuitems>\n		<dialplaninjection>Dialplan Injection</dialplaninjection>\n	</menuitems>\n	<info>http://aussievoip.com.au/wiki/freePBX-DialplanInjection</info>\n        <depends>\n                <module>core</module>\n        </depends>\n        <changelog>\n                *0.1.1* Fixed a few templates and version display bug.\n                *0.1.0* Removed unique constraint on direct dial extension.\n                        Added templates for most dialplan apps.\n                *0.0.3* Added ability to add line labels. Labels also become available as destinations for other modules.\n                        Each direct dial injection is now in its own context to allow individual inclusion in other contexts.\n                        Version now display correctly on screen.\n                *0.0.2* Fixed extension saving bugs, added pattern option.\n                        Commands changed to text area instead of individual boxes.\n                *0.0.1* Beta release\n        </changelog>\n	<attention>\n		This is an advanced module, and you should not use it without understanding asterisk dialplans!\n		This is meant as a convenience tool for someone who would have had to resort to config editing.\n		If you experience problems with it, just disable it and no harm done.\n	</attention>\n		<location>release/2.5/dialplaninjection-0.1.1.tgz</location>\n	<md5sum>e48ff2d6afb23a68b67e2386ee950160</md5sum>\n</module><module>\n	<rawname>callforward</rawname>\n	<name>Call Forward</name>\n	<version>2.5.0.2</version>\n	<changelog>\n		*2.5.0.2* localization updates\n		*2.5.0.1* localization fixes\n		*2.5.0* localization fixes, Swedish\n		*2.4.0* bumped for 2.4\n		*1.1.2* #2321 fixed CF AMPUSER(number) issue, syntax problem\n		*1.1.1.2* changed categories\n		*1.1.1.1* bump for rc1\n		*1.1.1* changed ${CALLERID(number)} to ${AMPUSER} to accomodate CID number masquerading\n		*1.1* First release for 2.2\n	</changelog>\n	<description>Provides callforward featurecodes</description>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<location>release/2.5/callforward-2.5.0.2.tgz</location>\n	<md5sum>548f209ae94317503e4937525215140b</md5sum>\n</module><module>\n	<rawname>featurecodeadmin</rawname>\n	<name>Feature Code Admin</name>\n	<version>2.5.0.4</version>\n	<candisable>no</candisable>\n	<canuninstall>no</canuninstall>\n	<type>setup</type>\n	<category>Basic</category>\n	<menuitems>\n		<featurecodeadmin>Feature Codes</featurecodeadmin>\n	</menuitems>\n	<location>release/2.5/featurecodeadmin-2.5.0.4.tgz</location>\n	<changelog>\n		*2.5.0.4* localization updates\n		*2.5.0.3* fix for proper core localization\n		*2.5.0.2* #3173 don\'t report conflicting extensions with featurmap codes\n		*2.5.0.1* #2461 Localization now works using i18n from hosting featurecode modules\n		*2.5.0* #2845 tabindex, added ability to define default values in freepbx_featurecodes.conf\n		*2.4.0.2* #2843 Russian Translation\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* Extension/dest registry, it translation\n	  *1.0.5.3* changed categories\n	  *1.0.5.2* added canuninstall = no for module admin, bump for rc1\n	  *1.0.5.1* added candisable = no for module admin\n		*1.0.5* Fix install bug with featurecode release\n		*1.0.4* Add support for duplicate feature codes\n		*1.0.3* Add he_IL translation\n		*1.0.2* Fix minor font/display issues\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n	</depends>\n	<md5sum>a7457c31f5326b8df37236940eb45194</md5sum>\n</module><module>\n	<rawname>miscdests</rawname>\n	<name>Misc Destinations</name>\n	<version>2.5.0.3</version>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<description>Allows creating destinations that dial any local number (extensions, feature codes, outside phone numbers) that can be used by other modules (eg, IVR, time conditions) as a call destination.</description>\n	<changelog>\n		*2.5.0.3* localization updates\n		*2.5.0.2* localization string enclosures\n		*2.5.0.1* #3018, #3043 spelling and delete link does not show if not being used as dest\n		*2.5.0* #2845 tabindex, added delete and add icons\n		*2.4.0.2* #2843 Russian Translation\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* Extension/dest registry, it translation\n		*1.3.4.3* changed categories\n		*1.3.4.2* bump for rc1\n		*1.3.4.1* changed freePBX to FreePBX\n		*1.3.4* destination changed from Dial(Local/nnn@from-internal) to Goto(from-internal,nnn,1), no reason a new channel should be created\n		*1.3.3* Minor formatting changes\n		*1.3.2* Add he_IL translation\n		*1.3.1* Updated help text\n		*1.3* First release for FreePBX 2.2 - Fixed GUI issues\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n	</depends>\n	<menuitems>\n		<miscdests>Misc Destinations</miscdests>\n	</menuitems>\n	<location>release/2.5/miscdests-2.5.0.3.tgz</location>\n	<md5sum>36cb429b5b8576a8dab5bb203262eda5</md5sum>\n</module><module>\n	<rawname>callback</rawname>\n	<name>Callback</name>\n	<version>2.5.0.3</version>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<menuitems>\n		<callback>Callback</callback>\n	</menuitems>\n	<changelog>\n	*2.5.0.3* localization updates\n	*2.5.0.2* #3272 missing callback_check_destinations(), localization fixes\n	*2.5.0.1* Swedish Translations, fix Italian Translations\n	*2.5.0* #2845 tabindex\n	*2.4.0.2* #2843 Russian Translation\n	*2.4.0.1* add 2.4.0 dependency\n	*2.4.0* extension/destination registry, it translations\n	*1.4.2.3* changed categories\n	*1.4.2.2* bump for rc1\n	*1.4.2.1* changed freePBX to FreePBX\n	*1.4.2* merge findmefollow/core extension destinations if any\n	*1.4.1* Moved callback agi script from core to module\n	*1.4.0* SQLite3 support, fixes ticket:1793 (only for FreePBX 2.3)\n	*1.3.1* Add he_IL translation\n	*1.3* Fixed UI errors for new 2.2 look.\n	*1.2* First 2.2 release\n	</changelog>\n	<depends>\n		<version>2.4.0</version>\n	</depends>\n	<location>release/2.5/callback-2.5.0.3.tgz</location>\n	<md5sum>5dadb1762029be828dd31f3095ec0b33</md5sum>\n</module><module>\n	<rawname>phpagiconf</rawname>\n	<name>PHPAGI Config</name>\n	<version>2.5.0.3</version>\n	<type>tool</type>\n	<category>System Administration</category>\n	<menuitems>\n		<phpagiconf>PHPAGI Config</phpagiconf>\n	</menuitems>\n	<depends>\n		<module>manager ge1.0.4</module>\n	</depends>\n	<changelog>\n		*2.5.0.3* localization updates\n		*2.5.0.2* #3191 uninitialized vars\n		*2.5.0.1* #2987 sqlite3 install script\n		*2.5.0* #1779, #2845 tabindex\n		*2.4.0* bump for 2.4\n		*1.2.2* Changed categories\n		*1.2.1* Fixed javascript error, removed unused script, bump for rc1\n		*1.2* Create tmp files in /etc/asterisk, fixes ticket:1910\n		*1.1* Removed old dependancy checking code, first 2.2 release\n	</changelog>\n	<location>release/2.5/phpagiconf-2.5.0.3.tgz</location>\n	<md5sum>23d924d9212ced636418136958962ee5</md5sum>\n</module><module>\n	<rawname>support</rawname>\n	<name>Support</name>\n	<version>1.0.0</version>\n	<description>\n		Need support? Let professional trixbox CE engineers help solve your problems!\n	</description>\n        <changelog>\n                *1.0.0* Initial release!\n        </changelog>\n	<type>setup</type>\n	<category>Basic</category>\n	<menuitems>\n		<support needsenginedb=\"yes\">Support</support>\n	</menuitems>\n	<depends>\n		<module>core</module>\n	</depends>\n	<location>release/2.5/support-1.0.0.tgz</location>\n	<md5sum>44f5cdb2771c77edc835efcd416108f4</md5sum>\n</module><module>\n	<rawname>phpinfo</rawname>\n	<name>PHP Info</name>\n	<version>2.5.0</version>\n	<changelog>\n		*2.5.0* localization updates\n		*2.4.0* bump for 2.4\n		*1.1.0.1* bump for rc1\n		*1.1.0* #1442 remove access problem and iframe\n	</changelog>\n	<type>tool</type>\n	<category>System Administration</category>\n	<menuitems>\n		<phpinfo>PHP Info</phpinfo>\n	</menuitems>\n	<location>release/2.5/phpinfo-2.5.0.tgz</location>\n	<md5sum>7d7a73efcd6ea960bc585ded780dc5f7</md5sum>\n</module><module>\n	<rawname>endpointcfg</rawname>\n	<name>Endpoint Manager</name>\n	<version>1.2.1</version>\n	<candisable>yes</candisable>\n	<canuninstall>yes</canuninstall>\n	<type>setup</type>\n	<category>Basic</category>\n	<menuitems>\n		<endpointcfg controller=\"endpoints\">Endpoint Manager</endpointcfg>\n	</menuitems>\n	<description>\n		This module provides a facility to view and configure endpoints on your network to work with trixbox.\n	</description>\n	<changelog>\n		*1.0* Functionality to configure Aastra and Polycom phones\n		*1.1* Updated with appcelerator ajax functionality and added SNOM phones\n		*1.2* Implemented as a module of PBXConfig\n	</changelog>\n	<attention>\n		This is an BETA module. Please do not use this on a production system! You can use the old endpoint manager with this module but only manage each phone with one module or the another.\n	</attention>\n	<location>release/2.5/endpointcfg-1.2.1.tgz</location>\n	<md5sum>9d84f958fbaad81c60dc476d4d60aa29</md5sum>\n</module><module>\n	<rawname>phonebook</rawname>\n	<name>Phonebook</name>\n	<version>2.5.0.3</version>\n	<description>Provides a phonebook for FreePBX, it can be used as base for Caller ID Lookup and Speed Dial</description>\n	<type>tool</type>\n	<category>System Administration</category>\n	<menuitems>\n		<phonebook needsenginedb=\"yes\">Asterisk Phonebook</phonebook>\n	</menuitems>\n	<location>release/2.5/phonebook-2.5.0.3.tgz</location>\n	<md5sum>80c76de261dbde5ca5dacdf46d9f5829</md5sum>\n	<changelog>\n		*2.5.0.3* localization updates\n		*2.5.0.2* localization changes, Swedish\n		*2.5.0.1* #3009 spelling\n		*2.5.0* #1821, #2845 tabindex\n		*2.4.0.1* #2843 Russian Translation\n		*2.4.0* CHANGELOG TRUNCATED See SVN Repository\n	</changelog>\n</module><module>\n	<rawname>languages</rawname>\n	<name>Languages</name>\n	<version>2.5.0.8</version>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<description>\n		Adds the ability to changes the language within a call flow and add language attribute to users.\n	</description>\n	<menuitems>\n		<languages>Languages</languages>\n	</menuitems>\n	<changelog>\n		*2.5.0.8* localization updates, r7132 warning\n		*2.5.0.7* localization string enclosures\n		*2.5.0.6* localization, Swedish\n		*2.5.0.5* #3174 fix validation code\n		*2.5.0.4* #3110, #3138\n		*2.5.0.3* #2530 typo _GLOBALS should be GLOBALS\n		*2.5.0.2* fix depends to 2.5.0alpha1\n		*2.5.0.1* r6123 inject macro-user-callerid with required language setting (was hardcoded)\n		*2.5.0* #2845 tabindex\n		*2.4.0.3* #2843 Russian Translation, removal of un-needed code\n		*2.4.0.2* added depends on 2.4.0\n		*2.4.0.1* #2578 use setlanguage to handle changes in Asterisk 1.6\n		*2.4.0* First release of module\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n	</depends>\n	<location>release/2.5/languages-2.5.0.8.tgz</location>\n	<md5sum>dc8ac4a30d43b79783c77a19d15f12d7</md5sum>\n</module><module>\n	<rawname>fw_fop</rawname>\n	<name>FOP Framework</name>\n	<version>2.5.0.2</version>\n	<candisable>no</candisable>\n	<canuninstall>no</canuninstall>\n	<changelog>\n		*2.5.0.2* updated to the latest version of fop\n		*2.5.0.1* typo in install script\n		*2.5.0* First release of fw_fop\n	</changelog>\n	<description>\n		This module provides a facility to install bug fixes to the FOP code that is not otherwise housed in a module, it used to be part of framework but has been removed to isolate FOP from Framework updates.\n	</description>\n	<type>setup</type>\n	<category>Basic</category>\n	<location>release/2.5/fw_fop-2.5.0.2.tgz</location>\n	<md5sum>81b083074bae782d30cef4980427853a</md5sum>\n</module><module>\n	<rawname>music</rawname>\n	<name>Music on Hold</name>\n	<version>2.5.1.3</version>\n	<candisable>no</candisable>\n	<canuninstall>no</canuninstall>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<description>Uploading and management of sound files (wav, mp3) to be used for on-hold music.</description>\n	<changelog>\n		*2.5.1.3* #3380, #3443, localization updates\n		*2.5.1.2* #3346\n		*2.5.1.1* #3297, localization changes\n		*2.5.1* #3156 add option to put Streaming Sources as well as downloaded files as music category\n		*2.5.0.1* #3007 spelling\n		*2.5.0* #2773, #2845, #2928, added delete and add icons\n		*2.4.0.2* #2843 Russian Translation\n		*2.4.0.1* #2591 localization fixes\n		*2.4.0* it translations, bump for 2.4\n		*1.5.2* #1923 Add option to no encode wav to mp3 (but recode it to 8K samples)\n		*1.5.1.5* #2193 moh path hardcoded\n		*1.5.1.4* bump for rc1\n		*1.5.1.3* #1969 fix javascript validation, add canunninstall:no\n		*1.5.1.2* #2070 fix proper use of script tags\n		*1.5.1.1* added candisable = no for module admin\n		*1.5.1* Added a \'none\' category that results in silence played\n		*1.5* Fixed upload bug, #1646 could not upload files\n		*1.4.2* List wav files\n		*1.4.1* Add redirect_standard() call to avoid #1616\n		*1.4* Fix an issue of a new install not having a working MOH until they visit the page.\n		*1.3.2* Add he_IL translation\n		*1.3.1* Changed name to Music on Hold (from On Hold Music)\n		*1.3* Bumped version to assist upgraders from the 2.1 tree. No other changes.\n		*1.2* First release for FreePBX 2.2 - Fixed compatibility issue with new UI\n	</changelog>\n	<menuitems>\n		<music>Music on Hold</music>\n	</menuitems>\n	<location>release/2.5/music-2.5.1.3.tgz</location>\n	<md5sum>f54ad143c42f7056a5b826de6bdaa25b</md5sum>\n</module><module>\n	<rawname>daynight</rawname>\n	<name>Day Night Mode</name>\n	<version>2.5.0.12</version>\n	<type>setup</type>\n	<category>Inbound Call Control</category>\n	<description>\n		Day / Night control - allows for two destinations to be chosen and provides a feature code\n		that toggles between the two destinations.\n	</description>\n	<changelog>\n		*2.5.0.12* #3350\n		*2.5.0.11* localization updates\n		*2.5.0.10* #3318 set BLF in GUI\n		*2.5.0.9* localization string enclosures\n		*2.5.0.8* #3215\n		*2.5.0.7* #3214, #3222\n		*2.5.0.6* localization, Swedish\n		*2.5.0.5* #3138 Sqlite3 fixes\n		*2.5.0.4* #2998, #3004 fix link status to timecondition, spelling\n		*2.5.0.3* #2954 hint not getting written fixed\n		*2.5.0.2* #2903, #2882 more changes, depends on 2.5.0\n		*2.5.0.1* #2882: added hook to associated a timecondtion with a daynight mode condtion\n		*2.5.0* change to create feature code for each index, add func_devstate blf\n		*2.4.0.3* #2734 fixed issue creating index with no description made it disapear\n		*2.4.0.2* #2604, #2843 fix mal-formed html tags, Russian Translation\n		*2.4.0.1* #2591 added depends on 2.4.0\n		*2.4.0* extension/dest registry, it translation\n		*1.0.2.4* #2414 fix other unmatched ) syntax error\n		*1.0.2.3* #2414 fix unmatched ) syntax error\n		*1.0.2.2* bump for rc1\n		*1.0.2.1* added xml attribute needsenginedb, fixed some undefined vars\n		*1.0.2* Added red/green color coding of rnav to see current mode\n		*1.0.1* #2047 got day/night reversed\n		*1.0.0* First release for FreePBX 2.3\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n	</depends>\n	<menuitems>\n		<daynight needsenginedb=\"yes\">Day/Night Control</daynight>\n	</menuitems>\n	<location>release/2.5/daynight-2.5.0.12.tgz</location>\n	<md5sum>a9fa296151fee04c4e26b72ff2f748fe</md5sum>\n</module><module>\n	<rawname>core</rawname>\n	<type>setup</type>\n	<category>Basic</category>\n	<name>Core</name>\n	<version>5.5.2.4</version>\n	<candisable>no</candisable>\n	<canuninstall>no</canuninstall>\n	<changelog>\n		*2.5.2.4* #4058, #4075\n		*2.5.2.3* fixed missing global\n		*2.5.2.2* fixed for potential XSS and SQL Injection vulnerabilties\n		*2.5.2.1* #3880\n		*2.5.2.0* #3696 (requires framework updated first), #3706, #3712, #3739, #3741, #3744, #3790, #3478, #3423, #3691, #3693, #3705, #3792\n		*2.5.1.7* #3517, #3653, #3591\n		*2.5.1.6* #3439, #3526, #3534, moved macro-vm to auto-generation (WARNING: custom modification of macro-vm in extensions_custom.conf need to be moved to extensions_override_freepbx.conf\n		*2.5.1.5* #3474\n		*2.5.1.4* #3380, #3451, #932, #3358, #3426\n		*2.5.1.3* #3380, #3358, #3387, localizations\n		*2.5.1.2* #3345 inbound CID routing fix, adds vm-callme voicemail access option\n		*2.5.1.1* #3311, revert #3266 (r7001)\n		*2.5.1.0* #3304, #3276, #3299\n		*2.5.0.4* #3299\n		*2.5.0.3* #3266, #3267, #3281, #3042 (vm-callme context), localiztion fixes\n		*2.5.0.2* #3219, #3241, #3240, #3251, #3215, localization fixes\n		*2.5.0.1* minor bug not showing extensions\n		*2.5.0.0* #3211, and final release\n		*2.5.0rc3.3* #3193, #3200, localization fixes, Swedish\n		*2.5.0rc3.2* #3124, #3180\n		*2.5.0rc3.1* #3173, #3077 auto-blkvm,  auto-confirm to auto generation,  visual feedback to DAHDI compatibility\n		*2.5.0rc3.0* #3150, #3152, #3142, #3167, #3077 (DAHDI Support)\n		*2.5.0rc2.5* #3129, #3144, #3146 and some streamling of dialout-trunk and outbound-callerid\n		*2.5.0rc2.4* #3128, #3140 sqlite3 fix and fixed typo introduced in dialparties.agi\n		*2.5.0rc2.3* #3130, #2750, #3128, #3131 (requires r6519) added master recording disable (can be performance booster)\n		*2.5.0rc2.2* lots of changed to be updated\n		*2.5.0rc2.1* #3115, #3116 remove warning and add t option to nv_faxdetect\n		*2.5.0rc2.0* #3091, #3099, #3100 Added return from voicemail/busy to IVR support, added CID Priority Route Inbound Route option\n		*2.5.0rc1.1* #3060, #3072, #3078 mixmonitor recording dir typo, move disallow=all to top of all sip, iax sections, file call screening nomemory\n		*2.5.0rc1.0* #3053 allow routing in CIDs like Private, Blocked, Restricted, etc. and bump to rc1\n		*2.5.0beta1.4* #3046, #3019, #3047, #3040\n		*2.5.0beta1.3* #2530 typo _GLOBALS should be GLOBALS, clean up conflicts when creating users/extensions\n		*2.5.0beta1.2* #2913 Add pre-answer delay option to incoming routes, rearrange the order of options on incoming screen\n		*2.5.0beta1.1* #2991, #2999, #2993, #3020, #3002, #3041, #2996, #3029, #3031\n		*2.5.0beta1.0* #2976, #2778, #2413, #2974, #2962, #2894, #2073\n		*2.5.0alpha1.1* #2930, #2938, #2922, #2939, #1568, #2949, #2779, #2953, #1911, #2807\n		*2.5.0alpha1.0* #2853, #2925, #2391, #2785, #2923, #2671, #2585, #2908, #2909, #2510, #2976, #2845, #1715, #2760, #2926, #2927, #2838, also added misc icons, links between users/devices\n		*2.4.0.4* #2857, #2848, #2791, #2449\n		*2.4.0.3* #2851 forwarded/followme/ringgroup calls originating from outside fail\n		*2.4.0.2* #2702, #2759, #2763, #2801, #2747, #2828, #2604, #2841, #2835 - review svn log or tickets for details\n		*2.4.0.1* #2693 fix DID editing creating new DID route introduced from #2664 fix\n		*2.4.0.0* CHANGELOG TRUNCATED See SVN Repository\n	</changelog>\n	<depends>\n		<version>2.5.0rc3</version>\n	</depends>\n	<requirements>\n		<file>/usr/sbin/asterisk</file>\n	</requirements>\n	<menuitems>\n		<extensions needsenginedb=\"yes\" sort=\"-4\">Extensions</extensions>\n		<users needsenginedb=\"yes\" sort=\"-3\">Users</users>\n		<devices needsenginedb=\"yes\" sort=\"-4\">Devices</devices>\n		<did category=\"Inbound Call Control\" sort=\"-5\">Inbound Routes</did>\n		<zapchandids category=\"Inbound Call Control\" sort=\"-5\">Zap Channel DIDs</zapchandids>\n		<routing>Outbound Routes</routing>\n		<trunks>Trunks</trunks>\n		<general>General Settings</general>\n		<ampusers sort=\"5\">Administrators</ampusers>\n		<wiki access=\"all\" category=\"Support\" href=\"http://trixbox.org/support\" sort=\"5\" target=\"_blank\" type=\"tool\">Support</wiki>\n	</menuitems>\n	<location>release/2.5/core-5.5.2.4.tgz</location>\n	<md5sum>da3c3437d5c0e43dc8a1ca1cb989225e</md5sum>\n</module><module>\n	<rawname>speeddial</rawname>\n	<name>Speed Dial Functions</name>\n	<version>2.5.0.1</version>\n	<changelog>\n		*2.5.0.1* localization updates\n		*2.5.0* #2887\n		*2.4.0* bump for 2.4\n		*1.0.4.2* #2329 add WaitExten after background\n		*1.0.4.1* bump for rc1\n		*1.0.4* #2049 remove use of speedial-clean, allow leading 0s\n		*1.0.3* changed ${CALLERID(number)} to ${AMPUSER} to accomodate CID number masquerading\n		*1.0.2* No comment\n		*1.0.1* First release for 2.2\n	</changelog>\n	<type>module</type>\n	<category>CID &amp; Number Management</category>\n	<depends>\n		<module>phonebook</module>\n	</depends>\n	<location>release/2.5/speeddial-2.5.0.1.tgz</location>\n	<md5sum>4d78c5df8b7ec286eef845aab4fafd61</md5sum>\n</module><module>\n	<rawname>timeconditions</rawname>\n	<name>Time Conditions</name>\n	<version>2.5.0.9</version>\n	<type>setup</type>\n	<category>Inbound Call Control</category>\n	<description>\n		Creates a condition where calls will go to one of two destinations (eg, an extension, IVR, ring group..) based on the time and/or date. This can be used for example to ring a receptionist during the day, or go directly to an IVR at night.\n	</description>\n	<changelog>\n		*2.5.0.9* localization updates\n		*2.5.0.8* #3325 timecondition install script fails going from 2.4 to 2.5\n		*2.5.0.7* localization string enclosures\n		*2.5.0.6* #3222 salite3\n		*2.5.0.5* #3138 Sqlite3 fix, localization fixes\n		*2.5.0.4* #2987, #3012 sqlite3 install script, spelling\n		*2.5.0.3* update initial table creatino for new installs\n		*2.5.0.2* #2936 remove warning when not timegroups present\n		*2.5.0.1* tweaks to timegroups, added delete and add icons\n		*2.5.0* #774, #1695: Merged timegroups and timecondition changes from contributed_modules originally submitted by naftali5\n		*2.4.4.3* #2604, #2765, #2843 fix mal-formed html tags, Russian Translation\n		*2.4.4.2* generate all timeconditions when using database mode authorization and deptarments\n		*2.4.4.1* added depends on 2.4.0\n		*2.4.4* Extension/dest registry, it translation\n		*2.4.3.1* bump for rc1\n		*2.4.3* Added SQLite3 support, fixed ticket http://freepbx.org/trac/ticket/1774\n		*2.4.2* merge findmefollow/core extension destinations if any\n		*2.4.1* Add he_IL translation\n		*2.4* Upgrading module version to assist with trixbox upgrades, that have 2.3.1 already, so this needs to be higher. No other changes.\n		*2.3* First release for FreePBX 2.2 - Fixed compatibility issue with new UI\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n	</depends>\n	<menuitems>\n		<timeconditions>Time Conditions</timeconditions>\n		<timegroups>Time Groups</timegroups>\n	</menuitems>\n	<location>release/2.5/timeconditions-2.5.0.9.tgz</location>\n	<md5sum>cafd74f3a7cf99d27e33066b4111555c</md5sum>\n</module><module>\n	<rawname>vmblast</rawname>\n	<name>VoiceMail Blasting</name>\n	<version>2.5.0.5</version>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<description>\n		Creates a group of extensions that Calls a group of voicemail boxes and allows you to leave a message for them all at once.\n	</description>\n	<changelog>\n		*2.5.0.5* localization updates\n		*2.5.0.4* #3380\n		*2.5.0.3* localization string enclosures\n		*2.5.0.2* #3138, #3165 Sqlite3 fixes\n		*2.5.0.1* #2530 typo _GLOBALS should be GLOBALS\n		*2.5.0* #2845 tabindex\n		*2.4.3.3* add oldstyle module hook\n		*2.4.3.2* added depends on 2.4.0\n		*2.4.3.1* #2632 red bar addressed now also\n		*2.4.3* #2632 audio_lable, password, default_group not saved on initial config, and fix odd refresh behavior after add\n		*2.4.2* #2630 fixed errors requiring register_globals=on to be set in php.ini\n		*2.4.1* add beep only, no confirmation option to vmblast audio label\n		*2.4.0* first official version imported into 2.4 branch\n		*1.2.0* change to use proper multi-select list, fix bug in js validation of empty list, add default vmblast group\n		*1.1.2* add vmblast_group table and migrate from old grplist field\n		*1.1.1* fixed a couple SQL bugs, improved dialplan so you can skip annoucement and messages immeditiately (except if saydigits used)\n		*1.1.0* add audio label, password protect, fix bug for javascript validation to work, add extension/dest registry support\n		*1.0.2* increase grouplist field to varchar(255) to increase the vmblast list\n		*1.0.l* fix: context, redisplay of groups, get proper vm contexts, beep before leaving msg\n	</changelog>\n	<menuitems>\n		<vmblast>VoiceMail Blasting</vmblast>\n	</menuitems>\n	<depends>\n		<version>2.4.0</version>\n	</depends>\n	<location>release/2.5/vmblast-2.5.0.5.tgz</location>\n	<md5sum>e5d14e58f9ef22170a1cd8a51d537f36</md5sum>\n</module><module>\n	<rawname>callwaiting</rawname>\n	<name>Call Waiting</name>\n	<version>2.5.0.1</version>\n	<changelog>\n	*2.5.0.1* localization updates\n	*2.5.0* localization string enclosures\n	*2.4.0* bumped for 2.4\n	*1.1.2.2* changed categories\n	*1.1.2.1* bump for rc1\n	*1.1.2* changed ${CALLERID(number)} to ${AMPUSER} to accomodate CID number masquerading\n	*1.1.1* Fixed typo Provdes to Provides*\n	*1.1* First release for 2.2\n	</changelog>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<description>Provides an option to turn on/off call waiting</description>\n	<location>release/2.5/callwaiting-2.5.0.1.tgz</location>\n	<md5sum>34a3f3eaed2ba7379e3f5be9dea2a602</md5sum>\n</module><module>\n	<rawname>cidlookup</rawname>\n	<name>Caller ID Lookup</name>\n	<version>2.5.0.7</version>\n	<description>Allows Caller ID Lookup of incoming calls against different sources (MySQL, HTTP, ENUM, Phonebook Module)</description>\n	<type>setup</type>\n	<category>Inbound Call Control</category>\n	<menuitems>\n		<cidlookup>CallerID Lookup Sources</cidlookup>\n	</menuitems>\n	<depends>\n		<engine>asterisk 1.2</engine>\n		<module>core ge 2.5.1.2</module>\n	</depends>\n	<location>release/2.5/cidlookup-2.5.0.7.tgz</location>\n	<md5sum>a73c9036924c5dc7068bb4737c839ddf</md5sum>\n	<changelog>\n		*2.5.0.7* backported from 2.6 the fix for Asterisk 1.6\n		*2.5.0.6* localization updates\n		*2.5.0.5* #3345\n		*2.5.0.4* #3260, other localization work\n		*2.5.0.3* localization fixes, Swedish\n		*2.5.0.2* #3100, #3101 changes to work with new inbound route changes and fixes previous bug\n		*2.5.0.1* #2987, #3001 sqlite3 install script and spelling fixes\n		*2.5.0* #2845 tabindex\n		*2.4.0.3* remove cidlookup field from core incoming table - should never have been there\n		*2.4.0.2* #2843 Russian Translation\n		*2.4.0.1* #2541 migrate from channel routing and re-enable functionality\n		*2.4.0* it translations, bump for 2.4\n		*1.2.1.3* #2172 deprecated use of |, changed categories\n		*1.2.1.2* bump for rc1\n		*1.2.1.1* shorten menu name\n		*1.2.1* changed freePBX to FreePBX\n		*1.2.0* Added SQLite3 support, fixes ticket:1796 (FreePBX 2.3 only)\n		*1.1.1* Add he_IL translation\n		*1.1* First release for FreePBX 2.2 - Fixed compatibility issue with new UI\n		*1.0.4* Updated module.xml format\n		*1.0.3* Fixes from #999\n		*1.0.1* Added possibility to cache in astDB\n			Added lookup from cache before querying external source\n		*1.0.0* First release\n	</changelog>\n</module><module>\n	<rawname>blacklist</rawname>\n	<name>Blacklist</name>\n	<version>2.5.0.5</version>\n	<type>setup</type>\n	<category>Inbound Call Control</category>\n	<menuitems>\n		<blacklist needsenginedb=\"yes\">Blacklist</blacklist>\n	</menuitems>\n	<changelog>\n		*2.5.0.5* #3557 and localization updates\n		*2.5.0.4* localization updates\n		*2.5.0.3* #3345, translations\n		*2.5.0.2* Swedish Translations\n		*2.5.0.1* #3100, #3101 changes to work with new inbound route changes and fixes previous bug\n		*2.5.0* #2956 no need to try and splice from-zaptel macros anymore\n		*2.4.0.1* #2843 Russian Translation\n		*2.4.0* minor fixes, it translations, bumped for 2.4\n		*1.1.4* #2416 Enable Asterisk 1.6+ support\n		*1.1.3.6* #2455 allow + and other valid dial digits\n		*1.1.3.5* changed categories\n		*1.1.3.4* bump for rc1\n		*1.1.3.3* added xml attribute needsenginedb\n		*1.1.3.2* #2070 syntax fix from below\n		*1.1.3.1* #2070 fix proper use of script tags\n		*1.1.3* #2061 fixed to work with Asterisk 1.4 (wait for confirmation of 1)\n		*1.1.2* #1638 remove duplicate of zapateller instruction\n		*1.1.1* Add he_IL translation\n		*1.1* First 2.2 release. Fix minor warnings.\n	</changelog>\n	<depends>\n		<module>core ge 2.5.1.2</module>\n	</depends>\n	<location>release/2.5/blacklist-2.5.0.5.tgz</location>\n	<md5sum>de36ff9c7d28a5b966101f37f720fb7a</md5sum>\n</module><module>\n	<rawname>framework</rawname>\n	<name>Framework</name>\n	<version>2.5.2.3</version>\n	<candisable>no</candisable>\n	<canuninstall>no</canuninstall>\n	<changelog>\n		*2.5.2.3* #4223 Security Vulnerability\n		*2.5.2.2* bump 2.5.2 properly\n		*2.5.2.1* re-publish to get packed js library included\n		*2.5.2.0* #3680, #3694, #3696, #3375, #3707, localizations, jQuery updated\n		*2.5.1.5* fix bug introduced from #3660\n		*2.5.1.4* Friendly Warning re: #3660\n		*2.5.1.3* #3592, #3449, #3556, #3641, #3513, #3525, #3658, Security Vulnerability: #3660\n		*2.5.1.2* #3446, #3469, #3588, added lumenvox speech commands and extended splice: r7324\n		*2.5.1.1* #3271, #3324, #3327, #3368, #3380, #3224, #3462\n		*2.5.1.0* #3271, #3309, localization fixes\n		*2.5.0.1* #2792, #3223, #3225, #3235, #3234, #3242, #3246, #3247, #3248, #3221\n		*2.5.0.0* #3176, #3191, #3204, #3209 - fixes SECURITY VULNERABILITY in CDR Reporting\n		*2.5.0rc3.0* #3145, #3151, #3154, #3155, #3156, #3164, #3166, #3165, #3077, #3170 (DAHDI Support)\n		*2.5.0rc2.4* #3131, #3137 several changes to better cache module data and boost performance of page loads\n		*2.5.0rc2.3* #2750, #3128, #3124, #3134, #3131\n		*2.5.0rc2.2* #3107, #3093, #3090, #3113, $3117\n		*2.5.0rc2.1* #3104 fix some urlencoding/decoding re: #3102 changes\n		*2.5.0rc2.0* #3067, #3086, #3082, #3102\n		*2.5.0rc1.1* published wrong, including rc1.0 additions\n		*2.5.0rc1.0* #2913, #3052 delay_answer schema and CSS fix\n		*2.5.0beta1.2* #3014, #3030, #2992, #3026, #3027\n		*2.5.0beta1.1* #2635, #2792 CDR Reporting pie chart errors, and fix bug introduced by #2963\n		*2.5.0beta1.0* #2854, #2978, #2980, #2981, #2982, #2963, #2985\n		*2.5.0alpha1.2* #2957 fix fatal failure in retrieve_conf from change to splice\n		*2.5.0alpha1.1* #2941, #2924, #1539, #2950, #2944, #2945, #2699, #2686, #2946, #2606, #2772, #2565, #1679\n		*2.5.0alpha1.0* #1628, #1715, #1843, #2497, #2604, #2606, #2609, #2686, #2701, #2703, #2739, #2766, #2777, #2782, #2784, #2793, #2798, #2799, #2809, #2818, #2829, #2843, #2845, #2855, #2862, #2881, #2890, #2891, #2897, #2903, #2910, #2911, #2921, #2924\n		*2.4.0.1* #2843, #2701, #2818, #2784, #2604, #2766, #2798, #2809, #2799, #2685, #2676\n		*2.4.0.0* CHANGELOG TRUNCATED See SVN Repository\n	</changelog>\n	<description>\n		This module provides a facility to install bug fixes to the framework code that is not otherwise housed in a module\n	</description>\n	<type>setup</type>\n	<category>Basic</category>\n	<location>release/2.5/framework-2.5.2.3.tgz</location>\n	<md5sum>633ae7d02c3bb37c3a757953604b5594</md5sum>\n</module><module>\n	<rawname>recordings</rawname>\n	<name>Recordings</name>\n	<version>3.3.8.10</version>\n	<candisable>no</candisable>\n	<canuninstall>no</canuninstall>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<description>Creates and manages system recordings, used by many other modules (eg, IVR).</description>\n	<changelog>\n		*3.3.8.10* #3605\n		*3.3.8.9* localization updates\n		*3.3.8.8* localization fixes, misc\n		*3.3.8.7* #3108, #3138 Sqlite3 fix\n		*3.3.8.6* #3058 really again, use encodeURIComponent() in javascript, and remove urlencoding from crypt function\n		*3.3.8.5* #3058 again, revert crypt.php again\n		*3.3.8.4* #3058 properly display messages for unplayble formats and revert r6234 for crypt.php\n		*3.3.8.3* #2987, #3011, #3036 sqlite3 install, spelling, remove popup.css\n		*3.3.8.2* #2547, #2983 remove access violation so modules dir can be locked down, fix bug in sound file path, add back encryption\n		*3.3.8.1* fixed typo in recordings_list\n		*3.3.8* #2063, #2064, #2065, #2066, #2067, #2068, #2069\n		*3.3.7.1* dependency to 2.5\n		*3.3.7* #2889 add optional feature codes linked to recordings to be able to easily change\n		*3.3.6.2* #2604, #2843 fix mal-formed html tags, Russian Translation\n		*3.3.6.1* #2591, enhance code so bad directory copy errors are reported\n		*3.3.6* it translations, removed legacy ext-recordings left in error\n		*3.3.5.4* #2426 remove non-functioning download link\n		*3.3.5.3* #2409 syntax error in audio.php could cause playback problems\n		*3.3.5.2* #2016 allow amportal.conf AMPLAYKEY override hardcoded crypt key\n		*3.3.5.1* CHANGELOG TRUNCATED See SVN Repository\n	</changelog>\n	<menuitems>\n		<recordings>System Recordings</recordings>\n	</menuitems>\n	<depends>\n		<version>2.5.0alpha1</version>\n	</depends>\n	<location>release/2.5/recordings-3.3.8.10.tgz</location>\n	<md5sum>2c47c95bf2de23c1a2fcf2f0566b8126</md5sum>\n</module><module>\n	<rawname>miscapps</rawname>\n	<name>Misc Applications</name>\n	<version>2.5.0.4</version>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<description>\n		Adds the ability to create feature codes that can go to any FreePBX destination (such as an IVR or queue)\n	</description>\n	<menuitems>\n		<miscapps>Misc Applications</miscapps>\n	</menuitems>\n	<changelog>\n		*2.5.0.4* localization updates\n		*2.5.0.3* localization enclosures, spelling\n		*2.5.0.2* spelling, Swedish\n		*2.5.0.1* #3138 Sqlite3 fixes\n		*2.5.0* #2845 tabindex\n		*2.4.0.2* #2843 Russian Translation\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* Extension / dest registry, it translation\n		*0.2.3.5* #2305 Feature Status broken\n		*0.2.3.3* fixed some undefined variables, bump for rc1\n		*0.2.3.2* #2177: removed apparently corrupted newline at end of file\n		*0.2.3.1* added proper uninstall, removes any feature codes and then table\n		*0.2.3* #1902 miscapp always sets/pulls default code now regardless of custom override in featurecodes\n		*0.2.2* added SQLite3 support, fixes http://freepbx.org/trac/ticket/1775\n		*0.2.1.1* changed freePBX to FreePBX\n		*0.2.1* merge findmefollow/core extension destinations if any\n		*0.2* Fix bug with adding new apps\n		*0.1.1* Fixed publish location for trunk/2.3 repository\n	</changelog>\n	<depends>\n		<version>2.4.0</version>\n	</depends>\n	<location>release/2.5/miscapps-2.5.0.4.tgz</location>\n	<md5sum>fb948ee34732cf37f3136d98239668d7</md5sum>\n</module><module>\n	<rawname>dundicheck</rawname>\n	<name>DUNDi Lookup Registry</name>\n	<version>2.5.0.1</version>\n	<changelog>\n		*2.5.0.1* localization updates\n		*2.5.0* #2918 First release\n	</changelog>\n	<description>\n		This module will check all configured and enabled DUNDi trunks as part of the extension registry function, and report back conflicts if\n		other sites have the same extensions. This does not filter against the route patterns - it will take any number being created and\n		report a conflict if that turnk could be used to call that number.\n	</description>\n	<type>tool</type>\n	<menuitems>\n		<dundicheck>DUNDi Lookup</dundicheck>\n	</menuitems>\n	<depends>\n		<version>2.4.0</version>\n	</depends>\n	<category>System Administration</category>\n	<location>release/2.5/dundicheck-2.5.0.1.tgz</location>\n	<md5sum>85d438f5739b6d2df43711cc9c3b6429</md5sum>\n</module><module>\n	<rawname>dictate</rawname>\n	<name>Dictation</name>\n	<version>2.5.0.3</version>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<changelog>\n		*2.5.0.3* localization updates\n		*2.5.0.2* localization string enclosures\n		*2.5.0.1* #2530 typo _GLOBALS should be GLOBALS\n		*2.5.0* typo in $_GLOBALS variable\n		*2.4.0* abort if user/extension conflict and move hook after user/extnesion hook\n		*1.1.2.3* #2312 fix dictate in devicesandusers mode\n		*1.1.2.2* changed categories\n		*1.1.2.1* bump for rc1\n		*1.1.2* changed ${CALLERID(number)} to ${AMPUSER} to accomodate CID number masquerading\n		*1.1.1* Fix for Dictation not appearing on User page when in Device and User mode.\n		*1.1* Fix changes not sticking when creating an extension, replace Rob-sounds with Allison-sounds.\n		*1.0.1* Replaced \'invalid extension\' with \'feature not available on this line\' when disabled\n		*1.0.0* Original Release\n	</changelog>\n	<description>This uses the app_dictate module of Asterisk to let users record dictate into their phones. When complete, the dictations can be emailed to an email address specified in the extension page.</description>\n	<location>release/2.5/dictate-2.5.0.3.tgz</location>\n	<md5sum>ea8d8e0bb4679766d564221c8929d276</md5sum>\n</module><module>\n	<rawname>weakpasswords</rawname>\n	<name>Weak Password Detection</name>\n	<version>2.5.0.4</version>\n	<type>tool</type>\n	<category>System Administration</category>\n	<changelog>\n		*2.5.0.4* #3735, localizations\n		*2.5.0.3* #3663\n		*2.5.0.2* changes to warning msg, moved to Tools tab, System Administration\n		*2.5.0.1* Consolidated individual security notices to a single notice with all details in extended text\n		*2.5.0.0* Initial release\n	</changelog>\n	<depends>\n		<version>2.5.0</version>\n	</depends>\n	<description>This module detects weak SIP secrets and sets security notifictions accordingly\n	</description>\n	<menuitems>\n		<weakpasswords>Weak Password Detection</weakpasswords>\n	</menuitems>\n	<location>release/2.5/weakpasswords-2.5.0.4.tgz</location>\n	<md5sum>cd0a0b1d0bef263ec69e844a75dd103d</md5sum>\n</module><module>\n	<rawname>pinsets</rawname>\n	<name>PIN Sets</name>\n	<version>2.5.0.2</version>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<description>Allow creation of lists of PINs (numbers for passwords) that can be used by other modules (eg, trunks).</description>\n	<changelog>\n		*2.5.0.2* localization updates\n		*2.5.0.1* #3240, #3258\n		*2.5.0* #2845, #2764 tabindex\n		*2.4.0.1* #2843 Russian Translation\n		*2.4.0* bump for 2.4\n		*1.2.3* #2393 add support for pinless dialing\n		*1.2.2.2* #2172 deprecated use of |\n		*1.2.2.1* bump for rc1\n		*1.2.2* Put None label in menu hook\n		*1.2.1* #1770 added proper uninstall\n		*1.2* Add SQLite3 support, fixes http://freepbx.org/trac/ticket/1778\n		*1.1* Add he_IL translation, add naftali5\'s fixes where pinsets were being lost when moved around.\n		*1.0.11* Stop potential error where a random pinset is appearing when creating a new trunk\n	</changelog>\n	<menuitems>\n		<pinsets>PIN Sets</pinsets>\n	</menuitems>\n	<location>release/2.5/pinsets-2.5.0.2.tgz</location>\n	<md5sum>7106657cab690deb502452aab4fd9b81</md5sum>\n</module><module>\n	<rawname>findmefollow</rawname>\n	<name>Follow Me</name>\n	<version>2.5.1.8</version>\n	<changelog>\n		*2.5.1.8* #3380, localization updates\n		*2.5.1.7* #3274, localization string enclosures\n		*2.5.1.6* #3246, #3215, localization fixes\n		*2.5.1.5* #3222 sqlite3\n		*2.5.1.4* localization, Swedish\n		*2.5.1.3* #3177 don\'t auto-add vmbox dest to users with novm\n		*2.5.1.2* #3152, #3165, set voicemail as default dest on new followme\n		*2.5.1.1* #2987, #3006, #3029 sqlite3 install, spelling, cidprefix missing fix\n		*2.5.1* #2065 Migrate recordings to recording ids\n		*2.5.0.1* #2391, #2908, #2845, #1791, added delete and add icons\n		*2.5.0* Add enable/disable featurecode with blf support, new confirmation sound file announces cid availability\n		*2.4.14.2* #2604, #2843 fix mal-formed html tags, Russian Translation\n		*2.4.14.1* added depends on 2.4.0\n		*2.4.14* Extension/dest registry, extension quickpick, added hunt strategy with confirmation, it trans, formatting changes\n		*2.4.13.2* #2193 moh path hardcoded\n		*2.4.13.1* bump for rc1\n		*2.4.13* added xml attribute needsenginedb, #1961 enabled to work with extension numbers leading with 0s\n		*2.4.12.3* #2057 don\'t strip CID prefix if no prefix is being added\n		*2.4.12.2* merge findmefollow/core extension destinations if any, and remove findmefollow destinations as a destination since they are handled by core\n		*2.4.12.1* #2002 IF() statement can\'t handle : in the string and can\'t escape them anyhow\n		*2.4.12* CHANGELOG TRUNCATED See SVN Repository\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n		<module>recordings ge 3.3.8</module>\n	</depends>\n	<type>setup</type>\n	<category>Inbound Call Control</category>\n	<description>\n		Much like a ring group, but works on individual extensions. When someone calls the extension, it can be setup to ring for a number of seconds before trying to ring other extensions and/or external numbers, or to ring all at once, or in other various \'hunt\' configurations. Most commonly used to ring someone\'s cell phone if they don\'t answer their extension.\n	</description>\n	<menuitems>\n		<findmefollow needsenginedb=\"yes\">Follow Me</findmefollow>\n	</menuitems>\n	<location>release/2.5/findmefollow-2.5.1.8.tgz</location>\n	<md5sum>5763845c1aa269c7f5a592ba016cf190</md5sum>\n</module><module>\n	<rawname>queues</rawname>\n	<name>Queues</name>\n	<version>2.5.4.8</version>\n	<type>setup</type>\n	<category>Inbound Call Control</category>\n	<description>\n		Creates a queue where calls are placed on hold and answered on a first-in, first-out basis. Many options are available, including ring strategy for agents, caller announcements, max wait times, etc.\n	</description>\n	<changelog>\n		*2.5.4.8* #3664\n		*2.5.4.7* #3618, localization udpates\n		*2.5.4.6* localization updates\n		*2.5.4.5* #3400, #3380, various translations\n		*2.5.4.4* #3242, #3230, localization fixes\n		*2.5.4.3* #3222 sqlite3\n		*2.5.4.2* #3200 and localization string fixes\n		*2.5.4.1* #3171 and localize queues_timeString()\n		*2.5.4* #3138, #3147 add the Queues App n option as Retry alternative, see tooltip\n		*2.5.3* #3098 WARNING: subtle queue behavior might change: set persistenetmembers=yes so dynamic agents are retained on asterisk restarting, and added option for autofill\n		*2.5.2.4* #3069 add queue weight option to queues\n		*2.5.2.3* #3083, setting ringinuse causes transfered call to keep agent as unavailable, removing since it is not needed for FreePBX standard agents\n		*2.5.2.2* #2987, #3010 sqlite3 install script, spelling\n		*2.5.2.1* #2970 periodic-announce message not being configured (re #2068 change)\n		*2.5.2* #2073 add a Queue hold time CID prepend to report how long the caller has been holding\n		*2.5.1* #2068 recordings_id, don\'t list IVRs with compound messages\n		*2.5.0.1* #2875, #2768\n		*2.5.0.0* #2976 Add Optional Regex to filter user agent numbers that they can input\n		*2.4.0.8* #2757 allow spaces and other alphanumeric characters in description\n		*2.4.0.7* #2604, #2707, #2843 fix mal-formed html tags, typo, Russian Translation, add oldstyle module hook\n		*2.4.0.6* added depends on 2.4.0\n		*2.4.0.5* #2637, monitor-join=yes not supported in asterisk 1.6\n		*2.4.0.4* #2636 Queues Options member status allways show No\n		*2.4.0.3* #2579 added strict to joinempty and leavewhenempy, #2627 ringing box ignored\n		*2.4.0.2* #2528 add context = \'ext-queues\' when getting destination statement\n		*2.4.0.1* added out() and outn() to install script\n		*2.4.0* Migration from legacy tables, added queues_conf class, Extension/dest registry, #2282, #2487, it translations\n		*2.4.0* CHANGELOG TRUNCATED See SVN Repository\n	</changelog>\n	<depends>\n		<version>2.5.0alpha1</version>\n		<module>recordings ge 3.3.8</module>\n	</depends>\n	<menuitems>\n		<queues>Queues</queues>\n	</menuitems>\n	<location>release/2.5/queues-2.5.4.8.tgz</location>\n	<md5sum>86b9bbad22663238cc0ea7f0d181870e</md5sum>\n</module><module>\n	<rawname>printextensions</rawname>\n	<name>Print Extensions</name>\n	<version>2.5.0.5</version>\n	<type>tool</type>\n	<category>Third Party Addon</category>\n	<description>Creates a printable list of names and extension numbers</description>\n	<menuitems>\n		<printextensions>Print Extensions</printextensions>\n	</menuitems>\n	<changelog>\n		*2.5.0.5* #3662\n		*2.5.0.4* localization updates\n		*2.5.0.3* fixes to get localization working from other module domains\n		*2.5.0.2* formating cleanup, code removed\n		*2.5.0.1* right justify Extension heading\n		*2.5.0* remove directdid (no longer in 2.5), change to provide full PBX extension layout\n		*2.4.0* it translations, bump for 2.4\n		*1.3.2* Fixed uninizialized variable errors, bump for rc1\n		*1.3.1* Add he_IL translation\n	</changelog>\n	<location>release/2.5/printextensions-2.5.0.5.tgz</location>\n	<md5sum>562deb5fffd1650ac5844a9b4e7f09bb</md5sum>\n</module><module>\n	<rawname>logfiles</rawname>\n	<name>Asterisk Logfiles</name>\n	<version>2.5.0.2</version>\n	<changelog>\n		*2.5.0.2* #3645\n		*2.5.0.1* localization updates\n		*2.5.0* #2776: filter out potentially bad html tags from log file\n		*2.4.0* bumped for 2.4\n		*1.1.1* bump for rc1\n		*1.1.0* #1442 remove access problem and have log display in same window\n		*1.0.2* #2070 fix proper use of script tags\n	</changelog>\n	<type>tool</type>\n	<category>Support</category>\n	<menuitems>\n		<logfiles>Asterisk Logfiles</logfiles>\n	</menuitems>\n	<location>release/2.5/logfiles-2.5.0.2.tgz</location>\n	<md5sum>adde69759c6f72491c8a73632bb7371a</md5sum>\n</module><module>\n	<rawname>javassh</rawname>\n	<name>Java SSH</name>\n	<version>2.5.0.2</version>\n	<type>tool</type>\n	<category>System Administration</category>\n	<description>Provides a Java applet to access the system shell using SSH</description>\n	<menuitems>\n		<javassh>Java SSH</javassh>\n	</menuitems>\n	<changelog>\n		*2.5.0.2* security setting updates: r7432\n		*2.5.0.1* localization updates\n		*2.5.0* localization fixes, Swedish\n		*2.4.0* bump for 2.4\n		*1.0.1.1* bump for rc1\n		*1.0.1* First Changelog\n	</changelog>\n	<location>release/2.5/javassh-2.5.0.2.tgz</location>\n	<md5sum>83b03641bfbab932bec3a190afe431a3</md5sum>\n</module><module>\n	<rawname>paging</rawname>\n	<name>Paging and Intercom</name>\n	<version>2.5.0.7</version>\n	<type>setup</type>\n	<category>Internal Options &amp; Configuration</category>\n	<changelog>\n		*2.5.0.7* #3448, localization updates\n		*2.5.0.6* localization fixes\n		*2.5.0.5* #3208, localization\n		*2.5.0.4* #3138 Sqlite3 fixes\n		*2.5.0.3* #2530 typo _GLOBALS should be GLOBALS\n		*2.5.0.2* #2987, #3008 sqlite3 install script, spelling\n		*2.5.0.1* fix to make sure SIPURI is clear if not default set\n		*2.5.0.0* #2390, #2723 added configurable dial options (so beep can be removed), VXML_URL and any other custom channel variableoption to autoanswer\n		*2.4.0.5* #1939, #2843 Mitel Phone Support, Russian Translation, oldstyle module hooks added\n		*2.4.0.4* #2758 don\'t show intercom instructions when disabled, bogus codes were displayed\n		*2.4.0.3* added depends on 2.4.0\n		*2.4.0.2* small fix so duplicate extension link is displayed when conflicts are found\n		*2.4.0.1* #2559 typo in install script, extra \\\\ needed (you must un-install and re-install or delete paging_autoanswer table entries to take effect)\n		*2.4.0* CHANGELOG TRUNCATED See SVN Repository\n	</changelog>\n	<depends>\n		<version>2.4.0</version>\n	</depends>\n	<description>Allows creation of paging groups to make announcements using the speaker built into most SIP phones.\n	Also creates an Intercom feature code that can be used as a prefix to talk directly to one person, as well as optional feature codes to block/allow intercom calls to all users as well as blocking specific users or only allowing specific users.</description>\n	<menuitems>\n		<paging>Paging and Intercom</paging>\n	</menuitems>\n	<location>release/2.5/paging-2.5.0.7.tgz</location>\n	<md5sum>3784682548ac9434307c538ace367ff5</md5sum>\n</module><module>\n	<rawname>dashboard</rawname>\n	<name>System Dashboard</name>\n	<version>2.5.0.7</version>\n	<candisable>no</candisable>\n	<canuninstall>no</canuninstall>\n	<type>tool</type>\n	<category>Basic</category>\n	<description>\n		Provides a system information dashboard, showing information about Calls, CPU, Memory, Disks, Network, and processes.\n	</description>\n	<menuitems>\n		<dashboard1 access=\"all\" category=\"Admin\" display=\"index\" sort=\"-10\" type=\"tool\">System Status</dashboard1>\n		<dashboard2 access=\"all\" category=\"Admin\" display=\"index\" sort=\"-10\" type=\"setup\">System Status</dashboard2>\n	</menuitems>\n	<depends>\n		<version>2.3.0beta2</version>\n	</depends>\n	<changelog>\n		*2.5.0.7* #3652, localization updates\n		*2.5.0.6* #3409, localization fixes, updates\n		*2.5.0.5* #3404 correction\n		*2.5.0.4* #3401, #3404\n		*2.5.0.3* #3348, localizations\n		*2.5.0.2* localization string enclosures\n		*2.5.0.1* #3170, Swedish Translation\n		*2.5.0* #3134 add amportal DASHBOARD_STATS_UPDATE_TIME, DASHBOARD_INFO_UPDATE_TIME\n		*2.4.0.3* #2871 do not show Sangoma wanpipe interfaces in the Network Stats\n		*2.4.0.2* #2701, #2843 add proper JSON header to fix some proxy servers, Russian Translation\n		*2.4.0.1* #2620 adjust to new format of core_trunks_list(true)\n		*2.4.0* #2415 1.6 support, #2301, it translation\n		*0.3.3.3* #2365 don\'t make readonly disk devices red when 100%\n		*0.3.3.2* #2469 fix division my zero in cpu usage\n		*0.3.3.1* Cosmetic fix (#2278 - long mount point paths)\n		*0.3.3* Improved detection of webserver failing, More MySQL detection fixes\n		*0.3.2.1* #2246 make FreePBX Connections visible, #2250 check for SSHPORT\n		*0.3.2* Allow mysql server to be on another host/port (#2229), fix image path problem\n		*0.3.1* Fix issue with miscounting total registrations, minor styling details\n		*0.3* Show IP phones and trunks separately (#2209)\n		*0.2.5.4* make always accessible even in database mode, fix minor javascript bug\n		*0.2.5.3* remove deprecated javascript call\n		*0.2.5.2* #2194 don\'t fail when Asterisk is not running\n		*0.2.5.1* disable debug logging, make uninstallable\n		*0.2.5* #2142 fix online phones for Asterisk 1.4 format, #2140 divide by 0 again\n		*0.2.4* #2133 again, #2140 divide by 0, #2141 with temp log to determine real issue\n		*0.2.3* #2133 fixed number format error resulting in bogus percentage displays\n		*0.2.2* #2131 fix Undefined Index warnings\n		*0.2.1* make module permanent, should not be able to disable\n		*0.2.0* Add real-time updates\n		*0.1.0* Initial release\n	</changelog>\n	<location>release/2.5/dashboard-2.5.0.7.tgz</location>\n	<md5sum>ed8debccaee4e64f04b428a14f9da8e5</md5sum>\n</module><module>\n	<rawname>customerdb</rawname>\n	<name>Customer DB</name>\n	<version>2.5.0.4</version>\n	<type>tool</type>\n	<category>Third Party Addon</category>\n	<menuitems>\n		<customerdb>Customer DB</customerdb>\n	</menuitems>\n	<changelog>\n		*2.5.0.4* localization updates\n		*2.5.0.3* localization enclosures\n		*2.5.0.2* #2987 sqlite3 install script changes\n		*2.5.0.1* #2781 allow sqlite table creation\n		*2.5.0* #2845 tabindex\n		*2.4.0* it translations, bump for 2.4\n		*1.2.3.1* bump for rc1\n		*1.2.3* Add he_IL translation\n	</changelog>\n	<location>release/2.5/customerdb-2.5.0.4.tgz</location>\n	<md5sum>36189a8f2d21d9a43845c5fb2530118d</md5sum>\n</module><module>\n	<rawname>voicemail</rawname>\n	<name>Voicemail</name>\n	<version>2.5.1.6</version>\n	<candisable>no</candisable>\n	<canuninstall>no</canuninstall>\n	<changelog>\n		*2.5.1.6* localization updates\n		*2.5.1.5* #3399 and language updates\n		*2.5.1.4* localization string enclosures\n		*2.5.1.3* localization fixes\n		*2.5.1.2* #3191 unitialized var, localization\n		*2.5.1.1* #3152 uninitialized variable bug\n		*2.5.1* #3099 allows a return to IVR from voicemail option\n		*2.5.0.2* #3013, #2530 spelling, typo _GLOBALS should be GLOBALS and cleanup display when users/extension conflicts occur\n		*2.5.0.1* #2973 enable javascript to enable/disable voicemail and vmx fields when creating extension\n		*2.5.0* #2754, #2903, #2785, #2647, #2593 Added VmX config, added O extension config, better javascript interactions\n		*2.4.0.1* added depends on 2.4.0\n		*2.4.0* #2457 vm dial code to vmexten in sip_general_additional.conf, make hooks abort if extension confilct, misc fixes\n		*2.0.3.4* Fix some labeling and make localization friendly\n		*2.0.3.3* #2232 call to VoiceMailMain() need ${AMPUSER} was fixed wrong\n		*2.0.3.2* CHANGELOG TRUNCATED See SVN Repository\n	</changelog>\n	<description>This module allows you to configure Voicemail for a user or extension</description>\n	<type>setup</type>\n	<category>Basic</category>\n	<depends>\n		<version>2.5.0alpha1</version>\n	</depends>\n	<location>release/2.5/voicemail-2.5.1.6.tgz</location>\n	<md5sum>6bfd5ce88b083bf9fa2ceb6d8ef6cea1</md5sum>\n</module></xml>');
/*!40000 ALTER TABLE `module_xml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `modules` (
  `id` int(11) NOT NULL auto_increment,
  `modulename` varchar(50) NOT NULL default '',
  `version` varchar(20) NOT NULL default '',
  `enabled` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'parking','2.5.1.4',1),(2,'recordings','3.3.8.10',1),(3,'callforward','2.5.0.2',1),(4,'callwaiting','2.5.0.1',1),(5,'customappsreg','2.5.0.5',1),(6,'disa','2.5.1.8',1),(7,'ringgroups','2.5.1.9',1),(8,'phonebook','2.5.0.3',1),(9,'blacklist','2.5.0.5',1),(10,'voicemail','2.5.1.6',1),(11,'timeconditions','2.5.0.9',1),(12,'pinsets','2.5.0.2',1),(13,'fw_fop','2.5.0.2',1),(14,'support','1.0.0',1),(15,'speeddial','2.5.0.1',1),(16,'infoservices','2.5.0.2',1),(17,'daynight','2.5.0.12',1),(18,'cidlookup','2.5.0.7',1),(19,'queues','2.5.4.8',1),(20,'conferences','2.5.1.7',1),(21,'languages','2.5.0.8',1),(22,'music','2.5.1.3',1),(23,'fw_ari','5.5.2',1),(24,'ivr','2.5.20.8',1),(25,'featurecodeadmin','2.5.0.4',1),(26,'vmblast','2.5.0.5',1),(27,'dashboard','2.5.0.7',1),(28,'donotdisturb','2.5.0.6',1),(29,'core','5.5.2.4',1),(30,'pbdirectory','2.5.0.1',1),(31,'announcement','2.5.1.9',1),(32,'printextensions','2.5.0.5',1),(33,'weakpasswords','2.5.0.4',1),(34,'framework','2.5.2.3',1),(35,'findmefollow','2.5.1.8',1),(36,'paging','2.5.0.7',1),(37,'dundicheck','2.5.0.1',1);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notifications` (
  `module` varchar(24) NOT NULL default '',
  `id` varchar(24) NOT NULL default '',
  `level` int(11) NOT NULL default '0',
  `display_text` varchar(255) NOT NULL default '',
  `extended_text` blob NOT NULL,
  `link` varchar(255) NOT NULL default '',
  `reset` tinyint(4) NOT NULL default '0',
  `candelete` tinyint(4) NOT NULL default '0',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`module`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('weakpasswords','all',200,'2 extensions/trunks have weak secrets','Warning: The use of weak SIP/IAX passwords can compromise this system resulting in toll theft of your telephony service.  You should change the reported devices and trunks to use strong secrets.<br /><br />Extension: 200 / Secret less than 6 digits<br>Extension: 300 / Secret less than 6 digits<br>','',1,0,1284599512);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paging_autoanswer`
--

DROP TABLE IF EXISTS `paging_autoanswer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `paging_autoanswer` (
  `useragent` varchar(255) NOT NULL,
  `var` varchar(20) NOT NULL,
  `setting` varchar(255) NOT NULL,
  PRIMARY KEY  (`useragent`,`var`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `paging_autoanswer`
--

LOCK TABLES `paging_autoanswer` WRITE;
/*!40000 ALTER TABLE `paging_autoanswer` DISABLE KEYS */;
INSERT INTO `paging_autoanswer` VALUES ('default','CALLINFO','Call-Info: <uri>\\;answer-after=0'),('default','ALERTINFO','Alert-Info: Ring Answer'),('default','SIPURI','intercom=true'),('Mitel','CALLINFO','Call-Info: <sip:broadworks.net>\\;answer-after=0');
/*!40000 ALTER TABLE `paging_autoanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paging_config`
--

DROP TABLE IF EXISTS `paging_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `paging_config` (
  `page_group` varchar(255) NOT NULL default '',
  `force_page` int(1) NOT NULL,
  `duplex` int(1) NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`page_group`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `paging_config`
--

LOCK TABLES `paging_config` WRITE;
/*!40000 ALTER TABLE `paging_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `paging_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paging_groups`
--

DROP TABLE IF EXISTS `paging_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `paging_groups` (
  `page_number` varchar(50) NOT NULL default '',
  `ext` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`page_number`,`ext`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `paging_groups`
--

LOCK TABLES `paging_groups` WRITE;
/*!40000 ALTER TABLE `paging_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `paging_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkinglot`
--

DROP TABLE IF EXISTS `parkinglot`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `parkinglot` (
  `id` varchar(20) NOT NULL default '1',
  `keyword` varchar(40) NOT NULL default '',
  `data` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`id`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `parkinglot`
--

LOCK TABLES `parkinglot` WRITE;
/*!40000 ALTER TABLE `parkinglot` DISABLE KEYS */;
/*!40000 ALTER TABLE `parkinglot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pinsets`
--

DROP TABLE IF EXISTS `pinsets`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pinsets` (
  `pinsets_id` int(11) NOT NULL auto_increment,
  `passwords` longtext,
  `description` varchar(50) default NULL,
  `addtocdr` tinyint(1) default NULL,
  `deptname` varchar(50) default NULL,
  `used_by` varchar(255) default NULL,
  PRIMARY KEY  (`pinsets_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pinsets`
--

LOCK TABLES `pinsets` WRITE;
/*!40000 ALTER TABLE `pinsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `pinsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queues_config`
--

DROP TABLE IF EXISTS `queues_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `queues_config` (
  `extension` varchar(20) NOT NULL default '',
  `descr` varchar(35) NOT NULL default '',
  `grppre` varchar(100) NOT NULL default '',
  `alertinfo` varchar(254) NOT NULL default '',
  `ringing` tinyint(1) NOT NULL default '0',
  `maxwait` varchar(8) NOT NULL default '',
  `password` varchar(20) NOT NULL default '',
  `ivr_id` varchar(8) NOT NULL default '0',
  `dest` varchar(50) NOT NULL default '',
  `cwignore` tinyint(1) NOT NULL default '0',
  `qregex` varchar(255) default NULL,
  `agentannounce_id` int(11) default NULL,
  `joinannounce_id` int(11) default NULL,
  `queuewait` tinyint(1) default '0',
  PRIMARY KEY  (`extension`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `queues_config`
--

LOCK TABLES `queues_config` WRITE;
/*!40000 ALTER TABLE `queues_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `queues_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queues_details`
--

DROP TABLE IF EXISTS `queues_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `queues_details` (
  `id` varchar(45) NOT NULL default '-1',
  `keyword` varchar(30) NOT NULL default '',
  `data` varchar(150) NOT NULL default '',
  `flags` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`,`keyword`,`data`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `queues_details`
--

LOCK TABLES `queues_details` WRITE;
/*!40000 ALTER TABLE `queues_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `queues_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recordings`
--

DROP TABLE IF EXISTS `recordings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `recordings` (
  `id` int(11) NOT NULL auto_increment,
  `displayname` varchar(50) default NULL,
  `filename` blob,
  `description` varchar(254) default NULL,
  `fcode` tinyint(1) default '0',
  `fcode_pass` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `recordings`
--

LOCK TABLES `recordings` WRITE;
/*!40000 ALTER TABLE `recordings` DISABLE KEYS */;
INSERT INTO `recordings` VALUES (1,'__invalid','install done','',0,NULL),(2,'vm-no-box','custom/vm-no-box','No long description available',0,NULL),(3,'would-you-like-to-connect','custom/would-you-like-to-connect','No long description available',0,NULL),(4,'vm-you-no-box','custom/vm-you-no-box','No long description available',0,NULL),(5,'temporary-message-saved','custom/temporary-message-saved','No long description available',0,NULL),(6,'temporary-message-restricted','custom/temporary-message-restricted','No long description available',0,NULL),(7,'welcome-back','custom/welcome-back','No long description available',0,NULL);
/*!40000 ALTER TABLE `recordings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ringgroups`
--

DROP TABLE IF EXISTS `ringgroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ringgroups` (
  `grpnum` varchar(20) NOT NULL,
  `strategy` varchar(50) NOT NULL,
  `grptime` smallint(6) NOT NULL,
  `grppre` varchar(100) default NULL,
  `grplist` varchar(255) NOT NULL,
  `annmsg_id` int(11) default NULL,
  `postdest` varchar(255) default NULL,
  `description` varchar(35) NOT NULL,
  `alertinfo` varchar(255) default NULL,
  `remotealert_id` int(11) default NULL,
  `needsconf` varchar(10) default NULL,
  `toolate_id` int(11) default NULL,
  `ringing` varchar(80) default NULL,
  `cwignore` varchar(10) default NULL,
  `cfignore` varchar(10) default NULL,
  PRIMARY KEY  (`grpnum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ringgroups`
--

LOCK TABLES `ringgroups` WRITE;
/*!40000 ALTER TABLE `ringgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ringgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sip`
--

DROP TABLE IF EXISTS `sip`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sip` (
  `id` varchar(20) NOT NULL default '-1',
  `keyword` varchar(30) NOT NULL default '',
  `data` varchar(255) NOT NULL,
  `flags` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sip`
--

LOCK TABLES `sip` WRITE;
/*!40000 ALTER TABLE `sip` DISABLE KEYS */;
INSERT INTO `sip` VALUES ('500','canreinvite','no',0),('500','context','from-internal',0),('500','host','dynamic',0),('500','type','friend',0),('500','secret','alks5409asepli4',0),('500','dtmfmode','rfc2833',0),('400','secret','Skn43*k2bSo$',0),('300','record_out','Adhoc',0),('300','record_in','Adhoc',0),('300','callerid','device <300>',0),('300','account','300',0),('300','permit','0.0.0.0/0.0.0.0',0),('300','deny','0.0.0.0/0.0.0.0',0),('300','mailbox','300@device',0),('300','accountcode','',0),('300','dial','SIP/300',0),('300','allow','ulaw&gsm',0),('300','disallow','',0),('300','pickupgroup','',0),('300','callgroup','',0),('200','account','200',0),('200','permit','0.0.0.0/0.0.0.0',0),('200','deny','0.0.0.0/0.0.0.0',0),('200','mailbox','200@default',0),('200','accountcode','',0),('200','dial','SIP/200',0),('200','allow','',0),('200','disallow','',0),('200','pickupgroup','',0),('200','callgroup','',0),('200','qualify','yes',0),('200','port','5060',0),('200','nat','yes',0),('200','type','friend',0),('200','host','dynamic',0),('200','context','from-internal',0),('200','canreinvite','no',0),('200','dtmfmode','inband',0),('200','secret','homE',0),('201','account','201',0),('201','permit','0.0.0.0/0.0.0.0',0),('201','deny','0.0.0.0/0.0.0.0',0),('201','mailbox','201@device',0),('201','accountcode','',0),('201','dial','SIP/201',0),('201','allow','',0),('201','disallow','',0),('201','pickupgroup','',0),('201','callgroup','',0),('201','qualify','yes',0),('201','port','5060',0),('201','nat','yes',0),('201','type','friend',0),('201','host','dynamic',0),('201','context','from-internal',0),('201','canreinvite','no',0),('201','dtmfmode','inband',0),('500','nat','yes',0),('500','port','5060',0),('500','qualify','yes',0),('500','callgroup','',0),('300','qualify','yes',0),('300','port','5060',0),('300','type','friend',0),('300','nat','yes',0),('300','host','dynamic',0),('300','context','from-internal',0),('300','canreinvite','no',0),('300','dtmfmode','inband',0),('300','secret','dad',0),('201','callerid','device <201>',0),('201','secret','S04Als-34Sl2*',0),('200','callerid','device <200>',0),('200','record_in','Adhoc',0),('200','record_out','Adhoc',0),('201','record_in','Adhoc',0),('201','record_out','Adhoc',0),('400','dtmfmode','inband',0),('400','canreinvite','no',0),('400','context','from-internal',0),('400','host','dynamic',0),('400','type','friend',0),('400','nat','yes',0),('400','port','5060',0),('400','qualify','yes',0),('400','callgroup','',0),('400','pickupgroup','',0),('400','disallow','',0),('400','allow','',0),('400','dial','SIP/400',0),('400','accountcode','',0),('400','mailbox','400@device',0),('400','deny','0.0.0.0/0.0.0.0',0),('400','permit','0.0.0.0/0.0.0.0',0),('400','account','400',0),('400','callerid','device <400>',0),('400','record_in','Adhoc',0),('400','record_out','Adhoc',0),('99993','account','unlimitednet-primary',2),('99993','username','zeewayservices',3),('99993','defaultuser','zeewayservices',4),('99993','secret','oiuasef#90yuw3',5),('99993','type','friend',6),('99993','qualify','yes',7),('99993','insecure','invite',8),('99993','host','sip3.sbndin.unlimitednet.us',9),('99993','context','from-pstn',10),('99994','account','unlimitednet-secondary',2),('99994','username','zeewayservices',3),('99994','defaultuser','zeewayservices',4),('99994','secret','oiuasef#90yuw3',5),('99994','type','friend',6),('99994','qualify','yes',7),('99994','insecure','invite',8),('99994','host','sip1.sbndin.unlimitednet.us',9),('99994','context','from-trunk',10),('500','pickupgroup','',0),('500','disallow','',0),('500','allow','',0),('500','dial','SIP/500',0),('500','accountcode','',0),('500','mailbox','500@device',0),('500','deny','0.0.0.0/0.0.0.0',0),('500','permit','0.0.0.0/0.0.0.0',0),('500','account','500',0),('500','callerid','device <500>',0),('500','record_in','Adhoc',0),('500','record_out','Adhoc',0),('202','secret','Ph0ned4rk',0),('202','dtmfmode','rfc2833',0),('202','canreinvite','no',0),('202','context','from-internal',0),('202','host','dynamic',0),('202','type','friend',0),('202','nat','yes',0),('202','port','5060',0),('202','qualify','yes',0),('202','callgroup','',0),('202','pickupgroup','',0),('202','disallow','',0),('202','allow','',0),('202','dial','SIP/202',0),('202','accountcode','',0),('202','mailbox','202@device',0),('202','deny','0.0.0.0/0.0.0.0',0),('202','permit','0.0.0.0/0.0.0.0',0),('202','account','202',0),('202','callerid','device <202>',0),('202','record_in','Adhoc',0),('202','record_out','Adhoc',0);
/*!40000 ALTER TABLE `sip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeconditions`
--

DROP TABLE IF EXISTS `timeconditions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `timeconditions` (
  `timeconditions_id` int(11) NOT NULL auto_increment,
  `displayname` varchar(50) default NULL,
  `time` int(11) default NULL,
  `truegoto` varchar(50) default NULL,
  `falsegoto` varchar(50) default NULL,
  `deptname` varchar(50) default NULL,
  PRIMARY KEY  (`timeconditions_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `timeconditions`
--

LOCK TABLES `timeconditions` WRITE;
/*!40000 ALTER TABLE `timeconditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timegroups_details`
--

DROP TABLE IF EXISTS `timegroups_details`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `timegroups_details` (
  `id` int(11) NOT NULL auto_increment,
  `timegroupid` int(11) NOT NULL default '0',
  `time` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `timegroups_details`
--

LOCK TABLES `timegroups_details` WRITE;
/*!40000 ALTER TABLE `timegroups_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `timegroups_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timegroups_groups`
--

DROP TABLE IF EXISTS `timegroups_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `timegroups_groups` (
  `id` int(11) NOT NULL auto_increment,
  `description` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `display` (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `timegroups_groups`
--

LOCK TABLES `timegroups_groups` WRITE;
/*!40000 ALTER TABLE `timegroups_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `timegroups_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `extension` varchar(20) NOT NULL default '',
  `password` varchar(20) default NULL,
  `name` varchar(50) default NULL,
  `voicemail` varchar(50) default NULL,
  `ringtimer` int(3) default NULL,
  `noanswer` varchar(100) default NULL,
  `recording` varchar(50) default NULL,
  `outboundcid` varchar(50) default NULL,
  `sipname` varchar(50) default NULL,
  `mohclass` varchar(80) default 'default'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('300','','David Anderson','novm',0,'','out=Adhoc|in=Adhoc','\"David Anderson\" <3607197197>','','default'),('200','','Kris Anderson','default',0,'','out=Adhoc|in=Adhoc','\"Kris Anderson\" <2146130162>','','default'),('201','','Sam Sprain','default',0,'','out=Adhoc|in=Adhoc','\"Sam Sprain\" <3607196747>','','default'),('400','','Prayer Room - Main','novm',0,'','out=Adhoc|in=Adhoc','\"Prayer Room\" <2146130043>','','default'),('500','','Josiah Otto','novm',0,'','out=Adhoc|in=Adhoc','\"Community Outreach\" <8883330573>','','default'),('203','','Kevin Louis','novm',0,'','out=Adhoc|in=Adhoc','','','default'),('202','','Kris - Cell','novm',0,'','out=Adhoc|in=Adhoc','\"Kris Anderson\" <3607197190>','','default');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmblast`
--

DROP TABLE IF EXISTS `vmblast`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `vmblast` (
  `grpnum` int(11) NOT NULL,
  `description` varchar(35) NOT NULL,
  `audio_label` int(11) NOT NULL default '-1',
  `password` varchar(20) NOT NULL,
  PRIMARY KEY  (`grpnum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `vmblast`
--

LOCK TABLES `vmblast` WRITE;
/*!40000 ALTER TABLE `vmblast` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmblast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmblast_groups`
--

DROP TABLE IF EXISTS `vmblast_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `vmblast_groups` (
  `grpnum` varchar(50) NOT NULL default '',
  `ext` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`grpnum`,`ext`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `vmblast_groups`
--

LOCK TABLES `vmblast_groups` WRITE;
/*!40000 ALTER TABLE `vmblast_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmblast_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zap`
--

DROP TABLE IF EXISTS `zap`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `zap` (
  `id` varchar(20) NOT NULL default '-1',
  `keyword` varchar(30) NOT NULL default '',
  `data` varchar(255) NOT NULL,
  `flags` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `zap`
--

LOCK TABLES `zap` WRITE;
/*!40000 ALTER TABLE `zap` DISABLE KEYS */;
/*!40000 ALTER TABLE `zap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zapchandids`
--

DROP TABLE IF EXISTS `zapchandids`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `zapchandids` (
  `channel` int(11) NOT NULL default '0',
  `description` varchar(40) NOT NULL default '',
  `did` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `zapchandids`
--

LOCK TABLES `zapchandids` WRITE;
/*!40000 ALTER TABLE `zapchandids` DISABLE KEYS */;
/*!40000 ALTER TABLE `zapchandids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `asteriskcdrdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `asteriskcdrdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `asteriskcdrdb`;

--
-- Table structure for table `cdr`
--

DROP TABLE IF EXISTS `cdr`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cdr` (
  `calldate` datetime NOT NULL default '0000-00-00 00:00:00',
  `clid` varchar(80) NOT NULL default '',
  `src` varchar(80) NOT NULL default '',
  `dst` varchar(80) NOT NULL default '',
  `dcontext` varchar(80) NOT NULL default '',
  `channel` varchar(80) NOT NULL default '',
  `dstchannel` varchar(80) NOT NULL default '',
  `lastapp` varchar(80) NOT NULL default '',
  `lastdata` varchar(80) NOT NULL default '',
  `duration` int(11) NOT NULL default '0',
  `billsec` int(11) NOT NULL default '0',
  `disposition` varchar(45) NOT NULL default '',
  `amaflags` int(11) NOT NULL default '0',
  `accountcode` varchar(20) NOT NULL default '',
  `uniqueid` varchar(32) NOT NULL default '',
  `userfield` varchar(255) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cdr`
--

LOCK TABLES `cdr` WRITE;
/*!40000 ALTER TABLE `cdr` DISABLE KEYS */;
INSERT INTO `cdr` VALUES ('2010-05-11 13:31:05','\"2146904734\" <2146904734>','2146904734','200','from-did-direct','SIP/unlimitednet-00000000','Local/FMGL-2146904814#@from-internal-9620;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',11,0,'NO ANSWER',3,'','1273602665.0',''),('2010-05-11 13:31:06','\"2146904734\" <2146904734>','2146904734','FMPR-200','from-internal','Local/FMPR-200@from-internal-4d64;2','SIP/200-00000001','Dial','SIP/200,64,trM(auto-blkvm)',10,0,'NO ANSWER',3,'','1273602666.2',''),('2010-05-11 13:31:06','\"2146904734\" <2146904734>','2146904734','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-9620;2','Local/RG-200-2146904814#@from-internal-1c45;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',10,0,'NO ANSWER',3,'','1273602666.4',''),('2010-05-11 13:31:10','\"2146904734\" <2146904734>','2146904734','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-1c45;2','Local/2146904814@from-internal-48d2;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',6,0,'NO ANSWER',3,'','1273602670.7',''),('2010-05-11 13:31:10','2146904734','2146904734','2146904814','from-internal','Local/2146904814@from-internal-48d2;2','SIP/unlimitednet-00000002','Dial','SIP/unlimitednet/2146904814,300,',6,0,'NO ANSWER',3,'','1273602670.9',''),('2010-05-11 14:34:50','\"4692376038\" <4692376038>','4692376038','300','from-did-direct','SIP/unlimitednet-00000003','SIP/300-00000004','Dial','SIP/300,\"\",tr',42,31,'ANSWERED',3,'','1273606490.11',''),('2010-05-11 15:10:55','\"4695541211\" <4695541211>','4695541211','FMPR-200','from-internal','Local/FMPR-200@from-internal-ae69;2','SIP/200-00000006','Dial','SIP/200,64,trM(auto-blkvm)',38,0,'NO ANSWER',3,'','1273608655.15',''),('2010-05-11 15:11:00','\"4695541211\" <4695541211>','4695541211','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-3023;2','Local/2146904814@from-internal-0835;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',33,9,'ANSWERED',3,'','1273608660.20',''),('2010-05-11 15:10:55','\"4695541211\" <4695541211>','4695541211','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-1158;2','Local/RG-200-2146904814#@from-internal-3023;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',38,0,'ANSWERED',3,'','1273608655.17',''),('2010-05-11 15:11:00','4695541211','4695541211','2146904814','from-internal','Local/2146904814@from-internal-0835;2','SIP/unlimitednet-00000007','Dial','SIP/unlimitednet/2146904814,300,',49,25,'ANSWERED',3,'','1273608660.22',''),('2010-05-11 15:10:55','\"4695541211\" <4695541211>','4695541211','200','from-did-direct','SIP/unlimitednet-00000005','Local/FMGL-2146904814#@from-internal-1158;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',54,16,'ANSWERED',3,'','1273608655.13',''),('2010-05-12 07:16:34','\"2146904734\" <2146904734>','2146904734','200','from-did-direct','SIP/unlimitednet-00000000','Local/FMGL-2146904814#@from-internal-c360;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',53,0,'NO ANSWER',3,'','1273666594.0',''),('2010-05-12 07:16:35','\"2146904734\" <2146904734>','2146904734','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-c360;2','Local/RG-200-2146904814#@from-internal-2179;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',52,0,'NO ANSWER',3,'','1273666595.4',''),('2010-05-12 07:16:35','\"2146904734\" <2146904734>','2146904734','FMPR-200','from-internal','Local/FMPR-200@from-internal-8a4d;2','SIP/200-00000001','Dial','SIP/200,64,trM(auto-blkvm)',52,0,'NO ANSWER',3,'','1273666595.2',''),('2010-05-12 07:16:39','','','2146904814','from-internal','Local/2146904814@from-internal-4460;1','','MacroExit','',92,68,'ANSWERED',3,'','1273666599.8',''),('2010-05-12 07:16:39','2146904734','2146904734','2146904814','from-internal','Local/2146904814@from-internal-4460;2','SIP/unlimitednet-00000002','Dial','SIP/unlimitednet/2146904814,300,T',92,68,'ANSWERED',3,'','1273666599.9',''),('2010-05-12 07:16:39','\"2146904734\" <2146904734>','2146904734','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-2179;2','Local/2146904814@from-internal-4460;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',92,0,'NO ANSWER',3,'','1273666599.7',''),('2010-05-12 13:36:12','\"9104521000\" <9104521000>','9104521000','300','from-did-direct','SIP/unlimitednet-00000003','SIP/300-00000004','Dial','SIP/300,\"\",tr',16,0,'NO ANSWER',3,'','1273689372.11',''),('2010-05-12 13:39:18','\"9104521000\" <9104521000>','9104521000','300','from-did-direct','SIP/unlimitednet-00000005','SIP/300-00000006','Dial','SIP/300,\"\",tr',65,43,'ANSWERED',3,'','1273689558.13',''),('2010-05-12 15:05:08','\"9725570434\" <9725570434>','9725570434','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-04b1;2','Local/RG-200-2146904814#@from-internal-502e;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',34,0,'NO ANSWER',3,'','1273694708.19',''),('2010-05-12 15:05:07','\"9725570434\" <9725570434>','9725570434','200','from-did-direct','SIP/unlimitednet-00000007','Local/FMGL-2146904814#@from-internal-04b1;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',35,0,'NO ANSWER',3,'','1273694707.15',''),('2010-05-12 15:05:12','9725570434','9725570434','2146904814','from-internal','Local/2146904814@from-internal-51d5;2','SIP/unlimitednet-00000009','Dial','SIP/unlimitednet/2146904814,300,T',30,0,'NO ANSWER',3,'','1273694712.24',''),('2010-05-12 15:05:08','\"9725570434\" <9725570434>','9725570434','FMPR-200','from-internal','Local/FMPR-200@from-internal-9015;2','SIP/200-00000008','Dial','SIP/200,64,trM(auto-blkvm)',34,0,'NO ANSWER',3,'','1273694708.17',''),('2010-05-12 15:05:12','\"9725570434\" <9725570434>','9725570434','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-502e;2','Local/2146904814@from-internal-51d5;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',30,0,'NO ANSWER',3,'','1273694712.22',''),('2010-05-12 17:08:04','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000000a','SIP/unlimitednet-0000000b','Dial','SIP/unlimitednet/9893625004,300,T',38,5,'ANSWERED',3,'','1273702084.26',''),('2010-05-13 07:30:50','\"2147939864\" <2147939864>','2147939864','s','from-trunk','SIP/unlimitednet-0000000c','','Hangup','',14,14,'ANSWERED',3,'','1273753850.28',''),('2010-05-13 10:07:25','9726062592','9726062592','2146904814','from-internal','Local/2146904814@from-internal-9c5e;2','SIP/unlimitednet-0000000f','Dial','SIP/unlimitednet/2146904814,300,T',32,7,'ANSWERED',3,'','1273763245.38',''),('2010-05-13 10:07:25','','','2146904814','from-internal','Local/2146904814@from-internal-9c5e;1','','BackGround','\"incoming-call-1-accept-2-decline\",m,en,macro-confirm',32,7,'ANSWERED',3,'','1273763245.37',''),('2010-05-13 10:07:25','\"9726062592\" <9726062592>','9726062592','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-6f26;2','Local/2146904814@from-internal-9c5e;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',32,0,'NO ANSWER',3,'','1273763245.36',''),('2010-05-13 10:07:21','\"9726062592\" <9726062592>','9726062592','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-de15;2','Local/RG-200-2146904814#@from-internal-6f26;1','Hangup','',36,0,'NO ANSWER',3,'','1273763241.33',''),('2010-05-13 10:07:20','\"9726062592\" <9726062592>','9726062592','200','from-did-direct','SIP/unlimitednet-0000000d','Local/FMGL-2146904814#@from-internal-de15;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',41,0,'NO ANSWER',3,'','1273763240.29',''),('2010-05-13 10:07:21','\"9726062592\" <9726062592>','9726062592','FMPR-200','from-internal','Local/FMPR-200@from-internal-78d7;2','SIP/200-0000000e','Dial','SIP/200,64,trM(auto-blkvm)',40,0,'NO ANSWER',3,'','1273763241.31',''),('2010-05-13 10:25:45','\"Kris Anderson\" <200>','200','*97','from-internal','SIP/200-00000010','','VoiceMailMain','200@default',28,28,'ANSWERED',3,'','1273764345.40',''),('2010-05-13 11:24:42','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-00000011','SIP/300-00000012','Dial','SIP/300,\"\",tr',324,313,'ANSWERED',3,'','1273767882.41',''),('2010-05-13 12:34:59','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-00000013','','Hangup','',14,14,'ANSWERED',3,'','1273772099.43',''),('2010-05-13 13:49:31','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000014','SIP/unlimitednet-00000015','Dial','SIP/unlimitednet/9893625004,300,T',246,230,'ANSWERED',3,'','1273776571.44',''),('2010-05-13 17:32:10','4695315294','4695315294','2146904814','from-internal','Local/2146904814@from-internal-6277;2','SIP/unlimitednet-00000018','Dial','SIP/unlimitednet/2146904814,300,T',10,0,'NO ANSWER',3,'','1273789930.55',''),('2010-05-13 17:32:10','\"4695315294\" <4695315294>','4695315294','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-66e0;2','Local/2146904814@from-internal-6277;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',10,0,'NO ANSWER',3,'','1273789930.53',''),('2010-05-13 17:32:06','\"4695315294\" <4695315294>','4695315294','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-6380;2','Local/RG-200-2146904814#@from-internal-66e0;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',14,0,'NO ANSWER',3,'','1273789926.50',''),('2010-05-13 17:32:06','\"4695315294\" <4695315294>','4695315294','FMPR-200','from-internal','Local/FMPR-200@from-internal-70b9;2','SIP/200-00000017','Dial','SIP/200,64,trM(auto-blkvm)',14,0,'ANSWERED',3,'','1273789926.48',''),('2010-05-13 17:32:06','\"4695315294\" <4695315294>','4695315294','200','from-did-direct','SIP/unlimitednet-00000016','Local/FMPR-200@from-internal-70b9;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',92,78,'ANSWERED',3,'','1273789926.46',''),('2010-05-13 17:57:05','2145053574','2145053574','2146904814','from-internal','Local/2146904814@from-internal-30c3;2','SIP/unlimitednet-0000001b','Dial','SIP/unlimitednet/2146904814,300,T',10,0,'NO ANSWER',3,'','1273791425.66',''),('2010-05-13 17:57:05','\"2145053574\" <2145053574>','2145053574','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-c6b8;2','Local/2146904814@from-internal-30c3;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',10,0,'NO ANSWER',3,'','1273791425.64',''),('2010-05-13 17:57:01','\"2145053574\" <2145053574>','2145053574','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-8fd5;2','Local/RG-200-2146904814#@from-internal-c6b8;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',14,0,'NO ANSWER',3,'','1273791421.61',''),('2010-05-13 17:57:01','\"2145053574\" <2145053574>','2145053574','FMPR-200','from-internal','Local/FMPR-200@from-internal-65e1;2','SIP/200-0000001a','Dial','SIP/200,64,trM(auto-blkvm)',14,0,'ANSWERED',3,'','1273791421.59',''),('2010-05-13 17:57:01','\"2145053574\" <2145053574>','2145053574','200','from-did-direct','SIP/unlimitednet-00000019','Local/FMPR-200@from-internal-65e1;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',97,83,'ANSWERED',3,'','1273791421.57',''),('2010-05-14 15:49:44','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-0000001e','','Hangup','',14,14,'ANSWERED',3,'','1273870184.70',''),('2010-05-14 15:39:52','\"4436150686\" <4436150686>','4436150686','300','from-did-direct','SIP/unlimitednet-0000001c','SIP/300-0000001d','Dial','SIP/300,\"\",tr',871,851,'ANSWERED',3,'','1273869592.68',''),('2010-05-14 15:58:12','\"David Anderson\" <3607197197>','3607197197','4692376038','from-internal','SIP/300-0000001f','SIP/unlimitednet-00000020','Dial','SIP/unlimitednet/4692376038,300,T',80,59,'ANSWERED',3,'','1273870692.71',''),('2010-05-14 16:09:57','\"4692376038\" <4692376038>','4692376038','300','from-did-direct','SIP/unlimitednet-00000023','SIP/300-00000024','Dial','SIP/300,\"\",tr',75,66,'ANSWERED',3,'','1273871397.75',''),('2010-05-14 16:02:17','\"4436150686\" <4436150686>','4436150686','300','from-did-direct','SIP/unlimitednet-00000021','SIP/300-00000022','Dial','SIP/300,\"\",tr',552,542,'ANSWERED',3,'','1273870937.73',''),('2010-05-14 16:11:47','\"David Anderson\" <3607197197>','3607197197','9727689397','from-internal','SIP/300-00000025','SIP/unlimitednet-00000026','Dial','SIP/unlimitednet/9727689397,300,T',27,0,'NO ANSWER',3,'','1273871507.77',''),('2010-05-14 16:17:08','\"David Anderson\" <3607197197>','3607197197','4436150686','from-internal','SIP/300-00000027','SIP/unlimitednet-00000028','Dial','SIP/unlimitednet/4436150686,300,T',3626,3612,'ANSWERED',3,'','1273871828.79',''),('2010-05-14 18:41:02','\"David Anderson\" <3607197197>','3607197197','4692376038','from-internal','SIP/300-00000029','SIP/unlimitednet-0000002a','Dial','SIP/unlimitednet/4692376038,300,T',53,27,'ANSWERED',3,'','1273880462.81',''),('2010-05-14 18:48:15','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000002d','SIP/unlimitednet-0000002e','Dial','SIP/unlimitednet/9893625004,300,T',44,10,'ANSWERED',3,'','1273880895.85',''),('2010-05-14 18:47:41','\"4692376038\" <4692376038>','4692376038','300','from-did-direct','SIP/unlimitednet-0000002b','SIP/300-0000002c','Dial','SIP/300,\"\",tr',283,276,'ANSWERED',3,'','1273880861.83',''),('2010-05-15 14:04:56','\"3609898312\" <3609898312>','3609898312','300','from-did-direct','SIP/unlimitednet-0000002f','SIP/300-00000030','Dial','SIP/300,\"\",tr',286,277,'ANSWERED',3,'','1273950296.87',''),('2010-05-15 15:48:58','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-00000031','','SayAlpha','2146130043',10,10,'ANSWERED',3,'','1273956538.89',''),('2010-05-15 19:14:36','\"David Anderson\" <3607197197>','3607197197','8009378997','from-internal','SIP/300-00000032','SIP/unlimitednet-00000033','Dial','SIP/unlimitednet/8009378997,300,T',1730,1727,'ANSWERED',3,'','1273968876.90',''),('2010-05-15 20:15:10','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-0ed2;2','Local/2146904814@from-internal-2767;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',16,0,'NO ANSWER',3,'','1273972510.99',''),('2010-05-15 20:15:10','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-2767;2','SIP/unlimitednet-00000036','Dial','SIP/unlimitednet/2146904814,300,T',16,0,'NO ANSWER',3,'','1273972510.101',''),('2010-05-15 20:15:06','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-7c13;2','Local/RG-200-2146904814#@from-internal-0ed2;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',20,0,'NO ANSWER',3,'','1273972506.96',''),('2010-05-15 20:15:06','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-70e1;2','SIP/200-00000035','Dial','SIP/200,64,trM(auto-blkvm)',20,0,'ANSWERED',3,'','1273972506.94',''),('2010-05-15 20:15:05','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000034','Local/FMPR-200@from-internal-70e1;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',1375,1354,'ANSWERED',3,'','1273972505.92',''),('2010-05-16 14:24:23','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-00000037','SIP/unlimitednet-00000038','Dial','SIP/unlimitednet/3609536629,300,T',202,187,'ANSWERED',3,'','1274037863.103',''),('2010-05-17 03:54:27','\"254722735158\" <254722735158>','254722735158','FMPR-200','from-internal','Local/FMPR-200@from-internal-d392;2','SIP/200-0000003a','Dial','SIP/200,64,trM(auto-blkvm)',38,0,'NO ANSWER',3,'','1274086467.107',''),('2010-05-17 03:54:31','\"254722735158\" <254722735158>','254722735158','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-dbb0;2','Local/2146904814@from-internal-caf6;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',34,4,'ANSWERED',3,'','1274086471.112',''),('2010-05-17 03:54:27','\"254722735158\" <254722735158>','254722735158','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-4c83;2','Local/RG-200-2146904814#@from-internal-dbb0;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',38,0,'ANSWERED',3,'','1274086467.109',''),('2010-05-17 03:54:26','\"254722735158\" <254722735158>','254722735158','200','from-did-direct','SIP/unlimitednet-00000039','Local/FMGL-2146904814#@from-internal-4c83;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',40,1,'ANSWERED',3,'','1274086466.105',''),('2010-05-17 03:54:31','254722735158','254722735158','2146904814','from-internal','Local/2146904814@from-internal-caf6;2','SIP/unlimitednet-0000003b','Dial','SIP/unlimitednet/2146904814,300,T',35,5,'ANSWERED',3,'','1274086471.114',''),('2010-05-17 03:55:21','\"254722735158\" <254722735158>','254722735158','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-824e;2','Local/RG-200-2146904814#@from-internal-ae2b;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',25,0,'NO ANSWER',3,'','1274086521.120',''),('2010-05-17 03:55:25','\"254722735158\" <254722735158>','254722735158','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-ae2b;2','Local/2146904814@from-internal-3d03;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',21,0,'NO ANSWER',3,'','1274086525.123',''),('2010-05-17 03:55:25','254722735158','254722735158','2146904814','from-internal','Local/2146904814@from-internal-3d03;2','SIP/unlimitednet-0000003e','Dial','SIP/unlimitednet/2146904814,300,T',21,0,'NO ANSWER',3,'','1274086525.125',''),('2010-05-17 03:55:21','\"254722735158\" <254722735158>','254722735158','FMPR-200','from-internal','Local/FMPR-200@from-internal-2d82;2','SIP/200-0000003d','Dial','SIP/200,64,trM(auto-blkvm)',25,0,'ANSWERED',3,'','1274086521.118',''),('2010-05-17 03:55:20','\"254722735158\" <254722735158>','254722735158','200','from-did-direct','SIP/unlimitednet-0000003c','Local/FMPR-200@from-internal-2d82;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',36,10,'ANSWERED',3,'','1274086520.116',''),('2010-05-17 03:58:56','\"Kris Anderson\" <2146130162>','2146130162','2146904734','from-internal','SIP/200-0000003f','SIP/unlimitednet-00000040','Dial','SIP/unlimitednet/2146904734,300,T',14,0,'NO ANSWER',3,'','1274086736.127',''),('2010-05-17 19:56:35','9898209080','9898209080','2146904814','from-internal','Local/2146904814@from-internal-a052;2','SIP/unlimitednet-00000043','Dial','SIP/unlimitednet/2146904814,300,T',20,0,'NO ANSWER',3,'','1274144195.138',''),('2010-05-17 19:56:31','\"9898209080\" <9898209080>','9898209080','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-84c1;2','Local/RG-200-2146904814#@from-internal-46f5;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',24,0,'NO ANSWER',3,'','1274144191.133',''),('2010-05-17 19:56:35','\"9898209080\" <9898209080>','9898209080','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-46f5;2','Local/2146904814@from-internal-a052;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',20,0,'NO ANSWER',3,'','1274144195.136',''),('2010-05-17 19:56:31','\"9898209080\" <9898209080>','9898209080','FMPR-200','from-internal','Local/FMPR-200@from-internal-92bf;2','SIP/200-00000042','Dial','SIP/200,64,trM(auto-blkvm)',24,0,'ANSWERED',3,'','1274144191.131',''),('2010-05-17 19:56:31','\"9898209080\" <9898209080>','9898209080','200','from-did-direct','SIP/unlimitednet-00000041','Local/FMPR-200@from-internal-92bf;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',285,261,'ANSWERED',3,'','1274144191.129',''),('2010-05-17 20:07:43','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-0a00;2','Local/RG-200-2146904814#@from-internal-353c;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',13,0,'NO ANSWER',3,'','1274144863.144',''),('2010-05-17 20:07:48','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-8ba3;2','SIP/unlimitednet-00000046','Dial','SIP/unlimitednet/2146904814,300,T',8,0,'NO ANSWER',3,'','1274144868.149',''),('2010-05-17 20:07:47','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-353c;2','Local/2146904814@from-internal-8ba3;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',9,0,'NO ANSWER',3,'','1274144867.147',''),('2010-05-17 20:07:43','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-6eee;2','SIP/200-00000045','Dial','SIP/200,64,trM(auto-blkvm)',14,1,'ANSWERED',3,'','1274144863.142',''),('2010-05-17 20:07:43','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000044','Local/FMPR-200@from-internal-6eee;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',1546,1533,'ANSWERED',3,'','1274144863.140',''),('2010-05-18 07:43:12','\"David Anderson\" <3607197197>','3607197197','8007354663','from-internal','SIP/300-00000047','SIP/unlimitednet-00000048','Dial','SIP/unlimitednet/8007354663,300,T',178,175,'ANSWERED',3,'','1274186592.151',''),('2010-05-18 15:04:54','\"3609536629\" <3609536629>','3609536629','200','from-did-direct','SIP/unlimitednet-00000049','Local/FMGL-2146904814#@from-internal-e8bc;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',49,0,'NO ANSWER',3,'','1274213094.153',''),('2010-05-18 15:04:54','\"3609536629\" <3609536629>','3609536629','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-e8bc;2','Local/RG-200-2146904814#@from-internal-ff74;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',49,0,'NO ANSWER',3,'','1274213094.157',''),('2010-05-18 15:04:54','\"3609536629\" <3609536629>','3609536629','FMPR-200','from-internal','Local/FMPR-200@from-internal-66cd;2','SIP/200-0000004a','Dial','SIP/200,64,trM(auto-blkvm)',49,0,'NO ANSWER',3,'','1274213094.155',''),('2010-05-18 15:04:59','','','2146904814','from-internal','Local/2146904814@from-internal-958b;1','','MacroExit','',108,68,'ANSWERED',3,'','1274213099.161',''),('2010-05-18 15:04:59','3609536629','3609536629','2146904814','from-internal','Local/2146904814@from-internal-958b;2','SIP/unlimitednet-0000004b','Dial','SIP/unlimitednet/2146904814,300,T',108,68,'ANSWERED',3,'','1274213099.162',''),('2010-05-18 15:04:58','\"3609536629\" <3609536629>','3609536629','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-ff74;2','Local/2146904814@from-internal-958b;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',109,0,'NO ANSWER',3,'','1274213098.160',''),('2010-05-18 17:44:22','\"2146904814\" <2146904814>','2146904814','300','from-did-direct','SIP/unlimitednet-0000004c','SIP/300-0000004d','Dial','SIP/300,\"\",tr',224,215,'ANSWERED',3,'','1274222662.164',''),('2010-05-18 19:06:04','\"2146904734\" <2146904734>','2146904734','300','from-did-direct','SIP/unlimitednet-0000004e','SIP/300-0000004f','Dial','SIP/300,\"\",tr',404,389,'ANSWERED',3,'','1274227564.166',''),('2010-05-19 11:21:25','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-00000050','','SayAlpha','2146130043',13,13,'ANSWERED',3,'','1274286085.168',''),('2010-05-19 11:53:05','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-00000051','SIP/300-00000052','Dial','SIP/300,\"\",tr',18,0,'NO ANSWER',3,'','1274287985.169',''),('2010-05-19 12:11:56','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-00000053','SIP/300-00000054','Dial','SIP/300,\"\",tr',430,419,'ANSWERED',3,'','1274289116.171',''),('2010-05-19 12:28:13','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-00000055','SIP/300-00000056','Dial','SIP/300,\"\",tr',56,47,'ANSWERED',3,'','1274290093.173',''),('2010-05-19 14:25:40','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-00000057','SIP/300-00000058','Dial','SIP/300,\"\",tr',535,522,'ANSWERED',3,'','1274297140.175',''),('2010-05-19 14:34:55','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-00000059','SIP/unlimitednet-0000005a','Dial','SIP/unlimitednet/3609536629,300,T',824,806,'ANSWERED',3,'','1274297695.177',''),('2010-05-19 14:57:52','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-0000005b','SIP/300-0000005c','Dial','SIP/300,\"\",tr',124,115,'ANSWERED',3,'','1274299072.179',''),('2010-05-19 15:03:46','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-0000005d','SIP/unlimitednet-0000005e','Dial','SIP/unlimitednet/4694771253,300,T',310,298,'ANSWERED',3,'','1274299426.181',''),('2010-05-19 15:09:18','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-0000005f','SIP/unlimitednet-00000060','Dial','SIP/unlimitednet/4694771253,300,T',325,318,'ANSWERED',3,'','1274299758.183',''),('2010-05-19 16:25:50','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-00000061','SIP/300-00000062','Dial','SIP/300,\"\",tr',76,66,'ANSWERED',3,'','1274304350.185',''),('2010-05-19 17:10:40','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-00000063','SIP/300-00000064','Dial','SIP/300,\"\",tr',713,706,'ANSWERED',3,'','1274307040.187',''),('2010-05-19 17:22:42','\"David Anderson\" <3607197197>','3607197197','8662687221','from-internal','SIP/300-00000065','SIP/unlimitednet-00000066','Dial','SIP/unlimitednet/8662687221,300,T',179,176,'ANSWERED',3,'','1274307762.189',''),('2010-05-19 17:25:58','\"David Anderson\" <3607197197>','3607197197','8662687221','from-internal','SIP/300-00000067','SIP/unlimitednet-00000068','Dial','SIP/unlimitednet/8662687221,300,T',27,24,'ANSWERED',3,'','1274307958.191',''),('2010-05-19 17:27:04','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-00000069','SIP/unlimitednet-0000006a','Dial','SIP/unlimitednet/3609536629,300,T',33,0,'NO ANSWER',3,'','1274308024.193',''),('2010-05-19 19:59:52','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-40f4;2','Local/2146904814@from-internal-12db;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',19,0,'NO ANSWER',3,'','1274317192.202',''),('2010-05-19 19:59:48','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-19c5;2','Local/RG-200-2146904814#@from-internal-40f4;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',23,0,'NO ANSWER',3,'','1274317188.199',''),('2010-05-19 19:59:52','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-12db;2','SIP/unlimitednet-0000006d','Dial','SIP/unlimitednet/2146904814,300,T',19,0,'NO ANSWER',3,'','1274317192.204',''),('2010-05-19 19:59:48','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-3928;2','SIP/200-0000006c','Dial','SIP/200,64,trM(auto-blkvm)',23,0,'ANSWERED',3,'','1274317188.197',''),('2010-05-19 19:59:48','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000006b','Local/FMPR-200@from-internal-3928;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',342,319,'ANSWERED',3,'','1274317188.195',''),('2010-05-19 20:05:58','3606907266','3606907266','2146904814','from-internal','Local/2146904814@from-internal-a1b1;2','SIP/unlimitednet-00000070','Dial','SIP/unlimitednet/2146904814,300,T',15,0,'NO ANSWER',3,'','1274317558.215',''),('2010-05-19 20:05:54','\"3606907266\" <3606907266>','3606907266','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-c2ae;2','Local/RG-200-2146904814#@from-internal-0b61;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',19,0,'NO ANSWER',3,'','1274317554.210',''),('2010-05-19 20:05:58','\"3606907266\" <3606907266>','3606907266','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-0b61;2','Local/2146904814@from-internal-a1b1;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',15,0,'NO ANSWER',3,'','1274317558.213',''),('2010-05-19 20:05:54','\"3606907266\" <3606907266>','3606907266','FMPR-200','from-internal','Local/FMPR-200@from-internal-ab79;2','SIP/200-0000006f','Dial','SIP/200,64,trM(auto-blkvm)',19,0,'ANSWERED',3,'','1274317554.208',''),('2010-05-19 20:05:54','\"3606907266\" <3606907266>','3606907266','200','from-did-direct','SIP/unlimitednet-0000006e','Local/FMPR-200@from-internal-ab79;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',362,343,'ANSWERED',3,'','1274317554.206',''),('2010-05-19 20:12:53','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000071','SIP/unlimitednet-00000072','Dial','SIP/unlimitednet/9893625004,300,T',295,279,'ANSWERED',3,'','1274317973.217',''),('2010-05-19 20:22:52','\"9898209080\" <9898209080>','9898209080','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-fa3e;2','Local/2146904814@from-internal-e88b;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',14,0,'NO ANSWER',3,'','1274318572.226',''),('2010-05-19 20:22:48','\"9898209080\" <9898209080>','9898209080','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-b3da;2','Local/RG-200-2146904814#@from-internal-fa3e;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',18,0,'NO ANSWER',3,'','1274318568.223',''),('2010-05-19 20:22:53','9898209080','9898209080','2146904814','from-internal','Local/2146904814@from-internal-e88b;2','SIP/unlimitednet-00000075','Dial','SIP/unlimitednet/2146904814,300,T',13,0,'NO ANSWER',3,'','1274318573.228',''),('2010-05-19 20:22:48','\"9898209080\" <9898209080>','9898209080','FMPR-200','from-internal','Local/FMPR-200@from-internal-0040;2','SIP/200-00000074','Dial','SIP/200,64,trM(auto-blkvm)',18,0,'ANSWERED',3,'','1274318568.221',''),('2010-05-19 20:23:41','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-00000076','SIP/300-00000077','Dial','SIP/300,\"\",tr',214,202,'ANSWERED',3,'','1274318621.230',''),('2010-05-19 20:22:48','\"9898209080\" <9898209080>','9898209080','200','from-did-direct','SIP/unlimitednet-00000073','Local/FMPR-200@from-internal-0040;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',360,342,'ANSWERED',3,'','1274318568.219',''),('2010-05-19 20:59:40','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-00000078','SIP/300-00000079','Dial','SIP/300,\"\",tr',399,391,'ANSWERED',3,'','1274320780.232',''),('2010-05-19 21:31:42','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-0000007a','SIP/unlimitednet-0000007b','Dial','SIP/unlimitednet/3609536629,300,T',67,35,'ANSWERED',3,'','1274322702.234',''),('2010-05-19 21:47:09','\"4436150686\" <4436150686>','4436150686','300','from-did-direct','SIP/unlimitednet-0000007c','SIP/300-0000007d','Dial','SIP/300,\"\",tr',1945,1939,'ANSWERED',3,'','1274323629.236',''),('2010-05-20 06:53:18','\"3307790780\" <3307790780>','3307790780','s','from-trunk','SIP/unlimitednet-0000007e','','Hangup','',14,14,'ANSWERED',3,'','1274356398.238',''),('2010-05-20 09:36:14','\"9726062592\" <9726062592>','9726062592','200','from-did-direct','SIP/unlimitednet-0000007f','Local/FMGL-2146904814#@from-internal-849f;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',18,0,'NO ANSWER',3,'','1274366174.239',''),('2010-05-20 09:36:14','\"9726062592\" <9726062592>','9726062592','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-849f;2','Local/RG-200-2146904814#@from-internal-a396;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',18,0,'NO ANSWER',3,'','1274366174.243',''),('2010-05-20 09:36:18','\"9726062592\" <9726062592>','9726062592','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-a396;2','Local/2146904814@from-internal-e85c;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',14,0,'NO ANSWER',3,'','1274366178.246',''),('2010-05-20 09:36:14','\"9726062592\" <9726062592>','9726062592','FMPR-200','from-internal','Local/FMPR-200@from-internal-e080;2','SIP/200-00000080','Dial','SIP/200,64,trM(auto-blkvm)',18,0,'NO ANSWER',3,'','1274366174.241',''),('2010-05-20 09:36:18','9726062592','9726062592','2146904814','from-internal','Local/2146904814@from-internal-e85c;2','SIP/unlimitednet-00000081','Dial','SIP/unlimitednet/2146904814,300,T',14,0,'NO ANSWER',3,'','1274366178.248',''),('2010-05-20 12:01:38','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-00000082','SIP/300-00000083','Dial','SIP/300,\"\",tr',455,445,'ANSWERED',3,'','1274374898.250',''),('2010-05-20 15:40:47','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000084','SIP/unlimitednet-00000085','Dial','SIP/unlimitednet/9893625004,300,T',1089,1072,'ANSWERED',3,'','1274388047.252',''),('2010-05-20 17:23:43','\"9898209080\" <9898209080>','9898209080','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-92d2;2','Local/RG-200-2146904814#@from-internal-9e93;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',8,0,'NO ANSWER',3,'','1274394223.258',''),('2010-05-20 17:23:47','\"9898209080\" <9898209080>','9898209080','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-9e93;2','Local/2146904814@from-internal-7616;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',4,0,'NO ANSWER',3,'','1274394227.261',''),('2010-05-20 17:23:47','9898209080','9898209080','2146904814','from-internal','Local/2146904814@from-internal-7616;2','SIP/unlimitednet-00000088','Dial','SIP/unlimitednet/2146904814,300,T',4,0,'NO ANSWER',3,'','1274394227.263',''),('2010-05-20 17:23:43','\"9898209080\" <9898209080>','9898209080','FMPR-200','from-internal','Local/FMPR-200@from-internal-3659;2','SIP/200-00000087','Dial','SIP/200,64,trM(auto-blkvm)',8,0,'ANSWERED',3,'','1274394223.256',''),('2010-05-20 17:23:43','\"9898209080\" <9898209080>','9898209080','200','from-did-direct','SIP/unlimitednet-00000086','Local/FMPR-200@from-internal-3659;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',146,138,'ANSWERED',3,'','1274394223.254',''),('2010-05-20 18:30:19','\"David Anderson\" <3607197197>','3607197197','4692376038','from-internal','SIP/300-00000089','SIP/unlimitednet-0000008a','Dial','SIP/unlimitednet/4692376038,300,T',39,4,'ANSWERED',3,'','1274398219.265',''),('2010-05-20 18:31:17','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-0000008b','SIP/unlimitednet-0000008c','Dial','SIP/unlimitednet/4694771253,300,T',68,54,'ANSWERED',3,'','1274398277.267',''),('2010-05-20 19:17:33','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000008d','SIP/unlimitednet-0000008e','Dial','SIP/unlimitednet/9893625004,300,T',83,62,'ANSWERED',3,'','1274401053.269',''),('2010-05-20 19:21:44','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000008f','SIP/unlimitednet-00000090','Dial','SIP/unlimitednet/9893625004,300,T',95,83,'ANSWERED',3,'','1274401304.271',''),('2010-05-20 20:34:49','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000091','SIP/unlimitednet-00000092','Dial','SIP/unlimitednet/9893625004,300,T',215,202,'ANSWERED',3,'','1274405689.273',''),('2010-05-21 13:04:22','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000094','SIP/unlimitednet-00000095','Dial','SIP/unlimitednet/9893625004,300,T',780,760,'ANSWERED',3,'','1274465062.276',''),('2010-05-21 13:05:52','\"4436150686\" <4436150686>','4436150686','300','from-did-direct','SIP/unlimitednet-00000096','SIP/300-00000097','Dial','SIP/300,\"\",tr',1865,1860,'ANSWERED',3,'','1274465152.278',''),('2010-05-21 14:14:17','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-00000098','SIP/unlimitednet-00000099','Dial','SIP/unlimitednet/3609536629,300,T',50,15,'ANSWERED',3,'','1274469257.280',''),('2010-05-21 14:42:35','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-0000009a','SIP/unlimitednet-0000009b','Dial','SIP/unlimitednet/4694771253,300,T',468,454,'ANSWERED',3,'','1274470955.282',''),('2010-05-21 17:10:24','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-0000009c','SIP/unlimitednet-0000009d','Dial','SIP/unlimitednet/3609536629,300,T',519,500,'ANSWERED',3,'','1274479824.284',''),('2010-05-21 17:26:09','\"4699511286\" <4699511286>','4699511286','200','from-did-direct','SIP/unlimitednet-0000009e','Local/FMGL-2146904814#@from-internal-c30c;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',31,0,'NO ANSWER',3,'','1274480769.286',''),('2010-05-21 17:26:09','\"4699511286\" <4699511286>','4699511286','FMPR-200','from-internal','Local/FMPR-200@from-internal-1a28;2','SIP/200-0000009f','Dial','SIP/200,64,trM(auto-blkvm)',31,0,'NO ANSWER',3,'','1274480769.288',''),('2010-05-21 17:26:09','\"4699511286\" <4699511286>','4699511286','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-c30c;2','Local/RG-200-2146904814#@from-internal-34e4;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',31,0,'NO ANSWER',3,'','1274480769.290',''),('2010-05-21 17:26:13','4699511286','4699511286','2146904814','from-internal','Local/2146904814@from-internal-4969;2','SIP/unlimitednet-000000a0','Dial','SIP/unlimitednet/2146904814,300,T',27,0,'NO ANSWER',3,'','1274480773.295',''),('2010-05-21 17:26:13','\"4699511286\" <4699511286>','4699511286','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-34e4;2','Local/2146904814@from-internal-4969;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',27,0,'NO ANSWER',3,'','1274480773.293',''),('2010-05-21 21:01:18','\"Kris Anderson\" <2146130162>','2146130162','3607197197','from-internal','SIP/200-000000a1','SIP/unlimitednet-000000a2','Dial','SIP/unlimitednet/3607197197,300,T',163,146,'ANSWERED',3,'','1274493678.297',''),('2010-05-21 21:01:24','\"2146130162\" <2146130162>','2146130162','300','from-did-direct','SIP/unlimitednet-000000a3','SIP/300-000000a4','Dial','SIP/300,\"\",tr',157,146,'ANSWERED',3,'','1274493684.299',''),('2010-05-22 10:45:21','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-000000a5','SIP/300-000000a6','Dial','SIP/300,\"\",tr',278,266,'ANSWERED',3,'','1274543121.301',''),('2010-05-22 13:40:17','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-000000a7','SIP/300-000000a8','Dial','SIP/300,\"\",tr',160,153,'ANSWERED',3,'','1274553617.303',''),('2010-05-22 21:54:03','\"3608912134\" <3608912134>','3608912134','300','from-did-direct','SIP/unlimitednet-000000a9','SIP/300-000000aa','Dial','SIP/300,\"\",tr',31,21,'ANSWERED',3,'','1274583243.305',''),('2010-05-23 14:33:26','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-3eaf;2','Local/RG-200-2146904814#@from-internal-0a4d;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',7,0,'NO ANSWER',3,'','1274643206.311',''),('2010-05-23 14:33:30','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-0a4d;2','Local/2146904814@from-internal-c2c5;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',3,0,'NO ANSWER',3,'','1274643210.314',''),('2010-05-23 14:33:30','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-c2c5;2','SIP/unlimitednet-000000ad','Dial','SIP/unlimitednet/2146904814,300,T',3,0,'NO ANSWER',3,'','1274643210.316',''),('2010-05-23 14:33:26','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-528a;2','SIP/200-000000ac','Dial','SIP/200,64,trM(auto-blkvm)',7,0,'ANSWERED',3,'','1274643206.309',''),('2010-05-23 14:33:26','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000000ab','Local/FMPR-200@from-internal-528a;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',2125,2118,'ANSWERED',3,'','1274643206.307',''),('2010-05-23 15:14:17','\"2146904734\" <2146904734>','2146904734','300','from-did-direct','SIP/unlimitednet-000000ae','SIP/300-000000af','Congestion','10',1,0,'FAILED',3,'','1274645657.318',''),('2010-05-23 15:16:06','\"2146904734\" <2146904734>','2146904734','300','from-did-direct','SIP/unlimitednet-000000b0','SIP/300-000000b1','Dial','SIP/300,\"\",tr',40,19,'ANSWERED',3,'','1274645766.320',''),('2010-05-23 16:45:34','\"9898209080\" <9898209080>','9898209080','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-f884;2','Local/2146904814@from-internal-0a30;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',5,0,'NO ANSWER',3,'','1274651134.329',''),('2010-05-23 16:45:34','9898209080','9898209080','2146904814','from-internal','Local/2146904814@from-internal-0a30;2','SIP/unlimitednet-000000b4','Dial','SIP/unlimitednet/2146904814,300,T',5,0,'NO ANSWER',3,'','1274651134.331',''),('2010-05-23 16:45:30','\"9898209080\" <9898209080>','9898209080','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-f2cd;2','Local/RG-200-2146904814#@from-internal-f884;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',9,0,'NO ANSWER',3,'','1274651130.326',''),('2010-05-23 16:45:30','\"9898209080\" <9898209080>','9898209080','FMPR-200','from-internal','Local/FMPR-200@from-internal-61ea;2','SIP/200-000000b3','Dial','SIP/200,64,trM(auto-blkvm)',9,0,'ANSWERED',3,'','1274651130.324',''),('2010-05-23 16:45:30','\"9898209080\" <9898209080>','9898209080','200','from-did-direct','SIP/unlimitednet-000000b2','Local/FMPR-200@from-internal-61ea;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',161,152,'ANSWERED',3,'','1274651130.322',''),('2010-05-23 20:08:56','\"4696581001\" <4696581001>','4696581001','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-6c2b;2','Local/RG-200-2146904814#@from-internal-e158;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',9,0,'NO ANSWER',3,'','1274663336.337',''),('2010-05-23 20:09:00','\"4696581001\" <4696581001>','4696581001','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-e158;2','Local/2146904814@from-internal-9753;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',5,0,'NO ANSWER',3,'','1274663340.340',''),('2010-05-23 20:09:00','4696581001','4696581001','2146904814','from-internal','Local/2146904814@from-internal-9753;2','SIP/unlimitednet-000000b7','Dial','SIP/unlimitednet/2146904814,300,T',5,0,'NO ANSWER',3,'','1274663340.342',''),('2010-05-23 20:08:56','\"4696581001\" <4696581001>','4696581001','FMPR-200','from-internal','Local/FMPR-200@from-internal-211a;2','SIP/200-000000b6','Dial','SIP/200,64,trM(auto-blkvm)',9,0,'ANSWERED',3,'','1274663336.335',''),('2010-05-23 20:08:55','\"4696581001\" <4696581001>','4696581001','200','from-did-direct','SIP/unlimitednet-000000b5','Local/FMPR-200@from-internal-211a;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',142,132,'ANSWERED',3,'','1274663335.333',''),('2010-05-23 20:55:05','\"Kris Anderson\" <2146130162>','2146130162','8888972635','from-internal','SIP/200-000000b8','SIP/unlimitednet-000000b9','Dial','SIP/unlimitednet/8888972635,300,T',15,10,'ANSWERED',3,'','1274666105.344',''),('2010-05-23 20:55:10','\"2146130162\" <2146130162>','2146130162','s','from-trunk','SIP/unlimitednet-000000ba','','SayAlpha','8888972635',10,10,'ANSWERED',3,'','1274666110.346',''),('2010-05-23 20:57:45','\"Kris Anderson\" <2146130162>','2146130162','3607196745','from-internal','SIP/200-000000bb','SIP/unlimitednet-000000bc','Dial','SIP/unlimitednet/3607196745,300,T',1,0,'NO ANSWER',3,'','1274666265.347',''),('2010-05-23 20:58:01','\"Kris Anderson\" <2146130162>','2146130162','3607196745','from-internal','SIP/200-000000bd','SIP/unlimitednet-000000be','Dial','SIP/unlimitednet/3607196745,300,T',14,8,'ANSWERED',3,'','1274666281.349',''),('2010-05-23 20:58:07','\"2146130162\" <2146130162>','2146130162','s','from-trunk','SIP/unlimitednet-000000bf','','SayAlpha','3607196745',8,8,'ANSWERED',3,'','1274666287.351',''),('2010-05-23 20:58:24','\"Kris Anderson\" <2146130162>','2146130162','3607196747','from-internal','SIP/200-000000c0','SIP/unlimitednet-000000c1','Dial','SIP/unlimitednet/3607196747,300,T',2,0,'NO ANSWER',3,'','1274666304.352',''),('2010-05-23 20:58:41','\"2146130162\" <2146130162>','2146130162','201','from-did-direct','SIP/unlimitednet-000000c4','SIP/201-000000c5','Dial','SIP/201,\"\",tr',40,15,'ANSWERED',3,'','1274666321.356',''),('2010-05-23 20:58:36','\"Kris Anderson\" <2146130162>','2146130162','3607196747','from-internal','SIP/200-000000c2','SIP/unlimitednet-000000c3','Dial','SIP/unlimitednet/3607196747,300,T',45,15,'ANSWERED',3,'','1274666316.354',''),('2010-05-24 11:23:14','\"9033610624\" <9033610624>','9033610624','300','from-did-direct','SIP/unlimitednet-000000c6','SIP/300-000000c7','Dial','SIP/300,\"\",tr',47,37,'ANSWERED',3,'','1274718194.358',''),('2010-05-24 14:30:25','\"208.77.96.58    200.201.195.91  216.245.215.82\" <103>','103','s','from-trunk','SIP/216.245.215.82-000000c8','','Playback','ss-noservice',6,6,'ANSWERED',3,'','1274729425.360',''),('2010-05-24 19:17:27','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-000000c9','','Hangup','',14,14,'ANSWERED',3,'','1274746647.361',''),('2010-05-24 21:00:29','\"Kris Anderson\" <2146130162>','2146130162','18009460332','from-internal','SIP/200-000000ca','SIP/unlimitednet-000000cb','Dial','SIP/unlimitednet/8009460332,300,T',0,0,'NO ANSWER',3,'','1274752829.362',''),('2010-05-24 21:00:41','\"Kris Anderson\" <2146130162>','2146130162','8009460332','from-internal','SIP/200-000000cc','SIP/unlimitednet-000000cd','Dial','SIP/unlimitednet/8009460332,300,T',161,158,'ANSWERED',3,'','1274752841.364',''),('2010-05-25 15:56:10','\"9034827100\" <9034827100>','9034827100','300','from-did-direct','SIP/unlimitednet-000000ce','SIP/300-000000cf','Dial','SIP/300,\"\",tr',23,12,'ANSWERED',3,'','1274820970.366',''),('2010-05-25 16:08:11','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-c2e9;2','Local/RG-200-2146904814#@from-internal-a45a;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',9,0,'NO ANSWER',3,'','1274821691.372',''),('2010-05-25 16:08:16','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-a45a;2','Local/2146904814@from-internal-20dc;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',4,0,'NO ANSWER',3,'','1274821696.375',''),('2010-05-25 16:08:16','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-20dc;2','SIP/unlimitednet-000000d2','Dial','SIP/unlimitednet/2146904814,300,T',4,0,'NO ANSWER',3,'','1274821696.377',''),('2010-05-25 16:08:11','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-2923;2','SIP/200-000000d1','Dial','SIP/200,64,trM(auto-blkvm)',9,0,'ANSWERED',3,'','1274821691.370',''),('2010-05-25 16:08:11','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000000d0','Local/FMPR-200@from-internal-2923;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',69,60,'ANSWERED',3,'','1274821691.368',''),('2010-05-25 17:52:39','\"David Anderson\" <3607197197>','3607197197','9727571557','from-internal','SIP/300-000000d3','SIP/unlimitednet-000000d4','Dial','SIP/unlimitednet/9727571557,300,T',54,34,'ANSWERED',3,'','1274827959.379',''),('2010-05-25 18:04:42','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-8236;2','Local/RG-200-2146904814#@from-internal-caff;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',17,0,'NO ANSWER',3,'','1274828682.385',''),('2010-05-25 18:04:46','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-caff;2','Local/2146904814@from-internal-9069;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',13,0,'NO ANSWER',3,'','1274828686.388',''),('2010-05-25 18:04:47','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-9069;2','SIP/unlimitednet-000000d7','Dial','SIP/unlimitednet/2146904814,300,T',12,0,'NO ANSWER',3,'','1274828687.390',''),('2010-05-25 18:04:42','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-b60c;2','SIP/200-000000d6','Dial','SIP/200,64,trM(auto-blkvm)',17,0,'ANSWERED',3,'','1274828682.383',''),('2010-05-25 18:04:42','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000000d5','Local/FMPR-200@from-internal-b60c;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',353,336,'ANSWERED',3,'','1274828682.381',''),('2010-05-25 18:41:05','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-000000d8','','Hangup','',14,14,'ANSWERED',3,'','1274830865.392',''),('2010-05-25 18:44:29','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-000000d9','SIP/unlimitednet-000000da','Dial','SIP/unlimitednet/9893625004,300,T',131,116,'ANSWERED',3,'','1274831069.393',''),('2010-05-25 19:04:22','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-000000db','SIP/unlimitednet-000000dc','Dial','SIP/unlimitednet/9893625004,300,T',342,328,'ANSWERED',3,'','1274832262.395',''),('2010-05-26 10:20:34','\"David Anderson\" <3607197197>','3607197197','9034827100','from-internal','SIP/300-000000dd','SIP/unlimitednet-000000de','Dial','SIP/unlimitednet/9034827100,300,T',156,137,'ANSWERED',3,'','1274887234.397',''),('2010-05-26 10:23:56','\"David Anderson\" <3607197197>','3607197197','9034827100','from-internal','SIP/300-000000e0','SIP/unlimitednet-000000e1','Dial','SIP/unlimitednet/9034827100,300,T',508,477,'ANSWERED',3,'','1274887436.400',''),('2010-05-26 10:34:53','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-000000e2','SIP/300-000000e3','Dial','SIP/300,\"\",tr',63,56,'ANSWERED',3,'','1274888093.402',''),('2010-05-26 17:03:27','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-0c84;2','Local/RG-200-2146904814#@from-internal-de38;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',20,0,'NO ANSWER',3,'','1274911407.408',''),('2010-05-26 17:03:31','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-de38;2','Local/2146904814@from-internal-0911;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',16,0,'NO ANSWER',3,'','1274911411.411',''),('2010-05-26 17:03:32','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-0911;2','SIP/unlimitednet-000000e6','Dial','SIP/unlimitednet/2146904814,300,T',15,0,'NO ANSWER',3,'','1274911412.413',''),('2010-05-26 17:03:27','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-6779;2','SIP/200-000000e5','Dial','SIP/200,64,trM(auto-blkvm)',20,0,'ANSWERED',3,'','1274911407.406',''),('2010-05-26 17:03:27','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000000e4','Local/FMPR-200@from-internal-6779;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',269,249,'ANSWERED',3,'','1274911407.404',''),('2010-05-26 21:11:56','\"Kris Anderson\" <2146130162>','2146130162','18668886080','from-internal','SIP/200-000000e7','SIP/unlimitednet-000000e8','Dial','SIP/unlimitednet/8668886080,300,T',356,354,'ANSWERED',3,'','1274926316.415',''),('2010-05-27 10:53:48','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-000000e9','SIP/300-000000ea','Dial','SIP/300,\"\",tr',335,326,'ANSWERED',3,'','1274975628.417',''),('2010-05-27 11:10:57','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-000000eb','SIP/unlimitednet-000000ec','Dial','SIP/unlimitednet/4694771253,300,T',281,269,'ANSWERED',3,'','1274976657.419',''),('2010-05-27 11:23:33','\"David Anderson\" <3607197197>','3607197197','9723823553','from-internal','SIP/300-000000ed','SIP/unlimitednet-000000ee','Dial','SIP/unlimitednet/9723823553,300,T',67,61,'ANSWERED',3,'','1274977413.421',''),('2010-05-27 16:27:11','\"4695315294\" <4695315294>','4695315294','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-6a56;2','Local/RG-200-2146904814#@from-internal-14f6;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',16,0,'NO ANSWER',3,'','1274995631.427',''),('2010-05-27 16:27:15','\"4695315294\" <4695315294>','4695315294','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-14f6;2','Local/2146904814@from-internal-a2d3;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',12,0,'NO ANSWER',3,'','1274995635.430',''),('2010-05-27 16:27:15','4695315294','4695315294','2146904814','from-internal','Local/2146904814@from-internal-a2d3;2','SIP/unlimitednet-000000f1','Dial','SIP/unlimitednet/2146904814,300,T',12,0,'NO ANSWER',3,'','1274995635.432',''),('2010-05-27 16:27:11','\"4695315294\" <4695315294>','4695315294','FMPR-200','from-internal','Local/FMPR-200@from-internal-8ebc;2','SIP/200-000000f0','Dial','SIP/200,64,trM(auto-blkvm)',16,0,'ANSWERED',3,'','1274995631.425',''),('2010-05-27 16:27:10','\"4695315294\" <4695315294>','4695315294','200','from-did-direct','SIP/unlimitednet-000000ef','Local/FMPR-200@from-internal-8ebc;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',56,39,'ANSWERED',3,'','1274995630.423',''),('2010-05-27 16:30:05','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-f1e6;2','SIP/unlimitednet-000000f4','Dial','SIP/unlimitednet/2146904814,300,T',18,0,'NO ANSWER',3,'','1274995805.443',''),('2010-05-27 16:30:04','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-3901;2','Local/2146904814@from-internal-f1e6;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',19,0,'NO ANSWER',3,'','1274995804.441',''),('2010-05-27 16:30:00','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-b4b0;2','Local/RG-200-2146904814#@from-internal-3901;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',23,0,'NO ANSWER',3,'','1274995800.438',''),('2010-05-27 16:30:00','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-dcff;2','SIP/200-000000f3','Dial','SIP/200,64,trM(auto-blkvm)',23,0,'ANSWERED',3,'','1274995800.436',''),('2010-05-27 16:30:00','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000000f2','Local/FMPR-200@from-internal-dcff;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',144,121,'ANSWERED',3,'','1274995800.434',''),('2010-05-28 10:39:29','\"David Anderson\" <3607197197>','3607197197','9722945477','from-internal','SIP/300-000000f5','SIP/unlimitednet-000000f6','Dial','SIP/unlimitednet/9722945477,300,T',74,63,'ANSWERED',3,'','1275061169.445',''),('2010-05-28 10:47:48','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-000000f7','SIP/unlimitednet-000000f8','Dial','SIP/unlimitednet/4694771253,300,T',19,0,'NO ANSWER',3,'','1275061668.447',''),('2010-05-28 10:48:19','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-000000f9','SIP/unlimitednet-000000fa','Dial','SIP/unlimitednet/4694771253,300,T',249,234,'ANSWERED',3,'','1275061699.449',''),('2010-05-28 15:23:40','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-9ca5;2','SIP/unlimitednet-000000fd','Dial','SIP/unlimitednet/2146904814,300,T',10,0,'NO ANSWER',3,'','1275078220.460',''),('2010-05-28 15:23:36','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-5977;2','Local/RG-200-2146904814#@from-internal-dce4;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',14,0,'NO ANSWER',3,'','1275078216.455',''),('2010-05-28 15:23:40','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-dce4;2','Local/2146904814@from-internal-9ca5;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',10,0,'NO ANSWER',3,'','1275078220.458',''),('2010-05-28 15:23:36','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-9b6e;2','SIP/200-000000fc','Dial','SIP/200,64,trM(auto-blkvm)',14,0,'ANSWERED',3,'','1275078216.453',''),('2010-05-28 15:23:36','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000000fb','Local/FMPR-200@from-internal-9b6e;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',307,293,'ANSWERED',3,'','1275078216.451',''),('2010-05-28 15:50:44','3607505876','3607505876','2146904814','from-internal','Local/2146904814@from-internal-0aa3;2','SIP/unlimitednet-00000100','Dial','SIP/unlimitednet/2146904814,300,T',6,0,'NO ANSWER',3,'','1275079844.471',''),('2010-05-28 15:50:44','\"3607505876\" <3607505876>','3607505876','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-fe3e;2','Local/2146904814@from-internal-0aa3;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',6,0,'NO ANSWER',3,'','1275079844.469',''),('2010-05-28 15:50:40','\"3607505876\" <3607505876>','3607505876','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-d404;2','Local/RG-200-2146904814#@from-internal-fe3e;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',10,0,'NO ANSWER',3,'','1275079840.466',''),('2010-05-28 15:50:40','\"3607505876\" <3607505876>','3607505876','FMPR-200','from-internal','Local/FMPR-200@from-internal-f999;2','SIP/200-000000ff','Dial','SIP/200,64,trM(auto-blkvm)',10,0,'ANSWERED',3,'','1275079840.464',''),('2010-05-28 15:50:40','\"3607505876\" <3607505876>','3607505876','200','from-did-direct','SIP/unlimitednet-000000fe','Local/FMPR-200@from-internal-f999;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',21,11,'ANSWERED',3,'','1275079840.462',''),('2010-05-28 16:33:36','1','1','s','from-trunk','SIP/216.245.215.82-00000101','','Hangup','',20,20,'ANSWERED',3,'','1275082416.473',''),('2010-05-28 16:34:18','1','1','s','from-trunk','SIP/216.245.215.82-00000102','','SayAlpha','972599698985',8,8,'ANSWERED',3,'','1275082458.474',''),('2010-05-28 17:09:05','\"209.190.96.2  085.119.89.182  188.92.40.130  89.\" <1>','1','s','from-trunk','SIP/216.245.215.82-00000103','','Playback','ss-noservice',4,4,'ANSWERED',3,'','1275084545.475',''),('2010-05-28 17:09:17','\"209.190.96.2  085.119.89.182  188.92.40.130  89.\" <1>','1','s','from-trunk','SIP/216.245.215.82-00000104','','Playback','ss-noservice',3,3,'ANSWERED',3,'','1275084557.476',''),('2010-05-28 17:09:21','\"209.190.96.2  085.119.89.182  188.92.40.130  89.\" <1>','1','s','from-trunk','SIP/216.245.215.82-00000105','','Playback','ss-noservice',4,4,'ANSWERED',3,'','1275084561.477',''),('2010-05-28 17:09:28','\"209.190.96.2  085.119.89.182  188.92.40.130  89.\" <1>','1','s','from-trunk','SIP/216.245.215.82-00000106','','Playback','ss-noservice',3,3,'ANSWERED',3,'','1275084568.478',''),('2010-05-28 17:09:33','\"209.190.96.2  085.119.89.182  188.92.40.130  89.\" <1>','1','s','from-trunk','SIP/216.245.215.82-00000107','','Wait','2',1,1,'ANSWERED',3,'','1275084573.479',''),('2010-05-28 17:09:36','\"209.190.96.2  085.119.89.182  188.92.40.130  89.\" <1>','1','s','from-trunk','SIP/216.245.215.82-00000108','','Wait','2',0,0,'ANSWERED',3,'','1275084576.480',''),('2010-05-28 18:37:25','\"3606907267\" <3606907267>','3606907267','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-b31b;2','Local/RG-200-2146904814#@from-internal-f7a7;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',17,0,'NO ANSWER',3,'','1275089845.485',''),('2010-05-28 18:37:29','3606907267','3606907267','2146904814','from-internal','Local/2146904814@from-internal-3bed;2','SIP/unlimitednet-0000010b','Dial','SIP/unlimitednet/2146904814,300,T',13,0,'NO ANSWER',3,'','1275089849.490',''),('2010-05-28 18:37:29','\"3606907267\" <3606907267>','3606907267','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-f7a7;2','Local/2146904814@from-internal-3bed;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',13,0,'NO ANSWER',3,'','1275089849.488',''),('2010-05-28 18:37:25','\"3606907267\" <3606907267>','3606907267','FMPR-200','from-internal','Local/FMPR-200@from-internal-196e;2','SIP/200-0000010a','Dial','SIP/200,64,trM(auto-blkvm)',17,0,'ANSWERED',3,'','1275089845.483',''),('2010-05-28 18:37:25','\"3606907267\" <3606907267>','3606907267','200','from-did-direct','SIP/unlimitednet-00000109','Local/FMPR-200@from-internal-196e;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',779,762,'ANSWERED',3,'','1275089845.481',''),('2010-05-28 19:30:44','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000010c','SIP/unlimitednet-0000010d','Dial','SIP/unlimitednet/9893625004,300,T',274,258,'ANSWERED',3,'','1275093044.492',''),('2010-05-29 13:39:21','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-0000010e','','SayAlpha','2146130043',12,12,'ANSWERED',3,'','1275158361.494',''),('2010-05-29 16:43:06','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-7160;2','Local/2146904814@from-internal-fd1a;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',3,0,'NO ANSWER',3,'','1275169386.502',''),('2010-05-29 16:43:02','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-1ecf;2','Local/RG-200-2146904814#@from-internal-7160;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',7,0,'NO ANSWER',3,'','1275169382.499',''),('2010-05-29 16:43:06','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-fd1a;2','SIP/unlimitednet-00000111','Dial','SIP/unlimitednet/2146904814,300,T',3,0,'NO ANSWER',3,'','1275169386.504',''),('2010-05-29 16:43:02','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-98ab;2','SIP/200-00000110','Dial','SIP/200,64,trM(auto-blkvm)',7,0,'ANSWERED',3,'','1275169382.497',''),('2010-05-29 16:43:01','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000010f','Local/FMPR-200@from-internal-98ab;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',487,479,'ANSWERED',3,'','1275169381.495',''),('2010-05-30 14:26:21','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-0cec;2','Local/RG-200-2146904814#@from-internal-52d4;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',12,0,'NO ANSWER',3,'','1275247581.510',''),('2010-05-30 14:26:25','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-52d4;2','Local/2146904814@from-internal-3ad7;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',8,0,'NO ANSWER',3,'','1275247585.513',''),('2010-05-30 14:26:25','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-3ad7;2','SIP/unlimitednet-00000114','Dial','SIP/unlimitednet/2146904814,300,T',8,0,'NO ANSWER',3,'','1275247585.515',''),('2010-05-30 14:26:21','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-3243;2','SIP/200-00000113','Dial','SIP/200,64,trM(auto-blkvm)',12,0,'ANSWERED',3,'','1275247581.508',''),('2010-05-30 14:26:21','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000112','Local/FMPR-200@from-internal-3243;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',2787,2775,'ANSWERED',3,'','1275247581.506',''),('2010-05-30 21:40:05','\"4695315294\" <4695315294>','4695315294','FMPR-200','from-internal','Local/FMPR-200@from-internal-8314;2','SIP/200-00000116','Hangup','',60,0,'FAILED',3,'','1275273605.519',''),('2010-05-30 21:40:05','\"4695315294\" <4695315294>','4695315294','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-1fec;2','Local/RG-200-2146904814#@from-internal-a2b2;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',64,0,'NO ANSWER',3,'','1275273605.521',''),('2010-05-30 21:40:05','\"4695315294\" <4695315294>','4695315294','vmu200','ext-local','SIP/unlimitednet-00000115','Local/FMGL-2146904814#@from-internal-1fec;1','VoiceMail','200@default,u\"\"',69,5,'ANSWERED',3,'','1275273605.517',''),('2010-05-30 21:40:09','','','2146904814','from-internal','Local/2146904814@from-internal-4522;1','','MacroExit','',77,33,'ANSWERED',3,'','1275273609.525',''),('2010-05-30 21:40:09','\"4695315294\" <4695315294>','4695315294','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-a2b2;2','Local/2146904814@from-internal-4522;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',77,0,'NO ANSWER',3,'','1275273609.524',''),('2010-05-30 21:40:09','4695315294','4695315294','2146904814','from-internal','Local/2146904814@from-internal-4522;2','SIP/unlimitednet-00000117','Dial','SIP/unlimitednet/2146904814,300,T',77,33,'ANSWERED',3,'','1275273609.526',''),('2010-05-31 14:45:26','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000118','SIP/unlimitednet-00000119','Dial','SIP/unlimitednet/9893625004,300,T',214,195,'ANSWERED',3,'','1275335126.528',''),('2010-05-31 14:49:08','\"Kris Anderson\" <2146130162>','2146130162','12146904814','from-internal','SIP/200-0000011a','SIP/unlimitednet-0000011b','Dial','SIP/unlimitednet/2146904814,300,T',54,0,'NO ANSWER',3,'','1275335348.530',''),('2010-05-31 14:50:10','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000011c','SIP/unlimitednet-0000011d','Dial','SIP/unlimitednet/9893625004,300,T',504,491,'ANSWERED',3,'','1275335410.532',''),('2010-05-31 15:01:41','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-23bb;2','Local/RG-200-2146904814#@from-internal-f7ac;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',7,0,'NO ANSWER',3,'','1275336101.538',''),('2010-05-31 15:01:46','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-f7ac;2','Local/2146904814@from-internal-17b0;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1275336106.541',''),('2010-05-31 15:01:46','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-17b0;2','SIP/unlimitednet-00000120','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1275336106.543',''),('2010-05-31 15:01:41','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-28c0;2','SIP/200-0000011f','Dial','SIP/200,64,trM(auto-blkvm)',7,0,'ANSWERED',3,'','1275336101.536',''),('2010-05-31 15:01:41','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000011e','Local/FMPR-200@from-internal-28c0;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',83,76,'ANSWERED',3,'','1275336101.534',''),('2010-06-01 10:53:45','\"Restricted\" <Restricted>','Restricted','300','from-did-direct','SIP/unlimitednet-00000121','SIP/300-00000122','Dial','SIP/300,\"\",tr',29,19,'ANSWERED',3,'','1275407625.545',''),('2010-06-01 12:16:59','\"3042635451\" <3042635451>','3042635451','s','from-trunk','SIP/unlimitednet-00000123','','Hangup','',14,14,'ANSWERED',3,'','1275412619.547',''),('2010-06-02 10:59:34','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-00000124','','Hangup','',14,14,'ANSWERED',3,'','1275494374.548',''),('2010-06-02 12:31:17','\"Sam Sprain\" <3607196747>','3607196747','2145860555','from-internal','SIP/201-00000125','SIP/unlimitednet-00000126','Dial','SIP/unlimitednet/2145860555,300,T',1012,1007,'ANSWERED',3,'','1275499877.549',''),('2010-06-02 14:04:45','\"David Anderson\" <3607197197>','3607197197','9726681900','from-internal','SIP/300-00000127','SIP/unlimitednet-00000128','Dial','SIP/unlimitednet/9726681900,300,T',137,94,'ANSWERED',3,'','1275505485.551',''),('2010-06-02 18:33:17','\"4147556409\" <4147556409>','4147556409','s','from-trunk','SIP/unlimitednet-00000129','','SayAlpha','2146130043',9,9,'ANSWERED',3,'','1275521597.553',''),('2010-06-02 18:48:50','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-72d5;2','SIP/200-0000012b','Hangup','',60,0,'FAILED',3,'','1275522530.556',''),('2010-06-02 18:48:50','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-4a46;2','Local/RG-200-2146904814#@from-internal-697b;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',64,0,'NO ANSWER',3,'','1275522530.558',''),('2010-06-02 18:48:54','','','2146904814','from-internal','Local/2146904814@from-internal-a833;1','','MacroExit','',70,47,'ANSWERED',3,'','1275522534.562',''),('2010-06-02 18:48:54','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-697b;2','Local/2146904814@from-internal-a833;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',70,0,'NO ANSWER',3,'','1275522534.561',''),('2010-06-02 18:48:54','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-a833;2','SIP/unlimitednet-0000012c','Dial','SIP/unlimitednet/2146904814,300,T',70,47,'ANSWERED',3,'','1275522534.563',''),('2010-06-02 18:48:49','\"9893625004\" <9893625004>','9893625004','vmu200','ext-local','SIP/unlimitednet-0000012a','Local/FMGL-2146904814#@from-internal-4a46;1','VoiceMail','200@default,u\"\"',75,10,'ANSWERED',3,'','1275522529.554',''),('2010-06-02 19:03:08','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000012d','Local/FMGL-2146904814#@from-internal-9b6d;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',55,0,'NO ANSWER',3,'','1275523388.565',''),('2010-06-02 19:03:08','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-9b6d;2','Local/RG-200-2146904814#@from-internal-4c14;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',55,0,'NO ANSWER',3,'','1275523388.569',''),('2010-06-02 19:03:08','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-243c;2','SIP/200-0000012e','Dial','SIP/200,64,trM(auto-blkvm)',55,0,'NO ANSWER',3,'','1275523388.567',''),('2010-06-02 19:03:12','','','2146904814','from-internal','Local/2146904814@from-internal-327b;1','','MacroExit','',91,68,'ANSWERED',3,'','1275523392.573',''),('2010-06-02 19:03:12','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-327b;2','SIP/unlimitednet-0000012f','Dial','SIP/unlimitednet/2146904814,300,T',91,68,'ANSWERED',3,'','1275523392.574',''),('2010-06-02 19:03:12','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-4c14;2','Local/2146904814@from-internal-327b;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',91,0,'NO ANSWER',3,'','1275523392.572',''),('2010-06-02 20:16:12','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000130','SIP/unlimitednet-00000131','Dial','SIP/unlimitednet/8888413446,300,T',27,24,'ANSWERED',3,'','1275527772.576',''),('2010-06-02 20:24:37','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000132','SIP/unlimitednet-00000133','Dial','SIP/unlimitednet/9893625004,300,T',501,486,'ANSWERED',3,'','1275528277.578',''),('2010-06-03 10:48:47','\"3606907261\" <3606907261>','3606907261','FMPR-200','from-internal','Local/FMPR-200@from-internal-17dc;2','SIP/200-00000135','Hangup','',61,0,'FAILED',3,'','1275580127.582',''),('2010-06-03 10:48:47','\"3606907261\" <3606907261>','3606907261','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-afc2;2','Local/RG-200-2146904814#@from-internal-d833;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',64,0,'NO ANSWER',3,'','1275580127.584',''),('2010-06-03 10:48:52','','','2146904814','from-internal','Local/2146904814@from-internal-13fd;1','','MacroExit','',74,33,'ANSWERED',3,'','1275580132.588',''),('2010-06-03 10:48:52','3606907261','3606907261','2146904814','from-internal','Local/2146904814@from-internal-13fd;2','SIP/unlimitednet-00000136','Dial','SIP/unlimitednet/2146904814,300,T',74,33,'ANSWERED',3,'','1275580132.589',''),('2010-06-03 10:48:51','\"3606907261\" <3606907261>','3606907261','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-d833;2','Local/2146904814@from-internal-13fd;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',75,0,'NO ANSWER',3,'','1275580131.587',''),('2010-06-03 10:48:47','\"3606907261\" <3606907261>','3606907261','vmu200','ext-local','SIP/unlimitednet-00000134','Local/FMGL-2146904814#@from-internal-afc2;1','VoiceMail','200@default,u\"\"',150,86,'ANSWERED',3,'','1275580127.580',''),('2010-06-03 13:14:42','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-6cbd;2','SIP/200-00000138','Dial','SIP/200,64,trM(auto-blkvm)',23,0,'NO ANSWER',3,'','1275588882.593',''),('2010-06-03 13:14:46','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-5277;2','Local/2146904814@from-internal-4d32;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',19,4,'ANSWERED',3,'','1275588886.598',''),('2010-06-03 13:14:42','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-4b2d;2','Local/RG-200-2146904814#@from-internal-5277;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',23,0,'ANSWERED',3,'','1275588882.595',''),('2010-06-03 13:15:56','\"2145546238\" <2145546238>','2145546238','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-b427;2','Local/2146904814@from-internal-cbd2;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',6,0,'NO ANSWER',3,'','1275588956.611',''),('2010-06-03 13:15:52','\"2145546238\" <2145546238>','2145546238','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-466e;2','Local/RG-200-2146904814#@from-internal-b427;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',10,0,'NO ANSWER',3,'','1275588952.608',''),('2010-06-03 13:15:56','2145546238','2145546238','2146904814','from-internal','Local/2146904814@from-internal-cbd2;2','SIP/unlimitednet-0000013e','Dial','SIP/unlimitednet/2146904814,300,T',6,0,'NO ANSWER',3,'','1275588956.613',''),('2010-06-03 13:15:52','\"2145546238\" <2145546238>','2145546238','FMPR-200','from-internal','Local/FMPR-200@from-internal-31d2;2','SIP/200-0000013d','Dial','SIP/200,64,trM(auto-blkvm)',10,0,'ANSWERED',3,'','1275588952.606',''),('2010-06-03 13:15:52','\"2145546238\" <2145546238>','2145546238','200','from-did-direct','SIP/unlimitednet-0000013c','Local/FMPR-200@from-internal-31d2;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',87,77,'ANSWERED',3,'','1275588952.604',''),('2010-06-03 13:15:18','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000013a','SIP/unlimitednet-0000013b','Dial','SIP/unlimitednet/9893625004,300,T',141,117,'ANSWERED',3,'','1275588918.602',''),('2010-06-03 13:14:46','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-4d32;2','SIP/unlimitednet-00000139','Dial','SIP/unlimitednet/2146904814,300,T',1683,1668,'ANSWERED',3,'','1275588886.600',''),('2010-06-03 13:14:41','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000137','Local/FMGL-2146904814#@from-internal-4b2d;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',1688,1664,'ANSWERED',3,'','1275588881.591',''),('2010-06-03 14:58:52','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-0000013f','SIP/unlimitednet-00000140','Dial','SIP/unlimitednet/3609536629,300,T',206,195,'ANSWERED',3,'','1275595132.615',''),('2010-06-03 16:16:05','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-00000141','SIP/300-00000142','Dial','SIP/300,\"\",tr',421,409,'ANSWERED',3,'','1275599765.617',''),('2010-06-03 17:30:16','\"3606907261\" <3606907261>','3606907261','200','from-did-direct','SIP/unlimitednet-00000143','Local/FMGL-2146904814#@from-internal-a658;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',18,0,'NO ANSWER',3,'','1275604216.619',''),('2010-06-03 17:30:16','\"3606907261\" <3606907261>','3606907261','FMPR-200','from-internal','Local/FMPR-200@from-internal-8fa9;2','SIP/200-00000144','Dial','SIP/200,64,trM(auto-blkvm)',18,0,'NO ANSWER',3,'','1275604216.621',''),('2010-06-03 17:30:20','\"3606907261\" <3606907261>','3606907261','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-eb23;2','Local/2146904814@from-internal-33e7;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',14,0,'NO ANSWER',3,'','1275604220.626',''),('2010-06-03 17:30:16','\"3606907261\" <3606907261>','3606907261','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-a658;2','Local/RG-200-2146904814#@from-internal-eb23;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',18,0,'NO ANSWER',3,'','1275604216.623',''),('2010-06-03 17:30:20','3606907261','3606907261','2146904814','from-internal','Local/2146904814@from-internal-33e7;2','SIP/unlimitednet-00000145','Dial','SIP/unlimitednet/2146904814,300,T',14,0,'NO ANSWER',3,'','1275604220.628',''),('2010-06-03 17:38:50','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-6566;2','Local/2146904814@from-internal-1c85;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',15,0,'NO ANSWER',3,'','1275604730.637',''),('2010-06-03 17:38:51','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-1c85;2','SIP/unlimitednet-00000148','Dial','SIP/unlimitednet/2146904814,300,T',14,0,'NO ANSWER',3,'','1275604731.639',''),('2010-06-03 17:38:46','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-388d;2','Local/RG-200-2146904814#@from-internal-6566;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',19,0,'NO ANSWER',3,'','1275604726.634',''),('2010-06-03 17:38:46','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-e0ba;2','SIP/200-00000147','Dial','SIP/200,64,trM(auto-blkvm)',19,0,'ANSWERED',3,'','1275604726.632',''),('2010-06-03 17:38:46','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000146','Local/FMPR-200@from-internal-e0ba;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',36,17,'ANSWERED',3,'','1275604726.630',''),('2010-06-03 18:23:39','\"Kris Anderson\" <2146130162>','2146130162','2146975482','from-internal','SIP/200-00000149','SIP/unlimitednet-0000014a','Dial','SIP/unlimitednet/2146975482,300,T',322,300,'ANSWERED',3,'','1275607419.641',''),('2010-06-03 20:22:37','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-0000014b','SIP/unlimitednet-0000014c','Dial','SIP/unlimitednet/9893625004,300,T',37,20,'ANSWERED',3,'','1275614557.643',''),('2010-06-03 20:28:38','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-f8a9;2','Local/2146904814@from-internal-da97;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',30,0,'NO ANSWER',3,'','1275614918.652',''),('2010-06-03 20:28:34','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-b5a8;2','Local/RG-200-2146904814#@from-internal-f8a9;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',34,0,'NO ANSWER',3,'','1275614914.649',''),('2010-06-03 20:28:38','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-da97;2','SIP/unlimitednet-0000014f','Dial','SIP/unlimitednet/2146904814,300,T',30,0,'NO ANSWER',3,'','1275614918.654',''),('2010-06-03 20:28:34','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-7af0;2','SIP/200-0000014e','Dial','SIP/200,64,trM(auto-blkvm)',34,0,'ANSWERED',3,'','1275614914.647',''),('2010-06-03 20:28:34','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000014d','Local/FMPR-200@from-internal-7af0;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',717,683,'ANSWERED',3,'','1275614914.645',''),('2010-06-04 11:02:36','\"3606907263\" <3606907263>','3606907263','FMPR-200','from-internal','Local/FMPR-200@from-internal-5e0e;2','SIP/200-00000151','Hangup','',60,0,'FAILED',3,'','1275667356.658',''),('2010-06-04 11:02:36','\"3606907263\" <3606907263>','3606907263','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-8015;2','Local/RG-200-2146904814#@from-internal-060f;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',64,0,'NO ANSWER',3,'','1275667356.660',''),('2010-06-04 11:02:40','','','2146904814','from-internal','Local/2146904814@from-internal-08a6;1','','MacroExit','',76,33,'ANSWERED',3,'','1275667360.664',''),('2010-06-04 11:02:40','3606907263','3606907263','2146904814','from-internal','Local/2146904814@from-internal-08a6;2','SIP/unlimitednet-00000152','Dial','SIP/unlimitednet/2146904814,300,T',76,33,'ANSWERED',3,'','1275667360.665',''),('2010-06-04 11:02:40','\"3606907263\" <3606907263>','3606907263','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-060f;2','Local/2146904814@from-internal-08a6;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',76,0,'NO ANSWER',3,'','1275667360.663',''),('2010-06-04 11:02:36','\"3606907263\" <3606907263>','3606907263','vmu200','ext-local','SIP/unlimitednet-00000150','Local/FMGL-2146904814#@from-internal-8015;1','VoiceMail','200@default,u\"\"',99,35,'ANSWERED',3,'','1275667356.656',''),('2010-06-04 11:50:30','\"74.52.239.229\" <1>','1','s','from-trunk','SIP/216.245.215.82-00000153','','Playback','ss-noservice',4,4,'ANSWERED',3,'','1275670230.667',''),('2010-06-04 12:34:53','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-e9f9;2','Local/RG-200-2146904814#@from-internal-b1e6;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',51,0,'NO ANSWER',3,'','1275672893.672',''),('2010-06-04 12:34:53','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-96c9;2','SIP/200-00000155','Dial','SIP/200,64,trM(auto-blkvm)',51,0,'NO ANSWER',3,'','1275672893.670',''),('2010-06-04 12:34:53','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000154','Local/FMGL-2146904814#@from-internal-e9f9;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',51,0,'NO ANSWER',3,'','1275672893.668',''),('2010-06-04 12:34:58','','','2146904814','from-internal','Local/2146904814@from-internal-fb2e;1','','MacroExit','',89,68,'ANSWERED',3,'','1275672898.676',''),('2010-06-04 12:34:58','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-fb2e;2','SIP/unlimitednet-00000156','Dial','SIP/unlimitednet/2146904814,300,T',89,68,'ANSWERED',3,'','1275672898.677',''),('2010-06-04 12:34:58','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-b1e6;2','Local/2146904814@from-internal-fb2e;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',89,0,'NO ANSWER',3,'','1275672898.675',''),('2010-06-04 13:22:39','\"4699511286\" <4699511286>','4699511286','FMPR-200','from-internal','Local/FMPR-200@from-internal-8d3a;2','SIP/200-00000158','Hangup','',60,0,'FAILED',3,'','1275675759.681',''),('2010-06-04 13:22:39','\"4699511286\" <4699511286>','4699511286','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-a93e;2','Local/RG-200-2146904814#@from-internal-f3aa;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',64,0,'NO ANSWER',3,'','1275675759.683',''),('2010-06-04 13:22:39','\"4699511286\" <4699511286>','4699511286','vmu200','ext-local','SIP/unlimitednet-00000157','Local/FMGL-2146904814#@from-internal-a93e;1','VoiceMail','200@default,u\"\"',74,10,'ANSWERED',3,'','1275675759.679',''),('2010-06-04 13:22:43','','','2146904814','from-internal','Local/2146904814@from-internal-761c;1','','MacroExit','',77,33,'ANSWERED',3,'','1275675763.687',''),('2010-06-04 13:22:43','4699511286','4699511286','2146904814','from-internal','Local/2146904814@from-internal-761c;2','SIP/unlimitednet-00000159','Dial','SIP/unlimitednet/2146904814,300,T',77,33,'ANSWERED',3,'','1275675763.688',''),('2010-06-04 13:22:43','\"4699511286\" <4699511286>','4699511286','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-f3aa;2','Local/2146904814@from-internal-761c;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',77,0,'NO ANSWER',3,'','1275675763.686',''),('2010-06-04 13:45:51','2146904814','2146904814','2146904814','from-internal','Local/2146904814@from-internal-561b;2','SIP/unlimitednet-0000015c','Dial','SIP/unlimitednet/2146904814,300,T',42,34,'ANSWERED',3,'','1275677151.699',''),('2010-06-04 13:45:51','','','2146904814','from-internal','Local/2146904814@from-internal-561b;1','','BackGround','\"incoming-call-1-accept-2-decline\",m,en,macro-confirm',42,34,'ANSWERED',3,'','1275677151.698',''),('2010-06-04 13:45:51','\"2146904814\" <2146904814>','2146904814','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-31e6;2','Local/2146904814@from-internal-561b;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',42,0,'NO ANSWER',3,'','1275677151.697',''),('2010-06-04 13:45:47','\"2146904814\" <2146904814>','2146904814','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-142f;2','Local/RG-200-2146904814#@from-internal-31e6;1','Hangup','',46,0,'NO ANSWER',3,'','1275677147.694',''),('2010-06-04 13:45:47','\"2146904814\" <2146904814>','2146904814','FMPR-200','from-internal','Local/FMPR-200@from-internal-e7f0;2','SIP/200-0000015b','Hangup','',60,0,'FAILED',3,'','1275677147.692',''),('2010-06-04 13:45:47','\"2146904814\" <2146904814>','2146904814','vmu200','ext-local','SIP/unlimitednet-0000015a','Local/FMGL-2146904814#@from-internal-142f;1','VoiceMailMain','200@default',186,126,'ANSWERED',3,'','1275677147.690',''),('2010-06-04 14:20:19','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-0000015d','SIP/300-0000015e','Dial','SIP/300,\"\",tr',2835,2825,'ANSWERED',3,'','1275679219.701',''),('2010-06-04 17:09:57','\"4695315294\" <4695315294>','4695315294','200','from-did-direct','SIP/unlimitednet-0000015f','Local/FMGL-2146904814#@from-internal-a97a;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',33,0,'NO ANSWER',3,'','1275689397.703',''),('2010-06-04 17:09:57','\"4695315294\" <4695315294>','4695315294','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-a97a;2','Local/RG-200-2146904814#@from-internal-25dd;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',33,0,'NO ANSWER',3,'','1275689397.707',''),('2010-06-04 17:09:57','\"4695315294\" <4695315294>','4695315294','FMPR-200','from-internal','Local/FMPR-200@from-internal-ea1d;2','SIP/200-00000160','Dial','SIP/200,64,trM(auto-blkvm)',33,0,'NO ANSWER',3,'','1275689397.705',''),('2010-06-04 17:10:01','','','2146904814','from-internal','Local/2146904814@from-internal-8422;1','','MacroExit','',90,68,'ANSWERED',3,'','1275689401.711',''),('2010-06-04 17:10:01','4695315294','4695315294','2146904814','from-internal','Local/2146904814@from-internal-8422;2','SIP/unlimitednet-00000161','Dial','SIP/unlimitednet/2146904814,300,T',90,68,'ANSWERED',3,'','1275689401.712',''),('2010-06-04 17:10:01','\"4695315294\" <4695315294>','4695315294','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-25dd;2','Local/2146904814@from-internal-8422;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',90,0,'NO ANSWER',3,'','1275689401.710',''),('2010-06-05 11:52:22','\"3149638895\" <3149638895>','3149638895','300','from-did-direct','SIP/unlimitednet-00000162','SIP/300-00000163','Dial','SIP/300,\"\",tr',22,1,'ANSWERED',3,'','1275756742.714',''),('2010-06-05 12:20:28','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000164','Local/FMGL-2146904814#@from-internal-4d43;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',60,0,'NO ANSWER',3,'','1275758428.716',''),('2010-06-05 12:20:29','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-4d43;2','Local/RG-200-2146904814#@from-internal-b7f6;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',59,0,'NO ANSWER',3,'','1275758429.720',''),('2010-06-05 12:20:33','','','2146904814','from-internal','Local/2146904814@from-internal-42f0;1','','MacroExit','',110,68,'ANSWERED',3,'','1275758433.723',''),('2010-06-05 12:20:33','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-b7f6;2','Local/2146904814@from-internal-42f0;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',110,0,'NO ANSWER',3,'','1275758433.722',''),('2010-06-05 12:20:33','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-42f0;2','SIP/unlimitednet-00000165','Dial','SIP/unlimitednet/2146904814,300,T',110,68,'ANSWERED',3,'','1275758433.724',''),('2010-06-05 19:54:56','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-4606;2','SIP/unlimitednet-00000168','Dial','SIP/unlimitednet/2146904814,300,T',9,0,'NO ANSWER',3,'','1275785696.735',''),('2010-06-05 19:54:56','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-af3e;2','Local/2146904814@from-internal-4606;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',9,0,'NO ANSWER',3,'','1275785696.733',''),('2010-06-05 19:54:52','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-c7fa;2','Local/RG-200-2146904814#@from-internal-af3e;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',13,0,'NO ANSWER',3,'','1275785692.730',''),('2010-06-05 19:54:52','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-a153;2','SIP/200-00000167','Dial','SIP/200,64,trM(auto-blkvm)',13,0,'ANSWERED',3,'','1275785692.728',''),('2010-06-05 19:54:52','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000166','Local/FMPR-200@from-internal-a153;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',247,234,'ANSWERED',3,'','1275785692.726',''),('2010-06-06 21:08:03','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-7437;2','Local/RG-200-2146904814#@from-internal-8308;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',9,0,'NO ANSWER',3,'','1275876483.741',''),('2010-06-06 21:08:08','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-a6f7;2','SIP/unlimitednet-0000016b','Dial','SIP/unlimitednet/2146904814,300,T',4,0,'NO ANSWER',3,'','1275876488.746',''),('2010-06-06 21:08:08','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-8308;2','Local/2146904814@from-internal-a6f7;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',4,0,'NO ANSWER',3,'','1275876488.744',''),('2010-06-06 21:08:03','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-dc22;2','SIP/200-0000016a','Dial','SIP/200,64,trM(auto-blkvm)',9,0,'ANSWERED',3,'','1275876483.739',''),('2010-06-06 21:08:03','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000169','Local/FMPR-200@from-internal-dc22;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',50,41,'ANSWERED',3,'','1275876483.737',''),('2010-06-07 10:16:12','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-0000016c','SIP/unlimitednet-0000016d','Dial','SIP/unlimitednet/9728370573,300,T',57,22,'ANSWERED',3,'','1275923772.748',''),('2010-06-07 11:34:43','\"Kris Anderson\" <2146130162>','2146130162','2142571406','from-internal','SIP/200-0000016e','SIP/unlimitednet-0000016f','Dial','SIP/unlimitednet/2142571406,300,T',89,80,'ANSWERED',3,'','1275928483.750',''),('2010-06-07 14:24:56','\"9033610624\" <9033610624>','9033610624','300','from-did-direct','SIP/unlimitednet-00000170','SIP/300-00000171','Dial','SIP/300,\"\",tr',50,29,'ANSWERED',3,'','1275938696.752',''),('2010-06-07 14:35:01','\"89.185.255.41\" <12346>','12346','s','from-trunk','SIP/216.245.215.82-00000172','','Hangup','',16,16,'ANSWERED',3,'','1275939301.754',''),('2010-06-07 19:08:08','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-00000175','','Hangup','',15,15,'ANSWERED',3,'','1275955688.757',''),('2010-06-07 19:15:49','\"89.185.255.41\" <10000000>','10000000','s','from-trunk','SIP/216.245.215.82-00000176','','Playback','ss-noservice',5,5,'ANSWERED',3,'','1275956149.758',''),('2010-06-07 19:29:44','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000177','SIP/unlimitednet-00000178','Dial','SIP/unlimitednet/9893625004,300,T',948,931,'ANSWERED',3,'','1275956984.759',''),('2010-06-07 19:54:40','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000179','SIP/unlimitednet-0000017a','Dial','SIP/unlimitednet/9893625004,300,T',283,270,'ANSWERED',3,'','1275958480.761',''),('2010-06-07 18:54:03','\"4436150686\" <4436150686>','4436150686','300','from-did-direct','SIP/unlimitednet-00000173','SIP/300-00000174','Dial','SIP/300,\"\",tr',6004,5997,'ANSWERED',3,'','1275954843.755',''),('2010-06-08 12:59:13','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000017b','SIP/unlimitednet-0000017c','Dial','SIP/unlimitednet/9893625004,300,T',277,254,'ANSWERED',3,'','1276019953.763',''),('2010-06-08 13:07:22','\"Kris Anderson\" <2146130162>','2146130162','2142571406','from-internal','SIP/200-0000017d','SIP/unlimitednet-0000017e','Dial','SIP/unlimitednet/2142571406,300,T',35,26,'ANSWERED',3,'','1276020442.765',''),('2010-06-08 13:14:19','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000017f','SIP/unlimitednet-00000180','Dial','SIP/unlimitednet/9893625004,300,T',23,0,'NO ANSWER',3,'','1276020859.767',''),('2010-06-08 13:14:47','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000181','SIP/unlimitednet-00000182','Dial','SIP/unlimitednet/9893625004,300,T',398,384,'ANSWERED',3,'','1276020887.769',''),('2010-06-08 13:19:04','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-00000183','SIP/unlimitednet-00000184','Dial','SIP/unlimitednet/3609536629,300,T',528,508,'ANSWERED',3,'','1276021144.771',''),('2010-06-08 13:28:42','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-00000185','SIP/unlimitednet-00000186','Dial','SIP/unlimitednet/3609536629,300,T',1068,1054,'ANSWERED',3,'','1276021722.773',''),('2010-06-08 14:56:20','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000187','SIP/unlimitednet-00000188','Dial','SIP/unlimitednet/9893625004,300,T',1627,1610,'ANSWERED',3,'','1276026980.775',''),('2010-06-08 16:10:00','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-c7c0;2','SIP/unlimitednet-0000018b','Dial','SIP/unlimitednet/2146904814,300,T',9,0,'NO ANSWER',3,'','1276031400.786',''),('2010-06-08 16:09:56','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-0899;2','Local/RG-200-2146904814#@from-internal-5850;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',13,0,'NO ANSWER',3,'','1276031396.781',''),('2010-06-08 16:10:00','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-5850;2','Local/2146904814@from-internal-c7c0;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',9,0,'NO ANSWER',3,'','1276031400.784',''),('2010-06-08 16:09:56','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-9bb5;2','SIP/200-0000018a','Dial','SIP/200,64,trM(auto-blkvm)',13,0,'ANSWERED',3,'','1276031396.779',''),('2010-06-08 16:09:55','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000189','Local/FMPR-200@from-internal-9bb5;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',167,153,'ANSWERED',3,'','1276031395.777',''),('2010-06-08 17:31:39','\"3606907261\" <3606907261>','3606907261','FMPR-200','from-internal','Local/FMPR-200@from-internal-7e1c;2','SIP/200-0000018d','Hangup','',60,0,'FAILED',3,'','1276036299.790',''),('2010-06-08 17:31:39','\"3606907261\" <3606907261>','3606907261','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-329c;2','Local/RG-200-2146904814#@from-internal-18b7;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',64,0,'NO ANSWER',3,'','1276036299.792',''),('2010-06-08 17:31:44','','','2146904814','from-internal','Local/2146904814@from-internal-d1f8;1','','MacroExit','',74,33,'ANSWERED',3,'','1276036304.796',''),('2010-06-08 17:31:44','3606907261','3606907261','2146904814','from-internal','Local/2146904814@from-internal-d1f8;2','SIP/unlimitednet-0000018e','Dial','SIP/unlimitednet/2146904814,300,T',74,33,'ANSWERED',3,'','1276036304.797',''),('2010-06-08 17:31:43','\"3606907261\" <3606907261>','3606907261','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-18b7;2','Local/2146904814@from-internal-d1f8;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',75,0,'NO ANSWER',3,'','1276036303.795',''),('2010-06-08 17:31:39','\"3606907261\" <3606907261>','3606907261','vmu200','ext-local','SIP/unlimitednet-0000018c','Local/FMGL-2146904814#@from-internal-329c;1','VoiceMail','200@default,u\"\"',118,54,'ANSWERED',3,'','1276036299.788',''),('2010-06-08 17:52:44','\"David Anderson\" <3607197197>','3607197197','4436150686','from-internal','SIP/300-0000018f','SIP/unlimitednet-00000190','Dial','SIP/unlimitednet/4436150686,300,T',42,19,'ANSWERED',3,'','1276037564.799',''),('2010-06-08 18:19:53','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-00000193','','Hangup','',14,14,'ANSWERED',3,'','1276039193.803',''),('2010-06-08 18:18:07','\"David Anderson\" <3607197197>','3607197197','4436150686','from-internal','SIP/300-00000191','SIP/unlimitednet-00000192','Dial','SIP/unlimitednet/4436150686,300,T',4030,4013,'ANSWERED',3,'','1276039087.801',''),('2010-06-09 06:35:47','\"4692376038\" <4692376038>','4692376038','300','from-did-direct','SIP/unlimitednet-00000194','SIP/300-00000195','Dial','SIP/300,\"\",tr',26,22,'ANSWERED',3,'','1276083347.804',''),('2010-06-09 10:39:50','\"3149638895\" <3149638895>','3149638895','300','from-did-direct','SIP/unlimitednet-00000196','SIP/300-00000197','Dial','SIP/300,\"\",tr',13,4,'ANSWERED',3,'','1276097990.806',''),('2010-06-09 12:26:59','\"Kris Anderson\" <2146130162>','2146130162','2142571406','from-internal','SIP/200-00000198','SIP/unlimitednet-00000199','Dial','SIP/unlimitednet/2142571406,300,T',71,62,'ANSWERED',3,'','1276104419.808',''),('2010-06-09 14:11:20','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-0000019a','SIP/unlimitednet-0000019b','Dial','SIP/unlimitednet/9893625004,300,T',1000,980,'ANSWERED',3,'','1276110680.810',''),('2010-06-09 14:30:02','\"David Anderson\" <3607197197>','3607197197','9728713014','from-internal','SIP/300-0000019c','SIP/unlimitednet-0000019d','Dial','SIP/unlimitednet/9728713014,300,T',65,37,'ANSWERED',3,'','1276111802.812',''),('2010-06-09 14:34:52','\"9728713500\" <9728713500>','9728713500','300','from-did-direct','SIP/unlimitednet-0000019e','SIP/300-0000019f','Dial','SIP/300,\"\",tr',99,92,'ANSWERED',3,'','1276112092.814',''),('2010-06-09 18:03:31','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-000001a0','SIP/unlimitednet-000001a1','Dial','SIP/unlimitednet/9893625004,300,T',2286,2271,'ANSWERED',3,'','1276124611.816',''),('2010-06-10 09:01:34','\"David Anderson\" <3607197197>','3607197197','9725422619','from-internal','SIP/300-000001a2','SIP/unlimitednet-000001a3','Dial','SIP/unlimitednet/9725422619,300,T',153,142,'ANSWERED',3,'','1276178494.818',''),('2010-06-10 11:12:11','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-000001a4','SIP/300-000001a5','Dial','SIP/300,\"\",tr',956,948,'ANSWERED',3,'','1276186331.820',''),('2010-06-10 11:32:39','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-000001a6','SIP/unlimitednet-000001a7','Dial','SIP/unlimitednet/9893625004,300,T',1,0,'NO ANSWER',3,'','1276187559.822',''),('2010-06-10 11:33:11','\"Sam Sprain\" <3607196747>','3607196747','12142571406','from-internal','SIP/201-000001a8','SIP/unlimitednet-000001a9','Dial','SIP/unlimitednet/2142571406,300,T',60,51,'ANSWERED',3,'','1276187591.824',''),('2010-06-10 14:50:11','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-000001aa','SIP/unlimitednet-000001ab','Dial','SIP/unlimitednet/9893625004,300,T',525,509,'ANSWERED',3,'','1276199411.826',''),('2010-06-10 14:59:29','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-000001ac','SIP/300-000001ad','Dial','SIP/300,\"\",tr',146,140,'ANSWERED',3,'','1276199969.828',''),('2010-06-10 15:02:47','\"David Anderson\" <3607197197>','3607197197','9035273730','from-internal','SIP/300-000001ae','SIP/unlimitednet-000001af','Dial','SIP/unlimitednet/9035273730,300,T',284,271,'ANSWERED',3,'','1276200167.830',''),('2010-06-10 15:07:45','\"David Anderson\" <3607197197>','3607197197','9727571557','from-internal','SIP/300-000001b0','SIP/unlimitednet-000001b1','Dial','SIP/unlimitednet/9727571557,300,T',322,310,'ANSWERED',3,'','1276200465.832',''),('2010-06-10 15:55:54','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-d368;2','Local/2146904814@from-internal-95e3;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',34,0,'NO ANSWER',3,'','1276203354.841',''),('2010-06-10 15:55:50','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-ee36;2','Local/RG-200-2146904814#@from-internal-d368;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',38,0,'NO ANSWER',3,'','1276203350.838',''),('2010-06-10 15:55:55','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-95e3;2','SIP/unlimitednet-000001b4','Dial','SIP/unlimitednet/2146904814,300,T',33,0,'NO ANSWER',3,'','1276203355.843',''),('2010-06-10 15:55:50','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-8390;2','SIP/200-000001b3','Dial','SIP/200,64,trM(auto-blkvm)',38,0,'ANSWERED',3,'','1276203350.836',''),('2010-06-10 15:55:50','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000001b2','Local/FMPR-200@from-internal-8390;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',623,585,'ANSWERED',3,'','1276203350.834',''),('2010-06-10 18:44:38','\"David Anderson\" <3607197197>','3607197197','4693219136','from-internal','SIP/300-000001b5','SIP/unlimitednet-000001b6','Dial','SIP/unlimitednet/4693219136,300,T',36,17,'ANSWERED',3,'','1276213478.845',''),('2010-06-10 18:45:10','\"3608924185\" <3608924185>','3608924185','300','from-did-direct','SIP/unlimitednet-000001b7','SIP/300-000001b8','Dial','SIP/300,\"\",tr',451,445,'ANSWERED',3,'','1276213510.847',''),('2010-06-10 19:07:20','\"David Anderson\" <3607197197>','3607197197','4692376038','from-internal','SIP/300-000001b9','SIP/unlimitednet-000001ba','Dial','SIP/unlimitednet/4692376038,300,T',54,37,'ANSWERED',3,'','1276214840.849',''),('2010-06-10 19:08:27','\"David Anderson\" <3607197197>','3607197197','4436150686','from-internal','SIP/300-000001bb','SIP/unlimitednet-000001bc','Dial','SIP/unlimitednet/4436150686,300,T',2493,2466,'ANSWERED',3,'','1276214907.851',''),('2010-06-10 19:36:10','\"Sam Sprain\" <3607196747>','3607196747','12145647461','from-internal','SIP/201-000001bd','SIP/unlimitednet-000001be','Dial','SIP/unlimitednet/2145647461,300,T',1332,1296,'ANSWERED',3,'','1276216570.853',''),('2010-06-11 08:57:39','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-000001bf','SIP/unlimitednet-000001c0','Dial','SIP/unlimitednet/9728370573,300,T',132,122,'ANSWERED',3,'','1276264659.855',''),('2010-06-11 09:03:51','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-000001c1','SIP/unlimitednet-000001c2','Dial','SIP/unlimitednet/9728370573,300,T',165,150,'ANSWERED',3,'','1276265031.857',''),('2010-06-11 15:22:39','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-799f;2','SIP/200-000001c4','Dial','SIP/200,64,trM(auto-blkvm)',32,0,'NO ANSWER',3,'','1276287759.861',''),('2010-06-11 15:22:43','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-9a15;2','Local/2146904814@from-internal-a14d;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',28,4,'ANSWERED',3,'','1276287763.866',''),('2010-06-11 15:22:39','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-94a2;2','Local/RG-200-2146904814#@from-internal-9a15;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',32,0,'ANSWERED',3,'','1276287759.863',''),('2010-06-11 15:22:43','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-a14d;2','SIP/unlimitednet-000001c5','Dial','SIP/unlimitednet/2146904814,300,T',62,38,'ANSWERED',3,'','1276287763.868',''),('2010-06-11 15:22:34','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000001c3','Local/FMGL-2146904814#@from-internal-94a2;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',71,34,'ANSWERED',3,'','1276287754.859',''),('2010-06-11 19:50:56','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-2023;2','SIP/200-000001c7','Hangup','',60,0,'FAILED',3,'','1276303856.872',''),('2010-06-11 19:50:56','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000001c6','Local/FMGL-2146904814#@from-internal-1eb9;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',63,0,'NO ANSWER',3,'','1276303856.870',''),('2010-06-11 19:50:56','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-1eb9;2','Local/RG-200-2146904814#@from-internal-089c;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',63,0,'NO ANSWER',3,'','1276303856.874',''),('2010-06-11 19:51:00','','','2146904814','from-internal','Local/2146904814@from-internal-fe1d;1','','MacroExit','',110,68,'ANSWERED',3,'','1276303860.878',''),('2010-06-11 19:51:00','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-fe1d;2','SIP/unlimitednet-000001c8','Dial','SIP/unlimitednet/2146904814,300,T',110,68,'ANSWERED',3,'','1276303860.879',''),('2010-06-11 19:51:00','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-089c;2','Local/2146904814@from-internal-fe1d;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',110,0,'NO ANSWER',3,'','1276303860.877',''),('2010-06-11 19:53:26','\"David Anderson\" <3607197197>','3607197197','9729243990','from-internal','SIP/300-000001c9','SIP/unlimitednet-000001ca','Dial','SIP/unlimitednet/9729243990,300,T',106,88,'ANSWERED',3,'','1276304006.881',''),('2010-06-12 07:46:36','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-000001cb','SIP/unlimitednet-000001cc','Dial','SIP/unlimitednet/9728370573,300,T',36,17,'ANSWERED',3,'','1276346796.883',''),('2010-06-12 08:39:50','\"David Anderson\" <3607197197>','3607197197','3607197190','from-internal','SIP/300-000001cd','SIP/unlimitednet-000001ce','Dial','SIP/unlimitednet/3607197190,300,T',45,0,'NO ANSWER',3,'','1276349990.885',''),('2010-06-12 08:39:55','\"3607197197\" <3607197197>','3607197197','200','from-did-direct','SIP/unlimitednet-000001cf','Local/FMGL-2146904814#@from-internal-219e;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',40,0,'NO ANSWER',3,'','1276349995.887',''),('2010-06-12 08:40:00','\"3607197197\" <3607197197>','3607197197','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-252a;2','Local/2146904814@from-internal-5722;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',35,0,'NO ANSWER',3,'','1276350000.894',''),('2010-06-12 08:39:56','\"3607197197\" <3607197197>','3607197197','FMPR-200','from-internal','Local/FMPR-200@from-internal-98e5;2','SIP/200-000001d0','Dial','SIP/200,64,trM(auto-blkvm)',39,0,'NO ANSWER',3,'','1276349996.889',''),('2010-06-12 08:39:56','\"3607197197\" <3607197197>','3607197197','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-219e;2','Local/RG-200-2146904814#@from-internal-252a;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',39,0,'NO ANSWER',3,'','1276349996.891',''),('2010-06-12 08:40:00','3607197197','3607197197','2146904814','from-internal','Local/2146904814@from-internal-5722;2','SIP/unlimitednet-000001d1','Dial','SIP/unlimitednet/2146904814,300,T',35,0,'NO ANSWER',3,'','1276350000.896',''),('2010-06-12 08:40:53','\"David Anderson\" <3607197197>','3607197197','2146904734','from-internal','SIP/300-000001d2','SIP/unlimitednet-000001d3','Dial','SIP/unlimitednet/2146904734,300,T',58,25,'ANSWERED',3,'','1276350053.898',''),('2010-06-12 11:15:04','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-000001d4','','SayAlpha','2146130043',11,11,'ANSWERED',3,'','1276359304.900',''),('2010-06-13 06:37:21','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-000001d5','SIP/unlimitednet-000001d6','Dial','SIP/unlimitednet/8888413446,300,T',28,24,'ANSWERED',3,'','1276429041.901',''),('2010-06-14 10:26:29','\"9033610624\" <9033610624>','9033610624','300','from-did-direct','SIP/unlimitednet-000001d7','SIP/300-000001d8','Dial','SIP/300,\"\",tr',50,29,'ANSWERED',3,'','1276529189.903',''),('2010-06-14 11:04:43','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-000001d9','SIP/unlimitednet-000001da','Dial','SIP/unlimitednet/9728370573,300,T',48,15,'ANSWERED',3,'','1276531483.905',''),('2010-06-14 11:59:45','\"David Anderson\" <3607197197>','3607197197','9725482059','from-internal','SIP/300-000001db','SIP/unlimitednet-000001dc','Dial','SIP/unlimitednet/9725482059,300,T',114,93,'ANSWERED',3,'','1276534785.907',''),('2010-06-14 13:10:19','\"Kris Anderson\" <2146130162>','2146130162','19722967461','from-internal','SIP/200-000001dd','SIP/unlimitednet-000001de','Dial','SIP/unlimitednet/9722967461,300,T',35,5,'ANSWERED',3,'','1276539019.909',''),('2010-06-14 14:17:57','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-000001df','SIP/unlimitednet-000001e0','Dial','SIP/unlimitednet/9893625004,300,T',554,531,'ANSWERED',3,'','1276543077.911',''),('2010-06-14 14:43:01','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-02e4;2','Local/2146904814@from-internal-85cf;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',3,0,'NO ANSWER',3,'','1276544581.920',''),('2010-06-14 14:43:01','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-85cf;2','SIP/unlimitednet-000001e3','Dial','SIP/unlimitednet/2146904814,300,T',3,0,'NO ANSWER',3,'','1276544581.922',''),('2010-06-14 14:42:57','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-d3b1;2','Local/RG-200-2146904814#@from-internal-02e4;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',7,0,'NO ANSWER',3,'','1276544577.917',''),('2010-06-14 14:42:57','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-5104;2','SIP/200-000001e2','Dial','SIP/200,64,trM(auto-blkvm)',7,0,'ANSWERED',3,'','1276544577.915',''),('2010-06-14 14:42:57','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000001e1','Local/FMPR-200@from-internal-5104;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',1249,1242,'ANSWERED',3,'','1276544577.913',''),('2010-06-14 15:20:37','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-000001e4','SIP/unlimitednet-000001e5','Dial','SIP/unlimitednet/3609536629,300,T',785,761,'ANSWERED',3,'','1276546837.924',''),('2010-06-14 15:34:22','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-000001e6','SIP/unlimitednet-000001e7','Dial','SIP/unlimitednet/3609536629,300,T',30,15,'ANSWERED',3,'','1276547662.926',''),('2010-06-14 15:38:01','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-000001e8','SIP/300-000001e9','Dial','SIP/300,\"\",tr',170,164,'ANSWERED',3,'','1276547881.928',''),('2010-06-14 15:43:28','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-000001ea','SIP/unlimitednet-000001eb','Dial','SIP/unlimitednet/3609536629,300,T',1727,1700,'ANSWERED',3,'','1276548208.930',''),('2010-06-14 20:20:33','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-000001ec','SIP/unlimitednet-000001ed','Dial','SIP/unlimitednet/9893625004,300,T',562,537,'ANSWERED',3,'','1276564833.932',''),('2010-06-14 22:28:04','3609932543','3609932543','2146904814','from-internal','Local/2146904814@from-internal-f459;2','SIP/unlimitednet-000001f0','Dial','SIP/unlimitednet/2146904814,300,T',20,0,'NO ANSWER',3,'','1276572484.943',''),('2010-06-14 22:28:04','\"3609932543\" <3609932543>','3609932543','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-3782;2','Local/2146904814@from-internal-f459;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',20,0,'NO ANSWER',3,'','1276572484.941',''),('2010-06-14 22:28:00','\"3609932543\" <3609932543>','3609932543','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-cd12;2','Local/RG-200-2146904814#@from-internal-3782;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',24,0,'NO ANSWER',3,'','1276572480.938',''),('2010-06-14 22:28:00','\"3609932543\" <3609932543>','3609932543','FMPR-200','from-internal','Local/FMPR-200@from-internal-12da;2','SIP/200-000001ef','Dial','SIP/200,64,trM(auto-blkvm)',24,0,'ANSWERED',3,'','1276572480.936',''),('2010-06-14 22:28:00','\"3609932543\" <3609932543>','3609932543','200','from-did-direct','SIP/unlimitednet-000001ee','Local/FMPR-200@from-internal-12da;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',31,7,'ANSWERED',3,'','1276572480.934',''),('2010-06-14 22:32:19','\"3609932543\" <3609932543>','3609932543','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-610b;2','Local/2146904814@from-internal-af0d;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1276572739.952',''),('2010-06-14 22:32:15','\"3609932543\" <3609932543>','3609932543','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-6b36;2','Local/RG-200-2146904814#@from-internal-610b;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',6,0,'NO ANSWER',3,'','1276572735.949',''),('2010-06-14 22:32:19','3609932543','3609932543','2146904814','from-internal','Local/2146904814@from-internal-af0d;2','SIP/unlimitednet-000001f3','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1276572739.954',''),('2010-06-14 22:32:15','\"3609932543\" <3609932543>','3609932543','FMPR-200','from-internal','Local/FMPR-200@from-internal-6763;2','SIP/200-000001f2','Dial','SIP/200,64,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1276572735.947',''),('2010-06-14 22:32:15','\"3609932543\" <3609932543>','3609932543','200','from-did-direct','SIP/unlimitednet-000001f1','Local/FMPR-200@from-internal-6763;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',14,8,'ANSWERED',3,'','1276572735.945',''),('2010-06-15 10:45:36','\"Kris Anderson\" <2146130162>','2146130162','12142571406','from-internal','SIP/200-000001f4','SIP/unlimitednet-000001f5','Dial','SIP/unlimitednet/2142571406,300,T',227,218,'ANSWERED',3,'','1276616736.956',''),('2010-06-15 14:57:48','\"4436150686\" <4436150686>','4436150686','300','from-did-direct','SIP/unlimitednet-000001f6','SIP/300-000001f7','Dial','SIP/300,\"\",tr',850,840,'ANSWERED',3,'','1276631868.958',''),('2010-06-15 15:12:12','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-000001f8','SIP/unlimitednet-000001f9','Dial','SIP/unlimitednet/3609536629,300,T',25,6,'ANSWERED',3,'','1276632732.960',''),('2010-06-15 15:17:22','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-000001fa','SIP/unlimitednet-000001fb','Dial','SIP/unlimitednet/4694771253,300,T',130,116,'ANSWERED',3,'','1276633042.962',''),('2010-06-15 15:20:23','\"David Anderson\" <3607197197>','3607197197','8009378997','from-internal','SIP/300-000001fc','SIP/unlimitednet-000001fd','Dial','SIP/unlimitednet/8009378997,300,T',62,59,'ANSWERED',3,'','1276633223.964',''),('2010-06-15 15:22:06','\"David Anderson\" <3607197197>','3607197197','8009378997','from-internal','SIP/300-000001fe','SIP/unlimitednet-000001ff','Dial','SIP/unlimitednet/8009378997,300,T',1049,1043,'ANSWERED',3,'','1276633326.966',''),('2010-06-15 15:39:52','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-00000200','SIP/unlimitednet-00000201','Dial','SIP/unlimitednet/4694771253,300,T',199,191,'ANSWERED',3,'','1276634392.968',''),('2010-06-15 15:43:43','\"David Anderson\" <3607197197>','3607197197','4693219136','from-internal','SIP/300-00000202','SIP/unlimitednet-00000203','Dial','SIP/unlimitednet/4693219136,300,T',167,139,'ANSWERED',3,'','1276634623.970',''),('2010-06-15 15:48:08','\"David Anderson\" <3607197197>','3607197197','4436150686','from-internal','SIP/300-00000204','SIP/unlimitednet-00000205','Dial','SIP/unlimitednet/4436150686,300,T',1362,1338,'ANSWERED',3,'','1276634888.972',''),('2010-06-15 16:28:44','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-b104;2','Local/RG-200-2146904814#@from-internal-77da;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',13,0,'NO ANSWER',3,'','1276637324.978',''),('2010-06-15 16:28:48','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-77da;2','Local/2146904814@from-internal-a1a5;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',9,0,'NO ANSWER',3,'','1276637328.981',''),('2010-06-15 16:28:48','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-a1a5;2','SIP/unlimitednet-00000208','Dial','SIP/unlimitednet/2146904814,300,T',9,0,'NO ANSWER',3,'','1276637328.983',''),('2010-06-15 16:28:44','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-bbf5;2','SIP/200-00000207','Dial','SIP/200,64,trM(auto-blkvm)',13,0,'ANSWERED',3,'','1276637324.976',''),('2010-06-15 16:28:44','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000206','Local/FMPR-200@from-internal-bbf5;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',659,646,'ANSWERED',3,'','1276637324.974',''),('2010-06-15 17:16:35','\"Kris Anderson\" <2146130162>','2146130162','9726603240','from-internal','SIP/200-00000209','SIP/unlimitednet-0000020a','Dial','SIP/unlimitednet/9726603240,300,T',311,304,'ANSWERED',3,'','1276640195.985',''),('2010-06-15 17:46:36','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-d69f;2','Local/RG-200-2146904814#@from-internal-2a9b;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',15,0,'NO ANSWER',3,'','1276641996.991',''),('2010-06-15 17:46:40','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-fd74;2','SIP/unlimitednet-0000020d','Dial','SIP/unlimitednet/2146904814,300,T',11,0,'NO ANSWER',3,'','1276642000.996',''),('2010-06-15 17:46:40','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-2a9b;2','Local/2146904814@from-internal-fd74;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',11,0,'NO ANSWER',3,'','1276642000.994',''),('2010-06-15 17:46:36','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-e23e;2','SIP/200-0000020c','Dial','SIP/200,64,trM(auto-blkvm)',15,0,'ANSWERED',3,'','1276641996.989',''),('2010-06-15 17:46:36','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000020b','Local/FMPR-200@from-internal-e23e;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',89,74,'ANSWERED',3,'','1276641996.987',''),('2010-06-15 18:38:38','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-8202;2','Local/2146904814@from-internal-3640;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',31,5,'ANSWERED',3,'','1276645118.1004',''),('2010-06-15 18:38:34','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-ffa4;2','Local/RG-200-2146904814#@from-internal-8202;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',35,0,'ANSWERED',3,'','1276645114.1002',''),('2010-06-15 18:38:34','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000020e','Local/FMGL-2146904814#@from-internal-ffa4;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',221,186,'ANSWERED',3,'','1276645114.998',''),('2010-06-15 18:38:38','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-3640;2','SIP/unlimitednet-0000020f','Dial','SIP/unlimitednet/2146904814,300,T',217,191,'ANSWERED',3,'','1276645118.1006',''),('2010-06-15 20:43:20','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-00000210','SIP/300-00000211','Dial','SIP/300,\"\",tr',260,247,'ANSWERED',3,'','1276652600.1008',''),('2010-06-15 21:18:11','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-00000214','SIP/unlimitednet-00000215','Dial','SIP/unlimitednet/9728370573,300,T',80,69,'ANSWERED',3,'','1276654691.1012',''),('2010-06-16 12:11:39','\"9728713500\" <9728713500>','9728713500','300','from-did-direct','SIP/unlimitednet-00000216','SIP/300-00000217','Dial','SIP/300,\"\",tr',30,8,'ANSWERED',3,'','1276708299.1014',''),('2010-06-16 14:42:03','\"Kris Anderson\" <2146130162>','2146130162','19722967461','from-internal','SIP/200-00000218','SIP/unlimitednet-00000219','Dial','SIP/unlimitednet/9722967461,300,T',926,908,'ANSWERED',3,'','1276717323.1016',''),('2010-06-16 15:11:55','\"David Anderson\" <3607197197>','3607197197','9727571557','from-internal','SIP/300-0000021a','SIP/unlimitednet-0000021b','Dial','SIP/unlimitednet/9727571557,300,T',99,81,'ANSWERED',3,'','1276719115.1018',''),('2010-06-16 15:13:49','\"David Anderson\" <3607197197>','3607197197','9035273730','from-internal','SIP/300-0000021c','SIP/unlimitednet-0000021d','Dial','SIP/unlimitednet/9035273730,300,T',289,274,'ANSWERED',3,'','1276719229.1020',''),('2010-06-16 15:28:32','\"David Anderson\" <3607197197>','3607197197','9035273730','from-internal','SIP/300-0000021e','SIP/unlimitednet-0000021f','Dial','SIP/unlimitednet/9035273730,300,T',62,45,'ANSWERED',3,'','1276720112.1022',''),('2010-06-16 16:12:47','\"8772265663\" <8772265663>','8772265663','300','from-did-direct','SIP/unlimitednet-00000220','SIP/300-00000221','Dial','SIP/300,\"\",tr',51,46,'ANSWERED',3,'','1276722767.1024',''),('2010-06-16 16:27:40','\"David Anderson\" <3607197197>','3607197197','4692376038','from-internal','SIP/300-00000222','SIP/unlimitednet-00000223','Dial','SIP/unlimitednet/4692376038,300,T',451,433,'ANSWERED',3,'','1276723660.1026',''),('2010-06-16 16:37:34','\"David Anderson\" <3607197197>','3607197197','4692376038','from-internal','SIP/300-00000224','SIP/unlimitednet-00000225','Dial','SIP/unlimitednet/4692376038,300,T',325,308,'ANSWERED',3,'','1276724254.1028',''),('2010-06-16 17:10:00','\"4695315294\" <4695315294>','4695315294','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-0a6a;2','Local/RG-200-2146904814#@from-internal-6e3b;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',36,0,'NO ANSWER',3,'','1276726200.1034',''),('2010-06-16 17:10:00','\"4695315294\" <4695315294>','4695315294','200','from-did-direct','SIP/unlimitednet-00000226','Local/FMGL-2146904814#@from-internal-0a6a;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',36,0,'NO ANSWER',3,'','1276726200.1030',''),('2010-06-16 17:10:00','\"4695315294\" <4695315294>','4695315294','FMPR-200','from-internal','Local/FMPR-200@from-internal-afc9;2','SIP/200-00000227','Dial','SIP/200,64,trM(auto-blkvm)',36,0,'NO ANSWER',3,'','1276726200.1032',''),('2010-06-16 17:10:04','\"4695315294\" <4695315294>','4695315294','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-6e3b;2','Local/2146904814@from-internal-6d32;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',32,0,'NO ANSWER',3,'','1276726204.1037',''),('2010-06-16 17:10:04','4695315294','4695315294','2146904814','from-internal','Local/2146904814@from-internal-6d32;2','SIP/unlimitednet-00000228','Dial','SIP/unlimitednet/2146904814,300,T',32,0,'NO ANSWER',3,'','1276726204.1039',''),('2010-06-16 17:26:17','\"David Anderson\" <3607197197>','3607197197','9727689397','from-internal','SIP/300-00000229','SIP/unlimitednet-0000022a','Dial','SIP/unlimitednet/9727689397,300,T',26,19,'ANSWERED',3,'','1276727177.1041',''),('2010-06-16 17:29:14','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-0eba;2','SIP/200-0000022c','Hangup','',60,0,'FAILED',3,'','1276727354.1045',''),('2010-06-16 17:29:14','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-4f2d;2','Local/RG-200-2146904814#@from-internal-f699;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',64,0,'NO ANSWER',3,'','1276727354.1047',''),('2010-06-16 17:29:18','','','2146904814','from-internal','Local/2146904814@from-internal-6b26;1','','MacroExit','',75,33,'ANSWERED',3,'','1276727358.1051',''),('2010-06-16 17:29:18','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-6b26;2','SIP/unlimitednet-0000022d','Dial','SIP/unlimitednet/2146904814,300,T',75,33,'ANSWERED',3,'','1276727358.1052',''),('2010-06-16 17:29:18','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-f699;2','Local/2146904814@from-internal-6b26;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',75,0,'NO ANSWER',3,'','1276727358.1050',''),('2010-06-16 17:29:13','\"9893625004\" <9893625004>','9893625004','vmu200','ext-local','SIP/unlimitednet-0000022b','Local/FMGL-2146904814#@from-internal-4f2d;1','VoiceMail','200@default,u\"\"',85,20,'ANSWERED',3,'','1276727353.1043',''),('2010-06-16 18:19:13','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-0000022e','','SayAlpha','2146130043',13,13,'ANSWERED',3,'','1276730353.1054',''),('2010-06-16 20:42:55','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-0000022f','','SayAlpha','2146130043',11,11,'ANSWERED',3,'','1276738975.1055',''),('2010-06-17 09:37:10','\"9722967461\" <9722967461>','9722967461','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-4b05;2','Local/RG-200-2146904814#@from-internal-392f;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',14,0,'NO ANSWER',3,'','1276785430.1060',''),('2010-06-17 09:37:14','\"9722967461\" <9722967461>','9722967461','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-392f;2','Local/2146904814@from-internal-6df9;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',10,0,'NO ANSWER',3,'','1276785434.1063',''),('2010-06-17 09:37:14','9722967461','9722967461','2146904814','from-internal','Local/2146904814@from-internal-6df9;2','SIP/unlimitednet-00000232','Dial','SIP/unlimitednet/2146904814,300,T',10,0,'NO ANSWER',3,'','1276785434.1065',''),('2010-06-17 09:37:10','\"9722967461\" <9722967461>','9722967461','FMPR-200','from-internal','Local/FMPR-200@from-internal-e7ff;2','SIP/200-00000231','Dial','SIP/200,64,trM(auto-blkvm)',14,0,'ANSWERED',3,'','1276785430.1058',''),('2010-06-17 09:37:10','\"9722967461\" <9722967461>','9722967461','200','from-did-direct','SIP/unlimitednet-00000230','Local/FMPR-200@from-internal-e7ff;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',41,27,'ANSWERED',3,'','1276785430.1056',''),('2010-06-17 09:39:14','\"Sam Sprain\" <3607196747>','3607196747','19722967461','from-internal','SIP/201-00000233','SIP/unlimitednet-00000234','Dial','SIP/unlimitednet/9722967461,300,T',631,618,'ANSWERED',3,'','1276785554.1067',''),('2010-06-17 10:36:08','\"Sam Sprain\" <3607196747>','3607196747','19722967461','from-internal','SIP/201-00000235','SIP/unlimitednet-00000236','Dial','SIP/unlimitednet/9722967461,300,T',56,0,'NO ANSWER',3,'','1276788968.1069',''),('2010-06-17 12:31:54','\"195.211.156.9\" <1>','1','s','from-trunk','SIP/216.245.215.82-00000239','','Hangup','',19,19,'ANSWERED',3,'','1276795914.1073',''),('2010-06-17 12:32:02','\"195.211.156.9\" <1>','1','s','from-trunk','SIP/216.245.215.82-0000023a','','Hangup','',19,19,'ANSWERED',3,'','1276795922.1074',''),('2010-06-17 12:32:04','\"195.211.156.9\" <1>','1','s','from-trunk','SIP/216.245.215.82-0000023b','','Hangup','',18,18,'ANSWERED',3,'','1276795924.1075',''),('2010-06-17 12:32:04','\"195.211.156.9\" <1>','1','s','from-trunk','SIP/216.245.215.82-0000023c','','Hangup','',19,18,'ANSWERED',3,'','1276795924.1076',''),('2010-06-17 12:32:06','\"195.211.156.9\" <1>','1','s','from-trunk','SIP/216.245.215.82-0000023d','','Hangup','',18,18,'ANSWERED',3,'','1276795926.1077',''),('2010-06-17 12:32:06','\"195.211.156.9\" <1>','1','s','from-trunk','SIP/216.245.215.82-0000023e','','Hangup','',19,19,'ANSWERED',3,'','1276795926.1078',''),('2010-06-17 12:31:46','\"David Anderson\" <3607197197>','3607197197','4692376038','from-internal','SIP/300-00000237','SIP/unlimitednet-00000238','Dial','SIP/unlimitednet/4692376038,300,T',124,106,'ANSWERED',3,'','1276795906.1071',''),('2010-06-17 12:36:22','\"9722967461\" <9722967461>','9722967461','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-edf7;2','Local/2146904814@from-internal-2693;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',27,0,'NO ANSWER',3,'','1276796182.1086',''),('2010-06-17 12:36:18','\"9722967461\" <9722967461>','9722967461','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-9722;2','Local/RG-200-2146904814#@from-internal-edf7;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',31,0,'NO ANSWER',3,'','1276796178.1083',''),('2010-06-17 12:36:22','9722967461','9722967461','2146904814','from-internal','Local/2146904814@from-internal-2693;2','SIP/unlimitednet-00000241','Dial','SIP/unlimitednet/2146904814,300,T',27,0,'NO ANSWER',3,'','1276796182.1088',''),('2010-06-17 12:36:18','\"9722967461\" <9722967461>','9722967461','FMPR-200','from-internal','Local/FMPR-200@from-internal-c5b2;2','SIP/200-00000240','Dial','SIP/200,64,trM(auto-blkvm)',31,0,'ANSWERED',3,'','1276796178.1081',''),('2010-06-17 12:36:17','\"9722967461\" <9722967461>','9722967461','200','from-did-direct','SIP/unlimitednet-0000023f','Local/FMPR-200@from-internal-c5b2;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',5624,5592,'ANSWERED',3,'','1276796177.1079',''),('2010-06-17 14:10:08','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000242','SIP/unlimitednet-00000243','Dial','SIP/unlimitednet/9893625004,300,T',511,495,'ANSWERED',3,'','1276801808.1090',''),('2010-06-17 14:42:04','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-00000244','SIP/unlimitednet-00000245','Dial','SIP/unlimitednet/9728370573,300,T',28,22,'ANSWERED',3,'','1276803724.1092',''),('2010-06-17 15:25:26','\"Kris Anderson\" <2146130162>','2146130162','19722967461','from-internal','SIP/200-00000246','SIP/unlimitednet-00000247','Dial','SIP/unlimitednet/9722967461,300,T',889,875,'ANSWERED',3,'','1276806326.1094',''),('2010-06-17 15:44:02','\"Sam Sprain\" <3607196747>','3607196747','19722967461','from-internal','SIP/201-00000248','SIP/unlimitednet-00000249','Dial','SIP/unlimitednet/9722967461,300,T',825,814,'ANSWERED',3,'','1276807442.1096',''),('2010-06-17 16:22:47','\"Sam Sprain\" <3607196747>','3607196747','19722967461','from-internal','SIP/201-0000024a','SIP/unlimitednet-0000024b','Dial','SIP/unlimitednet/9722967461,300,T',518,506,'ANSWERED',3,'','1276809767.1098',''),('2010-06-17 16:41:04','\"Sam Sprain\" <3607196747>','3607196747','19722967461','from-internal','SIP/201-0000024c','SIP/unlimitednet-0000024d','Dial','SIP/unlimitednet/9722967461,300,T',168,146,'ANSWERED',3,'','1276810864.1100',''),('2010-06-17 16:49:38','\"Sam Sprain\" <3607196747>','3607196747','18175054517','from-internal','SIP/201-0000024e','SIP/unlimitednet-0000024f','Dial','SIP/unlimitednet/8175054517,300,T',38,25,'ANSWERED',3,'','1276811378.1102',''),('2010-06-17 17:11:22','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-00000250','SIP/unlimitednet-00000251','Dial','SIP/unlimitednet/9728370573,300,T',39,20,'ANSWERED',3,'','1276812682.1104',''),('2010-06-17 17:30:01','\"Sam Sprain\" <3607196747>','3607196747','19722967461','from-internal','SIP/201-00000252','SIP/unlimitednet-00000253','Dial','SIP/unlimitednet/9722967461,300,T',141,127,'ANSWERED',3,'','1276813801.1106',''),('2010-06-17 18:34:12','2145053574','2145053574','2146904814','from-internal','Local/2146904814@from-internal-63e0;2','SIP/unlimitednet-00000258','Dial','SIP/unlimitednet/2146904814,300,T',28,0,'NO ANSWER',3,'','1276817652.1119',''),('2010-06-17 18:34:08','\"2145053574\" <2145053574>','2145053574','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-a230;2','Local/RG-200-2146904814#@from-internal-957a;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',32,0,'NO ANSWER',3,'','1276817648.1114',''),('2010-06-17 18:34:12','\"2145053574\" <2145053574>','2145053574','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-957a;2','Local/2146904814@from-internal-63e0;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',28,0,'NO ANSWER',3,'','1276817652.1117',''),('2010-06-17 18:34:08','\"2145053574\" <2145053574>','2145053574','FMPR-200','from-internal','Local/FMPR-200@from-internal-362f;2','SIP/200-00000257','Dial','SIP/200,64,trM(auto-blkvm)',32,0,'ANSWERED',3,'','1276817648.1112',''),('2010-06-17 18:34:08','\"2145053574\" <2145053574>','2145053574','200','from-did-direct','SIP/unlimitednet-00000256','Local/FMPR-200@from-internal-362f;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',220,188,'ANSWERED',3,'','1276817648.1110',''),('2010-06-17 17:52:23','\"Sam Sprain\" <3607196747>','3607196747','19722967461','from-internal','SIP/201-00000254','SIP/unlimitednet-00000255','Dial','SIP/unlimitednet/9722967461,300,T',5964,5954,'ANSWERED',3,'','1276815143.1108',''),('2010-06-17 19:32:21','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-00000259','SIP/unlimitednet-0000025a','Dial','SIP/unlimitednet/9893625004,300,T',246,230,'ANSWERED',3,'','1276821141.1121',''),('2010-06-17 19:45:21','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-b253;2','Local/RG-200-2146904814#@from-internal-275a;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',30,0,'NO ANSWER',3,'','1276821921.1127',''),('2010-06-17 19:45:25','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-7580;2','SIP/unlimitednet-0000025d','Dial','SIP/unlimitednet/2146904814,300,T',26,0,'NO ANSWER',3,'','1276821925.1132',''),('2010-06-17 19:45:25','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-275a;2','Local/2146904814@from-internal-7580;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',26,0,'NO ANSWER',3,'','1276821925.1130',''),('2010-06-17 19:45:21','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-b85a;2','SIP/200-0000025c','Dial','SIP/200,64,trM(auto-blkvm)',30,0,'ANSWERED',3,'','1276821921.1125',''),('2010-06-17 19:45:20','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000025b','Local/FMPR-200@from-internal-b85a;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',51,20,'ANSWERED',3,'','1276821920.1123',''),('2010-06-17 20:10:13','\"9722967461\" <9722967461>','9722967461','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-a9bd;2','Local/2146904814@from-internal-66f9;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',13,0,'NO ANSWER',3,'','1276823413.1143',''),('2010-06-17 20:10:09','\"9722967461\" <9722967461>','9722967461','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-b974;2','Local/RG-200-2146904814#@from-internal-a9bd;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',17,0,'NO ANSWER',3,'','1276823409.1140',''),('2010-06-17 20:10:13','9722967461','9722967461','2146904814','from-internal','Local/2146904814@from-internal-66f9;2','SIP/unlimitednet-00000262','Dial','SIP/unlimitednet/2146904814,300,T',13,0,'NO ANSWER',3,'','1276823413.1145',''),('2010-06-17 20:10:09','\"9722967461\" <9722967461>','9722967461','FMPR-200','from-internal','Local/FMPR-200@from-internal-e61e;2','SIP/200-00000261','Dial','SIP/200,64,trM(auto-blkvm)',17,0,'ANSWERED',3,'','1276823409.1138',''),('2010-06-17 19:46:34','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-0000025e','SIP/unlimitednet-0000025f','Dial','SIP/unlimitednet/9893625004,300,T',1534,1524,'ANSWERED',3,'','1276821994.1134',''),('2010-06-17 20:10:09','\"9722967461\" <9722967461>','9722967461','200','from-did-direct','SIP/unlimitednet-00000260','Local/FMPR-200@from-internal-e61e;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',284,267,'ANSWERED',3,'','1276823409.1136',''),('2010-06-18 12:23:58','\"9726062592\" <9726062592>','9726062592','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-0d7c;2','Local/2146904814@from-internal-e331;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',5,0,'NO ANSWER',3,'','1276881838.1154',''),('2010-06-18 12:23:58','9726062592','9726062592','2146904814','from-internal','Local/2146904814@from-internal-e331;2','SIP/unlimitednet-00000265','Dial','SIP/unlimitednet/2146904814,300,T',5,0,'NO ANSWER',3,'','1276881838.1156',''),('2010-06-18 12:23:54','\"9726062592\" <9726062592>','9726062592','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-b2eb;2','Local/RG-200-2146904814#@from-internal-0d7c;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',9,0,'NO ANSWER',3,'','1276881834.1151',''),('2010-06-18 12:23:54','\"9726062592\" <9726062592>','9726062592','FMPR-200','from-internal','Local/FMPR-200@from-internal-40c8;2','SIP/200-00000264','Dial','SIP/200,64,trM(auto-blkvm)',9,0,'ANSWERED',3,'','1276881834.1149',''),('2010-06-18 12:23:54','\"9726062592\" <9726062592>','9726062592','200','from-did-direct','SIP/unlimitednet-00000263','Local/FMPR-200@from-internal-40c8;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',568,559,'ANSWERED',3,'','1276881834.1147',''),('2010-06-18 12:40:13','\"Kris Anderson\" <2146130162>','2146130162','2143762663','from-internal','SIP/200-00000266','SIP/unlimitednet-00000267','Dial','SIP/unlimitednet/2143762663,300,T',78,72,'ANSWERED',3,'','1276882813.1158',''),('2010-06-18 14:26:41','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-f871;2','SIP/200-00000269','Dial','SIP/200,64,trM(auto-blkvm)',41,0,'NO ANSWER',3,'','1276889201.1162',''),('2010-06-18 14:26:45','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-8c1f;2','Local/2146904814@from-internal-f753;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',37,5,'ANSWERED',3,'','1276889205.1167',''),('2010-06-18 14:26:41','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-666a;2','Local/RG-200-2146904814#@from-internal-8c1f;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',41,0,'ANSWERED',3,'','1276889201.1164',''),('2010-06-18 14:26:45','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-f753;2','SIP/unlimitednet-0000026a','Dial','SIP/unlimitednet/2146904814,300,T',251,219,'ANSWERED',3,'','1276889205.1169',''),('2010-06-18 14:26:41','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000268','Local/FMGL-2146904814#@from-internal-666a;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',255,214,'ANSWERED',3,'','1276889201.1160',''),('2010-06-18 17:29:29','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-0000026b','SIP/unlimitednet-0000026c','Dial','SIP/unlimitednet/9893625004,300,T',1770,1753,'ANSWERED',3,'','1276900169.1171',''),('2010-06-18 18:14:34','\"David Anderson\" <3607197197>','3607197197','4692376038','from-internal','SIP/300-0000026d','SIP/unlimitednet-0000026e','Dial','SIP/unlimitednet/4692376038,300,T',51,34,'ANSWERED',3,'','1276902874.1173',''),('2010-06-19 09:23:53','\"David Anderson\" <3607197197>','3607197197','9034552643','from-internal','SIP/300-0000026f','SIP/unlimitednet-00000270','Dial','SIP/unlimitednet/9034552643,300,T',41,11,'ANSWERED',3,'','1276957433.1175',''),('2010-06-19 18:39:29','\"2145545210\" <2145545210>','2145545210','FMPR-200','from-internal','Local/FMPR-200@from-internal-d187;2','SIP/200-00000272','Dial','SIP/200,64,trM(auto-blkvm)',36,0,'NO ANSWER',3,'','1276990769.1179',''),('2010-06-19 18:39:33','\"2145545210\" <2145545210>','2145545210','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-0d42;2','Local/2146904814@from-internal-446b;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',32,6,'ANSWERED',3,'','1276990773.1184',''),('2010-06-19 18:39:29','\"2145545210\" <2145545210>','2145545210','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-3bf5;2','Local/RG-200-2146904814#@from-internal-0d42;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',36,0,'ANSWERED',3,'','1276990769.1181',''),('2010-06-19 18:39:29','\"2145545210\" <2145545210>','2145545210','200','from-did-direct','SIP/unlimitednet-00000271','Local/FMGL-2146904814#@from-internal-3bf5;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',373,337,'ANSWERED',3,'','1276990769.1177',''),('2010-06-19 18:39:33','2145545210','2145545210','2146904814','from-internal','Local/2146904814@from-internal-446b;2','SIP/unlimitednet-00000273','Dial','SIP/unlimitednet/2146904814,300,T',369,343,'ANSWERED',3,'','1276990773.1186',''),('2010-06-20 16:12:41','\"4695315294\" <4695315294>','4695315294','200','from-did-direct','SIP/unlimitednet-00000274','Local/FMGL-2146904814#@from-internal-1e31;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',52,0,'NO ANSWER',3,'','1277068361.1188',''),('2010-06-20 16:12:41','\"4695315294\" <4695315294>','4695315294','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-1e31;2','Local/RG-200-2146904814#@from-internal-c074;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',52,0,'NO ANSWER',3,'','1277068361.1192',''),('2010-06-20 16:12:41','\"4695315294\" <4695315294>','4695315294','FMPR-200','from-internal','Local/FMPR-200@from-internal-0ab3;2','SIP/200-00000275','Dial','SIP/200,64,trM(auto-blkvm)',52,0,'NO ANSWER',3,'','1277068361.1190',''),('2010-06-20 16:12:45','','','2146904814','from-internal','Local/2146904814@from-internal-d5ad;1','','MacroExit','',85,68,'ANSWERED',3,'','1277068365.1196',''),('2010-06-20 16:12:45','\"4695315294\" <4695315294>','4695315294','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-c074;2','Local/2146904814@from-internal-d5ad;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',85,0,'NO ANSWER',3,'','1277068365.1195',''),('2010-06-20 16:12:45','4695315294','4695315294','2146904814','from-internal','Local/2146904814@from-internal-d5ad;2','SIP/unlimitednet-00000276','Dial','SIP/unlimitednet/2146904814,300,T',85,68,'ANSWERED',3,'','1277068365.1197',''),('2010-06-20 19:59:55','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-3732;2','SIP/unlimitednet-00000279','Dial','SIP/unlimitednet/2146904814,300,T',13,0,'NO ANSWER',3,'','1277081995.1208',''),('2010-06-20 19:59:55','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-d37c;2','Local/2146904814@from-internal-3732;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',13,0,'NO ANSWER',3,'','1277081995.1206',''),('2010-06-20 19:59:51','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-2cc0;2','Local/RG-200-2146904814#@from-internal-d37c;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',17,0,'NO ANSWER',3,'','1277081991.1203',''),('2010-06-20 19:59:51','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-7c70;2','SIP/200-00000278','Dial','SIP/200,64,trM(auto-blkvm)',17,0,'ANSWERED',3,'','1277081991.1201',''),('2010-06-20 19:59:51','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000277','Local/FMPR-200@from-internal-7c70;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',694,677,'ANSWERED',3,'','1277081991.1199',''),('2010-06-20 20:04:56','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-0000027a','SIP/300-0000027b','Dial','SIP/300,\"\",tr',766,753,'ANSWERED',3,'','1277082296.1210',''),('2010-06-20 20:17:06','\"Kris Anderson\" <2146130162>','2146130162','3607197197','from-internal','SIP/200-0000027c','SIP/unlimitednet-0000027d','Dial','SIP/unlimitednet/3607197197,300,T',592,571,'ANSWERED',3,'','1277083026.1212',''),('2010-06-20 20:17:12','\"2146130162\" <2146130162>','2146130162','300','from-did-direct','SIP/unlimitednet-0000027e','SIP/300-0000027f','Dial','SIP/300,\"\",tr',586,571,'ANSWERED',3,'','1277083032.1214',''),('2010-06-21 11:25:24','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-00000281','SIP/unlimitednet-00000282','Dial','SIP/unlimitednet/4694771253,300,T',46,23,'ANSWERED',3,'','1277137524.1217',''),('2010-06-21 12:17:47','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-00000283','SIP/unlimitednet-00000284','Dial','SIP/unlimitednet/4694771253,300,T',321,307,'ANSWERED',3,'','1277140667.1219',''),('2010-06-21 14:16:20','\"Kris Anderson\" <2146130162>','2146130162','12144845422','from-internal','SIP/200-00000285','SIP/unlimitednet-00000286','Dial','SIP/unlimitednet/2144845422,300,T',40,3,'ANSWERED',3,'','1277147780.1221',''),('2010-06-21 14:24:32','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000287','SIP/unlimitednet-00000288','Dial','SIP/unlimitednet/9893625004,300,T',197,181,'ANSWERED',3,'','1277148272.1223',''),('2010-06-21 15:35:09','\"Kris Anderson\" <200>','200','*97','from-internal','SIP/200-00000289','','Hangup','',40,40,'ANSWERED',3,'','1277152509.1225',''),('2010-06-21 15:51:30','\"Kris Anderson\" <2146130162>','2146130162','3607197197','from-internal','SIP/200-0000028a','SIP/unlimitednet-0000028b','Dial','SIP/unlimitednet/3607197197,300,T',70,55,'ANSWERED',3,'','1277153490.1226',''),('2010-06-21 15:51:38','\"2146130162\" <2146130162>','2146130162','300','from-did-direct','SIP/unlimitednet-0000028c','SIP/300-0000028d','Dial','SIP/300,\"\",tr',63,56,'ANSWERED',3,'','1277153498.1228',''),('2010-06-21 16:25:47','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000028e','SIP/unlimitednet-0000028f','Dial','SIP/unlimitednet/9893625004,300,T',170,155,'ANSWERED',3,'','1277155547.1230',''),('2010-06-21 16:41:10','\"Kris Anderson\" <2146130162>','2146130162','3602548123','from-internal','SIP/200-00000290','SIP/unlimitednet-00000291','Dial','SIP/unlimitednet/3602548123,300,T',1704,1687,'ANSWERED',3,'','1277156470.1232',''),('2010-06-21 17:34:00','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-00000292','','SayAlpha','2146130043',11,11,'ANSWERED',3,'','1277159640.1234',''),('2010-06-21 18:47:51','\"4799295268\" <4799295268>','4799295268','s','from-trunk','SIP/unlimitednet-00000293','','Hangup','',13,13,'ANSWERED',3,'','1277164071.1235',''),('2010-06-21 19:39:21','3607197197','3607197197','2146904814','from-internal','Local/2146904814@from-internal-af7d;2','SIP/unlimitednet-0000029a','Dial','SIP/unlimitednet/2146904814,300,T',13,0,'NO ANSWER',3,'','1277167161.1249',''),('2010-06-21 19:39:20','\"3607197197\" <3607197197>','3607197197','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-16aa;2','Local/2146904814@from-internal-af7d;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',14,0,'NO ANSWER',3,'','1277167160.1247',''),('2010-06-21 19:39:16','\"3607197197\" <3607197197>','3607197197','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-4332;2','Local/RG-200-2146904814#@from-internal-16aa;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',18,0,'NO ANSWER',3,'','1277167156.1244',''),('2010-06-21 19:39:16','\"3607197197\" <3607197197>','3607197197','FMPR-200','from-internal','Local/FMPR-200@from-internal-60d8;2','SIP/200-00000299','Dial','SIP/200,64,trM(auto-blkvm)',18,0,'ANSWERED',3,'','1277167156.1242',''),('2010-06-21 19:11:17','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000294','SIP/unlimitednet-00000295','Dial','SIP/unlimitednet/9893625004,300,T',1698,1683,'ANSWERED',3,'','1277165477.1236',''),('2010-06-21 19:39:16','\"3607197197\" <3607197197>','3607197197','200','from-did-direct','SIP/unlimitednet-00000298','Local/FMPR-200@from-internal-60d8;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',132,114,'ANSWERED',3,'','1277167156.1240',''),('2010-06-21 19:39:10','\"David Anderson\" <3607197197>','3607197197','2146130162','from-internal','SIP/300-00000296','SIP/unlimitednet-00000297','Dial','SIP/unlimitednet/2146130162,300,T',139,115,'ANSWERED',3,'','1277167150.1238',''),('2010-06-21 19:42:55','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000029b','SIP/unlimitednet-0000029c','Dial','SIP/unlimitednet/9893625004,300,T',1547,1533,'ANSWERED',3,'','1277167375.1251',''),('2010-06-21 20:52:46','\"Kris Anderson\" <2146130162>','2146130162','3607197197','from-internal','SIP/200-0000029d','SIP/unlimitednet-0000029e','Dial','SIP/unlimitednet/3607197197,300,T',1522,1505,'ANSWERED',3,'','1277171566.1253',''),('2010-06-21 20:52:52','\"2146130162\" <2146130162>','2146130162','300','from-did-direct','SIP/unlimitednet-0000029f','SIP/300-000002a0','Dial','SIP/300,\"\",tr',1516,1505,'ANSWERED',3,'','1277171572.1255',''),('2010-06-22 12:06:08','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000002a1','SIP/unlimitednet-000002a2','Dial','SIP/unlimitednet/2144845422,300,T',2390,2376,'ANSWERED',3,'','1277226368.1257',''),('2010-06-22 13:40:13','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000002a3','SIP/unlimitednet-000002a4','Dial','SIP/unlimitednet/2144845422,300,T',1601,1589,'ANSWERED',3,'','1277232013.1259',''),('2010-06-22 14:14:49','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-000002a5','SIP/unlimitednet-000002a6','Dial','SIP/unlimitednet/9893625004,300,T',279,260,'ANSWERED',3,'','1277234089.1261',''),('2010-06-22 14:59:48','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000002a7','SIP/unlimitednet-000002a8','Dial','SIP/unlimitednet/2144845422,300,T',30,13,'ANSWERED',3,'','1277236788.1263',''),('2010-06-22 15:14:09','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-f116;2','SIP/unlimitednet-000002ab','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1277237649.1274',''),('2010-06-22 15:14:09','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-f297;2','Local/2146904814@from-internal-f116;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1277237649.1272',''),('2010-06-22 15:14:05','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-ae9d;2','Local/RG-200-2146904814#@from-internal-f297;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',6,0,'NO ANSWER',3,'','1277237645.1269',''),('2010-06-22 15:14:05','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-1b7b;2','SIP/200-000002aa','Dial','SIP/200,64,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1277237645.1267',''),('2010-06-22 15:14:04','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000002a9','Local/FMPR-200@from-internal-1b7b;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',762,755,'ANSWERED',3,'','1277237644.1265',''),('2010-06-22 16:01:29','\"Kris Anderson\" <2146130162>','2146130162','2147711958','from-internal','SIP/200-000002ac','SIP/unlimitednet-000002ad','Dial','SIP/unlimitednet/2147711958,300,T',41,21,'ANSWERED',3,'','1277240489.1276',''),('2010-06-22 16:24:15','\"9722844911\" <9722844911>','9722844911','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-9537;2','Local/2146904814@from-internal-d760;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',3,0,'NO ANSWER',3,'','1277241855.1285',''),('2010-06-22 16:24:11','\"9722844911\" <9722844911>','9722844911','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-0065;2','Local/RG-200-2146904814#@from-internal-9537;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',7,0,'NO ANSWER',3,'','1277241851.1282',''),('2010-06-22 16:24:15','9722844911','9722844911','2146904814','from-internal','Local/2146904814@from-internal-d760;2','SIP/unlimitednet-000002b0','Dial','SIP/unlimitednet/2146904814,300,T',3,0,'NO ANSWER',3,'','1277241855.1287',''),('2010-06-22 16:24:11','\"9722844911\" <9722844911>','9722844911','FMPR-200','from-internal','Local/FMPR-200@from-internal-7b46;2','SIP/200-000002af','Dial','SIP/200,64,trM(auto-blkvm)',7,0,'ANSWERED',3,'','1277241851.1280',''),('2010-06-22 16:24:11','\"9722844911\" <9722844911>','9722844911','200','from-did-direct','SIP/unlimitednet-000002ae','Local/FMPR-200@from-internal-7b46;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',3319,3312,'ANSWERED',3,'','1277241851.1278',''),('2010-06-22 17:21:09','\"Kris Anderson\" <2146130162>','2146130162','2146904814','from-internal','SIP/200-000002b1','SIP/unlimitednet-000002b2','Dial','SIP/unlimitednet/2146904814,300,T',47,7,'ANSWERED',3,'','1277245269.1289',''),('2010-06-22 17:22:28','\"Kris Anderson\" <2146130162>','2146130162','2146167264','from-internal','SIP/200-000002b3','SIP/unlimitednet-000002b4','Dial','SIP/unlimitednet/2146167264,300,T',78,47,'ANSWERED',3,'','1277245348.1291',''),('2010-06-23 11:16:41','\"Kris Anderson\" <2146130162>','2146130162','19722967461','from-internal','SIP/200-000002b5','SIP/unlimitednet-000002b6','Dial','SIP/unlimitednet/9722967461,300,T',37,19,'ANSWERED',3,'','1277309801.1293',''),('2010-06-23 11:17:41','2149294327','2149294327','2146904814','from-internal','Local/2146904814@from-internal-722d;2','SIP/unlimitednet-000002b9','Dial','SIP/unlimitednet/2146904814,300,T',8,0,'NO ANSWER',3,'','1277309861.1304',''),('2010-06-23 11:17:41','\"2149294327\" <2149294327>','2149294327','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-926b;2','Local/2146904814@from-internal-722d;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',8,0,'NO ANSWER',3,'','1277309861.1302',''),('2010-06-23 11:17:36','\"2149294327\" <2149294327>','2149294327','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-3def;2','Local/RG-200-2146904814#@from-internal-926b;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',13,0,'NO ANSWER',3,'','1277309856.1299',''),('2010-06-23 11:17:36','\"2149294327\" <2149294327>','2149294327','FMPR-200','from-internal','Local/FMPR-200@from-internal-1d5c;2','SIP/200-000002b8','Dial','SIP/200,64,trM(auto-blkvm)',13,0,'ANSWERED',3,'','1277309856.1297',''),('2010-06-23 11:17:36','\"2149294327\" <2149294327>','2149294327','200','from-did-direct','SIP/unlimitednet-000002b7','Local/FMPR-200@from-internal-1d5c;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',682,669,'ANSWERED',3,'','1277309856.1295',''),('2010-06-23 11:32:51','\"Kris Anderson\" <2146130162>','2146130162','2149294327','from-internal','SIP/200-000002ba','SIP/unlimitednet-000002bb','Dial','SIP/unlimitednet/2149294327,300,T',7,0,'NO ANSWER',3,'','1277310771.1306',''),('2010-06-23 11:33:21','\"Kris Anderson\" <2146130162>','2146130162','2149294327','from-internal','SIP/200-000002bc','SIP/unlimitednet-000002bd','Dial','SIP/unlimitednet/2149294327,300,T',379,353,'ANSWERED',3,'','1277310801.1308',''),('2010-06-23 11:55:45','\"Kris Anderson\" <2146130162>','2146130162','2149294327','from-internal','SIP/200-000002be','SIP/unlimitednet-000002bf','Dial','SIP/unlimitednet/2149294327,300,T',324,303,'ANSWERED',3,'','1277312145.1310',''),('2010-06-23 15:50:01','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000002c0','SIP/unlimitednet-000002c1','Dial','SIP/unlimitednet/2144845422,300,T',660,638,'ANSWERED',3,'','1277326201.1312',''),('2010-06-23 16:03:49','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-c95c;2','Local/RG-200-2146904814#@from-internal-5484;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',6,0,'NO ANSWER',3,'','1277327029.1318',''),('2010-06-23 16:03:54','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-6fd1;2','SIP/unlimitednet-000002c4','Dial','SIP/unlimitednet/2146904814,300,T',1,0,'NO ANSWER',3,'','1277327034.1323',''),('2010-06-23 16:03:53','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-5484;2','Local/2146904814@from-internal-6fd1;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1277327033.1321',''),('2010-06-23 16:03:49','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-7ac7;2','SIP/200-000002c3','Dial','SIP/200,64,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1277327029.1316',''),('2010-06-23 16:03:49','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000002c2','Local/FMPR-200@from-internal-7ac7;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',613,607,'ANSWERED',3,'','1277327029.1314',''),('2010-06-23 16:38:44','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-ccb7;2','Local/RG-200-2146904814#@from-internal-9c39;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',8,0,'NO ANSWER',3,'','1277329124.1329',''),('2010-06-23 16:38:48','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-9c39;2','Local/2146904814@from-internal-9772;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',4,0,'NO ANSWER',3,'','1277329128.1332',''),('2010-06-23 16:38:48','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-9772;2','SIP/unlimitednet-000002c7','Dial','SIP/unlimitednet/2146904814,300,T',4,0,'NO ANSWER',3,'','1277329128.1334',''),('2010-06-23 16:38:44','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-4142;2','SIP/200-000002c6','Dial','SIP/200,64,trM(auto-blkvm)',8,0,'ANSWERED',3,'','1277329124.1327',''),('2010-06-23 16:38:44','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000002c5','Local/FMPR-200@from-internal-4142;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',2983,2975,'ANSWERED',3,'','1277329124.1325',''),('2010-06-23 17:55:38','\"4436150686\" <4436150686>','4436150686','300','from-did-direct','SIP/unlimitednet-000002ca','SIP/300-000002cb','Dial','SIP/300,\"\",tr',25,14,'ANSWERED',3,'','1277333738.1338',''),('2010-06-23 17:52:20','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000002c8','SIP/unlimitednet-000002c9','Dial','SIP/unlimitednet/2144845422,300,T',305,293,'ANSWERED',3,'','1277333540.1336',''),('2010-06-23 17:59:51','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-a1aa;2','Local/RG-200-2146904814#@from-internal-aa46;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',6,0,'NO ANSWER',3,'','1277333991.1346',''),('2010-06-23 17:59:55','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-1482;2','SIP/unlimitednet-000002d0','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1277333995.1351',''),('2010-06-23 17:59:55','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-aa46;2','Local/2146904814@from-internal-1482;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1277333995.1349',''),('2010-06-23 17:59:51','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-984b;2','SIP/200-000002cf','Dial','SIP/200,64,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1277333991.1344',''),('2010-06-23 18:01:39','\"Kris Anderson\" <2146130162>','2146130162','19722967461','from-internal','SIP/200-000002d1','SIP/unlimitednet-000002d2','Dial','SIP/unlimitednet/9722967461,300,T',34,4,'ANSWERED',3,'','1277334099.1353',''),('2010-06-23 18:02:30','\"Kris Anderson\" <2146130162>','2146130162','2149294372','from-internal','SIP/200-000002d3','SIP/unlimitednet-000002d4','Dial','SIP/unlimitednet/2149294372,300,T',38,2,'ANSWERED',3,'','1277334150.1355',''),('2010-06-23 17:56:36','\"David Anderson\" <3607197197>','3607197197','4436150686','from-internal','SIP/300-000002cc','SIP/unlimitednet-000002cd','Dial','SIP/unlimitednet/4436150686,300,T',521,507,'ANSWERED',3,'','1277333796.1340',''),('2010-06-23 17:59:51','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000002ce','Local/FMPR-200@from-internal-984b;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',801,795,'ANSWERED',3,'','1277333991.1342',''),('2010-06-23 19:28:46','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-000002d5','SIP/unlimitednet-000002d6','Dial','SIP/unlimitednet/9728370573,300,T',91,81,'ANSWERED',3,'','1277339326.1357',''),('2010-06-23 19:40:05','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000002d7','Local/FMGL-2146904814#@from-internal-8878;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',16,0,'NO ANSWER',3,'','1277340005.1359',''),('2010-06-23 19:40:10','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-26b7;2','Local/2146904814@from-internal-d7aa;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',11,0,'NO ANSWER',3,'','1277340010.1366',''),('2010-06-23 19:40:06','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-4932;2','SIP/200-000002d8','Dial','SIP/200,64,trM(auto-blkvm)',15,0,'NO ANSWER',3,'','1277340006.1361',''),('2010-06-23 19:40:10','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-d7aa;2','SIP/unlimitednet-000002d9','Dial','SIP/unlimitednet/2146904814,300,T',11,0,'NO ANSWER',3,'','1277340010.1368',''),('2010-06-23 19:40:06','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-8878;2','Local/RG-200-2146904814#@from-internal-26b7;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',15,0,'NO ANSWER',3,'','1277340006.1363',''),('2010-06-23 19:41:01','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000002da','SIP/unlimitednet-000002db','Dial','SIP/unlimitednet/2144845422,300,T',81,71,'ANSWERED',3,'','1277340061.1370',''),('2010-06-23 20:34:51','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-cdd2;2','SIP/unlimitednet-000002de','Dial','SIP/unlimitednet/2146904814,300,T',1,0,'NO ANSWER',3,'','1277343291.1381',''),('2010-06-23 20:34:51','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-166e;2','Local/2146904814@from-internal-cdd2;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',1,0,'NO ANSWER',3,'','1277343291.1379',''),('2010-06-23 20:34:47','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-7afc;2','Local/RG-200-2146904814#@from-internal-166e;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',5,0,'NO ANSWER',3,'','1277343287.1376',''),('2010-06-23 20:34:47','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-a4dc;2','SIP/200-000002dd','Dial','SIP/200,64,trM(auto-blkvm)',5,0,'ANSWERED',3,'','1277343287.1374',''),('2010-06-23 20:34:46','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000002dc','Local/FMPR-200@from-internal-a4dc;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',663,657,'ANSWERED',3,'','1277343286.1372',''),('2010-06-23 21:00:42','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-000002df','SIP/unlimitednet-000002e0','Dial','SIP/unlimitednet/9728370573,300,T',104,85,'ANSWERED',3,'','1277344842.1383',''),('2010-06-24 09:00:40','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000002e1','Local/FMGL-2146904814#@from-internal-2174;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',26,0,'NO ANSWER',3,'','1277388040.1385',''),('2010-06-24 09:00:45','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-31be;2','SIP/unlimitednet-000002e3','Dial','SIP/unlimitednet/2146904814,300,T',21,0,'NO ANSWER',3,'','1277388045.1394',''),('2010-06-24 09:00:41','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-69a4;2','SIP/200-000002e2','Dial','SIP/200,64,trM(auto-blkvm)',25,0,'NO ANSWER',3,'','1277388041.1387',''),('2010-06-24 09:00:41','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-2174;2','Local/RG-200-2146904814#@from-internal-eadb;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',25,0,'NO ANSWER',3,'','1277388041.1389',''),('2010-06-24 09:00:45','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-eadb;2','Local/2146904814@from-internal-31be;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',21,0,'NO ANSWER',3,'','1277388045.1392',''),('2010-06-24 09:01:33','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000002e4','SIP/unlimitednet-000002e5','Dial','SIP/unlimitednet/2144845422,300,T',11,5,'ANSWERED',3,'','1277388093.1396',''),('2010-06-24 09:02:23','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000002e6','SIP/unlimitednet-000002e7','Dial','SIP/unlimitednet/2144845422,300,T',299,288,'ANSWERED',3,'','1277388143.1398',''),('2010-06-24 10:21:05','\"9722890927\" <9722890927>','9722890927','FMPR-200','from-internal','Local/FMPR-200@from-internal-39bb;2','SIP/200-000002eb','Hangup','',0,0,'BUSY',3,'','1277392865.1412',''),('2010-06-24 10:21:01','\"9726062495\" <9726062495>','9726062495','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-f6b1;2','Local/RG-200-2146904814#@from-internal-e6e8;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',9,0,'NO ANSWER',3,'','1277392861.1404',''),('2010-06-24 10:21:05','\"9726062495\" <9726062495>','9726062495','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-e6e8;2','Local/2146904814@from-internal-7800;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',5,0,'NO ANSWER',3,'','1277392865.1408',''),('2010-06-24 10:21:05','9726062495','9726062495','2146904814','from-internal','Local/2146904814@from-internal-7800;2','SIP/unlimitednet-000002ec','Dial','SIP/unlimitednet/2146904814,300,T',5,0,'NO ANSWER',3,'','1277392865.1410',''),('2010-06-24 10:21:01','\"9726062495\" <9726062495>','9726062495','FMPR-200','from-internal','Local/FMPR-200@from-internal-3a01;2','SIP/200-000002e9','Dial','SIP/200,64,trM(auto-blkvm)',9,0,'ANSWERED',3,'','1277392861.1402',''),('2010-06-24 10:21:01','\"9726062495\" <9726062495>','9726062495','200','from-did-direct','SIP/unlimitednet-000002e8','Local/FMPR-200@from-internal-3a01;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',31,22,'ANSWERED',3,'','1277392861.1400',''),('2010-06-24 10:21:05','\"9722890927\" <9722890927>','9722890927','200','from-did-direct','SIP/unlimitednet-000002ea','Local/FMGL-2146904814#@from-internal-c0bd;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',55,0,'NO ANSWER',3,'','1277392865.1406',''),('2010-06-24 10:21:05','\"9722890927\" <9722890927>','9722890927','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-c0bd;2','Local/RG-200-2146904814#@from-internal-63db;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',55,0,'NO ANSWER',3,'','1277392865.1414',''),('2010-06-24 10:21:06','','','2146904814','from-internal','Local/2146904814@from-internal-b578;1','','MacroExit','',78,68,'ANSWERED',3,'','1277392866.1419',''),('2010-06-24 10:21:06','\"9722890927\" <9722890927>','9722890927','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-63db;2','Local/2146904814@from-internal-b578;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',78,0,'NO ANSWER',3,'','1277392866.1418',''),('2010-06-24 10:21:06','9722890927','9722890927','2146904814','from-internal','Local/2146904814@from-internal-b578;2','SIP/unlimitednet-000002ed','Dial','SIP/unlimitednet/2146904814,300,T',78,68,'ANSWERED',3,'','1277392866.1420',''),('2010-06-24 13:16:54','\"Kris Anderson\" <2146130162>','2146130162','2149294327','from-internal','SIP/200-000002ee','SIP/unlimitednet-000002ef','Dial','SIP/unlimitednet/2149294327,300,T',446,418,'ANSWERED',3,'','1277403414.1422',''),('2010-06-24 13:24:38','\"2149294327\" <2149294327>','2149294327','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-cbe5;2','Local/2146904814@from-internal-882c;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1277403878.1431',''),('2010-06-24 13:24:38','2149294327','2149294327','2146904814','from-internal','Local/2146904814@from-internal-882c;2','SIP/unlimitednet-000002f2','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1277403878.1433',''),('2010-06-24 13:24:34','\"2149294327\" <2149294327>','2149294327','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-7eb2;2','Local/RG-200-2146904814#@from-internal-cbe5;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',6,0,'NO ANSWER',3,'','1277403874.1428',''),('2010-06-24 13:24:34','\"2149294327\" <2149294327>','2149294327','FMPR-200','from-internal','Local/FMPR-200@from-internal-74fc;2','SIP/200-000002f1','Dial','SIP/200,64,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1277403874.1426',''),('2010-06-24 13:24:34','\"2149294327\" <2149294327>','2149294327','200','from-did-direct','SIP/unlimitednet-000002f0','Local/FMPR-200@from-internal-74fc;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',98,92,'ANSWERED',3,'','1277403874.1424',''),('2010-06-24 13:26:27','2149294327','2149294327','2146904814','from-internal','Local/2146904814@from-internal-669b;2','SIP/unlimitednet-000002f5','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1277403987.1444',''),('2010-06-24 13:26:27','\"2149294327\" <2149294327>','2149294327','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-d9d5;2','Local/2146904814@from-internal-669b;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1277403987.1442',''),('2010-06-24 13:26:22','\"2149294327\" <2149294327>','2149294327','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-c694;2','Local/RG-200-2146904814#@from-internal-d9d5;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',7,0,'NO ANSWER',3,'','1277403982.1439',''),('2010-06-24 13:26:22','\"2149294327\" <2149294327>','2149294327','FMPR-200','from-internal','Local/FMPR-200@from-internal-2ce9;2','SIP/200-000002f4','Dial','SIP/200,64,trM(auto-blkvm)',7,0,'ANSWERED',3,'','1277403982.1437',''),('2010-06-24 13:31:26','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-000002f6','SIP/300-000002f7','Dial','SIP/300,\"\",tr',251,242,'ANSWERED',3,'','1277404286.1446',''),('2010-06-24 13:26:22','\"2149294327\" <2149294327>','2149294327','200','from-did-direct','SIP/unlimitednet-000002f3','Local/FMPR-200@from-internal-2ce9;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',2075,2068,'ANSWERED',3,'','1277403982.1435',''),('2010-06-24 14:01:32','\"Kris Anderson\" <2146130162>','2146130162','2259540965','from-internal','SIP/200-000002f8','SIP/unlimitednet-000002f9','Dial','SIP/unlimitednet/2259540965,300,T',47,6,'ANSWERED',3,'','1277406092.1448',''),('2010-06-24 14:02:46','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000002fa','SIP/unlimitednet-000002fb','Dial','SIP/unlimitednet/2144845422,300,T',33,1,'ANSWERED',3,'','1277406166.1450',''),('2010-06-24 14:06:49','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-000002fc','SIP/unlimitednet-000002fd','Dial','SIP/unlimitednet/9893625004,300,T',294,280,'ANSWERED',3,'','1277406409.1452',''),('2010-06-24 16:00:50','\"2149294327\" <2149294327>','2149294327','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-8d7b;2','Local/RG-200-2146904814#@from-internal-e8d0;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',8,0,'NO ANSWER',3,'','1277413250.1458',''),('2010-06-24 16:00:54','2149294327','2149294327','2146904814','from-internal','Local/2146904814@from-internal-358d;2','SIP/unlimitednet-00000300','Dial','SIP/unlimitednet/2146904814,300,T',4,0,'NO ANSWER',3,'','1277413254.1463',''),('2010-06-24 16:00:54','\"2149294327\" <2149294327>','2149294327','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-e8d0;2','Local/2146904814@from-internal-358d;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',4,0,'NO ANSWER',3,'','1277413254.1461',''),('2010-06-24 16:00:50','\"2149294327\" <2149294327>','2149294327','FMPR-200','from-internal','Local/FMPR-200@from-internal-56f6;2','SIP/200-000002ff','Dial','SIP/200,64,trM(auto-blkvm)',8,0,'ANSWERED',3,'','1277413250.1456',''),('2010-06-24 16:00:50','\"2149294327\" <2149294327>','2149294327','200','from-did-direct','SIP/unlimitednet-000002fe','Local/FMPR-200@from-internal-56f6;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',34,26,'ANSWERED',3,'','1277413250.1454',''),('2010-06-24 16:02:46','\"Kris Anderson\" <2146130162>','2146130162','2149294372','from-internal','SIP/200-00000303','SIP/unlimitednet-00000304','Dial','SIP/unlimitednet/2149294372,300,T',40,16,'ANSWERED',3,'','1277413366.1467',''),('2010-06-24 16:01:36','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-00000301','SIP/unlimitednet-00000302','Dial','SIP/unlimitednet/2144845422,300,T',124,107,'ANSWERED',3,'','1277413296.1465',''),('2010-06-24 16:04:50','\"Kris Anderson\" <2146130162>','2146130162','2149294327','from-internal','SIP/200-00000307','SIP/unlimitednet-00000308','Dial','SIP/unlimitednet/2149294327,300,T',883,863,'ANSWERED',3,'','1277413490.1471',''),('2010-06-24 16:04:27','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-00000305','SIP/unlimitednet-00000306','Dial','SIP/unlimitednet/2144845422,300,T',2387,2377,'ANSWERED',3,'','1277413467.1469',''),('2010-06-24 16:44:29','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000309','SIP/unlimitednet-0000030a','Dial','SIP/unlimitednet/2144845422,300,T',652,640,'ANSWERED',3,'','1277415869.1473',''),('2010-06-24 17:06:28','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-0000030b','SIP/unlimitednet-0000030c','Dial','SIP/unlimitednet/2144845422,300,T',37,5,'ANSWERED',3,'','1277417188.1475',''),('2010-06-24 17:07:16','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-0000030d','SIP/201-0000030e','Dial','SIP/201,\"\",tr',34,28,'ANSWERED',3,'','1277417236.1477',''),('2010-06-24 19:34:51','\"David Anderson\" <3607197197>','3607197197','9729243990','from-internal','SIP/300-0000030f','SIP/unlimitednet-00000310','Dial','SIP/unlimitednet/9729243990,300,T',92,80,'ANSWERED',3,'','1277426091.1479',''),('2010-06-24 23:10:53','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-00000311','SIP/201-00000312','Dial','SIP/201,\"\",tr',4202,4190,'ANSWERED',3,'','1277439053.1481',''),('2010-06-25 08:55:47','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-00000313','SIP/201-00000314','Dial','SIP/201,\"\",tr',792,768,'ANSWERED',3,'','1277474147.1483',''),('2010-06-25 11:17:09','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000315','SIP/unlimitednet-00000316','Dial','SIP/unlimitednet/2144845422,300,T',36,4,'ANSWERED',3,'','1277482629.1485',''),('2010-06-25 11:24:04','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-00000317','SIP/201-00000318','Dial','SIP/201,\"\",tr',814,809,'ANSWERED',3,'','1277483044.1487',''),('2010-06-25 11:53:48','\"David Anderson\" <3607197197>','3607197197','4692376038','from-internal','SIP/300-00000319','SIP/unlimitednet-0000031a','Dial','SIP/unlimitednet/4692376038,300,T',198,176,'ANSWERED',3,'','1277484828.1489',''),('2010-06-25 12:26:56','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-5aef;2','Local/RG-200-2146904814#@from-internal-e66e;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',23,0,'NO ANSWER',3,'','1277486816.1495',''),('2010-06-25 12:27:00','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-60f3;2','SIP/unlimitednet-0000031d','Dial','SIP/unlimitednet/2146904814,300,T',19,0,'NO ANSWER',3,'','1277486820.1500',''),('2010-06-25 12:27:00','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-e66e;2','Local/2146904814@from-internal-60f3;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',19,0,'NO ANSWER',3,'','1277486820.1498',''),('2010-06-25 12:26:56','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-c57e;2','SIP/200-0000031c','Dial','SIP/200,64,trM(auto-blkvm)',23,0,'ANSWERED',3,'','1277486816.1493',''),('2010-06-25 12:26:55','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000031b','Local/FMPR-200@from-internal-c57e;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',803,779,'ANSWERED',3,'','1277486815.1491',''),('2010-06-25 12:42:58','\"David Anderson\" <3607197197>','3607197197','9727571557','from-internal','SIP/300-0000031e','SIP/unlimitednet-0000031f','Dial','SIP/unlimitednet/9727571557,300,T',88,57,'ANSWERED',3,'','1277487778.1502',''),('2010-06-25 12:47:51','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-00000320','SIP/300-00000321','Dial','SIP/300,\"\",tr',385,377,'ANSWERED',3,'','1277488071.1504',''),('2010-06-25 13:06:53','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-00000322','SIP/unlimitednet-00000323','Dial','SIP/unlimitednet/4694771253,300,T',103,89,'ANSWERED',3,'','1277489213.1506',''),('2010-06-25 13:34:50','\"9727571557\" <9727571557>','9727571557','300','from-did-direct','SIP/unlimitednet-00000324','SIP/300-00000325','Dial','SIP/300,\"\",tr',84,77,'ANSWERED',3,'','1277490890.1508',''),('2010-06-25 14:16:50','\"4692376038\" <4692376038>','4692376038','300','from-did-direct','SIP/unlimitednet-00000326','SIP/300-00000327','Dial','SIP/300,\"\",tr',201,194,'ANSWERED',3,'','1277493410.1510',''),('2010-06-25 14:20:22','\"David Anderson\" <3607197197>','3607197197','4692376038','from-internal','SIP/300-00000328','SIP/unlimitednet-00000329','Dial','SIP/unlimitednet/4692376038,300,T',29,12,'ANSWERED',3,'','1277493622.1512',''),('2010-06-25 14:20:57','\"4692376038\" <4692376038>','4692376038','300','from-did-direct','SIP/unlimitednet-0000032a','SIP/300-0000032b','Dial','SIP/300,\"\",tr',627,625,'ANSWERED',3,'','1277493657.1514',''),('2010-06-25 15:24:19','\"2149294327\" <2149294327>','2149294327','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-05f9;2','Local/RG-200-2146904814#@from-internal-e73c;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',20,0,'NO ANSWER',3,'','1277497459.1520',''),('2010-06-25 15:24:24','2149294327','2149294327','2146904814','from-internal','Local/2146904814@from-internal-1697;2','SIP/unlimitednet-0000032e','Dial','SIP/unlimitednet/2146904814,300,T',15,0,'NO ANSWER',3,'','1277497464.1525',''),('2010-06-25 15:24:24','\"2149294327\" <2149294327>','2149294327','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-e73c;2','Local/2146904814@from-internal-1697;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',15,0,'NO ANSWER',3,'','1277497464.1523',''),('2010-06-25 15:24:19','\"2149294327\" <2149294327>','2149294327','FMPR-200','from-internal','Local/FMPR-200@from-internal-86a1;2','SIP/200-0000032d','Dial','SIP/200,64,trM(auto-blkvm)',20,0,'ANSWERED',3,'','1277497459.1518',''),('2010-06-25 15:24:19','\"2149294327\" <2149294327>','2149294327','200','from-did-direct','SIP/unlimitednet-0000032c','Local/FMPR-200@from-internal-86a1;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',60,40,'ANSWERED',3,'','1277497459.1516',''),('2010-06-25 15:35:54','\"David Anderson\" <3607197197>','3607197197','4693583033','from-internal','SIP/300-0000032f','SIP/unlimitednet-00000330','Dial','SIP/unlimitednet/4693583033,300,T',39,22,'ANSWERED',3,'','1277498154.1527',''),('2010-06-25 15:37:42','\"4693583033\" <4693583033>','4693583033','300','from-did-direct','SIP/unlimitednet-00000331','SIP/300-00000332','Dial','SIP/300,\"\",tr',195,189,'ANSWERED',3,'','1277498262.1529',''),('2010-06-25 17:16:17','4696581001','4696581001','2146904814','from-internal','Local/2146904814@from-internal-67bf;2','SIP/unlimitednet-00000335','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1277504177.1540',''),('2010-06-25 17:16:12','\"4696581001\" <4696581001>','4696581001','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-f854;2','Local/RG-200-2146904814#@from-internal-b2d2;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',7,0,'NO ANSWER',3,'','1277504172.1535',''),('2010-06-25 17:16:17','\"4696581001\" <4696581001>','4696581001','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-b2d2;2','Local/2146904814@from-internal-67bf;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1277504177.1538',''),('2010-06-25 17:16:12','\"4696581001\" <4696581001>','4696581001','FMPR-200','from-internal','Local/FMPR-200@from-internal-c03f;2','SIP/200-00000334','Dial','SIP/200,64,trM(auto-blkvm)',7,0,'ANSWERED',3,'','1277504172.1533',''),('2010-06-25 17:16:12','\"4696581001\" <4696581001>','4696581001','200','from-did-direct','SIP/unlimitednet-00000333','Local/FMPR-200@from-internal-c03f;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',250,243,'ANSWERED',3,'','1277504172.1531',''),('2010-06-26 09:53:34','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-00000336','SIP/unlimitednet-00000337','Dial','SIP/unlimitednet/9728370573,300,T',35,16,'ANSWERED',3,'','1277564014.1542',''),('2010-06-26 09:54:21','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-00000338','SIP/unlimitednet-00000339','Dial','SIP/unlimitednet/9728370573,300,T',207,195,'ANSWERED',3,'','1277564061.1544',''),('2010-06-26 11:23:31','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-0000033a','','SayAlpha','2146130043',11,11,'ANSWERED',3,'','1277569411.1546',''),('2010-06-26 17:50:52','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-f32e;2','SIP/200-0000033c','Dial','SIP/200,64,trM(auto-blkvm)',32,0,'NO ANSWER',3,'','1277592652.1549',''),('2010-06-26 17:50:56','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-a675;2','Local/2146904814@from-internal-938b;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',28,4,'ANSWERED',3,'','1277592656.1554',''),('2010-06-26 17:50:52','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-64d0;2','Local/RG-200-2146904814#@from-internal-a675;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',32,0,'ANSWERED',3,'','1277592652.1551',''),('2010-06-26 17:50:56','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-938b;2','SIP/unlimitednet-0000033d','Dial','SIP/unlimitednet/2146904814,300,T',65,41,'ANSWERED',3,'','1277592656.1556',''),('2010-06-26 17:50:52','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000033b','Local/FMGL-2146904814#@from-internal-64d0;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',69,37,'ANSWERED',3,'','1277592652.1547',''),('2010-06-26 20:57:46','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-59ad;2','SIP/200-0000033f','Hangup','',60,0,'FAILED',3,'','1277603866.1560',''),('2010-06-26 20:57:46','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-510f;2','Local/RG-200-2146904814#@from-internal-6696;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',64,0,'NO ANSWER',3,'','1277603866.1562',''),('2010-06-26 20:57:46','\"9893625004\" <9893625004>','9893625004','vmu200','ext-local','SIP/unlimitednet-0000033e','Local/FMGL-2146904814#@from-internal-510f;1','VoiceMail','200@default,u\"\"',69,5,'ANSWERED',3,'','1277603866.1558',''),('2010-06-26 20:57:50','','','2146904814','from-internal','Local/2146904814@from-internal-7bd0;1','','MacroExit','',74,32,'ANSWERED',3,'','1277603870.1566',''),('2010-06-26 20:57:50','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-6696;2','Local/2146904814@from-internal-7bd0;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',74,0,'NO ANSWER',3,'','1277603870.1565',''),('2010-06-26 20:57:50','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-7bd0;2','SIP/unlimitednet-00000340','Dial','SIP/unlimitednet/2146904814,300,T',74,32,'ANSWERED',3,'','1277603870.1567',''),('2010-06-28 08:51:26','\"David Anderson\" <3607197197>','3607197197','4694772747','from-internal','SIP/300-00000341','SIP/unlimitednet-00000342','Dial','SIP/unlimitednet/4694772747,300,T',58,34,'ANSWERED',3,'','1277733086.1569',''),('2010-06-28 08:53:03','\"David Anderson\" <3607197197>','3607197197','4694771082','from-internal','SIP/300-00000343','SIP/unlimitednet-00000344','Dial','SIP/unlimitednet/4694771082,300,T',42,2,'ANSWERED',3,'','1277733183.1571',''),('2010-06-28 09:26:10','\"David Anderson\" <3607197197>','3607197197','4694772747','from-internal','SIP/300-00000345','SIP/unlimitednet-00000346','Dial','SIP/unlimitednet/4694772747,300,T',75,58,'ANSWERED',3,'','1277735170.1573',''),('2010-06-28 10:50:07','\"3149638895\" <3149638895>','3149638895','300','from-did-direct','SIP/unlimitednet-00000347','SIP/300-00000348','Dial','SIP/300,\"\",tr',19,0,'NO ANSWER',3,'','1277740207.1575',''),('2010-06-28 11:40:09','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000349','SIP/unlimitednet-0000034a','Dial','SIP/unlimitednet/2144845422,300,T',929,917,'ANSWERED',3,'','1277743209.1577',''),('2010-06-28 11:55:46','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-0000034b','SIP/unlimitednet-0000034c','Dial','SIP/unlimitednet/9893625004,300,T',1028,1011,'ANSWERED',3,'','1277744146.1579',''),('2010-06-28 13:01:54','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-0000034d','SIP/unlimitednet-0000034e','Dial','SIP/unlimitednet/2144845422,300,T',2662,2650,'ANSWERED',3,'','1277748114.1581',''),('2010-06-28 13:48:25','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-0000034f','SIP/201-00000350','Dial','SIP/201,\"\",tr',747,742,'ANSWERED',3,'','1277750905.1583',''),('2010-06-28 14:11:42','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-00000351','SIP/unlimitednet-00000352','Dial','SIP/unlimitednet/9728370573,300,T',46,21,'ANSWERED',3,'','1277752302.1585',''),('2010-06-28 14:18:43','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-00000355','SIP/201-00000356','Dial','SIP/201,\"\",tr',41,33,'ANSWERED',3,'','1277752723.1589',''),('2010-06-28 14:17:41','\"David Anderson\" <3607197197>','3607197197','9729002338','from-internal','SIP/300-00000353','SIP/unlimitednet-00000354','Dial','SIP/unlimitednet/9729002338,300,T',159,147,'ANSWERED',3,'','1277752661.1587',''),('2010-06-28 14:22:27','\"David Anderson\" <3607197197>','3607197197','9034825426','from-internal','SIP/300-00000357','SIP/unlimitednet-00000358','Dial','SIP/unlimitednet/9034825426,300,T',70,62,'ANSWERED',3,'','1277752947.1591',''),('2010-06-28 14:24:25','\"David Anderson\" <3607197197>','3607197197','9034826231','from-internal','SIP/300-00000359','SIP/unlimitednet-0000035a','Dial','SIP/unlimitednet/9034826231,300,T',97,87,'ANSWERED',3,'','1277753065.1593',''),('2010-06-28 14:27:13','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-0000035b','SIP/unlimitednet-0000035c','Dial','SIP/unlimitednet/2144845422,300,T',165,147,'ANSWERED',3,'','1277753233.1595',''),('2010-06-28 14:27:22','\"David Anderson\" <3607197197>','3607197197','9034827100','from-internal','SIP/300-0000035d','SIP/unlimitednet-0000035e','Dial','SIP/unlimitednet/9034827100,300,T',224,209,'ANSWERED',3,'','1277753242.1597',''),('2010-06-28 14:34:01','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-0000035f','SIP/unlimitednet-00000360','Dial','SIP/unlimitednet/9728370573,300,T',125,114,'ANSWERED',3,'','1277753641.1599',''),('2010-06-28 17:54:43','\"4696581001\" <4696581001>','4696581001','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-9de3;2','Local/2146904814@from-internal-2764;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',11,0,'NO ANSWER',3,'','1277765683.1608',''),('2010-06-28 17:54:39','\"4696581001\" <4696581001>','4696581001','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-5d78;2','Local/RG-200-2146904814#@from-internal-9de3;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',15,0,'NO ANSWER',3,'','1277765679.1605',''),('2010-06-28 17:54:43','4696581001','4696581001','2146904814','from-internal','Local/2146904814@from-internal-2764;2','SIP/unlimitednet-00000363','Dial','SIP/unlimitednet/2146904814,300,T',11,0,'NO ANSWER',3,'','1277765683.1610',''),('2010-06-28 17:54:39','\"4696581001\" <4696581001>','4696581001','FMPR-200','from-internal','Local/FMPR-200@from-internal-0e08;2','SIP/200-00000362','Dial','SIP/200,64,trM(auto-blkvm)',15,0,'ANSWERED',3,'','1277765679.1603',''),('2010-06-28 17:54:39','\"4696581001\" <4696581001>','4696581001','200','from-did-direct','SIP/unlimitednet-00000361','Local/FMPR-200@from-internal-0e08;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',115,100,'ANSWERED',3,'','1277765679.1601',''),('2010-06-28 18:49:10','2145053574','2145053574','2146904814','from-internal','Local/2146904814@from-internal-ebc5;2','SIP/unlimitednet-00000366','Dial','SIP/unlimitednet/2146904814,300,T',14,0,'NO ANSWER',3,'','1277768950.1621',''),('2010-06-28 18:49:06','\"2145053574\" <2145053574>','2145053574','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-a7e1;2','Local/RG-200-2146904814#@from-internal-0069;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',18,0,'NO ANSWER',3,'','1277768946.1616',''),('2010-06-28 18:49:10','\"2145053574\" <2145053574>','2145053574','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-0069;2','Local/2146904814@from-internal-ebc5;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',14,0,'NO ANSWER',3,'','1277768950.1619',''),('2010-06-28 18:49:06','\"2145053574\" <2145053574>','2145053574','FMPR-200','from-internal','Local/FMPR-200@from-internal-7106;2','SIP/200-00000365','Dial','SIP/200,64,trM(auto-blkvm)',18,0,'ANSWERED',3,'','1277768946.1614',''),('2010-06-28 18:49:06','\"2145053574\" <2145053574>','2145053574','200','from-did-direct','SIP/unlimitednet-00000364','Local/FMPR-200@from-internal-7106;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',74,56,'ANSWERED',3,'','1277768946.1612',''),('2010-06-29 09:30:16','\"3149638895\" <3149638895>','3149638895','300','from-did-direct','SIP/unlimitednet-00000367','SIP/300-00000368','Dial','SIP/300,\"\",tr',69,58,'ANSWERED',3,'','1277821816.1623',''),('2010-06-29 12:15:27','\"David Anderson\" <3607197197>','3607197197','9034826231','from-internal','SIP/300-00000369','SIP/unlimitednet-0000036a','Dial','SIP/unlimitednet/9034826231,300,T',51,22,'ANSWERED',3,'','1277831727.1625',''),('2010-06-29 13:43:11','\"9034826231\" <9034826231>','9034826231','300','from-did-direct','SIP/unlimitednet-0000036b','SIP/300-0000036c','Dial','SIP/300,\"\",tr',68,59,'ANSWERED',3,'','1277836991.1627',''),('2010-06-29 14:57:28','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-0000036f','SIP/201-00000370','Dial','SIP/201,\"\",tr',30,0,'NO ANSWER',3,'','1277841448.1631',''),('2010-06-29 14:25:40','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-0000036d','SIP/unlimitednet-0000036e','Dial','SIP/unlimitednet/9893625004,300,T',2364,2338,'ANSWERED',3,'','1277839540.1629',''),('2010-06-29 15:05:16','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000371','SIP/unlimitednet-00000372','Dial','SIP/unlimitednet/2144845422,300,T',1248,1237,'ANSWERED',3,'','1277841916.1633',''),('2010-06-29 15:55:22','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-00000375','SIP/unlimitednet-00000376','Dial','SIP/unlimitednet/4694771253,300,T',117,104,'ANSWERED',3,'','1277844922.1637',''),('2010-06-29 15:27:09','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-00000373','SIP/201-00000374','Dial','SIP/201,\"\",tr',2338,2333,'ANSWERED',3,'','1277843229.1635',''),('2010-06-29 16:06:13','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-00000377','SIP/unlimitednet-00000378','Dial','SIP/unlimitednet/9893625004,300,T',20,3,'ANSWERED',3,'','1277845573.1639',''),('2010-06-29 16:06:49','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000379','SIP/unlimitednet-0000037a','Dial','SIP/unlimitednet/2144845422,300,T',281,266,'ANSWERED',3,'','1277845609.1641',''),('2010-06-29 16:11:35','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-0000037b','SIP/unlimitednet-0000037c','Dial','SIP/unlimitednet/9893625004,300,T',328,289,'ANSWERED',3,'','1277845895.1643',''),('2010-06-29 16:17:26','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-0000037d','SIP/unlimitednet-0000037e','Dial','SIP/unlimitednet/2144845422,300,T',575,562,'ANSWERED',3,'','1277846246.1645',''),('2010-06-29 16:29:18','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-0000037f','SIP/201-00000380','Dial','SIP/201,\"\",tr',2325,2320,'ANSWERED',3,'','1277846958.1647',''),('2010-06-29 16:38:46','\"4436150686\" <4436150686>','4436150686','300','from-did-direct','SIP/unlimitednet-00000381','SIP/300-00000382','Dial','SIP/300,\"\",tr',1970,1964,'ANSWERED',3,'','1277847526.1649',''),('2010-06-29 17:23:16','\"4692376038\" <4692376038>','4692376038','300','from-did-direct','SIP/unlimitednet-00000383','SIP/300-00000384','Dial','SIP/300,\"\",tr',121,113,'ANSWERED',3,'','1277850196.1651',''),('2010-06-29 17:28:30','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000385','SIP/unlimitednet-00000386','Dial','SIP/unlimitednet/2144845422,300,T',1488,1475,'ANSWERED',3,'','1277850510.1653',''),('2010-06-29 18:13:04','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-b356;2','SIP/unlimitednet-00000389','Dial','SIP/unlimitednet/2146904814,300,T',13,0,'NO ANSWER',3,'','1277853184.1664',''),('2010-06-29 18:13:04','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-69ef;2','Local/2146904814@from-internal-b356;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',13,0,'NO ANSWER',3,'','1277853184.1662',''),('2010-06-29 18:13:00','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-4e29;2','Local/RG-200-2146904814#@from-internal-69ef;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',17,0,'NO ANSWER',3,'','1277853180.1659',''),('2010-06-29 18:13:00','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-a32f;2','SIP/200-00000388','Dial','SIP/200,64,trM(auto-blkvm)',17,0,'ANSWERED',3,'','1277853180.1657',''),('2010-06-29 18:13:00','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000387','Local/FMPR-200@from-internal-a32f;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',704,687,'ANSWERED',3,'','1277853180.1655',''),('2010-06-29 18:24:14','\"Sam Sprain\" <3607196747>','3607196747','2146706080','from-internal','SIP/201-0000038a','SIP/unlimitednet-0000038b','Dial','SIP/unlimitednet/2146706080,300,T',85,77,'ANSWERED',3,'','1277853854.1666',''),('2010-06-29 18:27:16','\"Sam Sprain\" <3607196747>','3607196747','2146706073','from-internal','SIP/201-0000038e','SIP/unlimitednet-0000038f','Dial','SIP/unlimitednet/2146706073,300,T',31,0,'NO ANSWER',3,'','1277854036.1670',''),('2010-06-29 18:24:22','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-0000038c','SIP/unlimitednet-0000038d','Dial','SIP/unlimitednet/9728370573,300,T',210,197,'ANSWERED',3,'','1277853862.1668',''),('2010-06-29 18:28:27','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-00000390','SIP/unlimitednet-00000391','Dial','SIP/unlimitednet/3609536629,300,T',47,16,'ANSWERED',3,'','1277854107.1672',''),('2010-06-29 19:20:32','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-00000392','SIP/201-00000393','Dial','SIP/201,\"\",tr',35,0,'NO ANSWER',3,'','1277857232.1674',''),('2010-06-29 19:27:52','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000394','SIP/unlimitednet-00000395','Dial','SIP/unlimitednet/2144845422,300,T',2807,2795,'ANSWERED',3,'','1277857672.1676',''),('2010-06-29 20:20:47','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000396','SIP/unlimitednet-00000397','Dial','SIP/unlimitednet/2144845422,300,T',2488,2477,'ANSWERED',3,'','1277860847.1678',''),('2010-06-30 10:44:59','\"David Anderson\" <3607197197>','3607197197','9723822445','from-internal','SIP/300-00000398','SIP/unlimitednet-00000399','Dial','SIP/unlimitednet/9723822445,300,T',43,0,'NO ANSWER',3,'','1277912699.1680',''),('2010-06-30 10:46:37','\"David Anderson\" <3607197197>','3607197197','9034821303','from-internal','SIP/300-0000039a','SIP/unlimitednet-0000039b','Dial','SIP/unlimitednet/9034821303,300,T',142,107,'ANSWERED',3,'','1277912797.1682',''),('2010-06-30 10:49:13','\"David Anderson\" <3607197197>','3607197197','9723822445','from-internal','SIP/300-0000039c','SIP/unlimitednet-0000039d','Dial','SIP/unlimitednet/9723822445,300,T',184,167,'ANSWERED',3,'','1277912953.1684',''),('2010-06-30 11:40:17','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-0000039e','SIP/201-0000039f','Dial','SIP/201,\"\",tr',47,0,'NO ANSWER',3,'','1277916017.1686',''),('2010-06-30 12:10:50','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-000003a2','SIP/unlimitednet-000003a3','Dial','SIP/unlimitednet/3609536629,300,T',37,4,'ANSWERED',3,'','1277917850.1690',''),('2010-06-30 12:06:30','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-000003a0','SIP/unlimitednet-000003a1','Dial','SIP/unlimitednet/9893625004,300,T',563,541,'ANSWERED',3,'','1277917590.1688',''),('2010-06-30 13:12:00','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-000003a6','SIP/300-000003a7','Dial','SIP/300,\"\",tr',1044,1035,'ANSWERED',3,'','1277921520.1694',''),('2010-06-30 13:29:40','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-000003aa','SIP/300-000003ab','Busy','20',0,0,'BUSY',3,'','1277922580.1698',''),('2010-06-30 13:29:38','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-000003a8','SIP/unlimitednet-000003a9','Dial','SIP/unlimitednet/3609536629,300,T',29,17,'ANSWERED',3,'','1277922578.1696',''),('2010-06-30 13:30:49','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-000003ae','SIP/300-000003af','Busy','20',0,0,'BUSY',3,'','1277922649.1702',''),('2010-06-30 13:30:33','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-000003ac','SIP/unlimitednet-000003ad','Dial','SIP/unlimitednet/3609536629,300,T',28,6,'ANSWERED',3,'','1277922633.1700',''),('2010-06-30 12:16:39','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000003a4','SIP/unlimitednet-000003a5','Dial','SIP/unlimitednet/2144845422,300,T',6302,6291,'ANSWERED',3,'','1277918199.1692',''),('2010-06-30 14:06:56','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-000003b0','SIP/unlimitednet-000003b1','Dial','SIP/unlimitednet/9893625004,300,T',2,0,'NO ANSWER',3,'','1277924816.1704',''),('2010-06-30 14:19:10','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-440a;2','Local/RG-200-2146904814#@from-internal-a5ba;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',11,0,'NO ANSWER',3,'','1277925550.1710',''),('2010-06-30 14:19:14','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-a5ba;2','Local/2146904814@from-internal-f476;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',7,0,'NO ANSWER',3,'','1277925554.1713',''),('2010-06-30 14:19:15','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-f476;2','SIP/unlimitednet-000003b4','Dial','SIP/unlimitednet/2146904814,300,T',6,0,'NO ANSWER',3,'','1277925555.1715',''),('2010-06-30 14:19:10','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-4f24;2','SIP/200-000003b3','Dial','SIP/200,64,trM(auto-blkvm)',12,1,'ANSWERED',3,'','1277925550.1708',''),('2010-06-30 14:19:10','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000003b2','Local/FMPR-200@from-internal-4f24;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',22,11,'ANSWERED',3,'','1277925550.1706',''),('2010-06-30 14:19:59','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-000003b5','SIP/unlimitednet-000003b6','Dial','SIP/unlimitednet/2144845422,300,T',1472,1459,'ANSWERED',3,'','1277925599.1717',''),('2010-06-30 17:09:33','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-f7ce;2','Local/RG-200-2146904814#@from-internal-2ca4;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',17,0,'NO ANSWER',3,'','1277935773.1725',''),('2010-06-30 17:09:37','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-2ca4;2','Local/2146904814@from-internal-4f6a;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',13,0,'NO ANSWER',3,'','1277935777.1728',''),('2010-06-30 17:09:37','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-4f6a;2','SIP/unlimitednet-000003bb','Dial','SIP/unlimitednet/2146904814,300,T',13,0,'NO ANSWER',3,'','1277935777.1730',''),('2010-06-30 17:09:33','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-a63c;2','SIP/200-000003ba','Dial','SIP/200,64,trM(auto-blkvm)',18,1,'ANSWERED',3,'','1277935773.1723',''),('2010-06-30 17:09:32','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000003b9','Local/FMPR-200@from-internal-a63c;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',380,362,'ANSWERED',3,'','1277935772.1721',''),('2010-06-30 17:15:56','\"Kris Anderson\" <200>','200','*97','from-internal','SIP/200-000003bc','','VoiceMailMain','200@default',30,30,'ANSWERED',3,'','1277936156.1732',''),('2010-06-30 17:17:37','2146904814','2146904814','2146904814','from-internal','Local/2146904814@from-internal-1e1f;2','SIP/unlimitednet-000003bf','Dial','SIP/unlimitednet/2146904814,300,T',42,34,'ANSWERED',3,'','1277936257.1742',''),('2010-06-30 17:17:37','','','2146904814','from-internal','Local/2146904814@from-internal-1e1f;1','','BackGround','\"incoming-call-1-accept-2-decline\",m,en,macro-confirm',42,34,'ANSWERED',3,'','1277936257.1741',''),('2010-06-30 17:17:37','\"2146904814\" <2146904814>','2146904814','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-c1b2;2','Local/2146904814@from-internal-1e1f;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',42,0,'NO ANSWER',3,'','1277936257.1740',''),('2010-06-30 17:17:33','\"2146904814\" <2146904814>','2146904814','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-632b;2','Local/RG-200-2146904814#@from-internal-c1b2;1','Hangup','',46,0,'NO ANSWER',3,'','1277936253.1737',''),('2010-06-30 17:17:33','\"2146904814\" <2146904814>','2146904814','FMPR-200','from-internal','Local/FMPR-200@from-internal-e0c6;2','SIP/200-000003be','Hangup','',60,0,'FAILED',3,'','1277936253.1735',''),('2010-06-30 17:17:32','\"2146904814\" <2146904814>','2146904814','vmu200','ext-local','SIP/unlimitednet-000003bd','Local/FMGL-2146904814#@from-internal-632b;1','Hangup','',172,111,'ANSWERED',3,'','1277936252.1733',''),('2010-06-30 16:57:30','\"Restricted\" <Restricted>','Restricted','300','from-did-direct','SIP/unlimitednet-000003b7','SIP/300-000003b8','Dial','SIP/300,\"\",tr',3007,2999,'ANSWERED',3,'','1277935050.1719',''),('2010-06-30 17:51:57','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-000003c0','','Hangup','',15,15,'ANSWERED',3,'','1277938317.1744',''),('2010-06-30 18:09:18','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-000003c1','SIP/unlimitednet-000003c2','Dial','SIP/unlimitednet/9728370573,300,T',33,0,'NO ANSWER',3,'','1277939358.1745',''),('2010-06-30 18:11:06','\"9728370573\" <9728370573>','9728370573','300','from-did-direct','SIP/unlimitednet-000003c3','SIP/300-000003c4','Dial','SIP/300,\"\",tr',765,758,'ANSWERED',3,'','1277939466.1747',''),('2010-06-30 18:28:24','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-000003c5','SIP/300-000003c6','Dial','SIP/300,\"\",tr',69,62,'ANSWERED',3,'','1277940504.1749',''),('2010-06-30 22:19:31','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-000003c7','SIP/201-000003c8','Dial','SIP/201,\"\",tr',5786,5755,'ANSWERED',3,'','1277954371.1751',''),('2010-07-01 08:45:05','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-000003c9','SIP/201-000003ca','Dial','SIP/201,\"\",tr',42,32,'ANSWERED',3,'','1277991905.1753',''),('2010-07-01 08:58:19','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-000003cb','SIP/201-000003cc','Dial','SIP/201,\"\",tr',52,47,'ANSWERED',3,'','1277992699.1755',''),('2010-07-01 10:27:54','\"Restricted\" <Restricted>','Restricted','s','from-trunk','SIP/unlimitednet-000003cd','','SayAlpha','2146130043',10,10,'ANSWERED',3,'','1277998074.1757',''),('2010-07-01 13:15:37','\"anonymous\" <anonymous>','anonymous','201','from-did-direct','SIP/unlimitednet-000003ce','SIP/201-000003cf','Dial','SIP/201,\"\",tr',228,214,'ANSWERED',3,'','1278008137.1758',''),('2010-07-01 13:42:05','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-000003d0','SIP/unlimitednet-000003d1','Dial','SIP/unlimitednet/2144845422,300,T',1098,1084,'ANSWERED',3,'','1278009725.1760',''),('2010-07-01 14:00:36','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-000003d2','SIP/unlimitednet-000003d3','Dial','SIP/unlimitednet/9893625004,300,T',1368,1349,'ANSWERED',3,'','1278010836.1762',''),('2010-07-01 14:25:18','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-000003d4','SIP/unlimitednet-000003d5','Dial','SIP/unlimitednet/2144845422,300,T',1265,1250,'ANSWERED',3,'','1278012318.1764',''),('2010-07-01 15:59:43','\"David Anderson\" <3607197197>','3607197197','8884000638','from-internal','SIP/300-000003d8','SIP/unlimitednet-000003d9','Dial','SIP/unlimitednet/8884000638,300,T',229,225,'ANSWERED',3,'','1278017983.1768',''),('2010-07-01 14:46:48','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-000003d6','SIP/201-000003d7','Dial','SIP/201,\"\",tr',6594,6580,'ANSWERED',3,'','1278013608.1766',''),('2010-07-01 17:32:57','\"4692376038\" <4692376038>','4692376038','300','from-did-direct','SIP/unlimitednet-000003da','SIP/300-000003db','Dial','SIP/300,\"\",tr',263,255,'ANSWERED',3,'','1278023577.1770',''),('2010-07-01 18:08:15','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-000003dc','SIP/unlimitednet-000003dd','Dial','SIP/unlimitednet/9893625004,300,T',570,556,'ANSWERED',3,'','1278025695.1772',''),('2010-07-01 18:29:32','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-000003de','SIP/201-000003df','Dial','SIP/201,\"\",tr',2412,2380,'ANSWERED',3,'','1278026972.1774',''),('2010-07-01 19:36:46','\"David Anderson\" <3607197197>','3607197197','9725472240','from-internal','SIP/300-000003e0','SIP/unlimitednet-000003e1','Dial','SIP/unlimitednet/9725472240,300,T',84,76,'ANSWERED',3,'','1278031006.1776',''),('2010-07-01 19:39:14','\"David Anderson\" <3607197197>','3607197197','9725472240','from-internal','SIP/300-000003e3','SIP/unlimitednet-000003e4','Dial','SIP/unlimitednet/9725472240,300,T',79,71,'ANSWERED',3,'','1278031154.1779',''),('2010-07-01 19:41:37','\"David Anderson\" <3607197197>','3607197197','9726330424','from-internal','SIP/300-000003e5','SIP/unlimitednet-000003e6','Dial','SIP/unlimitednet/9726330424,300,T',48,38,'ANSWERED',3,'','1278031297.1781',''),('2010-07-01 19:44:26','\"David Anderson\" <3607197197>','3607197197','9725699909','from-internal','SIP/300-000003e7','SIP/unlimitednet-000003e8','Dial','SIP/unlimitednet/9725699909,300,T',330,324,'ANSWERED',3,'','1278031466.1783',''),('2010-07-02 08:18:09','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-000003e9','SIP/unlimitednet-000003ea','Dial','SIP/unlimitednet/9728370573,300,T',62,24,'ANSWERED',3,'','1278076689.1785',''),('2010-07-02 08:19:18','\"9728370573\" <9728370573>','9728370573','300','from-did-direct','SIP/unlimitednet-000003eb','SIP/300-000003ec','Dial','SIP/300,\"\",tr',78,72,'ANSWERED',3,'','1278076758.1787',''),('2010-07-02 08:45:46','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-000003ed','SIP/201-000003ee','Dial','SIP/201,\"\",tr',295,284,'ANSWERED',3,'','1278078346.1789',''),('2010-07-02 09:22:26','\"anonymous\" <anonymous>','anonymous','201','from-did-direct','SIP/unlimitednet-000003ef','SIP/201-000003f0','Dial','SIP/201,\"\",tr',173,160,'ANSWERED',3,'','1278080546.1791',''),('2010-07-02 10:05:58','\"anonymous\" <anonymous>','anonymous','201','from-did-direct','SIP/unlimitednet-000003f1','SIP/201-000003f2','Dial','SIP/201,\"\",tr',58,43,'ANSWERED',3,'','1278083158.1793',''),('2010-07-02 10:43:41','\"Sam Sprain\" <3607196747>','3607196747','2146903071','from-internal','SIP/201-000003f3','SIP/unlimitednet-000003f4','Dial','SIP/unlimitednet/2146903071,300,T',133,117,'ANSWERED',3,'','1278085421.1795',''),('2010-07-03 11:19:49','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-000003f5','SIP/201-000003f6','Dial','SIP/201,\"\",tr',438,407,'ANSWERED',3,'','1278173989.1797',''),('2010-07-03 12:27:54','\"4436150686\" <4436150686>','4436150686','300','from-did-direct','SIP/unlimitednet-000003f7','SIP/300-000003f8','Dial','SIP/300,\"\",tr',42,21,'ANSWERED',3,'','1278178074.1799',''),('2010-07-03 14:48:11','\"David Anderson\" <3607197197>','3607197197','4436150686','from-internal','SIP/300-000003f9','SIP/unlimitednet-000003fa','Dial','SIP/unlimitednet/4436150686,300,T',36,0,'NO ANSWER',3,'','1278186491.1801',''),('2010-07-03 14:51:12','\"4436150686\" <4436150686>','4436150686','300','from-did-direct','SIP/unlimitednet-000003fb','SIP/300-000003fc','Dial','SIP/300,\"\",tr',615,597,'ANSWERED',3,'','1278186672.1803',''),('2010-07-03 16:34:20','\"213.133.142.120\" <111111>','111111','s','from-trunk','SIP/216.245.215.82-000003fd','','Playback','ss-noservice',3,3,'ANSWERED',3,'','1278192860.1805',''),('2010-07-03 17:58:14','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-f2a7;2','SIP/200-000003ff','Dial','SIP/200,64,trM(auto-blkvm)',25,0,'NO ANSWER',3,'','1278197894.1808',''),('2010-07-03 17:58:18','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-d812;2','Local/2146904814@from-internal-59c0;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',21,1,'ANSWERED',3,'','1278197898.1813',''),('2010-07-03 17:58:14','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-9c6b;2','Local/RG-200-2146904814#@from-internal-d812;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',25,0,'ANSWERED',3,'','1278197894.1810',''),('2010-07-03 17:58:18','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-59c0;2','SIP/unlimitednet-00000400','Dial','SIP/unlimitednet/2146904814,300,T',308,288,'ANSWERED',3,'','1278197898.1815',''),('2010-07-03 17:58:14','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000003fe','Local/FMGL-2146904814#@from-internal-9c6b;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',312,287,'ANSWERED',3,'','1278197894.1806',''),('2010-07-04 20:27:36','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000401','Local/FMGL-2146904814#@from-internal-1c77;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',1,0,'NO ANSWER',3,'','1278293256.1817',''),('2010-07-04 20:27:36','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-26de;2','SIP/200-00000402','Dial','SIP/200,64,trM(auto-blkvm)',1,0,'NO ANSWER',3,'','1278293256.1819',''),('2010-07-04 20:27:56','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-6264;2','Local/RG-200-2146904814#@from-internal-47c0;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',4,0,'NO ANSWER',3,'','1278293276.1827',''),('2010-07-04 20:27:56','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-a9d9;2','SIP/200-00000404','Dial','SIP/200,64,trM(auto-blkvm)',4,0,'ANSWERED',3,'','1278293276.1825',''),('2010-07-04 20:27:55','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000403','Local/FMPR-200@from-internal-a9d9;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',12,7,'ANSWERED',3,'','1278293275.1823',''),('2010-07-05 14:34:06','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-eb41;2','SIP/200-00000406','Hangup','',60,0,'FAILED',3,'','1278358446.1833',''),('2010-07-05 14:34:06','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-16f5;2','Local/RG-200-2146904814#@from-internal-0a13;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',64,0,'NO ANSWER',3,'','1278358446.1835',''),('2010-07-05 14:34:05','\"9893625004\" <9893625004>','9893625004','vmu200','ext-local','SIP/unlimitednet-00000405','Local/FMGL-2146904814#@from-internal-16f5;1','VoiceMail','200@default,u\"\"',70,5,'ANSWERED',3,'','1278358445.1831',''),('2010-07-05 14:34:16','','','2146904814','from-internal','Local/2146904814@from-internal-6d56;1','','MacroExit','',62,19,'ANSWERED',3,'','1278358456.1839',''),('2010-07-05 14:34:15','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-0a13;2','Local/2146904814@from-internal-6d56;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',63,0,'NO ANSWER',3,'','1278358455.1838',''),('2010-07-05 14:34:16','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-6d56;2','SIP/unlimitednet-00000407','Dial','SIP/unlimitednet/2146904814,300,T',62,19,'ANSWERED',3,'','1278358456.1840',''),('2010-07-05 18:20:48','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000408','SIP/unlimitednet-00000409','Dial','SIP/unlimitednet/2144845422,300,T',1578,1564,'ANSWERED',3,'','1278372048.1842',''),('2010-07-05 19:04:46','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-0000040a','SIP/unlimitednet-0000040b','Dial','SIP/unlimitednet/2144845422,300,T',1405,1388,'ANSWERED',3,'','1278374686.1844',''),('2010-07-05 19:48:29','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-0000040c','SIP/unlimitednet-0000040d','Dial','SIP/unlimitednet/2144845422,300,T',47,33,'ANSWERED',3,'','1278377309.1846',''),('2010-07-05 20:00:23','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000040e','Local/FMGL-2146904814#@from-internal-2f59;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',20,0,'NO ANSWER',3,'','1278378023.1848',''),('2010-07-05 20:00:28','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-ead4;2','Local/2146904814@from-internal-6674;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',15,0,'NO ANSWER',3,'','1278378028.1855',''),('2010-07-05 20:00:28','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-6674;2','SIP/unlimitednet-00000410','Dial','SIP/unlimitednet/2146904814,300,T',15,0,'NO ANSWER',3,'','1278378028.1857',''),('2010-07-05 20:00:23','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-62d1;2','SIP/200-0000040f','Dial','SIP/200,64,trM(auto-blkvm)',20,0,'NO ANSWER',3,'','1278378023.1850',''),('2010-07-05 20:00:23','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-2f59;2','Local/RG-200-2146904814#@from-internal-ead4;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',20,0,'NO ANSWER',3,'','1278378023.1852',''),('2010-07-05 20:13:34','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-6856;2','SIP/200-00000412','Dial','SIP/200,64,trM(auto-blkvm)',34,0,'NO ANSWER',3,'','1278378814.1861',''),('2010-07-05 20:13:38','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-a166;2','Local/2146904814@from-internal-6733;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',31,7,'ANSWERED',3,'','1278378818.1866',''),('2010-07-05 20:13:34','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-45d1;2','Local/RG-200-2146904814#@from-internal-a166;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',35,1,'ANSWERED',3,'','1278378814.1863',''),('2010-07-05 20:18:59','\"Restricted\" <Restricted>','Restricted','FMPR-201','from-internal','Local/FMPR-201@from-internal-42f0;2','SIP/201-00000415','Dial','SIP/201,63,trM(auto-blkvm)',23,0,'NO ANSWER',3,'','1278379139.1872',''),('2010-07-05 20:18:59','\"Restricted\" <Restricted>','Restricted','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-4e72;2','Local/4696846582@from-internal-5012;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',23,0,'ANSWERED',3,'','1278379139.1874',''),('2010-07-05 20:19:02','Restricted','','4696846582','from-internal','Local/4696846582@from-internal-5012;2','SIP/unlimitednet-00000416','Dial','SIP/unlimitednet/4696846582,300,T',40,20,'ANSWERED',3,'','1278379142.1877',''),('2010-07-05 20:18:49','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-00000414','Local/FMGL-4696846582#@from-internal-4e72;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',53,20,'ANSWERED',3,'','1278379129.1870',''),('2010-07-05 20:13:43','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-6733;2','SIP/unlimitednet-00000413','Dial','SIP/unlimitednet/2146904814,300,T',562,543,'ANSWERED',3,'','1278378823.1868',''),('2010-07-05 20:13:29','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000411','Local/FMGL-2146904814#@from-internal-45d1;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',576,537,'ANSWERED',3,'','1278378809.1859',''),('2010-07-05 20:23:56','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-1d84;2','SIP/200-00000418','Dial','SIP/200,64,trM(auto-blkvm)',26,0,'NO ANSWER',3,'','1278379436.1881',''),('2010-07-05 20:24:00','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-adc6;2','Local/2146904814@from-internal-b0d9;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',22,6,'ANSWERED',3,'','1278379440.1886',''),('2010-07-05 20:23:56','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-853e;2','Local/RG-200-2146904814#@from-internal-adc6;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',26,0,'ANSWERED',3,'','1278379436.1883',''),('2010-07-05 20:24:00','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-b0d9;2','SIP/unlimitednet-00000419','Dial','SIP/unlimitednet/2146904814,300,T',49,33,'ANSWERED',3,'','1278379440.1888',''),('2010-07-05 20:23:56','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000417','Local/FMGL-2146904814#@from-internal-853e;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',53,27,'ANSWERED',3,'','1278379436.1879',''),('2010-07-06 12:31:31','\"4432761901\" <4432761901>','4432761901','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-adff;2','Local/RG-200-2146904814#@from-internal-d669;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',64,0,'NO ANSWER',3,'','1278437491.1894',''),('2010-07-06 12:31:31','\"4432761901\" <4432761901>','4432761901','FMPR-200','from-internal','Local/FMPR-200@from-internal-97fc;2','SIP/200-0000041b','Dial','SIP/200,64,trM(auto-blkvm)',64,0,'NO ANSWER',3,'','1278437491.1892',''),('2010-07-06 12:31:21','\"4432761901\" <4432761901>','4432761901','vmu200','ext-local','SIP/unlimitednet-0000041a','Local/FMGL-2146904814#@from-internal-adff;1','VoiceMail','200@default,u\"\"',75,1,'ANSWERED',3,'','1278437481.1890',''),('2010-07-06 12:31:35','','','2146904814','from-internal','Local/2146904814@from-internal-e726;1','','MacroExit','',72,33,'ANSWERED',3,'','1278437495.1897',''),('2010-07-06 12:31:35','\"4432761901\" <4432761901>','4432761901','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-d669;2','Local/2146904814@from-internal-e726;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',72,0,'NO ANSWER',3,'','1278437495.1896',''),('2010-07-06 12:31:35','4432761901','4432761901','2146904814','from-internal','Local/2146904814@from-internal-e726;2','SIP/unlimitednet-0000041c','Dial','SIP/unlimitednet/2146904814,300,T',72,33,'ANSWERED',3,'','1278437495.1898',''),('2010-07-06 17:13:10','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-0000041d','SIP/unlimitednet-0000041e','Dial','SIP/unlimitednet/9893625004,300,T',47,34,'ANSWERED',3,'','1278454390.1901',''),('2010-07-06 17:21:18','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000420','Local/FMGL-2146904814#@from-internal-f280;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',44,0,'NO ANSWER',3,'','1278454878.1904',''),('2010-07-06 17:21:28','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-f944;2','SIP/200-00000421','Dial','SIP/200,64,trM(auto-blkvm)',34,0,'NO ANSWER',3,'','1278454888.1906',''),('2010-07-06 17:21:28','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-f280;2','Local/RG-200-2146904814#@from-internal-e379;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',34,0,'NO ANSWER',3,'','1278454888.1908',''),('2010-07-06 17:21:37','','','2146904814','from-internal','Local/2146904814@from-internal-c45e;1','','MacroExit','',88,68,'ANSWERED',3,'','1278454897.1912',''),('2010-07-06 17:21:37','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-c45e;2','SIP/unlimitednet-00000422','Dial','SIP/unlimitednet/2146904814,300,T',88,68,'ANSWERED',3,'','1278454897.1913',''),('2010-07-06 17:21:37','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-e379;2','Local/2146904814@from-internal-c45e;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',88,0,'NO ANSWER',3,'','1278454897.1911',''),('2010-07-06 21:32:21','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000423','SIP/unlimitednet-00000424','Dial','SIP/unlimitednet/8888413446,300,T',38,35,'ANSWERED',3,'','1278469941.1915',''),('2010-07-06 21:33:07','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000425','SIP/unlimitednet-00000426','Dial','SIP/unlimitednet/8888413446,300,T',36,33,'ANSWERED',3,'','1278469987.1917',''),('2010-07-06 21:33:53','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000427','SIP/unlimitednet-00000428','Dial','SIP/unlimitednet/8888413446,300,T',42,34,'ANSWERED',3,'','1278470033.1919',''),('2010-07-06 21:34:43','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000429','SIP/unlimitednet-0000042a','Dial','SIP/unlimitednet/8888413446,300,T',37,34,'ANSWERED',3,'','1278470083.1921',''),('2010-07-06 21:35:28','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-0000042b','SIP/unlimitednet-0000042c','Dial','SIP/unlimitednet/8888413446,300,T',41,35,'ANSWERED',3,'','1278470128.1923',''),('2010-07-07 17:24:00','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-0ddf;2','Local/2146904814@from-internal-d73b;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',14,0,'NO ANSWER',3,'','1278541440.1932',''),('2010-07-07 17:24:00','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-d73b;2','SIP/unlimitednet-0000042f','Dial','SIP/unlimitednet/2146904814,300,T',14,0,'NO ANSWER',3,'','1278541440.1934',''),('2010-07-07 17:23:56','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-9709;2','Local/RG-200-2146904814#@from-internal-0ddf;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',18,0,'NO ANSWER',3,'','1278541436.1929',''),('2010-07-07 17:23:56','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-c643;2','SIP/200-0000042e','Dial','SIP/200,64,trM(auto-blkvm)',18,0,'ANSWERED',3,'','1278541436.1927',''),('2010-07-07 17:23:51','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000042d','Local/FMPR-200@from-internal-c643;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',396,373,'ANSWERED',3,'','1278541431.1925',''),('2010-07-08 16:15:48','\"8007688858\" <8007688858>','8007688858','FMPR-200','from-internal','Local/FMPR-200@from-internal-6ed9;2','SIP/200-00000431','Dial','SIP/200,64,trM(auto-blkvm)',33,0,'NO ANSWER',3,'','1278623748.1938',''),('2010-07-08 16:15:48','\"8007688858\" <8007688858>','8007688858','200','from-did-direct','SIP/unlimitednet-00000430','Local/FMGL-2146904814#@from-internal-e375;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',33,0,'NO ANSWER',3,'','1278623748.1936',''),('2010-07-08 16:15:48','\"8007688858\" <8007688858>','8007688858','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-e375;2','Local/RG-200-2146904814#@from-internal-e8c9;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',33,0,'NO ANSWER',3,'','1278623748.1940',''),('2010-07-08 16:15:52','','','2146904814','from-internal','Local/2146904814@from-internal-1756;1','','MacroExit','',29,8,'ANSWERED',3,'','1278623752.1944',''),('2010-07-08 16:15:52','8007688858','8007688858','2146904814','from-internal','Local/2146904814@from-internal-1756;2','SIP/unlimitednet-00000432','Dial','SIP/unlimitednet/2146904814,300,T',29,8,'ANSWERED',3,'','1278623752.1945',''),('2010-07-08 16:15:52','\"8007688858\" <8007688858>','8007688858','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-e8c9;2','Local/2146904814@from-internal-1756;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',29,0,'NO ANSWER',3,'','1278623752.1943',''),('2010-07-08 19:11:33','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000433','SIP/unlimitednet-00000434','Dial','SIP/unlimitednet/9893625004,300,T',217,187,'ANSWERED',3,'','1278634293.1947',''),('2010-07-08 19:22:03','\"2146904734\" <2146904734>','2146904734','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-34cc;2','Local/2146904814@from-internal-e817;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',14,0,'NO ANSWER',3,'','1278634923.1956',''),('2010-07-08 19:21:58','\"2146904734\" <2146904734>','2146904734','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-9b10;2','Local/RG-200-2146904814#@from-internal-34cc;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',19,0,'NO ANSWER',3,'','1278634918.1953',''),('2010-07-08 19:22:03','2146904734','2146904734','2146904814','from-internal','Local/2146904814@from-internal-e817;2','SIP/unlimitednet-00000437','Dial','SIP/unlimitednet/2146904814,300,T',14,0,'NO ANSWER',3,'','1278634923.1958',''),('2010-07-08 19:21:58','\"2146904734\" <2146904734>','2146904734','FMPR-200','from-internal','Local/FMPR-200@from-internal-e1c8;2','SIP/200-00000436','Dial','SIP/200,64,trM(auto-blkvm)',19,0,'ANSWERED',3,'','1278634918.1951',''),('2010-07-08 19:21:58','\"2146904734\" <2146904734>','2146904734','200','from-did-direct','SIP/unlimitednet-00000435','Local/FMPR-200@from-internal-e1c8;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',44,25,'ANSWERED',3,'','1278634918.1949',''),('2010-07-08 19:43:51','\"2146904814\" <2146904814>','2146904814','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-cb62;2','Local/RG-200-2146904814#@from-internal-548c;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',7,0,'NO ANSWER',3,'','1278636231.1964',''),('2010-07-08 19:43:55','\"2146904814\" <2146904814>','2146904814','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-548c;2','Local/2146904814@from-internal-fcba;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',3,0,'NO ANSWER',3,'','1278636235.1967',''),('2010-07-08 19:43:55','2146904814','2146904814','2146904814','from-internal','Local/2146904814@from-internal-fcba;2','SIP/unlimitednet-0000043a','Dial','SIP/unlimitednet/2146904814,300,T',3,0,'NO ANSWER',3,'','1278636235.1969',''),('2010-07-08 19:43:51','\"2146904814\" <2146904814>','2146904814','FMPR-200','from-internal','Local/FMPR-200@from-internal-7e13;2','SIP/200-00000439','Dial','SIP/200,64,trM(auto-blkvm)',7,0,'ANSWERED',3,'','1278636231.1962',''),('2010-07-08 19:43:51','\"2146904814\" <2146904814>','2146904814','200','from-did-direct','SIP/unlimitednet-00000438','Local/FMPR-200@from-internal-7e13;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',47,40,'ANSWERED',3,'','1278636231.1960',''),('2010-07-09 11:33:24','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-6600;2','SIP/201-0000043c','Dial','SIP/201,63,trM(auto-blkvm)',20,0,'NO ANSWER',3,'','1278693204.1973',''),('2010-07-09 11:33:24','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-416b;2','Local/4696846582@from-internal-ad17;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',20,0,'ANSWERED',3,'','1278693204.1975',''),('2010-07-09 11:33:27','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-ad17;2','SIP/unlimitednet-0000043d','Dial','SIP/unlimitednet/4696846582,300,T',41,24,'ANSWERED',3,'','1278693207.1978',''),('2010-07-09 11:33:23','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-0000043b','Local/FMGL-4696846582#@from-internal-416b;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',45,24,'ANSWERED',3,'','1278693203.1971',''),('2010-07-09 11:34:30','\"David Anderson\" <3607197197>','3607197197','3609536629','from-internal','SIP/300-0000043e','SIP/unlimitednet-0000043f','Dial','SIP/unlimitednet/3609536629,300,T',39,25,'ANSWERED',3,'','1278693270.1980',''),('2010-07-09 11:37:28','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-00000440','SIP/unlimitednet-00000441','Dial','SIP/unlimitednet/9728370573,300,T',32,0,'NO ANSWER',3,'','1278693448.1982',''),('2010-07-09 11:42:21','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000442','SIP/unlimitednet-00000443','Dial','SIP/unlimitednet/2144845422,300,T',768,757,'ANSWERED',3,'','1278693741.1984',''),('2010-07-09 11:55:21','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-00000444','SIP/unlimitednet-00000445','Dial','SIP/unlimitednet/9893625004,300,T',676,642,'ANSWERED',3,'','1278694521.1986',''),('2010-07-09 15:44:06','\"Sam Sprain\" <3607196747>','3607196747','12148129103','from-internal','SIP/201-00000446','SIP/unlimitednet-00000447','Dial','SIP/unlimitednet/2148129103,300,T',1368,1352,'ANSWERED',3,'','1278708246.1988',''),('2010-07-09 17:53:11','\"3602548123\" <3602548123>','3602548123','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-b64d;2','Local/RG-200-2146904814#@from-internal-a44f;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',20,0,'NO ANSWER',3,'','1278715991.1994',''),('2010-07-09 17:53:16','3602548123','3602548123','2146904814','from-internal','Local/2146904814@from-internal-da62;2','SIP/unlimitednet-0000044a','Dial','SIP/unlimitednet/2146904814,300,T',15,0,'NO ANSWER',3,'','1278715996.1999',''),('2010-07-09 17:53:16','\"3602548123\" <3602548123>','3602548123','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-a44f;2','Local/2146904814@from-internal-da62;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',15,0,'NO ANSWER',3,'','1278715996.1997',''),('2010-07-09 17:53:11','\"3602548123\" <3602548123>','3602548123','FMPR-200','from-internal','Local/FMPR-200@from-internal-9d1f;2','SIP/200-00000449','Dial','SIP/200,64,trM(auto-blkvm)',21,1,'ANSWERED',3,'','1278715991.1992',''),('2010-07-09 17:53:11','\"3602548123\" <3602548123>','3602548123','200','from-did-direct','SIP/unlimitednet-00000448','Local/FMPR-200@from-internal-9d1f;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',39,19,'ANSWERED',3,'','1278715991.1990',''),('2010-07-10 09:50:12','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-0000044b','SIP/unlimitednet-0000044c','Dial','SIP/unlimitednet/8888413446,300,T',37,34,'ANSWERED',3,'','1278773412.2001',''),('2010-07-10 09:50:57','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-0000044d','SIP/unlimitednet-0000044e','Dial','SIP/unlimitednet/8888413446,300,T',37,34,'ANSWERED',3,'','1278773457.2003',''),('2010-07-10 09:51:42','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-0000044f','SIP/unlimitednet-00000450','Dial','SIP/unlimitednet/8888413446,300,T',40,37,'ANSWERED',3,'','1278773502.2005',''),('2010-07-10 09:52:30','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000451','SIP/unlimitednet-00000452','Dial','SIP/unlimitednet/8888413446,300,T',27,24,'ANSWERED',3,'','1278773550.2007',''),('2010-07-10 10:51:47','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000453','SIP/unlimitednet-00000454','Dial','SIP/unlimitednet/8888413446,300,T',42,38,'ANSWERED',3,'','1278777107.2009',''),('2010-07-10 10:52:37','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000455','SIP/unlimitednet-00000456','Dial','SIP/unlimitednet/8888413446,300,T',37,34,'ANSWERED',3,'','1278777157.2011',''),('2010-07-10 10:53:22','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000457','SIP/unlimitednet-00000458','Dial','SIP/unlimitednet/8888413446,300,T',36,33,'ANSWERED',3,'','1278777202.2013',''),('2010-07-10 10:54:08','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000459','SIP/unlimitednet-0000045a','Dial','SIP/unlimitednet/8888413446,300,T',37,34,'ANSWERED',3,'','1278777248.2015',''),('2010-07-10 10:54:53','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-0000045b','SIP/unlimitednet-0000045c','Dial','SIP/unlimitednet/8888413446,300,T',37,34,'ANSWERED',3,'','1278777293.2017',''),('2010-07-10 10:55:38','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-0000045d','SIP/unlimitednet-0000045e','Dial','SIP/unlimitednet/8888413446,300,T',37,34,'ANSWERED',3,'','1278777338.2019',''),('2010-07-10 11:07:45','\"Kris Anderson\" <200>','200','*97','from-internal','SIP/200-0000045f','','VoiceMailMain','200@default',14,14,'ANSWERED',3,'','1278778065.2021',''),('2010-07-10 11:13:29','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000460','SIP/unlimitednet-00000461','Dial','SIP/unlimitednet/8888413446,300,T',30,27,'ANSWERED',3,'','1278778409.2022',''),('2010-07-10 11:14:16','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000462','SIP/unlimitednet-00000463','Dial','SIP/unlimitednet/8888413446,300,T',29,26,'ANSWERED',3,'','1278778456.2024',''),('2010-07-10 11:15:01','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000464','SIP/unlimitednet-00000465','Dial','SIP/unlimitednet/8888413446,300,T',31,26,'ANSWERED',3,'','1278778501.2026',''),('2010-07-10 11:15:49','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000466','SIP/unlimitednet-00000467','Dial','SIP/unlimitednet/8888413446,300,T',29,26,'ANSWERED',3,'','1278778549.2028',''),('2010-07-10 11:16:34','\"Kris Anderson\" <2146130162>','2146130162','18888413446','from-internal','SIP/200-00000468','SIP/unlimitednet-00000469','Dial','SIP/unlimitednet/8888413446,300,T',28,25,'ANSWERED',3,'','1278778594.2030',''),('2010-07-10 11:19:53','\"Kris Anderson\" <2146130162>','2146130162','8888413446','from-internal','SIP/200-0000046a','SIP/unlimitednet-0000046b','Dial','SIP/unlimitednet/8888413446,300,T',22,19,'ANSWERED',3,'','1278778793.2032',''),('2010-07-10 11:30:41','\"Sam Sprain\" <3607196747>','3607196747','3607197197','from-internal','SIP/201-0000046c','SIP/unlimitednet-0000046d','Dial','SIP/unlimitednet/3607197197,300,T',37,8,'ANSWERED',3,'','1278779441.2034',''),('2010-07-10 11:30:48','\"3607196747\" <3607196747>','3607196747','300','from-did-direct','SIP/unlimitednet-0000046e','SIP/300-0000046f','Dial','SIP/300,\"\",tr',30,8,'ANSWERED',3,'','1278779448.2036',''),('2010-07-10 11:37:02','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-00000470','SIP/300-00000471','Dial','SIP/300,\"\",tr',35,14,'ANSWERED',3,'','1278779822.2038',''),('2010-07-11 14:08:04','\"8172820326\" <8172820326>','8172820326','s','from-trunk','SIP/unlimitednet-00000472','','SayAlpha','8883330573',10,10,'ANSWERED',3,'','1278875284.2040',''),('2010-07-11 19:50:56','\"David Anderson\" <3607197197>','3607197197','9728351300','from-internal','SIP/300-00000473','SIP/unlimitednet-00000474','Dial','SIP/unlimitednet/9728351300,300,T',55,37,'ANSWERED',3,'','1278895856.2041',''),('2010-07-12 09:41:32','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-00000475','SIP/unlimitednet-00000476','Dial','SIP/unlimitednet/9728370573,300,T',37,0,'ANSWERED',3,'','1278945692.2043',''),('2010-07-12 10:54:53','\"David Anderson\" <3607197197>','3607197197','9728351300','from-internal','SIP/300-00000477','SIP/unlimitednet-00000478','Dial','SIP/unlimitednet/9728351300,300,T',64,32,'ANSWERED',3,'','1278950093.2045',''),('2010-07-12 11:19:06','\"9728351300\" <9728351300>','9728351300','300','from-did-direct','SIP/unlimitednet-00000479','SIP/300-0000047a','Dial','SIP/300,\"\",tr',847,839,'ANSWERED',3,'','1278951546.2047',''),('2010-07-12 11:39:58','\"David Anderson\" <3607197197>','3607197197','9728370537','from-internal','SIP/300-0000047b','SIP/unlimitednet-0000047c','Dial','SIP/unlimitednet/9728370537,300,T',67,32,'ANSWERED',3,'','1278952798.2049',''),('2010-07-12 11:41:22','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-0000047f','SIP/unlimitednet-00000480','Dial','SIP/unlimitednet/9728370573,300,T',22,0,'NO ANSWER',3,'','1278952882.2053',''),('2010-07-12 11:41:56','\"David Anderson\" <3607197197>','3607197197','9728370373','from-internal','SIP/300-00000481','SIP/unlimitednet-00000482','Dial','SIP/unlimitednet/9728370373,300,T',29,11,'ANSWERED',3,'','1278952916.2055',''),('2010-07-12 11:41:05','\"Sam Sprain\" <3607196747>','3607196747','2142571406','from-internal','SIP/201-0000047d','SIP/unlimitednet-0000047e','Dial','SIP/unlimitednet/2142571406,300,T',112,101,'ANSWERED',3,'','1278952865.2051',''),('2010-07-12 11:42:43','\"David Anderson\" <3607197197>','3607197197','9728370573','from-internal','SIP/300-00000483','SIP/unlimitednet-00000484','Dial','SIP/unlimitednet/9728370573,300,T',1017,990,'ANSWERED',3,'','1278952963.2057',''),('2010-07-12 13:09:39','\"3606907263\" <3606907263>','3606907263','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-cef5;2','Local/RG-200-2146904814#@from-internal-f5e8;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',26,0,'NO ANSWER',3,'','1278958179.2065',''),('2010-07-12 13:09:39','\"3606907263\" <3606907263>','3606907263','FMPR-200','from-internal','Local/FMPR-200@from-internal-68da;2','SIP/200-00000488','Dial','SIP/200,64,trM(auto-blkvm)',26,0,'ANSWERED',3,'','1278958179.2063',''),('2010-07-12 13:09:43','','','2146904814','from-internal','Local/2146904814@from-internal-9e09;1','','MacroExit','',25,5,'ANSWERED',3,'','1278958183.2069',''),('2010-07-12 13:09:43','3606907263','3606907263','2146904814','from-internal','Local/2146904814@from-internal-9e09;2','SIP/unlimitednet-00000489','Dial','SIP/unlimitednet/2146904814,300,T',25,5,'ANSWERED',3,'','1278958183.2070',''),('2010-07-12 13:09:43','\"3606907263\" <3606907263>','3606907263','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-f5e8;2','Local/2146904814@from-internal-9e09;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',25,0,'NO ANSWER',3,'','1278958183.2068',''),('2010-07-12 13:09:38','\"3606907263\" <3606907263>','3606907263','200','from-did-direct','SIP/unlimitednet-00000487','Local/FMPR-200@from-internal-68da;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',60,33,'ANSWERED',3,'','1278958178.2061',''),('2010-07-12 12:47:25','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-00000485','SIP/300-00000486','Dial','SIP/300,\"\",tr',2342,2333,'ANSWERED',3,'','1278956845.2059',''),('2010-07-12 13:33:31','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-0000048a','SIP/unlimitednet-0000048b','Dial','SIP/unlimitednet/9893625004,300,T',512,496,'ANSWERED',3,'','1278959611.2072',''),('2010-07-12 13:42:55','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-f8a3;2','Local/2146904814@from-internal-1427;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',8,0,'NO ANSWER',3,'','1278960175.2081',''),('2010-07-12 13:42:55','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-1427;2','SIP/unlimitednet-0000048e','Dial','SIP/unlimitednet/2146904814,300,T',8,0,'NO ANSWER',3,'','1278960175.2083',''),('2010-07-12 13:42:50','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-2c97;2','Local/RG-200-2146904814#@from-internal-f8a3;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',13,0,'NO ANSWER',3,'','1278960170.2078',''),('2010-07-12 13:42:50','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-e0a2;2','SIP/200-0000048d','Dial','SIP/200,64,trM(auto-blkvm)',13,0,'ANSWERED',3,'','1278960170.2076',''),('2010-07-12 13:42:50','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000048c','Local/FMPR-200@from-internal-e0a2;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',333,320,'ANSWERED',3,'','1278960170.2074',''),('2010-07-12 13:58:11','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-0000048f','SIP/unlimitednet-00000490','Dial','SIP/unlimitednet/2144845422,300,T',478,465,'ANSWERED',3,'','1278961091.2085',''),('2010-07-12 14:21:11','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-21ba;2','SIP/unlimitednet-00000493','Dial','SIP/unlimitednet/4696846582,300,T',7,0,'NO ANSWER',3,'','1278962471.2094',''),('2010-07-12 14:21:08','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-a045;2','Local/4696846582@from-internal-21ba;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',10,0,'NO ANSWER',3,'','1278962468.2091',''),('2010-07-12 14:21:08','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-25b3;2','SIP/201-00000492','Dial','SIP/201,63,trM(auto-blkvm)',10,0,'ANSWERED',3,'','1278962468.2089',''),('2010-07-12 14:21:08','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-00000491','Local/FMPR-201@from-internal-25b3;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',177,167,'ANSWERED',3,'','1278962468.2087',''),('2010-07-12 14:48:50','\"Kris Anderson\" <2146130162>','2146130162','9723659692','from-internal','SIP/200-00000494','SIP/unlimitednet-00000495','Dial','SIP/unlimitednet/9723659692,300,T',130,112,'ANSWERED',3,'','1278964130.2096',''),('2010-07-12 14:51:28','\"Kris Anderson\" <2146130162>','2146130162','2145294791','from-internal','SIP/200-00000496','SIP/unlimitednet-00000497','Dial','SIP/unlimitednet/2145294791,300,T',50,16,'ANSWERED',3,'','1278964288.2098',''),('2010-07-12 15:06:28','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000498','SIP/unlimitednet-00000499','Dial','SIP/unlimitednet/9893625004,300,T',131,107,'ANSWERED',3,'','1278965188.2100',''),('2010-07-12 15:52:30','\"Kris Anderson\" <2146130162>','2146130162','2145223937','from-internal','SIP/200-0000049a','SIP/unlimitednet-0000049b','Dial','SIP/unlimitednet/2145223937,300,T',63,47,'ANSWERED',3,'','1278967950.2102',''),('2010-07-12 20:21:42','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-7a92;2','Local/2146904814@from-internal-ce87;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',13,0,'NO ANSWER',3,'','1278984102.2113',''),('2010-07-12 20:21:42','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-ce87;2','SIP/unlimitednet-000004a0','Dial','SIP/unlimitednet/2146904814,300,T',13,0,'NO ANSWER',3,'','1278984102.2115',''),('2010-07-12 20:21:38','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-6d0c;2','Local/RG-200-2146904814#@from-internal-7a92;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',17,0,'NO ANSWER',3,'','1278984098.2110',''),('2010-07-12 20:21:38','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-8fb5;2','SIP/200-0000049f','Dial','SIP/200,64,trM(auto-blkvm)',17,0,'ANSWERED',3,'','1278984098.2108',''),('2010-07-12 20:21:38','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-0000049e','Local/FMPR-200@from-internal-8fb5;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',52,35,'ANSWERED',3,'','1278984098.2106',''),('2010-07-12 20:17:55','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-0000049c','SIP/300-0000049d','Dial','SIP/300,\"\",tr',644,629,'ANSWERED',3,'','1278983875.2104',''),('2010-07-13 10:06:05','\"David Anderson\" <3607197197>','3607197197','9723822167','from-internal','SIP/300-000004a1','SIP/unlimitednet-000004a2','Busy','20',7,0,'BUSY',3,'','1279033565.2117',''),('2010-07-13 10:12:07','\"David Anderson\" <3607197197>','3607197197','9723822167','from-internal','SIP/300-000004a3','SIP/unlimitednet-000004a4','Busy','20',4,0,'BUSY',3,'','1279033927.2119',''),('2010-07-13 10:13:06','\"David Anderson\" <3607197197>','3607197197','9723822167','from-internal','SIP/300-000004a5','SIP/unlimitednet-000004a6','Busy','20',4,0,'BUSY',3,'','1279033986.2121',''),('2010-07-13 10:52:57','\"David Anderson\" <3607197197>','3607197197','9723282167','from-internal','SIP/300-000004a7','SIP/unlimitednet-000004a8','Busy','20',4,0,'BUSY',3,'','1279036377.2123',''),('2010-07-13 11:17:18','\"David Anderson\" <3607197197>','3607197197','9723822167','from-internal','SIP/300-000004a9','SIP/unlimitednet-000004aa','Busy','20',5,0,'BUSY',3,'','1279037838.2125',''),('2010-07-13 16:26:35','\"David Anderson\" <3607197197>','3607197197','4436150686','from-internal','SIP/300-000004ab','SIP/unlimitednet-000004ac','Busy','20',8,0,'BUSY',3,'','1279056395.2127',''),('2010-07-13 16:36:45','\"David Anderson\" <3607197197>','3607197197','4692376038','from-internal','SIP/300-000004ad','SIP/unlimitednet-000004ae','Busy','20',5,0,'BUSY',3,'','1279057005.2129',''),('2010-07-14 08:47:33','\"Restricted\" <Restricted>','Restricted','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-3edb;2','Local/4696846582@from-internal-af88;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',26,0,'ANSWERED',3,'','1279115253.2135',''),('2010-07-14 08:47:33','\"Restricted\" <Restricted>','Restricted','FMPR-201','from-internal','Local/FMPR-201@from-internal-057e;2','SIP/201-000004b0','Dial','SIP/201,63,trM(auto-blkvm)',26,0,'NO ANSWER',3,'','1279115253.2133',''),('2010-07-14 08:47:36','Restricted','','4696846582','from-internal','Local/4696846582@from-internal-af88;2','SIP/unlimitednet-000004b1','Dial','SIP/unlimitednet/4696846582,300,T',116,93,'ANSWERED',3,'','1279115256.2138',''),('2010-07-14 08:47:33','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-000004af','Local/FMGL-4696846582#@from-internal-3edb;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',119,93,'ANSWERED',3,'','1279115253.2131',''),('2010-07-14 09:47:30','\"Restricted\" <Restricted>','Restricted','FMPR-201','from-internal','Local/FMPR-201@from-internal-f747;2','SIP/201-000004b5','Dial','SIP/201,63,trM(auto-blkvm)',17,0,'NO ANSWER',3,'','1279118850.2144',''),('2010-07-14 09:47:30','\"Restricted\" <Restricted>','Restricted','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-c481;2','Local/4696846582@from-internal-eb46;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',17,0,'ANSWERED',3,'','1279118850.2146',''),('2010-07-14 09:47:33','Restricted','','4696846582','from-internal','Local/4696846582@from-internal-eb46;2','SIP/unlimitednet-000004b6','Dial','SIP/unlimitednet/4696846582,300,T',95,81,'ANSWERED',3,'','1279118853.2149',''),('2010-07-14 09:47:30','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-000004b4','Local/FMGL-4696846582#@from-internal-c481;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',98,81,'ANSWERED',3,'','1279118850.2142',''),('2010-07-14 09:44:31','\"Kris Anderson\" <2146130162>','2146130162','2142571406','from-internal','SIP/200-000004b2','SIP/unlimitednet-000004b3','Dial','SIP/unlimitednet/2142571406,300,T',361,351,'ANSWERED',3,'','1279118671.2140',''),('2010-07-14 09:53:54','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000004b7','SIP/unlimitednet-000004b8','Dial','SIP/unlimitednet/2144845422,300,T',3487,3475,'ANSWERED',3,'','1279119234.2151',''),('2010-07-14 10:56:30','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-7276;2','SIP/unlimitednet-000004bd','Dial','SIP/unlimitednet/2146904814,300,T',19,0,'NO ANSWER',3,'','1279122990.2164',''),('2010-07-14 10:56:29','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-0be5;2','Local/2146904814@from-internal-7276;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',20,0,'NO ANSWER',3,'','1279122989.2162',''),('2010-07-14 10:56:25','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-a74a;2','Local/RG-200-2146904814#@from-internal-0be5;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',24,0,'NO ANSWER',3,'','1279122985.2159',''),('2010-07-14 10:54:43','\"Kris Anderson\" <2146130162>','2146130162','2142571406','from-internal','SIP/200-000004b9','SIP/unlimitednet-000004ba','Dial','SIP/unlimitednet/2142571406,300,T',126,113,'ANSWERED',3,'','1279122883.2153',''),('2010-07-14 10:56:25','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-7a71;2','SIP/200-000004bc','Dial','SIP/200,64,trM(auto-blkvm)',24,0,'ANSWERED',3,'','1279122985.2157',''),('2010-07-14 10:56:25','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000004bb','Local/FMPR-200@from-internal-7a71;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',1489,1465,'ANSWERED',3,'','1279122985.2155',''),('2010-07-14 11:32:31','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-47f0;2','Local/2146904814@from-internal-d7d4;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1279125151.2173',''),('2010-07-14 11:32:31','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-d7d4;2','SIP/unlimitednet-000004c0','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1279125151.2175',''),('2010-07-14 11:32:27','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-189d;2','Local/RG-200-2146904814#@from-internal-47f0;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',6,0,'NO ANSWER',3,'','1279125147.2170',''),('2010-07-14 11:32:27','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-aa26;2','SIP/200-000004bf','Dial','SIP/200,64,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1279125147.2168',''),('2010-07-14 11:32:27','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000004be','Local/FMPR-200@from-internal-aa26;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',1234,1228,'ANSWERED',3,'','1279125147.2166',''),('2010-07-14 11:53:18','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-000004c1','SIP/unlimitednet-000004c2','Dial','SIP/unlimitednet/9893625004,300,T',460,442,'ANSWERED',3,'','1279126398.2177',''),('2010-07-14 12:02:11','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-f85e;2','SIP/unlimitednet-000004c7','Dial','SIP/unlimitednet/2146904814,300,T',7,0,'NO ANSWER',3,'','1279126931.2190',''),('2010-07-14 12:02:07','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-2587;2','Local/RG-200-2146904814#@from-internal-72c4;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',11,0,'NO ANSWER',3,'','1279126927.2185',''),('2010-07-14 12:02:11','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-72c4;2','Local/2146904814@from-internal-f85e;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',7,0,'NO ANSWER',3,'','1279126931.2188',''),('2010-07-14 12:02:07','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-3627;2','SIP/200-000004c6','Dial','SIP/200,64,trM(auto-blkvm)',11,0,'ANSWERED',3,'','1279126927.2183',''),('2010-07-14 12:02:07','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000004c5','Local/FMPR-200@from-internal-3627;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',26,15,'ANSWERED',3,'','1279126927.2181',''),('2010-07-14 12:01:04','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-000004c3','SIP/unlimitednet-000004c4','Dial','SIP/unlimitednet/2144845422,300,T',1480,1469,'ANSWERED',3,'','1279126864.2179',''),('2010-07-14 12:51:07','\"2144346592\" <2144346592>','2144346592','FMPR-200','from-internal','Local/FMPR-200@from-internal-f7f5;2','SIP/200-000004ca','Dial','SIP/200,64,trM(auto-blkvm)',8,0,'ANSWERED',3,'','1279129867.2195',''),('2010-07-14 12:50:57','\"2144346592\" <2144346592>','2144346592','200','from-did-direct','SIP/unlimitednet-000004c9','Local/FMPR-200@from-internal-f7f5;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',27,9,'ANSWERED',3,'','1279129857.2193',''),('2010-07-14 12:52:21','\"9728351300\" <9728351300>','9728351300','300','from-did-direct','SIP/unlimitednet-000004cb','SIP/300-000004cc','Dial','SIP/300,\"\",tr',121,68,'ANSWERED',3,'','1279129941.2199',''),('2010-07-14 15:33:19','\"David Anderson\" <3607197197>','3607197197','4436150686','from-internal','SIP/300-000004cd','SIP/unlimitednet-000004ce','Dial','SIP/unlimitednet/4436150686,300,T',74,36,'ANSWERED',3,'','1279139599.2201',''),('2010-07-14 19:46:30','\"4436150686\" <4436150686>','4436150686','300','from-did-direct','SIP/unlimitednet-000004cf','SIP/300-000004d0','Dial','SIP/300,\"\",tr',3960,3945,'ANSWERED',3,'','1279154790.2203',''),('2010-07-14 23:02:40','\"anonymous\" <anonymous>','anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-dd2c;2','SIP/201-000004d2','Dial','SIP/201,63,trM(auto-blkvm)',21,0,'NO ANSWER',3,'','1279166560.2207',''),('2010-07-14 23:02:40','\"anonymous\" <anonymous>','anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-c53c;2','Local/4696846582@from-internal-a36d;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',21,0,'ANSWERED',3,'','1279166560.2209',''),('2010-07-14 23:02:43','anonymous','','4696846582','from-internal','Local/4696846582@from-internal-a36d;2','SIP/unlimitednet-000004d3','Dial','SIP/unlimitednet/4696846582,300,T',52,34,'ANSWERED',3,'','1279166563.2212',''),('2010-07-14 23:02:40','\"anonymous\" <anonymous>','anonymous','201','from-did-direct','SIP/unlimitednet-000004d1','Local/FMGL-4696846582#@from-internal-c53c;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',55,34,'ANSWERED',3,'','1279166560.2205',''),('2010-07-15 05:47:52','\"62.234.181.50:5060\" <101>','101','s','from-trunk','SIP/216.245.215.82-000004d4','','Wait','2',1,1,'ANSWERED',3,'','1279190872.2214',''),('2010-07-15 09:50:20','\"anonymous\" <anonymous>','anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-672e;2','SIP/201-000004d6','Dial','SIP/201,63,trM(auto-blkvm)',21,0,'NO ANSWER',3,'','1279205420.2217',''),('2010-07-15 09:50:20','\"anonymous\" <anonymous>','anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-b397;2','Local/4696846582@from-internal-5a30;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',21,0,'ANSWERED',3,'','1279205420.2219',''),('2010-07-15 09:50:19','\"anonymous\" <anonymous>','anonymous','201','from-did-direct','SIP/unlimitednet-000004d5','Local/FMGL-4696846582#@from-internal-b397;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',58,36,'ANSWERED',3,'','1279205419.2215',''),('2010-07-15 09:50:23','anonymous','','4696846582','from-internal','Local/4696846582@from-internal-5a30;2','SIP/unlimitednet-000004d7','Dial','SIP/unlimitednet/4696846582,300,T',54,36,'ANSWERED',3,'','1279205423.2222',''),('2010-07-15 10:08:58','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000004d8','SIP/unlimitednet-000004d9','Dial','SIP/unlimitednet/2144845422,300,T',384,372,'ANSWERED',3,'','1279206538.2224',''),('2010-07-15 10:34:54','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-e743;2','SIP/unlimitednet-000004dc','Dial','SIP/unlimitednet/2146904814,300,T',5,0,'NO ANSWER',3,'','1279208094.2235',''),('2010-07-15 10:34:54','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-d2da;2','Local/2146904814@from-internal-e743;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',5,0,'NO ANSWER',3,'','1279208094.2233',''),('2010-07-15 10:34:50','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-a59b;2','Local/RG-200-2146904814#@from-internal-d2da;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',9,0,'NO ANSWER',3,'','1279208090.2230',''),('2010-07-15 10:34:50','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-c1cf;2','SIP/200-000004db','Dial','SIP/200,64,trM(auto-blkvm)',9,0,'ANSWERED',3,'','1279208090.2228',''),('2010-07-15 10:34:49','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000004da','Local/FMPR-200@from-internal-c1cf;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',27,17,'ANSWERED',3,'','1279208089.2226',''),('2010-07-15 10:46:56','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-000004dd','SIP/unlimitednet-000004de','Dial','SIP/unlimitednet/9893625004,300,T',37,4,'ANSWERED',3,'','1279208816.2237',''),('2010-07-15 11:55:14','\"David Anderson\" <3607197197>','3607197197','9723822167','from-internal','SIP/300-000004df','SIP/unlimitednet-000004e0','Dial','SIP/unlimitednet/9723822167,300,T',19,0,'NO ANSWER',3,'','1279212914.2239',''),('2010-07-15 11:55:42','\"David Anderson\" <3607197197>','3607197197','9723822167','from-internal','SIP/300-000004e1','SIP/unlimitednet-000004e2','Dial','SIP/unlimitednet/9723822167,300,T',20,0,'NO ANSWER',3,'','1279212942.2241',''),('2010-07-15 11:56:13','\"David Anderson\" <3607197197>','3607197197','9723822167','from-internal','SIP/300-000004e3','SIP/unlimitednet-000004e4','Dial','SIP/unlimitednet/9723822167,300,T',19,0,'NO ANSWER',3,'','1279212973.2243',''),('2010-07-15 11:56:45','\"David Anderson\" <3607197197>','3607197197','3607197190','from-internal','SIP/300-000004e5','SIP/unlimitednet-000004e6','Dial','SIP/unlimitednet/3607197190,300,T',24,0,'NO ANSWER',3,'','1279213005.2245',''),('2010-07-15 11:56:53','\"3607197197\" <3607197197>','3607197197','200','from-did-direct','SIP/unlimitednet-000004e7','Local/FMGL-2146904814#@from-internal-a934;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',16,0,'NO ANSWER',3,'','1279213013.2247',''),('2010-07-15 11:56:57','\"3607197197\" <3607197197>','3607197197','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-7bf5;2','Local/2146904814@from-internal-9395;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',12,0,'NO ANSWER',3,'','1279213017.2254',''),('2010-07-15 11:56:57','3607197197','3607197197','2146904814','from-internal','Local/2146904814@from-internal-9395;2','SIP/unlimitednet-000004e9','Dial','SIP/unlimitednet/2146904814,300,T',12,0,'NO ANSWER',3,'','1279213017.2256',''),('2010-07-15 11:56:53','\"3607197197\" <3607197197>','3607197197','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-a934;2','Local/RG-200-2146904814#@from-internal-7bf5;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',16,0,'NO ANSWER',3,'','1279213013.2251',''),('2010-07-15 11:56:53','\"3607197197\" <3607197197>','3607197197','FMPR-200','from-internal','Local/FMPR-200@from-internal-b367;2','SIP/200-000004e8','Dial','SIP/200,64,trM(auto-blkvm)',16,0,'NO ANSWER',3,'','1279213013.2249',''),('2010-07-15 12:35:00','4699528840','4699528840','2146904814','from-internal','Local/2146904814@from-internal-b679;2','SIP/unlimitednet-000004ed','Dial','SIP/unlimitednet/2146904814,300,T',13,0,'NO ANSWER',3,'','1279215300.2268',''),('2010-07-15 12:35:00','\"4699528840\" <4699528840>','4699528840','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-f09a;2','Local/2146904814@from-internal-b679;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',13,0,'NO ANSWER',3,'','1279215300.2266',''),('2010-07-15 12:34:55','\"4699528840\" <4699528840>','4699528840','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-2e17;2','Local/RG-200-2146904814#@from-internal-f09a;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',18,0,'NO ANSWER',3,'','1279215295.2263',''),('2010-07-15 12:34:55','\"4699528840\" <4699528840>','4699528840','FMPR-200','from-internal','Local/FMPR-200@from-internal-fd1c;2','SIP/200-000004ec','Dial','SIP/200,64,trM(auto-blkvm)',19,1,'ANSWERED',3,'','1279215295.2261',''),('2010-07-15 12:34:55','\"4699528840\" <4699528840>','4699528840','200','from-did-direct','SIP/unlimitednet-000004eb','Local/FMPR-200@from-internal-fd1c;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',96,78,'ANSWERED',3,'','1279215295.2259',''),('2010-07-15 14:54:45','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-000004ee','SIP/unlimitednet-000004ef','Dial','SIP/unlimitednet/9893625004,300,T',52,30,'ANSWERED',3,'','1279223685.2270',''),('2010-07-15 14:56:43','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-694a;2','Local/2146904814@from-internal-ff6c;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1279223803.2279',''),('2010-07-15 14:56:39','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-78d5;2','Local/RG-200-2146904814#@from-internal-694a;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',6,0,'NO ANSWER',3,'','1279223799.2276',''),('2010-07-15 14:56:43','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-ff6c;2','SIP/unlimitednet-000004f2','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1279223803.2281',''),('2010-07-15 14:56:39','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-078b;2','SIP/200-000004f1','Dial','SIP/200,64,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1279223799.2274',''),('2010-07-15 14:56:38','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-000004f0','Local/FMPR-200@from-internal-078b;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',313,306,'ANSWERED',3,'','1279223798.2272',''),('2010-07-15 15:07:29','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-c63b;2','SIP/unlimitednet-000004f5','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1279224449.2292',''),('2010-07-15 15:07:25','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-8ef6;2','Local/RG-200-2146904814#@from-internal-d7fa;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',6,0,'NO ANSWER',3,'','1279224445.2287',''),('2010-07-15 15:07:29','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-d7fa;2','Local/2146904814@from-internal-c63b;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1279224449.2290',''),('2010-07-15 15:07:25','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-188f;2','SIP/200-000004f4','Dial','SIP/200,64,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1279224445.2285',''),('2010-07-15 15:07:24','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000004f3','Local/FMPR-200@from-internal-188f;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',923,916,'ANSWERED',3,'','1279224444.2283',''),('2010-07-15 15:37:03','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000004f6','Local/FMGL-2146904814#@from-internal-a954;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',30,0,'NO ANSWER',3,'','1279226223.2294',''),('2010-07-15 15:37:03','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-a954;2','Local/RG-200-2146904814#@from-internal-fb69;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',30,0,'NO ANSWER',3,'','1279226223.2298',''),('2010-07-15 15:37:07','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-fb69;2','Local/2146904814@from-internal-d420;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',26,0,'NO ANSWER',3,'','1279226227.2301',''),('2010-07-15 15:37:07','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-d420;2','SIP/unlimitednet-000004f8','Dial','SIP/unlimitednet/2146904814,300,T',26,0,'NO ANSWER',3,'','1279226227.2303',''),('2010-07-15 15:37:03','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-8ece;2','SIP/200-000004f7','Dial','SIP/200,64,trM(auto-blkvm)',30,0,'NO ANSWER',3,'','1279226223.2296',''),('2010-07-15 15:37:49','Restricted','','4696846582','from-internal','Local/4696846582@from-internal-289c;2','SIP/unlimitednet-000004fb','Dial','SIP/unlimitednet/4696846582,300,T',7,0,'NO ANSWER',3,'','1279226269.2312',''),('2010-07-15 15:37:46','\"Restricted\" <Restricted>','Restricted','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-1990;2','Local/4696846582@from-internal-289c;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',10,0,'NO ANSWER',3,'','1279226266.2309',''),('2010-07-15 15:37:46','\"Restricted\" <Restricted>','Restricted','FMPR-201','from-internal','Local/FMPR-201@from-internal-31b5;2','SIP/201-000004fa','Dial','SIP/201,63,trM(auto-blkvm)',10,0,'ANSWERED',3,'','1279226266.2307',''),('2010-07-15 15:37:46','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-000004f9','Local/FMPR-201@from-internal-31b5;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',70,60,'ANSWERED',3,'','1279226266.2305',''),('2010-07-15 15:58:14','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-000004fc','SIP/unlimitednet-000004fd','Dial','SIP/unlimitednet/2144845422,300,T',41,16,'ANSWERED',3,'','1279227494.2314',''),('2010-07-15 15:59:05','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-a084;2','SIP/200-000004ff','Dial','SIP/200,64,trM(auto-blkvm)',3,0,'ANSWERED',3,'','1279227545.2318',''),('2010-07-15 15:59:04','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-000004fe','Local/FMPR-200@from-internal-a084;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',867,863,'ANSWERED',3,'','1279227544.2316',''),('2010-07-16 08:05:33','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-58d5;2','Local/RG-200-2146904814#@from-internal-491d;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',23,0,'NO ANSWER',3,'','1279285533.2326',''),('2010-07-16 08:05:37','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-491d;2','Local/2146904814@from-internal-0992;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',19,0,'NO ANSWER',3,'','1279285537.2329',''),('2010-07-16 08:05:37','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-0992;2','SIP/unlimitednet-00000502','Dial','SIP/unlimitednet/2146904814,300,T',19,0,'NO ANSWER',3,'','1279285537.2331',''),('2010-07-16 08:05:33','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-d7d8;2','SIP/200-00000501','Dial','SIP/200,64,trM(auto-blkvm)',23,0,'ANSWERED',3,'','1279285533.2324',''),('2010-07-16 08:05:32','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000500','Local/FMPR-200@from-internal-d7d8;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',48,24,'ANSWERED',3,'','1279285532.2322',''),('2010-07-16 08:29:26','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-a91d;2','SIP/201-00000504','Dial','SIP/201,63,trM(auto-blkvm)',20,0,'NO ANSWER',3,'','1279286966.2335',''),('2010-07-16 08:29:26','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-a525;2','Local/4696846582@from-internal-c19b;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',20,0,'ANSWERED',3,'','1279286966.2337',''),('2010-07-16 08:29:29','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-c19b;2','SIP/unlimitednet-00000505','Dial','SIP/unlimitednet/4696846582,300,T',78,61,'ANSWERED',3,'','1279286969.2340',''),('2010-07-16 08:29:26','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-00000503','Local/FMGL-4696846582#@from-internal-a525;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',81,61,'ANSWERED',3,'','1279286966.2333',''),('2010-07-16 11:14:19','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000506','SIP/unlimitednet-00000507','Dial','SIP/unlimitednet/9893625004,300,T',203,173,'ANSWERED',3,'','1279296859.2342',''),('2010-07-16 11:58:10','\"Sam Sprain\" <3607196747>','3607196747','2146904734','from-internal','SIP/201-00000508','SIP/unlimitednet-00000509','Dial','SIP/unlimitednet/2146904734,300,T',86,71,'ANSWERED',3,'','1279299490.2344',''),('2010-07-16 14:58:39','\"3609536629\" <3609536629>','3609536629','300','from-did-direct','SIP/unlimitednet-0000050a','SIP/300-0000050b','Dial','SIP/300,\"\",tr',117,104,'ANSWERED',3,'','1279310319.2346',''),('2010-07-16 19:18:51','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-375b;2','SIP/unlimitednet-0000050e','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1279325931.2357',''),('2010-07-16 19:18:47','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-9761;2','Local/RG-200-2146904814#@from-internal-d39c;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',6,0,'NO ANSWER',3,'','1279325927.2352',''),('2010-07-16 19:18:51','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-d39c;2','Local/2146904814@from-internal-375b;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1279325931.2355',''),('2010-07-16 19:18:47','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-1b02;2','SIP/200-0000050d','Dial','SIP/200,64,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1279325927.2350',''),('2010-07-16 19:18:47','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-0000050c','Local/FMPR-200@from-internal-1b02;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',540,534,'ANSWERED',3,'','1279325927.2348',''),('2010-07-17 11:43:54','\"David Anderson\" <3607197197>','3607197197','9034552643','from-internal','SIP/300-0000050f','SIP/unlimitednet-00000510','Dial','SIP/unlimitednet/9034552643,300,T',44,29,'ANSWERED',3,'','1279385034.2359',''),('2010-07-17 11:45:23','\"David Anderson\" <3607197197>','3607197197','9038861655','from-internal','SIP/300-00000511','SIP/unlimitednet-00000512','Dial','SIP/unlimitednet/9038861655,300,T',26,12,'ANSWERED',3,'','1279385123.2361',''),('2010-07-17 14:44:51','\"9034560562\" <9034560562>','9034560562','300','from-did-direct','SIP/unlimitednet-00000513','SIP/300-00000514','Dial','SIP/300,\"\",tr',40,30,'ANSWERED',3,'','1279395891.2363',''),('2010-07-18 13:25:12','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-bdc9;2','Local/RG-200-2146904814#@from-internal-9d30;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',10,0,'NO ANSWER',3,'','1279477512.2369',''),('2010-07-18 13:25:16','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-9d30;2','Local/2146904814@from-internal-925b;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',6,0,'NO ANSWER',3,'','1279477516.2372',''),('2010-07-18 13:25:16','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-925b;2','SIP/unlimitednet-00000517','Dial','SIP/unlimitednet/2146904814,300,T',6,0,'NO ANSWER',3,'','1279477516.2374',''),('2010-07-18 13:25:12','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-e244;2','SIP/200-00000516','Dial','SIP/200,64,trM(auto-blkvm)',10,0,'ANSWERED',3,'','1279477512.2367',''),('2010-07-18 13:25:11','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000515','Local/FMPR-200@from-internal-e244;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',253,242,'ANSWERED',3,'','1279477511.2365',''),('2010-07-18 13:29:32','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000518','SIP/unlimitednet-00000519','Dial','SIP/unlimitednet/9893625004,300,T',287,273,'ANSWERED',3,'','1279477772.2376',''),('2010-07-18 14:32:21','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-0000051a','SIP/unlimitednet-0000051b','Dial','SIP/unlimitednet/2144845422,300,T',106,95,'ANSWERED',3,'','1279481541.2378',''),('2010-07-19 15:10:23','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-bbcc;2','Local/RG-200-2146904814#@from-internal-6084;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',7,0,'NO ANSWER',3,'','1279570223.2384',''),('2010-07-19 15:10:27','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-6084;2','Local/2146904814@from-internal-38ea;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',3,0,'NO ANSWER',3,'','1279570227.2387',''),('2010-07-19 15:10:27','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-38ea;2','SIP/unlimitednet-0000051e','Dial','SIP/unlimitednet/2146904814,300,T',3,0,'NO ANSWER',3,'','1279570227.2389',''),('2010-07-19 15:10:23','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-2256;2','SIP/200-0000051d','Dial','SIP/200,64,trM(auto-blkvm)',7,0,'ANSWERED',3,'','1279570223.2382',''),('2010-07-19 15:22:57','\"9034560562\" <9034560562>','9034560562','300','from-did-direct','SIP/unlimitednet-0000051f','SIP/300-00000520','Dial','SIP/300,\"\",tr',1025,1013,'ANSWERED',3,'','1279570977.2391',''),('2010-07-19 15:10:23','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-0000051c','Local/FMPR-200@from-internal-2256;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',4012,4005,'ANSWERED',3,'','1279570223.2380',''),('2010-07-19 16:17:24','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000521','SIP/unlimitednet-00000522','Dial','SIP/unlimitednet/9893625004,300,T',783,760,'ANSWERED',3,'','1279574244.2393',''),('2010-07-19 20:22:19','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-7236;2','Local/RG-200-2146904814#@from-internal-4b76;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',25,0,'NO ANSWER',3,'','1279588939.2399',''),('2010-07-19 20:22:19','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-00000523','Local/FMGL-2146904814#@from-internal-7236;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',25,0,'NO ANSWER',3,'','1279588939.2395',''),('2010-07-19 20:22:23','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-4b76;2','Local/2146904814@from-internal-8aef;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',21,0,'NO ANSWER',3,'','1279588943.2402',''),('2010-07-19 20:22:19','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-91f1;2','SIP/200-00000524','Dial','SIP/200,64,trM(auto-blkvm)',25,0,'NO ANSWER',3,'','1279588939.2397',''),('2010-07-19 20:22:23','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-8aef;2','SIP/unlimitednet-00000525','Dial','SIP/unlimitednet/2146904814,300,T',21,0,'NO ANSWER',3,'','1279588943.2404',''),('2010-07-19 20:25:09','\"209.91.245      208.92.113.47     94.86.104.10:5\" <1020>','1020','s','from-trunk','SIP/216.245.215.82-00000526','','Playback','ss-noservice',4,4,'ANSWERED',3,'','1279589109.2406',''),('2010-07-20 10:05:40','\"9034560562\" <9034560562>','9034560562','300','from-did-direct','SIP/unlimitednet-00000527','SIP/300-00000528','Dial','SIP/300,\"\",tr',226,215,'ANSWERED',3,'','1279638340.2407',''),('2010-07-20 10:09:47','\"209.91.245      208.92.113.47     94.86.104.10:5\" <100>','100','s','from-trunk','SIP/216.245.215.82-00000529','','Playback','ss-noservice',3,3,'ANSWERED',3,'','1279638587.2409',''),('2010-07-20 10:10:19','\"209.91.245      208.92.113.47     94.86.104.10:5\" <100>','100','s','from-trunk','SIP/216.245.215.83-0000052a','','Wait','2',1,1,'ANSWERED',3,'','1279638619.2410',''),('2010-07-20 10:12:39','\"2143584057\" <2143584057>','2143584057','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-6cb0;2','Local/RG-200-2146904814#@from-internal-656f;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',14,0,'NO ANSWER',3,'','1279638759.2415',''),('2010-07-20 10:12:43','\"2143584057\" <2143584057>','2143584057','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-656f;2','Local/2146904814@from-internal-e6cc;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',10,0,'NO ANSWER',3,'','1279638763.2418',''),('2010-07-20 10:12:43','2143584057','2143584057','2146904814','from-internal','Local/2146904814@from-internal-e6cc;2','SIP/unlimitednet-0000052d','Dial','SIP/unlimitednet/2146904814,300,T',10,0,'NO ANSWER',3,'','1279638763.2420',''),('2010-07-20 10:12:39','\"2143584057\" <2143584057>','2143584057','FMPR-200','from-internal','Local/FMPR-200@from-internal-5fb6;2','SIP/200-0000052c','Dial','SIP/200,64,trM(auto-blkvm)',14,0,'ANSWERED',3,'','1279638759.2413',''),('2010-07-20 10:12:39','\"2143584057\" <2143584057>','2143584057','200','from-did-direct','SIP/unlimitednet-0000052b','Local/FMPR-200@from-internal-5fb6;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',26,12,'ANSWERED',3,'','1279638759.2411',''),('2010-07-20 10:16:12','\"9034560562\" <9034560562>','9034560562','300','from-did-direct','SIP/unlimitednet-0000052e','SIP/300-0000052f','Dial','SIP/300,\"\",tr',210,200,'ANSWERED',3,'','1279638972.2422',''),('2010-07-20 10:47:58','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-00000530','SIP/unlimitednet-00000531','Dial','SIP/unlimitednet/4694771253,300,T',173,159,'ANSWERED',3,'','1279640878.2424',''),('2010-07-20 11:03:54','\"David Anderson\" <3607197197>','3607197197','9727124653','from-internal','SIP/300-00000532','SIP/unlimitednet-00000533','Dial','SIP/unlimitednet/9727124653,300,T',216,204,'ANSWERED',3,'','1279641834.2426',''),('2010-07-20 11:08:11','\"David Anderson\" <3607197197>','3607197197','4694771253','from-internal','SIP/300-00000534','SIP/unlimitednet-00000535','Dial','SIP/unlimitednet/4694771253,300,T',303,285,'ANSWERED',3,'','1279642091.2428',''),('2010-07-20 11:24:42','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000536','SIP/unlimitednet-00000537','Dial','SIP/unlimitednet/9893625004,300,T',224,195,'ANSWERED',3,'','1279643082.2430',''),('2010-07-20 11:30:29','\"9893625004\" <9893625004>','9893625004','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-c5ad;2','Local/RG-200-2146904814#@from-internal-583f;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',6,0,'NO ANSWER',3,'','1279643429.2436',''),('2010-07-20 11:30:33','\"9893625004\" <9893625004>','9893625004','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-583f;2','Local/2146904814@from-internal-470a;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1279643433.2439',''),('2010-07-20 11:30:33','9893625004','9893625004','2146904814','from-internal','Local/2146904814@from-internal-470a;2','SIP/unlimitednet-0000053a','Dial','SIP/unlimitednet/2146904814,300,T',3,0,'NO ANSWER',3,'','1279643433.2441',''),('2010-07-20 11:30:29','\"9893625004\" <9893625004>','9893625004','FMPR-200','from-internal','Local/FMPR-200@from-internal-8c8b;2','SIP/200-00000539','Dial','SIP/200,64,trM(auto-blkvm)',7,1,'ANSWERED',3,'','1279643429.2434',''),('2010-07-20 11:30:28','\"9893625004\" <9893625004>','9893625004','200','from-did-direct','SIP/unlimitednet-00000538','Local/FMPR-200@from-internal-8c8b;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',37,30,'ANSWERED',3,'','1279643428.2432',''),('2010-07-20 11:32:14','\"Kris Anderson\" <2146130162>','2146130162','2142571406','from-internal','SIP/200-0000053b','SIP/unlimitednet-0000053c','Dial','SIP/unlimitednet/2142571406,300,T',39,27,'ANSWERED',3,'','1279643534.2443',''),('2010-07-20 14:57:20','\"Unknown\" <Unknown>','Unknown','RG-200-2146904814#','from-internal','Local/RG-200-2146904814#@from-internal-b7c5;2','Local/2146904814@from-internal-2851;1','Dial','Local/2146904814@from-internal/n,60,M(confirm^^^200)tr',2,0,'NO ANSWER',3,'','1279655840.2452',''),('2010-07-20 14:57:20','Unknown','','2146904814','from-internal','Local/2146904814@from-internal-2851;2','SIP/unlimitednet-0000053f','Dial','SIP/unlimitednet/2146904814,300,T',2,0,'NO ANSWER',3,'','1279655840.2454',''),('2010-07-20 14:57:16','\"Unknown\" <Unknown>','Unknown','FMGL-2146904814#','from-internal','Local/FMGL-2146904814#@from-internal-89ee;2','Local/RG-200-2146904814#@from-internal-b7c5;1','Dial','Local/RG-200-2146904814#@from-internal,60,tr',6,0,'NO ANSWER',3,'','1279655836.2449',''),('2010-07-20 14:57:16','\"Unknown\" <Unknown>','Unknown','FMPR-200','from-internal','Local/FMPR-200@from-internal-c5ec;2','SIP/200-0000053e','Dial','SIP/200,64,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1279655836.2447',''),('2010-07-20 14:57:16','\"Unknown\" <Unknown>','Unknown','200','from-did-direct','SIP/unlimitednet-0000053d','Local/FMPR-200@from-internal-c5ec;1','Dial','Local/FMPR-200@from-internal&Local/FMGL-2146904814#@from-internal,64,trM(auto-b',229,223,'ANSWERED',3,'','1279655836.2445',''),('2010-07-21 11:29:10','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000540','SIP/unlimitednet-00000541','Dial','SIP/unlimitednet/2144845422,300,T',37,4,'ANSWERED',3,'','1279729750.2456',''),('2010-07-21 13:43:15','Restricted','','4696846582','from-internal','Local/4696846582@from-internal-474d;2','SIP/unlimitednet-00000546','Dial','SIP/unlimitednet/4696846582,300,T',2,0,'NO ANSWER',3,'','1279737795.2467',''),('2010-07-21 13:43:12','\"Restricted\" <Restricted>','Restricted','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-436d;2','Local/4696846582@from-internal-474d;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',5,0,'NO ANSWER',3,'','1279737792.2464',''),('2010-07-21 13:43:12','\"Restricted\" <Restricted>','Restricted','FMPR-201','from-internal','Local/FMPR-201@from-internal-c59e;2','SIP/201-00000545','Dial','SIP/201,63,trM(auto-blkvm)',5,0,'ANSWERED',3,'','1279737792.2462',''),('2010-07-21 13:41:56','\"9034560562\" <9034560562>','9034560562','300','from-did-direct','SIP/unlimitednet-00000542','SIP/300-00000543','Dial','SIP/300,\"\",tr',137,127,'ANSWERED',3,'','1279737716.2458',''),('2010-07-21 13:43:12','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-00000544','Local/FMPR-201@from-internal-c59e;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',1415,1410,'ANSWERED',3,'','1279737792.2460',''),('2010-07-21 14:31:46','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000547','SIP/unlimitednet-00000548','Dial','SIP/unlimitednet/2144845422,300,T',1183,1166,'ANSWERED',3,'','1279740706.2469',''),('2010-07-21 15:10:01','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-ab8d;2','SIP/unlimitednet-0000054c','Dial','SIP/unlimitednet/4696846582,300,T',2,0,'NO ANSWER',3,'','1279743001.2479',''),('2010-07-21 15:09:58','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-3eb5;2','Local/4696846582@from-internal-ab8d;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',5,0,'NO ANSWER',3,'','1279742998.2476',''),('2010-07-21 15:09:58','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-a306;2','SIP/201-0000054b','Dial','SIP/201,63,trM(auto-blkvm)',5,0,'ANSWERED',3,'','1279742998.2474',''),('2010-07-21 15:09:58','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-0000054a','Local/FMPR-201@from-internal-a306;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',3240,3235,'ANSWERED',3,'','1279742998.2472',''),('2010-07-21 16:20:36','\"anonymous\" <anonymous>','anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-eebd;2','Local/4696846582@from-internal-29dc;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',6,0,'NO ANSWER',3,'','1279747236.2485',''),('2010-07-21 16:20:39','anonymous','','4696846582','from-internal','Local/4696846582@from-internal-29dc;2','SIP/unlimitednet-0000054f','Dial','SIP/unlimitednet/4696846582,300,T',3,0,'NO ANSWER',3,'','1279747239.2488',''),('2010-07-21 16:20:36','\"anonymous\" <anonymous>','anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-e763;2','SIP/201-0000054e','Dial','SIP/201,63,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1279747236.2483',''),('2010-07-21 16:20:36','\"anonymous\" <anonymous>','anonymous','201','from-did-direct','SIP/unlimitednet-0000054d','Local/FMPR-201@from-internal-e763;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',1084,1078,'ANSWERED',3,'','1279747236.2481',''),('2010-07-21 16:38:29','\"9728000094\" <9728000094>','9728000094','300','from-did-direct','SIP/unlimitednet-00000550','SIP/300-00000551','Dial','SIP/300,\"\",tr',844,835,'ANSWERED',3,'','1279748309.2490',''),('2010-07-21 17:14:13','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000552','SIP/unlimitednet-00000553','Dial','SIP/unlimitednet/2144845422,300,T',418,402,'ANSWERED',3,'','1279750453.2492',''),('2010-07-21 18:09:48','anonymous','','4696846582','from-internal','Local/4696846582@from-internal-8ef4;2','SIP/unlimitednet-00000556','Dial','SIP/unlimitednet/4696846582,300,T',30,0,'NO ANSWER',3,'','1279753788.2501',''),('2010-07-21 18:09:45','\"anonymous\" <anonymous>','anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-2e16;2','Local/4696846582@from-internal-8ef4;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',33,0,'NO ANSWER',3,'','1279753785.2498',''),('2010-07-21 18:09:45','\"anonymous\" <anonymous>','anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-783e;2','SIP/201-00000555','Dial','SIP/201,63,trM(auto-blkvm)',33,0,'ANSWERED',3,'','1279753785.2496',''),('2010-07-21 18:09:44','\"anonymous\" <anonymous>','anonymous','201','from-did-direct','SIP/unlimitednet-00000554','Local/FMPR-201@from-internal-783e;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',2415,2381,'ANSWERED',3,'','1279753784.2494',''),('2010-07-21 18:50:07','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-00000557','SIP/unlimitednet-00000558','Dial','SIP/unlimitednet/9893625004,300,T',1011,993,'ANSWERED',3,'','1279756207.2503',''),('2010-07-21 19:07:03','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000559','SIP/unlimitednet-0000055a','Dial','SIP/unlimitednet/2144845422,300,T',24,12,'ANSWERED',3,'','1279757223.2505',''),('2010-07-21 19:34:57','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-0000055b','SIP/unlimitednet-0000055c','Dial','SIP/unlimitednet/9893625004,300,T',383,367,'ANSWERED',3,'','1279758897.2507',''),('2010-07-21 23:32:28','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-6c7d;2','Local/4696846582@from-internal-2236;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',19,0,'NO ANSWER',3,'','1279773148.2513',''),('2010-07-21 23:32:31','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-2236;2','SIP/unlimitednet-0000055f','Dial','SIP/unlimitednet/4696846582,300,T',16,0,'NO ANSWER',3,'','1279773151.2516',''),('2010-07-21 23:32:28','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-0c7e;2','SIP/201-0000055e','Dial','SIP/201,63,trM(auto-blkvm)',19,0,'ANSWERED',3,'','1279773148.2511',''),('2010-07-21 23:32:28','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-0000055d','Local/FMPR-201@from-internal-0c7e;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',20,1,'ANSWERED',3,'','1279773148.2509',''),('2010-07-21 23:33:03','\"Sam Sprain\" <3607196747>','3607196747','2144845422','from-internal','SIP/201-00000560','SIP/unlimitednet-00000561','Dial','SIP/unlimitednet/2144845422,300,T',6783,6771,'ANSWERED',3,'','1279773183.2518',''),('2010-07-22 08:44:59','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-b3c0;2','SIP/unlimitednet-00000564','Dial','SIP/unlimitednet/4696846582,300,T',21,0,'NO ANSWER',3,'','1279806299.2527',''),('2010-07-22 08:44:56','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-3443;2','Local/4696846582@from-internal-b3c0;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',24,0,'NO ANSWER',3,'','1279806296.2524',''),('2010-07-22 08:44:56','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-5c1d;2','SIP/201-00000563','Dial','SIP/201,63,trM(auto-blkvm)',24,0,'ANSWERED',3,'','1279806296.2522',''),('2010-07-22 08:44:55','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-00000562','Local/FMPR-201@from-internal-5c1d;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',82,57,'ANSWERED',3,'','1279806295.2520',''),('2010-07-22 11:44:20','Restricted','','4696846582','from-internal','Local/4696846582@from-internal-cab5;2','SIP/unlimitednet-00000567','Dial','SIP/unlimitednet/4696846582,300,T',8,0,'NO ANSWER',3,'','1279817060.2536',''),('2010-07-22 11:44:17','\"Restricted\" <Restricted>','Restricted','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-47cb;2','Local/4696846582@from-internal-cab5;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',11,0,'NO ANSWER',3,'','1279817057.2533',''),('2010-07-22 11:44:17','\"Restricted\" <Restricted>','Restricted','FMPR-201','from-internal','Local/FMPR-201@from-internal-e834;2','SIP/201-00000566','Dial','SIP/201,63,trM(auto-blkvm)',11,0,'ANSWERED',3,'','1279817057.2531',''),('2010-07-22 11:44:17','\"Restricted\" <Restricted>','Restricted','201','from-did-direct','SIP/unlimitednet-00000565','Local/FMPR-201@from-internal-e834;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',1023,1012,'ANSWERED',3,'','1279817057.2529',''),('2010-07-22 12:06:30','anonymous','','4696846582','from-internal','Local/4696846582@from-internal-85ac;2','SIP/unlimitednet-0000056c','Dial','SIP/unlimitednet/4696846582,300,T',10,0,'NO ANSWER',3,'','1279818390.2547',''),('2010-07-22 12:06:27','\"anonymous\" <anonymous>','anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-31a4;2','Local/4696846582@from-internal-85ac;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',13,0,'NO ANSWER',3,'','1279818387.2544',''),('2010-07-22 12:06:27','\"anonymous\" <anonymous>','anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-f006;2','SIP/201-0000056b','Dial','SIP/201,63,trM(auto-blkvm)',13,1,'ANSWERED',3,'','1279818387.2542',''),('2010-07-22 12:01:52','\"Sam Sprain\" <3607196747>','3607196747','9893625004','from-internal','SIP/201-00000568','SIP/unlimitednet-00000569','Dial','SIP/unlimitednet/9893625004,300,T',291,272,'ANSWERED',3,'','1279818112.2538',''),('2010-07-22 12:06:27','\"anonymous\" <anonymous>','anonymous','201','from-did-direct','SIP/unlimitednet-0000056a','Local/FMPR-201@from-internal-f006;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',1968,1955,'ANSWERED',3,'','1279818387.2540',''),('2010-07-22 13:07:54','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-7c6b;2','Local/4696846582@from-internal-32b7;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',6,0,'NO ANSWER',3,'','1279822074.2553',''),('2010-07-22 13:07:57','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-32b7;2','SIP/unlimitednet-0000056f','Dial','SIP/unlimitednet/4696846582,300,T',3,0,'NO ANSWER',3,'','1279822077.2556',''),('2010-07-22 13:07:54','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-51ee;2','SIP/201-0000056e','Dial','SIP/201,63,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1279822074.2551',''),('2010-07-22 13:07:54','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-0000056d','Local/FMPR-201@from-internal-51ee;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',185,179,'ANSWERED',3,'','1279822074.2549',''),('2010-07-22 13:13:31','\"Sam Sprain\" <3607196747>','3607196747','12142571406','from-internal','SIP/201-00000570','SIP/unlimitednet-00000571','Dial','SIP/unlimitednet/2142571406,300,T',118,107,'ANSWERED',3,'','1279822411.2558',''),('2010-07-22 13:16:33','\"Sam Sprain\" <3607196747>','3607196747','2142571406','from-internal','SIP/201-00000572','SIP/unlimitednet-00000573','Dial','SIP/unlimitednet/2142571406,300,T',216,206,'ANSWERED',3,'','1279822593.2560',''),('2010-07-22 14:44:25','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-ece0;2','SIP/unlimitednet-00000576','Dial','SIP/unlimitednet/4696846582,300,T',3,0,'NO ANSWER',3,'','1279827865.2569',''),('2010-07-22 14:44:21','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-08bb;2','Local/4696846582@from-internal-ece0;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',7,0,'NO ANSWER',3,'','1279827861.2566',''),('2010-07-22 14:44:21','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-1237;2','SIP/201-00000575','Dial','SIP/201,63,trM(auto-blkvm)',7,0,'ANSWERED',3,'','1279827861.2564',''),('2010-07-22 14:44:21','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-00000574','Local/FMPR-201@from-internal-1237;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',720,713,'ANSWERED',3,'','1279827861.2562',''),('2010-07-22 15:00:55','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-277b;2','SIP/unlimitednet-00000579','Dial','SIP/unlimitednet/4696846582,300,T',0,0,'NO ANSWER',3,'','1279828855.2578',''),('2010-07-22 15:00:52','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-845a;2','Local/4696846582@from-internal-277b;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',3,0,'NO ANSWER',3,'','1279828852.2575',''),('2010-07-22 15:00:52','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-fd33;2','SIP/201-00000578','Dial','SIP/201,63,trM(auto-blkvm)',3,0,'ANSWERED',3,'','1279828852.2573',''),('2010-07-22 15:00:51','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-00000577','Local/FMPR-201@from-internal-fd33;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',820,816,'ANSWERED',3,'','1279828851.2571',''),('2010-07-22 15:25:14','anonymous','','4696846582','from-internal','Local/4696846582@from-internal-df36;2','SIP/unlimitednet-0000057c','Dial','SIP/unlimitednet/4696846582,300,T',3,0,'NO ANSWER',3,'','1279830314.2587',''),('2010-07-22 15:25:11','\"anonymous\" <anonymous>','anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-9354;2','Local/4696846582@from-internal-df36;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',6,0,'NO ANSWER',3,'','1279830311.2584',''),('2010-07-22 15:25:11','\"anonymous\" <anonymous>','anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-b136;2','SIP/201-0000057b','Dial','SIP/201,63,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1279830311.2582',''),('2010-07-22 15:25:11','\"anonymous\" <anonymous>','anonymous','201','from-did-direct','SIP/unlimitednet-0000057a','Local/FMPR-201@from-internal-b136;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',75,69,'ANSWERED',3,'','1279830311.2580',''),('2010-07-22 15:26:48','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-0000057d','SIP/unlimitednet-0000057e','Dial','SIP/unlimitednet/2144845422,300,T',5972,5960,'ANSWERED',3,'','1279830408.2589',''),('2010-07-22 16:58:50','\"David Anderson\" <3607197197>','3607197197','3232631934','from-internal','SIP/300-0000057f','SIP/unlimitednet-00000580','Dial','SIP/unlimitednet/3232631934,300,T',4718,4706,'ANSWERED',3,'','1279835930.2591',''),('2010-07-22 20:20:35','\"Kris Anderson\" <2146130162>','2146130162','9893625004','from-internal','SIP/200-00000582','SIP/unlimitednet-00000583','Dial','SIP/unlimitednet/9893625004,300,T',2018,1998,'ANSWERED',3,'','1279848035.2594',''),('2010-07-22 21:16:53','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-dfc5;2','Local/4696846582@from-internal-81e6;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',13,0,'NO ANSWER',3,'','1279851413.2600',''),('2010-07-22 21:16:56','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-81e6;2','SIP/unlimitednet-00000586','Dial','SIP/unlimitednet/4696846582,300,T',10,0,'NO ANSWER',3,'','1279851416.2603',''),('2010-07-22 21:16:53','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-da93;2','SIP/201-00000585','Dial','SIP/201,63,trM(auto-blkvm)',13,0,'ANSWERED',3,'','1279851413.2598',''),('2010-07-22 21:16:53','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-00000584','Local/FMPR-201@from-internal-da93;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',226,213,'ANSWERED',3,'','1279851413.2596',''),('2010-07-22 21:40:00','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-34c7;2','SIP/201-00000588','Dial','SIP/201,63,trM(auto-blkvm)',17,0,'NO ANSWER',3,'','1279852800.2607',''),('2010-07-22 21:40:00','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-f937;2','Local/4696846582@from-internal-23e7;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',17,0,'ANSWERED',3,'','1279852800.2609',''),('2010-07-22 21:40:03','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-23e7;2','SIP/unlimitednet-00000589','Dial','SIP/unlimitednet/4696846582,300,T',2125,2111,'ANSWERED',3,'','1279852803.2612',''),('2010-07-22 21:40:00','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-00000587','Local/FMGL-4696846582#@from-internal-f937;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',2128,2111,'ANSWERED',3,'','1279852800.2605',''),('2010-07-22 22:15:40','\"Kris Anderson\" <2146130162>','2146130162','2144845422','from-internal','SIP/200-0000058a','SIP/unlimitednet-0000058b','Dial','SIP/unlimitednet/2144845422,300,T',3253,3246,'ANSWERED',3,'','1279854940.2614',''),('2010-07-23 11:35:44','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-b5f3;2','Local/4696846582@from-internal-fb55;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',7,0,'NO ANSWER',3,'','1279902944.2620',''),('2010-07-23 11:35:47','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-fb55;2','SIP/unlimitednet-0000058e','Dial','SIP/unlimitednet/4696846582,300,T',4,0,'NO ANSWER',3,'','1279902947.2623',''),('2010-07-23 11:35:44','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-d460;2','SIP/201-0000058d','Dial','SIP/201,63,trM(auto-blkvm)',7,0,'ANSWERED',3,'','1279902944.2618',''),('2010-07-23 11:35:43','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-0000058c','Local/FMPR-201@from-internal-d460;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',211,203,'ANSWERED',3,'','1279902943.2616',''),('2010-07-23 11:57:41','Anonymous','','4696846582','from-internal','Local/4696846582@from-internal-d371;2','SIP/unlimitednet-00000591','Dial','SIP/unlimitednet/4696846582,300,T',3,0,'NO ANSWER',3,'','1279904261.2632',''),('2010-07-23 11:57:38','\"Anonymous\" <Anonymous>','Anonymous','FMGL-4696846582#','from-internal','Local/FMGL-4696846582#@from-internal-4eeb;2','Local/4696846582@from-internal-d371;1','Dial','Local/4696846582@from-internal/n,60,trM(auto-blkvm)',6,0,'NO ANSWER',3,'','1279904258.2629',''),('2010-07-23 11:57:38','\"Anonymous\" <Anonymous>','Anonymous','FMPR-201','from-internal','Local/FMPR-201@from-internal-94d4;2','SIP/201-00000590','Dial','SIP/201,63,trM(auto-blkvm)',6,0,'ANSWERED',3,'','1279904258.2627',''),('2010-07-23 11:57:37','\"Anonymous\" <Anonymous>','Anonymous','201','from-did-direct','SIP/unlimitednet-0000058f','Local/FMPR-201@from-internal-94d4;1','Dial','Local/FMPR-201@from-internal&Local/FMGL-4696846582#@from-internal,63,trM(auto-b',2003,1996,'ANSWERED',3,'','1279904257.2625','');
/*!40000 ALTER TABLE `cdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `asteriskrealtime`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `asteriskrealtime` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `asteriskrealtime`;

--
-- Table structure for table `extensions`
--

DROP TABLE IF EXISTS `extensions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `extensions` (
  `id` int(11) NOT NULL auto_increment,
  `context` varchar(20) NOT NULL default '',
  `exten` varchar(20) NOT NULL default '',
  `priority` tinyint(4) NOT NULL default '0',
  `app` varchar(20) NOT NULL default '',
  `appdata` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`context`,`exten`,`priority`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `extensions`
--

LOCK TABLES `extensions` WRITE;
/*!40000 ALTER TABLE `extensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iax_buddies`
--

DROP TABLE IF EXISTS `iax_buddies`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `iax_buddies` (
  `name` varchar(30) NOT NULL default '',
  `username` varchar(30) default NULL,
  `type` varchar(6) NOT NULL default '',
  `secret` varchar(50) default NULL,
  `md5secret` varchar(32) default NULL,
  `dbsecret` varchar(100) default NULL,
  `notransfer` varchar(10) default NULL,
  `inkeys` varchar(100) default NULL,
  `auth` varchar(100) default NULL,
  `accountcode` varchar(100) default NULL,
  `amaflags` varchar(100) default NULL,
  `callerid` varchar(100) default NULL,
  `context` varchar(100) default NULL,
  `defaultip` varchar(15) default NULL,
  `host` varchar(31) NOT NULL default 'dynamic',
  `language` varchar(5) default NULL,
  `mailbox` varchar(50) default NULL,
  `deny` varchar(95) default NULL,
  `permit` varchar(95) default NULL,
  `qualify` varchar(4) default NULL,
  `disallow` varchar(100) default NULL,
  `allow` varchar(100) default NULL,
  `ipaddr` varchar(15) default NULL,
  `port` int(11) default '0',
  `regseconds` int(11) default '0',
  PRIMARY KEY  (`name`),
  UNIQUE KEY `iax_buddies_username_idx` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `iax_buddies`
--

LOCK TABLES `iax_buddies` WRITE;
/*!40000 ALTER TABLE `iax_buddies` DISABLE KEYS */;
/*!40000 ALTER TABLE `iax_buddies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_member_table`
--

DROP TABLE IF EXISTS `queue_member_table`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `queue_member_table` (
  `queue_name` varchar(128) NOT NULL default '',
  `interface` varchar(128) NOT NULL default '',
  `penalty` int(11) default NULL,
  PRIMARY KEY  (`queue_name`,`interface`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `queue_member_table`
--

LOCK TABLES `queue_member_table` WRITE;
/*!40000 ALTER TABLE `queue_member_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_member_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_table`
--

DROP TABLE IF EXISTS `queue_table`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `queue_table` (
  `name` varchar(128) NOT NULL default '',
  `musiconhold` varchar(128) default NULL,
  `announce` varchar(128) default NULL,
  `context` varchar(128) default NULL,
  `timeout` int(11) default NULL,
  `monitor_join` tinyint(1) default NULL,
  `monitor_format` varchar(128) default NULL,
  `queue_youarenext` varchar(128) default NULL,
  `queue_thereare` varchar(128) default NULL,
  `queue_callswaiting` varchar(128) default NULL,
  `queue_holdtime` varchar(128) default NULL,
  `queue_minutes` varchar(128) default NULL,
  `queue_seconds` varchar(128) default NULL,
  `queue_lessthan` varchar(128) default NULL,
  `queue_thankyou` varchar(128) default NULL,
  `queue_reporthold` varchar(128) default NULL,
  `announce_frequency` int(11) default NULL,
  `announce_round_seconds` int(11) default NULL,
  `announce_holdtime` varchar(128) default NULL,
  `retry` int(11) default NULL,
  `wrapuptime` int(11) default NULL,
  `maxlen` int(11) default NULL,
  `servicelevel` int(11) default NULL,
  `strategy` varchar(128) default NULL,
  `joinempty` varchar(128) default NULL,
  `leavewhenempty` varchar(128) default NULL,
  `eventmemberstatus` tinyint(1) default NULL,
  `eventwhencalled` tinyint(1) default NULL,
  `reportholdtime` tinyint(1) default NULL,
  `memberdelay` int(11) default NULL,
  `weight` int(11) default NULL,
  `timeoutrestart` tinyint(1) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `queue_table`
--

LOCK TABLES `queue_table` WRITE;
/*!40000 ALTER TABLE `queue_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sip_buddies`
--

DROP TABLE IF EXISTS `sip_buddies`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sip_buddies` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL default '',
  `accountcode` varchar(20) default NULL,
  `amaflags` varchar(7) default NULL,
  `callgroup` varchar(10) default NULL,
  `callerid` varchar(80) default NULL,
  `canreinvite` char(3) default 'yes',
  `context` varchar(80) default NULL,
  `defaultip` varchar(15) default NULL,
  `dtmfmode` varchar(7) default NULL,
  `fromuser` varchar(80) default NULL,
  `fromdomain` varchar(80) default NULL,
  `fullcontact` varchar(80) default NULL,
  `host` varchar(31) NOT NULL default '',
  `insecure` varchar(4) default NULL,
  `language` char(2) default NULL,
  `mailbox` varchar(50) default NULL,
  `md5secret` varchar(80) default NULL,
  `nat` varchar(5) NOT NULL default 'no',
  `deny` varchar(95) default NULL,
  `permit` varchar(95) default NULL,
  `mask` varchar(95) default NULL,
  `pickupgroup` varchar(10) default NULL,
  `port` varchar(5) NOT NULL default '',
  `qualify` char(3) default NULL,
  `restrictcid` char(1) default NULL,
  `rtptimeout` char(3) default NULL,
  `rtpholdtimeout` char(3) default NULL,
  `secret` varchar(80) default NULL,
  `type` varchar(6) NOT NULL default 'friend',
  `username` varchar(80) NOT NULL default '',
  `disallow` varchar(100) default 'all',
  `allow` varchar(100) default 'g729;ilbc;gsm;ulaw;alaw',
  `musiconhold` varchar(100) default NULL,
  `regseconds` int(11) NOT NULL default '0',
  `ipaddr` varchar(15) NOT NULL default '',
  `regexten` varchar(80) NOT NULL default '',
  `cancallforward` char(3) default 'yes',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `name_2` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sip_buddies`
--

LOCK TABLES `sip_buddies` WRITE;
/*!40000 ALTER TABLE `sip_buddies` DISABLE KEYS */;
/*!40000 ALTER TABLE `sip_buddies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voicemail_users`
--

DROP TABLE IF EXISTS `voicemail_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `voicemail_users` (
  `uniqueid` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL default '0',
  `context` varchar(50) NOT NULL default '',
  `mailbox` int(5) NOT NULL default '0',
  `password` varchar(4) NOT NULL default '0',
  `fullname` varchar(50) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `pager` varchar(50) NOT NULL default '',
  `stamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `attach` char(3) NOT NULL default 'no',
  `saycid` char(3) NOT NULL default 'yes',
  `hidefromdir` char(3) NOT NULL default 'no',
  PRIMARY KEY  (`mailbox`),
  KEY `mailbox_context` (`mailbox`,`context`),
  KEY `id` (`uniqueid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `voicemail_users`
--

LOCK TABLES `voicemail_users` WRITE;
/*!40000 ALTER TABLE `voicemail_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `voicemail_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `cron`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cron` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cron`;

--
-- Table structure for table `daily_deal`
--

DROP TABLE IF EXISTS `daily_deal`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `daily_deal` (
  `id` int(10) NOT NULL auto_increment,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `site` varchar(50) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` varchar(10) NOT NULL,
  `detail` varchar(5000) NOT NULL,
  `image` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `daily_deal`
--

LOCK TABLES `daily_deal` WRITE;
/*!40000 ALTER TABLE `daily_deal` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `email` (
  `id` int(10) NOT NULL auto_increment,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `recipient` varchar(500) NOT NULL,
  `contents` varchar(5000) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Logs all emails sent by cron script';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `log` (
  `id` int(10) NOT NULL auto_increment,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `cron_run` int(1) NOT NULL,
  `backup_mysql` int(1) NOT NULL,
  `backup_wp` int(1) NOT NULL,
  `backup_sites` int(1) NOT NULL,
  `daily_deal` int(1) NOT NULL,
  `email_id` int(10) NOT NULL,
  `errors` varchar(5000) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Log of all actions taken by the cron script';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `endpoints`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `endpoints` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `endpoints`;

--
-- Table structure for table `Aastra`
--

DROP TABLE IF EXISTS `Aastra`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Aastra` (
  `freepbx_device` varchar(255) NOT NULL default 'none',
  `mac_address` varchar(255) NOT NULL default '',
  `phone_type` varchar(255) NOT NULL default '',
  `phone_label` varchar(255) NOT NULL default '',
  `sip_line1_screen_name` varchar(255) NOT NULL default '',
  `sip_line1_user_name` varchar(255) NOT NULL default '',
  `sip_line1_display_name` varchar(255) NOT NULL default '',
  `sip_line1_vmail` varchar(255) NOT NULL default '',
  `sip_line1_auth_name` varchar(255) NOT NULL default '',
  `sip_line1_password` varchar(255) NOT NULL default '',
  `sip_line1_mode` varchar(255) NOT NULL default '',
  `softkey1_type` varchar(255) NOT NULL default '',
  `softkey1_label` varchar(255) NOT NULL default '',
  `softkey1_value` varchar(255) NOT NULL default '',
  `softkey2_type` varchar(255) NOT NULL default '',
  `softkey2_label` varchar(255) NOT NULL default '',
  `softkey2_value` varchar(255) NOT NULL default '',
  `softkey3_type` varchar(255) NOT NULL default '',
  `softkey3_label` varchar(255) NOT NULL default '',
  `softkey3_value` varchar(255) NOT NULL default '',
  `softkey4_type` varchar(255) NOT NULL default '',
  `softkey4_label` varchar(255) NOT NULL default '',
  `softkey4_value` varchar(255) NOT NULL default '',
  `softkey5_type` varchar(255) NOT NULL default '',
  `softkey5_label` varchar(255) NOT NULL default '',
  `softkey5_value` varchar(255) NOT NULL default '',
  `softkey6_type` varchar(255) NOT NULL default '',
  `softkey6_label` varchar(255) NOT NULL default '',
  `softkey6_value` varchar(255) NOT NULL default '',
  `softkey7_type` varchar(255) NOT NULL default '',
  `softkey7_label` varchar(255) NOT NULL default '',
  `softkey7_value` varchar(255) NOT NULL default '',
  `softkey8_type` varchar(255) NOT NULL default '',
  `softkey8_label` varchar(255) NOT NULL default '',
  `softkey8_value` varchar(255) NOT NULL default '',
  `softkey9_type` varchar(255) NOT NULL default '',
  `softkey9_label` varchar(255) NOT NULL default '',
  `softkey9_value` varchar(255) NOT NULL default '',
  `softkey10_type` varchar(255) NOT NULL default '',
  `softkey10_label` varchar(255) NOT NULL default '',
  `softkey10_value` varchar(255) NOT NULL default '',
  `softkey11_type` varchar(255) NOT NULL default '',
  `softkey11_label` varchar(255) NOT NULL default '',
  `softkey11_value` varchar(255) NOT NULL default '',
  `softkey12_type` varchar(255) NOT NULL default '',
  `softkey12_label` varchar(255) NOT NULL default '',
  `softkey12_value` varchar(255) NOT NULL default '',
  `softkey13_type` varchar(255) NOT NULL default '',
  `softkey13_label` varchar(255) NOT NULL default '',
  `softkey13_value` varchar(255) NOT NULL default '',
  `softkey14_type` varchar(255) NOT NULL default '',
  `softkey14_label` varchar(255) NOT NULL default '',
  `softkey14_value` varchar(255) NOT NULL default '',
  `softkey15_type` varchar(255) NOT NULL default '',
  `softkey15_label` varchar(255) NOT NULL default '',
  `softkey15_value` varchar(255) NOT NULL default '',
  `softkey16_type` varchar(255) NOT NULL default '',
  `softkey16_label` varchar(255) NOT NULL default '',
  `softkey16_value` varchar(255) NOT NULL default '',
  `softkey17_type` varchar(255) NOT NULL default '',
  `softkey17_label` varchar(255) NOT NULL default '',
  `softkey17_value` varchar(255) NOT NULL default '',
  `softkey18_type` varchar(255) NOT NULL default '',
  `softkey18_label` varchar(255) NOT NULL default '',
  `softkey18_value` varchar(255) NOT NULL default '',
  `softkey19_type` varchar(255) NOT NULL default '',
  `softkey19_label` varchar(255) NOT NULL default '',
  `softkey19_value` varchar(255) NOT NULL default '',
  `softkey20_type` varchar(255) NOT NULL default '',
  `softkey20_label` varchar(255) NOT NULL default '',
  `softkey20_value` varchar(255) NOT NULL default '',
  `EditDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `Comment` text NOT NULL,
  PRIMARY KEY  (`mac_address`),
  KEY `freepbx_device` (`freepbx_device`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Aastra`
--

LOCK TABLES `Aastra` WRITE;
/*!40000 ALTER TABLE `Aastra` DISABLE KEYS */;
/*!40000 ALTER TABLE `Aastra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cisco`
--

DROP TABLE IF EXISTS `Cisco`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Cisco` (
  `freepbx_device` varchar(255) NOT NULL default 'none',
  `mac_address` varchar(255) NOT NULL default '',
  `phone_type` varchar(255) NOT NULL default '7960',
  `line1_name` varchar(255) NOT NULL default '',
  `line1_shortname` varchar(255) NOT NULL default '',
  `line1_displayname` varchar(255) NOT NULL default '',
  `line1_authname` varchar(255) NOT NULL default '',
  `line1_password` varchar(255) NOT NULL default '',
  `proxy1_address` varchar(255) NOT NULL default '',
  `proxy1_port` varchar(255) NOT NULL default '',
  `line2_name` varchar(255) NOT NULL default '',
  `line2_shortname` varchar(255) NOT NULL default '',
  `line2_displayname` varchar(255) NOT NULL default '',
  `line2_authname` varchar(255) NOT NULL default '',
  `line2_password` varchar(255) NOT NULL default '',
  `proxy2_address` varchar(255) NOT NULL default '',
  `proxy2_port` varchar(255) NOT NULL default '',
  `line3_name` varchar(255) NOT NULL default '',
  `line3_shortname` varchar(255) NOT NULL default '',
  `line3_displayname` varchar(255) NOT NULL default '',
  `line3_authname` varchar(255) NOT NULL default '',
  `line3_password` varchar(255) NOT NULL default '',
  `proxy3_address` varchar(255) NOT NULL default '',
  `proxy3_port` varchar(255) NOT NULL default '',
  `line4_name` varchar(255) NOT NULL default '',
  `line4_shortname` varchar(255) NOT NULL default '',
  `line4_displayname` varchar(255) NOT NULL default '',
  `line4_authname` varchar(255) NOT NULL default '',
  `line4_password` varchar(255) NOT NULL default '',
  `proxy4_address` varchar(255) NOT NULL default '',
  `proxy4_port` varchar(255) NOT NULL default '',
  `line5_name` varchar(255) NOT NULL default '',
  `line5_shortname` varchar(255) NOT NULL default '',
  `line5_displayname` varchar(255) NOT NULL default '',
  `line5_authname` varchar(255) NOT NULL default '',
  `line5_password` varchar(255) NOT NULL default '',
  `proxy5_address` varchar(255) NOT NULL default '',
  `proxy5_port` varchar(255) NOT NULL default '',
  `line6_name` varchar(255) NOT NULL default '',
  `line6_shortname` varchar(255) NOT NULL default '',
  `line6_displayname` varchar(255) NOT NULL default '',
  `line6_authname` varchar(255) NOT NULL default '',
  `line6_password` varchar(255) NOT NULL default '',
  `proxy6_address` varchar(255) NOT NULL default '',
  `proxy6_port` varchar(255) NOT NULL default '',
  `proxy_emergency` varchar(255) NOT NULL default '',
  `proxy_emergency_port` varchar(255) NOT NULL default '',
  `proxy_backup` varchar(255) NOT NULL default '',
  `proxy_backup_port` varchar(255) NOT NULL default '',
  `outbound_proxy` varchar(255) NOT NULL default '',
  `outbound_proxy_port` varchar(255) NOT NULL default '',
  `nat_enable` varchar(255) NOT NULL default '',
  `nat_address` varchar(255) NOT NULL default '',
  `voip_control_port` varchar(255) NOT NULL default '',
  `start_media_port` varchar(255) NOT NULL default '',
  `end_media_port` varchar(255) NOT NULL default '',
  `nat_received_processing` varchar(255) NOT NULL default '',
  `phone_label` varchar(255) NOT NULL default '',
  `time_zone` varchar(255) NOT NULL default '',
  `telnet_level` varchar(255) NOT NULL default '',
  `phone_prompt` varchar(255) NOT NULL default '',
  `phone_password` varchar(255) NOT NULL default '',
  `enable_vad` varchar(255) NOT NULL default '',
  `network_media_type` varchar(255) NOT NULL default '',
  `dial_template` varchar(255) NOT NULL default '',
  `services_url` varchar(255) NOT NULL default '',
  `directory_url` varchar(255) NOT NULL default '',
  `logo_url` varchar(255) NOT NULL default '',
  `EditDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `Comment` text NOT NULL,
  PRIMARY KEY  (`mac_address`),
  KEY `freepbx_device` (`freepbx_device`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Cisco`
--

LOCK TABLES `Cisco` WRITE;
/*!40000 ALTER TABLE `Cisco` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cisco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Generic`
--

DROP TABLE IF EXISTS `Generic`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Generic` (
  `freepbx_device` varchar(255) NOT NULL default 'none',
  `mac_address` varchar(255) NOT NULL default '',
  `phone_type` varchar(255) NOT NULL default '',
  `phone_label` varchar(255) NOT NULL default '',
  `EditDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `Comment` text NOT NULL,
  PRIMARY KEY  (`mac_address`),
  KEY `freepbx_device` (`freepbx_device`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Generic`
--

LOCK TABLES `Generic` WRITE;
/*!40000 ALTER TABLE `Generic` DISABLE KEYS */;
/*!40000 ALTER TABLE `Generic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grandstream`
--

DROP TABLE IF EXISTS `Grandstream`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Grandstream` (
  `freepbx_device` varchar(255) NOT NULL default 'none',
  `mac_address` varchar(255) NOT NULL default '',
  `phone_type` varchar(255) NOT NULL default '',
  `phone_label` varchar(255) NOT NULL default '',
  `line1_Account_Name` varchar(255) NOT NULL default '',
  `line1_sip_user` varchar(255) NOT NULL default '',
  `line1_password` varchar(255) NOT NULL default '',
  `line1_display_name` varchar(255) NOT NULL default '',
  `key1_mode` varchar(255) NOT NULL default '',
  `key1_name` varchar(255) NOT NULL default '',
  `key1_userid` varchar(255) NOT NULL default '',
  `key2_mode` varchar(255) NOT NULL default '',
  `key2_name` varchar(255) NOT NULL default '',
  `key2_userid` varchar(255) NOT NULL default '',
  `key3_mode` varchar(255) NOT NULL default '',
  `key3_name` varchar(255) NOT NULL default '',
  `key3_userid` varchar(255) NOT NULL default '',
  `key4_mode` varchar(255) NOT NULL default '',
  `key4_name` varchar(255) NOT NULL default '',
  `key4_userid` varchar(255) NOT NULL default '',
  `key5_mode` varchar(255) NOT NULL default '',
  `key5_name` varchar(255) NOT NULL default '',
  `key5_userid` varchar(255) NOT NULL default '',
  `key6_mode` varchar(255) NOT NULL default '',
  `key6_name` varchar(255) NOT NULL default '',
  `key6_userid` varchar(255) NOT NULL default '',
  `key7_mode` varchar(255) NOT NULL default '',
  `key7_name` varchar(255) NOT NULL default '',
  `key7_userid` varchar(255) NOT NULL default '',
  `EditDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `Comment` text NOT NULL,
  PRIMARY KEY  (`mac_address`),
  KEY `freepbx_device` (`freepbx_device`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Grandstream`
--

LOCK TABLES `Grandstream` WRITE;
/*!40000 ALTER TABLE `Grandstream` DISABLE KEYS */;
/*!40000 ALTER TABLE `Grandstream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Linksys`
--

DROP TABLE IF EXISTS `Linksys`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Linksys` (
  `freepbx_device` varchar(255) NOT NULL default 'none',
  `mac_address` varchar(255) NOT NULL default '',
  `phone_type` varchar(255) NOT NULL default '',
  `displayName` varchar(255) NOT NULL default '',
  `UserID` varchar(255) NOT NULL default '',
  `Password` varchar(255) NOT NULL default '',
  `SpeedDial2` varchar(255) NOT NULL default '',
  `SpeedDial3` varchar(255) NOT NULL default '',
  `SpeedDial4` varchar(255) NOT NULL default '',
  `SpeedDial5` varchar(255) NOT NULL default '',
  `SpeedDial6` varchar(255) NOT NULL default '',
  `SpeedDial7` varchar(255) NOT NULL default '',
  `SpeedDial8` varchar(255) NOT NULL default '',
  `SpeedDial9` varchar(255) NOT NULL default '',
  `EditDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `Comment` text NOT NULL,
  PRIMARY KEY  (`mac_address`),
  KEY `freepbx_device` (`freepbx_device`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Linksys`
--

LOCK TABLES `Linksys` WRITE;
/*!40000 ALTER TABLE `Linksys` DISABLE KEYS */;
/*!40000 ALTER TABLE `Linksys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Polycom`
--

DROP TABLE IF EXISTS `Polycom`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Polycom` (
  `freepbx_device` varchar(255) NOT NULL default 'none',
  `mac_address` varchar(255) NOT NULL default '',
  `phone_type` varchar(255) NOT NULL default '',
  `displayName` varchar(255) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `label` varchar(255) NOT NULL default '',
  `auth_userId` varchar(255) NOT NULL default '',
  `auth_password` varchar(255) NOT NULL default '',
  `EditDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `Comment` text NOT NULL,
  PRIMARY KEY  (`mac_address`),
  KEY `freepbx_device` (`freepbx_device`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Polycom`
--

LOCK TABLES `Polycom` WRITE;
/*!40000 ALTER TABLE `Polycom` DISABLE KEYS */;
/*!40000 ALTER TABLE `Polycom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Snom360`
--

DROP TABLE IF EXISTS `Snom360`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `Snom360` (
  `freepbx_device` varchar(255) NOT NULL default 'none',
  `mac_address` varchar(255) NOT NULL default '',
  `phone_type` varchar(255) NOT NULL default '',
  `user_realname1` varchar(255) NOT NULL default '',
  `user_name1` varchar(255) NOT NULL default '',
  `user_idle_text1` varchar(255) NOT NULL default '',
  `user_host1` varchar(255) NOT NULL default '',
  `user_pass1` varchar(255) NOT NULL default '',
  `user_pname1` varchar(255) NOT NULL default '',
  `user_mailbox1` varchar(255) NOT NULL default '',
  `user_ringer1` varchar(255) NOT NULL default '',
  `user_custom1` varchar(255) NOT NULL default '',
  `user_xml_screen_url1` varchar(255) NOT NULL default '',
  `record_missed_calls1` varchar(255) NOT NULL default '',
  `fkey0` varchar(255) NOT NULL default 'line',
  `fkey1` varchar(255) NOT NULL default 'line',
  `fkey2` varchar(255) NOT NULL default 'line',
  `fkey3` varchar(255) NOT NULL default 'line',
  `fkey4` varchar(255) NOT NULL default 'line',
  `fkey5` varchar(255) NOT NULL default 'line',
  `fkey6` varchar(255) NOT NULL default 'line',
  `fkey7` varchar(255) NOT NULL default 'line',
  `fkey8` varchar(255) NOT NULL default 'line',
  `fkey9` varchar(255) NOT NULL default 'line',
  `fkey10` varchar(255) NOT NULL default 'line',
  `fkey11` varchar(255) NOT NULL default 'line',
  `phone_label` varchar(255) NOT NULL default '',
  `EditDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `Comment` text NOT NULL,
  PRIMARY KEY  (`mac_address`),
  KEY `freepbx_device` (`freepbx_device`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `Snom360`
--

LOCK TABLES `Snom360` WRITE;
/*!40000 ALTER TABLE `Snom360` DISABLE KEYS */;
/*!40000 ALTER TABLE `Snom360` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `gazelle_enhanced`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `gazelle_enhanced` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `gazelle_enhanced`;

--
-- Table structure for table `api_applications`
--

DROP TABLE IF EXISTS `api_applications`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `api_applications` (
  `ID` int(10) NOT NULL auto_increment,
  `UserID` int(10) NOT NULL,
  `Token` char(32) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `api_applications`
--

LOCK TABLES `api_applications` WRITE;
/*!40000 ALTER TABLE `api_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_users`
--

DROP TABLE IF EXISTS `api_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `api_users` (
  `UserID` int(10) NOT NULL,
  `AppID` int(10) NOT NULL,
  `Token` char(32) NOT NULL,
  `State` enum('0','1','2') NOT NULL default '0',
  `Time` datetime NOT NULL,
  `Access` text,
  PRIMARY KEY  (`UserID`,`AppID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `api_users`
--

LOCK TABLES `api_users` WRITE;
/*!40000 ALTER TABLE `api_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_alias`
--

DROP TABLE IF EXISTS `artists_alias`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `artists_alias` (
  `AliasID` int(10) NOT NULL auto_increment,
  `ArtistID` int(10) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Redirect` int(10) NOT NULL default '0',
  `UserID` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`AliasID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `artists_alias`
--

LOCK TABLES `artists_alias` WRITE;
/*!40000 ALTER TABLE `artists_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_group`
--

DROP TABLE IF EXISTS `artists_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `artists_group` (
  `ArtistID` int(10) NOT NULL auto_increment,
  `Name` varchar(200) NOT NULL,
  `RevisionID` int(12) default NULL,
  PRIMARY KEY  (`ArtistID`),
  KEY `Name` (`Name`),
  KEY `RevisionID` (`RevisionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `artists_group`
--

LOCK TABLES `artists_group` WRITE;
/*!40000 ALTER TABLE `artists_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_similar`
--

DROP TABLE IF EXISTS `artists_similar`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `artists_similar` (
  `ArtistID` int(10) NOT NULL default '0',
  `SimilarID` int(12) NOT NULL default '0',
  PRIMARY KEY  (`ArtistID`,`SimilarID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `SimilarID` (`SimilarID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `artists_similar`
--

LOCK TABLES `artists_similar` WRITE;
/*!40000 ALTER TABLE `artists_similar` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_similar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_similar_scores`
--

DROP TABLE IF EXISTS `artists_similar_scores`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `artists_similar_scores` (
  `SimilarID` int(12) NOT NULL auto_increment,
  `Score` int(10) NOT NULL default '0',
  PRIMARY KEY  (`SimilarID`),
  KEY `Score` (`Score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `artists_similar_scores`
--

LOCK TABLES `artists_similar_scores` WRITE;
/*!40000 ALTER TABLE `artists_similar_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_similar_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_similar_votes`
--

DROP TABLE IF EXISTS `artists_similar_votes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `artists_similar_votes` (
  `SimilarID` int(12) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Way` enum('up','down') NOT NULL default 'up',
  PRIMARY KEY  (`SimilarID`,`UserID`,`Way`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `artists_similar_votes`
--

LOCK TABLES `artists_similar_votes` WRITE;
/*!40000 ALTER TABLE `artists_similar_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_similar_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists_tags`
--

DROP TABLE IF EXISTS `artists_tags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `artists_tags` (
  `TagID` int(10) NOT NULL default '0',
  `ArtistID` int(10) NOT NULL default '0',
  `PositiveVotes` int(6) NOT NULL default '1',
  `NegativeVotes` int(6) NOT NULL default '1',
  `UserID` int(10) default NULL,
  PRIMARY KEY  (`TagID`,`ArtistID`),
  KEY `TagID` (`TagID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `PositiveVotes` (`PositiveVotes`),
  KEY `NegativeVotes` (`NegativeVotes`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `artists_tags`
--

LOCK TABLES `artists_tags` WRITE;
/*!40000 ALTER TABLE `artists_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `artists_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `blog` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `UserID` int(10) unsigned NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Body` text NOT NULL,
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ThreadID` int(10) unsigned default NULL,
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks_torrents`
--

DROP TABLE IF EXISTS `bookmarks_torrents`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `bookmarks_torrents` (
  `UserID` int(10) NOT NULL,
  `GroupID` int(10) NOT NULL,
  `Time` datetime NOT NULL,
  KEY `UserID` (`UserID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `bookmarks_torrents`
--

LOCK TABLES `bookmarks_torrents` WRITE;
/*!40000 ALTER TABLE `bookmarks_torrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks_torrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collages`
--

DROP TABLE IF EXISTS `collages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `collages` (
  `ID` int(10) NOT NULL auto_increment,
  `Name` varchar(100) NOT NULL default '',
  `Description` text NOT NULL,
  `UserID` int(10) NOT NULL default '0',
  `NumTorrents` int(4) NOT NULL default '0',
  `Deleted` enum('0','1') default '0',
  `Locked` enum('0','1') NOT NULL default '0',
  `CategoryID` int(2) NOT NULL default '1',
  `TagList` varchar(500) NOT NULL default '',
  `MaxGroups` int(10) NOT NULL default '0',
  `MaxGroupsPerUser` int(10) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `UserID` (`UserID`),
  KEY `CategoryID` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `collages`
--

LOCK TABLES `collages` WRITE;
/*!40000 ALTER TABLE `collages` DISABLE KEYS */;
/*!40000 ALTER TABLE `collages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collages_comments`
--

DROP TABLE IF EXISTS `collages_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `collages_comments` (
  `ID` int(10) NOT NULL auto_increment,
  `CollageID` int(10) NOT NULL,
  `Body` mediumtext NOT NULL,
  `UserID` int(10) NOT NULL default '0',
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`),
  KEY `CollageID` (`CollageID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `collages_comments`
--

LOCK TABLES `collages_comments` WRITE;
/*!40000 ALTER TABLE `collages_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `collages_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collages_torrents`
--

DROP TABLE IF EXISTS `collages_torrents`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `collages_torrents` (
  `CollageID` int(10) NOT NULL,
  `GroupID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Sort` int(10) NOT NULL default '0',
  PRIMARY KEY  (`CollageID`,`GroupID`),
  KEY `UserID` (`UserID`),
  KEY `Sort` (`Sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `collages_torrents`
--

LOCK TABLES `collages_torrents` WRITE;
/*!40000 ALTER TABLE `collages_torrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `collages_torrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_edits`
--

DROP TABLE IF EXISTS `comments_edits`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `comments_edits` (
  `Page` enum('forums','collages','requests','torrents') default NULL,
  `PostID` int(10) default NULL,
  `EditUser` int(10) default NULL,
  `EditTime` datetime default NULL,
  `Body` mediumtext,
  KEY `Page` (`Page`,`PostID`),
  KEY `EditUser` (`EditUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `comments_edits`
--

LOCK TABLES `comments_edits` WRITE;
/*!40000 ALTER TABLE `comments_edits` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_edits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delays`
--

DROP TABLE IF EXISTS `delays`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `delays` (
  `UserID` int(10) NOT NULL default '0',
  `Enable` tinyint(1) NOT NULL default '0',
  `Item` enum('upload','account','invites','leeching','posting') NOT NULL,
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  `StaffID` int(10) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `delays`
--

LOCK TABLES `delays` WRITE;
/*!40000 ALTER TABLE `delays` DISABLE KEYS */;
/*!40000 ALTER TABLE `delays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `do_not_upload`
--

DROP TABLE IF EXISTS `do_not_upload`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `do_not_upload` (
  `ID` int(10) NOT NULL auto_increment,
  `Name` varchar(255) NOT NULL,
  `Comment` varchar(255) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `do_not_upload`
--

LOCK TABLES `do_not_upload` WRITE;
/*!40000 ALTER TABLE `do_not_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `do_not_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `donations` (
  `UserID` int(10) NOT NULL,
  `Amount` decimal(6,2) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Time` datetime NOT NULL,
  `Currency` varchar(5) NOT NULL default 'USD',
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`),
  KEY `Amount` (`Amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `donations`
--

LOCK TABLES `donations` WRITE;
/*!40000 ALTER TABLE `donations` DISABLE KEYS */;
/*!40000 ALTER TABLE `donations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drives`
--

DROP TABLE IF EXISTS `drives`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `drives` (
  `DriveID` int(10) NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL,
  `Offset` varchar(10) NOT NULL,
  PRIMARY KEY  (`DriveID`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `drives`
--

LOCK TABLES `drives` WRITE;
/*!40000 ALTER TABLE `drives` DISABLE KEYS */;
/*!40000 ALTER TABLE `drives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_albums`
--

DROP TABLE IF EXISTS `featured_albums`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `featured_albums` (
  `GroupID` int(10) NOT NULL default '0',
  `ThreadID` int(10) NOT NULL default '0',
  `Title` varchar(35) NOT NULL default '',
  `Started` datetime NOT NULL default '0000-00-00 00:00:00',
  `Ended` datetime NOT NULL default '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `featured_albums`
--

LOCK TABLES `featured_albums` WRITE;
/*!40000 ALTER TABLE `featured_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `featured_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `forums` (
  `ID` int(6) unsigned NOT NULL auto_increment,
  `CategoryID` tinyint(2) NOT NULL default '0',
  `Sort` int(6) unsigned NOT NULL,
  `Name` varchar(40) NOT NULL default '',
  `Description` varchar(255) default '',
  `MinClassRead` int(4) NOT NULL default '0',
  `MinClassWrite` int(4) NOT NULL default '0',
  `MinClassCreate` int(4) NOT NULL default '0',
  `NumTopics` int(10) NOT NULL default '0',
  `NumPosts` int(10) NOT NULL default '0',
  `LastPostID` int(10) NOT NULL default '0',
  `LastPostAuthorID` int(10) NOT NULL default '0',
  `LastPostTopicID` int(10) NOT NULL default '0',
  `LastPostTime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`),
  KEY `Sort` (`Sort`),
  KEY `MinClassRead` (`MinClassRead`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
INSERT INTO `forums` VALUES (1,1,20,'Your Site','Totally rad forum',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00'),(2,5,30,'Chat','Expect this to fill up with spam',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00'),(3,10,40,'Help!','I fell down and I cant get up',100,100,100,0,0,0,0,0,'0000-00-00 00:00:00'),(4,20,100,'Trash','Every thread ends up here eventually',100,500,500,0,0,0,0,0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_last_read_topics`
--

DROP TABLE IF EXISTS `forums_last_read_topics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `forums_last_read_topics` (
  `UserID` int(10) NOT NULL,
  `TopicID` int(10) NOT NULL,
  `PostID` int(10) NOT NULL,
  PRIMARY KEY  (`UserID`,`TopicID`),
  KEY `TopicID` (`TopicID`),
  KEY `UserID` (`UserID`),
  KEY `TopicID_2` (`TopicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `forums_last_read_topics`
--

LOCK TABLES `forums_last_read_topics` WRITE;
/*!40000 ALTER TABLE `forums_last_read_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums_last_read_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_polls`
--

DROP TABLE IF EXISTS `forums_polls`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `forums_polls` (
  `TopicID` int(10) unsigned NOT NULL,
  `Question` varchar(255) NOT NULL,
  `Answers` text NOT NULL,
  `Featured` datetime NOT NULL default '0000-00-00 00:00:00',
  `Closed` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`TopicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `forums_polls`
--

LOCK TABLES `forums_polls` WRITE;
/*!40000 ALTER TABLE `forums_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_polls_votes`
--

DROP TABLE IF EXISTS `forums_polls_votes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `forums_polls_votes` (
  `TopicID` int(10) unsigned NOT NULL,
  `UserID` int(10) unsigned NOT NULL,
  `Vote` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`TopicID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `forums_polls_votes`
--

LOCK TABLES `forums_polls_votes` WRITE;
/*!40000 ALTER TABLE `forums_polls_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums_polls_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_posts`
--

DROP TABLE IF EXISTS `forums_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `forums_posts` (
  `ID` int(10) NOT NULL auto_increment,
  `TopicID` int(10) NOT NULL,
  `AuthorID` int(10) NOT NULL,
  `AddedTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `Body` mediumtext,
  `EditedUserID` int(10) default NULL,
  `EditedTime` datetime default NULL,
  PRIMARY KEY  (`ID`),
  KEY `TopicID` (`TopicID`),
  KEY `AuthorID` (`AuthorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `forums_posts`
--

LOCK TABLES `forums_posts` WRITE;
/*!40000 ALTER TABLE `forums_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums_topics`
--

DROP TABLE IF EXISTS `forums_topics`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `forums_topics` (
  `ID` int(10) NOT NULL auto_increment,
  `Title` varchar(150) NOT NULL,
  `AuthorID` int(10) NOT NULL,
  `IsLocked` enum('0','1') NOT NULL default '0',
  `IsSticky` enum('0','1') NOT NULL default '0',
  `ForumID` int(3) NOT NULL,
  `NumPosts` int(10) NOT NULL default '0',
  `LastPostID` int(10) NOT NULL,
  `LastPostTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `LastPostAuthorID` int(10) NOT NULL,
  `StickyPostID` int(10) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `ForumID` (`ForumID`),
  KEY `IsSticky` (`IsSticky`),
  KEY `LastPostID` (`LastPostID`),
  KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `forums_topics`
--

LOCK TABLES `forums_topics` WRITE;
/*!40000 ALTER TABLE `forums_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `friends` (
  `UserID` int(10) unsigned NOT NULL,
  `FriendID` int(10) unsigned NOT NULL,
  `Comment` text NOT NULL,
  PRIMARY KEY  (`UserID`,`FriendID`),
  KEY `UserID` (`UserID`),
  KEY `FriendID` (`FriendID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geoip_country`
--

DROP TABLE IF EXISTS `geoip_country`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `geoip_country` (
  `StartIP` int(11) unsigned NOT NULL,
  `EndIP` int(11) unsigned NOT NULL,
  `Code` varchar(2) NOT NULL,
  PRIMARY KEY  (`StartIP`,`EndIP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `geoip_country`
--

LOCK TABLES `geoip_country` WRITE;
/*!40000 ALTER TABLE `geoip_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `geoip_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite_tree`
--

DROP TABLE IF EXISTS `invite_tree`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `invite_tree` (
  `UserID` int(10) NOT NULL default '0',
  `InviterID` int(10) NOT NULL default '0',
  `TreePosition` int(8) NOT NULL default '1',
  `TreeID` int(10) NOT NULL default '1',
  `TreeLevel` int(3) NOT NULL default '0',
  PRIMARY KEY  (`UserID`),
  KEY `InviterID` (`InviterID`),
  KEY `TreePosition` (`TreePosition`),
  KEY `TreeID` (`TreeID`),
  KEY `TreeLevel` (`TreeLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `invite_tree`
--

LOCK TABLES `invite_tree` WRITE;
/*!40000 ALTER TABLE `invite_tree` DISABLE KEYS */;
INSERT INTO `invite_tree` VALUES (1,0,1,1,1),(2,0,1,2,1),(3,0,1,3,1),(4,0,1,4,1),(5,0,1,5,1),(6,0,1,6,1);
/*!40000 ALTER TABLE `invite_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invites`
--

DROP TABLE IF EXISTS `invites`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `invites` (
  `InviterID` int(10) NOT NULL default '0',
  `InviteKey` char(32) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Expires` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`InviteKey`),
  KEY `Expires` (`Expires`),
  KEY `InviterID` (`InviterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `invites`
--

LOCK TABLES `invites` WRITE;
/*!40000 ALTER TABLE `invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_bans`
--

DROP TABLE IF EXISTS `ip_bans`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ip_bans` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `FromIP` int(11) unsigned NOT NULL,
  `ToIP` int(11) unsigned NOT NULL,
  `Reason` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `FromIP_2` (`FromIP`,`ToIP`),
  KEY `FromIP` (`FromIP`,`ToIP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ip_bans`
--

LOCK TABLES `ip_bans` WRITE;
/*!40000 ALTER TABLE `ip_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irc_channels`
--

DROP TABLE IF EXISTS `irc_channels`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `irc_channels` (
  `Name` varchar(50) default NULL,
  `Class` int(4) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `irc_channels`
--

LOCK TABLES `irc_channels` WRITE;
/*!40000 ALTER TABLE `irc_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `irc_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irc_country_bans`
--

DROP TABLE IF EXISTS `irc_country_bans`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `irc_country_bans` (
  `ID` int(10) NOT NULL auto_increment,
  `Code` varchar(2) default NULL,
  `Reason` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `irc_country_bans`
--

LOCK TABLES `irc_country_bans` WRITE;
/*!40000 ALTER TABLE `irc_country_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `irc_country_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `log` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Message` varchar(400) NOT NULL,
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`),
  KEY `Message` (`Message`(255)),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `login_attempts` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `UserID` int(10) unsigned NOT NULL,
  `IP` varchar(15) NOT NULL,
  `LastAttempt` datetime NOT NULL default '0000-00-00 00:00:00',
  `Attempts` int(10) unsigned NOT NULL,
  `BannedUntil` datetime NOT NULL default '0000-00-00 00:00:00',
  `Bans` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`),
  KEY `IP` (`IP`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (3,0,'65.49.14.55','2010-10-07 22:53:42',1,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `news` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `UserID` int(10) unsigned NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Body` text NOT NULL,
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permissions` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Level` int(10) unsigned NOT NULL,
  `Name` varchar(25) character set latin1 NOT NULL,
  `Values` text character set latin1 NOT NULL,
  `DisplayStaff` enum('0','1') character set latin1 NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `Level` (`Level`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (2,100,'User','a:7:{s:10:\"site_leech\";i:1;s:11:\"site_upload\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:14:\"site_edit_wiki\";i:1;s:19:\"torrents_add_artist\";i:1;}','0'),(3,150,'Member','a:10:{s:10:\"site_leech\";i:1;s:11:\"site_upload\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:20:\"site_collages_manage\";i:1;s:19:\"site_make_bookmarks\";i:1;s:14:\"site_edit_wiki\";i:1;s:19:\"torrents_add_artist\";i:1;}','0'),(4,200,'Power User','a:14:{s:10:\"site_leech\";i:1;s:11:\"site_upload\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:20:\"site_torrents_notify\";i:1;s:20:\"site_collages_create\";i:1;s:20:\"site_collages_manage\";i:1;s:19:\"site_make_bookmarks\";i:1;s:14:\"site_edit_wiki\";i:1;s:14:\"zip_downloader\";i:1;s:19:\"forums_polls_create\";i:1;s:19:\"torrents_add_artist\";i:1;} ','0'),(5,250,'Elite','a:18:{s:10:\"site_leech\";i:1;s:11:\"site_upload\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:20:\"site_torrents_notify\";i:1;s:20:\"site_collages_create\";i:1;s:20:\"site_collages_manage\";i:1;s:19:\"site_advanced_top10\";i:1;s:19:\"site_make_bookmarks\";i:1;s:14:\"site_edit_wiki\";i:1;s:15:\"site_delete_tag\";i:1;s:14:\"zip_downloader\";i:1;s:19:\"forums_polls_create\";i:1;s:13:\"torrents_edit\";i:1;s:19:\"torrents_add_artist\";i:1;s:17:\"admin_clear_cache\";i:1;}','0'),(15,1000,'Sysop','a:91:{s:10:\"site_leech\";i:1;s:11:\"site_upload\";i:1;s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:21:\"site_see_old_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:19:\"site_advanced_top10\";i:1;s:20:\"site_torrents_notify\";i:1;s:20:\"site_collages_create\";i:1;s:20:\"site_collages_manage\";i:1;s:20:\"site_collages_delete\";i:1;s:22:\"site_collages_personal\";i:1;s:19:\"site_make_bookmarks\";i:1;s:14:\"site_edit_wiki\";i:1;s:22:\"site_can_invite_always\";i:1;s:27:\"site_send_unlimited_invites\";i:1;s:22:\"site_moderate_requests\";i:1;s:18:\"site_delete_artist\";i:1;s:20:\"site_moderate_forums\";i:1;s:23:\"site_forums_double_post\";i:1;s:14:\"site_view_flow\";i:1;s:18:\"site_view_full_log\";i:1;s:28:\"site_view_torrent_snatchlist\";i:1;s:18:\"site_recommend_own\";i:1;s:27:\"site_manage_recommendations\";i:1;s:15:\"site_delete_tag\";i:1;s:23:\"site_disable_ip_history\";i:1;s:14:\"zip_downloader\";i:1;s:10:\"site_debug\";i:1;s:17:\"site_proxy_images\";i:1;s:16:\"site_search_many\";i:1;s:20:\"users_edit_usernames\";i:1;s:16:\"users_edit_ratio\";i:1;s:20:\"users_edit_own_ratio\";i:1;s:17:\"users_edit_titles\";i:1;s:18:\"users_edit_avatars\";i:1;s:18:\"users_edit_invites\";i:1;s:22:\"users_edit_watch_hours\";i:1;s:21:\"users_edit_reset_keys\";i:1;s:19:\"users_edit_profiles\";i:1;s:18:\"users_view_friends\";i:1;s:20:\"users_reset_own_keys\";i:1;s:19:\"users_edit_password\";i:1;s:19:\"users_promote_below\";i:1;s:16:\"users_promote_to\";i:1;s:16:\"users_give_donor\";i:1;s:10:\"users_warn\";i:1;s:19:\"users_disable_users\";i:1;s:19:\"users_disable_posts\";i:1;s:17:\"users_disable_any\";i:1;s:18:\"users_delete_users\";i:1;s:18:\"users_view_invites\";i:1;s:20:\"users_view_seedleech\";i:1;s:19:\"users_view_uploaded\";i:1;s:15:\"users_view_keys\";i:1;s:14:\"users_view_ips\";i:1;s:16:\"users_view_email\";i:1;s:23:\"users_override_paranoia\";i:1;s:12:\"users_logout\";i:1;s:20:\"users_make_invisible\";i:1;s:9:\"users_mod\";i:1;s:13:\"torrents_edit\";i:1;s:15:\"torrents_delete\";i:1;s:20:\"torrents_delete_fast\";i:1;s:18:\"torrents_freeleech\";i:1;s:20:\"torrents_search_fast\";i:1;s:17:\"admin_manage_news\";i:1;s:17:\"admin_manage_blog\";i:1;s:18:\"admin_manage_polls\";i:1;s:19:\"admin_manage_forums\";i:1;s:16:\"admin_manage_fls\";i:1;s:13:\"admin_reports\";i:1;s:26:\"admin_advanced_user_search\";i:1;s:18:\"admin_create_users\";i:1;s:15:\"admin_donor_log\";i:1;s:19:\"admin_manage_ipbans\";i:1;s:9:\"admin_dnu\";i:1;s:17:\"admin_clear_cache\";i:1;s:15:\"admin_whitelist\";i:1;s:24:\"admin_manage_permissions\";i:1;s:14:\"admin_schedule\";i:1;s:17:\"admin_login_watch\";i:1;s:17:\"admin_manage_wiki\";i:1;s:18:\"admin_update_geoip\";i:1;s:21:\"site_collages_recover\";i:1;s:19:\"torrents_add_artist\";i:1;s:13:\"edit_unknowns\";i:1;s:19:\"forums_polls_create\";i:1;s:21:\"forums_polls_moderate\";i:1;s:12:\"project_team\";i:1;}','1'),(19,201,'Artist','a:9:{s:10:\"site_leech\";s:1:\"1\";s:11:\"site_upload\";s:1:\"1\";s:9:\"site_vote\";s:1:\"1\";s:20:\"site_submit_requests\";s:1:\"1\";s:20:\"site_advanced_search\";s:1:\"1\";s:10:\"site_top10\";s:1:\"1\";s:19:\"site_make_bookmarks\";s:1:\"1\";s:14:\"site_edit_wiki\";s:1:\"1\";s:18:\"site_recommend_own\";s:1:\"1\";}','0'),(20,202,'Donor','a:9:{s:9:\"site_vote\";i:1;s:20:\"site_submit_requests\";i:1;s:20:\"site_advanced_search\";i:1;s:10:\"site_top10\";i:1;s:20:\"site_torrents_notify\";i:1;s:20:\"site_collages_create\";i:1;s:20:\"site_collages_manage\";i:1;s:14:\"zip_downloader\";i:1;s:19:\"forums_polls_create\";i:1;}','0');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_conversations`
--

DROP TABLE IF EXISTS `pm_conversations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pm_conversations` (
  `ID` int(12) NOT NULL auto_increment,
  `Subject` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pm_conversations`
--

LOCK TABLES `pm_conversations` WRITE;
/*!40000 ALTER TABLE `pm_conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_conversations_users`
--

DROP TABLE IF EXISTS `pm_conversations_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pm_conversations_users` (
  `UserID` int(10) NOT NULL default '0',
  `ConvID` int(12) NOT NULL default '0',
  `InInbox` enum('1','0') NOT NULL,
  `InSentbox` enum('1','0') NOT NULL,
  `SentDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `ReceivedDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `UnRead` enum('1','0') NOT NULL default '1',
  `Sticky` enum('1','0') NOT NULL default '0',
  `ForwardedTo` int(12) NOT NULL default '0',
  PRIMARY KEY  (`UserID`,`ConvID`),
  KEY `InInbox` (`InInbox`),
  KEY `InSentbox` (`InSentbox`),
  KEY `ConvID` (`ConvID`),
  KEY `UserID` (`UserID`),
  KEY `SentDate` (`SentDate`),
  KEY `ReceivedDate` (`ReceivedDate`),
  KEY `Sticky` (`Sticky`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pm_conversations_users`
--

LOCK TABLES `pm_conversations_users` WRITE;
/*!40000 ALTER TABLE `pm_conversations_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_conversations_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_messages`
--

DROP TABLE IF EXISTS `pm_messages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pm_messages` (
  `ID` int(12) NOT NULL auto_increment,
  `ConvID` int(12) NOT NULL default '0',
  `SentDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `SenderID` int(10) NOT NULL default '0',
  `Body` text,
  PRIMARY KEY  (`ID`),
  KEY `ConvID` (`ConvID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pm_messages`
--

LOCK TABLES `pm_messages` WRITE;
/*!40000 ALTER TABLE `pm_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls`
--

DROP TABLE IF EXISTS `polls`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `polls` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `UserID` int(10) unsigned NOT NULL,
  `Question` varchar(255) NOT NULL,
  `Answers` text NOT NULL,
  `Responses` text NOT NULL,
  `Expires` datetime NOT NULL default '0000-00-00 00:00:00',
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  `TopicID` int(10) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `polls`
--

LOCK TABLES `polls` WRITE;
/*!40000 ALTER TABLE `polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_responses`
--

DROP TABLE IF EXISTS `polls_responses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `polls_responses` (
  `PollID` int(10) unsigned NOT NULL,
  `UserID` int(10) unsigned NOT NULL,
  `Response` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`PollID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `polls_responses`
--

LOCK TABLES `polls_responses` WRITE;
/*!40000 ALTER TABLE `polls_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reports` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `UserID` int(10) unsigned NOT NULL default '0',
  `ThingID` int(10) unsigned NOT NULL default '0',
  `Type` varchar(30) default NULL,
  `Comment` text,
  `ResolverID` int(10) unsigned NOT NULL default '0',
  `Status` enum('New','InProgress','Resolved') default 'New',
  `ResolvedTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `ReportedTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `Reason` text NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `Status` (`Status`),
  KEY `Type` (`Type`),
  KEY `ResolvedTime` (`ResolvedTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_searches`
--

DROP TABLE IF EXISTS `reports_searches`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reports_searches` (
  `ID` int(10) NOT NULL auto_increment,
  `UserID` int(10) NOT NULL,
  `SearchID` int(10) NOT NULL,
  `Time` datetime NOT NULL,
  `Checked` enum('0','1') default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reports_searches`
--

LOCK TABLES `reports_searches` WRITE;
/*!40000 ALTER TABLE `reports_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportsv2`
--

DROP TABLE IF EXISTS `reportsv2`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reportsv2` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `ReporterID` int(10) unsigned NOT NULL default '0',
  `TorrentID` int(10) unsigned NOT NULL default '0',
  `Type` varchar(20) default '',
  `UserComment` text NOT NULL,
  `ResolverID` int(10) unsigned NOT NULL default '0',
  `Status` enum('New','InProgress','Resolved') default 'New',
  `ReportedTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `LastChangeTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `ModComment` text NOT NULL,
  `Track` text,
  `Image` text,
  `ExtraID` text,
  `Link` text,
  `LogMessage` text,
  PRIMARY KEY  (`ID`),
  KEY `Status` (`Status`),
  KEY `Type` (`Type`(1)),
  KEY `LastChangeTime` (`LastChangeTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reportsv2`
--

LOCK TABLES `reportsv2` WRITE;
/*!40000 ALTER TABLE `reportsv2` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportsv2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `requests` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `UserID` int(10) unsigned NOT NULL default '0',
  `TimeAdded` datetime NOT NULL,
  `LastVote` datetime default NULL,
  `CategoryID` int(3) NOT NULL,
  `Title` varchar(255) default NULL,
  `Year` int(4) default NULL,
  `Image` varchar(255) default NULL,
  `Description` text NOT NULL,
  `ReleaseType` tinyint(2) default NULL,
  `CatalogueNumber` varchar(50) NOT NULL,
  `BitrateList` varchar(255) default NULL,
  `FormatList` varchar(255) default NULL,
  `MediaList` varchar(255) default NULL,
  `LogCue` varchar(20) default NULL,
  `FillerID` int(10) unsigned NOT NULL default '0',
  `TorrentID` int(10) unsigned NOT NULL default '0',
  `TimeFilled` datetime NOT NULL default '0000-00-00 00:00:00',
  `Visible` binary(1) NOT NULL default '1',
  PRIMARY KEY  (`ID`),
  KEY `Userid` (`UserID`),
  KEY `Name` (`Title`),
  KEY `Filled` (`TorrentID`),
  KEY `FillerID` (`FillerID`),
  KEY `TimeAdded` (`TimeAdded`),
  KEY `Year` (`Year`),
  KEY `TimeFilled` (`TimeFilled`),
  KEY `LastVote` (`LastVote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests_artists`
--

DROP TABLE IF EXISTS `requests_artists`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `requests_artists` (
  `RequestID` int(10) unsigned NOT NULL,
  `ArtistID` int(10) NOT NULL,
  `AliasID` int(10) NOT NULL,
  `Importance` enum('1','2') NOT NULL default '1',
  PRIMARY KEY  (`RequestID`,`AliasID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `requests_artists`
--

LOCK TABLES `requests_artists` WRITE;
/*!40000 ALTER TABLE `requests_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests_comments`
--

DROP TABLE IF EXISTS `requests_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `requests_comments` (
  `ID` int(10) NOT NULL auto_increment,
  `RequestID` int(10) NOT NULL,
  `AuthorID` int(10) NOT NULL,
  `AddedTime` datetime default NULL,
  `Body` mediumtext,
  `EditedUserID` int(10) default NULL,
  `EditedTime` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `requests_comments`
--

LOCK TABLES `requests_comments` WRITE;
/*!40000 ALTER TABLE `requests_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests_old`
--

DROP TABLE IF EXISTS `requests_old`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `requests_old` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `UserID` int(10) unsigned NOT NULL default '0',
  `Name` varchar(225) default NULL,
  `Description` text NOT NULL,
  `TimeAdded` datetime NOT NULL default '0000-00-00 00:00:00',
  `FillerID` int(10) unsigned NOT NULL default '0',
  `Filled` int(10) unsigned NOT NULL default '0',
  `Bounty` bigint(20) unsigned NOT NULL default '0',
  `ArtistID` int(10) unsigned NOT NULL default '0',
  `TimeFilled` datetime NOT NULL default '0000-00-00 00:00:00',
  `Visible` enum('0','1') NOT NULL default '1',
  PRIMARY KEY  (`ID`),
  KEY `Userid` (`UserID`),
  KEY `Bounty` (`Bounty`),
  KEY `Name` (`Name`),
  KEY `ArtistID` (`ArtistID`),
  KEY `Filled` (`Filled`),
  KEY `FillerID` (`FillerID`),
  KEY `Visible` (`Visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `requests_old`
--

LOCK TABLES `requests_old` WRITE;
/*!40000 ALTER TABLE `requests_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests_saved_tax`
--

DROP TABLE IF EXISTS `requests_saved_tax`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `requests_saved_tax` (
  `SavedTax` bigint(20) NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `requests_saved_tax`
--

LOCK TABLES `requests_saved_tax` WRITE;
/*!40000 ALTER TABLE `requests_saved_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_saved_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests_tags`
--

DROP TABLE IF EXISTS `requests_tags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `requests_tags` (
  `TagID` int(10) NOT NULL default '0',
  `RequestID` int(10) NOT NULL default '0',
  PRIMARY KEY  (`TagID`,`RequestID`),
  KEY `TagID` (`TagID`),
  KEY `RequestID` (`RequestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `requests_tags`
--

LOCK TABLES `requests_tags` WRITE;
/*!40000 ALTER TABLE `requests_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests_tags_old`
--

DROP TABLE IF EXISTS `requests_tags_old`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `requests_tags_old` (
  `TagID` int(10) NOT NULL default '0',
  `RequestID` int(10) NOT NULL default '0',
  `UserID` int(10) default NULL,
  PRIMARY KEY  (`TagID`,`RequestID`),
  KEY `TagID` (`TagID`),
  KEY `RequestID` (`RequestID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `requests_tags_old`
--

LOCK TABLES `requests_tags_old` WRITE;
/*!40000 ALTER TABLE `requests_tags_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_tags_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests_votes`
--

DROP TABLE IF EXISTS `requests_votes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `requests_votes` (
  `RequestID` int(10) NOT NULL default '0',
  `UserID` int(10) NOT NULL default '0',
  `Bounty` bigint(20) unsigned NOT NULL,
  PRIMARY KEY  (`RequestID`,`UserID`),
  KEY `RequestID` (`RequestID`),
  KEY `UserID` (`UserID`),
  KEY `Bounty` (`Bounty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `requests_votes`
--

LOCK TABLES `requests_votes` WRITE;
/*!40000 ALTER TABLE `requests_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests_votes_old`
--

DROP TABLE IF EXISTS `requests_votes_old`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `requests_votes_old` (
  `RequestID` int(10) NOT NULL default '0',
  `UserID` int(10) NOT NULL default '0',
  PRIMARY KEY  (`RequestID`,`UserID`),
  KEY `RequestID` (`RequestID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `requests_votes_old`
--

LOCK TABLES `requests_votes_old` WRITE;
/*!40000 ALTER TABLE `requests_votes_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests_votes_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schedule` (
  `NextHour` int(2) NOT NULL default '0',
  `NextDay` int(2) NOT NULL default '0',
  `NextBiWeekly` int(2) NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (0,0,0);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_delta`
--

DROP TABLE IF EXISTS `sphinx_delta`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sphinx_delta` (
  `ID` int(10) NOT NULL,
  `GroupName` varchar(255) default NULL,
  `ArtistName` varchar(2048) default NULL,
  `TagList` varchar(728) default NULL,
  `Year` int(4) default NULL,
  `CatalogueNumber` varchar(50) default NULL,
  `RecordLabel` varchar(50) default NULL,
  `CategoryID` tinyint(2) default NULL,
  `Time` int(12) default NULL,
  `ReleaseType` tinyint(2) default NULL,
  `Size` bigint(20) default NULL,
  `Snatched` int(10) default NULL,
  `Seeders` int(10) default NULL,
  `Leechers` int(10) default NULL,
  `LogScore` int(3) default NULL,
  `Scene` tinyint(1) NOT NULL default '0',
  `HasLog` tinyint(1) default NULL,
  `HasCue` tinyint(1) default NULL,
  `FreeTorrent` tinyint(1) default NULL,
  `Media` varchar(255) default NULL,
  `Format` varchar(255) default NULL,
  `Encoding` varchar(255) default NULL,
  `RemasterYear` int(4) default NULL,
  `RemasterTitle` varchar(512) default NULL,
  `RemasterRecordLabel` varchar(50) default NULL,
  `RemasterCatalogueNumber` varchar(50) default NULL,
  `FileList` mediumtext,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sphinx_delta`
--

LOCK TABLES `sphinx_delta` WRITE;
/*!40000 ALTER TABLE `sphinx_delta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sphinx_delta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_hash`
--

DROP TABLE IF EXISTS `sphinx_hash`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sphinx_hash` (
  `ID` int(10) NOT NULL,
  `GroupName` varchar(255) default NULL,
  `ArtistName` varchar(2048) default NULL,
  `TagList` varchar(728) default NULL,
  `Year` int(4) default NULL,
  `CatalogueNumber` varchar(50) default NULL,
  `RecordLabel` varchar(50) default NULL,
  `CategoryID` tinyint(2) default NULL,
  `Time` int(12) default NULL,
  `ReleaseType` tinyint(2) default NULL,
  `Size` bigint(20) default NULL,
  `Snatched` int(10) default NULL,
  `Seeders` int(10) default NULL,
  `Leechers` int(10) default NULL,
  `LogScore` int(3) default NULL,
  `Scene` tinyint(1) NOT NULL default '0',
  `HasLog` tinyint(1) default NULL,
  `HasCue` tinyint(1) default NULL,
  `FreeTorrent` tinyint(1) default NULL,
  `Media` varchar(255) default NULL,
  `Format` varchar(255) default NULL,
  `Encoding` varchar(255) default NULL,
  `RemasterYear` int(4) default NULL,
  `RemasterTitle` varchar(512) default NULL,
  `RemasterRecordLabel` varchar(50) default NULL,
  `RemasterCatalogueNumber` varchar(50) default NULL,
  `FileList` mediumtext,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sphinx_hash`
--

LOCK TABLES `sphinx_hash` WRITE;
/*!40000 ALTER TABLE `sphinx_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `sphinx_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_requests`
--

DROP TABLE IF EXISTS `sphinx_requests`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sphinx_requests` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `UserID` int(10) unsigned NOT NULL default '0',
  `TimeAdded` int(12) unsigned NOT NULL,
  `LastVote` int(12) unsigned NOT NULL,
  `CategoryID` int(3) NOT NULL,
  `Title` varchar(255) default NULL,
  `Year` int(4) default NULL,
  `ArtistList` varchar(2048) default NULL,
  `ReleaseType` tinyint(2) default NULL,
  `CatalogueNumber` varchar(50) NOT NULL,
  `BitrateList` varchar(255) default NULL,
  `FormatList` varchar(255) default NULL,
  `MediaList` varchar(255) default NULL,
  `LogCue` varchar(20) default NULL,
  `FillerID` int(10) unsigned NOT NULL default '0',
  `TorrentID` int(10) unsigned NOT NULL default '0',
  `TimeFilled` int(12) unsigned NOT NULL,
  `Visible` binary(1) NOT NULL default '1',
  `Bounty` bigint(20) unsigned NOT NULL default '0',
  `Votes` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `Userid` (`UserID`),
  KEY `Name` (`Title`),
  KEY `Filled` (`TorrentID`),
  KEY `FillerID` (`FillerID`),
  KEY `TimeAdded` (`TimeAdded`),
  KEY `Year` (`Year`),
  KEY `TimeFilled` (`TimeFilled`),
  KEY `LastVote` (`LastVote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sphinx_requests`
--

LOCK TABLES `sphinx_requests` WRITE;
/*!40000 ALTER TABLE `sphinx_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `sphinx_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sphinx_requests_delta`
--

DROP TABLE IF EXISTS `sphinx_requests_delta`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sphinx_requests_delta` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `UserID` int(10) unsigned NOT NULL default '0',
  `TimeAdded` int(12) unsigned default NULL,
  `LastVote` int(12) unsigned default NULL,
  `CategoryID` int(3) NOT NULL,
  `Title` varchar(255) default NULL,
  `Year` int(4) default NULL,
  `ArtistList` varchar(2048) default NULL,
  `ReleaseType` tinyint(2) default NULL,
  `CatalogueNumber` varchar(50) NOT NULL,
  `BitrateList` varchar(255) default NULL,
  `FormatList` varchar(255) default NULL,
  `MediaList` varchar(255) default NULL,
  `LogCue` varchar(20) default NULL,
  `FillerID` int(10) unsigned NOT NULL default '0',
  `TorrentID` int(10) unsigned NOT NULL default '0',
  `TimeFilled` int(12) unsigned default NULL,
  `Visible` binary(1) NOT NULL default '1',
  `Bounty` bigint(20) unsigned NOT NULL default '0',
  `Votes` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `Userid` (`UserID`),
  KEY `Name` (`Title`),
  KEY `Filled` (`TorrentID`),
  KEY `FillerID` (`FillerID`),
  KEY `TimeAdded` (`TimeAdded`),
  KEY `Year` (`Year`),
  KEY `TimeFilled` (`TimeFilled`),
  KEY `LastVote` (`LastVote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sphinx_requests_delta`
--

LOCK TABLES `sphinx_requests_delta` WRITE;
/*!40000 ALTER TABLE `sphinx_requests_delta` DISABLE KEYS */;
/*!40000 ALTER TABLE `sphinx_requests_delta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stylesheets`
--

DROP TABLE IF EXISTS `stylesheets`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `stylesheets` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Default` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `stylesheets`
--

LOCK TABLES `stylesheets` WRITE;
/*!40000 ALTER TABLE `stylesheets` DISABLE KEYS */;
INSERT INTO `stylesheets` VALUES (2,'Layer cake','Grey stylesheet by Emm','0'),(9,'Proton','Proton by Protiek','0'),(21,'postmod','Upgrade on anorex','1');
/*!40000 ALTER TABLE `stylesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tags` (
  `ID` int(10) NOT NULL auto_increment,
  `Name` varchar(100) default NULL,
  `TagType` enum('genre','other') NOT NULL default 'other',
  `Uses` int(12) NOT NULL default '1',
  `UserID` int(10) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `Name_2` (`Name`),
  KEY `TagType` (`TagType`),
  KEY `Uses` (`Uses`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'rock','genre',0,1),(2,'pop','genre',0,1),(3,'female.fronted.symphonic.death.metal','genre',0,1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_geoip_disabled`
--

DROP TABLE IF EXISTS `tmp_geoip_disabled`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tmp_geoip_disabled` (
  `Code` varchar(2) default NULL,
  `Users` int(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tmp_geoip_disabled`
--

LOCK TABLES `tmp_geoip_disabled` WRITE;
/*!40000 ALTER TABLE `tmp_geoip_disabled` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_geoip_disabled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_geoip_invites`
--

DROP TABLE IF EXISTS `tmp_geoip_invites`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tmp_geoip_invites` (
  `Code` varchar(2) default NULL,
  `Users` int(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tmp_geoip_invites`
--

LOCK TABLES `tmp_geoip_invites` WRITE;
/*!40000 ALTER TABLE `tmp_geoip_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_geoip_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_geoip_uploads`
--

DROP TABLE IF EXISTS `tmp_geoip_uploads`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tmp_geoip_uploads` (
  `Code` varchar(2) default NULL,
  `Uploads` int(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tmp_geoip_uploads`
--

LOCK TABLES `tmp_geoip_uploads` WRITE;
/*!40000 ALTER TABLE `tmp_geoip_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_geoip_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top10_history`
--

DROP TABLE IF EXISTS `top10_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `top10_history` (
  `ID` int(10) NOT NULL auto_increment,
  `Date` datetime NOT NULL default '0000-00-00 00:00:00',
  `Type` enum('Daily','Weekly') default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `top10_history`
--

LOCK TABLES `top10_history` WRITE;
/*!40000 ALTER TABLE `top10_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `top10_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top10_history_torrents`
--

DROP TABLE IF EXISTS `top10_history_torrents`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `top10_history_torrents` (
  `HistoryID` int(10) NOT NULL default '0',
  `Rank` tinyint(2) NOT NULL default '0',
  `TorrentID` int(10) NOT NULL default '0',
  `TitleString` varchar(150) NOT NULL default '',
  `TagString` varchar(100) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `top10_history_torrents`
--

LOCK TABLES `top10_history_torrents` WRITE;
/*!40000 ALTER TABLE `top10_history_torrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `top10_history_torrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_snatchers`
--

DROP TABLE IF EXISTS `top_snatchers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `top_snatchers` (
  `UserID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `top_snatchers`
--

LOCK TABLES `top_snatchers` WRITE;
/*!40000 ALTER TABLE `top_snatchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_snatchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents`
--

DROP TABLE IF EXISTS `torrents`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents` (
  `ID` int(10) NOT NULL auto_increment,
  `GroupID` int(10) NOT NULL,
  `UserID` int(10) default NULL,
  `Media` varchar(20) default NULL,
  `Format` varchar(10) default NULL,
  `Encoding` varchar(15) default NULL,
  `Remastered` enum('0','1') NOT NULL default '0',
  `RemasterYear` int(4) default NULL,
  `RemasterTitle` varchar(80) NOT NULL default '',
  `RemasterCatalogueNumber` varchar(80) NOT NULL default '',
  `RemasterRecordLabel` varchar(80) NOT NULL default '',
  `Scene` enum('0','1') NOT NULL default '0',
  `HasLog` enum('0','1') NOT NULL default '0',
  `HasCue` enum('0','1') NOT NULL default '0',
  `LogScore` int(6) NOT NULL default '0',
  `info_hash` blob NOT NULL,
  `InfoHash` char(40) NOT NULL default '',
  `FileCount` int(6) NOT NULL,
  `FileList` mediumtext NOT NULL,
  `FilePath` varchar(255) NOT NULL default '',
  `Size` bigint(12) NOT NULL,
  `Leechers` int(6) NOT NULL default '0',
  `Seeders` int(6) NOT NULL default '0',
  `last_action` datetime NOT NULL default '0000-00-00 00:00:00',
  `FreeTorrent` enum('0','1') NOT NULL default '0',
  `FreeLeechType` enum('0','1','2','3') NOT NULL default '0',
  `Dupable` enum('0','1') NOT NULL default '0',
  `DupeReason` varchar(40) default NULL,
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  `Anonymous` enum('0','1') NOT NULL default '0',
  `Description` text,
  `Snatched` int(10) unsigned NOT NULL default '0',
  `completed` int(11) NOT NULL,
  `announced_http` int(11) NOT NULL,
  `announced_http_compact` int(11) NOT NULL,
  `announced_http_no_peer_id` int(11) NOT NULL,
  `announced_udp` int(11) NOT NULL,
  `scraped_http` int(11) NOT NULL,
  `scraped_udp` int(11) NOT NULL,
  `started` int(11) NOT NULL,
  `stopped` int(11) NOT NULL,
  `flags` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `balance` bigint(20) NOT NULL default '0',
  `LastLogged` datetime NOT NULL default '0000-00-00 00:00:00',
  `pid` int(5) NOT NULL default '0',
  `LastReseedRequest` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `InfoHash` (`info_hash`(40)),
  KEY `GroupID` (`GroupID`),
  KEY `UserID` (`UserID`),
  KEY `Media` (`Media`),
  KEY `Format` (`Format`),
  KEY `Encoding` (`Encoding`),
  KEY `Year` (`RemasterYear`),
  KEY `FileCount` (`FileCount`),
  KEY `Size` (`Size`),
  KEY `Seeders` (`Seeders`),
  KEY `Leechers` (`Leechers`),
  KEY `Snatched` (`Snatched`),
  KEY `last_action` (`last_action`),
  KEY `Time` (`Time`),
  KEY `flags` (`flags`),
  KEY `LastLogged` (`LastLogged`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents`
--

LOCK TABLES `torrents` WRITE;
/*!40000 ALTER TABLE `torrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_artists`
--

DROP TABLE IF EXISTS `torrents_artists`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_artists` (
  `GroupID` int(10) NOT NULL,
  `ArtistID` int(10) NOT NULL,
  `AliasID` int(10) NOT NULL,
  `UserID` int(10) unsigned NOT NULL default '0',
  `Importance` enum('1','2','3') NOT NULL,
  PRIMARY KEY  (`GroupID`,`AliasID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `AliasID` (`AliasID`),
  KEY `Importance` (`Importance`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_artists`
--

LOCK TABLES `torrents_artists` WRITE;
/*!40000 ALTER TABLE `torrents_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_bad_folders`
--

DROP TABLE IF EXISTS `torrents_bad_folders`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_bad_folders` (
  `TorrentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TimeAdded` datetime NOT NULL,
  PRIMARY KEY  (`TorrentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_bad_folders`
--

LOCK TABLES `torrents_bad_folders` WRITE;
/*!40000 ALTER TABLE `torrents_bad_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_bad_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_bad_tags`
--

DROP TABLE IF EXISTS `torrents_bad_tags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_bad_tags` (
  `TorrentID` int(10) NOT NULL default '0',
  `UserID` int(10) NOT NULL default '0',
  `TimeAdded` datetime NOT NULL default '0000-00-00 00:00:00',
  KEY `TimeAdded` (`TimeAdded`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_bad_tags`
--

LOCK TABLES `torrents_bad_tags` WRITE;
/*!40000 ALTER TABLE `torrents_bad_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_bad_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_balance_history`
--

DROP TABLE IF EXISTS `torrents_balance_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_balance_history` (
  `TorrentID` int(10) NOT NULL,
  `GroupID` int(10) NOT NULL,
  `balance` bigint(20) NOT NULL,
  `Time` datetime NOT NULL,
  `last` enum('0','1','2') default NULL,
  UNIQUE KEY `TorrentID_2` (`TorrentID`,`Time`),
  UNIQUE KEY `TorrentID_3` (`TorrentID`,`balance`),
  KEY `TorrentID` (`TorrentID`),
  KEY `Time` (`Time`),
  KEY `last` (`last`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_balance_history`
--

LOCK TABLES `torrents_balance_history` WRITE;
/*!40000 ALTER TABLE `torrents_balance_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_balance_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_comments`
--

DROP TABLE IF EXISTS `torrents_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_comments` (
  `ID` int(10) NOT NULL auto_increment,
  `GroupID` int(10) NOT NULL,
  `TorrentID` int(10) unsigned NOT NULL,
  `AuthorID` int(10) NOT NULL,
  `AddedTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `Body` mediumtext,
  `EditedUserID` int(10) default NULL,
  `EditedTime` datetime default NULL,
  PRIMARY KEY  (`ID`),
  KEY `TopicID` (`GroupID`),
  KEY `AuthorID` (`AuthorID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_comments`
--

LOCK TABLES `torrents_comments` WRITE;
/*!40000 ALTER TABLE `torrents_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_files`
--

DROP TABLE IF EXISTS `torrents_files`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_files` (
  `TorrentID` int(10) NOT NULL,
  `File` mediumblob NOT NULL,
  PRIMARY KEY  (`TorrentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_files`
--

LOCK TABLES `torrents_files` WRITE;
/*!40000 ALTER TABLE `torrents_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_group`
--

DROP TABLE IF EXISTS `torrents_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_group` (
  `ID` int(10) NOT NULL auto_increment,
  `ArtistID` int(10) default NULL,
  `NumArtists` int(3) NOT NULL default '0',
  `CategoryID` int(3) default NULL,
  `Name` varchar(300) default NULL,
  `Year` int(4) default NULL,
  `CatalogueNumber` varchar(80) NOT NULL default '',
  `RecordLabel` varchar(80) NOT NULL default '',
  `ReleaseType` tinyint(2) default '21',
  `TagList` varchar(500) NOT NULL,
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  `RevisionID` int(12) default NULL,
  `WikiBody` text NOT NULL,
  `WikiImage` varchar(255) NOT NULL,
  `SearchText` varchar(500) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `ArtistID` (`ArtistID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `Name` (`Name`(255)),
  KEY `Year` (`Year`),
  KEY `Time` (`Time`),
  KEY `RevisionID` (`RevisionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_group`
--

LOCK TABLES `torrents_group` WRITE;
/*!40000 ALTER TABLE `torrents_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_logs_new`
--

DROP TABLE IF EXISTS `torrents_logs_new`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_logs_new` (
  `LogID` int(10) NOT NULL auto_increment,
  `TorrentID` int(10) NOT NULL default '0',
  `Log` mediumtext NOT NULL,
  `Details` mediumtext NOT NULL,
  `Score` int(3) NOT NULL,
  `Revision` int(3) NOT NULL,
  `Adjusted` enum('1','0') NOT NULL default '0',
  `AdjustedBy` int(10) NOT NULL default '0',
  `NotEnglish` enum('1','0') NOT NULL default '0',
  `AdjustmentReason` text,
  PRIMARY KEY  (`LogID`),
  KEY `TorrentID` (`TorrentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_logs_new`
--

LOCK TABLES `torrents_logs_new` WRITE;
/*!40000 ALTER TABLE `torrents_logs_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_logs_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_peerlists`
--

DROP TABLE IF EXISTS `torrents_peerlists`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_peerlists` (
  `GroupID` int(10) NOT NULL,
  `SeedersList` varchar(512) default NULL,
  `LeechersList` varchar(512) default NULL,
  `SnatchedList` varchar(512) default NULL,
  PRIMARY KEY  (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_peerlists`
--

LOCK TABLES `torrents_peerlists` WRITE;
/*!40000 ALTER TABLE `torrents_peerlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_peerlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_peerlists_compare`
--

DROP TABLE IF EXISTS `torrents_peerlists_compare`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_peerlists_compare` (
  `GroupID` int(10) NOT NULL,
  `SeedersList` varchar(512) default NULL,
  `LeechersList` varchar(512) default NULL,
  `SnatchedList` varchar(512) default NULL,
  PRIMARY KEY  (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_peerlists_compare`
--

LOCK TABLES `torrents_peerlists_compare` WRITE;
/*!40000 ALTER TABLE `torrents_peerlists_compare` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_peerlists_compare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_recommended`
--

DROP TABLE IF EXISTS `torrents_recommended`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_recommended` (
  `GroupID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`GroupID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_recommended`
--

LOCK TABLES `torrents_recommended` WRITE;
/*!40000 ALTER TABLE `torrents_recommended` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_recommended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_tags`
--

DROP TABLE IF EXISTS `torrents_tags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_tags` (
  `TagID` int(10) NOT NULL default '0',
  `GroupID` int(10) NOT NULL default '0',
  `PositiveVotes` int(6) NOT NULL default '1',
  `NegativeVotes` int(6) NOT NULL default '1',
  `UserID` int(10) default NULL,
  PRIMARY KEY  (`TagID`,`GroupID`),
  KEY `TagID` (`TagID`),
  KEY `GroupID` (`GroupID`),
  KEY `PositiveVotes` (`PositiveVotes`),
  KEY `NegativeVotes` (`NegativeVotes`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_tags`
--

LOCK TABLES `torrents_tags` WRITE;
/*!40000 ALTER TABLE `torrents_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torrents_tags_votes`
--

DROP TABLE IF EXISTS `torrents_tags_votes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `torrents_tags_votes` (
  `GroupID` int(10) NOT NULL,
  `TagID` int(10) NOT NULL,
  `UserID` int(10) NOT NULL,
  `Way` enum('up','down') NOT NULL default 'up',
  PRIMARY KEY  (`GroupID`,`TagID`,`UserID`,`Way`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `torrents_tags_votes`
--

LOCK TABLES `torrents_tags_votes` WRITE;
/*!40000 ALTER TABLE `torrents_tags_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `torrents_tags_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_avatar_warnings`
--

DROP TABLE IF EXISTS `user_avatar_warnings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_avatar_warnings` (
  `UserID` int(10) NOT NULL default '0',
  `Time` datetime default NULL,
  PRIMARY KEY  (`UserID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_avatar_warnings`
--

LOCK TABLES `user_avatar_warnings` WRITE;
/*!40000 ALTER TABLE `user_avatar_warnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_avatar_warnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_stat_backup`
--

DROP TABLE IF EXISTS `user_stat_backup`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_stat_backup` (
  `userid` int(10) NOT NULL default '0',
  `uploaded` bigint(20) default NULL,
  `downloaded` bigint(20) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_stat_backup`
--

LOCK TABLES `user_stat_backup` WRITE;
/*!40000 ALTER TABLE `user_stat_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_stat_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_downloads`
--

DROP TABLE IF EXISTS `users_downloads`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_downloads` (
  `UserID` int(10) NOT NULL,
  `TorrentID` int(1) NOT NULL,
  `Time` datetime NOT NULL,
  PRIMARY KEY  (`UserID`,`TorrentID`,`Time`),
  KEY `TorrentID` (`TorrentID`),
  KEY `UserID` (`UserID`),
  KEY `UserID_2` (`UserID`),
  KEY `TorrentID_2` (`TorrentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_downloads`
--

LOCK TABLES `users_downloads` WRITE;
/*!40000 ALTER TABLE `users_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_geodistribution`
--

DROP TABLE IF EXISTS `users_geodistribution`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_geodistribution` (
  `Code` varchar(2) NOT NULL,
  `Users` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_geodistribution`
--

LOCK TABLES `users_geodistribution` WRITE;
/*!40000 ALTER TABLE `users_geodistribution` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_geodistribution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_history_emails`
--

DROP TABLE IF EXISTS `users_history_emails`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_history_emails` (
  `UserID` int(10) NOT NULL,
  `Email` varchar(255) default NULL,
  `Time` datetime default NULL,
  `IP` varchar(15) default NULL,
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_history_emails`
--

LOCK TABLES `users_history_emails` WRITE;
/*!40000 ALTER TABLE `users_history_emails` DISABLE KEYS */;
INSERT INTO `users_history_emails` VALUES (1,'piercemoore@gmail.com','0000-00-00 00:00:00','99.180.118.13'),(1,'','2010-09-13 06:06:43','99.180.118.13'),(2,'triniclemist90@gmail.com','0000-00-00 00:00:00','198.85.165.37'),(2,'','2010-09-17 07:31:34','198.85.165.37'),(3,'snaple@gmail.com','0000-00-00 00:00:00','198.85.165.37'),(3,'','2010-09-17 07:31:44','198.85.165.37'),(4,'megatomte@gmail.com','0000-00-00 00:00:00','85.225.207.221'),(4,'','2010-09-22 16:02:14','85.225.207.221'),(5,'orly.vertigo@gmail.com','0000-00-00 00:00:00','78.69.243.24'),(5,'','2010-09-22 16:05:00','78.69.243.24'),(6,'nd1@ipv4.pl','0000-00-00 00:00:00','89.74.236.55'),(6,'','2010-10-07 10:24:33','89.74.236.55');
/*!40000 ALTER TABLE `users_history_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_history_ips`
--

DROP TABLE IF EXISTS `users_history_ips`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_history_ips` (
  `UserID` int(10) NOT NULL,
  `IP` varchar(15) NOT NULL default '0.0.0.0',
  `StartTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `EndTime` datetime default NULL,
  PRIMARY KEY  (`UserID`,`IP`,`StartTime`),
  KEY `UserID` (`UserID`),
  KEY `IP` (`IP`),
  KEY `StartTime` (`StartTime`),
  KEY `EndTime` (`EndTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_history_ips`
--

LOCK TABLES `users_history_ips` WRITE;
/*!40000 ALTER TABLE `users_history_ips` DISABLE KEYS */;
INSERT INTO `users_history_ips` VALUES (1,'99.180.118.13','2010-09-13 06:06:43',NULL),(2,'69.132.60.219','2010-09-19 20:08:27',NULL),(3,'198.85.165.38','2010-09-30 04:52:20',NULL),(4,'85.225.207.221','2010-09-22 16:02:14',NULL),(5,'78.69.243.24','2010-09-22 16:05:00',NULL),(6,'89.74.236.55','2010-10-07 10:24:33',NULL),(2,'198.85.165.37','2010-09-17 07:31:34','2010-09-19 20:08:27'),(3,'198.85.165.37','2010-09-17 07:31:44','2010-09-30 04:52:20');
/*!40000 ALTER TABLE `users_history_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_history_passkeys`
--

DROP TABLE IF EXISTS `users_history_passkeys`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_history_passkeys` (
  `UserID` int(10) NOT NULL,
  `OldPassKey` varchar(32) default NULL,
  `NewPassKey` varchar(32) default NULL,
  `ChangeTime` datetime default NULL,
  `ChangerIP` varchar(15) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_history_passkeys`
--

LOCK TABLES `users_history_passkeys` WRITE;
/*!40000 ALTER TABLE `users_history_passkeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_history_passkeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_history_passwords`
--

DROP TABLE IF EXISTS `users_history_passwords`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_history_passwords` (
  `UserID` int(10) NOT NULL,
  `ChangeTime` datetime default NULL,
  `ChangerIP` varchar(15) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_history_passwords`
--

LOCK TABLES `users_history_passwords` WRITE;
/*!40000 ALTER TABLE `users_history_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_history_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_info`
--

DROP TABLE IF EXISTS `users_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_info` (
  `UserID` int(10) unsigned NOT NULL,
  `StyleID` int(10) unsigned NOT NULL,
  `StyleURL` varchar(255) default NULL,
  `Info` text NOT NULL,
  `Avatar` varchar(255) NOT NULL,
  `Country` int(10) unsigned NOT NULL,
  `AdminComment` text NOT NULL,
  `LastReadNews` int(10) default NULL,
  `SiteOptions` text NOT NULL,
  `ViewAvatars` enum('0','1') NOT NULL default '1',
  `Donor` enum('0','1') NOT NULL default '0',
  `Artist` enum('0','1') NOT NULL default '0',
  `DownloadAlt` enum('0','1') NOT NULL default '0',
  `Warned` datetime NOT NULL,
  `MessagesPerPage` tinyint(3) unsigned NOT NULL default '0',
  `DeletePMs` enum('0','1') NOT NULL default '1',
  `SaveSentPMs` enum('0','1') NOT NULL default '0',
  `SupportFor` varchar(255) NOT NULL,
  `TorrentGrouping` enum('0','1','2') NOT NULL COMMENT '0=Open,1=Closed,2=Off',
  `ShowTags` enum('0','1') NOT NULL default '1',
  `AuthKey` varchar(32) NOT NULL,
  `ResetKey` varchar(32) NOT NULL,
  `ResetExpires` datetime NOT NULL default '0000-00-00 00:00:00',
  `JoinDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `Inviter` int(10) default NULL,
  `WarnedTimes` int(2) NOT NULL default '0',
  `DisableAvatar` enum('0','1') NOT NULL default '0',
  `DisableInvites` enum('0','1') NOT NULL default '0',
  `DisablePosting` enum('0','1') NOT NULL default '0',
  `DisableForums` enum('0','1') NOT NULL default '0',
  `DisableIRC` enum('0','1') default '0',
  `DisableTagging` enum('0','1') NOT NULL default '0',
  `DisableUpload` enum('0','1') NOT NULL default '0',
  `DisableWiki` enum('0','1') NOT NULL default '0',
  `DisablePM` enum('0','1') NOT NULL default '0',
  `RatioWatchEnds` datetime NOT NULL default '0000-00-00 00:00:00',
  `RatioWatchDownload` bigint(20) unsigned NOT NULL default '0',
  `RatioWatchTimes` tinyint(1) unsigned NOT NULL default '0',
  `BanDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `BanReason` enum('0','1','2','3','4') NOT NULL default '0',
  `CatchupTime` datetime default NULL,
  UNIQUE KEY `UserID` (`UserID`),
  KEY `SupportFor` (`SupportFor`),
  KEY `DisableInvites` (`DisableInvites`),
  KEY `Donor` (`Donor`),
  KEY `Warned` (`Warned`),
  KEY `JoinDate` (`JoinDate`),
  KEY `Inviter` (`Inviter`),
  KEY `RatioWatchEnds` (`RatioWatchEnds`),
  KEY `RatioWatchDownload` (`RatioWatchDownload`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_info`
--

LOCK TABLES `users_info` WRITE;
/*!40000 ALTER TABLE `users_info` DISABLE KEYS */;
INSERT INTO `users_info` VALUES (1,2,'','','',0,'',NULL,'a:11:{s:15:\"DisableGrouping\";i:0;s:15:\"TorrentGrouping\";i:0;s:10:\"DiscogView\";i:0;s:12:\"PostsPerPage\";i:25;s:11:\"HideCollage\";i:0;s:8:\"ShowTags\";i:0;s:13:\"AutoSubscribe\";i:0;s:14:\"DisableSmileys\";i:0;s:14:\"DisableAvatars\";i:0;s:9:\"HideTypes\";a:0:{}s:10:\"SearchType\";s:1:\"0\";}','1','0','0','0','0000-00-00 00:00:00',0,'1','0','','0','1','7au9dglza5a9miw2101yixrsr3sc1fme','','0000-00-00 00:00:00','2010-09-13 06:06:43',0,0,'0','0','0','0','0','0','0','0','0','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','0',NULL),(2,21,NULL,'','',0,'',NULL,'','1','0','0','0','0000-00-00 00:00:00',0,'1','0','','0','1','0wovcohmm0nax154r2y4mhobhzwav1dw','','0000-00-00 00:00:00','2010-09-17 07:31:34',0,0,'0','0','0','0','0','0','0','0','0','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','0',NULL),(3,21,NULL,'','',0,'',NULL,'','1','0','0','0','0000-00-00 00:00:00',0,'1','0','','0','1','xfpipo0xqpd8fyst0nyn1qwy9wgi8nyx','','0000-00-00 00:00:00','2010-09-17 07:31:44',0,0,'0','0','0','0','0','0','0','0','0','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','0',NULL),(4,21,NULL,'','',0,'',NULL,'','1','0','0','0','0000-00-00 00:00:00',0,'1','0','','0','1','bc1nvrxe1jvnthhbftd13obxwnaetdk9','','0000-00-00 00:00:00','2010-09-22 16:02:14',0,0,'0','0','0','0','0','0','0','0','0','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','0',NULL),(5,21,NULL,'','',0,'',NULL,'','1','0','0','0','0000-00-00 00:00:00',0,'1','0','','0','1','kgvpapi34mso5zrkny1dipl0hoz1aui2','','0000-00-00 00:00:00','2010-09-22 16:05:00',0,0,'0','0','0','0','0','0','0','0','0','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','0',NULL),(6,21,NULL,'','',0,'',NULL,'','1','0','0','0','0000-00-00 00:00:00',0,'1','0','','0','1','06aturhk4b1vhn9zkp6fd2qi91zi56wo','','0000-00-00 00:00:00','2010-10-07 10:24:33',0,0,'0','0','0','0','0','0','0','0','0','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','0',NULL);
/*!40000 ALTER TABLE `users_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_main`
--

DROP TABLE IF EXISTS `users_main`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_main` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Username` varchar(20) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PassHash` char(40) NOT NULL,
  `Secret` char(32) NOT NULL,
  `TorrentKey` char(32) NOT NULL,
  `IRCKey` char(32) default NULL,
  `LastLogin` datetime NOT NULL default '0000-00-00 00:00:00',
  `LastAccess` datetime NOT NULL default '0000-00-00 00:00:00',
  `IP` varchar(15) NOT NULL default '0.0.0.0',
  `Class` tinyint(2) NOT NULL default '5',
  `Uploaded` bigint(20) unsigned NOT NULL default '0',
  `Downloaded` bigint(20) unsigned NOT NULL default '0',
  `Title` varchar(255) NOT NULL default '',
  `Enabled` enum('0','1','2') NOT NULL default '0',
  `Paranoia` enum('0','1','2','3','4','5') NOT NULL default '0',
  `Visible` enum('1','0') NOT NULL default '1',
  `Invites` int(10) unsigned NOT NULL default '0',
  `PermissionID` int(10) unsigned NOT NULL,
  `CustomPermissions` text,
  `LastSeed` datetime NOT NULL default '0000-00-00 00:00:00',
  `pass` blob NOT NULL COMMENT 'useless column',
  `can_leech` tinyint(4) NOT NULL default '1',
  `wait_time` int(11) NOT NULL,
  `peers_limit` int(11) default '1000',
  `torrents_limit` int(11) default '1000',
  `torrent_pass` char(32) NOT NULL,
  `torrent_pass_secret` bigint(20) NOT NULL COMMENT 'useless column',
  `fid_end` int(11) NOT NULL COMMENT 'useless column',
  `name` char(8) NOT NULL COMMENT 'useless column',
  `OldPassHash` char(32) default NULL,
  `CookieID` varchar(32) default NULL,
  `RequiredRatio` double(10,8) NOT NULL default '0.00000000',
  `RequiredRatioWork` double(10,8) NOT NULL default '0.00000000',
  `Language` char(2) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `Username` (`Username`),
  KEY `Email` (`Email`),
  KEY `PassHash` (`PassHash`),
  KEY `LastAccess` (`LastAccess`),
  KEY `IP` (`IP`),
  KEY `Class` (`Class`),
  KEY `Uploaded` (`Uploaded`),
  KEY `Downloaded` (`Downloaded`),
  KEY `Enabled` (`Enabled`),
  KEY `Invites` (`Invites`),
  KEY `torrent_pass` (`torrent_pass`),
  KEY `RequiredRatio` (`RequiredRatio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_main`
--

LOCK TABLES `users_main` WRITE;
/*!40000 ALTER TABLE `users_main` DISABLE KEYS */;
INSERT INTO `users_main` VALUES (1,'bigrocka1','piercemoore@gmail.com','7ac16fc1dc8bca6028d32a1fe28c3437d504afb5','xhye6d7sk9g2qeqwiq8g8cysddstiyxd','','','2010-09-17 05:39:22','2010-09-17 05:39:22','99.180.118.13',5,524288000,0,'','1','0','1',0,15,NULL,'0000-00-00 00:00:00','',1,0,1000,1000,'rhqb2mogrgew32l603c3iqbub0mhs2dw',0,0,'',NULL,NULL,0.00000000,0.00000000,NULL),(2,'triniclemist','triniclemist90@gmail.com','fde3ca7058a2736fb4b005c89e1404953b791d3b','k92o1xd0viwrbvkim2bthw64w5u656tm','',NULL,'2010-09-17 07:32:51','2010-09-19 20:08:27','69.132.60.219',5,524288000,0,'','1','0','1',0,2,NULL,'0000-00-00 00:00:00','',1,0,1000,1000,'elg025c8gtxmi26pl83qxm0twjuw0hda',0,0,'',NULL,NULL,0.00000000,0.00000000,NULL),(3,'snaple','snaple@gmail.com','a05d215bfaaef8fe3f619595cd6ddf4b76ebe79b','bzis5n4gc4mwwtmh61obssa1waehrfas','',NULL,'2010-09-30 04:52:20','2010-09-30 04:52:20','198.85.165.38',5,524288000,0,'','1','0','1',0,2,NULL,'0000-00-00 00:00:00','',1,0,1000,1000,'wz8mqayrr46817f62bv046r74ktndo21',0,0,'',NULL,NULL,0.00000000,0.00000000,NULL),(4,'Yopi','megatomte@gmail.com','4e4ae6893e82d6115679024e93904a10fc406b73','me2gz7twvb0z39iuincxsv8wlgdcc95y','',NULL,'2010-09-22 16:02:50','2010-09-22 16:02:50','85.225.207.221',5,524288000,0,'','1','0','1',0,2,NULL,'0000-00-00 00:00:00','',1,0,1000,1000,'tl520yo72v6zyy0tqmdv9j7ixszbth8u',0,0,'',NULL,NULL,0.00000000,0.00000000,NULL),(5,'Vertigo','orly.vertigo@gmail.com','c2755118a2e7c14c1b5a1eb1bf2b8774d3eec3e0','lb0vzz7hqh227row1s2v3395p1ctfek2','',NULL,'2010-09-22 16:05:27','2010-09-22 16:05:27','78.69.243.24',5,524288000,0,'','1','0','1',0,2,NULL,'0000-00-00 00:00:00','',1,0,1000,1000,'832nfl819b8j8mv4ld597bi181wqvrgj',0,0,'',NULL,NULL,0.00000000,0.00000000,NULL),(6,'Naven','nd1@ipv4.pl','d611a2ce8567422612844bd168dab7ae7933ed83','8me4rsnp9vcs2wxh3otcz0p38mii5ob7','',NULL,'2010-10-07 10:25:18','2010-10-07 10:25:18','89.74.236.55',5,524288000,0,'','1','0','1',0,2,NULL,'0000-00-00 00:00:00','',1,0,1000,1000,'htryij8yb1rfg59bbrs8iicg2gzkwcq9',0,0,'',NULL,NULL,0.00000000,0.00000000,NULL);
/*!40000 ALTER TABLE `users_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_notify_filters`
--

DROP TABLE IF EXISTS `users_notify_filters`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_notify_filters` (
  `ID` int(12) NOT NULL auto_increment,
  `UserID` int(10) NOT NULL,
  `Label` varchar(128) NOT NULL default '',
  `Artists` mediumtext NOT NULL,
  `Tags` varchar(500) NOT NULL default '',
  `Categories` varchar(500) NOT NULL default '',
  `Formats` varchar(500) NOT NULL default '',
  `Encodings` varchar(500) NOT NULL default '',
  `Media` varchar(500) NOT NULL default '',
  `FromYear` int(4) NOT NULL default '0',
  `ToYear` int(4) NOT NULL default '0',
  `ExcludeVA` enum('1','0') NOT NULL default '0',
  `NewGroupsOnly` enum('1','0') NOT NULL default '0',
  `ReleaseTypes` varchar(500) NOT NULL default '',
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`),
  KEY `FromYear` (`FromYear`),
  KEY `ToYear` (`ToYear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_notify_filters`
--

LOCK TABLES `users_notify_filters` WRITE;
/*!40000 ALTER TABLE `users_notify_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_notify_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_notify_torrents`
--

DROP TABLE IF EXISTS `users_notify_torrents`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_notify_torrents` (
  `UserID` int(10) NOT NULL,
  `FilterID` int(10) NOT NULL,
  `GroupID` int(10) NOT NULL,
  `TorrentID` int(10) NOT NULL,
  `UnRead` enum('1','0') NOT NULL default '1',
  PRIMARY KEY  (`UserID`,`TorrentID`),
  KEY `UnRead` (`UnRead`),
  KEY `UserID` (`UserID`),
  KEY `TorrentID` (`TorrentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_notify_torrents`
--

LOCK TABLES `users_notify_torrents` WRITE;
/*!40000 ALTER TABLE `users_notify_torrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_notify_torrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_points`
--

DROP TABLE IF EXISTS `users_points`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_points` (
  `UserID` int(10) NOT NULL,
  `GroupID` int(10) NOT NULL,
  `Points` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`UserID`,`GroupID`),
  KEY `UserID` (`UserID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_points`
--

LOCK TABLES `users_points` WRITE;
/*!40000 ALTER TABLE `users_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_sessions`
--

DROP TABLE IF EXISTS `users_sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_sessions` (
  `UserID` int(10) NOT NULL,
  `SessionID` char(32) NOT NULL,
  `KeepLogged` enum('0','1') NOT NULL default '0',
  `Browser` varchar(40) default NULL,
  `OperatingSystem` varchar(20) default NULL,
  `IP` varchar(15) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  PRIMARY KEY  (`UserID`,`SessionID`),
  KEY `UserID` (`UserID`),
  KEY `LastUpdate` (`LastUpdate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_sessions`
--

LOCK TABLES `users_sessions` WRITE;
/*!40000 ALTER TABLE `users_sessions` DISABLE KEYS */;
INSERT INTO `users_sessions` VALUES (1,'5jqjf2crq5nltl147u1g3jdq5pgjdz2s','1','Chrome','Windows 7','127.0.0.1','2010-09-13 18:37:26'),(1,'5xq78vnslt899lu11t8exofkw2ryhnxm','0','Chrome','Windows 7','127.0.0.1','2010-09-17 05:39:22'),(1,'eypnp67px0d6yt1tt8cb4xgdc2xvkija','0','Firefox','Windows 7','127.0.0.1','2010-09-13 06:19:45'),(2,'nbmyrasstwt260botiavum438f0dzy98','0','Chrome','Mac OS X','69.132.60.219','2010-09-19 20:08:27'),(3,'105qk1le4uhqyqzw1p7uei5z0rkej0wd','0','Firefox','Windows 7','198.85.165.38','2010-09-30 04:52:20'),(3,'28la53hle1tw06408nbiht01fyykjrc1','0','Firefox','Windows 7','198.85.165.37','2010-09-18 01:10:09'),(3,'6dp3fce00ebvs5ytnjg8u2a0tpdsbijx','0','Firefox','Windows 7','198.85.165.37','2010-09-20 04:38:24'),(3,'amgp6504mcr36f6l53uus24r1uxbsq2u','0','Firefox','Windows 7','198.85.165.37','2010-09-24 03:24:21'),(3,'kc5kfm1esdb4fk0sffpf030271dfvza9','0','Firefox','Windows 7','198.85.165.37','2010-09-17 07:32:53'),(4,'7chl7y7hj68kp1ztlwq20edjfh5caxf6','0','Opera','Windows 7','85.225.207.221','2010-09-22 16:02:50'),(5,'ip96n9i3qwuu2a8199e8ugefbpor6jxd','1','Opera','Windows 7','78.69.243.24','2010-09-22 16:05:27'),(6,'ncd0fxcwbnbr11kuscqt5yz5yqb2whqb','1','Firefox','Ubuntu','89.74.236.55','2010-10-07 10:25:18');
/*!40000 ALTER TABLE `users_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_subscriptions`
--

DROP TABLE IF EXISTS `users_subscriptions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_subscriptions` (
  `UserID` int(10) NOT NULL,
  `TopicID` int(10) NOT NULL,
  PRIMARY KEY  (`UserID`,`TopicID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_subscriptions`
--

LOCK TABLES `users_subscriptions` WRITE;
/*!40000 ALTER TABLE `users_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_torrent_history`
--

DROP TABLE IF EXISTS `users_torrent_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_torrent_history` (
  `UserID` int(10) unsigned NOT NULL,
  `NumTorrents` int(6) unsigned NOT NULL,
  `Date` int(8) unsigned NOT NULL,
  `Time` int(11) unsigned NOT NULL default '0',
  `LastTime` int(11) unsigned NOT NULL default '0',
  `Finished` enum('1','0') NOT NULL default '1',
  `Weight` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`UserID`,`NumTorrents`,`Date`),
  KEY `Finished` (`Finished`),
  KEY `Date` (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_torrent_history`
--

LOCK TABLES `users_torrent_history` WRITE;
/*!40000 ALTER TABLE `users_torrent_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_torrent_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_torrent_history_snatch`
--

DROP TABLE IF EXISTS `users_torrent_history_snatch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_torrent_history_snatch` (
  `UserID` int(10) unsigned NOT NULL,
  `NumSnatches` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`UserID`),
  KEY `NumSnatches` (`NumSnatches`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_torrent_history_snatch`
--

LOCK TABLES `users_torrent_history_snatch` WRITE;
/*!40000 ALTER TABLE `users_torrent_history_snatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_torrent_history_snatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_torrent_history_temp`
--

DROP TABLE IF EXISTS `users_torrent_history_temp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_torrent_history_temp` (
  `UserID` int(10) unsigned NOT NULL,
  `NumTorrents` int(6) unsigned NOT NULL default '0',
  `SumTime` bigint(20) unsigned NOT NULL default '0',
  `SeedingAvg` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_torrent_history_temp`
--

LOCK TABLES `users_torrent_history_temp` WRITE;
/*!40000 ALTER TABLE `users_torrent_history_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_torrent_history_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_watch`
--

DROP TABLE IF EXISTS `users_watch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users_watch` (
  `UserID` int(10) unsigned NOT NULL,
  `EmailTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `PasswordTime` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`UserID`),
  KEY `EmailTime` (`EmailTime`),
  KEY `PasswordTime` (`PasswordTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users_watch`
--

LOCK TABLES `users_watch` WRITE;
/*!40000 ALTER TABLE `users_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_aliases`
--

DROP TABLE IF EXISTS `wiki_aliases`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wiki_aliases` (
  `Alias` varchar(50) NOT NULL,
  `UserID` int(10) NOT NULL,
  `ArticleID` int(10) default NULL,
  PRIMARY KEY  (`Alias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wiki_aliases`
--

LOCK TABLES `wiki_aliases` WRITE;
/*!40000 ALTER TABLE `wiki_aliases` DISABLE KEYS */;
INSERT INTO `wiki_aliases` VALUES ('wiki',1,1);
/*!40000 ALTER TABLE `wiki_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_articles`
--

DROP TABLE IF EXISTS `wiki_articles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wiki_articles` (
  `ID` int(10) NOT NULL auto_increment,
  `Revision` int(10) NOT NULL default '1',
  `Title` varchar(100) default NULL,
  `Body` mediumtext,
  `MinClassRead` int(4) default NULL,
  `MinClassEdit` int(4) default NULL,
  `Date` datetime default NULL,
  `Author` int(10) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wiki_articles`
--

LOCK TABLES `wiki_articles` WRITE;
/*!40000 ALTER TABLE `wiki_articles` DISABLE KEYS */;
INSERT INTO `wiki_articles` VALUES (1,1,'Wiki','Welcome to your new wiki! Hope this works.',100,475,'2010-09-11 21:38:48',1);
/*!40000 ALTER TABLE `wiki_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_artists`
--

DROP TABLE IF EXISTS `wiki_artists`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wiki_artists` (
  `RevisionID` int(12) NOT NULL auto_increment,
  `PageID` int(10) NOT NULL default '0',
  `Body` text,
  `UserID` int(10) NOT NULL default '0',
  `Summary` varchar(100) default NULL,
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  `Image` varchar(255) default NULL,
  PRIMARY KEY  (`RevisionID`),
  KEY `PageID` (`PageID`),
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wiki_artists`
--

LOCK TABLES `wiki_artists` WRITE;
/*!40000 ALTER TABLE `wiki_artists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_revisions`
--

DROP TABLE IF EXISTS `wiki_revisions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wiki_revisions` (
  `ID` int(10) NOT NULL,
  `Revision` int(10) NOT NULL,
  `Title` varchar(100) default NULL,
  `Body` mediumtext,
  `Date` datetime default NULL,
  `Author` int(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wiki_revisions`
--

LOCK TABLES `wiki_revisions` WRITE;
/*!40000 ALTER TABLE `wiki_revisions` DISABLE KEYS */;
INSERT INTO `wiki_revisions` VALUES (1,1,'Wiki','Welcome to your new wiki! Hope this works.','2010-09-11 21:38:49',1);
/*!40000 ALTER TABLE `wiki_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_torrents`
--

DROP TABLE IF EXISTS `wiki_torrents`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wiki_torrents` (
  `RevisionID` int(12) NOT NULL auto_increment,
  `PageID` int(10) NOT NULL default '0',
  `Body` text,
  `UserID` int(10) NOT NULL default '0',
  `Summary` varchar(100) default NULL,
  `Time` datetime NOT NULL default '0000-00-00 00:00:00',
  `Image` varchar(255) default NULL,
  PRIMARY KEY  (`RevisionID`),
  KEY `PageID` (`PageID`),
  KEY `UserID` (`UserID`),
  KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wiki_torrents`
--

LOCK TABLES `wiki_torrents` WRITE;
/*!40000 ALTER TABLE `wiki_torrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_torrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_announce_log`
--

DROP TABLE IF EXISTS `xbt_announce_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `xbt_announce_log` (
  `id` int(11) NOT NULL auto_increment,
  `ipa` int(10) unsigned NOT NULL,
  `port` int(11) NOT NULL,
  `event` int(11) NOT NULL,
  `info_hash` blob NOT NULL,
  `peer_id` blob NOT NULL,
  `downloaded` bigint(20) NOT NULL,
  `left0` bigint(20) NOT NULL,
  `uploaded` bigint(20) NOT NULL,
  `uid` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `useragent` varchar(51) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `xbt_announce_log`
--

LOCK TABLES `xbt_announce_log` WRITE;
/*!40000 ALTER TABLE `xbt_announce_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_announce_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_cheat`
--

DROP TABLE IF EXISTS `xbt_cheat`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `xbt_cheat` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `ipa` int(10) unsigned NOT NULL,
  `upspeed` bigint(20) NOT NULL,
  `tstamp` int(11) NOT NULL,
  `uploaded` bigint(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `xbt_cheat`
--

LOCK TABLES `xbt_cheat` WRITE;
/*!40000 ALTER TABLE `xbt_cheat` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_cheat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_client_whitelist`
--

DROP TABLE IF EXISTS `xbt_client_whitelist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `xbt_client_whitelist` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `peer_id` varchar(20) default NULL,
  `vstring` varchar(200) default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `peer_id` (`peer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `xbt_client_whitelist`
--

LOCK TABLES `xbt_client_whitelist` WRITE;
/*!40000 ALTER TABLE `xbt_client_whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_client_whitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_config`
--

DROP TABLE IF EXISTS `xbt_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `xbt_config` (
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `xbt_config`
--

LOCK TABLES `xbt_config` WRITE;
/*!40000 ALTER TABLE `xbt_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_deny_from_hosts`
--

DROP TABLE IF EXISTS `xbt_deny_from_hosts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `xbt_deny_from_hosts` (
  `begin` int(11) NOT NULL,
  `end` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `xbt_deny_from_hosts`
--

LOCK TABLES `xbt_deny_from_hosts` WRITE;
/*!40000 ALTER TABLE `xbt_deny_from_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_deny_from_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_files`
--

DROP TABLE IF EXISTS `xbt_files`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `xbt_files` (
  `fid` int(11) NOT NULL auto_increment,
  `info_hash` blob NOT NULL,
  `leechers` int(11) NOT NULL,
  `seeders` int(11) NOT NULL,
  `completed` int(11) NOT NULL,
  `announced_http` int(11) NOT NULL,
  `announced_http_compact` int(11) NOT NULL,
  `announced_http_no_peer_id` int(11) NOT NULL,
  `announced_udp` int(11) NOT NULL,
  `scraped_http` int(11) NOT NULL,
  `scraped_udp` int(11) NOT NULL,
  `started` int(11) NOT NULL,
  `stopped` int(11) NOT NULL,
  `flags` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `freetorrent` int(11) NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  UNIQUE KEY `info_hash` (`info_hash`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `xbt_files`
--

LOCK TABLES `xbt_files` WRITE;
/*!40000 ALTER TABLE `xbt_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_files_users`
--

DROP TABLE IF EXISTS `xbt_files_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `xbt_files_users` (
  `uid` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `announced` int(11) NOT NULL,
  `completed` int(11) NOT NULL,
  `downloaded` bigint(20) NOT NULL,
  `remaining` bigint(20) NOT NULL,
  `uploaded` bigint(20) NOT NULL,
  `upspeed` bigint(20) NOT NULL,
  `downspeed` bigint(20) NOT NULL,
  `corrupt` bigint(20) NOT NULL default '0',
  `timespent` bigint(20) NOT NULL,
  `useragent` varchar(51) NOT NULL,
  `connectable` tinyint(4) NOT NULL default '1',
  `peer_id` binary(20) default NULL,
  `fid` int(11) NOT NULL,
  `ipa` int(12) unsigned NOT NULL,
  `mtime` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL default '',
  UNIQUE KEY `uid_2` (`uid`,`fid`,`ipa`),
  KEY `uid` (`uid`),
  KEY `remaining_idx` (`remaining`),
  KEY `fid_idx` (`fid`),
  KEY `mtime_idx` (`mtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `xbt_files_users`
--

LOCK TABLES `xbt_files_users` WRITE;
/*!40000 ALTER TABLE `xbt_files_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_files_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_scrape_log`
--

DROP TABLE IF EXISTS `xbt_scrape_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `xbt_scrape_log` (
  `id` int(11) NOT NULL auto_increment,
  `ipa` int(11) NOT NULL,
  `info_hash` blob,
  `uid` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `xbt_scrape_log`
--

LOCK TABLES `xbt_scrape_log` WRITE;
/*!40000 ALTER TABLE `xbt_scrape_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_scrape_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_snatched`
--

DROP TABLE IF EXISTS `xbt_snatched`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `xbt_snatched` (
  `uid` int(11) NOT NULL default '0',
  `tstamp` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  KEY `fid` (`fid`),
  KEY `uid` (`uid`),
  KEY `tstamp` (`tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `xbt_snatched`
--

LOCK TABLES `xbt_snatched` WRITE;
/*!40000 ALTER TABLE `xbt_snatched` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_snatched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xbt_users`
--

DROP TABLE IF EXISTS `xbt_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `xbt_users` (
  `uid` int(11) NOT NULL auto_increment,
  `name` char(8) NOT NULL,
  `pass` blob NOT NULL,
  `can_leech` tinyint(4) NOT NULL default '1',
  `wait_time` int(11) NOT NULL,
  `peers_limit` int(11) NOT NULL,
  `torrents_limit` int(11) NOT NULL,
  `torrent_pass` char(32) NOT NULL,
  `torrent_pass_secret` bigint(20) NOT NULL,
  `downloaded` bigint(20) NOT NULL,
  `uploaded` bigint(20) NOT NULL,
  `fid_end` int(11) NOT NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `xbt_users`
--

LOCK TABLES `xbt_users` WRITE;
/*!40000 ALTER TABLE `xbt_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `xbt_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `hubdallas`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hubdallas` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hubdallas`;

--
-- Table structure for table `contact_image`
--

DROP TABLE IF EXISTS `contact_image`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `contact_image` (
  `img_path` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `contact_image`
--

LOCK TABLES `contact_image` WRITE;
/*!40000 ALTER TABLE `contact_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_history`
--

DROP TABLE IF EXISTS `db_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `db_history` (
  `change_id` int(20) NOT NULL auto_increment,
  `table_name` varchar(250) default NULL,
  `id_col_name` varchar(50) default NULL,
  `row_id` int(20) default NULL,
  `info_old` varchar(10000) default NULL,
  `info_new` varchar(10000) default NULL,
  `date_changed` datetime default NULL,
  `last_modified` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`change_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Record history for all db transactions, enable "undo".';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `db_history`
--

LOCK TABLES `db_history` WRITE;
/*!40000 ALTER TABLE `db_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `friends` (
  `friend_id` int(10) NOT NULL auto_increment,
  `friend_name` varchar(250) default NULL,
  `friend_img_path` varchar(250) default NULL,
  `friend_link` varchar(250) default NULL,
  `date_added` datetime default NULL,
  `last_updated` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`friend_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='List of the Hub''s Friends on friends page (images/links)';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (4,'Refreshed Web Design','http://www.hubdallas.com/assets/images/uploads/friends/banner_refweb.png','http://www.refreshedweb.com','2010-07-25 03:50:12','2010-07-25 08:51:36');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `galleries` (
  `gallery_id` int(8) NOT NULL auto_increment,
  `gallery_name` varchar(250) NOT NULL,
  `gallery_img_path` varchar(250) NOT NULL,
  `created_on` datetime NOT NULL,
  `last_updated` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`gallery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Testing','thumbs/portal_-_the_cake_is_a_lie2.jpg','2010-06-30 14:03:50',NULL),(2,'Another Test','thumbs/portal_-_the_cake_is_a_lie2.jpg','2010-06-30 14:04:39',NULL);
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_image`
--

DROP TABLE IF EXISTS `home_image`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `home_image` (
  `img_path` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `home_image`
--

LOCK TABLES `home_image` WRITE;
/*!40000 ALTER TABLE `home_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_slider`
--

DROP TABLE IF EXISTS `home_slider`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `home_slider` (
  `tab_id` int(10) NOT NULL auto_increment,
  `tab_img_path` varchar(250) NOT NULL,
  `tab_name` varchar(20) NOT NULL,
  `tab_caption` varchar(250) NOT NULL,
  `tab_font_size` int(2) NOT NULL,
  `tab_link` varchar(1000) NOT NULL,
  `last_updated` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`tab_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Pictures and Text (?) for the Eat/Drink/Play "Home" slider';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `home_slider`
--

LOCK TABLES `home_slider` WRITE;
/*!40000 ALTER TABLE `home_slider` DISABLE KEYS */;
INSERT INTO `home_slider` VALUES (1,'asd','eat','Eat eat eat!',50,'http://www.google.com',NULL),(2,'imagenamehere','drink','Drinky drinks!',50,'http://www.firefox.com',NULL),(3,'','play','Play play play!',50,'http://www.refreshedweb.com',NULL);
/*!40000 ALTER TABLE `home_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `images` (
  `image_id` int(8) NOT NULL auto_increment,
  `image_name` varchar(250) NOT NULL,
  `image_path` varchar(250) NOT NULL,
  `thumb_path` varchar(250) NOT NULL,
  `full_width` int(8) NOT NULL,
  `full_height` int(8) NOT NULL,
  `thumb_width` int(8) NOT NULL,
  `thumb_height` int(8) NOT NULL,
  `gallery` int(8) NOT NULL,
  `date_added` datetime NOT NULL,
  `last_updated` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`image_id`),
  KEY `gallery` (`gallery`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`gallery`) REFERENCES `galleries` (`gallery_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (3,'The Cake is a Pie','portal_-_the_cake_is_a_lie2.jpg','thumbs/portal_-_the_cake_is_a_lie2.jpg',600,338,175,99,1,'2010-06-30 15:17:06',NULL),(4,'The Bridge','00589_brooklynbridge_1280x1024.jpg','thumbs/00589_brooklynbridge_1280x1024.jpg',600,480,175,140,2,'2010-06-30 16:08:32',NULL);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_text`
--

DROP TABLE IF EXISTS `site_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `site_text` (
  `text_id` int(5) NOT NULL auto_increment,
  `text_name` varchar(250) NOT NULL,
  `text_content` varchar(10000) NOT NULL,
  `item_description` varchar(500) default NULL,
  `is_visible` int(1) NOT NULL,
  `last_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`text_id`),
  UNIQUE KEY `text_name` (`text_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `site_text`
--

LOCK TABLES `site_text` WRITE;
/*!40000 ALTER TABLE `site_text` DISABLE KEYS */;
INSERT INTO `site_text` VALUES (10,'browser_page_title','The Hub Sports Bar and Grill','General Title for Display on User\'s Browser',1,'0000-00-00 00:00:00'),(13,'home_slider_top_caption','Top tab text changed!','Caption for Top Slider Tab on Home Page',1,'0000-00-00 00:00:00'),(14,'home_slider_mid_caption','This is the caption for the middle tab.','Caption for Middle Slider Tab on Home Page',1,'0000-00-00 00:00:00'),(15,'home_slider_bot_caption','This is the caption for the bottom tab.','Caption for Bottom Slider Tab on Home Page',1,'0000-00-00 00:00:00'),(16,'home_specials_sunday','Sunday Special','Bar Special for Sunday',1,'0000-00-00 00:00:00'),(17,'home_specials_monday','Monday Special','Bar Special for Monday',1,'0000-00-00 00:00:00'),(18,'home_specials_tuesday','Tuesday Special','Bar Special for Tuesday',1,'0000-00-00 00:00:00'),(19,'home_specials_wednesday','Wednesday Special','Bar Special for Wednesday',1,'0000-00-00 00:00:00'),(20,'home_specials_thursday','Thursday Special','Bar Special for Thursday',1,'0000-00-00 00:00:00'),(21,'home_specials_friday','Friday Special','Bar Special for Friday',1,'0000-00-00 00:00:00'),(22,'home_specials_saturday','Saturday Special','Bar Special for Saturday',1,'0000-00-00 00:00:00'),(23,'info_phone','(972) 386-4273','Business Phone Number',1,'0000-00-00 00:00:00'),(24,'info_fax','(972) 386-6392','Business Fax Number',1,'0000-00-00 00:00:00'),(25,'footer_hours','open 11am-2am every day | brunch sat. and sun. 11am-3pm','Desciption of Hours of Operation',1,'0000-00-00 00:00:00'),(26,'info_address','5427 Belt Line Rd. Dallas,TX 75254','Business Address',1,'0000-00-00 00:00:00'),(27,'info_business_name','The Hub Sports Bar and Grill','Generic Name of Business for Use Site-Wide',1,'0000-00-00 00:00:00'),(28,'footer_location_description','located in between Studio Movie Grill and Jake\\\'s','Description of Location of Business in Footer',1,'0000-00-00 00:00:00'),(29,'drink_menu','This is the content of the drink menu.','Drink Menu Area (Menus -> Drinks)',0,'0000-00-00 00:00:00'),(30,'contact_page_info','Contact information for Hub staff and web services goes here. Remember to use your < b r / > tag to insert a carriage return and your < h r class=\\\"small_shadow\\\" / > tag to insert a shadowed line! <br /><br />(Remove spaces, obviously :)','Contact Page Text',0,'2010-07-25 06:17:42');
/*!40000 ALTER TABLE `site_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(8) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ip`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ip` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ip`;

--
-- Table structure for table `allocations`
--

DROP TABLE IF EXISTS `allocations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `allocations` (
  `allocation_id` int(20) NOT NULL auto_increment,
  `allocation_size` int(50) unsigned NOT NULL,
  `starting_ip` varchar(50) NOT NULL,
  `ending_ip` varchar(50) NOT NULL,
  `hr_start` varchar(60) NOT NULL,
  `hr_end` varchar(60) NOT NULL,
  `ip_type` enum('4','6') NOT NULL,
  `server_id` varchar(10) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY  (`allocation_id`),
  UNIQUE KEY `starting_ip` (`starting_ip`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `allocations`
--

LOCK TABLES `allocations` WRITE;
/*!40000 ALTER TABLE `allocations` DISABLE KEYS */;
INSERT INTO `allocations` VALUES (6,16,'3232235520','3232235536','192.168.0.0','192.168.0.16','4','1234','0000-00-00 00:00:00'),(7,16,'0819318528491600000000000000000000000000','0819318528491600000000000000000000000016','2001:4860:c008::','2001:4860:c008::10','6','1236','0000-00-00 00:00:00'),(8,16,'3639990016','3639990032','216.245.215.0','216.245.215.016','4','1234','2010-05-01 05:03:20'),(9,16,'3639990032','3639990048','216.245.215.016','216.245.215.032','4','1234','2010-05-01 05:04:44'),(10,16,'3639990048','3639990064','216.245.215.032','216.245.215.048','4','1234','2010-05-01 06:16:33'),(11,16,'3639990080','3639990096','216.245.215.064','216.245.215.080','4','1234','2010-05-02 17:55:12'),(12,16,'3237402624','3237402640','192.246.216.000','192.246.216.016','4','1234','2010-05-02 19:33:28'),(13,16,'0819318528491590000000000000000000000000','0819318544491590000000000000000000000000','2001:4860:c007:0000:0000:0000:0000:0000','2001:4870:c007:0000:0000:0000:0000:0000','4','1234','2010-05-02 19:34:39');
/*!40000 ALTER TABLE `allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `domains` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `master` varchar(128) default NULL,
  `last_check` int(11) default NULL,
  `type` varchar(6) NOT NULL,
  `notified_serial` int(11) default NULL,
  `account` varchar(40) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (2,'test.com','',0,'NATIVE',0,''),(3,'anothertest.com','',0,'MASTER',0,''),(4,'testingtesting.com','',0,'NATIVE',0,'');
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_blocks`
--

DROP TABLE IF EXISTS `ip_blocks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ip_blocks` (
  `block_id` int(20) NOT NULL auto_increment,
  `starting_ip` varchar(50) NOT NULL,
  `ending_ip` varchar(50) NOT NULL,
  `hr_start` varchar(60) NOT NULL,
  `hr_end` varchar(60) NOT NULL,
  `ip_type` enum('4','6') NOT NULL,
  `block_size` int(50) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY  (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ip_blocks`
--

LOCK TABLES `ip_blocks` WRITE;
/*!40000 ALTER TABLE `ip_blocks` DISABLE KEYS */;
INSERT INTO `ip_blocks` VALUES (12,'3232235520','3232235776','192.168.0.0','192.168.1.0','4',256,'2010-04-30 06:50:54'),(14,'3639990016','3639990272','216.245.215.0','216.245.216.0','4',256,'2010-04-30 07:49:51'),(16,'3237402624','3237402880','192.246.216.0','192.246.217.0','4',256,'2010-04-30 08:03:59'),(18,'0819318528491590000000000000000000000000','0819318528491590000000000000000000000000','2001:4860:c007::','2001:4860:c007::','6',65536,'2010-04-30 08:52:19'),(19,'0819318528491600000000000000000000000000','0819318528491600000000000000000000000000','2001:4860:c008::','2001:4860:c008::','6',65536,'2010-04-30 08:55:34'),(21,'0819318528491580000000000000000000000000','0819318528491580000000000000000000100000','2001:4860:c006::','2001:4860:c006::1:0','6',65536,'2010-05-01 06:14:36');
/*!40000 ALTER TABLE `ip_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `records` (
  `id` int(11) NOT NULL auto_increment,
  `domain_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `type` varchar(6) default NULL,
  `content` varchar(255) default NULL,
  `ttl` int(11) default NULL,
  `prio` int(11) default NULL,
  `change_date` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `rec_name_index` (`name`),
  KEY `nametype_index` (`name`,`type`),
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (16,2,'test.com','SOA','localhost ahu@ds9a.nl 1',86400,0,0),(17,2,'test.com','NS','dns-us1.powerdns.net',86400,0,0),(18,2,'test.com','NS','dns-eu1.powerdns.net',86400,0,0),(19,2,'www.test.com','A','199.198.197.196',120,0,0),(20,2,'mail.test.com','A','195.194.193.192',120,0,0),(21,2,'localhost.test.com','A','127.0.0.1',120,0,0),(22,2,'test.com','MX','mail.test.com',120,25,0);
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supermasters`
--

DROP TABLE IF EXISTS `supermasters`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `supermasters` (
  `ip` varchar(25) NOT NULL,
  `nameserver` varchar(255) NOT NULL,
  `account` varchar(40) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `supermasters`
--

LOCK TABLES `supermasters` WRITE;
/*!40000 ALTER TABLE `supermasters` DISABLE KEYS */;
/*!40000 ALTER TABLE `supermasters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jamiemahood`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jamiemahood` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jamiemahood`;

--
-- Table structure for table `contact_image`
--

DROP TABLE IF EXISTS `contact_image`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `contact_image` (
  `img_path` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `contact_image`
--

LOCK TABLES `contact_image` WRITE;
/*!40000 ALTER TABLE `contact_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `galleries` (
  `gallery_id` int(8) NOT NULL auto_increment,
  `gallery_name` varchar(250) NOT NULL,
  `gallery_img_path` varchar(250) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY  (`gallery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Test 1','','2010-07-13 05:44:27'),(2,'Test 2','','2010-07-13 05:44:36');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_image`
--

DROP TABLE IF EXISTS `home_image`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `home_image` (
  `img_path` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `home_image`
--

LOCK TABLES `home_image` WRITE;
/*!40000 ALTER TABLE `home_image` DISABLE KEYS */;
INSERT INTO `home_image` VALUES ('img_2920.jpg');
/*!40000 ALTER TABLE `home_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `images` (
  `image_id` int(8) NOT NULL auto_increment,
  `image_name` varchar(250) NOT NULL,
  `image_path` varchar(250) NOT NULL,
  `thumb_path` varchar(250) NOT NULL,
  `full_width` int(8) NOT NULL,
  `full_height` int(8) NOT NULL,
  `thumb_width` int(8) NOT NULL,
  `thumb_height` int(8) NOT NULL,
  `gallery` int(8) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`image_id`),
  KEY `gallery` (`gallery`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (3,'Jamie','jamie_2.jpg','thumbs/jamie_2.jpg',538,600,157,175,0,'2010-07-13 06:24:38'),(8,'Salvador Dali','fdfsfsd.jpg','thumbs/fdfsfsd.jpg',600,337,175,99,0,'2010-07-14 16:13:16'),(9,'Megan Fox','11111.jpg','thumbs/11111.jpg',600,386,175,113,0,'2010-07-14 16:35:39'),(10,'Mona Lemmy','lemmy.jpg','thumbs/lemmy.jpg',600,478,175,140,0,'2010-07-14 16:38:12'),(11,'Elvis','img_2920.jpg','thumbs/img_2920.jpg',406,600,119,175,0,'2010-07-14 16:39:19'),(12,'Michael Hussar','nghjgjgh.jpg','thumbs/nghjgjgh.jpg',433,600,127,175,0,'2010-07-14 16:40:27'),(13,'Sugar Skull','jackie.jpg','thumbs/jackie.jpg',600,500,175,146,0,'2010-07-14 18:58:18'),(14,'All Seeing Eye','fgghhgfhgf.jpg','thumbs/fgghhgfhgf.jpg',384,600,112,175,0,'2010-07-14 19:38:42'),(15,'Zombie Girl','mahood-jamie-100129-821.jpg','thumbs/mahood-jamie-100129-821.jpg',399,600,117,175,0,'2010-07-14 19:39:39'),(16,'Frida','img_4197.jpg','thumbs/img_4197.jpg',531,600,155,175,0,'2010-07-14 19:44:23'),(17,'Dega','1111111.jpg','thumbs/1111111.jpg',600,512,175,150,0,'2010-07-14 19:51:10'),(18,'Ricky Bobby','ghghg.jpg','thumbs/ghghg.jpg',600,500,175,146,0,'2010-07-17 13:47:52'),(19,'Michael','vbbcbcv.jpg','thumbs/vbbcbcv.jpg',346,600,101,175,0,'2010-08-27 17:28:59'),(20,'Pin-up','gfgdgfdgfd.jpg','thumbs/gfgdgfdgfd.jpg',353,600,103,175,0,'2010-08-27 17:29:59');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_text`
--

DROP TABLE IF EXISTS `site_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `site_text` (
  `text_id` int(5) NOT NULL auto_increment,
  `text_name` varchar(250) NOT NULL,
  `text_content` varchar(10000) NOT NULL,
  `is_visible` int(1) NOT NULL,
  PRIMARY KEY  (`text_id`),
  UNIQUE KEY `text_name` (`text_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `site_text`
--

LOCK TABLES `site_text` WRITE;
/*!40000 ALTER TABLE `site_text` DISABLE KEYS */;
INSERT INTO `site_text` VALUES (1,'home_catchprase','Welcome to JamieMahood.com',1),(2,'home_messagetousers','Relocating to New York in August 2010!\n',1),(3,'home_messagename','Jamie',1),(4,'footer_name','Jamie Mahood',1),(5,'footer_phone','972.467.6757',1),(6,'footer_email','jasnaboudard@hotmail.com',1),(7,'info_header','Thank you for your interest!',1),(8,'info_message','Message me at jasnaboudard@hotmail.com or via this form by entering all your information. ',1),(10,'page_title','Jamie Mahood',1),(11,'info_bio_header','A little bit about Jasna...',1),(12,'info_bio','Bio goes here!',1);
/*!40000 ALTER TABLE `site_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(8) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `jasnaboudard_site`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jasnaboudard_site` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jasnaboudard_site`;

--
-- Table structure for table `contact_image`
--

DROP TABLE IF EXISTS `contact_image`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `contact_image` (
  `img_path` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `contact_image`
--

LOCK TABLES `contact_image` WRITE;
/*!40000 ALTER TABLE `contact_image` DISABLE KEYS */;
INSERT INTO `contact_image` VALUES ('pretty.jpg');
/*!40000 ALTER TABLE `contact_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `galleries` (
  `gallery_id` int(8) NOT NULL auto_increment,
  `gallery_name` varchar(250) NOT NULL,
  `gallery_img_path` varchar(250) NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY  (`gallery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Artwork','','2010-02-19 00:00:00'),(2,'Modeling','','2010-02-19 00:00:00'),(15,'Lucid','thumbs/jamie_flowers2.jpg','2010-02-19 16:01:51'),(16,'Blink','thumbs/anti-gravity.jpg','2010-02-19 16:02:18'),(18,'Canvas','thumbs/alex_avatar.jpg','2010-02-19 16:03:03'),(20,'Amore','thumbs/je_taime2.jpg','2010-04-06 18:26:05'),(21,'Breathe','thumbs/weird_fish.jpg','2010-04-24 12:18:06'),(24,'Sphere','thumbs/glass.jpg','2010-06-21 16:22:53'),(27,'Behavior','thumbs/guitar_guy.jpg','2010-08-29 17:38:56'),(29,'Amnesty','thumbs/quarrymen_copy.jpg','2010-10-13 18:19:37'),(31,'Shine','thumbs/underground1.jpg','2010-10-16 13:05:37');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_image`
--

DROP TABLE IF EXISTS `home_image`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `home_image` (
  `img_path` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `home_image`
--

LOCK TABLES `home_image` WRITE;
/*!40000 ALTER TABLE `home_image` DISABLE KEYS */;
INSERT INTO `home_image` VALUES ('drag3.jpg');
/*!40000 ALTER TABLE `home_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `images` (
  `image_id` int(8) NOT NULL auto_increment,
  `image_name` varchar(250) NOT NULL,
  `image_path` varchar(250) NOT NULL,
  `thumb_path` varchar(250) NOT NULL,
  `full_width` int(8) NOT NULL,
  `full_height` int(8) NOT NULL,
  `thumb_width` int(8) NOT NULL,
  `thumb_height` int(8) NOT NULL,
  `gallery` int(8) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`image_id`),
  KEY `gallery` (`gallery`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`gallery`) REFERENCES `galleries` (`gallery_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (27,'A Single Light ','img_1176.jpg','thumbs/img_1176.jpg',600,451,175,132,1,'2010-02-19 07:30:18'),(29,'Layers Of Friendship','img_1181.jpg','thumbs/img_1181.jpg',407,600,119,175,1,'2010-02-19 07:30:50'),(30,'Captive ','img_1187.jpg','thumbs/img_1187.jpg',600,496,175,145,1,'2010-02-19 07:31:05'),(33,'Sarah','img_1204.jpg','thumbs/img_1204.jpg',600,414,175,121,1,'2010-02-19 07:40:10'),(37,'Bubble World ','img_1216.jpg','thumbs/img_1216.jpg',600,416,175,122,1,'2010-02-19 07:41:21'),(38,'Gannon ','img_1226.jpg','thumbs/img_1226.jpg',600,467,175,137,1,'2010-02-19 07:41:42'),(48,'Itze ','img_1807.jpg','thumbs/img_1807.jpg',600,480,175,140,1,'2010-02-19 07:46:07'),(52,'by Jacob Fakheri','2851_556659677634_25310835_33549239_5073129_n.jpg','thumbs/2851_556659677634_25310835_33549239_5073129_n.jpg',480,600,140,175,2,'2010-02-19 08:08:28'),(56,'by Jacob Fakheri','fav_modeling.jpg','thumbs/fav_modeling.jpg',600,400,175,117,2,'2010-02-19 08:09:03'),(59,'by Thisbe Grace','jaz3.jpg','thumbs/jaz3.jpg',401,600,117,175,2,'2010-02-19 08:10:16'),(72,'Borders','2_jac_leaves.jpg','thumbs/2_jac_leaves.jpg',400,600,117,175,16,'2010-02-19 08:17:11'),(74,'Shade of Autumn','4_erin_nature_1.jpg','thumbs/4_erin_nature_1.jpg',600,403,175,118,16,'2010-02-19 08:17:49'),(75,'Echoes Long Ago','5_brenna_bull4.jpg','thumbs/5_brenna_bull4.jpg',400,600,117,175,16,'2010-02-19 08:19:21'),(76,'La Mère et la Mer','6_mama2.jpg','thumbs/6_mama2.jpg',600,395,175,116,16,'2010-02-19 08:19:49'),(80,'Pearls','10_hannah_lotsa_pearls.jpg','thumbs/10_hannah_lotsa_pearls.jpg',448,600,131,175,16,'2010-02-19 08:25:12'),(88,'The Days to Come','18_shann2.jpg','thumbs/18_shann2.jpg',600,400,175,117,20,'2010-02-19 08:27:48'),(89,'Days of Ice','19_jamie_white_copy.jpg','thumbs/19_jamie_white_copy.jpg',600,400,175,117,15,'2010-02-19 08:27:51'),(93,'Bag Heads','1_creeps_copy.jpg','thumbs/1_creeps_copy.jpg',600,311,175,91,15,'2010-02-19 08:35:30'),(94,'Plastic Beach','2_jamie_points.jpg','thumbs/2_jamie_points.jpg',400,600,117,175,15,'2010-02-19 08:35:37'),(95,'Let The Good Times Rolls','3_heather_mardi_gras.jpg','thumbs/3_heather_mardi_gras.jpg',600,400,175,117,18,'2010-02-19 08:35:46'),(98,'Regardless of what they Say','6_tina_seran_wrap.jpg','thumbs/6_tina_seran_wrap.jpg',300,600,88,175,16,'2010-02-19 08:36:10'),(100,'You Can\'t Handle Love','8_aralyn_dead.jpg','thumbs/8_aralyn_dead.jpg',600,400,175,117,16,'2010-02-19 08:36:28'),(102,'Under the Bridge','10_michelle_park1.jpg','thumbs/10_michelle_park1.jpg',400,600,117,175,16,'2010-02-19 08:38:27'),(105,'360 degrees','13_sonja_red.jpg','thumbs/13_sonja_red.jpg',600,400,175,117,16,'2010-02-19 08:38:53'),(109,'Still Waiting','18_jordan_smoke.jpg','thumbs/18_jordan_smoke.jpg',600,503,175,147,16,'2010-02-19 08:40:13'),(111,'Silent All These Years','erin_sari_set1.jpg','thumbs/erin_sari_set1.jpg',450,600,132,175,16,'2010-02-19 08:41:05'),(113,'Fruitloops ','1_heather1.jpg','thumbs/1_heather1.jpg',600,400,175,117,18,'2010-02-19 08:50:35'),(115,'Hide and Seek','2_brenna_graf2.jpg','thumbs/2_brenna_graf2.jpg',600,400,175,117,15,'2010-02-19 08:50:50'),(116,'Brushstroke','4_megan_fav.jpg','thumbs/4_megan_fav.jpg',406,600,119,175,15,'2010-02-19 08:51:01'),(118,'Peter Pan','7_george_falling.jpg','thumbs/7_george_falling.jpg',421,600,123,175,15,'2010-02-19 08:51:38'),(119,'Caged Bird ','8_camille_cage1.jpg','thumbs/8_camille_cage1.jpg',400,600,117,175,15,'2010-02-19 08:52:29'),(120,'The Healer','6_brenna_water_4.jpg','thumbs/6_brenna_water_4.jpg',600,400,175,117,15,'2010-02-19 08:53:11'),(121,'Escape ','9_itze_bush1.jpg','thumbs/9_itze_bush1.jpg',600,400,175,117,15,'2010-02-19 08:53:15'),(122,'The Crown ','10_jamie_crown.jpg','thumbs/10_jamie_crown.jpg',400,600,117,175,15,'2010-02-19 08:54:33'),(123,'In Full Bloom ','11_itze_florwers1.jpg','thumbs/11_itze_florwers1.jpg',400,600,117,175,15,'2010-02-19 08:55:59'),(124,'Welcome','13_weird_edit_wtf.jpg','thumbs/13_weird_edit_wtf.jpg',600,400,175,117,15,'2010-02-19 08:57:11'),(125,'Some Kind Of Nature','14_alex1.jpg','thumbs/14_alex1.jpg',399,600,117,175,18,'2010-02-19 08:57:15'),(128,'May I Have This Dance','17_tina_bubbles.jpg','thumbs/17_tina_bubbles.jpg',400,600,117,175,15,'2010-02-19 08:58:34'),(141,'The Dreamers','creatures3.jpg','thumbs/creatures3.jpg',400,600,117,175,18,'2010-02-19 17:21:37'),(142,'Breaking at the Seams ','creatures4.jpg','thumbs/creatures4.jpg',400,600,117,175,18,'2010-02-19 17:23:11'),(147,'Pink Floyd ','pink_floyd.jpg','thumbs/pink_floyd.jpg',600,436,175,128,1,'2010-02-19 17:39:12'),(149,'Fragrance','heather_skateboard.jpg','thumbs/heather_skateboard.jpg',600,187,175,55,1,'2010-02-19 17:41:27'),(159,'In Rainbows','rach_curtain1.jpg','thumbs/rach_curtain1.jpg',400,600,117,175,16,'2010-02-19 20:47:10'),(169,'by B.H','_3002924.jpg','thumbs/_3002924.jpg',399,600,117,175,2,'2010-03-03 19:16:19'),(171,'Pagan Poetry ','erin_metal1.jpg','thumbs/erin_metal1.jpg',600,409,175,120,15,'2010-03-03 20:46:22'),(178,'Toucan','shannyn_paint2.jpg','thumbs/shannyn_paint2.jpg',600,400,175,117,18,'2010-03-19 23:13:19'),(180,'by B.H','_3006106.jpg','thumbs/_3006106.jpg',399,600,117,175,2,'2010-03-27 18:13:54'),(181,'Red','hannah_drop1.jpg','thumbs/hannah_drop1.jpg',399,600,117,175,15,'2010-03-28 13:36:03'),(182,'Bicycle','melissa_bike.jpg','thumbs/melissa_bike.jpg',411,600,120,175,16,'2010-04-04 22:55:38'),(191,'Hammered / Perforation','jamie_manekin.jpg','thumbs/jamie_manekin.jpg',600,435,175,127,16,'2010-04-06 18:14:26'),(194,'Egg','lean_nude1_p.jpg','thumbs/lean_nude1_p.jpg',600,381,175,112,15,'2010-04-07 01:39:27'),(197,'by Jim Lively','j.-deconstructing-burnt-orange_.jpg','thumbs/j.-deconstructing-burnt-orange_.jpg',579,600,169,175,2,'2010-04-10 12:44:31'),(204,'Spring Skin','hannah_msht2dsf1.jpg','thumbs/hannah_msht2dsf1.jpg',600,400,175,117,16,'2010-04-12 01:06:01'),(205,'Dread Love','dev_chris12.jpg','thumbs/dev_chris12.jpg',600,409,175,120,20,'2010-04-12 01:07:35'),(212,'by B.H','_3006162b_jaz.jpg','thumbs/_3006162b_jaz.jpg',399,600,117,175,2,'2010-04-13 21:38:25'),(217,'Art on a crushed soda can','can_art.jpg','thumbs/can_art.jpg',400,600,117,175,27,'2010-04-24 12:49:26'),(218,'Diesel and Snoopy','hannah_puppies.jpg','thumbs/hannah_puppies.jpg',413,600,121,175,21,'2010-04-24 12:51:32'),(219,'Potato','potato_plant.jpg','thumbs/potato_plant.jpg',600,400,175,117,21,'2010-04-24 12:51:58'),(221,'Austin at night','austin_night1.jpg','thumbs/austin_night1.jpg',600,390,175,114,24,'2010-04-24 12:55:53'),(225,'Colorful houses in Italy vs. Texas','trio_house_set.jpg','thumbs/trio_house_set.jpg',432,600,126,175,24,'2010-04-24 13:06:06'),(226,'Gondolas in Vegas vs. Venice','gondolas.jpg','thumbs/gondolas.jpg',431,600,126,175,24,'2010-04-24 13:07:23'),(227,'Technicolor','glass.jpg','thumbs/glass.jpg',600,400,175,117,24,'2010-04-24 13:09:29'),(228,'Le Grand Bleu','octopie.jpg','thumbs/octopie.jpg',600,400,175,117,21,'2010-04-24 13:14:26'),(230,'Mauritius','resort1.jpg','thumbs/resort1.jpg',600,400,175,117,24,'2010-04-24 13:28:15'),(232,'Alive','flowers1.jpg','thumbs/flowers1.jpg',600,400,175,117,21,'2010-04-24 13:30:35'),(233,'Good Vibes','weird_fish.jpg','thumbs/weird_fish.jpg',600,400,175,117,21,'2010-04-24 13:30:47'),(241,'by Joshua M.D','_dsc0510_1_11.jpg','thumbs/_dsc0510_1_11.jpg',600,399,175,117,2,'2010-05-02 00:56:33'),(245,'Buddies','elephant_yay2.jpg','thumbs/elephant_yay2.jpg',400,600,117,175,21,'2010-05-02 01:06:47'),(247,'Heads','heads.jpg','thumbs/heads.jpg',600,398,175,116,21,'2010-05-02 01:40:31'),(250,'Red Bull gives you Wings','red_bull_31.jpg','thumbs/red_bull_31.jpg',600,431,175,126,15,'2010-05-15 10:50:47'),(254,'by Dedrick Wright','meoowww1.jpg','thumbs/meoowww1.jpg',600,461,175,135,2,'2010-05-15 11:05:26'),(269,'by Travis Lilley','30491_279487079954_512534954_874221_6273143_n.jpg','thumbs/30491_279487079954_512534954_874221_6273143_n.jpg',400,600,117,175,2,'2010-06-05 23:40:31'),(276,'Spice ','shannyn_paint3.jpg','thumbs/shannyn_paint3.jpg',400,600,117,175,18,'2010-06-06 01:31:05'),(280,'The Right Place','jenny_wallb.jpg','thumbs/jenny_wallb.jpg',600,400,175,117,16,'2010-06-06 23:10:28'),(282,'Scarlett and Penelope','deep_ellum_ladies2.jpg','thumbs/deep_ellum_ladies2.jpg',600,423,175,124,20,'2010-06-15 02:24:17'),(285,'Drawn Together Warm ','dehvon_lines2c.jpg','thumbs/dehvon_lines2c.jpg',600,400,175,117,18,'2010-06-15 17:37:10'),(287,'Drawn Together ','dehvon_lines21.jpg','thumbs/dehvon_lines21.jpg',400,600,117,175,18,'2010-06-15 17:43:21'),(288,'Watch for Wildlife','wildlife.jpg','thumbs/wildlife.jpg',600,388,175,114,21,'2010-06-15 20:29:46'),(291,'A Long Winter','snow_chairs.jpg','thumbs/snow_chairs.jpg',600,400,175,117,24,'2010-06-15 20:38:41'),(293,'by Daniel Driensky','35728_539102314441_196003118_31488510_3618274_n.jpg','thumbs/35728_539102314441_196003118_31488510_3618274_n.jpg',400,600,117,175,2,'2010-06-17 10:15:39'),(297,'Jasna and Erin (assistant/model) at Underground Show','underground1.jpg','thumbs/underground1.jpg',600,400,175,117,31,'2010-06-21 16:26:54'),(298,'Jasna at Jefferson 23 Solo Show','23_show.jpg','thumbs/23_show.jpg',600,400,175,117,31,'2010-06-21 16:29:01'),(299,'Jasna shooting live at Deep Ellum Art Festival','deep_ellum2.jpg','thumbs/deep_ellum2.jpg',600,450,175,132,31,'2010-06-21 16:30:50'),(300,'Jasna\'s submission to Art of Skateboarding ','skateshow1.jpg','thumbs/skateshow1.jpg',600,400,175,117,31,'2010-06-21 16:33:22'),(302,'Flyer for Reve Lucide Solo Show','198.jpg','thumbs/198.jpg',223,600,66,175,31,'2010-06-21 16:38:32'),(303,'Brenna (model) at Reve Lucide Solo Show','aloft_3.jpg','thumbs/aloft_3.jpg',600,400,175,117,31,'2010-06-21 16:40:15'),(305,'Jasna and Jonathon (artist) at Reve Lucide Solo Show','aloft_1.jpg','thumbs/aloft_1.jpg',600,400,175,117,31,'2010-06-21 16:44:52'),(306,'Jasna at Mixed Focus Show','img_8990_2.jpg','thumbs/img_8990_2.jpg',600,458,175,134,31,'2010-06-21 16:55:53'),(307,'Flyer for Padma Solo Show','padma_flyer2.jpg','thumbs/padma_flyer2.jpg',467,600,137,175,31,'2010-06-21 16:57:03'),(313,'Jasna at Padma Solo Show','booya1.jpg','thumbs/booya1.jpg',600,275,175,81,31,'2010-07-04 14:15:56'),(314,'Anti-Gravity','anti-gravity.jpg','thumbs/anti-gravity.jpg',600,421,175,123,15,'2010-07-04 20:18:48'),(318,'Love Rings','i_love_you_rings.jpg','thumbs/i_love_you_rings.jpg',600,400,175,117,20,'2010-07-04 23:02:27'),(322,'Ivy','erica_ivy2.jpg','thumbs/erica_ivy2.jpg',600,400,175,117,16,'2010-07-04 23:09:32'),(323,'Jeans','ke1.jpg','thumbs/ke1.jpg',395,600,115,175,20,'2010-07-04 23:10:39'),(324,'Bride','shann_bride_11.jpg','thumbs/shann_bride_11.jpg',400,600,117,175,20,'2010-07-04 23:22:08'),(325,'Trapped in Marriage','savylee3.jpg','thumbs/savylee3.jpg',400,600,117,175,20,'2010-07-04 23:27:23'),(327,'Volcano','ag_food.jpg','thumbs/ag_food.jpg',600,400,175,117,24,'2010-07-05 00:54:45'),(330,'ZaZa','taylor_dinner.jpg','thumbs/taylor_dinner.jpg',400,600,117,175,16,'2010-07-06 10:40:27'),(332,'Puppet Master','aralyn_puppets.jpg','thumbs/aralyn_puppets.jpg',600,411,175,120,16,'2010-07-14 19:35:45'),(337,'by Travis Lilley','img_0193_wpsize.jpg','thumbs/img_0193_wpsize.jpg',429,600,125,175,2,'2010-07-19 01:31:46'),(343,'By Dan Germain','jasnaoriginal0042swaploresjpgscl1.jpg','thumbs/jasnaoriginal0042swaploresjpgscl1.jpg',453,600,132,175,2,'2010-07-19 02:42:12'),(344,'by Travis Lilley','35216_138112639542983_111054495582131_253712_5730254_n-11.jpg','thumbs/35216_138112639542983_111054495582131_253712_5730254_n-11.jpg',400,600,117,175,2,'2010-07-19 02:42:56'),(353,'Jasna and Aralyn (assistant/model) at Girl Show (night 1)','girlshow3.jpg','thumbs/girlshow3.jpg',600,428,175,125,31,'2010-08-16 23:14:47'),(354,'Jasna at her station for Girl Show (night 2)','girlshow1.jpg','thumbs/girlshow1.jpg',600,506,175,148,31,'2010-08-16 23:15:47'),(355,'Prints on display at Art and Coffee show','artcoffee31.jpg','thumbs/artcoffee31.jpg',600,400,175,117,31,'2010-08-16 23:16:39'),(356,'Jasna\'s entry to Red Bull Art of Can','redbull1.jpg','thumbs/redbull1.jpg',437,600,128,175,31,'2010-08-16 23:18:34'),(358,'Le Noir ','fifi_comic.jpg','thumbs/fifi_comic.jpg',600,450,175,132,18,'2010-08-16 23:59:38'),(362,'Japanese Gum ','38709_148902575125111_100000161097287_490846_3507507_n1.jpg','thumbs/38709_148902575125111_100000161097287_490846_3507507_n1.jpg',425,600,124,175,18,'2010-08-17 00:31:56'),(363,'Lion Tamer','brennajared1.jpg','thumbs/brennajared1.jpg',600,427,175,125,20,'2010-08-17 00:33:19'),(364,'Topsy','rachel_engagement1.jpg','thumbs/rachel_engagement1.jpg',600,410,175,120,20,'2010-08-17 11:49:34'),(365,'Waterlove','tina_water_heart_online.jpg','thumbs/tina_water_heart_online.jpg',491,600,144,175,20,'2010-08-17 11:50:48'),(368,'Woman Behavior','taylor_hands1.jpg','thumbs/taylor_hands1.jpg',600,400,175,117,20,'2010-08-17 12:09:30'),(370,'Unpopular Show','auditorium_seats2.jpg','thumbs/auditorium_seats2.jpg',600,400,175,117,24,'2010-08-29 11:21:17'),(372,'Stare','sheep_stare2.jpg','thumbs/sheep_stare2.jpg',400,600,117,175,21,'2010-08-29 12:10:10'),(376,'Colony','mushrooms2.jpg','thumbs/mushrooms2.jpg',400,600,117,175,21,'2010-08-29 12:50:28'),(377,'Little Green Guy','green_frog21.jpg','thumbs/green_frog21.jpg',600,400,175,117,21,'2010-08-29 12:52:38'),(379,'Cocoon','cocoon.jpg','thumbs/cocoon.jpg',600,394,175,115,21,'2010-08-29 16:42:38'),(380,'Bananas','banana_lady2.jpg','thumbs/banana_lady2.jpg',600,389,175,114,27,'2010-08-29 17:27:25'),(381,'A Little Tune','guitar_guy.jpg','thumbs/guitar_guy.jpg',600,419,175,123,27,'2010-08-29 17:28:45'),(382,'Rehab','rehab.jpg','thumbs/rehab.jpg',600,400,175,117,24,'2010-08-29 17:30:49'),(383,'Scales','dragon1.jpg','thumbs/dragon1.jpg',600,403,175,118,21,'2010-08-29 17:44:23'),(384,'Come Together','hanging_flowers.jpg','thumbs/hanging_flowers.jpg',400,600,117,175,21,'2010-08-29 18:12:34'),(385,'One Main Place','one_main_place.jpg','thumbs/one_main_place.jpg',600,400,175,117,24,'2010-08-29 18:20:47'),(386,'Bambi','bambi2.jpg','thumbs/bambi2.jpg',600,410,175,120,21,'2010-08-29 18:53:13'),(387,'Poas','blue_volcano.jpg','thumbs/blue_volcano.jpg',600,400,175,117,24,'2010-08-29 18:55:57'),(389,'Sleepover','sleepover2.jpg','thumbs/sleepover2.jpg',600,400,175,117,27,'2010-08-29 19:03:30'),(390,'by Chappelle Cummings','jasna_(182).jpg','thumbs/jasna_(182).jpg',402,600,118,175,2,'2010-08-29 19:12:10'),(391,'Everyday Citizens ','clown_couple2.jpg','thumbs/clown_couple2.jpg',600,385,175,113,20,'2010-08-29 19:25:23'),(393,'Breakfast','kaia_egg21.jpg','thumbs/kaia_egg21.jpg',600,406,175,119,16,'2010-09-13 20:08:20'),(394,'Silver City','melissa_robot_cool2.jpg','thumbs/melissa_robot_cool2.jpg',408,600,119,175,15,'2010-09-15 12:21:21'),(395,'Western Eyes','western_eyes.jpg','thumbs/western_eyes.jpg',600,400,175,117,16,'2010-09-15 12:44:20'),(397,'Hard Life','polar_bear.jpg','thumbs/polar_bear.jpg',600,400,175,117,21,'2010-09-15 15:27:55'),(399,'Je t\'aime','je_taime2.jpg','thumbs/je_taime2.jpg',600,443,175,130,20,'2010-09-15 17:16:07'),(401,'Venice','venise_sunset2.jpg','thumbs/venise_sunset2.jpg',600,432,175,126,24,'2010-09-15 17:24:06'),(402,'Wet News','wet_papers2.jpg','thumbs/wet_papers2.jpg',600,436,175,128,24,'2010-09-15 17:29:04'),(403,'Radiohead','radiohead3.jpg','thumbs/radiohead3.jpg',600,400,175,117,24,'2010-09-15 18:46:57'),(404,'Dinner Time','hummingbirds2.jpg','thumbs/hummingbirds2.jpg',600,392,175,115,21,'2010-09-15 23:07:00'),(405,'Heaven can Wait','jamie_flowers2.jpg','thumbs/jamie_flowers2.jpg',600,406,175,119,15,'2010-09-15 23:12:09'),(407,'Curves and Lines','curves_and_lines1.jpg','thumbs/curves_and_lines1.jpg',600,450,175,132,16,'2010-09-15 23:26:47'),(409,'by Leroy Roper','color.jpeg','thumbs/color.jpeg',600,450,175,132,2,'2010-09-24 14:16:04'),(414,'by Fred Langstaff','bendy_jaz2.jpg','thumbs/bendy_jaz2.jpg',402,600,118,175,2,'2010-09-28 20:19:16'),(419,'by Gene Hale','hale12.jpg','thumbs/hale12.jpg',400,600,117,175,2,'2010-09-28 20:27:31'),(420,'by Duncan Hall','_mg_3032-as-smart-object-1-1.jpg','thumbs/_mg_3032-as-smart-object-1-1.jpg',400,600,117,175,2,'2010-10-08 12:23:43'),(421,'Amnesty\'s Maternal Death Clock rally in Times Square','maternal_dc_copy.jpg','thumbs/maternal_dc_copy.jpg',600,411,175,120,29,'2010-10-13 18:23:06'),(422,'Salil Shetty, Secretary General of Amnesty International','shetty_copy.jpg','thumbs/shetty_copy.jpg',400,600,117,175,29,'2010-10-13 18:28:21'),(424,'Lobsang Nyandak, the representative of His Holiness the Dalai Lama','dali_lama_copy.jpg','thumbs/dali_lama_copy.jpg',400,600,117,175,29,'2010-10-13 18:36:58'),(425,'Director Ngawang Choephel with Ms. World and guest, at the film premier of Tibet in Song','tibet_song_copy.jpg','thumbs/tibet_song_copy.jpg',600,400,175,117,29,'2010-10-13 18:40:53'),(426,'Sam Taylor-Wood and Aaron Johnson at the USA film premier for Nowhere Boy','sam_aaron_copy.jpg','thumbs/sam_aaron_copy.jpg',600,417,175,122,29,'2010-10-13 18:42:19'),(427,'Willie Nile and the Quarrymen, former band of John Lennon','quarrymen_copy.jpg','thumbs/quarrymen_copy.jpg',600,435,175,127,29,'2010-10-13 18:43:41'),(428,'Sandee Borgman, Larry Cox, Amber Heard and friend','donor_party_copy.jpg','thumbs/donor_party_copy.jpg',600,400,175,117,29,'2010-10-13 18:51:15'),(430,'Poetry Slam event for Amnesty International','poetry_slam2_copy.jpg','thumbs/poetry_slam2_copy.jpg',600,400,175,117,29,'2010-10-13 18:59:28'),(431,'Garland Jeffreys at Happy Birthday John benefit concert','garland_jeffreys_copy1.jpg','thumbs/garland_jeffreys_copy1.jpg',600,400,175,117,29,'2010-10-13 19:00:18'),(432,'Pete Seeger, Mark Hudson, and Thom Wolke at Happy Birthday John','pete_seeger_copy.jpg','thumbs/pete_seeger_copy.jpg',600,400,175,117,29,'2010-10-13 19:01:28'),(433,'Chris from Never Shout Never performing at Happy Birthday John','never_shout_copy.jpg','thumbs/never_shout_copy.jpg',400,600,117,175,29,'2010-10-13 19:02:26'),(434,'Recycle','brenna_tree4.jpg','thumbs/brenna_tree4.jpg',384,600,112,175,15,'2010-10-15 01:11:39'),(439,'Sparkles','alex_sparkles1.jpg','thumbs/alex_sparkles1.jpg',600,400,175,117,15,'2010-10-15 18:30:49'),(440,'Lazy River','alex_avatar.jpg','thumbs/alex_avatar.jpg',600,418,175,122,18,'2010-10-15 19:29:37'),(441,'Neon Duet','creatures1b.jpg','thumbs/creatures1b.jpg',600,400,175,117,18,'2010-10-15 19:44:14'),(442,'Rouge et Bleu','blacklight_favs.jpg','thumbs/blacklight_favs.jpg',450,600,132,175,18,'2010-10-15 19:52:31'),(444,'Chosen','blit_brenna3b.jpg','thumbs/blit_brenna3b.jpg',400,600,117,175,18,'2010-10-15 20:16:56'),(448,'Carnival','carnival1b2.jpg','thumbs/carnival1b2.jpg',600,512,175,150,16,'2010-10-15 21:09:16'),(449,'Eastern Dance','aralyn_smoke31.jpg','thumbs/aralyn_smoke31.jpg',600,418,175,122,15,'2010-10-15 21:18:32'),(452,'Neighbor','aralyn_bunnyb2.jpg','thumbs/aralyn_bunnyb2.jpg',600,433,175,127,16,'2010-10-15 21:31:30'),(454,'Cherry Blossoms','cherry_blossom.jpg','thumbs/cherry_blossom.jpg',600,496,175,145,1,'2010-10-16 11:34:58'),(455,'Rice Fields','rice_fields.jpg','thumbs/rice_fields.jpg',600,475,175,139,1,'2010-10-16 11:57:42'),(456,'Frequency','frequency.jpg','thumbs/frequency.jpg',446,600,130,175,1,'2010-10-16 11:59:38'),(457,'Jazz','jazz.jpg','thumbs/jazz.jpg',490,600,143,175,1,'2010-10-16 12:01:37'),(458,'Plano','plano_house.jpg','thumbs/plano_house.jpg',442,600,129,175,1,'2010-10-16 12:03:58'),(459,'Ladyscape','ladyscape.jpg','thumbs/ladyscape.jpg',416,600,122,175,1,'2010-10-16 12:06:41'),(460,'Fowler','blue_giraffes1.jpg','thumbs/blue_giraffes1.jpg',600,488,175,143,1,'2010-10-16 12:09:55'),(462,'Exhibition','exhibition.jpg','thumbs/exhibition.jpg',439,600,128,175,1,'2010-10-16 12:11:25'),(463,'Dallas','dallas1.jpg','thumbs/dallas1.jpg',600,412,175,121,1,'2010-10-16 12:21:39'),(464,'Torn Memory ','torn_memory.jpg','thumbs/torn_memory.jpg',600,471,175,138,1,'2010-10-16 12:22:24'),(465,'New Hope, Pennsylvania','fancy_car.jpg','thumbs/fancy_car.jpg',600,400,175,117,27,'2010-10-16 13:19:34'),(466,'Nom Nom','fifi_paint3_blue.jpg','thumbs/fifi_paint3_blue.jpg',400,600,117,175,18,'2010-10-16 16:50:50'),(467,'Music Box','tiffany_music_box.jpg','thumbs/tiffany_music_box.jpg',400,600,117,175,15,'2010-10-16 16:54:13'),(469,'Lobster','lobster_lady2.jpg','thumbs/lobster_lady2.jpg',600,513,175,150,27,'2010-10-20 13:15:56'),(470,'Life is Beachy','beach_scene2.jpg','thumbs/beach_scene2.jpg',600,385,175,113,27,'2010-10-20 13:25:10'),(474,'Drag','drag3.jpg','thumbs/drag3.jpg',600,400,175,117,20,'2010-11-04 01:19:22'),(476,'Fruity','fruit_heads1.jpg','thumbs/fruit_heads1.jpg',600,407,175,119,27,'2010-11-04 01:49:55'),(478,'Pretty Pink','drag22.jpg','thumbs/drag22.jpg',600,408,175,119,18,'2010-11-04 14:48:59'),(482,'Zebra','drag3b.jpg','thumbs/drag3b.jpg',600,400,175,117,18,'2010-11-04 21:47:12');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_text`
--

DROP TABLE IF EXISTS `site_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `site_text` (
  `text_id` int(5) NOT NULL auto_increment,
  `text_name` varchar(250) NOT NULL,
  `text_content` varchar(10000) NOT NULL,
  `is_visible` int(1) NOT NULL,
  PRIMARY KEY  (`text_id`),
  UNIQUE KEY `text_name` (`text_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `site_text`
--

LOCK TABLES `site_text` WRITE;
/*!40000 ALTER TABLE `site_text` DISABLE KEYS */;
INSERT INTO `site_text` VALUES (1,'home_catchprase','Bienvenue to Jasna Boudard',1),(2,'home_messagetousers','What is being awake if not interpreting our dreams, or dreaming if not interpreting our wake?',1),(3,'home_messagename','Jasna',1),(4,'footer_name','Jasna Boudard',1),(5,'footer_phone','972.467.6757',1),(6,'footer_email','jasnaboudard@hotmail.com',1),(7,'info_header','Thank you for your interest!',1),(8,'info_message','Please contact via this form by entering all your information. ',1),(10,'page_title','Jasna Boudard',1),(11,'info_bio_header','A little bit about Jasna...',1),(12,'info_bio','Born in France and living in the United States, photographer, artist, and model Jasna Boudard has made her mark in all three disciplines through her often-startling creative vision, artistic versatility, and her ability to combine media in ways that one critic described as \\\"helping us see beyond seeing.\\\" <br/>\nMeticulous about her craft, Jasna directs, designs, styles, and post-edits her own work. Her style combines a sometimes sensual, sometimes whimsical exploration of the female body in contexts ranging from dreamscape to the gritty urban. Shooting and exhibiting throughout America with much success, Jasna has some new projects in store for the rest of the world. She is currently based in New York and working as an event photographer for world-renowned Amnesty International, and as a photo retoucher for photographer Steve McCurry.\n<hr />\n<b>Awards and Art/Photo Exhibitions in the USA: </b>\n<br />\n\\\"Red Bull Art of Can\\\"- Art Exhibition, July 2010 <br />\n\\\"Girl Show\\\"- Art Exhibition & Live Runway Shoot, July 2010 <br />\n\\\"Padma\\\"- Solo Photography Show, July 2010 <br />\n\\\"Art and Coffee\\\"- Art Exhibition, July 2010 <br />\n\\\"Mixed Focus\\\"- Photography Exhibition, June 2010<br />\n\\\"Reve Lucide\\\"- Solo Photography Show at A-loft Hotel, May 2010 <br />\n\\\"Deep Ellum Arts Festival\\\"- Live Photoshoot, April 2010 <br />\n\\\"Jefferson 23\\\"- Solo Photography Show, March 2010 <br />\n\\\"Underground\\\"- Art Exhibition, January 2010 <br />\n\\\"The Art of Skateboarding\\\"- Art Exhibition, November 2009 <br />\n\\\"Kettle Art\\\"- Art Exhibition, October 2009 <br />\n\\\"Gold Key Award\\\"- Scholastic Arts, 2005 <br />\n<hr />\n<b>Published in: </b><br />\nThe Dallas Observer, 2010<br />\nA+C Magazine, 2009 & 2010<br />\nQuick Magazine, 2010 <br />\nCrave Magazine, 2010 <br />\nSojourn, Vol. 19, 2006<br />\n<hr />\n<b>Photography Clients: </b><br />\nAmnesty International (numerous events), 2010<br/>\n\\\"Happy Birthday John (Lennon)\\\" Concert, October 2010<br/>\nFilm Premier of \\\"Tibet in Song\\\", September 2010<br />\nFilm Premier of \\\"Nowhere Boy\\\", September 2010<br />\n<hr />',1);
/*!40000 ALTER TABLE `site_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `users` (
  `id` int(8) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `meetme`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `meetme` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `meetme`;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `booking` (
  `bookId` int(10) unsigned NOT NULL auto_increment,
  `clientId` int(10) unsigned default '0',
  `roomNo` varchar(30) default '0',
  `roomPass` varchar(30) NOT NULL default '0',
  `silPass` varchar(30) NOT NULL default '0',
  `startTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `endTime` datetime NOT NULL default '0000-00-00 00:00:00',
  `dateReq` datetime NOT NULL default '0000-00-00 00:00:00',
  `dateMod` datetime NOT NULL default '0000-00-00 00:00:00',
  `maxUser` varchar(30) NOT NULL default '10',
  `status` varchar(30) NOT NULL default 'A',
  `confOwner` varchar(30) NOT NULL default '',
  `confDesc` varchar(100) NOT NULL default '',
  `aFlags` varchar(10) NOT NULL default '',
  `uFlags` varchar(10) NOT NULL default '',
  `sequenceNo` int(10) unsigned default '0',
  `recurInterval` int(10) unsigned default '0',
  PRIMARY KEY  (`bookId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdr`
--

DROP TABLE IF EXISTS `cdr`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cdr` (
  `bookId` int(11) default NULL,
  `duration` varchar(12) default NULL,
  `CIDnum` varchar(32) default NULL,
  `CIDname` varchar(32) default NULL,
  `jointime` datetime default NULL,
  `leavetime` timestamp NULL default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cdr`
--

LOCK TABLES `cdr` WRITE;
/*!40000 ALTER TABLE `cdr` DISABLE KEYS */;
/*!40000 ALTER TABLE `cdr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `book_id` int(11) NOT NULL default '0',
  `ntype` char(10) default NULL,
  `ndate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `participants` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `book_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(100) NOT NULL default '',
  `password` varchar(25) default NULL,
  `first_name` varchar(50) default NULL,
  `last_name` varchar(50) default NULL,
  `telephone` varchar(15) default NULL,
  `admin` varchar(5) NOT NULL default 'User',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'wmm@localhost','wmmpw','Web','MeetMe','1234','Admin'),(2,'tim@localhost','1234','Tim','Yardley','','User');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `columns_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Table_name` char(64) collate utf8_bin NOT NULL default '',
  `Column_name` char(64) collate utf8_bin NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') character set utf8 NOT NULL default '',
  PRIMARY KEY  (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `db` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  PRIMARY KEY  (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('%','test','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N'),('%','test\\_%','','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','N','N'),('localhost','asteriskcdrdb','asteriskuser','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','asteriskrealtime','asteriskuser','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','endpoints','asteriskuser','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','asterisk','asteriskuser','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','asterisk','astreal','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','asteriskcdrdb','astreal','Y','N','N','N','N','N','N','N','N','N','N','N','N','Y','N','N','N'),('localhost','asteriskrealtime','astreal','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','you-niquegarters','you-niquegarters','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('localhost','protect','protect','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('%','gazelle\\_enhanced','gazelle_remote','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),('%','jasnaboudard\\_site','jasnaboudard','Y','Y','Y','Y','Y','Y','N','N','Y','Y','Y','N','Y','Y','Y','Y','Y'),('%','jamiemahood','jasnaboudard','Y','Y','Y','Y','Y','Y','N','N','Y','Y','Y','N','Y','Y','Y','Y','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `func` (
  `name` char(64) collate utf8_bin NOT NULL default '',
  `ret` tinyint(1) NOT NULL default '0',
  `dl` char(128) collate utf8_bin NOT NULL default '',
  `type` enum('function','aggregate') character set utf8 NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned default NULL,
  `url` char(128) NOT NULL,
  PRIMARY KEY  (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help categories';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` VALUES (1,'Geographic',0,''),(2,'Polygon properties',31,''),(3,'WKT',31,''),(4,'Numeric Functions',35,''),(5,'MBR',31,''),(6,'Control flow functions',35,''),(7,'Transactions',32,''),(8,'Account Management',32,''),(9,'Point properties',31,''),(10,'Encryption Functions',35,''),(11,'LineString properties',31,''),(12,'Logical operators',35,''),(13,'Miscellaneous Functions',35,''),(14,'Information Functions',35,''),(15,'Functions and Modifiers for Use with GROUP BY',32,''),(16,'Comparison operators',35,''),(17,'Bit Functions',35,''),(18,'Table Maintenance',32,''),(19,'Data Types',32,''),(20,'User-Defined Functions',32,''),(21,'Compound Statements',32,''),(22,'Geometry constructors',31,''),(23,'GeometryCollection properties',1,''),(24,'Administration',32,''),(25,'Data Manipulation',32,''),(26,'Utility',32,''),(27,'Language Structure',32,''),(28,'Geometry relations',31,''),(29,'Date and Time Functions',35,''),(30,'WKB',31,''),(31,'Geographic Features',32,''),(32,'Contents',0,''),(33,'Geometry properties',31,''),(34,'String Functions',35,''),(35,'Functions',32,''),(36,'Data Definition',32,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY  (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help keywords';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (0,'JOIN'),(1,'REPEAT'),(2,'SERIALIZABLE'),(3,'REPLACE'),(4,'RETURNS'),(5,'MASTER_SSL_CA'),(6,'NCHAR'),(7,'COLUMNS'),(8,'WORK'),(9,'DATETIME'),(10,'MODE'),(11,'OPEN'),(12,'INTEGER'),(13,'ESCAPE'),(14,'VALUE'),(15,'SQL_BIG_RESULT'),(16,'DROP'),(17,'GEOMETRYCOLLECTIONFROMWKB'),(18,'EVENTS'),(19,'MONTH'),(20,'INFO'),(21,'PROFILES'),(22,'DUPLICATE'),(23,'REPLICATION'),(24,'UNLOCK'),(25,'INNODB'),(26,'YEAR_MONTH'),(27,'SUBJECT'),(28,'PREPARE'),(29,'LOCK'),(30,'NDB'),(31,'CHECK'),(32,'FULL'),(33,'INT4'),(34,'BY'),(35,'NO'),(36,'MINUTE'),(37,'DATA'),(38,'DAY'),(39,'SHARE'),(40,'REAL'),(41,'SEPARATOR'),(42,'DELETE'),(43,'ON'),(44,'CONNECTION'),(45,'CLOSE'),(46,'X509'),(47,'USE'),(48,'WHERE'),(49,'PRIVILEGES'),(50,'SPATIAL'),(51,'SUPER'),(52,'SQL_BUFFER_RESULT'),(53,'IGNORE'),(54,'QUICK'),(55,'SIGNED'),(56,'SECURITY'),(57,'NDBCLUSTER'),(58,'POLYGONFROMWKB'),(59,'FALSE'),(60,'LEVEL'),(61,'FORCE'),(62,'BINARY'),(63,'TO'),(64,'CHANGE'),(65,'HOUR_MINUTE'),(66,'UPDATE'),(67,'INTO'),(68,'FEDERATED'),(69,'VARYING'),(70,'HOUR_SECOND'),(71,'VARIABLE'),(72,'ROLLBACK'),(73,'RTREE'),(74,'PROCEDURE'),(75,'TIMESTAMP'),(76,'IMPORT'),(77,'AGAINST'),(78,'CHECKSUM'),(79,'COUNT'),(80,'LONGBINARY'),(81,'THEN'),(82,'INSERT'),(83,'ENGINES'),(84,'HANDLER'),(85,'DAY_SECOND'),(86,'EXISTS'),(87,'MUTEX'),(88,'RELEASE'),(89,'BOOLEAN'),(90,'MOD'),(91,'DEFAULT'),(92,'TYPE'),(93,'NO_WRITE_TO_BINLOG'),(94,'OPTIMIZE'),(95,'RESET'),(96,'ITERATE'),(97,'DO'),(98,'BIGINT'),(99,'SET'),(100,'ISSUER'),(101,'DATE'),(102,'STATUS'),(103,'FULLTEXT'),(104,'COMMENT'),(105,'MASTER_CONNECT_RETRY'),(106,'INNER'),(107,'STOP'),(108,'MASTER_LOG_FILE'),(109,'MRG_MYISAM'),(110,'PRECISION'),(111,'REQUIRE'),(112,'TRAILING'),(113,'LONG'),(114,'OPTION'),(115,'ELSE'),(116,'DEALLOCATE'),(117,'IO_THREAD'),(118,'CASE'),(119,'CIPHER'),(120,'CONTINUE'),(121,'FROM'),(122,'READ'),(123,'LEFT'),(124,'ELSEIF'),(125,'MINUTE_SECOND'),(126,'COMPACT'),(127,'RESTORE'),(128,'DEC'),(129,'FOR'),(130,'WARNINGS'),(131,'MIN_ROWS'),(132,'CONDITION'),(133,'STRING'),(134,'ENCLOSED'),(135,'FUNCTION'),(136,'AGGREGATE'),(137,'FIELDS'),(138,'INT3'),(139,'ARCHIVE'),(140,'AVG_ROW_LENGTH'),(141,'ADD'),(142,'KILL'),(143,'FLOAT4'),(144,'VIEW'),(145,'REPEATABLE'),(146,'INFILE'),(147,'ORDER'),(148,'USING'),(149,'MIDDLEINT'),(150,'GRANT'),(151,'UNSIGNED'),(152,'DECIMAL'),(153,'GEOMETRYFROMTEXT'),(154,'INDEXES'),(155,'FOREIGN'),(156,'CACHE'),(157,'HOSTS'),(158,'COMMIT'),(159,'SCHEMAS'),(160,'LEADING'),(161,'SNAPSHOT'),(162,'DECLARE'),(163,'LOAD'),(164,'SQL_CACHE'),(165,'CONVERT'),(166,'DYNAMIC'),(167,'COLLATE'),(168,'POLYGONFROMTEXT'),(169,'BYTE'),(170,'GLOBAL'),(171,'LINESTRINGFROMWKB'),(172,'BERKELEYDB'),(173,'WHEN'),(174,'HAVING'),(175,'AS'),(176,'STARTING'),(177,'RELOAD'),(178,'AUTOCOMMIT'),(179,'REVOKE'),(180,'GRANTS'),(181,'OUTER'),(182,'FLOOR'),(183,'EXPLAIN'),(184,'WITH'),(185,'AFTER'),(186,'STD'),(187,'CSV'),(188,'DISABLE'),(189,'OUTFILE'),(190,'LOW_PRIORITY'),(191,'FILE'),(192,'BDB'),(193,'SCHEMA'),(194,'SONAME'),(195,'POW'),(196,'MULTIPOINTFROMWKB'),(197,'INDEX'),(198,'DUAL'),(199,'BACKUP'),(200,'MULTIPOINTFROMTEXT'),(201,'EXTENDED'),(202,'MULTILINESTRINGFROMWKB'),(203,'CROSS'),(204,'NATIONAL'),(205,'GROUP'),(206,'SHA'),(207,'UNDO'),(208,'ZEROFILL'),(209,'CLIENT'),(210,'MASTER_PASSWORD'),(211,'RELAY_LOG_FILE'),(212,'TRUE'),(213,'CHARACTER'),(214,'MASTER_USER'),(215,'TABLE'),(216,'ENGINE'),(217,'INSERT_METHOD'),(218,'CASCADE'),(219,'RELAY_LOG_POS'),(220,'SQL_CALC_FOUND_ROWS'),(221,'UNION'),(222,'MYISAM'),(223,'LEAVE'),(224,'MODIFY'),(225,'MATCH'),(226,'MASTER_LOG_POS'),(227,'DESC'),(228,'DISTINCTROW'),(229,'TIME'),(230,'NUMERIC'),(231,'EXPANSION'),(232,'CURSOR'),(233,'CODE'),(234,'GEOMETRYCOLLECTIONFROMTEXT'),(235,'CHAIN'),(236,'FLUSH'),(237,'CREATE'),(238,'DESCRIBE'),(239,'MAX_UPDATES_PER_HOUR'),(240,'INT2'),(241,'PROCESSLIST'),(242,'LOGS'),(243,'HEAP'),(244,'SOUNDS'),(245,'BETWEEN'),(246,'REPAIR'),(247,'MULTILINESTRINGFROMTEXT'),(248,'PACK_KEYS'),(249,'FAST'),(250,'CALL'),(251,'VALUES'),(252,'LOOP'),(253,'VARCHARACTER'),(254,'BEFORE'),(255,'TRUNCATE'),(256,'SHOW'),(257,'REDUNDANT'),(258,'ALL'),(259,'USER_RESOURCES'),(260,'PARTIAL'),(261,'BINLOG'),(262,'END'),(263,'SECOND'),(264,'AND'),(265,'FLOAT8'),(266,'PREV'),(267,'HOUR'),(268,'SELECT'),(269,'DATABASES'),(270,'OR'),(271,'IDENTIFIED'),(272,'MASTER_SSL_CIPHER'),(273,'SQL_SLAVE_SKIP_COUNTER'),(274,'BOTH'),(275,'BOOL'),(276,'YEAR'),(277,'MASTER_PORT'),(278,'CONCURRENT'),(279,'HELP'),(280,'UNIQUE'),(281,'TRIGGERS'),(282,'PROCESS'),(283,'CONSISTENT'),(284,'MASTER_SSL'),(285,'DATE_ADD'),(286,'MAX_CONNECTIONS_PER_HOUR'),(287,'LIKE'),(288,'FETCH'),(289,'IN'),(290,'COLUMN'),(291,'DUMPFILE'),(292,'USAGE'),(293,'EXECUTE'),(294,'MEMORY'),(295,'CEIL'),(296,'QUERY'),(297,'MASTER_HOST'),(298,'LINES'),(299,'SQL_THREAD'),(300,'MAX_QUERIES_PER_HOUR'),(301,'MASTER_SSL_CERT'),(302,'MULTIPOLYGONFROMWKB'),(303,'TRANSACTION'),(304,'DAY_MINUTE'),(305,'STDDEV'),(306,'DATE_SUB'),(307,'GEOMETRYFROMWKB'),(308,'INT1'),(309,'RENAME'),(310,'RIGHT'),(311,'ALTER'),(312,'MAX_ROWS'),(313,'STRAIGHT_JOIN'),(314,'NATURAL'),(315,'VARIABLES'),(316,'ESCAPED'),(317,'SHA1'),(318,'PASSWORD'),(319,'CHAR'),(320,'OFFSET'),(321,'NEXT'),(322,'SQL_LOG_BIN'),(323,'ERRORS'),(324,'TEMPORARY'),(325,'COMMITTED'),(326,'SQL_SMALL_RESULT'),(327,'UPGRADE'),(328,'BEGIN'),(329,'DELAY_KEY_WRITE'),(330,'PROFILE'),(331,'MEDIUM'),(332,'INTERVAL'),(333,'SSL'),(334,'DAY_HOUR'),(335,'REFERENCES'),(336,'AES_ENCRYPT'),(337,'STORAGE'),(338,'ISOLATION'),(339,'CEILING'),(340,'INT8'),(341,'RESTRICT'),(342,'UNCOMMITTED'),(343,'LINESTRINGFROMTEXT'),(344,'IS'),(345,'NOT'),(346,'ANALYSE'),(347,'DES_KEY_FILE'),(348,'COMPRESSED'),(349,'START'),(350,'SAVEPOINT'),(351,'IF'),(352,'PRIMARY'),(353,'PURGE'),(354,'USER'),(355,'INNOBASE'),(356,'LAST'),(357,'EXIT'),(358,'KEYS'),(359,'LIMIT'),(360,'KEY'),(361,'MERGE'),(362,'UNTIL'),(363,'SQL_NO_CACHE'),(364,'DELAYED'),(365,'ANALYZE'),(366,'CONSTRAINT'),(367,'SERIAL'),(368,'ACTION'),(369,'WRITE'),(370,'SESSION'),(371,'DATABASE'),(372,'NULL'),(373,'POWER'),(374,'USE_FRM'),(375,'SLAVE'),(376,'TERMINATED'),(377,'NVARCHAR'),(378,'ASC'),(379,'RETURN'),(380,'ENABLE'),(381,'OPTIONALLY'),(382,'DIRECTORY'),(383,'WHILE'),(384,'MAX_USER_CONNECTIONS'),(385,'DISTINCT'),(386,'AES_DECRYPT'),(387,'LOCAL'),(388,'MASTER_SSL_KEY'),(389,'NONE'),(390,'TABLES'),(391,'<>'),(392,'RLIKE'),(393,'TRIGGER'),(394,'COLLATION'),(395,'SHUTDOWN'),(396,'HIGH_PRIORITY'),(397,'BTREE'),(398,'FIRST'),(399,'TYPES'),(400,'MASTER'),(401,'FIXED'),(402,'MULTIPOLYGONFROMTEXT'),(403,'ROW_FORMAT');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`help_keyword_id`,`help_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='keyword-topic relation';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` VALUES (1,0),(341,0),(218,1),(427,2),(3,3),(402,3),(88,4),(176,5),(410,6),(17,7),(333,7),(402,7),(135,8),(216,9),(80,10),(341,10),(13,11),(97,11),(123,11),(333,11),(88,12),(476,12),(364,13),(3,14),(95,14),(229,14),(341,15),(26,16),(29,16),(79,16),(177,16),(223,16),(250,16),(263,16),(317,16),(390,16),(398,16),(441,16),(99,17),(113,18),(360,19),(246,20),(74,21),(95,22),(188,23),(31,24),(333,25),(385,25),(446,25),(360,26),(188,27),(30,28),(223,28),(31,29),(341,29),(446,30),(399,31),(446,31),(17,32),(281,32),(333,32),(431,32),(446,32),(476,33),(42,34),(69,34),(75,34),(188,34),(341,34),(347,34),(402,34),(441,34),(446,34),(446,35),(450,35),(360,36),(108,37),(402,37),(446,37),(360,38),(341,39),(88,40),(300,40),(347,41),(42,42),(446,42),(450,42),(1,43),(450,43),(165,44),(446,44),(45,45),(97,45),(188,46),(1,47),(49,47),(42,48),(75,48),(97,48),(182,49),(188,49),(235,49),(198,50),(441,50),(188,51),(341,52),(1,53),(75,53),(95,53),(341,53),(402,53),(441,53),(42,54),(399,54),(444,54),(216,55),(188,56),(446,57),(82,58),(458,58),(369,59),(427,60),(1,61),(33,62),(216,62),(256,62),(176,63),(256,63),(439,63),(176,64),(441,64),(360,65),(75,66),(95,66),(341,66),(450,66),(3,67),(95,67),(290,67),(341,67),(446,68),(243,69),(360,70),(120,71),(135,72),(439,72),(198,73),(14,74),(175,74),(288,74),(314,74),(333,74),(341,74),(398,74),(419,74),(464,74),(90,75),(179,75),(402,76),(80,77),(386,78),(446,78),(61,79),(315,79),(413,79),(273,80),(24,81),(51,81),(77,81),(95,82),(183,82),(287,82),(462,82),(269,83),(333,83),(97,84),(299,84),(360,85),(26,86),(144,86),(177,86),(263,86),(270,87),(333,87),(135,88),(439,88),(20,89),(80,89),(103,90),(164,90),(3,91),(95,91),(144,91),(187,91),(200,91),(229,91),(441,91),(446,91),(441,92),(446,92),(105,93),(313,93),(444,93),(448,93),(105,94),(32,95),(109,95),(140,95),(251,95),(115,96),(116,97),(472,97),(209,98),(3,99),(75,99),(95,99),(120,99),(128,99),(135,99),(144,99),(172,99),(200,99),(319,99),(402,99),(441,99),(446,99),(450,99),(454,99),(470,99),(188,100),(122,101),(216,101),(249,101),(360,101),(52,102),(126,102),(203,102),(211,102),(270,102),(314,102),(322,102),(333,102),(351,102),(385,102),(198,103),(441,103),(446,103),(446,104),(176,105),(1,106),(46,107),(176,108),(446,109),(300,110),(188,111),(435,112),(273,113),(188,114),(235,114),(51,115),(77,115),(223,116),(46,117),(310,117),(51,118),(77,118),(188,119),(299,120),(42,121),(108,121),(113,121),(333,121),(341,121),(345,121),(435,121),(31,122),(97,122),(427,122),(1,123),(24,124),(360,125),(446,126),(169,127),(197,128),(170,129),(299,129),(333,129),(341,129),(401,129),(315,130),(333,130),(446,131),(170,132),(88,133),(402,134),(29,135),(60,135),(88,135),(199,135),(219,135),(288,135),(322,135),(333,135),(377,135),(390,135),(398,135),(88,136),(333,137),(402,137),(238,138),(446,139),(441,140),(446,140),(54,141),(441,141),(165,142),(158,143),(26,144),(148,144),(434,144),(427,145),(402,146),(42,147),(75,147),(341,147),(347,147),(441,147),(1,148),(42,148),(78,148),(238,149),(188,150),(235,150),(20,151),(119,151),(158,151),(197,151),(216,151),(300,151),(476,151),(88,152),(145,152),(216,152),(395,153),(333,154),(441,155),(446,155),(450,155),(92,156),(140,156),(290,156),(134,157),(333,157),(135,158),(149,159),(333,159),(435,160),(135,161),(170,162),(187,162),(299,162),(401,162),(108,163),(290,163),(345,163),(402,163),(341,164),(216,165),(361,165),(446,166),(144,167),(200,167),(446,167),(379,168),(443,169),(120,170),(126,170),(172,170),(335,170),(427,170),(432,171),(446,172),(51,173),(77,173),(341,174),(1,175),(31,175),(341,175),(402,176),(188,177),(135,178),(235,179),(181,180),(333,180),(1,181),(209,182),(241,183),(80,184),(188,184),(441,185),(247,186),(402,187),(446,187),(441,188),(341,189),(3,190),(31,190),(42,190),(75,190),(95,190),(402,190),(188,191),(155,192),(446,192),(144,193),(177,193),(200,193),(295,193),(333,193),(88,194),(264,195),(442,196),(1,197),(54,197),(79,197),(92,197),(198,197),(290,197),(294,197),(333,197),(441,197),(446,197),(266,198),(343,199),(405,200),(241,201),(444,201),(259,202),(1,203),(243,204),(410,204),(341,205),(407,206),(299,207),(20,208),(119,208),(158,208),(197,208),(300,208),(476,208),(188,209),(176,210),(176,211),(369,212),(144,213),(200,213),(243,213),(319,213),(402,213),(410,213),(446,213),(176,214),(54,215),(100,215),(105,215),(169,215),(203,215),(263,215),(265,215),(307,215),(333,215),(343,215),(345,215),(386,215),(399,215),(441,215),(444,215),(446,215),(448,215),(333,216),(351,216),(441,216),(446,216),(446,217),(26,218),(263,218),(446,218),(450,218),(176,219),(341,220),(291,221),(446,222),(296,223),(441,224),(80,225),(176,226),(316,227),(341,227),(347,227),(341,228),(216,229),(301,229),(359,229),(197,230),(80,231),(401,232),(60,233),(464,233),(232,234),(135,235),(140,236),(313,236),(14,237),(18,237),(54,237),(69,237),(88,237),(144,237),(198,237),(199,237),(265,237),(288,237),(295,237),(333,237),(377,237),(434,237),(446,237),(316,238),(188,239),(220,240),(333,241),(431,241),(33,242),(155,242),(256,242),(333,242),(351,242),(446,243),(362,244),(136,245),(444,246),(98,247),(446,248),(399,249),(325,250),(3,251),(95,251),(330,252),(243,253),(256,254),(307,255),(14,256),(17,256),(21,256),(33,256),(52,256),(60,256),(61,256),(74,256),(113,256),(123,256),(126,256),(134,256),(149,256),(155,256),(181,256),(182,256),(203,256),(211,256),(265,256),(269,256),(270,256),(281,256),(294,256),(295,256),(314,256),(315,256),(319,256),(322,256),(333,256),(335,256),(351,256),(377,256),(385,256),(431,256),(463,256),(464,256),(468,256),(446,257),(188,258),(235,258),(291,258),(341,258),(313,259),(446,260),(113,261),(24,262),(51,262),(77,262),(218,262),(312,262),(330,262),(472,262),(360,263),(136,264),(302,264),(300,265),(97,266),(360,267),(3,268),(95,268),(241,268),(246,268),(287,268),(341,268),(149,269),(333,269),(130,270),(69,271),(188,271),(176,272),(172,273),(435,274),(20,275),(101,275),(360,276),(176,277),(402,278),(110,279),(374,279),(441,280),(21,281),(188,282),(135,283),(176,284),(360,285),(188,286),(333,287),(362,287),(367,288),(80,289),(113,289),(341,289),(441,290),(341,291),(188,292),(78,293),(188,293),(341,294),(381,295),(80,296),(140,296),(165,296),(176,297),(402,298),(46,299),(310,299),(188,300),(176,301),(114,302),(135,303),(427,303),(360,304),(391,305),(360,306),(133,307),(20,308),(100,309),(210,309),(441,309),(1,310),(54,311),(148,311),(188,311),(200,311),(219,311),(419,311),(441,311),(446,312),(1,313),(341,313),(1,314),(333,315),(335,315),(402,316),(407,317),(69,318),(188,318),(454,318),(216,319),(443,319),(341,320),(97,321),(470,322),(61,323),(333,323),(263,324),(427,325),(341,326),(399,327),(135,328),(312,328),(446,329),(463,330),(399,331),(360,332),(188,333),(360,334),(188,335),(446,335),(450,335),(423,336),(269,337),(427,338),(428,339),(119,340),(26,341),(263,341),(450,341),(427,342),(50,343),(76,344),(194,344),(354,344),(436,344),(76,345),(144,345),(194,345),(298,345),(175,346),(313,347),(446,348),(135,349),(310,349),(439,350),(24,351),(26,351),(144,351),(177,351),(263,351),(456,351),(441,352),(256,353),(69,354),(210,354),(317,354),(446,355),(97,356),(299,357),(294,358),(333,358),(441,358),(42,359),(75,359),(97,359),(113,359),(341,359),(54,360),(95,360),(441,360),(446,360),(450,360),(446,361),(218,362),(341,363),(3,364),(95,364),(462,364),(448,365),(441,366),(446,366),(229,367),(446,367),(446,368),(450,368),(31,369),(120,370),(126,370),(335,370),(427,370),(144,371),(177,371),(200,371),(295,371),(333,371),(76,372),(354,372),(450,372),(459,373),(444,374),(32,375),(46,375),(134,375),(211,375),(310,375),(402,376),(243,377),(341,378),(347,378),(467,379),(441,380),(402,381),(446,382),(472,383),(188,384),(0,385),(87,385),(276,385),(291,385),(341,385),(347,385),(368,385),(413,385),(473,386),(31,387),(105,387),(313,387),(402,387),(444,387),(448,387),(176,388),(188,389),(31,390),(123,390),(281,390),(333,390),(471,391),(23,392),(18,393),(250,393),(468,394),(188,395),(95,396),(341,396),(198,397),(97,398),(441,398),(446,398),(333,399),(33,400),(52,400),(108,400),(176,400),(251,400),(256,400),(345,400),(197,401),(446,401),(189,402),(446,403);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` char(128) NOT NULL,
  PRIMARY KEY  (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help topics';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `host` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  PRIMARY KEY  (`Host`,`Db`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Host privileges;  Merged with database privileges';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proc`
--

DROP TABLE IF EXISTS `proc`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `proc` (
  `db` char(64) character set utf8 collate utf8_bin NOT NULL default '',
  `name` char(64) NOT NULL default '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL default '',
  `language` enum('SQL') NOT NULL default 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL default 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL default 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL default 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` char(64) NOT NULL default '',
  `body` longblob NOT NULL,
  `definer` char(77) character set utf8 collate utf8_bin NOT NULL default '',
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL default '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE') NOT NULL default '',
  `comment` char(64) character set utf8 collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `proc`
--

LOCK TABLES `proc` WRITE;
/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `procs_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Routine_name` char(64) collate utf8_bin NOT NULL default '',
  `Routine_type` enum('FUNCTION','PROCEDURE') collate utf8_bin NOT NULL,
  `Grantor` char(77) collate utf8_bin NOT NULL default '',
  `Proc_priv` set('Execute','Alter Routine','Grant') character set utf8 NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tables_priv` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `Db` char(64) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Table_name` char(64) collate utf8_bin NOT NULL default '',
  `Grantor` char(77) collate utf8_bin NOT NULL default '',
  `Timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view') character set utf8 NOT NULL default '',
  `Column_priv` set('Select','Insert','Update','References') character set utf8 NOT NULL default '',
  PRIMARY KEY  (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL auto_increment,
  `Use_leap_seconds` enum('Y','N') NOT NULL default 'N',
  PRIMARY KEY  (`Time_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zones';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY  (`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Leap seconds information for time zones';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone names';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`Time_zone_id`,`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transitions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL default '0',
  `Is_DST` tinyint(3) unsigned NOT NULL default '0',
  `Abbreviation` char(8) NOT NULL default '',
  PRIMARY KEY  (`Time_zone_id`,`Transition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transition types';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `Host` char(60) collate utf8_bin NOT NULL default '',
  `User` char(16) collate utf8_bin NOT NULL default '',
  `Password` char(41) character set latin1 collate latin1_bin NOT NULL default '',
  `Select_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Insert_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Update_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Delete_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Drop_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Reload_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Shutdown_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Process_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `File_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Grant_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `References_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Index_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_db_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Super_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_tmp_table_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Lock_tables_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Execute_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Repl_slave_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Repl_client_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Show_view_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Alter_routine_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `Create_user_priv` enum('N','Y') character set utf8 NOT NULL default 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') character set utf8 NOT NULL default '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL default '0',
  `max_updates` int(11) unsigned NOT NULL default '0',
  `max_connections` int(11) unsigned NOT NULL default '0',
  `max_user_connections` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('localhost','root','7c2904384956fc91','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),('localhost','astreal','6c7cf6b071fc356d','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),('127.0.0.1','root','7c2904384956fc91','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),('localhost','','','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),('localhost.localdomain','','','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),('localhost','asteriskuser','6c7cf6b071fc356d','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),('%','remote','118b93e85e4892b8','Y','Y','Y','Y','Y','N','N','N','N','Y','N','N','Y','Y','Y','N','Y','N','Y','N','N','Y','Y','Y','Y','N','','','','',0,0,0,0),('localhost','protect','3b8462d06c6e6d57','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),('localhost','whmcs','5357d89152ad1a6e','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),('%','jasnaboudard','72d922577fe8301f','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),('localhost','jasnaboudard','72d922577fe8301f','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0),('%','gazelle_remote','0c116edd5be502aa','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0),('localhost','you-niquegarters','736d84fc03081fa7','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `piercemoore`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `piercemoore` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `piercemoore`;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL default '0',
  `user_data` text NOT NULL,
  PRIMARY KEY  (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('bb69682851fca5f927ae148b490ab794','123.125.71.117','Baiduspider+(+http://www.baidu.com/search/spider.h',1288916397,''),('51649846657f98e6c9da22e9231b399e','69.71.222.186','0',1288890162,''),('36ca45a656cea458b1f698c989db4a1d','209.20.69.196','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; ',1288905472,''),('84225e418635c5f9c2d4193fee782af5','207.46.199.39','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.',1288877819,''),('0eccaea3f0ca09b461ffd0639f7b2111','50.16.39.150','Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; ',1288848342,''),('0ea2d6c78c76fdaf54fc5161aabdd921','178.77.77.146','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0;',1288829550,''),('5876a3b5d82bc1567f7c931738a423ee','95.108.244.251','Mozilla/5.0 (compatible; YandexBot/3.0; +http://ya',1288832830,''),('41836a3fe58acbcf19b3bf0d872a504b','123.125.71.98','Baiduspider+(+http://www.baidu.com/search/spider.h',1288805031,''),('5e1fb1d52456e7c76add1282b8a861e2','123.125.71.110','Baiduspider+(+http://www.baidu.com/search/spider.h',1288805487,''),('0484cecbbde57d549dfd68634b08390e','66.249.71.193','Mozilla/5.0 (compatible; Googlebot/2.1; +http://ww',1288809145,''),('1a0b0ffbc520268d79632a1cb81c76f7','123.125.71.112','Baiduspider+(+http://www.baidu.com/search/spider.h',1288805031,''),('41383037f3fd3f3eb0f4ee3d3ed96c70','123.125.71.113','Baiduspider+(+http://www.baidu.com/search/spider.h',1288805030,''),('d4f5e5f1c715297e63f99576806436dc','123.125.71.114','Baiduspider+(+http://www.baidu.com/search/spider.h',1288804806,''),('dca318ef4624c11fa9f016ff919928e1','123.125.71.110','Baiduspider+(+http://www.baidu.com/search/spider.h',1288804135,''),('0975c144ed746572d6e64d47aa774e2a','123.125.71.109','Baiduspider+(+http://www.baidu.com/search/spider.h',1288804359,''),('4b82a7e4aa15c435044cddf6cb387552','123.125.71.95','Baiduspider+(+http://www.baidu.com/search/spider.h',1288804582,''),('91eb464451d48cf83395c745824afd54','119.63.193.55','Baiduspider+(+http://www.baidu.jp/spider/)',1288801581,''),('df7f29026281f98f96bc7305cf4b88f0','69.71.222.186','0',1288796343,''),('0452fedee0c1bbbbebf54ff8a3ade6a6','193.67.94.189','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',1288764142,''),('ef37a82cf498da72fd83040620dbc16e','66.249.71.193','Googlebot-Image/1.0',1288762207,''),('e9194aafbd8ad9a1f786386178cf1d77','66.249.71.193','Googlebot-Image/1.0',1288726683,''),('3e0e05e8ff9d12e82cd6aab0a35a8be0','123.125.71.111','Baiduspider+(+http://www.baidu.com/search/spider.h',1288727684,''),('e197d391cd13211a2ce144d395df644a','123.125.71.98','Baiduspider+(+http://www.baidu.com/search/spider.h',1288727684,''),('1b7e18268ae8844516dea07ae0705faa','123.125.71.95','Baiduspider+(+http://www.baidu.com/search/spider.h',1288727685,''),('4afeb87c38820b2e45f3649cb559cefe','195.191.54.115','Opera/7.11 (Windows NT 5.1; U) [en]',1288753407,''),('4a32e54d88f12980ce15f5aaaecaa8b5','109.78.52.105','Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv',1288707097,''),('be6d2b40d38f93d2a2f3a34ecf7b1143','67.195.115.169','Mozilla/5.0 (compatible; Yahoo! Slurp/3.0; http://',1288706195,''),('ccc6d24d89bb0fb3506b30564f8a20e9','66.249.71.193','Mozilla/5.0 (compatible; Googlebot/2.1; +http://ww',1288685884,''),('c807a6453cf4aa118c286de85f8c72c2','89.178.224.253','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)',1288675853,''),('02b8f757eab511c2c2ad58f5d62d67c1','123.125.71.115','Baiduspider+(+http://www.baidu.com/search/spider.h',1288652431,''),('5a5905eba8ccb65f901020cf8009b310','68.168.105.59','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;',1288640215,''),('88d206fd763ad1de8c6be2de29e6dedd','207.46.13.50','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.',1288538274,''),('e70aeab625a2d113cbd845d8e75a24fa','207.46.13.50','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.',1288538477,''),('6911d83800efd5e0bcd54b0635ba3310','207.46.13.50','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.',1288538654,''),('d3c95dc9526629f5993e13cfa95661b8','119.63.198.115','Baiduspider+(+http://www.baidu.jp/spider/)',1288539733,''),('e379e3bbe6d644a171313b4ce3aff194','208.54.94.38','Mozilla/5.0 (Linux; U; Android 1.5; en-us; MB200 B',1288544859,''),('d999eaf1a9fa6a82dbf568a23a36248d','216.145.5.42','Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.',1288553641,''),('54ad8d27ccfefa77a013dad5afde881b','123.125.71.110','Baiduspider+(+http://www.baidu.com/search/spider.h',1288556124,''),('add2360fe19f7c6707121de7dda1cb97','122.165.222.92','0',1288562370,''),('e86c71fb3dd95973004ba3de6159e949','122.165.222.92','Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0',1288562371,''),('b65d100ff6c27b23290050103718909a','184.72.84.203','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en',1288573633,''),('731a8ab91627dcbb79c7374b5e981de9','184.72.84.203','Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en',1288573695,''),('7c48c7996d9878d8236ff2959c4c5384','67.195.115.169','Mozilla/5.0 (compatible; Yahoo! Slurp/3.0; http://',1288600848,''),('9ff8624360120d8cee5c86763010095d','68.168.105.59','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;',1288640215,''),('da37c6e6ae2df7f77c65358b5f54923a','95.108.151.244','Mozilla/5.0 (compatible; YandexBot/3.0; MirrorDete',1288536204,''),('bbf08df682cdd20b2449508b59a33da4','123.125.66.84','Baiduspider+(+http://www.baidu.com/search/spider.h',1288495237,''),('32d322d4ffb8a4475a346bbf2697a2d8','220.181.7.75','Baiduspider+(+http://www.baidu.com/search/spider.h',1288495217,''),('ac8150698af1582e1d1534d8eb2f062a','220.181.7.55','Baiduspider+(+http://www.baidu.com/search/spider.h',1288491621,''),('9bd38d02a6299224b40b416f97badc43','123.125.66.65','Baiduspider+(+http://www.baidu.com/search/spider.h',1288491619,''),('0a102fdb5706586d6ce09068a38c2256','220.181.7.75','Baiduspider+(+http://www.baidu.com/search/spider.h',1288488017,''),('151caf3e3a2029962cd53a01be17261d','123.125.66.91','Baiduspider+(+http://www.baidu.com/search/spider.h',1288488004,''),('c034abbb2b8a1369b21be7d90f3dbef0','123.125.66.88','Baiduspider+(+http://www.baidu.com/search/spider.h',1288484351,''),('d3d5d44f370ec46333b8f02012369598','220.181.7.58','Baiduspider+(+http://www.baidu.com/search/spider.h',1288484349,''),('cb91fc0ea106e199d2d975ef744bdacf','123.125.66.96','Baiduspider+(+http://www.baidu.com/search/spider.h',1288480784,''),('35de4ed3b69ad3a7356cdabd2c161a90','220.181.7.79','Baiduspider+(+http://www.baidu.com/search/spider.h',1288441247,''),('47cdfc1da426a2aa493ee5cc1e23ae94','123.125.66.72','Baiduspider+(+http://www.baidu.com/search/spider.h',1288441267,''),('4137f8e1602cec1427129fc24d60f99e','220.181.7.86','Baiduspider+(+http://www.baidu.com/search/spider.h',1288444817,''),('f6334fa61ca7f7e680566635db68504e','123.125.66.119','Baiduspider+(+http://www.baidu.com/search/spider.h',1288444838,''),('45d4428d6667f557b3db2b6822627279','123.125.66.66','Baiduspider+(+http://www.baidu.com/search/spider.h',1288498703,''),('d354eddb3af82960db49ad713885e828','220.181.7.78','Baiduspider+(+http://www.baidu.com/search/spider.h',1288498705,''),('90a7c6666a488b1a2ef29d3ae435b3da','220.181.7.74','Baiduspider+(+http://www.baidu.com/search/spider.h',1288502366,''),('d4809fe78d56309e1a09d7abc261df1d','123.125.66.62','Baiduspider+(+http://www.baidu.com/search/spider.h',1288502368,''),('7cd2430bbae7909b8e1947e6bffa528a','95.108.244.251','Mozilla/5.0 (compatible; YandexBot/3.0; +http://ya',1288505030,''),('724ecfd47152fcd88397622f08d2c865','220.181.7.74','Baiduspider+(+http://www.baidu.com/search/spider.h',1288505934,''),('e949ba51c707c4c42f8bd95068b256e7','123.125.66.132','Baiduspider+(+http://www.baidu.com/search/spider.h',1288505977,''),('ab353a31be1a9cc2e0b70032072420b6','220.181.7.117','Baiduspider+(+http://www.baidu.com/search/spider.h',1288509539,''),('9da1f0acfd887bfeeb01bb1fe920be45','123.125.66.92','Baiduspider+(+http://www.baidu.com/search/spider.h',1288509541,''),('616693d86160bdabbd8c7e7762c11cab','67.195.115.169','Mozilla/5.0 (compatible; Yahoo! Slurp/3.0; http://',1288511733,''),('b8c3548b8a89820aa9cd44d77f469b18','119.63.198.106','Baiduspider+(+http://www.baidu.jp/spider/)',1288514492,''),('14d67803f4a6a0d4e29c28d11e0649e0','119.63.198.110','Baiduspider+(+http://www.baidu.jp/spider/)',1288518097,''),('8610aaf3d421542e0d9e3a750394c45b','95.108.150.235','Mozilla/5.0 (compatible; YandexBot/3.0; MirrorDete',1288518978,''),('b7ebcc374714cec16fa52b024527fcea','95.108.150.235','Mozilla/5.0 (compatible; YandexBot/3.0; MirrorDete',1288518978,''),('874e3fb95128c227b6aa4b542894517b','95.108.150.235','Mozilla/5.0 (compatible; YandexBot/3.0; MirrorDete',1288518979,''),('0540b3e3c9bfd577830e39dafcbcdff8','95.108.150.235','Mozilla/5.0 (compatible; YandexBot/3.0; MirrorDete',1288518979,''),('06ff53c5fe4b59c6d9be26b0abd333cf','119.63.198.107','Baiduspider+(+http://www.baidu.jp/spider/)',1288521703,''),('1b94d4b8fddc95264f958a13fd862570','119.63.198.117','Baiduspider+(+http://www.baidu.jp/spider/)',1288521703,''),('bb25eee90df645c98ab565952fa62f58','119.63.198.123','Baiduspider+(+http://www.baidu.jp/spider/)',1288521704,''),('e20053e6b5d10d8eaab0607c46f21838','119.63.198.116','Baiduspider+(+http://www.baidu.jp/spider/)',1288528916,''),('ee5f8070fd9d3c92c1b3e5af4a3b411d','123.125.71.95','Baiduspider+(+http://www.baidu.com/search/spider.h',1288534564,''),('7d266cfb827429423ce253961399f85f','95.108.151.244','Mozilla/5.0 (compatible; YandexBot/3.0; MirrorDete',1288536200,''),('3d8ab31e51f9916a9b61e658df59d0bf','95.108.151.244','Mozilla/5.0 (compatible; YandexBot/3.0; MirrorDete',1288536201,''),('f494cec0c533adf1b1a2352b93ac6e48','95.108.151.244','Mozilla/5.0 (compatible; YandexBot/3.0; MirrorDete',1288536203,''),('4040afc5ac54132d5e0098ab57a97a6e','220.181.7.78','Baiduspider+(+http://www.baidu.com/search/spider.h',1288480780,''),('6e27213c7ad218d098a44a1864263dbe','123.125.66.86','Baiduspider+(+http://www.baidu.com/search/spider.h',1288477168,''),('b0bab140fdd6b30489b43a564e453dfd','220.181.7.81','Baiduspider+(+http://www.baidu.com/search/spider.h',1288477167,''),('0043c58ca2beaf5cc117aafe2bce805d','220.181.7.78','Baiduspider+(+http://www.baidu.com/search/spider.h',1288473569,''),('b92f18237c6e2f514308ca4cc321a5d3','123.125.66.60','Baiduspider+(+http://www.baidu.com/search/spider.h',1288473539,''),('7cf2cb79ea1a15abeb2f2ec5e1c86d44','220.181.7.66','Baiduspider+(+http://www.baidu.com/search/spider.h',1288469928,''),('b62e2a71f743847a22302c7ac4bb734f','123.125.66.82','Baiduspider+(+http://www.baidu.com/search/spider.h',1288469914,''),('60e9c9aff5ae5aaa25c31b441e6ac085','220.181.7.61','Baiduspider+(+http://www.baidu.com/search/spider.h',1288466369,''),('0ee4a971ed6be7f611b0cb11387c0c0f','123.125.66.90','Baiduspider+(+http://www.baidu.com/search/spider.h',1288466360,''),('a5911a78957ee1ea97edc7523684260d','123.125.66.63','Baiduspider+(+http://www.baidu.com/search/spider.h',1288462745,''),('57cb2a64eabd7f46e31457b1683432ea','220.181.7.128','Baiduspider+(+http://www.baidu.com/search/spider.h',1288462742,''),('7cdf0495f0505a6d2f92eb0c95d0b17a','220.181.7.57','Baiduspider+(+http://www.baidu.com/search/spider.h',1288459841,''),('659a94268b2145c9b2b69a7c18e63ef2','123.125.66.58','Baiduspider+(+http://www.baidu.com/search/spider.h',1288459823,''),('fa2bf8a8047e7876e0d22657745bdc8d','119.63.198.94','Baiduspider+(+http://www.baidu.jp/spider/)',1288457968,''),('c5436e4f43698bc35fdc2a2cc7d9de0c','220.181.7.83','Baiduspider+(+http://www.baidu.com/search/spider.h',1288448413,''),('2261700e0de89f76dc8e88883df7ccde','123.125.71.100','Baiduspider+(+http://www.baidu.com/search/spider.h',1288448662,''),('77ec1cee48ee8d5dce11dd2dd066bbc7','220.181.7.94','Baiduspider+(+http://www.baidu.com/search/spider.h',1288455705,''),('21a9cf5df920bd2facc6ecaf71d28732','123.125.66.96','Baiduspider+(+http://www.baidu.com/search/spider.h',1288455696,''),('649bf97a963e979c2c88bd7e6a7cbd74','123.125.66.60','Baiduspider+(+http://www.baidu.com/search/spider.h',1288448359,'');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_mixes`
--

DROP TABLE IF EXISTS `music_mixes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `music_mixes` (
  `track_id` int(10) default NULL,
  `track_name` varchar(250) default NULL,
  `artist_name` varchar(10) default NULL,
  `album_name` varchar(10) default NULL,
  `added_on` datetime default NULL,
  `last_modified` timestamp NOT NULL default CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Collection of all single tracks';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `music_mixes`
--

LOCK TABLES `music_mixes` WRITE;
/*!40000 ALTER TABLE `music_mixes` DISABLE KEYS */;
/*!40000 ALTER TABLE `music_mixes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_tracks`
--

DROP TABLE IF EXISTS `music_tracks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `music_tracks` (
  `mix_id` int(10) default NULL,
  `mix_name` varchar(250) default NULL,
  `artist_name` varchar(10) default NULL,
  `album_name` varchar(10) default NULL,
  `added_on` datetime default NULL,
  `last_modified` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Collection of all single tracks';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `music_tracks`
--

LOCK TABLES `music_tracks` WRITE;
/*!40000 ALTER TABLE `music_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `music_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_text`
--

DROP TABLE IF EXISTS `site_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `site_text` (
  `text_id` int(5) NOT NULL auto_increment,
  `text_name` varchar(250) NOT NULL,
  `text_content` varchar(10000) NOT NULL,
  `item_description` varchar(500) default NULL,
  `is_visible` int(1) NOT NULL,
  `last_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`text_id`),
  UNIQUE KEY `text_name` (`text_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `site_text`
--

LOCK TABLES `site_text` WRITE;
/*!40000 ALTER TABLE `site_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superchat_chats`
--

DROP TABLE IF EXISTS `superchat_chats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `superchat_chats` (
  `chat_id` int(20) NOT NULL auto_increment,
  `participant_id` int(20) default NULL,
  `chat_starter` int(20) default NULL,
  `chat_started_on` datetime default NULL,
  PRIMARY KEY  (`chat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `superchat_chats`
--

LOCK TABLES `superchat_chats` WRITE;
/*!40000 ALTER TABLE `superchat_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `superchat_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superchat_messages`
--

DROP TABLE IF EXISTS `superchat_messages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `superchat_messages` (
  `message_id` int(20) NOT NULL auto_increment,
  `chat_id` int(20) default '0',
  `participant_id` int(20) default NULL,
  `message_content` varchar(500) default NULL,
  `time` datetime default NULL,
  PRIMARY KEY  (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `superchat_messages`
--

LOCK TABLES `superchat_messages` WRITE;
/*!40000 ALTER TABLE `superchat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `superchat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superchat_participants`
--

DROP TABLE IF EXISTS `superchat_participants`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `superchat_participants` (
  `participant_id` int(20) NOT NULL auto_increment,
  `chat_id` int(20) default NULL,
  `user_id` int(20) default NULL,
  `created_on` datetime default NULL,
  PRIMARY KEY  (`participant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `superchat_participants`
--

LOCK TABLES `superchat_participants` WRITE;
/*!40000 ALTER TABLE `superchat_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `superchat_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superchat_users`
--

DROP TABLE IF EXISTS `superchat_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `superchat_users` (
  `user_id` int(10) NOT NULL auto_increment,
  `username` varchar(20) default NULL,
  `display_name` varchar(50) default NULL,
  `prof_img_path` varchar(250) default NULL,
  `logged_in` int(1) default NULL,
  `created_on` datetime default NULL,
  `last_modified` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `superchat_users`
--

LOCK TABLES `superchat_users` WRITE;
/*!40000 ALTER TABLE `superchat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `superchat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL auto_increment,
  `comment_id` bigint(20) unsigned NOT NULL default '0',
  `meta_key` varchar(255) default NULL,
  `meta_value` longtext,
  PRIMARY KEY  (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL auto_increment,
  `comment_post_ID` bigint(20) unsigned NOT NULL default '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL default '',
  `comment_author_url` varchar(200) NOT NULL default '',
  `comment_author_IP` varchar(100) NOT NULL default '',
  `comment_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL default '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL default '0',
  `comment_approved` varchar(20) NOT NULL default '1',
  `comment_agent` varchar(255) NOT NULL default '',
  `comment_type` varchar(20) NOT NULL default '',
  `comment_parent` bigint(20) unsigned NOT NULL default '0',
  `user_id` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`comment_ID`),
  KEY `comment_approved` (`comment_approved`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (7,21,'piercemoore','piercemoore@gmail.com','','99.180.118.13','2010-07-29 13:50:16','2010-07-29 18:50:16','Oh, yeah, by the way... Once the website is completed, I am thinking that there are going to be some cool giveaways or something to get people to pay attention. Who knows? Maybe a midget stripper...',0,'1','Disqus/1.0:65079202','',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL auto_increment,
  `link_url` varchar(255) NOT NULL default '',
  `link_name` varchar(255) NOT NULL default '',
  `link_image` varchar(255) NOT NULL default '',
  `link_target` varchar(25) NOT NULL default '',
  `link_description` varchar(255) NOT NULL default '',
  `link_visible` varchar(20) NOT NULL default 'Y',
  `link_owner` bigint(20) unsigned NOT NULL default '1',
  `link_rating` int(11) NOT NULL default '0',
  `link_updated` datetime NOT NULL default '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL default '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
INSERT INTO `wp_links` VALUES (1,'http://codex.wordpress.org/','Documentation','','','','Y',1,0,'0000-00-00 00:00:00','','',''),(2,'http://wordpress.org/development/','WordPress Blog','','','','Y',1,0,'0000-00-00 00:00:00','','','http://wordpress.org/development/feed/'),(3,'http://wordpress.org/extend/ideas/','Suggest Ideas','','','','Y',1,0,'0000-00-00 00:00:00','','',''),(4,'http://wordpress.org/support/','Support Forum','','','','Y',1,0,'0000-00-00 00:00:00','','',''),(5,'http://wordpress.org/extend/plugins/','Plugins','','','','Y',1,0,'0000-00-00 00:00:00','','',''),(6,'http://wordpress.org/extend/themes/','Themes','','','','Y',1,0,'0000-00-00 00:00:00','','',''),(7,'http://planet.wordpress.org/','WordPress Planet','','','','Y',1,0,'0000-00-00 00:00:00','','','');
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL auto_increment,
  `blog_id` int(11) NOT NULL default '0',
  `option_name` varchar(64) NOT NULL default '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL default 'yes',
  PRIMARY KEY  (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=720 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL auto_increment,
  `post_id` bigint(20) unsigned NOT NULL default '0',
  `meta_key` varchar(255) default NULL,
  `meta_value` longtext,
  PRIMARY KEY  (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(45,21,'_wp_old_slug',''),(41,21,'_edit_last','1'),(42,21,'_edit_lock','1280411802');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL auto_increment,
  `post_author` bigint(20) unsigned NOT NULL default '0',
  `post_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL default 'publish',
  `comment_status` varchar(20) NOT NULL default 'open',
  `ping_status` varchar(20) NOT NULL default 'open',
  `post_password` varchar(20) NOT NULL default '',
  `post_name` varchar(200) NOT NULL default '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL default '0000-00-00 00:00:00',
  `post_content_filtered` text NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL default '0',
  `guid` varchar(255) NOT NULL default '',
  `menu_order` int(11) NOT NULL default '0',
  `post_type` varchar(20) NOT NULL default 'post',
  `post_mime_type` varchar(100) NOT NULL default '',
  `comment_count` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (21,1,'2010-07-29 13:48:50','2010-07-29 13:48:50','Hey all. You probably already saw that the old website is ancient history and I have since begun rebuilding it from the ground up.\r\n\r\nGive me just a few more days, and you will have nothing more to fear :)\r\n\r\nPierce','PierceMoore.com is almost finished...','','publish','open','open','','piercemoore-com-is-almost-finished','','','2010-07-29 13:56:42','2010-07-29 13:56:42','',0,'http://piercemoore.com/blog/?p=21',0,'post','',1),(2,1,'2010-07-29 10:39:39','2010-07-29 10:39:39','This is an example of a WordPress page, you could edit this to put information about yourself or your site so readers know where you are coming from. You can create as many pages like this one or sub-pages as you like and manage all of your content inside of WordPress.','About','','publish','open','open','','about','','','2010-07-29 10:39:39','2010-07-29 10:39:39','',0,'http://piercemoore.com/blog/?page_id=2',0,'page','',0),(3,1,'2010-07-29 10:39:52','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2010-07-29 10:39:52','0000-00-00 00:00:00','',0,'http://piercemoore.com/blog/?p=3',0,'post','',0),(24,1,'2010-07-29 13:48:50','2010-07-29 13:48:50','Hey all. You probably already saw that the old website is ancient history and I have since begun rebuilding it from the ground up.\r\n\r\nGive me just a few more days, and you will have nothing more to fear :)\r\n\r\nPierce','PierceMoore.com is almost finished...','','inherit','open','open','','21-revision-2','','','2010-07-29 13:48:50','2010-07-29 13:48:50','',21,'http://piercemoore.com/blog/2010/07/29/21-revision-2/',0,'revision','',0),(23,1,'2010-07-29 13:57:43','2010-07-29 13:57:43','Hey all. You probably already saw that the old website is ancient history and I have since begun rebuilding it from the ground up.\n\nGive me just a few more days, and you will have nothing more to fear :)\n\nPierce','PierceMoore.com is almost finished...','','inherit','open','open','','21-autosave','','','2010-07-29 13:57:43','2010-07-29 13:57:43','',21,'http://piercemoore.com/blog/2010/07/29/21-autosave/',0,'revision','',0),(8,1,'2010-07-29 12:52:00','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2010-07-29 12:52:00','0000-00-00 00:00:00','',0,'http://piercemoore.com/blog/?p=8',0,'post','',0),(26,1,'2010-07-29 13:51:45','2010-07-29 13:51:45','Hey all. You probably already saw that the old website is ancient history and I have since begun rebuilding it from the ground up.\r\n\r\nGive me just a few more days, and you will have nothing more to fear :)\r\n\r\nPierce','PierceMoore.com is almost finished...','','inherit','open','open','','21-revision-4','','','2010-07-29 13:51:45','2010-07-29 13:51:45','',21,'http://piercemoore.com/blog/2010/07/29/21-revision-4/',0,'revision','',0),(25,1,'2010-07-29 13:50:47','2010-07-29 13:50:47','Hey all. You probably already saw that the old website is ancient history and I have since begun rebuilding it from the ground up.\r\n\r\nGive me just a few more days, and you will have nothing more to fear :)\r\n\r\nPierce','PierceMoore.com is almost finished...','','inherit','open','open','','21-revision-3','','','2010-07-29 13:50:47','2010-07-29 13:50:47','',21,'http://piercemoore.com/blog/2010/07/29/21-revision-3/',0,'revision','',0),(22,1,'2010-07-29 13:48:38','2010-07-29 13:48:38','Hey all. You probably already saw that the old website is ancient history and I have since begun rebuilding it from the ground up.\n\nGive me just a few more days, and you will have no','PierceMoore.com is almost finished...','','inherit','open','open','','21-revision','','','2010-07-29 13:48:38','2010-07-29 13:48:38','',21,'http://piercemoore.com/blog/2010/07/29/21-revision/',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL default '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL default '0',
  `term_order` int(11) NOT NULL default '0',
  PRIMARY KEY  (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,2,0),(2,2,0),(3,2,0),(4,2,0),(5,2,0),(6,2,0),(7,2,0),(21,7,0),(21,3,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL auto_increment,
  `term_id` bigint(20) unsigned NOT NULL default '0',
  `taxonomy` varchar(32) NOT NULL default '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL default '0',
  `count` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,0),(2,2,'link_category','',0,7),(3,3,'category','',0,1),(4,4,'category','',0,0),(5,5,'category','',0,0),(6,6,'category','',0,0),(7,7,'category','',3,1),(8,8,'category','',5,0),(9,9,'category','',5,0),(10,10,'category','',4,0),(11,11,'category','',3,0);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `slug` varchar(200) NOT NULL default '',
  `term_group` bigint(10) NOT NULL default '0',
  PRIMARY KEY  (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0),(2,'Blogroll','blogroll',0),(3,'Updates','updates',0),(4,'Web Development','web-development',0),(5,'Music','music',0),(6,'Politics','politics',0),(7,'Site Updates','site-updates',0),(8,'New Track','new-track',0),(9,'New Mix','new-mix',0),(10,'New Project','new-project',0),(11,'Project Update','project-update',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL auto_increment,
  `user_id` bigint(20) unsigned NOT NULL default '0',
  `meta_key` varchar(255) default NULL,
  `meta_value` longtext,
  PRIMARY KEY  (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'first_name',''),(2,1,'last_name',''),(3,1,'nickname','pierce'),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'aim',''),(10,1,'yim',''),(11,1,'jabber',''),(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";s:1:\"1\";}'),(13,1,'wp_user_level','10'),(14,1,'wp_dashboard_quick_press_last_post_id','3'),(15,1,'wp_user-settings','editor=tinymce'),(16,1,'wp_user-settings-time','1281677075');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL auto_increment,
  `user_login` varchar(60) NOT NULL default '',
  `user_pass` varchar(64) NOT NULL default '',
  `user_nicename` varchar(50) NOT NULL default '',
  `user_email` varchar(100) NOT NULL default '',
  `user_url` varchar(100) NOT NULL default '',
  `user_registered` datetime NOT NULL default '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL default '',
  `user_status` int(11) NOT NULL default '0',
  `display_name` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES (1,'pierce','$P$BUvpJX8JUi8JhnXVcz/I7ukIu3uezF.','pierce','piercemoore@gmail.com','','2010-07-29 10:39:39','',0,'pierce');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `protect`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `protect` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `protect`;

--
-- Table structure for table `bruteforce`
--

DROP TABLE IF EXISTS `bruteforce`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `bruteforce` (
  `id` int(11) NOT NULL auto_increment,
  `node_id` int(11) NOT NULL,
  `ip_address` int(11) unsigned NOT NULL,
  `file_date` varchar(50) NOT NULL,
  `file_line_number` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `source_port` int(11) NOT NULL,
  `added_ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `node_id` (`node_id`,`ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `bruteforce`
--

LOCK TABLES `bruteforce` WRITE;
/*!40000 ALTER TABLE `bruteforce` DISABLE KEYS */;
/*!40000 ALTER TABLE `bruteforce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `nodes` (
  `id` int(11) NOT NULL,
  `date_added` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `ipaddress` int(4) unsigned NOT NULL,
  `hostname` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `subscriber_key` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `subscriber_key` (`subscriber_key`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
INSERT INTO `subscribers` VALUES (1,'Test','aslekhnrq0934LAASEKNr0ai9a34nkAS','kanderson@zee-way.com');
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `smgb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `smgb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `smgb`;

--
-- Table structure for table `date_vote`
--

DROP TABLE IF EXISTS `date_vote`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `date_vote` (
  `vote_id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `day` varchar(15) NOT NULL,
  `start_time` varchar(10) NOT NULL,
  `end_time` varchar(10) NOT NULL,
  `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`vote_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `date_vote`
--

LOCK TABLES `date_vote` WRITE;
/*!40000 ALTER TABLE `date_vote` DISABLE KEYS */;
INSERT INTO `date_vote` VALUES (9,'rode roberts','tuesday','7:00pm','2:00am','2010-05-14 15:44:54'),(8,'John Wicker','saturday','12:00am','6:00am','2010-05-14 15:28:57'),(7,'Kristen','sunday','12:00am','any','2010-05-14 15:25:01'),(10,'Coleman','sunday','any','any','2010-05-15 01:58:23'),(11,'Arkonis2d','saturday','any','any','2010-05-19 10:46:02'),(12,'Andrew','sunday','10:00pm','11:00pm','2010-05-21 23:32:04');
/*!40000 ALTER TABLE `date_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

--
-- Current Database: `testingtesting`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `testingtesting` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `testingtesting`;

--
-- Current Database: `whmcs`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `whmcs` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `whmcs`;

--
-- Table structure for table `tblaccounts`
--

DROP TABLE IF EXISTS `tblaccounts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblaccounts` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) NOT NULL,
  `currency` int(10) NOT NULL,
  `gateway` text NOT NULL,
  `date` datetime default NULL,
  `description` text NOT NULL,
  `amountin` decimal(10,2) NOT NULL default '0.00',
  `fees` decimal(10,2) NOT NULL default '0.00',
  `amountout` decimal(10,2) NOT NULL default '0.00',
  `rate` decimal(10,5) NOT NULL default '1.00000',
  `transid` text NOT NULL,
  `invoiceid` int(10) NOT NULL default '0',
  `refundid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `userid` (`userid`),
  KEY `date` (`date`),
  KEY `transid` (`transid`(32))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblaccounts`
--

LOCK TABLES `tblaccounts` WRITE;
/*!40000 ALTER TABLE `tblaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblactivitylog`
--

DROP TABLE IF EXISTS `tblactivitylog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblactivitylog` (
  `id` int(10) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `user` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblactivitylog`
--

LOCK TABLES `tblactivitylog` WRITE;
/*!40000 ALTER TABLE `tblactivitylog` DISABLE KEYS */;
INSERT INTO `tblactivitylog` VALUES (1,'2010-06-22 12:25:33','Cron Job: Starting','System'),(2,'2010-06-22 12:25:33','Cron Job: Updating Currency Exchange Rates','System'),(3,'2010-06-22 12:25:34','Cron Job: Generating Invoices','System'),(4,'2010-06-22 12:25:34','Cron Job: Adding Late Fees','System'),(5,'2010-06-22 12:25:34','Cron Job: Credit Card Processing','System'),(6,'2010-06-22 12:25:34','Cron Job: Sending Invoice Reminders','System'),(7,'2010-06-22 12:25:34','Cron Job: Sending Domain Renewal Notices','System'),(8,'2010-06-22 12:25:34','Cron Job: Closing Inactive Support Tickets','System'),(9,'2010-06-22 12:25:34','Cron Job: Running Usage Stats Update','System'),(10,'2010-06-22 12:25:34','Cron Job: Completed','System'),(11,'2010-06-28 12:40:01','Administrator Account Modified (Kris Anderson)','kanderson'),(12,'2010-06-28 12:41:08','Administrator Account Modified (Kris Anderson)','kanderson'),(13,'2010-06-28 12:41:20','Administrator Account Modified (Kris Anderson)','kanderson'),(14,'2010-07-05 12:18:12','New Password Requested for Admin Username kanderson','System');
/*!40000 ALTER TABLE `tblactivitylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladdons`
--

DROP TABLE IF EXISTS `tbladdons`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbladdons` (
  `id` int(10) NOT NULL auto_increment,
  `packages` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `billingcycle` text NOT NULL,
  `tax` text NOT NULL,
  `showorder` text NOT NULL,
  `downloads` text NOT NULL,
  `autoactivate` text NOT NULL,
  `welcomeemail` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`(32))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbladdons`
--

LOCK TABLES `tbladdons` WRITE;
/*!40000 ALTER TABLE `tbladdons` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbladdons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladminlog`
--

DROP TABLE IF EXISTS `tbladminlog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbladminlog` (
  `id` int(10) NOT NULL auto_increment,
  `adminusername` text NOT NULL,
  `logintime` datetime NOT NULL default '0000-00-00 00:00:00',
  `logouttime` datetime NOT NULL default '0000-00-00 00:00:00',
  `ipaddress` text NOT NULL,
  `sessionid` text NOT NULL,
  `lastvisit` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `logouttime` (`logouttime`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbladminlog`
--

LOCK TABLES `tbladminlog` WRITE;
/*!40000 ALTER TABLE `tbladminlog` DISABLE KEYS */;
INSERT INTO `tbladminlog` VALUES (1,'kanderson','2010-06-22 12:25:45','2010-06-28 12:37:50','99.72.136.124','4nitdehc14maub4dj002q0cep5','0000-00-00 00:00:00'),(2,'kanderson','2010-06-22 12:25:45','2010-06-28 12:37:50','99.72.136.124','4nitdehc14maub4dj002q0cep5','2010-06-22 12:30:33'),(3,'kanderson','2010-06-28 12:37:50','2010-06-29 06:29:33','76.255.106.106','a4nl8guug2rtch2gkdlvjttt61','0000-00-00 00:00:00'),(4,'kanderson','2010-06-28 12:37:51','2010-06-29 06:29:33','76.255.106.106','a4nl8guug2rtch2gkdlvjttt61','2010-06-28 13:05:23'),(5,'kanderson','2010-06-29 06:29:33','2010-07-05 12:18:49','74.63.208.130','6v5008s297l12mrg58p1srfcj5','0000-00-00 00:00:00'),(6,'kanderson','2010-06-29 06:29:33','2010-07-05 12:18:49','74.63.208.130','6v5008s297l12mrg58p1srfcj5','2010-06-29 06:36:02'),(7,'kanderson','2010-07-05 12:18:49','2010-07-05 13:41:59','74.63.208.130','7i2i7fkpcvfar59nuu54cjo2g7','0000-00-00 00:00:00'),(8,'kanderson','2010-07-05 12:18:49','2010-07-05 12:20:33','74.63.208.130','7i2i7fkpcvfar59nuu54cjo2g7','2010-07-05 12:20:33'),(9,'kanderson','2010-07-05 12:42:40','2010-07-05 13:41:59','74.63.208.130','7i2i7fkpcvfar59nuu54cjo2g7','2010-07-05 12:42:50'),(10,'kanderson','2010-07-05 13:41:59','0000-00-00 00:00:00','74.63.208.130','o6hcnu4cled1jckufn9nvioha5','0000-00-00 00:00:00'),(11,'kanderson','2010-07-05 13:41:59','0000-00-00 00:00:00','74.63.208.130','o6hcnu4cled1jckufn9nvioha5','2010-07-05 13:50:50');
/*!40000 ALTER TABLE `tbladminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladminperms`
--

DROP TABLE IF EXISTS `tbladminperms`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbladminperms` (
  `roleid` int(1) NOT NULL,
  `permid` int(1) NOT NULL,
  KEY `roleid_permid` (`roleid`,`permid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbladminperms`
--

LOCK TABLES `tbladminperms` WRITE;
/*!40000 ALTER TABLE `tbladminperms` DISABLE KEYS */;
INSERT INTO `tbladminperms` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(2,85),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,50);
/*!40000 ALTER TABLE `tbladminperms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladminroles`
--

DROP TABLE IF EXISTS `tbladminroles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbladminroles` (
  `id` int(1) NOT NULL auto_increment,
  `name` text NOT NULL,
  `systememails` int(1) NOT NULL,
  `accountemails` int(1) NOT NULL,
  `supportemails` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbladminroles`
--

LOCK TABLES `tbladminroles` WRITE;
/*!40000 ALTER TABLE `tbladminroles` DISABLE KEYS */;
INSERT INTO `tbladminroles` VALUES (1,'Full Administrator',1,1,1),(2,'Sales Operator',0,1,1),(3,'Support Operator',0,0,1);
/*!40000 ALTER TABLE `tbladminroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladmins`
--

DROP TABLE IF EXISTS `tbladmins`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbladmins` (
  `id` int(10) NOT NULL auto_increment,
  `roleid` int(1) NOT NULL,
  `username` text NOT NULL,
  `password` varchar(32) NOT NULL default '',
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `email` text NOT NULL,
  `signature` text NOT NULL,
  `notes` text NOT NULL,
  `template` text NOT NULL,
  `loginattempts` int(1) NOT NULL,
  `supportdepts` text NOT NULL,
  `ticketnotifications` varchar(2) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `username` (`username`(32))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbladmins`
--

LOCK TABLES `tbladmins` WRITE;
/*!40000 ALTER TABLE `tbladmins` DISABLE KEYS */;
INSERT INTO `tbladmins` VALUES (1,1,'kanderson','e4d560a67049c6093e321fe3e1086b76','Kris','Anderson','k.anderson@limestonenetworks.com','','Welcome to WHMCS!  Please ensure you have setup the cron job in cPanel to automate tasks','v4',0,',','');
/*!40000 ALTER TABLE `tbladmins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbladminsecurityquestions`
--

DROP TABLE IF EXISTS `tbladminsecurityquestions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbladminsecurityquestions` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `question` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbladminsecurityquestions`
--

LOCK TABLES `tbladminsecurityquestions` WRITE;
/*!40000 ALTER TABLE `tbladminsecurityquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbladminsecurityquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliates`
--

DROP TABLE IF EXISTS `tblaffiliates`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblaffiliates` (
  `id` int(3) unsigned zerofill NOT NULL auto_increment,
  `date` date default NULL,
  `clientid` int(10) NOT NULL,
  `visitors` int(1) NOT NULL,
  `paytype` text NOT NULL,
  `payamount` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL default '0.00',
  `withdrawn` decimal(10,2) NOT NULL default '0.00',
  KEY `affiliateid` (`id`),
  KEY `clientid` (`clientid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblaffiliates`
--

LOCK TABLES `tblaffiliates` WRITE;
/*!40000 ALTER TABLE `tblaffiliates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliatesaccounts`
--

DROP TABLE IF EXISTS `tblaffiliatesaccounts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblaffiliatesaccounts` (
  `id` int(10) NOT NULL auto_increment,
  `affiliateid` int(10) NOT NULL,
  `relid` int(10) NOT NULL,
  `lastpaid` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`),
  KEY `affiliateid` (`affiliateid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblaffiliatesaccounts`
--

LOCK TABLES `tblaffiliatesaccounts` WRITE;
/*!40000 ALTER TABLE `tblaffiliatesaccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliatesaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliateshistory`
--

DROP TABLE IF EXISTS `tblaffiliateshistory`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblaffiliateshistory` (
  `id` int(10) NOT NULL auto_increment,
  `affiliateid` int(10) NOT NULL,
  `date` date NOT NULL,
  `affaccid` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `affiliateid` (`affiliateid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblaffiliateshistory`
--

LOCK TABLES `tblaffiliateshistory` WRITE;
/*!40000 ALTER TABLE `tblaffiliateshistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliateshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliatespending`
--

DROP TABLE IF EXISTS `tblaffiliatespending`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblaffiliatespending` (
  `id` int(10) NOT NULL auto_increment,
  `affaccid` int(10) NOT NULL default '0',
  `amount` decimal(10,2) NOT NULL,
  `clearingdate` date NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `clearingdate` (`clearingdate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblaffiliatespending`
--

LOCK TABLES `tblaffiliatespending` WRITE;
/*!40000 ALTER TABLE `tblaffiliatespending` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliatespending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaffiliateswithdrawals`
--

DROP TABLE IF EXISTS `tblaffiliateswithdrawals`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblaffiliateswithdrawals` (
  `id` int(10) NOT NULL auto_increment,
  `affiliateid` int(10) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `affiliateid` (`affiliateid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblaffiliateswithdrawals`
--

LOCK TABLES `tblaffiliateswithdrawals` WRITE;
/*!40000 ALTER TABLE `tblaffiliateswithdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaffiliateswithdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblannouncements`
--

DROP TABLE IF EXISTS `tblannouncements`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblannouncements` (
  `id` int(10) NOT NULL auto_increment,
  `date` datetime default NULL,
  `title` text NOT NULL,
  `announcement` text NOT NULL,
  `published` text NOT NULL,
  `parentid` int(10) NOT NULL,
  `language` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblannouncements`
--

LOCK TABLES `tblannouncements` WRITE;
/*!40000 ALTER TABLE `tblannouncements` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblannouncements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbannedemails`
--

DROP TABLE IF EXISTS `tblbannedemails`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblbannedemails` (
  `id` int(10) NOT NULL auto_increment,
  `domain` text NOT NULL,
  `count` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `domain` (`domain`(64))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblbannedemails`
--

LOCK TABLES `tblbannedemails` WRITE;
/*!40000 ALTER TABLE `tblbannedemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbannedemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbannedips`
--

DROP TABLE IF EXISTS `tblbannedips`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblbannedips` (
  `id` int(10) NOT NULL auto_increment,
  `ip` text NOT NULL,
  `reason` text NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ip` (`ip`(32))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblbannedips`
--

LOCK TABLES `tblbannedips` WRITE;
/*!40000 ALTER TABLE `tblbannedips` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbannedips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbillableitems`
--

DROP TABLE IF EXISTS `tblbillableitems`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblbillableitems` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) NOT NULL,
  `description` text NOT NULL,
  `hours` decimal(5,1) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `recur` int(5) NOT NULL default '0',
  `recurcycle` text NOT NULL,
  `recurfor` int(5) NOT NULL default '0',
  `invoiceaction` int(1) NOT NULL,
  `duedate` date NOT NULL,
  `invoicecount` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblbillableitems`
--

LOCK TABLES `tblbillableitems` WRITE;
/*!40000 ALTER TABLE `tblbillableitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbillableitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbrowserlinks`
--

DROP TABLE IF EXISTS `tblbrowserlinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblbrowserlinks` (
  `id` int(10) NOT NULL auto_increment,
  `name` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`(32))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblbrowserlinks`
--

LOCK TABLES `tblbrowserlinks` WRITE;
/*!40000 ALTER TABLE `tblbrowserlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbrowserlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcalendar`
--

DROP TABLE IF EXISTS `tblcalendar`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblcalendar` (
  `id` int(10) NOT NULL auto_increment,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `day` text NOT NULL,
  `month` text NOT NULL,
  `year` text NOT NULL,
  `startt1` text NOT NULL,
  `startt2` text NOT NULL,
  `endt1` text NOT NULL,
  `endt2` text NOT NULL,
  `adminid` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `day_month_year` (`day`(2),`month`(2),`year`(4))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblcalendar`
--

LOCK TABLES `tblcalendar` WRITE;
/*!40000 ALTER TABLE `tblcalendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcalendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcancelrequests`
--

DROP TABLE IF EXISTS `tblcancelrequests`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblcancelrequests` (
  `id` int(10) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `relid` int(10) NOT NULL,
  `reason` text NOT NULL,
  `type` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `serviceid` (`relid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblcancelrequests`
--

LOCK TABLES `tblcancelrequests` WRITE;
/*!40000 ALTER TABLE `tblcancelrequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcancelrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblclientgroups`
--

DROP TABLE IF EXISTS `tblclientgroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblclientgroups` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `groupname` varchar(45) NOT NULL,
  `groupcolour` varchar(45) default NULL,
  `discountpercent` decimal(10,2) unsigned default '0.00',
  `susptermexempt` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblclientgroups`
--

LOCK TABLES `tblclientgroups` WRITE;
/*!40000 ALTER TABLE `tblclientgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblclientgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblclients`
--

DROP TABLE IF EXISTS `tblclients`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblclients` (
  `id` int(10) NOT NULL auto_increment,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `companyname` text NOT NULL,
  `email` text NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `postcode` text NOT NULL,
  `country` text NOT NULL,
  `phonenumber` text NOT NULL,
  `password` text NOT NULL,
  `currency` int(10) NOT NULL,
  `credit` decimal(10,2) NOT NULL,
  `taxexempt` text NOT NULL,
  `latefeeoveride` text NOT NULL,
  `overideduenotices` text NOT NULL,
  `datecreated` date NOT NULL,
  `notes` text NOT NULL,
  `billingcid` int(10) NOT NULL,
  `securityqid` int(10) NOT NULL,
  `securityqans` text NOT NULL,
  `groupid` int(10) NOT NULL,
  `cardtype` varchar(255) NOT NULL default '',
  `cardlastfour` text NOT NULL,
  `cardnum` blob NOT NULL,
  `startdate` blob NOT NULL,
  `expdate` blob NOT NULL,
  `issuenumber` blob NOT NULL,
  `gatewayid` text NOT NULL,
  `lastlogin` datetime default NULL,
  `ip` text NOT NULL,
  `host` text NOT NULL,
  `status` enum('Active','Inactive','Closed') NOT NULL default 'Active',
  `language` text NOT NULL,
  `pwresetkey` text NOT NULL,
  `pwresetexpiry` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `firstname_lastname` (`firstname`(32),`lastname`(32)),
  KEY `email` (`email`(64))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblclients`
--

LOCK TABLES `tblclients` WRITE;
/*!40000 ALTER TABLE `tblclients` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblclients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblclientsfiles`
--

DROP TABLE IF EXISTS `tblclientsfiles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblclientsfiles` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) NOT NULL,
  `title` text NOT NULL,
  `filename` text NOT NULL,
  `adminonly` int(1) NOT NULL,
  `dateadded` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblclientsfiles`
--

LOCK TABLES `tblclientsfiles` WRITE;
/*!40000 ALTER TABLE `tblclientsfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblclientsfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblconfiguration`
--

DROP TABLE IF EXISTS `tblconfiguration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblconfiguration` (
  `setting` text NOT NULL,
  `value` text NOT NULL,
  KEY `setting` (`setting`(32))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblconfiguration`
--

LOCK TABLES `tblconfiguration` WRITE;
/*!40000 ALTER TABLE `tblconfiguration` DISABLE KEYS */;
INSERT INTO `tblconfiguration` VALUES ('Language','English'),('CompanyName','Abc Corp'),('Email','abc@abccorp.com'),('Domain','http://www.yourdomain.com/'),('LogoURL',''),('SystemURL','http://sip.zee-way.com/whmcs/'),('SystemSSLURL',''),('DisableSessionIPCheck',''),('AutoSuspension','on'),('AutoSuspensionDays','5'),('CreateInvoiceDaysBefore','14'),('AffiliateEnabled',''),('AffiliateEarningPercent','0'),('AffiliateBonusDeposit','0.00'),('AffiliatePayout','0.00'),('AffiliateLinks',''),('ActivityLimit','1000'),('DateFormat','MM/DD/YYYY'),('PreSalesQuestions',''),('Template','portal'),('AllowRegister','on'),('AllowTransfer','on'),('AllowOwnDomain','on'),('EnableTOSAccept',''),('TermsOfService',''),('AllowLanguageChange','on'),('Version','4.2.1'),('AllowCustomerChangeInvoiceGateway','on'),('DefaultNameserver1','ns1.yourdomain.com'),('DefaultNameserver2','ns2.yourdomain.com'),('SendInvoiceReminderDays','7'),('SendReminder','on'),('NumRecordstoDisplay','50'),('BCCMessages',''),('MailType','mail'),('SMTPHost',''),('SMTPUsername',''),('SMTPPassword',''),('SMTPPort','25'),('ShowCancellationButton','on'),('UpdateStatsAuto','on'),('InvoicePayTo','Address goes here...'),('SendAffiliateReportMonthly','on'),('InvalidLoginBanLength','15'),('Signature','Signature goes here...'),('DomainOnlyOrderEnabled','on'),('TicketBannedAddresses',''),('SendEmailNotificationonUserDetailsChange','on'),('TicketAllowedFileTypes','.jpg,.gif,.jpeg,.png'),('CloseInactiveTickets','0'),('InvoiceLateFeeAmount','10.00'),('AutoTermination',''),('AutoTerminationDays','30'),('RegistrarAdminFirstName',''),('RegistrarAdminLastName',''),('RegistrarAdminCompanyName',''),('RegistrarAdminAddress1',''),('RegistrarAdminAddress2',''),('RegistrarAdminCity',''),('RegistrarAdminStateProvince',''),('RegistrarAdminCountry','US'),('RegistrarAdminPostalCode',''),('RegistrarAdminPhone',''),('RegistrarAdminFax',''),('RegistrarAdminEmailAddress',''),('RegistrarAdminUseClientDetails','on'),('Charset','utf-8'),('AutoUnsuspend','on'),('RunScriptonCheckOut',''),('License','==Qf7ISNwcDMwEDMyIiO4ozc7ISZ0FGZrNWZoNmI6kjOztjIx4iMuQjI6UjOztjIu9WazJXZ2R3clRXY\nsJiOzEjOztjIzNWbod3Ls1Gdo9yd3d3LyFmdvIiO5EjOztjI5J3b0NWZylGZklGbhZnI6QTM6M3OiIDO\nuUTMy4SN0IjL2EjMioDNxozc7ICcpRWasFmdiozN6M3Oi02bj5SehdXLlVmeuAXaz5yd3dHLt92YukXY\n31SZlpnLwl2cioTNzozc7IibpFWbvRGZpxWY2JiOxEjOztjI05WdvN2YBBSZlJnRiojMxozc7ISZsNWe\njdmbpxGbpJmI6ITM6M3OiADMtADMtADMwAjI6ATM6M3OiUGdhRWZ1RGd4VmbioTMxozc7IiMy0iNw0CM\nxAjMioDMxozc7ISZ0FGZnVmciozN6M3OiwWYpJHVgUWZyZEI5FGRgUTMiozNxozc7ISZtFmb0NWdk9mc\nwJiOxEjOztjIxIiOxozc7ICZpR3Y1R2byBnI6kjOztjIuMmbJBCLztmcvdHdl5EIl52b0NXZtlGTioDN\nyozc7ISZtFmbkVmclR3cpdWZyJiO0EjOztjIlZXa0NWQiojN6M3OiMXd0FGdzJiO2ozc7pjMxoTY0384\n488b762c3af9526cfd982ff92a98041227091cd432829bc7b9f588a0f36b'),('OrderFormTemplate','web20cart'),('AllowDomainsTwice','on'),('AddLateFeeDays','5'),('TaxEnabled',''),('DefaultCountry','US'),('OrderDaysGrace','0'),('AutoRedirectoInvoice','on'),('EnablePDFInvoices','on'),('CaptchaSetting',''),('SupportTicketOrder','ASC'),('SendFirstOverdueInvoiceReminder','1'),('TaxType','Exclusive'),('DefaultNameserver3',''),('DomainDNSManagement','5.00'),('DomainEmailForwarding','5.00'),('InvoiceIncrement','1'),('ContinuousInvoiceGeneration',''),('AutoCancellationRequests','on'),('SystemEmailsFromName','WHMCompleteSolution'),('SystemEmailsFromEmail','noreply@yourdomain.com'),('AllowClientRegister','on'),('BulkCheckTLDs',''),('OrderDaysGrace','0'),('CreditOnDowngrade','on'),('AcceptedCardTypes','Visa,MasterCard,Discover,American Express,JCB,EnRoute,Diners Club'),('TaxDomains','on'),('TaxLateFee','on'),('ProductMonthlyPricingBreakdown',''),('LateFeeType','Percentage'),('SendSecondOverdueInvoiceReminder','0'),('SendThirdOverdueInvoiceReminder','0'),('DomainIDProtection','5.00'),('DomainRenewalNotices','60,30,15,7,1'),('SequentialInvoiceNumbering',''),('SequentialInvoiceNumberFormat','{NUMBER}'),('SequentialInvoiceNumberValue','1'),('DefaultNameserver4',''),('AffiliatesDelayCommission','0'),('SupportModule',''),('AddFundsEnabled',''),('AddFundsMinimum','10.00'),('AddFundsMaximum','100.00'),('AddFundsMaximumBalance','300.00'),('DisableClientDropdown',''),('CCProcessDaysBefore','0'),('CCAttemptOnlyOnce',''),('CCDaySendExpiryNotices','25'),('BulkDomainSearchEnabled','on'),('AutoRenewDomainsonPayment','on'),('DomainAutoRenewDefault','on'),('CCRetryEveryWeekFor','0'),('SupportTicketKBSuggestions','on'),('DailyEmailBackup',''),('FTPBackupHostname',''),('FTPBackupUsername',''),('FTPBackupPassword',''),('FTPBackupDestination','/'),('TaxL2Compound',''),('EmailCSS','body,td { font-family: verdana; font-size: 11px; font-weight: normal; }\r\na { color: #0000ff; }'),('SEOFriendlyUrls',''),('ShowCCIssueStart',''),('ClientDropdownFormat','1'),('TicketRatingEnabled','on'),('NetworkIssuesRequireLogin','on'),('ShowNotesFieldonCheckout','on'),('RequireLoginforClientTickets','on'),('NOMD5',''),('CurrencyAutoUpdateExchangeRates','on'),('CurrencyAutoUpdateProductPrices',''),('RequiredPWStrength','50'),('MaintenanceMode',''),('MaintenanceModeMessage','We are currently performing maintenance and will be back shortly.'),('SkipFraudForExisting',''),('SMTPSSL',''),('ContactFormDept',''),('ContactFormTo',''),('TicketEscalationLastRun','2009-01-01 00:00:00'),('APIAllowedIPs',''),('DisableSupportTicketReplyEmailsLogging',''),('OverageBillingMethod','1'),('CCNeverStore',''),('CCAllowCustomerDelete',''),('CreateDomainInvoiceDaysBefore',''),('NoInvoiceEmailOnOrder',''),('TaxInclusiveDeduct',''),('LateFeeMinimum','0.00'),('AutoProvisionExistingOnly',''),('EnableDomainRenewalOrders','on'),('EnableMassPay','on'),('NoAutoApplyCredit','');
/*!40000 ALTER TABLE `tblconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontacts`
--

DROP TABLE IF EXISTS `tblcontacts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblcontacts` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `companyname` text NOT NULL,
  `email` text NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `postcode` text NOT NULL,
  `country` text NOT NULL,
  `phonenumber` text NOT NULL,
  `subaccount` int(1) NOT NULL default '0',
  `password` text NOT NULL,
  `permissions` text NOT NULL,
  `domainemails` int(1) NOT NULL,
  `generalemails` int(1) NOT NULL,
  `invoiceemails` int(1) NOT NULL,
  `productemails` int(1) NOT NULL,
  `supportemails` int(1) NOT NULL,
  `pwresetkey` text NOT NULL,
  `pwresetexpiry` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `userid_firstname_lastname` (`userid`,`firstname`(32),`lastname`(32)),
  KEY `email` (`email`(64))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblcontacts`
--

LOCK TABLES `tblcontacts` WRITE;
/*!40000 ALTER TABLE `tblcontacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcredit`
--

DROP TABLE IF EXISTS `tblcredit`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblcredit` (
  `id` int(10) NOT NULL auto_increment,
  `clientid` int(10) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `relid` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblcredit`
--

LOCK TABLES `tblcredit` WRITE;
/*!40000 ALTER TABLE `tblcredit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcredit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcurrencies`
--

DROP TABLE IF EXISTS `tblcurrencies`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblcurrencies` (
  `id` int(10) NOT NULL auto_increment,
  `code` text NOT NULL,
  `prefix` text NOT NULL,
  `suffix` text NOT NULL,
  `format` int(1) NOT NULL,
  `rate` decimal(10,5) NOT NULL default '1.00000',
  `default` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblcurrencies`
--

LOCK TABLES `tblcurrencies` WRITE;
/*!40000 ALTER TABLE `tblcurrencies` DISABLE KEYS */;
INSERT INTO `tblcurrencies` VALUES (1,'USD','$',' USD',1,'1.00000',1);
/*!40000 ALTER TABLE `tblcurrencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomfields`
--

DROP TABLE IF EXISTS `tblcustomfields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblcustomfields` (
  `id` int(10) NOT NULL auto_increment,
  `type` text NOT NULL,
  `relid` int(10) NOT NULL default '0',
  `fieldname` text NOT NULL,
  `fieldtype` text NOT NULL,
  `description` text NOT NULL,
  `fieldoptions` text NOT NULL,
  `regexpr` text NOT NULL,
  `adminonly` text NOT NULL,
  `required` text NOT NULL,
  `showorder` text NOT NULL,
  `sortorder` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `serviceid` (`relid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblcustomfields`
--

LOCK TABLES `tblcustomfields` WRITE;
/*!40000 ALTER TABLE `tblcustomfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcustomfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomfieldsvalues`
--

DROP TABLE IF EXISTS `tblcustomfieldsvalues`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblcustomfieldsvalues` (
  `fieldid` int(10) NOT NULL,
  `relid` int(10) NOT NULL,
  `value` text NOT NULL,
  KEY `fieldid_relid` (`fieldid`,`relid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblcustomfieldsvalues`
--

LOCK TABLES `tblcustomfieldsvalues` WRITE;
/*!40000 ALTER TABLE `tblcustomfieldsvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcustomfieldsvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldomainpricing`
--

DROP TABLE IF EXISTS `tbldomainpricing`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbldomainpricing` (
  `id` int(10) NOT NULL auto_increment,
  `extension` text NOT NULL,
  `dnsmanagement` text NOT NULL,
  `emailforwarding` text NOT NULL,
  `idprotection` text NOT NULL,
  `eppcode` text NOT NULL,
  `autoreg` text NOT NULL,
  `order` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `extension_registrationperiod` (`extension`(32)),
  KEY `order` (`order`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbldomainpricing`
--

LOCK TABLES `tbldomainpricing` WRITE;
/*!40000 ALTER TABLE `tbldomainpricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldomainpricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldomains`
--

DROP TABLE IF EXISTS `tbldomains`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbldomains` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) NOT NULL,
  `orderid` int(1) NOT NULL,
  `type` enum('Register','Transfer') NOT NULL,
  `registrationdate` date NOT NULL,
  `domain` text NOT NULL,
  `firstpaymentamount` decimal(10,2) NOT NULL default '0.00',
  `recurringamount` decimal(10,2) NOT NULL,
  `registrar` text NOT NULL,
  `registrationperiod` int(1) NOT NULL default '1',
  `expirydate` date default NULL,
  `subscriptionid` text NOT NULL,
  `promoid` int(10) NOT NULL,
  `status` enum('Pending','Pending Transfer','Active','Expired','Cancelled','Fraud') NOT NULL default 'Pending',
  `nextduedate` date NOT NULL default '0000-00-00',
  `nextinvoicedate` date NOT NULL,
  `additionalnotes` text NOT NULL,
  `paymentmethod` text NOT NULL,
  `dnsmanagement` text NOT NULL,
  `emailforwarding` text NOT NULL,
  `idprotection` text NOT NULL,
  `donotrenew` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`),
  KEY `orderid` (`orderid`),
  KEY `domain` (`domain`(64)),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbldomains`
--

LOCK TABLES `tbldomains` WRITE;
/*!40000 ALTER TABLE `tbldomains` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldomains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldomainsadditionalfields`
--

DROP TABLE IF EXISTS `tbldomainsadditionalfields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbldomainsadditionalfields` (
  `id` int(10) NOT NULL auto_increment,
  `domainid` int(10) NOT NULL,
  `name` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `domainid` (`domainid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbldomainsadditionalfields`
--

LOCK TABLES `tbldomainsadditionalfields` WRITE;
/*!40000 ALTER TABLE `tbldomainsadditionalfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldomainsadditionalfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldownloadcats`
--

DROP TABLE IF EXISTS `tbldownloadcats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbldownloadcats` (
  `id` int(10) NOT NULL auto_increment,
  `parentid` int(10) NOT NULL default '0',
  `name` text NOT NULL,
  `description` text NOT NULL,
  `hidden` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `parentid` (`parentid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbldownloadcats`
--

LOCK TABLES `tbldownloadcats` WRITE;
/*!40000 ALTER TABLE `tbldownloadcats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldownloadcats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldownloads`
--

DROP TABLE IF EXISTS `tbldownloads`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbldownloads` (
  `id` int(10) NOT NULL auto_increment,
  `category` int(10) NOT NULL,
  `type` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `downloads` int(10) NOT NULL default '0',
  `location` text NOT NULL,
  `clientsonly` text NOT NULL,
  `productdownload` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `title` (`title`(32)),
  KEY `downloads` (`downloads`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbldownloads`
--

LOCK TABLES `tbldownloads` WRITE;
/*!40000 ALTER TABLE `tbldownloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldownloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemails`
--

DROP TABLE IF EXISTS `tblemails`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblemails` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `date` datetime default NULL,
  `to` text,
  `cc` text,
  `bcc` text,
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblemails`
--

LOCK TABLES `tblemails` WRITE;
/*!40000 ALTER TABLE `tblemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemailtemplates`
--

DROP TABLE IF EXISTS `tblemailtemplates`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblemailtemplates` (
  `id` int(10) NOT NULL auto_increment,
  `type` text NOT NULL,
  `name` text NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `fromname` text NOT NULL,
  `fromemail` text NOT NULL,
  `disabled` text NOT NULL,
  `custom` text NOT NULL,
  `language` text NOT NULL,
  `copyto` text NOT NULL,
  `plaintext` int(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`(32)),
  KEY `name` (`name`(64))
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblemailtemplates`
--

LOCK TABLES `tblemailtemplates` WRITE;
/*!40000 ALTER TABLE `tblemailtemplates` DISABLE KEYS */;
INSERT INTO `tblemailtemplates` VALUES (1,'product','Hosting Account Welcome Email','New Account Information','<p>Dear {$client_name},</p><p align=\"center\"><strong>PLEASE READ THIS EMAIL IN FULL AND PRINT IT FOR YOUR RECORDS</strong></p><p>Thank you for your order from us! Your hosting account has now been setup and this email contains all the information you will need in order to begin using your account.</p><p>If you have requested a domain name during sign up, please keep in mind that your domain name will not be visible on the internet instantly. This process is called propagation and can take up to 48 hours. Until your domain has propagated, your website and email will not function, we have provided a temporary url which you may use to view your website and upload files in the meantime.</p><p><strong>New Account Information</strong></p><p>Hosting Package: {$service_product_name}<br />Domain: {$service_domain}<br />First Payment Amount: {$service_first_payment_amount}<br />Recurring Amount: {$service_recurring_amount}<br />Billing Cycle: {$service_billing_cycle}<br />Next Due Date: {$service_next_due_date}</p><p><strong>Login Details</strong></p><p>Username: {$service_username}<br />Password: {$service_password}</p><p>Control Panel URL: <a href=\"http://{$service_server_ip}:2082/\">http://{$service_server_ip}:2082/</a><br />Once your domain has propogated, you may also use <a href=\"http://www.{$service_domain}:2082/\">http://www.{$service_domain}:2082/</a></p><p><strong>Server Information</strong></p><p>Server Name: {$service_server_name}<br />Server IP: {$service_server_ip}</p><p>If you are using an existing domain with your new hosting account, you will need to update the nameservers to point to the nameservers listed below.</p><p>Nameserver 1: {$service_ns1} ({$service_ns1_ip})<br />Nameserver 2: {$service_ns2} ({$service_ns2_ip}){if $service_ns3}<br />Nameserver 3: {$service_ns3} ({$service_ns3_ip}){/if}{if $service_ns4}<br />Nameserver 4: {$service_ns4} ({$service_ns4_ip}){/if}</p><p><strong>Uploading Your Website</strong></p><p>Temporarily you may use one of the addresses given below to manage your web site:</p><p>Temporary FTP Hostname: {$service_server_ip}<br />Temporary Webpage URL: <a href=\"http://{$service_server_ip}/~{$service_username}/\">http://{$service_server_ip}/~{$service_username}/</a></p><p>And once your domain has propagated you may use the details below:</p><p>FTP Hostname: {$service_domain}<br />Webpage URL: <a href=\"http://www.{$service_domain}\">http://www.{$service_domain}</a></p><p><strong>Email Settings</strong></p><p>For email accounts that you setup, you should use the following connection details in your email program:</p><p>POP3 Host Address: mail.{$service_domain}<br />SMTP Host Address: mail.{$service_domain}<br />Username: The email address you are checking email for<br />Password: As specified in your control panel</p><p>Thank you for choosing us.</p><p>{$signature}</p>','','','','','','',0),(29,'domain','Domain Renewal Confirmation','Domain Renewal Confirmation','<p>Dear {$client_name}, </p><p>Thank you for your domain renewal order. Your domain renewal request for the domain listed below has now been completed.</p><p>Domain: {$domain_name}<br />Renewal Length: {$domain_reg_period}<br />Renewal Price: {$domain_recurring_amount}<br />Next Due Date: {$domain_next_due_date} </p><p>You may login to your client area at {$whmcs_url} to manage your domain. </p><p>{$signature} </p>','','','','','','',0),(3,'domain','Domain Registration Confirmation','Domain Registration Confirmation','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThis message is to confirm that your domain purchase has been successful. The details of the domain purchase are below: \r\n</p>\r\n<p>\r\nRegistration Date: {$domain_reg_date}<br />\r\nDomain: {$domain_name}<br />\r\nRegistration Period: {$domain_reg_period}<br />\r\nAmount: {$domain_first_payment_amount}<br />\r\nNext Due Date: {$domain_next_due_date} \r\n</p>\r\n<p>\r\nYou may login to your client area at {$whmcs_url} to manage your new domain. \r\n</p>\r\n<p>\r\n{$signature} \r\n</p>\r\n','','','','','','',0),(4,'product','Reseller Account Welcome Email','Reseller Account Information','<p align=\"center\">\r\n<strong>PLEASE PRINT THIS MESSAGE FOR YOUR RECORDS - PLEASE READ THIS EMAIL IN FULL.</strong>\r\n</p>\r\n<p>\r\nIf you have requested a domain name during sign up then this will not be visible on the internet for between 24 and 72 hours. This process is called Propagation. Until your domain has Propagated your website and email will not function, we have provided a temporary url which you may use to view your website and upload files in the meantime.\r\n</p>\r\n<p>\r\nDear {$client_name},\r\n</p>\r\n<p>\r\nThe reseller hosting account for {$service_domain} has been set up. The username and password below are for both cPanel to manage the website at {$service_domain} and WebHostManager to manage your Reseller Account.\r\n</p>\r\n<p>\r\n<strong>New Account Info</strong>\r\n</p>\r\n<p>\r\nDomain: {$service_domain}<br />\r\nUsername: {$service_username}<br />\r\nPassword: {$service_password}<br />\r\nHosting Package: {$service_product_name}\r\n</p>\r\n<p>\r\nControl Panel: <a href=\"http://{$service_server_ip}:2082/\">http://{$service_server_ip}:2082/</a><br />\r\nWeb Host Manager: <a href=\"http://{$service_server_ip}:2086/\">http://{$service_server_ip}:2086/</a>\r\n</p>\r\n<p>\r\n-------------------------------------------------------------------------------------------- <br />\r\n<strong>Web Host Manager Quick Start</strong> <br />\r\n-------------------------------------------------------------------------------------------- <br />\r\n<br />\r\nTo access your Web Host Manager, use the following address:<br />\r\n<br />\r\n<a href=\"http://{$service_server_ip}:2086/\">http://{$service_server_ip}:2086/</a><br />\r\n<br />\r\nThe <strong>http://</strong> must be in the address line to connect to port :2086 <br />\r\nPlease use the username/password given above. <br />\r\n<br />\r\n<strong><em>To Create a New Account <br />\r\n</em></strong><br />\r\nThe first thing you need to do is scroll down on the left and click on &#39Add Package&#39 so that you can create your own hosting packages. You cannot install a domain onto your account without first creating packages.<br />\r\n<br />\r\n1. Click on &#39Create a New Account&#39 from the left hand side menu <br />\r\n2. Put the domain in the &#39Domain&#39 box (no www or http or spaces ? just domainname.com). After putting in the domain, hit TAB and it will automatically create a username. Also, enter a password for the account.<br />\r\n3. Your package selection should be one that you created earlier <br />\r\n4. Then press the create button <br />\r\n<br />\r\nThis will give you a confirmation page (you should print this for your records)\r\n</p>\r\n<p>\r\nPlease do not click on anything that you are not sure what it does. Please do not try to alter the WHM Theme from the selection box - fatal errors may occur. \r\n</p>\r\n<p>\r\n-------------------------------------------------------------------------------------------- \r\n</p>\r\n<p>\r\nTemporarily you may use one of the addresses given below manage your web site\r\n</p>\r\n<p>\r\nTemporary FTP Hostname: {$service_server_ip}<br />\r\nTemporary Webpage URL: <a href=\"http://{$service_server_ip}/~{$service_username}/\">http://{$service_server_ip}/~{$service_username}/</a><br />\r\nTemporary Control Panel: <a href=\"http://{$service_server_ip}/cpanel\">http://{$service_server_ip}/cpanel</a>\r\n</p>\r\n<p>\r\nOnce your domain has Propagated\r\n</p>\r\n<p>\r\nFTP Hostname: www.{$service_domain}<br />\r\nWebpage URL: <a href=\"http://www.{$service_domain}\">http://www.{$service_domain}</a><br />\r\nControl Panel: <a href=\"http://www.{$service_domain}/cpanel\">http://www.{$service_domain}/cpanel</a><br />\r\nWeb Host Manager: <a href=\"http://www.{$service_domain}/whm\">http://www.{$service_domain}/whm</a>\r\n</p>\r\n<p>\r\n<strong>Mail settings</strong>\r\n</p>\r\n<p>\r\nCatch all email with your default email account\r\n</p>\r\n<p>\r\nPOP3 Host Address : mail.{$service_domain}<br />\r\nSMTP Host Address: mail.{$service_domain}<br />\r\nUsername: {$service_username}<br />\r\nPassword: {$service_password}\r\n</p>\r\n<p>\r\nAdditional mail accounts that you add\r\n</p>\r\n<p>\r\nPOP3 Host Address : mail.{$service_domain}<br />\r\nSMTP Host Address: mail.{$service_domain}<br />\r\nUsername : The FULL email address that you are picking up from (e.g. info@yourdomain.com). <br />\r\nIf your email client cannot accept a @ symbol, then you may replace this with a backslash .<br />\r\nPassword : As specified in your control panel \r\n</p>\r\n<p>\r\nThank you for choosing us.\r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','','','','',0),(30,'domain','Upcoming Domain Renewal Notice','Upcoming Domain Renewal Notice','<p>Dear {$client_name}, </p><p>The domain name listed below will expire in {$domain_days_until_expiry} days.</p><p>{$domain_name} - {$domain_next_due_date}</p><p>To ensure the domain does not expire, you should renew it now. You can do this from the domains management section of our client area here: {$whmcs_url}</p><p>Should you allow the domain to expire, you will be able to renew it for up to 30 days after the renewal date. During this time, the domain will not be accessible so any web site or email services associated with it will stop working.</p><p>{$signature}</p>','','','','','','',0),(28,'domain','Domain Transfer Initiated','Domain Transfer Initiated','<p>Dear {$client_name}, </p><p>Thank you for your domain transfer order. Your order has been received and we have now initiated the transfer process. The details of the domain purchase are below: </p><p>Domain: {$domain_name}<br />Registration Length: {$domain_reg_period}<br />Transfer Price: {$domain_first_payment_amount}<br />Renewal Price: {$domain_recurring_amount}<br />Next Due Date: {$domain_next_due_date} </p><p>You may login to your client area at {$whmcs_url} to manage your domain. </p><p>{$signature} </p>','','','','','','',0),(7,'support','Support Ticket Opened','New Support Ticket Opened','<p>\r\n{$client_name},\r\n</p>\r\n<p>\r\nThank you for contacting our support team. A support ticket has now been opened for your request. You will be notified when a response is made by email. The details of your ticket are shown below.\r\n</p>\r\n<p>\r\nSubject: {$ticket_subject}<br />\r\nPriority: {$ticket_priority}<br />\r\nStatus: {$ticket_status}\r\n</p>\r\n<p>\r\nYou can view the ticket at any time at {$ticket_link}\r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','','','','',0),(8,'support','Support Ticket Reply','Support Ticket Response','<p>\r\n{$ticket_message}\r\n</p>\r\n<p>\r\n----------------------------------------------<br />\r\nTicket ID: #{$ticket_id}<br />\r\nSubject: {$ticket_subject}<br />\r\nStatus: {$ticket_status}<br />\r\nTicket URL: {$ticket_link}<br />\r\n----------------------------------------------\r\n</p>\r\n','','','','','','',0),(9,'general','Client Signup Email','Welcome','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThank you for signing up with us. Your new account has been setup and you can now login to our client area using the details below. \r\n</p>\r\n<p>\r\nEmail Address: {$client_email}<br />\r\nPassword: {$client_password} \r\n</p>\r\n<p>\r\nTo login, visit {$whmcs_url} \r\n</p>\r\n<p>\r\n{$signature} \r\n</p>\r\n','','','','','','',0),(10,'product','Account Suspended','Hosting Account Suspended','<p>\r\nDear {$client_name},\r\n</p>\r\n<p>\r\nYour hosting account has been suspended due to non-payment. Details of the account are below:\r\n</p>\r\n<p>\r\nProduct/Service: {$service_product_name}<br />\r\nDomain: {$service_domain}<br />\r\nAmount: {$service_recurring_amount}<br />\r\nDue Date: {$service_next_due_date}\r\n</p>\r\n<p>\r\nPlease contact us as soon as possible to get your website back online.\r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','','','','',0),(32,'general','Credit Card Expiring Soon','Credit Card Expiring Soon','<p>Dear {$client_name}, </p><p>This is a notice to inform you that your {$client_cc_type} credit card ending with {$client_cc_number} will be expiring next month on {$client_cc_expiry}. Please login to update your credit card information as soon as possible and prevent any interuptions in service at {$whmcs_url}<br /><br />If you have any questions regarding your account, please open a support ticket from the client area.</p><p>{$signature}</p>','','','','','','',0),(31,'support','Bounce Message','Support Ticket Not Opened','<p>{$client_name},</p><p>Your email to our support system could not be accepted because it was not recognized as coming from an email address belonging to one of our customers.  If you need assistance, please email from the address you registered with us that you use to login to our client area.</p><p>{$signature}</p>','','','','','','',0),(13,'invoice','Invoice Payment Confirmation','Invoice Payment Confirmation','<p>Dear {$client_name},</p>\r\n<p>This is a payment receipt for Invoice {$invoice_num} sent on {$invoice_date_created}</p>\r\n<p>{$invoice_html_contents}</p>\r\n<p>Amount: {$invoice_last_payment_amount}<br />Transaction #: {$invoice_last_payment_transid}<br />Total Paid: {$invoice_amount_paid}<br />Remaining Balance: {$invoice_balance}<br />Status: {$invoice_status}</p>\r\n<p>You may review your invoice history at any time by logging in to your client area.</p>\r\n<p>Note: This email will serve as an official receipt for this payment.</p>\r\n<p>{$signature}</p>','','','','','','',0),(14,'invoice','Invoice Created','Customer Invoice','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThis is a notice that an invoice has been generated on {$invoice_date_created}. \r\n</p>\r\n<p>\r\nYour payment method is: {$invoice_payment_method} \r\n</p>\r\n<p>\r\nInvoice #{$invoice_num}<br />\r\nAmount Due: {$invoice_total}<br />\r\nDue Date: {$invoice_date_due} \r\n</p>\r\n<p>\r\n<strong>Invoice Items</strong> \r\n</p>\r\n<p>\r\n{$invoice_html_contents} <br />\r\n------------------------------------------------------ \r\n</p>\r\n<p>\r\nYou can login to your client area to view and pay the invoice at {$invoice_link} \r\n</p>\r\n<p>\r\n{$signature} \r\n</p>\r\n','','','','','','',0),(15,'invoice','Invoice Payment Reminder','Invoice Payment Reminder','<p>\r\nDear {$client_name},\r\n</p>\r\n<p>\r\nThis is a billing reminder that your invoice no. {$invoice_num} which was generated on {$invoice_date_created} is due on {$invoice_date_due}.\r\n</p>\r\n<p>\r\nYour payment method is: {$invoice_payment_method}\r\n</p>\r\n<p>\r\nInvoice: {$invoice_num}<br />\r\nAmount Due: {$invoice_total}<br />\r\nDue Date: {$invoice_date_due}\r\n</p>\r\n<p>\r\nYou can login to your client area to view and pay the invoice at {$invoice_link}\r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','','','','',0),(16,'general','Order Confirmation','Order Confirmation','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nWe have received your order and will be processing it shortly. The details of the order are below: \r\n</p>\r\n<p>\r\nOrder Number: <b>{$order_number}</b></p>\r\n<p>\r\n{$order_details} \r\n</p>\r\n<p>\r\nYou will receive an email from us shortly once your account has been setup. Please quote your order reference number if you wish to contact us about this order. \r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','','','','',0),(17,'product','Dedicated/VPS Server Welcome Email','New Dedicated Server Information','<p>\r\nDear {$client_name},<br />\r\n<br />\r\n<strong>PLEASE PRINT THIS MESSAGE FOR YOUR RECORDS - PLEASE READ THIS EMAIL IN FULL.</strong>\r\n</p>\r\n<p>\r\nWe are pleased to tell you that the server you ordered has now been set up and is operational.\r\n</p>\r\n<p>\r\n<strong>Server Details<br />\r\n</strong>=============================\r\n</p>\r\n<p>\r\n{$service_product_name}\r\n</p>\r\n<p>\r\nMain IP: {$service_dedicated_ip}<br />\r\nRoot pass: {$service_password}\r\n</p>\r\n<p>\r\nIP address allocation: <br />\r\n{$service_assigned_ips}\r\n</p>\r\n<p>\r\nServerName: {$service_domain}\r\n</p>\r\n<p>\r\n<strong>WHM Access<br />\r\n</strong>=============================<br />\r\n<a href=\"http://xxxxx:2086/\">http://xxxxx:2086</a><br />\r\nUsername: root<br />\r\nPassword: {$service_password}\r\n</p>\r\n<p>\r\n<strong>Custom DNS Server Addresses</strong><br />\r\n=============================<br />\r\nThe custom DNS addresses you should set for your domain to use are: <br />\r\nPrimary DNS: {$service_ns1}<br />\r\nSecondary DNS: {$service_ns2}\r\n</p>\r\n<p>\r\nYou will have to login to your registrar and find the area where you can specify both of your custom name server addresses.\r\n</p>\r\n<p>\r\nAfter adding these custom nameservers to your domain registrar control panel, it will take 24 to 48 hours for your domain to delegate authority to your DNS server. Once this has taken effect, your DNS server has control over the DNS records for the domains which use your custom name server addresses. \r\n</p>\r\n<p>\r\n<strong>SSH Access Information<br />\r\n</strong>=============================<br />\r\nMain IP Address: xxxxxxxx<br />\r\nServer Name: {$service_domain}<br />\r\nRoot Password: xxxxxxxx\r\n</p>\r\n<p>\r\nYou can access your server using a free simple SSH client program called Putty located at:<br />\r\n<a href=\"http://www.securitytools.net/mirrors/putty/\">http://www.securitytools.net/mirrors/putty/</a>\r\n</p>\r\n<p>\r\n<strong>Support</strong><br />\r\n=============================<br />\r\nFor any support needs, please open a ticket at {$whmcs_url}\r\n</p>\r\n<p>\r\nPlease include any necessary information to provide you with faster service, such as root password, domain names, and a description of the problem / or assistance needed. This will speed up the support time by allowing our administrators to immediately begin diagnosing the problem.\r\n</p>\r\n<p>\r\nThe manual for cPanel can be found here: <a href=\"http://www.cpanel.net/docs/cp/\">http://www.cpanel.net/docs/cp/</a> <br />\r\nFor documentation on using WHM please see the following link: <a href=\"http://www.cpanel.net/docs/whm/index.html\">http://www.cpanel.net/docs/whm/index.html</a>\r\n</p>\r\n<p>\r\n=============================\r\n</p>\r\n<p>\r\nIf you need to move accounts to the server use: Transfers Copy an account from another server with account password\r\n</p>\r\n<p>\r\n<a href=\"http://xxxxxxx:2086/scripts2/norootcopy\">http://xxxxxxx:2086/scripts2/norootcopy</a>\r\n</p>\r\n<p>\r\nNote the other server must use cpanel to move it.\r\n</p>\r\n<p>\r\n=============================\r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','','','','',0),(18,'product','Other Product/Service Welcome Email','New Product Information','<p>\r\nDear {$client_name},\r\n</p>\r\n<p>\r\nYour order for {$service_product_name} has now been activated. Please keep this message for your records.\r\n</p>\r\n<p>\r\nProduct/Service: {$service_product_name}<br />\r\nPayment Method: {$service_payment_method}<br />\r\nAmount: {$service_recurring_amount}<br />\r\nBilling Cycle: {$service_billing_cycle}<br />\r\nNext Due Date: {$service_next_due_date}\r\n</p>\r\n<p>\r\nThank you for choosing us.\r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','','','','',0),(19,'invoice','Credit Card Payment Confirmation','Credit Card Payment Confirmation','<p>Dear {$client_name},</p>\r\n<p>This is a payment receipt for Invoice {$invoice_num} sent on {$invoice_date_created}</p>\r\n<p>{$invoice_html_contents}</p>\r\n<p>Amount: {$invoice_last_payment_amount}<br />Transaction #: {$invoice_last_payment_transid}<br />Total Paid: {$invoice_amount_paid}<br />Remaining Balance: {$invoice_balance}<br />Status: {$invoice_status}</p>\r\n<p>You may review your invoice history at any time by logging in to your client area.</p>\r\n<p>Note: This email will serve as an official receipt for this payment.</p>\r\n<p>{$signature}</p>','','','','','','',0),(20,'invoice','Credit Card Payment Failed','Credit Card Payment Failed','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThis is a notice that a recent credit card payment we attempted on the card we have registered for you failed. \r\n</p>\r\n<p>\r\nInvoice Date: {$invoice_date_created}<br />\r\nInvoice No: {$invoice_num}<br />\r\nAmount: {$invoice_total}<br />\r\nStatus: {$invoice_status} \r\n</p>\r\n<p>\r\nYou now need to login to your client area to pay the invoice manually. During the payment process you will be given the opportunity to change the card on record with us.<br />\r\n{$invoice_link} \r\n</p>\r\n<p>\r\nNote: This email will serve as an official receipt for this payment. \r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','','','','',0),(21,'invoice','Credit Card Invoice Created','Customer Invoice','<p> Dear {$client_name}, </p> <p> This is a notice that an invoice has been generated on {$invoice_date_created}. </p> <p> Your payment method is: {$invoice_payment_method} </p> <p> Invoice #{$invoice_num}<br /> Amount Due: {$invoice_total}<br /> Due Date: {$invoice_date_due} </p> <p> <strong>Invoice Items</strong> </p> <p> {$invoice_html_contents} <br /> ------------------------------------------------------ </p> <p> Payment will be taken automatically on {$invoice_date_due} from your credit card on record with us. To update or change the credit card details we hold for your account please login at {$invoice_link} and click Pay Now then following the instructions on screen. </p> <p> {$signature} </p>','','','','','','',0),(22,'affiliate','Affiliate Monthly Referrals Report','Affiliate Monthly Referrals Report','<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThis is your monthly affiliate referrals report. You can view your referral statistics at any time by logging in to the client area. \r\n</p>\r\n<p>\r\nTotal Visitors Referred: {$affiliate_total_visits}<br />\r\nCurrent Earnings: {$affiliate_balance}<br />\r\nAmount Withdrawn: {$affiliate_withdrawn} \r\n</p>\r\n<p>\r\n<strong>Your New Signups this Month</strong> \r\n</p>\r\n<p>\r\n{$affiliate_referrals_table} \r\n</p>\r\n<p>\r\nRemember, you can refer new customers using your unique affiliate link: {$affiliate_referral_url} \r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','','','','',0),(23,'support','Support Ticket Opened by Admin','{$ticket_subject}','{$ticket_message}','','','','','','',0),(24,'invoice','First Invoice Overdue Notice','First Invoice Overdue Notice','<p> Dear {$client_name}, </p> <p> This is a billing notice that your invoice no. {$invoice_num} which was generated on {$invoice_date_created} is now overdue. </p> <p> Your payment method is: {$invoice_payment_method} </p> <p> Invoice: {$invoice_num}<br /> Amount Due: {$invoice_total}<br /> Due Date: {$invoice_date_due} </p> <p> You can login to your client area to view and pay the invoice at {$invoice_link} </p> <p> Your login details are as follows: </p> <p> Email Address: {$client_email}<br /> Password: {$client_password} </p> <p> {$signature} </p>','','','','','','',0),(25,'product','SHOUTcast Welcome Email','SHOUTcast New Account Information','<p align=\"center\">\r\n<strong>PLEASE READ THIS EMAIL IN FULL AND PRINT IT FOR YOUR RECORDS</strong> \r\n</p>\r\n<p>\r\nDear {$client_name}, \r\n</p>\r\n<p>\r\nThank you for your order from us! Your shoutcast account has now been setup and this email contains all the information you will need in order to begin using your account. \r\n</p>\r\n<p>\r\n<strong>New Account Information</strong> \r\n</p>\r\n<p>\r\nDomain: {$service_domain}<br />\r\nUsername: {$service_username}<br />\r\nPassword: {$service_password} \r\n</p>\r\n<p>\r\n<strong>Server Information</strong> \r\n</p>\r\n<p>\r\nServer Name: {$service_server_name}<br />\r\nServer IP: {$service_server_ip}<br />\r\nNameserver 1: {$service_ns1}<br />\r\nNameserver 1 IP: {$service_ns1_ip}<br />\r\nNameserver 2: {$service_ns2} <br />\r\nNameserver 2 IP: {$service_ns2_ip} \r\n</p>\r\n<p>\r\nThank you for choosing us. \r\n</p>\r\n<p>\r\n{$signature}\r\n</p>\r\n','','','','','','',0),(26,'invoice','Second Invoice Overdue Notice','Second Invoice Overdue Notice','<p> Dear {$client_name}, </p> <p> This is the second billing notice that your invoice no. {$invoice_num} which was generated on {$invoice_date_created} is now overdue. </p> <p> Your payment method is: {$invoice_payment_method} </p> <p> Invoice: {$invoice_num}<br /> Amount Due: {$invoice_total}<br /> Due Date: {$invoice_date_due} </p> <p> You can login to your client area to view and pay the invoice at {$invoice_link} </p> <p> Your login details are as follows: </p> <p> Email Address: {$client_email}<br /> Password: {$client_password} </p> <p> {$signature} </p>','','','','','','',0),(27,'invoice','Third Invoice Overdue Notice','Third Invoice Overdue Notice','<p> Dear {$client_name}, </p> <p> This is the third and final billing notice that your invoice no. {$invoice_num} which was generated on {$invoice_date_created} is now overdue. Failure to make payment will result in account suspension.</p> <p> Your payment method is: {$invoice_payment_method} </p> <p> Invoice: {$invoice_num}<br /> Amount Due: {$invoice_total}<br /> Due Date: {$invoice_date_due} </p> <p> You can login to your client area to view and pay the invoice at {$invoice_link} </p> <p> Your login details are as follows: </p> <p> Email Address: {$client_email}<br /> Password: {$client_password} </p> <p> {$signature} </p>','','','','','','',0),(33,'support','Support Ticket Auto Close Notification','Support Ticket Resolved','<p>{$client_name},</p><p>This is a notification to let you know that we are changing the status of your ticket #{$ticket_id} to Closed as we have not received a response from you in over {$ticket_auto_close_time} hours.</p><p>Subject: {$ticket_subject}<br>Department: {$ticket_department}<br>Priority: {$ticket_priority}<br>Status: {$ticket_status}</p><p>If you have any further questions then please just reply to re-open the ticket.</p><p>{$signature}</p>','','','','','','',0),(34,'invoice','Credit Card Payment Due','Invoice Payment Reminder','<p>Dear {$client_name},</p><p>This is a notice to remind you that you have an invoice due on {$invoice_date_due}. We tried to bill you automatically but were unable to because we don\'t have your credit card details on file.</p><p>Invoice Date: {$invoice_date_created}<br>Invoice #{$invoice_num}<br>Amount Due: {$invoice_total}<br>Due Date: {$invoice_date_due}</p><p>Please login to our client area at the link below to submit your card details or make payment using a different method.</p><p>{$invoice_link}</p><p>{$signature}</p>','','','','','','',0),(35,'product','Cancellation Request Confirmation','Cancellation Request Confirmation','<p>Dear {$client_name},</p><p>This email is to confirm that we have received your cancellation request for the service listed below.</p><p>Product/Service: {$service_product_name}<br />Domain: {$service_domain}</p><p>If you requested immediate cancellation then the service will be terminated within the next 24 hours. If however you chose end of billing cycle, it will not be cancelled until {$service_next_due_date}.</p><p>Thank you for using {$company_name} and we hope to see you again in the future.</p><p>{$signature}</p>','','','','','','',0),(36,'general','Quote Delivery with PDF','Quote #{$quote_number} - {$quote_subject}','<p>Dear {$client_name},</p>\r\n<p>Here is the quote you requested for {$quote_subject}. The quote is valid until {$quote_valid_until}. You may simply reply to this email with any furthur questions or requirement.</p>\r\n<p>{$signature}</p>','','','','','','',0),(37,'general','Password Reset Validation','Your login details for {$company_name}','<p>Dear {$client_name},</p><p>Recently a request was submitted to reset your password for our client area. If you did not request this, please ignore this email. It will expire and become useless in 2 hours time.</p><p>To reset your password, please visit the url below:<br /><a href=\"{$pw_reset_url}\">{$pw_reset_url}</a></p><p>When you visit the link above, your password will be reset, and the new password will be emailed to you.</p><p>{$signature}</p>','','','','','','',0),(38,'general','Password Reset Confirmation','Your new password for {$company_name}','<p>Dear {$client_name},</p><p>As you requested, your password for our client area has now been reset.  Your new login details are as follows:</p><p>{$whmcs_link}<br />Email: {$client_email}<br />Password: {$client_password}</p><p>To change your password to something more memorable, after logging in go to My Details > Change Password.</p><p>{$signature}</p>','','','','','','',0);
/*!40000 ALTER TABLE `tblemailtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfraud`
--

DROP TABLE IF EXISTS `tblfraud`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblfraud` (
  `id` int(10) NOT NULL auto_increment,
  `fraud` text NOT NULL,
  `setting` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fraud` (`fraud`(32))
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblfraud`
--

LOCK TABLES `tblfraud` WRITE;
/*!40000 ALTER TABLE `tblfraud` DISABLE KEYS */;
INSERT INTO `tblfraud` VALUES (1,'maxmind','Enable',''),(2,'maxmind','MaxMind License Key',''),(3,'maxmind','Reject Free Email Service',''),(4,'maxmind','Reject Country Mismatch',''),(5,'maxmind','Reject Anonymous Proxy',''),(6,'maxmind','Reject High Risk Country',''),(7,'maxmind','MaxMind Fraud Risk Score',''),(8,'maxmind','Perform Telephone Verification',''),(9,'maxmind','Telephone Fraud Score',''),(10,'maxmind','Language','');
/*!40000 ALTER TABLE `tblfraud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgatewaylog`
--

DROP TABLE IF EXISTS `tblgatewaylog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblgatewaylog` (
  `id` int(10) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `gateway` text NOT NULL,
  `data` text NOT NULL,
  `result` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblgatewaylog`
--

LOCK TABLES `tblgatewaylog` WRITE;
/*!40000 ALTER TABLE `tblgatewaylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblgatewaylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhosting`
--

DROP TABLE IF EXISTS `tblhosting`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblhosting` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) NOT NULL,
  `orderid` int(10) NOT NULL,
  `packageid` int(10) NOT NULL,
  `server` int(10) NOT NULL,
  `regdate` date NOT NULL,
  `domain` text NOT NULL,
  `paymentmethod` text NOT NULL,
  `firstpaymentamount` decimal(10,2) NOT NULL default '0.00',
  `amount` decimal(10,2) NOT NULL default '0.00',
  `billingcycle` text NOT NULL,
  `nextduedate` date default NULL,
  `nextinvoicedate` date NOT NULL,
  `domainstatus` enum('Pending','Active','Suspended','Terminated','Cancelled','Fraud') NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `notes` text NOT NULL,
  `subscriptionid` text NOT NULL,
  `promoid` int(10) NOT NULL,
  `overideautosuspend` text NOT NULL,
  `overidesuspenduntil` date NOT NULL,
  `dedicatedip` text NOT NULL,
  `assignedips` text NOT NULL,
  `ns1` text NOT NULL,
  `ns2` text NOT NULL,
  `diskusage` int(10) NOT NULL default '0',
  `disklimit` int(10) NOT NULL default '0',
  `bwusage` int(10) NOT NULL default '0',
  `bwlimit` int(10) NOT NULL default '0',
  `lastupdate` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `serviceid` (`id`),
  KEY `userid` (`userid`),
  KEY `orderid` (`orderid`),
  KEY `productid` (`packageid`),
  KEY `serverid` (`server`),
  KEY `domain` (`domain`(64)),
  KEY `domainstatus` (`domainstatus`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblhosting`
--

LOCK TABLES `tblhosting` WRITE;
/*!40000 ALTER TABLE `tblhosting` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhosting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhostingaddons`
--

DROP TABLE IF EXISTS `tblhostingaddons`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblhostingaddons` (
  `id` int(10) NOT NULL auto_increment,
  `orderid` int(10) NOT NULL,
  `hostingid` int(10) NOT NULL,
  `addonid` int(10) NOT NULL,
  `name` text NOT NULL,
  `setupfee` decimal(10,2) NOT NULL default '0.00',
  `recurring` decimal(10,2) NOT NULL default '0.00',
  `billingcycle` text NOT NULL,
  `tax` text NOT NULL,
  `status` enum('Pending','Active','Suspended','Terminated','Cancelled','Fraud') NOT NULL default 'Pending',
  `regdate` date NOT NULL default '0000-00-00',
  `nextduedate` date default NULL,
  `nextinvoicedate` date NOT NULL,
  `paymentmethod` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `orderid` (`orderid`),
  KEY `serviceid` (`hostingid`),
  KEY `name` (`name`(32)),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblhostingaddons`
--

LOCK TABLES `tblhostingaddons` WRITE;
/*!40000 ALTER TABLE `tblhostingaddons` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhostingaddons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhostingconfigoptions`
--

DROP TABLE IF EXISTS `tblhostingconfigoptions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblhostingconfigoptions` (
  `id` int(10) NOT NULL auto_increment,
  `relid` int(10) NOT NULL,
  `configid` int(10) NOT NULL,
  `optionid` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `relid_configid` (`relid`,`configid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblhostingconfigoptions`
--

LOCK TABLES `tblhostingconfigoptions` WRITE;
/*!40000 ALTER TABLE `tblhostingconfigoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhostingconfigoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinvoiceitems`
--

DROP TABLE IF EXISTS `tblinvoiceitems`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblinvoiceitems` (
  `id` int(10) NOT NULL auto_increment,
  `invoiceid` int(10) NOT NULL default '0',
  `userid` int(10) NOT NULL,
  `type` text NOT NULL,
  `relid` int(10) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(10,2) NOT NULL default '0.00',
  `taxed` int(1) NOT NULL,
  `duedate` date default NULL,
  `paymentmethod` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `invoiceid` (`invoiceid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblinvoiceitems`
--

LOCK TABLES `tblinvoiceitems` WRITE;
/*!40000 ALTER TABLE `tblinvoiceitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinvoiceitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinvoices`
--

DROP TABLE IF EXISTS `tblinvoices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblinvoices` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) NOT NULL,
  `invoicenum` text NOT NULL,
  `date` date default NULL,
  `duedate` date default NULL,
  `datepaid` datetime NOT NULL default '0000-00-00 00:00:00',
  `subtotal` decimal(10,2) NOT NULL,
  `credit` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `tax2` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL default '0.00',
  `taxrate` decimal(10,2) NOT NULL,
  `taxrate2` decimal(10,2) NOT NULL,
  `status` text NOT NULL,
  `paymentmethod` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`(3))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblinvoices`
--

LOCK TABLES `tblinvoices` WRITE;
/*!40000 ALTER TABLE `tblinvoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinvoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblknowledgebase`
--

DROP TABLE IF EXISTS `tblknowledgebase`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblknowledgebase` (
  `id` int(10) NOT NULL auto_increment,
  `title` text NOT NULL,
  `article` text NOT NULL,
  `views` int(10) NOT NULL default '0',
  `useful` int(10) NOT NULL default '0',
  `votes` int(10) NOT NULL default '0',
  `private` text NOT NULL,
  `parentid` int(10) NOT NULL,
  `language` text NOT NULL,
  PRIMARY KEY  (`id`),
  FULLTEXT KEY `title` (`title`,`article`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblknowledgebase`
--

LOCK TABLES `tblknowledgebase` WRITE;
/*!40000 ALTER TABLE `tblknowledgebase` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblknowledgebase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblknowledgebasecats`
--

DROP TABLE IF EXISTS `tblknowledgebasecats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblknowledgebasecats` (
  `id` int(10) NOT NULL auto_increment,
  `parentid` int(10) NOT NULL default '0',
  `name` text NOT NULL,
  `description` text NOT NULL,
  `hidden` text NOT NULL,
  `catid` int(10) NOT NULL,
  `language` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `parentid` (`parentid`),
  KEY `name` (`name`(64))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblknowledgebasecats`
--

LOCK TABLES `tblknowledgebasecats` WRITE;
/*!40000 ALTER TABLE `tblknowledgebasecats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblknowledgebasecats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblknowledgebaselinks`
--

DROP TABLE IF EXISTS `tblknowledgebaselinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblknowledgebaselinks` (
  `categoryid` int(10) NOT NULL,
  `articleid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblknowledgebaselinks`
--

LOCK TABLES `tblknowledgebaselinks` WRITE;
/*!40000 ALTER TABLE `tblknowledgebaselinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblknowledgebaselinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllinks`
--

DROP TABLE IF EXISTS `tbllinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbllinks` (
  `id` int(10) NOT NULL auto_increment,
  `name` text NOT NULL,
  `link` text NOT NULL,
  `clicks` int(10) NOT NULL,
  `conversions` int(10) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`(64))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbllinks`
--

LOCK TABLES `tbllinks` WRITE;
/*!40000 ALTER TABLE `tbllinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbllinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnetworkissues`
--

DROP TABLE IF EXISTS `tblnetworkissues`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblnetworkissues` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `type` enum('Server','System','Other') NOT NULL,
  `affecting` varchar(100) default NULL,
  `server` int(10) unsigned default NULL,
  `priority` enum('Critical','Low','Medium','High') NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime default NULL,
  `status` enum('Reported','Investigating','In Progress','Outage','Scheduled','Resolved') NOT NULL,
  `lastupdate` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblnetworkissues`
--

LOCK TABLES `tblnetworkissues` WRITE;
/*!40000 ALTER TABLE `tblnetworkissues` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnetworkissues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnotes`
--

DROP TABLE IF EXISTS `tblnotes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblnotes` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) NOT NULL,
  `adminid` int(10) NOT NULL default '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblnotes`
--

LOCK TABLES `tblnotes` WRITE;
/*!40000 ALTER TABLE `tblnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorders`
--

DROP TABLE IF EXISTS `tblorders`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblorders` (
  `id` int(10) NOT NULL auto_increment,
  `ordernum` bigint(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `contactid` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `nameservers` text NOT NULL,
  `transfersecret` text NOT NULL,
  `renewals` text NOT NULL,
  `promocode` text NOT NULL,
  `promotype` text NOT NULL,
  `promovalue` text NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paymentmethod` text NOT NULL,
  `invoiceid` int(10) NOT NULL default '0',
  `status` text NOT NULL,
  `ipaddress` text NOT NULL,
  `fraudmodule` text NOT NULL,
  `fraudoutput` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ordernum` (`ordernum`),
  KEY `userid` (`userid`),
  KEY `contactid` (`contactid`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblorders`
--

LOCK TABLES `tblorders` WRITE;
/*!40000 ALTER TABLE `tblorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpaymentgateways`
--

DROP TABLE IF EXISTS `tblpaymentgateways`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblpaymentgateways` (
  `gateway` text NOT NULL,
  `setting` text NOT NULL,
  `value` text NOT NULL,
  `order` int(1) NOT NULL,
  KEY `gateway_setting` (`gateway`(32),`setting`(32)),
  KEY `setting_value` (`setting`(32),`value`(32))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblpaymentgateways`
--

LOCK TABLES `tblpaymentgateways` WRITE;
/*!40000 ALTER TABLE `tblpaymentgateways` DISABLE KEYS */;
INSERT INTO `tblpaymentgateways` VALUES ('paypal','name','PayPal',1),('paypal','type','Invoices',0),('paypal','visible','on',0),('paypal','email','billing@here.com',0),('paypal','forceonetime','',0),('paypal','forcesubscriptions','on',0),('paypal','modifysubscriptions','on',0),('paypal','apiusername','',0),('paypal','apipassword','',0),('paypal','apisignature','',0),('paypal','convertto','',0);
/*!40000 ALTER TABLE `tblpaymentgateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpricing`
--

DROP TABLE IF EXISTS `tblpricing`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblpricing` (
  `id` int(10) NOT NULL auto_increment,
  `type` enum('product','addon','configoptions','domainregister','domaintransfer','domainrenew','domainaddons') NOT NULL,
  `currency` int(10) NOT NULL,
  `relid` int(10) NOT NULL,
  `msetupfee` decimal(10,2) NOT NULL,
  `qsetupfee` decimal(10,2) NOT NULL,
  `ssetupfee` decimal(10,2) NOT NULL,
  `asetupfee` decimal(10,2) NOT NULL,
  `bsetupfee` decimal(10,2) NOT NULL,
  `tsetupfee` decimal(10,2) NOT NULL,
  `monthly` decimal(10,2) NOT NULL,
  `quarterly` decimal(10,2) NOT NULL,
  `semiannually` decimal(10,2) NOT NULL,
  `annually` decimal(10,2) NOT NULL,
  `biennially` decimal(10,2) NOT NULL,
  `triennially` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblpricing`
--

LOCK TABLES `tblpricing` WRITE;
/*!40000 ALTER TABLE `tblpricing` DISABLE KEYS */;
INSERT INTO `tblpricing` VALUES (1,'product',1,1,'0.00','0.00','-1.00','-1.00','-1.00','-1.00','5.00','20.00','-1.00','-1.00','-1.00','-1.00'),(2,'product',1,2,'0.00','-1.00','-1.00','-1.00','-1.00','-1.00','10.00','-1.00','-1.00','-1.00','-1.00','-1.00');
/*!40000 ALTER TABLE `tblpricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductconfiggroups`
--

DROP TABLE IF EXISTS `tblproductconfiggroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblproductconfiggroups` (
  `id` int(10) NOT NULL auto_increment,
  `name` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblproductconfiggroups`
--

LOCK TABLES `tblproductconfiggroups` WRITE;
/*!40000 ALTER TABLE `tblproductconfiggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductconfiggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductconfiglinks`
--

DROP TABLE IF EXISTS `tblproductconfiglinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblproductconfiglinks` (
  `gid` int(10) NOT NULL,
  `pid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblproductconfiglinks`
--

LOCK TABLES `tblproductconfiglinks` WRITE;
/*!40000 ALTER TABLE `tblproductconfiglinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductconfiglinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductconfigoptions`
--

DROP TABLE IF EXISTS `tblproductconfigoptions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblproductconfigoptions` (
  `id` int(10) NOT NULL auto_increment,
  `gid` int(10) NOT NULL default '0',
  `optionname` text NOT NULL,
  `optiontype` text NOT NULL,
  `qtyminimum` int(10) NOT NULL,
  `qtymaximum` int(10) NOT NULL,
  `order` int(1) NOT NULL default '0',
  `hidden` int(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `productid` (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblproductconfigoptions`
--

LOCK TABLES `tblproductconfigoptions` WRITE;
/*!40000 ALTER TABLE `tblproductconfigoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductconfigoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductconfigoptionssub`
--

DROP TABLE IF EXISTS `tblproductconfigoptionssub`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblproductconfigoptionssub` (
  `id` int(10) NOT NULL auto_increment,
  `configid` int(10) NOT NULL,
  `optionname` text NOT NULL,
  `sortorder` int(10) NOT NULL default '0',
  `hidden` int(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `configid` (`configid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblproductconfigoptionssub`
--

LOCK TABLES `tblproductconfigoptionssub` WRITE;
/*!40000 ALTER TABLE `tblproductconfigoptionssub` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproductconfigoptionssub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproductgroups`
--

DROP TABLE IF EXISTS `tblproductgroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblproductgroups` (
  `id` int(10) NOT NULL auto_increment,
  `name` text NOT NULL,
  `disabledgateways` text NOT NULL,
  `hidden` text NOT NULL,
  `order` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `order` (`order`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblproductgroups`
--

LOCK TABLES `tblproductgroups` WRITE;
/*!40000 ALTER TABLE `tblproductgroups` DISABLE KEYS */;
INSERT INTO `tblproductgroups` VALUES (1,'Web Hosting','','',1),(2,'VPS Hosting','','',2);
/*!40000 ALTER TABLE `tblproductgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproducts`
--

DROP TABLE IF EXISTS `tblproducts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblproducts` (
  `id` int(10) NOT NULL auto_increment,
  `type` text NOT NULL,
  `gid` int(10) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `hidden` text NOT NULL,
  `showdomainoptions` text NOT NULL,
  `welcomeemail` int(1) NOT NULL default '0',
  `stockcontrol` text NOT NULL,
  `qty` int(1) NOT NULL default '0',
  `proratabilling` text NOT NULL,
  `proratadate` int(2) NOT NULL,
  `proratachargenextmonth` int(2) NOT NULL,
  `paytype` text NOT NULL,
  `subdomain` text NOT NULL,
  `autosetup` text NOT NULL,
  `servertype` text NOT NULL,
  `servergroup` int(10) NOT NULL,
  `configoption1` text NOT NULL,
  `configoption2` text NOT NULL,
  `configoption3` text NOT NULL,
  `configoption4` text NOT NULL,
  `configoption5` text NOT NULL,
  `configoption6` text NOT NULL,
  `configoption7` text NOT NULL,
  `configoption8` text NOT NULL,
  `configoption9` text NOT NULL,
  `configoption10` text NOT NULL,
  `configoption11` text NOT NULL,
  `configoption12` text NOT NULL,
  `configoption13` text NOT NULL,
  `configoption14` text NOT NULL,
  `configoption15` text NOT NULL,
  `configoption16` text NOT NULL,
  `configoption17` text NOT NULL,
  `configoption18` text NOT NULL,
  `configoption19` text NOT NULL,
  `configoption20` text NOT NULL,
  `configoption21` text NOT NULL,
  `configoption22` text NOT NULL,
  `configoption23` text NOT NULL,
  `configoption24` text NOT NULL,
  `freedomain` text NOT NULL,
  `freedomainpaymentterms` text NOT NULL,
  `freedomaintlds` text NOT NULL,
  `upgradepackages` text NOT NULL,
  `configoptionsupgrade` text NOT NULL,
  `billingcycleupgrade` text NOT NULL,
  `overagesenabled` int(1) NOT NULL,
  `overagesdisklimit` int(10) NOT NULL,
  `overagesbwlimit` int(10) NOT NULL,
  `overagesdiskprice` decimal(6,4) NOT NULL,
  `overagesbwprice` decimal(6,4) NOT NULL,
  `tax` int(1) NOT NULL,
  `affiliateonetime` text NOT NULL,
  `affiliatepaytype` text NOT NULL,
  `affiliatepayamount` decimal(10,2) NOT NULL,
  `downloads` text NOT NULL,
  `order` int(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `gid` (`gid`),
  KEY `name` (`name`(64))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblproducts`
--

LOCK TABLES `tblproducts` WRITE;
/*!40000 ALTER TABLE `tblproducts` DISABLE KEYS */;
INSERT INTO `tblproducts` VALUES (1,'hostingaccount',1,'Basic','','','on',1,'',0,'',0,0,'recurring','','payment','cpanel',0,'Blah','5','100','5','100','','','5','','5','','5','','5','','','','','','','','','','','','semiannually,','','N;','','',0,0,0,'0.0000','0.0000',0,'','','0.00','N;',0),(2,'server',2,'Basic VPS','','','on',17,'',0,'',0,0,'recurring','','','hypervm',0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','N;','','',0,0,0,'0.0000','0.0000',0,'','','0.00','N;',0);
/*!40000 ALTER TABLE `tblproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpromotions`
--

DROP TABLE IF EXISTS `tblpromotions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblpromotions` (
  `id` int(10) NOT NULL auto_increment,
  `code` text NOT NULL,
  `type` text NOT NULL,
  `recurring` int(1) default NULL,
  `value` decimal(10,2) NOT NULL default '0.00',
  `cycles` text NOT NULL,
  `appliesto` text NOT NULL,
  `requires` text NOT NULL,
  `requiresexisting` int(1) NOT NULL,
  `expirationdate` date default NULL,
  `maxuses` int(10) NOT NULL default '0',
  `uses` int(10) NOT NULL default '0',
  `applyonce` int(1) NOT NULL,
  `newsignups` int(1) NOT NULL,
  `existingclient` int(11) NOT NULL,
  `onceperclient` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `code` (`code`(32))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblpromotions`
--

LOCK TABLES `tblpromotions` WRITE;
/*!40000 ALTER TABLE `tblpromotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpromotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblquoteitems`
--

DROP TABLE IF EXISTS `tblquoteitems`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblquoteitems` (
  `id` int(10) NOT NULL auto_increment,
  `quoteid` int(10) NOT NULL,
  `description` text NOT NULL,
  `quantity` text NOT NULL,
  `unitprice` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `taxable` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblquoteitems`
--

LOCK TABLES `tblquoteitems` WRITE;
/*!40000 ALTER TABLE `tblquoteitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblquoteitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblquotes`
--

DROP TABLE IF EXISTS `tblquotes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblquotes` (
  `id` int(10) NOT NULL auto_increment,
  `subject` text NOT NULL,
  `stage` enum('Draft','Delivered','On Hold','Accepted','Lost','Dead') NOT NULL,
  `validuntil` date NOT NULL,
  `userid` int(10) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `companyname` text NOT NULL,
  `email` text NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `postcode` text NOT NULL,
  `country` text NOT NULL,
  `phonenumber` text NOT NULL,
  `currency` int(10) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `tax1` decimal(10,2) NOT NULL,
  `tax2` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `customernotes` text NOT NULL,
  `adminnotes` text NOT NULL,
  `datecreated` date NOT NULL,
  `lastmodified` date NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblquotes`
--

LOCK TABLES `tblquotes` WRITE;
/*!40000 ALTER TABLE `tblquotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblquotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblregistrars`
--

DROP TABLE IF EXISTS `tblregistrars`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblregistrars` (
  `id` int(10) NOT NULL auto_increment,
  `registrar` text NOT NULL,
  `setting` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `registrar_setting` (`registrar`(32),`setting`(32))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblregistrars`
--

LOCK TABLES `tblregistrars` WRITE;
/*!40000 ALTER TABLE `tblregistrars` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblregistrars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservergroups`
--

DROP TABLE IF EXISTS `tblservergroups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblservergroups` (
  `id` int(10) NOT NULL auto_increment,
  `name` text NOT NULL,
  `filltype` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblservergroups`
--

LOCK TABLES `tblservergroups` WRITE;
/*!40000 ALTER TABLE `tblservergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservergroupsrel`
--

DROP TABLE IF EXISTS `tblservergroupsrel`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblservergroupsrel` (
  `groupid` int(10) NOT NULL,
  `serverid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblservergroupsrel`
--

LOCK TABLES `tblservergroupsrel` WRITE;
/*!40000 ALTER TABLE `tblservergroupsrel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservergroupsrel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservers`
--

DROP TABLE IF EXISTS `tblservers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblservers` (
  `id` int(10) NOT NULL auto_increment,
  `name` text NOT NULL,
  `ipaddress` text NOT NULL,
  `hostname` text NOT NULL,
  `monthlycost` decimal(10,2) NOT NULL default '0.00',
  `noc` text NOT NULL,
  `statusaddress` text NOT NULL,
  `nameserver1` text NOT NULL,
  `nameserver1ip` text NOT NULL,
  `nameserver2` text NOT NULL,
  `nameserver2ip` text NOT NULL,
  `nameserver3` text NOT NULL,
  `nameserver3ip` text NOT NULL,
  `nameserver4` text NOT NULL,
  `nameserver4ip` text NOT NULL,
  `maxaccounts` int(10) NOT NULL default '0',
  `type` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `accesshash` text NOT NULL,
  `secure` text NOT NULL,
  `active` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblservers`
--

LOCK TABLES `tblservers` WRITE;
/*!40000 ALTER TABLE `tblservers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblservers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsslorders`
--

DROP TABLE IF EXISTS `tblsslorders`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblsslorders` (
  `id` int(10) NOT NULL auto_increment,
  `userid` int(10) NOT NULL,
  `serviceid` int(10) NOT NULL,
  `remoteid` text NOT NULL,
  `module` text NOT NULL,
  `certtype` text NOT NULL,
  `completiondate` datetime NOT NULL,
  `status` enum('Incomplete','Completed','Cancelled') NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblsslorders`
--

LOCK TABLES `tblsslorders` WRITE;
/*!40000 ALTER TABLE `tblsslorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsslorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltax`
--

DROP TABLE IF EXISTS `tbltax`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbltax` (
  `id` int(10) NOT NULL auto_increment,
  `level` int(1) NOT NULL,
  `name` text NOT NULL,
  `state` text NOT NULL,
  `country` text NOT NULL,
  `taxrate` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `state_country` (`state`(32),`country`(2))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbltax`
--

LOCK TABLES `tbltax` WRITE;
/*!40000 ALTER TABLE `tbltax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketbreaklines`
--

DROP TABLE IF EXISTS `tblticketbreaklines`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblticketbreaklines` (
  `id` int(10) NOT NULL auto_increment,
  `breakline` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblticketbreaklines`
--

LOCK TABLES `tblticketbreaklines` WRITE;
/*!40000 ALTER TABLE `tblticketbreaklines` DISABLE KEYS */;
INSERT INTO `tblticketbreaklines` VALUES (1,'> -----Original Message-----'),(2,'----- Original Message -----'),(3,'-----Original Message-----'),(4,'<!-- Break Line -->'),(5,'====== Please reply above this line ======'),(6,'_____');
/*!40000 ALTER TABLE `tblticketbreaklines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketdepartments`
--

DROP TABLE IF EXISTS `tblticketdepartments`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblticketdepartments` (
  `id` int(10) NOT NULL auto_increment,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `email` text NOT NULL,
  `clientsonly` text NOT NULL,
  `piperepliesonly` text NOT NULL,
  `noautoresponder` text NOT NULL,
  `hidden` text NOT NULL,
  `order` int(1) NOT NULL,
  `host` text NOT NULL,
  `port` text NOT NULL,
  `login` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`(64))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblticketdepartments`
--

LOCK TABLES `tblticketdepartments` WRITE;
/*!40000 ALTER TABLE `tblticketdepartments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketdepartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketescalations`
--

DROP TABLE IF EXISTS `tblticketescalations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblticketescalations` (
  `id` int(10) NOT NULL auto_increment,
  `name` text NOT NULL,
  `departments` text NOT NULL,
  `statuses` text NOT NULL,
  `priorities` text NOT NULL,
  `timeelapsed` int(5) NOT NULL,
  `newdepartment` text NOT NULL,
  `newpriority` text NOT NULL,
  `newstatus` text NOT NULL,
  `flagto` text NOT NULL,
  `notify` text NOT NULL,
  `addreply` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblticketescalations`
--

LOCK TABLES `tblticketescalations` WRITE;
/*!40000 ALTER TABLE `tblticketescalations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketescalations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketlog`
--

DROP TABLE IF EXISTS `tblticketlog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblticketlog` (
  `id` int(10) NOT NULL auto_increment,
  `date` datetime NOT NULL,
  `tid` int(10) NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblticketlog`
--

LOCK TABLES `tblticketlog` WRITE;
/*!40000 ALTER TABLE `tblticketlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketmaillog`
--

DROP TABLE IF EXISTS `tblticketmaillog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblticketmaillog` (
  `id` int(10) NOT NULL auto_increment,
  `date` datetime NOT NULL,
  `to` text NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblticketmaillog`
--

LOCK TABLES `tblticketmaillog` WRITE;
/*!40000 ALTER TABLE `tblticketmaillog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketmaillog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketnotes`
--

DROP TABLE IF EXISTS `tblticketnotes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblticketnotes` (
  `id` int(10) NOT NULL auto_increment,
  `ticketid` int(10) NOT NULL,
  `admin` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `message` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ticketid_date` (`ticketid`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblticketnotes`
--

LOCK TABLES `tblticketnotes` WRITE;
/*!40000 ALTER TABLE `tblticketnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketpredefinedcats`
--

DROP TABLE IF EXISTS `tblticketpredefinedcats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblticketpredefinedcats` (
  `id` int(10) NOT NULL auto_increment,
  `parentid` int(10) NOT NULL default '0',
  `name` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `parentid_name` (`parentid`,`name`(64))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblticketpredefinedcats`
--

LOCK TABLES `tblticketpredefinedcats` WRITE;
/*!40000 ALTER TABLE `tblticketpredefinedcats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketpredefinedcats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketpredefinedreplies`
--

DROP TABLE IF EXISTS `tblticketpredefinedreplies`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblticketpredefinedreplies` (
  `id` int(10) NOT NULL auto_increment,
  `catid` int(10) NOT NULL,
  `name` text NOT NULL,
  `reply` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblticketpredefinedreplies`
--

LOCK TABLES `tblticketpredefinedreplies` WRITE;
/*!40000 ALTER TABLE `tblticketpredefinedreplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketpredefinedreplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketreplies`
--

DROP TABLE IF EXISTS `tblticketreplies`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblticketreplies` (
  `id` int(10) NOT NULL auto_increment,
  `tid` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `date` datetime NOT NULL,
  `message` text NOT NULL,
  `admin` text NOT NULL,
  `attachment` text NOT NULL,
  `rating` int(5) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `tid_date` (`tid`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblticketreplies`
--

LOCK TABLES `tblticketreplies` WRITE;
/*!40000 ALTER TABLE `tblticketreplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketreplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltickets`
--

DROP TABLE IF EXISTS `tbltickets`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbltickets` (
  `id` int(10) NOT NULL auto_increment,
  `tid` int(6) NOT NULL default '0',
  `did` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `cc` text NOT NULL,
  `c` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `title` text NOT NULL,
  `message` text NOT NULL,
  `status` text NOT NULL,
  `urgency` text NOT NULL,
  `admin` text NOT NULL,
  `attachment` text NOT NULL,
  `lastreply` datetime NOT NULL,
  `flag` int(1) NOT NULL,
  `clientunread` int(1) NOT NULL,
  `adminunread` text NOT NULL,
  `replyingadmin` int(1) NOT NULL,
  `replyingtime` datetime NOT NULL,
  `service` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `tid_c` (`tid`,`c`(64)),
  KEY `userid` (`userid`),
  KEY `status` (`status`(10)),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbltickets`
--

LOCK TABLES `tbltickets` WRITE;
/*!40000 ALTER TABLE `tbltickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketspamfilters`
--

DROP TABLE IF EXISTS `tblticketspamfilters`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblticketspamfilters` (
  `id` int(10) NOT NULL auto_increment,
  `type` enum('sender','subject','phrase') NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblticketspamfilters`
--

LOCK TABLES `tblticketspamfilters` WRITE;
/*!40000 ALTER TABLE `tblticketspamfilters` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblticketspamfilters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblticketstatuses`
--

DROP TABLE IF EXISTS `tblticketstatuses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblticketstatuses` (
  `id` int(10) NOT NULL auto_increment,
  `title` text NOT NULL,
  `color` text NOT NULL,
  `sortorder` int(2) NOT NULL,
  `showactive` int(1) NOT NULL,
  `showawaiting` int(1) NOT NULL,
  `autoclose` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblticketstatuses`
--

LOCK TABLES `tblticketstatuses` WRITE;
/*!40000 ALTER TABLE `tblticketstatuses` DISABLE KEYS */;
INSERT INTO `tblticketstatuses` VALUES (1,'Open','#779500',1,1,1,0),(2,'Answered','#000000',2,1,0,1),(3,'Customer-Reply','#ff6600',3,1,1,1),(4,'Closed','#888888',10,0,0,0),(5,'On Hold','#224488',5,1,0,0),(6,'In Progress','#cc0000',6,1,0,0);
/*!40000 ALTER TABLE `tblticketstatuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltodolist`
--

DROP TABLE IF EXISTS `tbltodolist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tbltodolist` (
  `id` int(10) NOT NULL auto_increment,
  `date` date NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `admin` int(10) NOT NULL default '0',
  `status` text NOT NULL,
  `duedate` date NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `duedate` (`duedate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tbltodolist`
--

LOCK TABLES `tbltodolist` WRITE;
/*!40000 ALTER TABLE `tbltodolist` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltodolist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblupgrades`
--

DROP TABLE IF EXISTS `tblupgrades`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblupgrades` (
  `id` int(10) NOT NULL auto_increment,
  `orderid` int(10) NOT NULL,
  `type` text NOT NULL,
  `date` date NOT NULL,
  `relid` int(10) NOT NULL,
  `originalvalue` text NOT NULL,
  `newvalue` text NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `recurringchange` decimal(10,2) NOT NULL,
  `status` enum('Pending','Completed') NOT NULL default 'Pending',
  `paid` enum('Y','N') NOT NULL default 'N',
  PRIMARY KEY  (`id`),
  KEY `orderid` (`orderid`),
  KEY `serviceid` (`relid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblupgrades`
--

LOCK TABLES `tblupgrades` WRITE;
/*!40000 ALTER TABLE `tblupgrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblupgrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwhoislog`
--

DROP TABLE IF EXISTS `tblwhoislog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblwhoislog` (
  `id` int(10) NOT NULL auto_increment,
  `date` datetime NOT NULL,
  `domain` text NOT NULL,
  `ip` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblwhoislog`
--

LOCK TABLES `tblwhoislog` WRITE;
/*!40000 ALTER TABLE `tblwhoislog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwhoislog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `you-niquegarters`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `you-niquegarters` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `you-niquegarters`;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `address_book` (
  `address_book_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `entry_gender` char(1) NOT NULL,
  `entry_company` varchar(32) default NULL,
  `entry_firstname` varchar(32) NOT NULL,
  `entry_lastname` varchar(32) NOT NULL,
  `entry_street_address` varchar(64) NOT NULL,
  `entry_suburb` varchar(32) default NULL,
  `entry_postcode` varchar(10) NOT NULL,
  `entry_city` varchar(32) NOT NULL,
  `entry_state` varchar(32) default NULL,
  `entry_country_id` int(11) NOT NULL default '0',
  `entry_zone_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`address_book_id`),
  KEY `idx_address_book_customers_id` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
INSERT INTO `address_book` VALUES (1,1,'m','ACME Inc.','John','Doe','1 Way Street','','12345','NeverNever','',223,12),(2,2,'m','','Kris','Anderson','8464 Creekbluff Dr','','75249','Dallas','',223,57);
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_format`
--

DROP TABLE IF EXISTS `address_format`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `address_format` (
  `address_format_id` int(11) NOT NULL auto_increment,
  `address_format` varchar(128) NOT NULL,
  `address_summary` varchar(48) NOT NULL,
  PRIMARY KEY  (`address_format_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `address_format`
--

LOCK TABLES `address_format` WRITE;
/*!40000 ALTER TABLE `address_format` DISABLE KEYS */;
INSERT INTO `address_format` VALUES (1,'$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country','$city / $country'),(2,'$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country','$city, $state / $country'),(3,'$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country','$state / $country'),(4,'$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country','$postcode / $country'),(5,'$firstname $lastname$cr$streets$cr$postcode $city$cr$country','$city / $country');
/*!40000 ALTER TABLE `address_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `administrators` (
  `id` int(11) NOT NULL auto_increment,
  `user_name` varchar(32) character set latin1 collate latin1_bin NOT NULL,
  `user_password` varchar(40) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'d.ulrich@you-niquegarters.com','2ee4e0fa25210bd232e40c1e852d254f:35');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `banners` (
  `banners_id` int(11) NOT NULL auto_increment,
  `banners_title` varchar(64) NOT NULL,
  `banners_url` varchar(255) NOT NULL,
  `banners_image` varchar(64) NOT NULL,
  `banners_group` varchar(10) NOT NULL,
  `banners_html_text` text,
  `expires_impressions` int(7) default '0',
  `expires_date` datetime default NULL,
  `date_scheduled` datetime default NULL,
  `date_added` datetime NOT NULL,
  `date_status_change` datetime default NULL,
  `status` int(1) NOT NULL default '1',
  PRIMARY KEY  (`banners_id`),
  KEY `idx_banners_group` (`banners_group`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (2,'You-Nique Garters','http://www.you-niquegarters.com/','etsy.png','468x50','',NULL,NULL,NULL,'2010-09-29 17:45:28',NULL,1);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners_history`
--

DROP TABLE IF EXISTS `banners_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `banners_history` (
  `banners_history_id` int(11) NOT NULL auto_increment,
  `banners_id` int(11) NOT NULL,
  `banners_shown` int(5) NOT NULL default '0',
  `banners_clicked` int(5) NOT NULL default '0',
  `banners_history_date` datetime NOT NULL,
  PRIMARY KEY  (`banners_history_id`),
  KEY `idx_banners_history_banners_id` (`banners_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `banners_history`
--

LOCK TABLES `banners_history` WRITE;
/*!40000 ALTER TABLE `banners_history` DISABLE KEYS */;
INSERT INTO `banners_history` VALUES (3,2,80,2,'2010-09-30 00:23:30'),(2,2,63,0,'2010-09-29 18:07:44');
/*!40000 ALTER TABLE `banners_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL auto_increment,
  `categories_image` varchar(64) default NULL,
  `parent_id` int(11) NOT NULL default '0',
  `sort_order` int(3) default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  PRIMARY KEY  (`categories_id`),
  KEY `idx_categories_parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (22,NULL,0,0,'2010-09-30 00:32:54',NULL),(21,'SANY0023 (2).JPG',0,1,'2010-09-29 17:54:37','2010-09-30 00:37:18');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_description`
--

DROP TABLE IF EXISTS `categories_description`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `categories_description` (
  `categories_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `categories_name` varchar(32) NOT NULL,
  PRIMARY KEY  (`categories_id`,`language_id`),
  KEY `idx_categories_name` (`categories_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `categories_description`
--

LOCK TABLES `categories_description` WRITE;
/*!40000 ALTER TABLE `categories_description` DISABLE KEYS */;
INSERT INTO `categories_description` VALUES (22,1,'Bridal Garters'),(21,1,'Flask Garters');
/*!40000 ALTER TABLE `categories_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `configuration` (
  `configuration_id` int(11) NOT NULL auto_increment,
  `configuration_title` varchar(255) NOT NULL,
  `configuration_key` varchar(255) NOT NULL,
  `configuration_value` varchar(255) NOT NULL,
  `configuration_description` varchar(255) NOT NULL,
  `configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) default NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  `use_function` varchar(255) default NULL,
  `set_function` varchar(255) default NULL,
  PRIMARY KEY  (`configuration_id`)
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'Store Name','STORE_NAME','You-Nique Garters','The name of my store',1,1,'2010-09-29 18:16:09','2010-09-29 12:20:11',NULL,NULL),(2,'Store Owner','STORE_OWNER','','The name of my store owner',1,2,NULL,'2010-09-29 12:20:11',NULL,NULL),(3,'E-Mail Address','STORE_OWNER_EMAIL_ADDRESS','sales@you-niquegarters.com','The e-mail address of my store owner',1,3,NULL,'2010-09-29 12:20:11',NULL,NULL),(4,'E-Mail From','EMAIL_FROM','You-Nique Garters <sales@you-niquegarters.com>','The e-mail address used in (sent) e-mails',1,4,'2010-09-29 12:36:37','2010-09-29 12:20:11',NULL,NULL),(5,'Country','STORE_COUNTRY','223','The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>',1,6,NULL,'2010-09-29 12:20:11','tep_get_country_name','tep_cfg_pull_down_country_list('),(6,'Zone','STORE_ZONE','62','The zone my store is located in',1,7,'2010-09-29 12:36:50','2010-09-29 12:20:11','tep_cfg_get_zone_name','tep_cfg_pull_down_zone_list('),(7,'Expected Sort Order','EXPECTED_PRODUCTS_SORT','desc','This is the sort order used in the expected products box.',1,8,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'asc\', \'desc\'), '),(8,'Expected Sort Field','EXPECTED_PRODUCTS_FIELD','date_expected','The column to sort by in the expected products box.',1,9,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'products_name\', \'date_expected\'), '),(9,'Switch To Default Language Currency','USE_DEFAULT_LANGUAGE_CURRENCY','false','Automatically switch to the language\'s currency when it is changed',1,10,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(10,'Send Extra Order Emails To','SEND_EXTRA_ORDER_EMAILS_TO','','Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;',1,11,NULL,'2010-09-29 12:20:11',NULL,NULL),(11,'Use Search-Engine Safe URLs (still in development)','SEARCH_ENGINE_FRIENDLY_URLS','false','Use search-engine safe urls for all site links',1,12,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(12,'Display Cart After Adding Product','DISPLAY_CART','true','Display the shopping cart after adding a product (or return back to their origin)',1,14,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(13,'Allow Guest To Tell A Friend','ALLOW_GUEST_TO_TELL_A_FRIEND','false','Allow guests to tell a friend about a product',1,15,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(14,'Default Search Operator','ADVANCED_SEARCH_DEFAULT_OPERATOR','and','Default search operators',1,17,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'and\', \'or\'), '),(15,'Store Address and Phone','STORE_NAME_ADDRESS','Store Name\nAddress\nCountry\nPhone','This is the Store Name, Address and Phone used on printable documents and displayed online',1,18,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_textarea('),(16,'Show Category Counts','SHOW_COUNTS','true','Count recursively how many products are in each category',1,19,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(17,'Tax Decimal Places','TAX_DECIMAL_PLACES','0','Pad the tax value this amount of decimal places',1,20,NULL,'2010-09-29 12:20:11',NULL,NULL),(18,'Display Prices with Tax','DISPLAY_PRICE_WITH_TAX','false','Display prices with tax included (true) or add the tax at the end (false)',1,21,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(19,'First Name','ENTRY_FIRST_NAME_MIN_LENGTH','2','Minimum length of first name',2,1,NULL,'2010-09-29 12:20:11',NULL,NULL),(20,'Last Name','ENTRY_LAST_NAME_MIN_LENGTH','2','Minimum length of last name',2,2,NULL,'2010-09-29 12:20:11',NULL,NULL),(21,'Date of Birth','ENTRY_DOB_MIN_LENGTH','10','Minimum length of date of birth',2,3,NULL,'2010-09-29 12:20:11',NULL,NULL),(22,'E-Mail Address','ENTRY_EMAIL_ADDRESS_MIN_LENGTH','6','Minimum length of e-mail address',2,4,NULL,'2010-09-29 12:20:11',NULL,NULL),(23,'Street Address','ENTRY_STREET_ADDRESS_MIN_LENGTH','5','Minimum length of street address',2,5,NULL,'2010-09-29 12:20:11',NULL,NULL),(24,'Company','ENTRY_COMPANY_MIN_LENGTH','2','Minimum length of company name',2,6,NULL,'2010-09-29 12:20:11',NULL,NULL),(25,'Post Code','ENTRY_POSTCODE_MIN_LENGTH','4','Minimum length of post code',2,7,NULL,'2010-09-29 12:20:11',NULL,NULL),(26,'City','ENTRY_CITY_MIN_LENGTH','3','Minimum length of city',2,8,NULL,'2010-09-29 12:20:11',NULL,NULL),(27,'State','ENTRY_STATE_MIN_LENGTH','2','Minimum length of state',2,9,NULL,'2010-09-29 12:20:11',NULL,NULL),(28,'Telephone Number','ENTRY_TELEPHONE_MIN_LENGTH','3','Minimum length of telephone number',2,10,NULL,'2010-09-29 12:20:11',NULL,NULL),(29,'Password','ENTRY_PASSWORD_MIN_LENGTH','5','Minimum length of password',2,11,NULL,'2010-09-29 12:20:11',NULL,NULL),(30,'Credit Card Owner Name','CC_OWNER_MIN_LENGTH','3','Minimum length of credit card owner name',2,12,NULL,'2010-09-29 12:20:11',NULL,NULL),(31,'Credit Card Number','CC_NUMBER_MIN_LENGTH','10','Minimum length of credit card number',2,13,NULL,'2010-09-29 12:20:11',NULL,NULL),(32,'Review Text','REVIEW_TEXT_MIN_LENGTH','50','Minimum length of review text',2,14,NULL,'2010-09-29 12:20:11',NULL,NULL),(33,'Best Sellers','MIN_DISPLAY_BESTSELLERS','1','Minimum number of best sellers to display',2,15,NULL,'2010-09-29 12:20:11',NULL,NULL),(34,'Also Purchased','MIN_DISPLAY_ALSO_PURCHASED','1','Minimum number of products to display in the \'This Customer Also Purchased\' box',2,16,NULL,'2010-09-29 12:20:11',NULL,NULL),(35,'Address Book Entries','MAX_ADDRESS_BOOK_ENTRIES','5','Maximum address book entries a customer is allowed to have',3,1,NULL,'2010-09-29 12:20:11',NULL,NULL),(36,'Search Results','MAX_DISPLAY_SEARCH_RESULTS','20','Amount of products to list',3,2,NULL,'2010-09-29 12:20:11',NULL,NULL),(37,'Page Links','MAX_DISPLAY_PAGE_LINKS','5','Number of \'number\' links use for page-sets',3,3,NULL,'2010-09-29 12:20:11',NULL,NULL),(38,'Special Products','MAX_DISPLAY_SPECIAL_PRODUCTS','9','Maximum number of products on special to display',3,4,NULL,'2010-09-29 12:20:11',NULL,NULL),(39,'New Products Module','MAX_DISPLAY_NEW_PRODUCTS','9','Maximum number of new products to display in a category',3,5,NULL,'2010-09-29 12:20:11',NULL,NULL),(40,'Products Expected','MAX_DISPLAY_UPCOMING_PRODUCTS','10','Maximum number of products expected to display',3,6,NULL,'2010-09-29 12:20:11',NULL,NULL),(41,'Manufacturers List','MAX_DISPLAY_MANUFACTURERS_IN_A_LIST','0','Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list',3,7,NULL,'2010-09-29 12:20:11',NULL,NULL),(42,'Manufacturers Select Size','MAX_MANUFACTURERS_LIST','1','Used in manufacturers box; when this value is \'1\' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.',3,7,NULL,'2010-09-29 12:20:11',NULL,NULL),(43,'Length of Manufacturers Name','MAX_DISPLAY_MANUFACTURER_NAME_LEN','15','Used in manufacturers box; maximum length of manufacturers name to display',3,8,NULL,'2010-09-29 12:20:11',NULL,NULL),(44,'New Reviews','MAX_DISPLAY_NEW_REVIEWS','6','Maximum number of new reviews to display',3,9,NULL,'2010-09-29 12:20:11',NULL,NULL),(45,'Selection of Random Reviews','MAX_RANDOM_SELECT_REVIEWS','10','How many records to select from to choose one random product review',3,10,NULL,'2010-09-29 12:20:11',NULL,NULL),(46,'Selection of Random New Products','MAX_RANDOM_SELECT_NEW','10','How many records to select from to choose one random new product to display',3,11,NULL,'2010-09-29 12:20:11',NULL,NULL),(47,'Selection of Products on Special','MAX_RANDOM_SELECT_SPECIALS','10','How many records to select from to choose one random product special to display',3,12,NULL,'2010-09-29 12:20:11',NULL,NULL),(48,'Categories To List Per Row','MAX_DISPLAY_CATEGORIES_PER_ROW','3','How many categories to list per row',3,13,NULL,'2010-09-29 12:20:11',NULL,NULL),(49,'New Products Listing','MAX_DISPLAY_PRODUCTS_NEW','10','Maximum number of new products to display in new products page',3,14,NULL,'2010-09-29 12:20:11',NULL,NULL),(50,'Best Sellers','MAX_DISPLAY_BESTSELLERS','10','Maximum number of best sellers to display',3,15,NULL,'2010-09-29 12:20:11',NULL,NULL),(51,'Also Purchased','MAX_DISPLAY_ALSO_PURCHASED','6','Maximum number of products to display in the \'This Customer Also Purchased\' box',3,16,NULL,'2010-09-29 12:20:11',NULL,NULL),(52,'Customer Order History Box','MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX','6','Maximum number of products to display in the customer order history box',3,17,NULL,'2010-09-29 12:20:11',NULL,NULL),(53,'Order History','MAX_DISPLAY_ORDER_HISTORY','10','Maximum number of orders to display in the order history page',3,18,NULL,'2010-09-29 12:20:11',NULL,NULL),(54,'Product Quantities In Shopping Cart','MAX_QTY_IN_CART','99','Maximum number of product quantities that can be added to the shopping cart (0 for no limit)',3,19,NULL,'2010-09-29 12:20:11',NULL,NULL),(55,'Small Image Width','SMALL_IMAGE_WIDTH','100','The pixel width of small images',4,1,NULL,'2010-09-29 12:20:11',NULL,NULL),(56,'Small Image Height','SMALL_IMAGE_HEIGHT','80','The pixel height of small images',4,2,NULL,'2010-09-29 12:20:11',NULL,NULL),(57,'Heading Image Width','HEADING_IMAGE_WIDTH','57','The pixel width of heading images',4,3,NULL,'2010-09-29 12:20:11',NULL,NULL),(58,'Heading Image Height','HEADING_IMAGE_HEIGHT','40','The pixel height of heading images',4,4,NULL,'2010-09-29 12:20:11',NULL,NULL),(59,'Subcategory Image Width','SUBCATEGORY_IMAGE_WIDTH','100','The pixel width of subcategory images',4,5,NULL,'2010-09-29 12:20:11',NULL,NULL),(60,'Subcategory Image Height','SUBCATEGORY_IMAGE_HEIGHT','57','The pixel height of subcategory images',4,6,NULL,'2010-09-29 12:20:11',NULL,NULL),(61,'Calculate Image Size','CONFIG_CALCULATE_IMAGE_SIZE','true','Calculate the size of images?',4,7,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(62,'Image Required','IMAGE_REQUIRED','true','Enable to display broken images. Good for development.',4,8,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(63,'Gender','ACCOUNT_GENDER','true','Display gender in the customers account',5,1,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(64,'Date of Birth','ACCOUNT_DOB','true','Display date of birth in the customers account',5,2,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(65,'Company','ACCOUNT_COMPANY','true','Display company in the customers account',5,3,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(66,'Suburb','ACCOUNT_SUBURB','true','Display suburb in the customers account',5,4,'2010-09-29 12:37:25','2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(67,'State','ACCOUNT_STATE','true','Display state in the customers account',5,5,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(68,'Installed Modules','MODULE_PAYMENT_INSTALLED','paypal_standard.php','List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)',6,0,'2010-09-30 17:48:13','2010-09-29 12:20:11',NULL,NULL),(69,'Installed Modules','MODULE_ORDER_TOTAL_INSTALLED','ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php','List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)',6,0,NULL,'2010-09-29 12:20:11',NULL,NULL),(70,'Installed Modules','MODULE_SHIPPING_INSTALLED','flat.php','List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)',6,0,'2010-09-30 17:47:31','2010-09-29 12:20:11',NULL,NULL),(85,'Default Currency','DEFAULT_CURRENCY','USD','Default Currency',6,0,NULL,'2010-09-29 12:20:11',NULL,NULL),(86,'Default Language','DEFAULT_LANGUAGE','en','Default Language',6,0,NULL,'2010-09-29 12:20:11',NULL,NULL),(87,'Default Order Status For New Orders','DEFAULT_ORDERS_STATUS_ID','1','When a new order is created, this order status will be assigned to it.',6,0,NULL,'2010-09-29 12:20:11',NULL,NULL),(88,'Display Shipping','MODULE_ORDER_TOTAL_SHIPPING_STATUS','true','Do you want to display the order shipping cost?',6,1,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(89,'Sort Order','MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER','2','Sort order of display.',6,2,NULL,'2010-09-29 12:20:11',NULL,NULL),(90,'Allow Free Shipping','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING','false','Do you want to allow free shipping?',6,3,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(91,'Free Shipping For Orders Over','MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER','50','Provide free shipping for orders over the set amount.',6,4,NULL,'2010-09-29 12:20:11','currencies->format',NULL),(92,'Provide Free Shipping For Orders Made','MODULE_ORDER_TOTAL_SHIPPING_DESTINATION','national','Provide free shipping for orders sent to the set destination.',6,5,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'national\', \'international\', \'both\'), '),(93,'Display Sub-Total','MODULE_ORDER_TOTAL_SUBTOTAL_STATUS','true','Do you want to display the order sub-total cost?',6,1,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(94,'Sort Order','MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER','1','Sort order of display.',6,2,NULL,'2010-09-29 12:20:11',NULL,NULL),(95,'Display Tax','MODULE_ORDER_TOTAL_TAX_STATUS','true','Do you want to display the order tax value?',6,1,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(96,'Sort Order','MODULE_ORDER_TOTAL_TAX_SORT_ORDER','3','Sort order of display.',6,2,NULL,'2010-09-29 12:20:11',NULL,NULL),(97,'Display Total','MODULE_ORDER_TOTAL_TOTAL_STATUS','true','Do you want to display the total order value?',6,1,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(98,'Sort Order','MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER','4','Sort order of display.',6,2,NULL,'2010-09-29 12:20:11',NULL,NULL),(99,'Country of Origin','SHIPPING_ORIGIN_COUNTRY','223','Select the country of origin to be used in shipping quotes.',7,1,NULL,'2010-09-29 12:20:11','tep_get_country_name','tep_cfg_pull_down_country_list('),(100,'Postal Code','SHIPPING_ORIGIN_ZIP','98664','Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.',7,2,'2010-09-29 18:13:31','2010-09-29 12:20:11',NULL,NULL),(101,'Enter the Maximum Package Weight you will ship','SHIPPING_MAX_WEIGHT','50','Carriers have a max weight limit for a single package. This is a common one for all.',7,3,NULL,'2010-09-29 12:20:11',NULL,NULL),(102,'Package Tare weight.','SHIPPING_BOX_WEIGHT','3','What is the weight of typical packaging of small to medium packages?',7,4,NULL,'2010-09-29 12:20:11',NULL,NULL),(103,'Larger packages - percentage increase.','SHIPPING_BOX_PADDING','10','For 10% enter 10',7,5,NULL,'2010-09-29 12:20:11',NULL,NULL),(104,'Display Product Image','PRODUCT_LIST_IMAGE','1','Do you want to display the Product Image?',8,1,NULL,'2010-09-29 12:20:11',NULL,NULL),(105,'Display Product Manufaturer Name','PRODUCT_LIST_MANUFACTURER','0','Do you want to display the Product Manufacturer Name?',8,2,NULL,'2010-09-29 12:20:11',NULL,NULL),(106,'Display Product Model','PRODUCT_LIST_MODEL','0','Do you want to display the Product Model?',8,3,NULL,'2010-09-29 12:20:11',NULL,NULL),(107,'Display Product Name','PRODUCT_LIST_NAME','2','Do you want to display the Product Name?',8,4,NULL,'2010-09-29 12:20:11',NULL,NULL),(108,'Display Product Price','PRODUCT_LIST_PRICE','3','Do you want to display the Product Price',8,5,NULL,'2010-09-29 12:20:11',NULL,NULL),(109,'Display Product Quantity','PRODUCT_LIST_QUANTITY','0','Do you want to display the Product Quantity?',8,6,NULL,'2010-09-29 12:20:11',NULL,NULL),(110,'Display Product Weight','PRODUCT_LIST_WEIGHT','0','Do you want to display the Product Weight?',8,7,NULL,'2010-09-29 12:20:11',NULL,NULL),(111,'Display Buy Now column','PRODUCT_LIST_BUY_NOW','4','Do you want to display the Buy Now column?',8,8,NULL,'2010-09-29 12:20:11',NULL,NULL),(112,'Display Category/Manufacturer Filter (0=disable; 1=enable)','PRODUCT_LIST_FILTER','0','Do you want to display the Category/Manufacturer Filter?',8,9,'2010-09-30 10:19:23','2010-09-29 12:20:11',NULL,NULL),(113,'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)','PREV_NEXT_BAR_LOCATION','2','Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)',8,10,NULL,'2010-09-29 12:20:11',NULL,NULL),(114,'Check stock level','STOCK_CHECK','true','Check to see if sufficent stock is available',9,1,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(115,'Subtract stock','STOCK_LIMITED','true','Subtract product in stock by product orders',9,2,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(116,'Allow Checkout','STOCK_ALLOW_CHECKOUT','true','Allow customer to checkout even if there is insufficient stock',9,3,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(117,'Mark product out of stock','STOCK_MARK_PRODUCT_OUT_OF_STOCK','***','Display something on screen so customer can see which product has insufficient stock',9,4,NULL,'2010-09-29 12:20:11',NULL,NULL),(118,'Stock Re-order level','STOCK_REORDER_LEVEL','5','Define when stock needs to be re-ordered',9,5,NULL,'2010-09-29 12:20:11',NULL,NULL),(119,'Store Page Parse Time','STORE_PAGE_PARSE_TIME','false','Store the time it takes to parse a page',10,1,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(120,'Log Destination','STORE_PAGE_PARSE_TIME_LOG','/var/log/www/tep/page_parse_time.log','Directory and filename of the page parse time log',10,2,NULL,'2010-09-29 12:20:11',NULL,NULL),(121,'Log Date Format','STORE_PARSE_DATE_TIME_FORMAT','%d/%m/%Y %H:%M:%S','The date format',10,3,NULL,'2010-09-29 12:20:11',NULL,NULL),(122,'Display The Page Parse Time','DISPLAY_PAGE_PARSE_TIME','true','Display the page parse time (store page parse time must be enabled)',10,4,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(123,'Store Database Queries','STORE_DB_TRANSACTIONS','false','Store the database queries in the page parse time log (PHP4 only)',10,5,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(124,'Use Cache','USE_CACHE','false','Use caching features',11,1,'2010-09-30 17:37:03','2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(125,'Cache Directory','DIR_FS_CACHE','/home/zeeway/you-niquegarters.com/private/work','The directory where the cached files are saved',11,2,'2010-09-29 12:47:47','2010-09-29 12:20:11',NULL,NULL),(126,'E-Mail Transport Method','EMAIL_TRANSPORT','sendmail','Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.',12,1,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),'),(127,'E-Mail Linefeeds','EMAIL_LINEFEED','LF','Defines the character sequence used to separate mail headers.',12,2,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'LF\', \'CRLF\'),'),(128,'Use MIME HTML When Sending Emails','EMAIL_USE_HTML','false','Send e-mails in HTML format',12,3,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'),'),(129,'Verify E-Mail Addresses Through DNS','ENTRY_EMAIL_ADDRESS_CHECK','false','Verify e-mail address through a DNS server',12,4,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(130,'Send E-Mails','SEND_EMAILS','true','Send out e-mails',12,5,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(131,'Enable download','DOWNLOAD_ENABLED','false','Enable the products download functions.',13,1,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(132,'Download by redirect','DOWNLOAD_BY_REDIRECT','false','Use browser redirection for download. Disable on non-Unix systems.',13,2,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(133,'Expiry delay (days)','DOWNLOAD_MAX_DAYS','7','Set number of days before the download link expires. 0 means no limit.',13,3,NULL,'2010-09-29 12:20:11',NULL,''),(134,'Maximum number of downloads','DOWNLOAD_MAX_COUNT','5','Set the maximum number of downloads. 0 means no download authorized.',13,4,NULL,'2010-09-29 12:20:11',NULL,''),(135,'Enable GZip Compression','GZIP_COMPRESSION','true','Enable HTTP GZip compression.',14,1,'2010-09-29 12:36:02','2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'true\', \'false\'), '),(136,'Compression Level','GZIP_LEVEL','5','Use this compression level 0-9 (0 = minimum, 9 = maximum).',14,2,NULL,'2010-09-29 12:20:11',NULL,NULL),(137,'Session Directory','SESSION_WRITE_DIRECTORY','/home/zeeway/you-niquegarters.com/private/sessions','If sessions are file based, store them in this directory.',15,1,'2010-09-29 12:39:56','2010-09-29 12:20:11',NULL,NULL),(138,'Force Cookie Use','SESSION_FORCE_COOKIE_USE','False','Force the use of sessions when cookies are only enabled.',15,2,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(139,'Check SSL Session ID','SESSION_CHECK_SSL_SESSION_ID','False','Validate the SSL_SESSION_ID on every secure HTTPS page request.',15,3,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(140,'Check User Agent','SESSION_CHECK_USER_AGENT','False','Validate the clients browser user agent on every page request.',15,4,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(141,'Check IP Address','SESSION_CHECK_IP_ADDRESS','False','Validate the clients IP address on every page request.',15,5,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(142,'Prevent Spider Sessions','SESSION_BLOCK_SPIDERS','True','Prevent known spiders from starting a session.',15,6,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(143,'Recreate Session','SESSION_RECREATE','False','Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).',15,7,NULL,'2010-09-29 12:20:11',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(161,'Transaction Method','MODULE_PAYMENT_PAYPAL_STANDARD_TRANSACTION_METHOD','Sale','The processing method to use for each transaction.',6,0,NULL,'2010-09-29 12:22:34',NULL,'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), '),(160,'Gateway Server','MODULE_PAYMENT_PAYPAL_STANDARD_GATEWAY_SERVER','Live','Use the testing (sandbox) or live gateway server for transactions?',6,6,NULL,'2010-09-29 12:22:34',NULL,'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), '),(159,'Set PayPal Acknowledged Order Status','MODULE_PAYMENT_PAYPAL_STANDARD_ORDER_STATUS_ID','0','Set the status of orders made with this payment module to this value',6,0,NULL,'2010-09-29 12:22:34','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(158,'Set Preparing Order Status','MODULE_PAYMENT_PAYPAL_STANDARD_PREPARE_ORDER_STATUS_ID','4','Set the status of prepared orders made with this payment module to this value',6,0,NULL,'2010-09-29 12:22:34','tep_get_order_status_name','tep_cfg_pull_down_order_statuses('),(157,'Payment Zone','MODULE_PAYMENT_PAYPAL_STANDARD_ZONE','0','If a zone is selected, only enable this payment method for that zone.',6,2,NULL,'2010-09-29 12:22:34','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(156,'Sort order of display.','MODULE_PAYMENT_PAYPAL_STANDARD_SORT_ORDER','0','Sort order of display. Lowest is displayed first.',6,0,NULL,'2010-09-29 12:22:34',NULL,NULL),(155,'E-Mail Address','MODULE_PAYMENT_PAYPAL_STANDARD_ID','sycomom67@aol.com','The PayPal seller e-mail address to accept payments for',6,4,NULL,'2010-09-29 12:22:34',NULL,NULL),(154,'Enable PayPal Website Payments Standard','MODULE_PAYMENT_PAYPAL_STANDARD_STATUS','True','Do you want to accept PayPal Website Payments Standard payments?',6,3,NULL,'2010-09-29 12:22:34',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(162,'Page Style','MODULE_PAYMENT_PAYPAL_STANDARD_PAGE_STYLE','','The page style to use for the transaction procedure (defined at your PayPal Profile page)',6,4,NULL,'2010-09-29 12:22:34',NULL,NULL),(163,'Debug E-Mail Address','MODULE_PAYMENT_PAYPAL_STANDARD_DEBUG_EMAIL','','All parameters of an Invalid IPN notification will be sent to this email address if one is entered.',6,4,NULL,'2010-09-29 12:22:34',NULL,NULL),(164,'Enable Encrypted Web Payments','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_STATUS','False','Do you want to enable Encrypted Web Payments?',6,3,NULL,'2010-09-29 12:22:34',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), '),(165,'Your Private Key','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_PRIVATE_KEY','','The location of your Private Key to use for signing the data. (*.pem)',6,4,NULL,'2010-09-29 12:22:34',NULL,NULL),(166,'Your Public Certificate','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_PUBLIC_KEY','','The location of your Public Certificate to use for signing the data. (*.pem)',6,4,NULL,'2010-09-29 12:22:34',NULL,NULL),(167,'PayPals Public Certificate','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_PAYPAL_KEY','','The location of the PayPal Public Certificate for encrypting the data.',6,4,NULL,'2010-09-29 12:22:34',NULL,NULL),(168,'Your PayPal Public Certificate ID','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_CERT_ID','','The Certificate ID to use from your PayPal Encrypted Payment Settings Profile.',6,4,NULL,'2010-09-29 12:22:34',NULL,NULL),(169,'Working Directory','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_WORKING_DIRECTORY','/home/zeeway/you-niquegarters.com/private/work','The working directory to use for temporary files. (trailing slash needed)',6,4,NULL,'2010-09-29 12:22:34',NULL,NULL),(170,'OpenSSL Location','MODULE_PAYMENT_PAYPAL_STANDARD_EWP_OPENSSL','/usr/bin/openssl','The location of the openssl binary file.',6,4,NULL,'2010-09-29 12:22:34',NULL,NULL),(182,'Sort Order','MODULE_SHIPPING_FLAT_SORT_ORDER','0','Sort order of display.',6,0,NULL,'2010-09-30 17:47:31',NULL,NULL),(181,'Shipping Zone','MODULE_SHIPPING_FLAT_ZONE','0','If a zone is selected, only enable this shipping method for that zone.',6,0,NULL,'2010-09-30 17:47:31','tep_get_zone_class_title','tep_cfg_pull_down_zone_classes('),(180,'Tax Class','MODULE_SHIPPING_FLAT_TAX_CLASS','0','Use the following tax class on the shipping fee.',6,0,NULL,'2010-09-30 17:47:31','tep_get_tax_class_title','tep_cfg_pull_down_tax_classes('),(179,'Shipping Cost','MODULE_SHIPPING_FLAT_COST','5.00','The shipping cost for all orders using this shipping method.',6,0,NULL,'2010-09-30 17:47:31',NULL,NULL),(178,'Enable Flat Shipping','MODULE_SHIPPING_FLAT_STATUS','True','Do you want to offer flat rate shipping?',6,0,NULL,'2010-09-30 17:47:31',NULL,'tep_cfg_select_option(array(\'True\', \'False\'), ');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuration_group`
--

DROP TABLE IF EXISTS `configuration_group`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `configuration_group` (
  `configuration_group_id` int(11) NOT NULL auto_increment,
  `configuration_group_title` varchar(64) NOT NULL,
  `configuration_group_description` varchar(255) NOT NULL,
  `sort_order` int(5) default NULL,
  `visible` int(1) default '1',
  PRIMARY KEY  (`configuration_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `configuration_group`
--

LOCK TABLES `configuration_group` WRITE;
/*!40000 ALTER TABLE `configuration_group` DISABLE KEYS */;
INSERT INTO `configuration_group` VALUES (1,'My Store','General information about my store',1,1),(2,'Minimum Values','The minimum values for functions / data',2,1),(3,'Maximum Values','The maximum values for functions / data',3,1),(4,'Images','Image parameters',4,1),(5,'Customer Details','Customer account configuration',5,1),(6,'Module Options','Hidden from configuration',6,0),(7,'Shipping/Packaging','Shipping options available at my store',7,1),(8,'Product Listing','Product Listing    configuration options',8,1),(9,'Stock','Stock configuration options',9,1),(10,'Logging','Logging configuration options',10,1),(11,'Cache','Caching configuration options',11,1),(12,'E-Mail Options','General setting for E-Mail transport and HTML E-Mails',12,1),(13,'Download','Downloadable products options',13,1),(14,'GZip Compression','GZip compression options',14,1),(15,'Sessions','Session options',15,1);
/*!40000 ALTER TABLE `configuration_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `counter` (
  `startdate` char(8) default NULL,
  `counter` int(12) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES ('20100929',235);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter_history`
--

DROP TABLE IF EXISTS `counter_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `counter_history` (
  `month` char(8) default NULL,
  `counter` int(12) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `counter_history`
--

LOCK TABLES `counter_history` WRITE;
/*!40000 ALTER TABLE `counter_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `counter_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `countries` (
  `countries_id` int(11) NOT NULL auto_increment,
  `countries_name` varchar(64) NOT NULL,
  `countries_iso_code_2` char(2) NOT NULL,
  `countries_iso_code_3` char(3) NOT NULL,
  `address_format_id` int(11) NOT NULL,
  PRIMARY KEY  (`countries_id`),
  KEY `IDX_COUNTRIES_NAME` (`countries_name`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Afghanistan','AF','AFG',1),(2,'Albania','AL','ALB',1),(3,'Algeria','DZ','DZA',1),(4,'American Samoa','AS','ASM',1),(5,'Andorra','AD','AND',1),(6,'Angola','AO','AGO',1),(7,'Anguilla','AI','AIA',1),(8,'Antarctica','AQ','ATA',1),(9,'Antigua and Barbuda','AG','ATG',1),(10,'Argentina','AR','ARG',1),(11,'Armenia','AM','ARM',1),(12,'Aruba','AW','ABW',1),(13,'Australia','AU','AUS',1),(14,'Austria','AT','AUT',5),(15,'Azerbaijan','AZ','AZE',1),(16,'Bahamas','BS','BHS',1),(17,'Bahrain','BH','BHR',1),(18,'Bangladesh','BD','BGD',1),(19,'Barbados','BB','BRB',1),(20,'Belarus','BY','BLR',1),(21,'Belgium','BE','BEL',1),(22,'Belize','BZ','BLZ',1),(23,'Benin','BJ','BEN',1),(24,'Bermuda','BM','BMU',1),(25,'Bhutan','BT','BTN',1),(26,'Bolivia','BO','BOL',1),(27,'Bosnia and Herzegowina','BA','BIH',1),(28,'Botswana','BW','BWA',1),(29,'Bouvet Island','BV','BVT',1),(30,'Brazil','BR','BRA',1),(31,'British Indian Ocean Territory','IO','IOT',1),(32,'Brunei Darussalam','BN','BRN',1),(33,'Bulgaria','BG','BGR',1),(34,'Burkina Faso','BF','BFA',1),(35,'Burundi','BI','BDI',1),(36,'Cambodia','KH','KHM',1),(37,'Cameroon','CM','CMR',1),(38,'Canada','CA','CAN',1),(39,'Cape Verde','CV','CPV',1),(40,'Cayman Islands','KY','CYM',1),(41,'Central African Republic','CF','CAF',1),(42,'Chad','TD','TCD',1),(43,'Chile','CL','CHL',1),(44,'China','CN','CHN',1),(45,'Christmas Island','CX','CXR',1),(46,'Cocos (Keeling) Islands','CC','CCK',1),(47,'Colombia','CO','COL',1),(48,'Comoros','KM','COM',1),(49,'Congo','CG','COG',1),(50,'Cook Islands','CK','COK',1),(51,'Costa Rica','CR','CRI',1),(52,'Cote D\'Ivoire','CI','CIV',1),(53,'Croatia','HR','HRV',1),(54,'Cuba','CU','CUB',1),(55,'Cyprus','CY','CYP',1),(56,'Czech Republic','CZ','CZE',1),(57,'Denmark','DK','DNK',1),(58,'Djibouti','DJ','DJI',1),(59,'Dominica','DM','DMA',1),(60,'Dominican Republic','DO','DOM',1),(61,'East Timor','TP','TMP',1),(62,'Ecuador','EC','ECU',1),(63,'Egypt','EG','EGY',1),(64,'El Salvador','SV','SLV',1),(65,'Equatorial Guinea','GQ','GNQ',1),(66,'Eritrea','ER','ERI',1),(67,'Estonia','EE','EST',1),(68,'Ethiopia','ET','ETH',1),(69,'Falkland Islands (Malvinas)','FK','FLK',1),(70,'Faroe Islands','FO','FRO',1),(71,'Fiji','FJ','FJI',1),(72,'Finland','FI','FIN',1),(73,'France','FR','FRA',1),(74,'France, Metropolitan','FX','FXX',1),(75,'French Guiana','GF','GUF',1),(76,'French Polynesia','PF','PYF',1),(77,'French Southern Territories','TF','ATF',1),(78,'Gabon','GA','GAB',1),(79,'Gambia','GM','GMB',1),(80,'Georgia','GE','GEO',1),(81,'Germany','DE','DEU',5),(82,'Ghana','GH','GHA',1),(83,'Gibraltar','GI','GIB',1),(84,'Greece','GR','GRC',1),(85,'Greenland','GL','GRL',1),(86,'Grenada','GD','GRD',1),(87,'Guadeloupe','GP','GLP',1),(88,'Guam','GU','GUM',1),(89,'Guatemala','GT','GTM',1),(90,'Guinea','GN','GIN',1),(91,'Guinea-bissau','GW','GNB',1),(92,'Guyana','GY','GUY',1),(93,'Haiti','HT','HTI',1),(94,'Heard and Mc Donald Islands','HM','HMD',1),(95,'Honduras','HN','HND',1),(96,'Hong Kong','HK','HKG',1),(97,'Hungary','HU','HUN',1),(98,'Iceland','IS','ISL',1),(99,'India','IN','IND',1),(100,'Indonesia','ID','IDN',1),(101,'Iran (Islamic Republic of)','IR','IRN',1),(102,'Iraq','IQ','IRQ',1),(103,'Ireland','IE','IRL',1),(104,'Israel','IL','ISR',1),(105,'Italy','IT','ITA',1),(106,'Jamaica','JM','JAM',1),(107,'Japan','JP','JPN',1),(108,'Jordan','JO','JOR',1),(109,'Kazakhstan','KZ','KAZ',1),(110,'Kenya','KE','KEN',1),(111,'Kiribati','KI','KIR',1),(112,'Korea, Democratic People\'s Republic of','KP','PRK',1),(113,'Korea, Republic of','KR','KOR',1),(114,'Kuwait','KW','KWT',1),(115,'Kyrgyzstan','KG','KGZ',1),(116,'Lao People\'s Democratic Republic','LA','LAO',1),(117,'Latvia','LV','LVA',1),(118,'Lebanon','LB','LBN',1),(119,'Lesotho','LS','LSO',1),(120,'Liberia','LR','LBR',1),(121,'Libyan Arab Jamahiriya','LY','LBY',1),(122,'Liechtenstein','LI','LIE',1),(123,'Lithuania','LT','LTU',1),(124,'Luxembourg','LU','LUX',1),(125,'Macau','MO','MAC',1),(126,'Macedonia, The Former Yugoslav Republic of','MK','MKD',1),(127,'Madagascar','MG','MDG',1),(128,'Malawi','MW','MWI',1),(129,'Malaysia','MY','MYS',1),(130,'Maldives','MV','MDV',1),(131,'Mali','ML','MLI',1),(132,'Malta','MT','MLT',1),(133,'Marshall Islands','MH','MHL',1),(134,'Martinique','MQ','MTQ',1),(135,'Mauritania','MR','MRT',1),(136,'Mauritius','MU','MUS',1),(137,'Mayotte','YT','MYT',1),(138,'Mexico','MX','MEX',1),(139,'Micronesia, Federated States of','FM','FSM',1),(140,'Moldova, Republic of','MD','MDA',1),(141,'Monaco','MC','MCO',1),(142,'Mongolia','MN','MNG',1),(143,'Montserrat','MS','MSR',1),(144,'Morocco','MA','MAR',1),(145,'Mozambique','MZ','MOZ',1),(146,'Myanmar','MM','MMR',1),(147,'Namibia','NA','NAM',1),(148,'Nauru','NR','NRU',1),(149,'Nepal','NP','NPL',1),(150,'Netherlands','NL','NLD',1),(151,'Netherlands Antilles','AN','ANT',1),(152,'New Caledonia','NC','NCL',1),(153,'New Zealand','NZ','NZL',1),(154,'Nicaragua','NI','NIC',1),(155,'Niger','NE','NER',1),(156,'Nigeria','NG','NGA',1),(157,'Niue','NU','NIU',1),(158,'Norfolk Island','NF','NFK',1),(159,'Northern Mariana Islands','MP','MNP',1),(160,'Norway','NO','NOR',1),(161,'Oman','OM','OMN',1),(162,'Pakistan','PK','PAK',1),(163,'Palau','PW','PLW',1),(164,'Panama','PA','PAN',1),(165,'Papua New Guinea','PG','PNG',1),(166,'Paraguay','PY','PRY',1),(167,'Peru','PE','PER',1),(168,'Philippines','PH','PHL',1),(169,'Pitcairn','PN','PCN',1),(170,'Poland','PL','POL',1),(171,'Portugal','PT','PRT',1),(172,'Puerto Rico','PR','PRI',1),(173,'Qatar','QA','QAT',1),(174,'Reunion','RE','REU',1),(175,'Romania','RO','ROM',1),(176,'Russian Federation','RU','RUS',1),(177,'Rwanda','RW','RWA',1),(178,'Saint Kitts and Nevis','KN','KNA',1),(179,'Saint Lucia','LC','LCA',1),(180,'Saint Vincent and the Grenadines','VC','VCT',1),(181,'Samoa','WS','WSM',1),(182,'San Marino','SM','SMR',1),(183,'Sao Tome and Principe','ST','STP',1),(184,'Saudi Arabia','SA','SAU',1),(185,'Senegal','SN','SEN',1),(186,'Seychelles','SC','SYC',1),(187,'Sierra Leone','SL','SLE',1),(188,'Singapore','SG','SGP',4),(189,'Slovakia (Slovak Republic)','SK','SVK',1),(190,'Slovenia','SI','SVN',1),(191,'Solomon Islands','SB','SLB',1),(192,'Somalia','SO','SOM',1),(193,'South Africa','ZA','ZAF',1),(194,'South Georgia and the South Sandwich Islands','GS','SGS',1),(195,'Spain','ES','ESP',3),(196,'Sri Lanka','LK','LKA',1),(197,'St. Helena','SH','SHN',1),(198,'St. Pierre and Miquelon','PM','SPM',1),(199,'Sudan','SD','SDN',1),(200,'Suriname','SR','SUR',1),(201,'Svalbard and Jan Mayen Islands','SJ','SJM',1),(202,'Swaziland','SZ','SWZ',1),(203,'Sweden','SE','SWE',1),(204,'Switzerland','CH','CHE',1),(205,'Syrian Arab Republic','SY','SYR',1),(206,'Taiwan','TW','TWN',1),(207,'Tajikistan','TJ','TJK',1),(208,'Tanzania, United Republic of','TZ','TZA',1),(209,'Thailand','TH','THA',1),(210,'Togo','TG','TGO',1),(211,'Tokelau','TK','TKL',1),(212,'Tonga','TO','TON',1),(213,'Trinidad and Tobago','TT','TTO',1),(214,'Tunisia','TN','TUN',1),(215,'Turkey','TR','TUR',1),(216,'Turkmenistan','TM','TKM',1),(217,'Turks and Caicos Islands','TC','TCA',1),(218,'Tuvalu','TV','TUV',1),(219,'Uganda','UG','UGA',1),(220,'Ukraine','UA','UKR',1),(221,'United Arab Emirates','AE','ARE',1),(222,'United Kingdom','GB','GBR',1),(223,'United States','US','USA',2),(224,'United States Minor Outlying Islands','UM','UMI',1),(225,'Uruguay','UY','URY',1),(226,'Uzbekistan','UZ','UZB',1),(227,'Vanuatu','VU','VUT',1),(228,'Vatican City State (Holy See)','VA','VAT',1),(229,'Venezuela','VE','VEN',1),(230,'Viet Nam','VN','VNM',1),(231,'Virgin Islands (British)','VG','VGB',1),(232,'Virgin Islands (U.S.)','VI','VIR',1),(233,'Wallis and Futuna Islands','WF','WLF',1),(234,'Western Sahara','EH','ESH',1),(235,'Yemen','YE','YEM',1),(236,'Yugoslavia','YU','YUG',1),(237,'Zaire','ZR','ZAR',1),(238,'Zambia','ZM','ZMB',1),(239,'Zimbabwe','ZW','ZWE',1);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `currencies` (
  `currencies_id` int(11) NOT NULL auto_increment,
  `title` varchar(32) NOT NULL,
  `code` char(3) NOT NULL,
  `symbol_left` varchar(12) default NULL,
  `symbol_right` varchar(12) default NULL,
  `decimal_point` char(1) default NULL,
  `thousands_point` char(1) default NULL,
  `decimal_places` char(1) default NULL,
  `value` float(13,8) default NULL,
  `last_updated` datetime default NULL,
  PRIMARY KEY  (`currencies_id`),
  KEY `idx_currencies_code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'US Dollar','USD','$','','.',',','2',1.00000000,'2010-09-29 12:20:11');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `customers` (
  `customers_id` int(11) NOT NULL auto_increment,
  `customers_gender` char(1) NOT NULL,
  `customers_firstname` varchar(32) NOT NULL,
  `customers_lastname` varchar(32) NOT NULL,
  `customers_dob` datetime NOT NULL default '0000-00-00 00:00:00',
  `customers_email_address` varchar(96) NOT NULL,
  `customers_default_address_id` int(11) default NULL,
  `customers_telephone` varchar(32) NOT NULL,
  `customers_fax` varchar(32) default NULL,
  `customers_password` varchar(40) NOT NULL,
  `customers_newsletter` char(1) default NULL,
  PRIMARY KEY  (`customers_id`),
  KEY `idx_customers_email_address` (`customers_email_address`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'m','John','doe','2001-01-01 00:00:00','root@localhost',1,'12345','','d95e8fa7f20a009372eb3477473fcd34:1c','0'),(2,'m','Kris','Anderson','1986-02-18 00:00:00','kanderson@zee-way.com',2,'2146904734','','72b2502fdb461b9b2d8181a73f70be9f:d4','');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket`
--

DROP TABLE IF EXISTS `customers_basket`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `customers_basket` (
  `customers_basket_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` int(2) NOT NULL,
  `final_price` decimal(15,4) default NULL,
  `customers_basket_date_added` char(8) default NULL,
  PRIMARY KEY  (`customers_basket_id`),
  KEY `idx_customers_basket_customers_id` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `customers_basket`
--

LOCK TABLES `customers_basket` WRITE;
/*!40000 ALTER TABLE `customers_basket` DISABLE KEYS */;
INSERT INTO `customers_basket` VALUES (1,2,'28',1,NULL,'20100930');
/*!40000 ALTER TABLE `customers_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_basket_attributes`
--

DROP TABLE IF EXISTS `customers_basket_attributes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext NOT NULL,
  `products_options_id` int(11) NOT NULL,
  `products_options_value_id` int(11) NOT NULL,
  PRIMARY KEY  (`customers_basket_attributes_id`),
  KEY `idx_customers_basket_att_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `customers_basket_attributes`
--

LOCK TABLES `customers_basket_attributes` WRITE;
/*!40000 ALTER TABLE `customers_basket_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers_basket_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_info`
--

DROP TABLE IF EXISTS `customers_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `customers_info` (
  `customers_info_id` int(11) NOT NULL,
  `customers_info_date_of_last_logon` datetime default NULL,
  `customers_info_number_of_logons` int(5) default NULL,
  `customers_info_date_account_created` datetime default NULL,
  `customers_info_date_account_last_modified` datetime default NULL,
  `global_product_notifications` int(1) default '0',
  PRIMARY KEY  (`customers_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `customers_info`
--

LOCK TABLES `customers_info` WRITE;
/*!40000 ALTER TABLE `customers_info` DISABLE KEYS */;
INSERT INTO `customers_info` VALUES (1,NULL,0,'2010-09-29 12:20:11',NULL,0),(2,NULL,0,'2010-09-30 17:42:35',NULL,0);
/*!40000 ALTER TABLE `customers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_zones`
--

DROP TABLE IF EXISTS `geo_zones`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `geo_zones` (
  `geo_zone_id` int(11) NOT NULL auto_increment,
  `geo_zone_name` varchar(32) NOT NULL,
  `geo_zone_description` varchar(255) NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`geo_zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `geo_zones`
--

LOCK TABLES `geo_zones` WRITE;
/*!40000 ALTER TABLE `geo_zones` DISABLE KEYS */;
INSERT INTO `geo_zones` VALUES (1,'Washington','Washington local sales tax zone','2010-09-29 12:41:15','2010-09-29 12:20:11');
/*!40000 ALTER TABLE `geo_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `languages` (
  `languages_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `code` char(2) NOT NULL,
  `image` varchar(64) default NULL,
  `directory` varchar(32) default NULL,
  `sort_order` int(3) default NULL,
  PRIMARY KEY  (`languages_id`),
  KEY `IDX_LANGUAGES_NAME` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','icon.gif','english',1);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `manufacturers` (
  `manufacturers_id` int(11) NOT NULL auto_increment,
  `manufacturers_name` varchar(32) NOT NULL,
  `manufacturers_image` varchar(64) default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  PRIMARY KEY  (`manufacturers_id`),
  KEY `IDX_MANUFACTURERS_NAME` (`manufacturers_name`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (11,'You-Nique Garters','SANY0023 (2).JPG','2010-09-29 17:56:46','2010-09-29 20:16:09');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers_info`
--

DROP TABLE IF EXISTS `manufacturers_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `manufacturers_url` varchar(255) NOT NULL,
  `url_clicked` int(5) NOT NULL default '0',
  `date_last_click` datetime default NULL,
  PRIMARY KEY  (`manufacturers_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `manufacturers_info`
--

LOCK TABLES `manufacturers_info` WRITE;
/*!40000 ALTER TABLE `manufacturers_info` DISABLE KEYS */;
INSERT INTO `manufacturers_info` VALUES (11,1,'',0,NULL);
/*!40000 ALTER TABLE `manufacturers_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `newsletters` (
  `newsletters_id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `module` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_sent` datetime default NULL,
  `status` int(1) default NULL,
  `locked` int(1) default '0',
  PRIMARY KEY  (`newsletters_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
INSERT INTO `newsletters` VALUES (1,'Brand New Shop Opening','Welcome to my shop! It is under construction! I will be adding things and fixing things until its right.','newsletter','2010-09-29 23:20:58',NULL,0,1);
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL auto_increment,
  `customers_id` int(11) NOT NULL,
  `customers_name` varchar(64) NOT NULL,
  `customers_company` varchar(32) default NULL,
  `customers_street_address` varchar(64) NOT NULL,
  `customers_suburb` varchar(32) default NULL,
  `customers_city` varchar(32) NOT NULL,
  `customers_postcode` varchar(10) NOT NULL,
  `customers_state` varchar(32) default NULL,
  `customers_country` varchar(32) NOT NULL,
  `customers_telephone` varchar(32) NOT NULL,
  `customers_email_address` varchar(96) NOT NULL,
  `customers_address_format_id` int(5) NOT NULL,
  `delivery_name` varchar(64) NOT NULL,
  `delivery_company` varchar(32) default NULL,
  `delivery_street_address` varchar(64) NOT NULL,
  `delivery_suburb` varchar(32) default NULL,
  `delivery_city` varchar(32) NOT NULL,
  `delivery_postcode` varchar(10) NOT NULL,
  `delivery_state` varchar(32) default NULL,
  `delivery_country` varchar(32) NOT NULL,
  `delivery_address_format_id` int(5) NOT NULL,
  `billing_name` varchar(64) NOT NULL,
  `billing_company` varchar(32) default NULL,
  `billing_street_address` varchar(64) NOT NULL,
  `billing_suburb` varchar(32) default NULL,
  `billing_city` varchar(32) NOT NULL,
  `billing_postcode` varchar(10) NOT NULL,
  `billing_state` varchar(32) default NULL,
  `billing_country` varchar(32) NOT NULL,
  `billing_address_format_id` int(5) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `cc_type` varchar(20) default NULL,
  `cc_owner` varchar(64) default NULL,
  `cc_number` varchar(32) default NULL,
  `cc_expires` varchar(4) default NULL,
  `last_modified` datetime default NULL,
  `date_purchased` datetime default NULL,
  `orders_status` int(5) NOT NULL,
  `orders_date_finished` datetime default NULL,
  `currency` char(3) default NULL,
  `currency_value` decimal(14,6) default NULL,
  PRIMARY KEY  (`orders_id`),
  KEY `idx_orders_customers_id` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,'Kris Anderson','','8464 Creekbluff Dr','','Dallas','75249','Texas','United States','2146904734','kanderson@zee-way.com',2,'Kris Anderson','','8464 Creekbluff Dr','','Dallas','75249','Texas','United States',2,'Kris Anderson','','8464 Creekbluff Dr','','Dallas','75249','Texas','United States',2,'PayPal (including Credit Cards and Debit Cards)','','','','',NULL,'2010-09-30 17:48:23',4,NULL,'USD','1.000000');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `orders_products` (
  `orders_products_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `products_model` varchar(12) default NULL,
  `products_name` varchar(64) NOT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `final_price` decimal(15,4) NOT NULL,
  `products_tax` decimal(7,4) NOT NULL,
  `products_quantity` int(2) NOT NULL,
  PRIMARY KEY  (`orders_products_id`),
  KEY `idx_orders_products_orders_id` (`orders_id`),
  KEY `idx_orders_products_products_id` (`products_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,1,28,'open pocket','Something Blue Flask Garter','30.0000','30.0000','0.0000',1);
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_attributes`
--

DROP TABLE IF EXISTS `orders_products_attributes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `orders_products_id` int(11) NOT NULL,
  `products_options` varchar(32) NOT NULL,
  `products_options_values` varchar(32) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) NOT NULL,
  PRIMARY KEY  (`orders_products_attributes_id`),
  KEY `idx_orders_products_att_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `orders_products_attributes`
--

LOCK TABLES `orders_products_attributes` WRITE;
/*!40000 ALTER TABLE `orders_products_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products_download`
--

DROP TABLE IF EXISTS `orders_products_download`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL default '0',
  `orders_products_id` int(11) NOT NULL default '0',
  `orders_products_filename` varchar(255) NOT NULL default '',
  `download_maxdays` int(2) NOT NULL default '0',
  `download_count` int(2) NOT NULL default '0',
  PRIMARY KEY  (`orders_products_download_id`),
  KEY `idx_orders_products_download_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `orders_products_download`
--

LOCK TABLES `orders_products_download` WRITE;
/*!40000 ALTER TABLE `orders_products_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_products_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status`
--

DROP TABLE IF EXISTS `orders_status`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `orders_status` (
  `orders_status_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `orders_status_name` varchar(32) NOT NULL,
  `public_flag` int(11) default '1',
  `downloads_flag` int(11) default '0',
  PRIMARY KEY  (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name` (`orders_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `orders_status`
--

LOCK TABLES `orders_status` WRITE;
/*!40000 ALTER TABLE `orders_status` DISABLE KEYS */;
INSERT INTO `orders_status` VALUES (1,1,'Pending',1,0),(2,1,'Processing',1,1),(3,1,'Delivered',1,1),(4,1,'Preparing [PayPal Standard]',0,0);
/*!40000 ALTER TABLE `orders_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_status_history`
--

DROP TABLE IF EXISTS `orders_status_history`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `orders_status_id` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  `customer_notified` int(1) default '0',
  `comments` text,
  PRIMARY KEY  (`orders_status_history_id`),
  KEY `idx_orders_status_history_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `orders_status_history`
--

LOCK TABLES `orders_status_history` WRITE;
/*!40000 ALTER TABLE `orders_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_total`
--

DROP TABLE IF EXISTS `orders_total`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL auto_increment,
  `orders_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `class` varchar(32) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY  (`orders_total_id`),
  KEY `idx_orders_total_orders_id` (`orders_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `orders_total`
--

LOCK TABLES `orders_total` WRITE;
/*!40000 ALTER TABLE `orders_total` DISABLE KEYS */;
INSERT INTO `orders_total` VALUES (1,1,'Sub-Total:','$30.00','30.0000','ot_subtotal',1),(2,1,'Flat Rate (Best Way):','$5.00','5.0000','ot_shipping',2),(3,1,'Total:','<b>$35.00</b>','35.0000','ot_total',4);
/*!40000 ALTER TABLE `orders_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products` (
  `products_id` int(11) NOT NULL auto_increment,
  `products_quantity` int(4) NOT NULL,
  `products_model` varchar(12) default NULL,
  `products_image` varchar(64) default NULL,
  `products_price` decimal(15,4) NOT NULL,
  `products_date_added` datetime NOT NULL,
  `products_last_modified` datetime default NULL,
  `products_date_available` datetime default NULL,
  `products_weight` decimal(5,2) NOT NULL,
  `products_status` tinyint(1) NOT NULL,
  `products_tax_class_id` int(11) NOT NULL,
  `manufacturers_id` int(11) default NULL,
  `products_ordered` int(11) NOT NULL default '0',
  PRIMARY KEY  (`products_id`),
  KEY `idx_products_model` (`products_model`),
  KEY `idx_products_date_added` (`products_date_added`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (28,1,'open pocket','SANY0006 (2).JPG','30.0000','2010-09-29 18:06:55',NULL,NULL,'0.00',1,1,11,0),(30,1,'','SANY0008 (3).JPG','30.0000','2010-09-29 22:59:48','2010-09-29 23:01:29',NULL,'0.00',1,1,11,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes`
--

DROP TABLE IF EXISTS `products_attributes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products_attributes` (
  `products_attributes_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `options_id` int(11) NOT NULL,
  `options_values_id` int(11) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) NOT NULL,
  PRIMARY KEY  (`products_attributes_id`),
  KEY `idx_products_attributes_products_id` (`products_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products_attributes`
--

LOCK TABLES `products_attributes` WRITE;
/*!40000 ALTER TABLE `products_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_attributes_download`
--

DROP TABLE IF EXISTS `products_attributes_download`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL,
  `products_attributes_filename` varchar(255) NOT NULL default '',
  `products_attributes_maxdays` int(2) default '0',
  `products_attributes_maxcount` int(2) default '0',
  PRIMARY KEY  (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products_attributes_download`
--

LOCK TABLES `products_attributes_download` WRITE;
/*!40000 ALTER TABLE `products_attributes_download` DISABLE KEYS */;
INSERT INTO `products_attributes_download` VALUES (26,'unreal.zip',7,3);
/*!40000 ALTER TABLE `products_attributes_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_description`
--

DROP TABLE IF EXISTS `products_description`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products_description` (
  `products_id` int(11) NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '1',
  `products_name` varchar(64) NOT NULL default '',
  `products_description` text,
  `products_url` varchar(255) default NULL,
  `products_viewed` int(5) default '0',
  PRIMARY KEY  (`products_id`,`language_id`),
  KEY `products_name` (`products_name`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products_description`
--

LOCK TABLES `products_description` WRITE;
/*!40000 ALTER TABLE `products_description` DISABLE KEYS */;
INSERT INTO `products_description` VALUES (28,1,'Something Blue Flask Garter','Something Blue Flask Garter comes with 3 oz. flask','',11),(30,1,'White Flask Garter','White print flask garter comes with a 3 oz. flask. Fits regular size up to 20 in.','',3);
/*!40000 ALTER TABLE `products_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_notifications`
--

DROP TABLE IF EXISTS `products_notifications`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products_notifications` (
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`products_id`,`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products_notifications`
--

LOCK TABLES `products_notifications` WRITE;
/*!40000 ALTER TABLE `products_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options`
--

DROP TABLE IF EXISTS `products_options`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products_options` (
  `products_options_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `products_options_name` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`products_options_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products_options`
--

LOCK TABLES `products_options` WRITE;
/*!40000 ALTER TABLE `products_options` DISABLE KEYS */;
INSERT INTO `products_options` VALUES (2,1,'closed pocket'),(3,1,'open pocket'),(6,1,'');
/*!40000 ALTER TABLE `products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values`
--

DROP TABLE IF EXISTS `products_options_values`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products_options_values` (
  `products_options_values_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '1',
  `products_options_values_name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`products_options_values_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products_options_values`
--

LOCK TABLES `products_options_values` WRITE;
/*!40000 ALTER TABLE `products_options_values` DISABLE KEYS */;
INSERT INTO `products_options_values` VALUES (1,1,'');
/*!40000 ALTER TABLE `products_options_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_options_values_to_products_options`
--

DROP TABLE IF EXISTS `products_options_values_to_products_options`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL auto_increment,
  `products_options_id` int(11) NOT NULL,
  `products_options_values_id` int(11) NOT NULL,
  PRIMARY KEY  (`products_options_values_to_products_options_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products_options_values_to_products_options`
--

LOCK TABLES `products_options_values_to_products_options` WRITE;
/*!40000 ALTER TABLE `products_options_values_to_products_options` DISABLE KEYS */;
INSERT INTO `products_options_values_to_products_options` VALUES (14,3,1);
/*!40000 ALTER TABLE `products_options_values_to_products_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_to_categories`
--

DROP TABLE IF EXISTS `products_to_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `products_to_categories` (
  `products_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY  (`products_id`,`categories_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `products_to_categories`
--

LOCK TABLES `products_to_categories` WRITE;
/*!40000 ALTER TABLE `products_to_categories` DISABLE KEYS */;
INSERT INTO `products_to_categories` VALUES (28,21),(30,0);
/*!40000 ALTER TABLE `products_to_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reviews` (
  `reviews_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) default NULL,
  `customers_name` varchar(64) NOT NULL,
  `reviews_rating` int(1) default NULL,
  `date_added` datetime default NULL,
  `last_modified` datetime default NULL,
  `reviews_read` int(5) NOT NULL default '0',
  PRIMARY KEY  (`reviews_id`),
  KEY `idx_reviews_products_id` (`products_id`),
  KEY `idx_reviews_customers_id` (`customers_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_description`
--

DROP TABLE IF EXISTS `reviews_description`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reviews_description` (
  `reviews_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `reviews_text` text NOT NULL,
  PRIMARY KEY  (`reviews_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reviews_description`
--

LOCK TABLES `reviews_description` WRITE;
/*!40000 ALTER TABLE `reviews_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sessions` (
  `sesskey` varchar(32) NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY  (`sesskey`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('hksui2846m6d9vnlpetr9c9hg6',1285863197,'language|s:7:\"english\";languages_id|s:1:\"1\";selected_box|s:5:\"tools\";admin|a:2:{s:2:\"id\";s:1:\"1\";s:8:\"username\";s:29:\"d.ulrich@you-niquegarters.com\";}'),('gd9o84o6q1p1ci3g530coo86a2',1285886789,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:6:\"cartID\";N;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:3:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}i:1;a:4:{s:4:\"page\";s:11:\"account.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:6:\"osCsid\";s:26:\"gd9o84o6q1p1ci3g530coo86a2\";}s:4:\"post\";a:0:{}}i:2;a:4:{s:4:\"page\";s:9:\"login.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:2:{s:6:\"action\";s:7:\"process\";s:6:\"osCsid\";s:26:\"gd9o84o6q1p1ci3g530coo86a2\";}s:4:\"post\";a:4:{s:13:\"email_address\";s:29:\"d.ulrich@you-niquegarters.com\";s:8:\"password\";s:9:\"kittumf67\";s:1:\"x\";s:1:\"0\";s:1:\"y\";s:1:\"0\";}}}s:8:\"snapshot\";a:4:{s:4:\"page\";s:11:\"account.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:1:{s:6:\"osCsid\";s:26:\"gd9o84o6q1p1ci3g530coo86a2\";}s:4:\"post\";a:0:{}}}'),('oc195ohapnoeouflktlrne5rh2',1285888492,'language|s:7:\"english\";languages_id|s:1:\"1\";selected_box|s:13:\"configuration\";admin|a:2:{s:2:\"id\";s:1:\"1\";s:8:\"username\";s:29:\"d.ulrich@you-niquegarters.com\";}current_path|s:60:\"/home/zeeway/you-niquegarters.com/public//includes/languages\";'),('vh6odsk3sf105bd9s3lga44cc5',1285888648,'cart|O:12:\"shoppingCart\":5:{s:8:\"contents\";a:1:{i:28;a:1:{s:3:\"qty\";s:1:\"1\";}}s:5:\"total\";d:30;s:6:\"weight\";d:0;s:6:\"cartID\";s:5:\"80702\";s:12:\"content_type\";s:8:\"physical\";}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:1:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}customer_id|i:2;customer_first_name|s:4:\"Kris\";customer_default_address_id|i:2;customer_country_id|s:3:\"223\";customer_zone_id|s:2:\"57\";sendto|i:2;cartID|s:5:\"80702\";comments|N;shipping|a:3:{s:2:\"id\";s:9:\"flat_flat\";s:5:\"title\";s:20:\"Flat Rate (Best Way)\";s:4:\"cost\";s:4:\"5.00\";}billto|i:2;payment|s:15:\"paypal_standard\";cart_PayPal_Standard_ID|s:7:\"80702-1\";'),('b592phie1vi50pkb6kelvni606',1285888956,'cart|O:12:\"shoppingCart\":4:{s:8:\"contents\";a:0:{}s:5:\"total\";i:0;s:6:\"weight\";i:0;s:12:\"content_type\";b:0;}language|s:7:\"english\";languages_id|s:1:\"1\";currency|s:3:\"USD\";navigation|O:17:\"navigationHistory\":2:{s:4:\"path\";a:1:{i:0;a:4:{s:4:\"page\";s:9:\"index.php\";s:4:\"mode\";s:6:\"NONSSL\";s:3:\"get\";a:0:{}s:4:\"post\";a:0:{}}}s:8:\"snapshot\";a:0:{}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `specials` (
  `specials_id` int(11) NOT NULL auto_increment,
  `products_id` int(11) NOT NULL,
  `specials_new_products_price` decimal(15,4) NOT NULL,
  `specials_date_added` datetime default NULL,
  `specials_last_modified` datetime default NULL,
  `expires_date` datetime default NULL,
  `date_status_change` datetime default NULL,
  `status` int(1) NOT NULL default '1',
  PRIMARY KEY  (`specials_id`),
  KEY `idx_specials_products_id` (`products_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `specials`
--

LOCK TABLES `specials` WRITE;
/*!40000 ALTER TABLE `specials` DISABLE KEYS */;
/*!40000 ALTER TABLE `specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tax_class` (
  `tax_class_id` int(11) NOT NULL auto_increment,
  `tax_class_title` varchar(32) NOT NULL,
  `tax_class_description` varchar(255) NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`tax_class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tax_class`
--

LOCK TABLES `tax_class` WRITE;
/*!40000 ALTER TABLE `tax_class` DISABLE KEYS */;
INSERT INTO `tax_class` VALUES (1,'Taxable Goods','The following types of products are included non-food, services, etc','2010-09-29 12:20:11','2010-09-29 12:20:11');
/*!40000 ALTER TABLE `tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tax_rates` (
  `tax_rates_id` int(11) NOT NULL auto_increment,
  `tax_zone_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_priority` int(5) default '1',
  `tax_rate` decimal(7,4) NOT NULL,
  `tax_description` varchar(255) NOT NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`tax_rates_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
INSERT INTO `tax_rates` VALUES (1,1,1,1,'8.2000','WA TAX 8.2%','2010-09-29 12:43:55','2010-09-29 12:20:11');
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whos_online`
--

DROP TABLE IF EXISTS `whos_online`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `whos_online` (
  `customer_id` int(11) default NULL,
  `full_name` varchar(64) NOT NULL,
  `session_id` varchar(128) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `time_entry` varchar(14) NOT NULL,
  `time_last_click` varchar(14) NOT NULL,
  `last_page_url` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `whos_online`
--

LOCK TABLES `whos_online` WRITE;
/*!40000 ALTER TABLE `whos_online` DISABLE KEYS */;
INSERT INTO `whos_online` VALUES (0,'Guest','b592phie1vi50pkb6kelvni606','76.186.65.99','1285887516','1285887516','/'),(2,'Kris Anderson','vh6odsk3sf105bd9s3lga44cc5','76.186.65.99','1285885446','1285887208','/');
/*!40000 ALTER TABLE `whos_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `zones` (
  `zone_id` int(11) NOT NULL auto_increment,
  `zone_country_id` int(11) NOT NULL,
  `zone_code` varchar(32) NOT NULL,
  `zone_name` varchar(32) NOT NULL,
  PRIMARY KEY  (`zone_id`),
  KEY `idx_zones_country_id` (`zone_country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,223,'AL','Alabama'),(2,223,'AK','Alaska'),(3,223,'AS','American Samoa'),(4,223,'AZ','Arizona'),(5,223,'AR','Arkansas'),(6,223,'AF','Armed Forces Africa'),(7,223,'AA','Armed Forces Americas'),(8,223,'AC','Armed Forces Canada'),(9,223,'AE','Armed Forces Europe'),(10,223,'AM','Armed Forces Middle East'),(11,223,'AP','Armed Forces Pacific'),(12,223,'CA','California'),(13,223,'CO','Colorado'),(14,223,'CT','Connecticut'),(15,223,'DE','Delaware'),(16,223,'DC','District of Columbia'),(17,223,'FM','Federated States Of Micronesia'),(18,223,'FL','Florida'),(19,223,'GA','Georgia'),(20,223,'GU','Guam'),(21,223,'HI','Hawaii'),(22,223,'ID','Idaho'),(23,223,'IL','Illinois'),(24,223,'IN','Indiana'),(25,223,'IA','Iowa'),(26,223,'KS','Kansas'),(27,223,'KY','Kentucky'),(28,223,'LA','Louisiana'),(29,223,'ME','Maine'),(30,223,'MH','Marshall Islands'),(31,223,'MD','Maryland'),(32,223,'MA','Massachusetts'),(33,223,'MI','Michigan'),(34,223,'MN','Minnesota'),(35,223,'MS','Mississippi'),(36,223,'MO','Missouri'),(37,223,'MT','Montana'),(38,223,'NE','Nebraska'),(39,223,'NV','Nevada'),(40,223,'NH','New Hampshire'),(41,223,'NJ','New Jersey'),(42,223,'NM','New Mexico'),(43,223,'NY','New York'),(44,223,'NC','North Carolina'),(45,223,'ND','North Dakota'),(46,223,'MP','Northern Mariana Islands'),(47,223,'OH','Ohio'),(48,223,'OK','Oklahoma'),(49,223,'OR','Oregon'),(50,223,'PW','Palau'),(51,223,'PA','Pennsylvania'),(52,223,'PR','Puerto Rico'),(53,223,'RI','Rhode Island'),(54,223,'SC','South Carolina'),(55,223,'SD','South Dakota'),(56,223,'TN','Tennessee'),(57,223,'TX','Texas'),(58,223,'UT','Utah'),(59,223,'VT','Vermont'),(60,223,'VI','Virgin Islands'),(61,223,'VA','Virginia'),(62,223,'WA','Washington'),(63,223,'WV','West Virginia'),(64,223,'WI','Wisconsin'),(65,223,'WY','Wyoming'),(66,38,'AB','Alberta'),(67,38,'BC','British Columbia'),(68,38,'MB','Manitoba'),(69,38,'NF','Newfoundland'),(70,38,'NB','New Brunswick'),(71,38,'NS','Nova Scotia'),(72,38,'NT','Northwest Territories'),(73,38,'NU','Nunavut'),(74,38,'ON','Ontario'),(75,38,'PE','Prince Edward Island'),(76,38,'QC','Quebec'),(77,38,'SK','Saskatchewan'),(78,38,'YT','Yukon Territory'),(79,81,'NDS','Niedersachsen'),(80,81,'BAW','Baden-Württemberg'),(81,81,'BAY','Bayern'),(82,81,'BER','Berlin'),(83,81,'BRG','Brandenburg'),(84,81,'BRE','Bremen'),(85,81,'HAM','Hamburg'),(86,81,'HES','Hessen'),(87,81,'MEC','Mecklenburg-Vorpommern'),(88,81,'NRW','Nordrhein-Westfalen'),(89,81,'RHE','Rheinland-Pfalz'),(90,81,'SAR','Saarland'),(91,81,'SAS','Sachsen'),(92,81,'SAC','Sachsen-Anhalt'),(93,81,'SCN','Schleswig-Holstein'),(94,81,'THE','Thüringen'),(95,14,'WI','Wien'),(96,14,'NO','Niederösterreich'),(97,14,'OO','Oberösterreich'),(98,14,'SB','Salzburg'),(99,14,'KN','Kärnten'),(100,14,'ST','Steiermark'),(101,14,'TI','Tirol'),(102,14,'BL','Burgenland'),(103,14,'VB','Voralberg'),(104,204,'AG','Aargau'),(105,204,'AI','Appenzell Innerrhoden'),(106,204,'AR','Appenzell Ausserrhoden'),(107,204,'BE','Bern'),(108,204,'BL','Basel-Landschaft'),(109,204,'BS','Basel-Stadt'),(110,204,'FR','Freiburg'),(111,204,'GE','Genf'),(112,204,'GL','Glarus'),(113,204,'JU','Graubünden'),(114,204,'JU','Jura'),(115,204,'LU','Luzern'),(116,204,'NE','Neuenburg'),(117,204,'NW','Nidwalden'),(118,204,'OW','Obwalden'),(119,204,'SG','St. Gallen'),(120,204,'SH','Schaffhausen'),(121,204,'SO','Solothurn'),(122,204,'SZ','Schwyz'),(123,204,'TG','Thurgau'),(124,204,'TI','Tessin'),(125,204,'UR','Uri'),(126,204,'VD','Waadt'),(127,204,'VS','Wallis'),(128,204,'ZG','Zug'),(129,204,'ZH','Zürich'),(130,195,'A Coruña','A Coruña'),(131,195,'Alava','Alava'),(132,195,'Albacete','Albacete'),(133,195,'Alicante','Alicante'),(134,195,'Almeria','Almeria'),(135,195,'Asturias','Asturias'),(136,195,'Avila','Avila'),(137,195,'Badajoz','Badajoz'),(138,195,'Baleares','Baleares'),(139,195,'Barcelona','Barcelona'),(140,195,'Burgos','Burgos'),(141,195,'Caceres','Caceres'),(142,195,'Cadiz','Cadiz'),(143,195,'Cantabria','Cantabria'),(144,195,'Castellon','Castellon'),(145,195,'Ceuta','Ceuta'),(146,195,'Ciudad Real','Ciudad Real'),(147,195,'Cordoba','Cordoba'),(148,195,'Cuenca','Cuenca'),(149,195,'Girona','Girona'),(150,195,'Granada','Granada'),(151,195,'Guadalajara','Guadalajara'),(152,195,'Guipuzcoa','Guipuzcoa'),(153,195,'Huelva','Huelva'),(154,195,'Huesca','Huesca'),(155,195,'Jaen','Jaen'),(156,195,'La Rioja','La Rioja'),(157,195,'Las Palmas','Las Palmas'),(158,195,'Leon','Leon'),(159,195,'Lleida','Lleida'),(160,195,'Lugo','Lugo'),(161,195,'Madrid','Madrid'),(162,195,'Malaga','Malaga'),(163,195,'Melilla','Melilla'),(164,195,'Murcia','Murcia'),(165,195,'Navarra','Navarra'),(166,195,'Ourense','Ourense'),(167,195,'Palencia','Palencia'),(168,195,'Pontevedra','Pontevedra'),(169,195,'Salamanca','Salamanca'),(170,195,'Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,195,'Segovia','Segovia'),(172,195,'Sevilla','Sevilla'),(173,195,'Soria','Soria'),(174,195,'Tarragona','Tarragona'),(175,195,'Teruel','Teruel'),(176,195,'Toledo','Toledo'),(177,195,'Valencia','Valencia'),(178,195,'Valladolid','Valladolid'),(179,195,'Vizcaya','Vizcaya'),(180,195,'Zamora','Zamora'),(181,195,'Zaragoza','Zaragoza');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones_to_geo_zones`
--

DROP TABLE IF EXISTS `zones_to_geo_zones`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL auto_increment,
  `zone_country_id` int(11) NOT NULL,
  `zone_id` int(11) default NULL,
  `geo_zone_id` int(11) default NULL,
  `last_modified` datetime default NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY  (`association_id`),
  KEY `idx_zones_to_geo_zones_country_id` (`zone_country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `zones_to_geo_zones`
--

LOCK TABLES `zones_to_geo_zones` WRITE;
/*!40000 ALTER TABLE `zones_to_geo_zones` DISABLE KEYS */;
INSERT INTO `zones_to_geo_zones` VALUES (1,223,62,1,'2010-09-29 12:41:37','2010-09-29 12:20:11');
/*!40000 ALTER TABLE `zones_to_geo_zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-11-05 11:25:05