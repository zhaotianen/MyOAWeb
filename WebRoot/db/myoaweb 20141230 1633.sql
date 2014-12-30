-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema myoaweb
--

CREATE DATABASE IF NOT EXISTS myoaweb;
USE myoaweb;

--
-- Definition of table `oa_department`
--

DROP TABLE IF EXISTS `oa_department`;
CREATE TABLE `oa_department` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `parentId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC88C13DF729C9286` (`parentId`),
  CONSTRAINT `FKC88C13DF729C9286` FOREIGN KEY (`parentId`) REFERENCES `oa_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `oa_department`
--

/*!40000 ALTER TABLE `oa_department` DISABLE KEYS */;
INSERT INTO `oa_department` (`id`,`name`,`description`,`parentId`) VALUES 
 (1,'技术部','技术部',NULL),
 (2,'财务处','财务处',NULL),
 (3,'人事部','人事部',NULL),
 (4,'技术1','网络',1),
 (5,'技术2','运维',1),
 (6,'技术3','软件',1),
 (7,'技术4','硬件',1);
/*!40000 ALTER TABLE `oa_department` ENABLE KEYS */;


--
-- Definition of table `oa_forum`
--

DROP TABLE IF EXISTS `oa_forum`;
CREATE TABLE `oa_forum` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `position` int(11) default NULL,
  `topicCount` int(11) default NULL,
  `articleCount` int(11) default NULL,
  `lastTopicId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `lastTopicId` (`lastTopicId`),
  KEY `FKBDCCD8741D89DB14` (`lastTopicId`),
  CONSTRAINT `FKBDCCD8741D89DB14` FOREIGN KEY (`lastTopicId`) REFERENCES `oa_topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `oa_forum`
--

/*!40000 ALTER TABLE `oa_forum` DISABLE KEYS */;
INSERT INTO `oa_forum` (`id`,`name`,`description`,`position`,`topicCount`,`articleCount`,`lastTopicId`) VALUES 
 (1,'新闻','每日新闻',1,4,10,4),
 (2,'公告','公司公告',2,0,0,NULL),
 (3,'规章制度','公司规章制度',3,0,0,NULL);
/*!40000 ALTER TABLE `oa_forum` ENABLE KEYS */;


--
-- Definition of table `oa_privilege`
--

DROP TABLE IF EXISTS `oa_privilege`;
CREATE TABLE `oa_privilege` (
  `id` bigint(20) NOT NULL auto_increment,
  `url` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `parentId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK9EA6084E7D51427` (`parentId`),
  CONSTRAINT `FK9EA6084E7D51427` FOREIGN KEY (`parentId`) REFERENCES `oa_privilege` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `oa_privilege`
--

/*!40000 ALTER TABLE `oa_privilege` DISABLE KEYS */;
INSERT INTO `oa_privilege` (`id`,`url`,`name`,`parentId`) VALUES 
 (1,NULL,'系统管理',NULL),
 (2,'/role_list','岗位管理',1),
 (3,'/department_list','部门管理',1),
 (4,'/user_list','用户管理',1),
 (5,'/role_list','岗位列表',2),
 (6,'/role_delete','岗位删除',2),
 (7,'/role_add','岗位添加',2),
 (8,'/role_edit','岗位修改',2),
 (9,'/department_list','部门列表',3),
 (10,'/department_delete','部门删除',3),
 (11,'/department_add','部门添加',3),
 (12,'/department_edit','部门修改',3),
 (13,'/user_list','用户列表',4),
 (14,'/user_delete','用户删除',4),
 (15,'/user_add','用户添加',4),
 (16,'/user_edit','用户修改',4),
 (17,'/user_initPassword','初始化密码',4),
 (18,NULL,'网上交流',NULL),
 (19,'/forumManage_list','论坛管理',18),
 (20,'/forum_list','论坛',18),
 (21,NULL,'审批流转',NULL),
 (22,'/processDefinition_list','审批流程管理',21),
 (23,'/template_list','申请模板管理',21),
 (24,'/flow_templateList','起草申请',21),
 (25,'/flow_myTaskList','待我审批',21),
 (26,'/flow_myApplicationList','我的申请查询',21);
/*!40000 ALTER TABLE `oa_privilege` ENABLE KEYS */;


--
-- Definition of table `oa_reply`
--

DROP TABLE IF EXISTS `oa_reply`;
CREATE TABLE `oa_reply` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` longtext,
  `postTime` datetime default NULL,
  `ipAddr` varchar(255) default NULL,
  `authorId` bigint(20) default NULL,
  `topicId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKBE715E3D1074626A` (`topicId`),
  KEY `FKBE715E3D479FFEE0` (`authorId`),
  CONSTRAINT `FKBE715E3D1074626A` FOREIGN KEY (`topicId`) REFERENCES `oa_topic` (`id`),
  CONSTRAINT `FKBE715E3D479FFEE0` FOREIGN KEY (`authorId`) REFERENCES `oa_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `oa_reply`
--

/*!40000 ALTER TABLE `oa_reply` DISABLE KEYS */;
INSERT INTO `oa_reply` (`id`,`title`,`content`,`postTime`,`ipAddr`,`authorId`,`topicId`) VALUES 
 (1,'回复：12306发布公告：今起不再接受行程冲突购票','&nbsp;知道了','2014-12-29 09:55:00','127.0.0.1',1,3),
 (2,'回复：12306发布公告：今起不再接受行程冲突购票','&nbsp;信息量好大','2014-12-29 10:06:58','127.0.0.1',1,3),
 (5,'回复：12306发布公告：今起不再接受行程冲突购票','&nbsp;哇塞&hellip;&hellip;','2014-12-29 10:11:55','127.0.0.1',2,3),
 (6,'回复：亚航客机失联搜救尚无线索 未发求救信号','&nbsp;好吓人啊','2014-12-29 10:16:27','127.0.0.1',1,4),
 (7,'回复：亚航客机失联搜救尚无线索 未发求救信号','&nbsp;好恐怖','2014-12-29 10:16:35','127.0.0.1',1,4),
 (8,'回复：亚航客机失联搜救尚无线索 未发求救信号','<p>&nbsp;坚决不坐飞机啦</p>\r\n<p>︿(￣︶￣)︽(￣︶￣)︿飞.飞.飞.</p>','2014-12-29 10:16:54','127.0.0.1',1,4);
/*!40000 ALTER TABLE `oa_reply` ENABLE KEYS */;


--
-- Definition of table `oa_role`
--

DROP TABLE IF EXISTS `oa_role`;
CREATE TABLE `oa_role` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `oa_role`
--

/*!40000 ALTER TABLE `oa_role` DISABLE KEYS */;
INSERT INTO `oa_role` (`id`,`name`,`description`) VALUES 
 (1,'总经理','总经理'),
 (2,'副总经理','副总经理'),
 (3,'部门经理','部门经理'),
 (4,'部门主管','部门主管'),
 (5,'普通员工','普通员工'),
 (6,'系统管理员','系统管理员');
/*!40000 ALTER TABLE `oa_role` ENABLE KEYS */;


--
-- Definition of table `oa_role_privilege`
--

DROP TABLE IF EXISTS `oa_role_privilege`;
CREATE TABLE `oa_role_privilege` (
  `roleId` bigint(20) NOT NULL,
  `privilegeId` bigint(20) NOT NULL,
  PRIMARY KEY  (`privilegeId`,`roleId`),
  KEY `FK10549835B0E19C6E` (`privilegeId`),
  KEY `FK10549835BB0AE3B6` (`roleId`),
  CONSTRAINT `FK10549835B0E19C6E` FOREIGN KEY (`privilegeId`) REFERENCES `oa_privilege` (`id`),
  CONSTRAINT `FK10549835BB0AE3B6` FOREIGN KEY (`roleId`) REFERENCES `oa_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `oa_role_privilege`
--

/*!40000 ALTER TABLE `oa_role_privilege` DISABLE KEYS */;
INSERT INTO `oa_role_privilege` (`roleId`,`privilegeId`) VALUES 
 (6,1),
 (6,2),
 (6,3),
 (6,4),
 (6,5),
 (6,6),
 (6,7),
 (6,8),
 (6,9),
 (6,10),
 (6,11),
 (6,12),
 (6,13),
 (6,14),
 (6,15),
 (6,16),
 (6,17),
 (1,18),
 (2,18),
 (3,18),
 (4,18),
 (5,18),
 (6,18),
 (6,19),
 (1,20),
 (2,20),
 (3,20),
 (4,20),
 (5,20),
 (1,21),
 (2,21),
 (3,21),
 (4,21),
 (5,21),
 (6,21),
 (6,22),
 (6,23),
 (1,24),
 (2,24),
 (3,24),
 (4,24),
 (5,24),
 (1,25),
 (2,25),
 (3,25),
 (4,25),
 (5,25),
 (1,26),
 (2,26),
 (3,26),
 (4,26),
 (5,26);
/*!40000 ALTER TABLE `oa_role_privilege` ENABLE KEYS */;


--
-- Definition of table `oa_topic`
--

DROP TABLE IF EXISTS `oa_topic`;
CREATE TABLE `oa_topic` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` longtext,
  `postTime` datetime default NULL,
  `ipAddr` varchar(255) default NULL,
  `authorId` bigint(20) default NULL,
  `type` int(11) default NULL,
  `replyCount` int(11) default NULL,
  `lastUpdateTime` datetime default NULL,
  `forumId` bigint(20) default NULL,
  `lastReplyId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `lastReplyId` (`lastReplyId`),
  KEY `FKBE921882A28DE3CA` (`lastReplyId`),
  KEY `FKBE921882479FFEE0` (`authorId`),
  KEY `FKBE9218822B39ADCE` (`forumId`),
  CONSTRAINT `FKBE9218822B39ADCE` FOREIGN KEY (`forumId`) REFERENCES `oa_forum` (`id`),
  CONSTRAINT `FKBE921882479FFEE0` FOREIGN KEY (`authorId`) REFERENCES `oa_user` (`id`),
  CONSTRAINT `FKBE921882A28DE3CA` FOREIGN KEY (`lastReplyId`) REFERENCES `oa_reply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `oa_topic`
--

/*!40000 ALTER TABLE `oa_topic` DISABLE KEYS */;
INSERT INTO `oa_topic` (`id`,`title`,`content`,`postTime`,`ipAddr`,`authorId`,`type`,`replyCount`,`lastUpdateTime`,`forumId`,`lastReplyId`) VALUES 
 (1,'合肥“房叔” 骗房18套 获刑20年','&nbsp;<span style=\"text-indent: 25px; color: rgb(37, 37, 37); font-family: 宋体, sans-serif; font-size: 16px; line-height: 28px; text-align: justify;\">今天，合肥房叔方广云案一审宣判，方广云被判有期徒刑20年，并处没收个人财产人民币15万元。方广云在协助原合肥市瑶海工业园区管委会进行拆迁安置工作期间，单独或伙同他人骗取安置房18套,受贿后违规帮助他人非法获取安置房45套,涉案总金额超千万。</span>\r\n<p style=\"padding: 0px; margin: 26px 0px; font-size: 16px; text-indent: 2em; color: rgb(37, 37, 37); font-family: 宋体, sans-serif; line-height: 28px; text-align: justify;\">方广云原任合肥市站北社区居委会党支部书记，2012年底，当地12名村民实名举报其&ldquo;非法侵占136套回迁安置房&rdquo;。2014年5月16日，瑶海区法院对方广云女儿、女婿涉嫌骗取拆迁安置房，以贪污罪分别判处方某、范某有期徒刑各5年。</p>\r\n<p style=\"padding: 0px; margin: 26px 0px; font-size: 16px; text-indent: 2em; color: rgb(37, 37, 37); font-family: 宋体, sans-serif; line-height: 28px; text-align: justify;\">综合央视 人民网</p>','2014-12-26 15:26:45','127.0.0.1',1,0,0,'2014-12-26 15:26:45',1,NULL),
 (2,'12306发布公告：今起不再接受行程冲突购票','&nbsp;<span style=\"text-indent: 25px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px;\">自12月26日起，</span><span class=\"kw\" style=\"text-indent: 25px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px;\"><a href=\"http://so.china.com/cse/search?q=12306&amp;s=2919120612882629663&amp;nsid=0\" target=\"_blank\" style=\"color: rgb(37, 37, 37); text-decoration: none; border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(0, 66, 118);\">12306</a></span><span style=\"text-indent: 25px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px;\">网售票系统将不接受行程冲突的购票，如果旅客再次购票时被提示与前次购票行程冲突，请将已购车票办理改签或退票后重新购票。</span>\r\n<p style=\"margin: 0px; padding: 12px 0px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px; text-indent: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;关于涉及冒用身份信息购票相关事项处置的公告</p>\r\n<p style=\"margin: 0px; padding: 12px 0px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px; text-indent: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;近日，铁路公安机关破获多起利用他人身份信息在网上囤票倒票案件，不法分子谋取非法利益，同时造成部分旅客因身份信息被冒用而无法正常购票。为了维护正常的购票秩序，切实保障广大旅客的出行，自2014年12月26日起，实行以下措施：</p>\r\n<p style=\"margin: 0px; padding: 12px 0px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px; text-indent: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;1.旅客网上购票，发现身份信息被他人冒用购票，造成行程冲突（指同一乘车人的乘车时间出现交叉）不能购票时，可在互联网上举报后继续购票。12306网站为旅客网上举报设置了相应的功能，旅客可以按网上的提示操作。</p>\r\n<p style=\"margin: 0px; padding: 12px 0px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px; text-indent: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;2.旅客在车站窗口、代售点、电话订票、自动售票机等渠道购票时，发现身份信息被他人冒用购票，造成行程冲突不能购票的，可到就近车站指定窗口举报后继续购票。</p>\r\n<p style=\"margin: 0px; padding: 12px 0px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px; text-indent: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;3.对于涉嫌冒用他人身份信息购买的车票，铁路部门将按车票的车次、座次在车站和列车上进行重点查验，铁路公安机关将作为重要线索依法处置。<br />\r\n&nbsp; &nbsp; <br />\r\n&nbsp; &nbsp; 4.铁路公安机关鼓励旅客到就近车站派出所，举报身份信息被冒用购票的情况。一经查实，铁路部门将锁定冒用他人身份信息购票的用户及名下所有车票，并对举报人予以奖励。</p>\r\n<p style=\"margin: 0px; padding: 12px 0px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px; text-indent: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;5.<strong>根据实名制购票乘车的原则，旅客请勿购买行程冲突的车票。自12月26日起，售票系统将不接受行程冲突的购票，如果旅客再次购票时被提示与前次购票行程冲突，请将已购车票办理改签或退票后重新购票。</strong></p>\r\n<p style=\"margin: 0px; padding: 12px 0px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px; text-indent: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;根据国务院颁布的《铁路安全管理条例》，对车票所记载身份信息与所持身份证件或者真实身份不符的持票人，铁路部门将拒绝其进站乘车。铁路部门提醒广大旅客，请不要使用他人身份信息购票乘车，也不要购买载有他人身份信息的车票，以免造成经济上的损失，影响您的行程。</p>','2014-12-26 15:31:24','127.0.0.1',1,0,0,'2014-12-26 15:31:24',1,NULL),
 (3,'12306发布公告：今起不再接受行程冲突购票','&nbsp;<span style=\"text-indent: 25px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px;\">自12月26日起，</span><span class=\"kw\" style=\"text-indent: 25px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px;\"><a href=\"http://so.china.com/cse/search?q=12306&amp;s=2919120612882629663&amp;nsid=0\" target=\"_blank\" style=\"color: rgb(37, 37, 37); text-decoration: none; border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(0, 66, 118);\">12306</a></span><span style=\"text-indent: 25px; color: rgb(56, 56, 56); font-family: simsun; font-size: 16px; line-height: 29px;\">网售票系统将不接受行程冲突的购票，如果旅客再次购票时被提示与前次购票行程冲突，请将已购车票办理改签或退票后重新购票。&nbsp;</span>','2014-12-26 15:31:58','127.0.0.1',1,0,3,'2014-12-29 10:11:55',1,5),
 (4,'亚航客机失联搜救尚无线索 未发求救信号','<div style=\"text-align: left;\">12月28日,失联的马来西亚亚洲航空公司QZ8501航班的乘客亲友在印度尼西亚泗水朱安达国际机场等候消息。<br />\r\n马来西亚亚洲航空公司一架搭载155名乘客的客机28日早晨从印度尼西亚飞往新加坡途中与空中交通控制塔台失去联系,下落不明。亚航和印尼交通部官员说,客机在飞行途中遭遇恶劣天气。中国驻印尼大使馆向印尼多方核实情况后确认,失联客机上没有中国公民。</div>','2014-12-29 10:15:40','127.0.0.1',2,0,3,'2014-12-29 10:16:54',1,8);
/*!40000 ALTER TABLE `oa_topic` ENABLE KEYS */;


--
-- Definition of table `oa_user`
--

DROP TABLE IF EXISTS `oa_user`;
CREATE TABLE `oa_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `loginName` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `phoneNumber` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `departmentId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK9ACB6A18F49BC32E` (`departmentId`),
  CONSTRAINT `FK9ACB6A18F49BC32E` FOREIGN KEY (`departmentId`) REFERENCES `oa_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `oa_user`
--

/*!40000 ALTER TABLE `oa_user` DISABLE KEYS */;
INSERT INTO `oa_user` (`id`,`loginName`,`password`,`name`,`gender`,`phoneNumber`,`email`,`description`,`departmentId`) VALUES 
 (1,'admin','21232f297a57a5a743894a0e4a801fc3','超级管理员','男','','','',NULL),
 (2,'zte','81dc9bdb52d04dc20036dbd8313ed055','赵天恩','男','18360738051','909442787@qq.com','实习生',6);
/*!40000 ALTER TABLE `oa_user` ENABLE KEYS */;


--
-- Definition of table `oa_user_role`
--

DROP TABLE IF EXISTS `oa_user_role`;
CREATE TABLE `oa_user_role` (
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY  (`roleId`,`userId`),
  KEY `FK7C2B5E3DBB0AE3B6` (`roleId`),
  KEY `FK7C2B5E3DC0603920` (`userId`),
  CONSTRAINT `FK7C2B5E3DBB0AE3B6` FOREIGN KEY (`roleId`) REFERENCES `oa_role` (`id`),
  CONSTRAINT `FK7C2B5E3DC0603920` FOREIGN KEY (`userId`) REFERENCES `oa_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `oa_user_role`
--

/*!40000 ALTER TABLE `oa_user_role` DISABLE KEYS */;
INSERT INTO `oa_user_role` (`userId`,`roleId`) VALUES 
 (2,5),
 (1,6),
 (2,6);
/*!40000 ALTER TABLE `oa_user_role` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
