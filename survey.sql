
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (  
  `a_id` bigint(18) NOT NULL AUTO_INCREMENT,
  `a_user` varchar(50) DEFAULT NULL,
  `a_name` varchar(50) DEFAULT NULL,
  `a_pass` varchar(50) DEFAULT NULL,
  `a_isLock` bit(1) DEFAULT NULL,
  `a_lastLogTime` bigint(18) DEFAULT NULL,
  `a_loginIp` varchar(50) DEFAULT NULL,
  `a_addtime` datetime DEFAULT NULL,
  `a_emai` varchar(100) DEFAULT NULL,
  `a_info` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'user', null, '111111', null, null, null, null, null, null);
INSERT INTO `admins` VALUES ('2', 'admin', null, '111111', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for answersheet
-- ----------------------------
DROP TABLE IF EXISTS `answersheet`;
CREATE TABLE `answersheet` (
  `as_id` bigint(18) NOT NULL AUTO_INCREMENT,
  `s_id` bigint(18) NOT NULL,
  `as_result` varchar(8000) DEFAULT NULL,
  `as_postdate` datetime DEFAULT NULL,
  `as_userIP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`as_id`),
  KEY `pk_id` (`s_id`),
  CONSTRAINT `pk_id` FOREIGN KEY (`s_id`) REFERENCES `survey` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
)  AUTO_INCREMENT=2 ;

-- ----------------------------
-- Records of answersheet
-- ----------------------------
INSERT INTO `answersheet` VALUES ('1', '1', '18:text=啥地方是&@@&19:as=1,2;&@@&20:as=1;&@@&28:as=1;&@@&29:as=0;&@@&31:as=0;&@@&40:text=啥地方&@@&41:text=但是&@@&42:as=1;', '2011-03-15 17:31:44', null);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `c_siteName` varchar(500) DEFAULT NULL,
  `c_siteURL` varchar(500) DEFAULT NULL,
  `c_isOpen` bit(1) DEFAULT NULL,
  `c_closeWord` varchar(1000) DEFAULT NULL,
  `copyright` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
)  ;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '上善问卷调查系统', 'https://github.com/chenmaolin88', '', '213213', 'Copyright&copy;2020');

-- ----------------------------
-- Table structure for guestbook
-- ----------------------------
DROP TABLE IF EXISTS `guestbook`;
CREATE TABLE `guestbook` (
  `gb_id` bigint(18) NOT NULL AUTO_INCREMENT,
  `gb_user` varchar(50) DEFAULT NULL,
  `gb_content` varchar(5000) DEFAULT NULL,
  `gb_phone` varchar(20) DEFAULT NULL,
  `gb_qq` varchar(20) DEFAULT NULL,
  `gb_email` varchar(100) DEFAULT NULL,
  `gb_postdate` datetime DEFAULT NULL,
  PRIMARY KEY (`gb_id`)
)  ;

-- ----------------------------
-- Records of guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `l_id` bigint(18) NOT NULL AUTO_INCREMENT,
  `l_url` varchar(500) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `l_img` varchar(500) DEFAULT NULL,
  `l_info` varchar(1000) DEFAULT NULL,
  `l_isLock` bit(1) DEFAULT NULL,
  `l_addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`l_id`)
)  AUTO_INCREMENT=10 ;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('1', 'http://baidu.com', 'xx学院', 'images/logo_xueyuan.gif', 'xx学院', '\0', '2011-03-09 16:38:37');
INSERT INTO `link` VALUES ('9', 'http://baidu.com/', 'XXX大学', 'images/logo_caida.gif', 'xx大学', '\0', '2011-03-01 16:40:28');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `q_id` bigint(18) NOT NULL AUTO_INCREMENT,
  `s_id` bigint(18) NOT NULL,
  `q_type` decimal(18,0) DEFAULT NULL,
  `q_head` varchar(1000) DEFAULT NULL,
  `q_body` varchar(8000) DEFAULT NULL,
  `q_result` varchar(1000) DEFAULT NULL,
  `q_img` varchar(1000) DEFAULT NULL,
  `q_jdtz` varchar(1000) DEFAULT NULL,
  `q_order` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`q_id`),
  KEY `pk_qs` (`s_id`),
  CONSTRAINT `pk_qs` FOREIGN KEY (`s_id`) REFERENCES `survey` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
)  AUTO_INCREMENT=6 ;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '1', '5', '请依次输入你的性别、年级、专业（用空格隔开）', null, '0', null, null, '0');
INSERT INTO `question` VALUES ('2', '1', '1', '现在很多毕业生对找工作感觉焦虑,没有信心,您觉得应该如何看待当前的就业形势?', '继续找工作&$$&考研&$$&寻找长辈的经济援助&$$&自主创业&$$&不知道/没考虑过', '1,2,0,0,1', null, 'null&null&null&null&null', '0');
INSERT INTO `question` VALUES ('3', '5', '1', 'jkhk', 'uyti&$$&yiuyi&$$&iyut&$$&uyt&$$&uyt', '0,1,0,0,0', null, 'null&null&null&null&null', '0');
INSERT INTO `question` VALUES ('4', '5', '1', 'uoi', 'iuy&$$&iyut&$$&ty&$$&tiooo', '0,1,0,0', null, '5&null&null&null', '0');
INSERT INTO `question` VALUES ('5', '5', '1', 'iyu', 'i&$$&tyui&$$&tuy&$$&tyui', '0,0,1,0', null, 'null&null&null&null', '0');

-- ----------------------------
-- Table structure for survey
-- ----------------------------
DROP TABLE IF EXISTS `survey`;
CREATE TABLE `survey` (
  `s_id` bigint(18) NOT NULL AUTO_INCREMENT,
  `templet_id` bigint(18) DEFAULT NULL,
  `s_name` varchar(100) DEFAULT NULL,
  `s_desc` varchar(500) DEFAULT NULL,
  `s_author` varchar(100) DEFAULT NULL,
  `s_img` varchar(1000) DEFAULT NULL,
  `s_ipRepeat` bit(1) DEFAULT NULL,
  `s_createDate` datetime DEFAULT NULL,
  `s_ipLimitType` varchar(10) DEFAULT NULL,
  `s_ipRange` varchar(2000) DEFAULT NULL,
  `s_password` varchar(100) DEFAULT NULL,
  `s_isOpen` bit(1) DEFAULT NULL,
  `s_expireDate` datetime DEFAULT NULL,
  `s_isAudited` bit(1) DEFAULT NULL,
  `s_hits` decimal(18,0) DEFAULT NULL,
  `s_usehits` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `pk_st` (`templet_id`),
  CONSTRAINT `pk_st` FOREIGN KEY (`templet_id`) REFERENCES `templet` (`templet_id`) ON DELETE CASCADE ON UPDATE CASCADE
)  AUTO_INCREMENT=6 ;

-- ----------------------------
-- Records of survey
-- ----------------------------
INSERT INTO `survey` VALUES ('1', '1', '经济危机下大学生对自主创业的看法（题型DEMO）', '  由美国次贷危机引发的金融危机蔓延全球，世界各国经济发展均受到不同程度影响。我国亦不能独善其身，随着金融危机的持续，其对我国经济的影响日益凸显。受金融危机影响，2009届高校毕业生的就业前景变得扑朔迷离，他们的就业状况收到越来越多人的关注。面对来势汹汹的金融危机，以及严峻的就业形势，我们大学生应该如何面对？因此，为了调查大学生对自主创业的看法态度，在此诚意邀请您帮忙做一下这份问卷，你的答案对我们的调查有莫大的帮助！感谢您从百忙之中抽空出来帮我完成这份调查问卷。谢谢！', '调查机构', null, '', '2010-11-01 16:49:22', null, null, null, '', '2011-03-26 16:50:33', '', '0', '4');
INSERT INTO `survey` VALUES ('2', '1', '大白兔奶糖调查报告(图片,密码DEMO)', '谢谢您抽空^_^ ', 'v小组', '1239358821817.jpg\r\n1239358821817.jpg', '', '2011-03-01 17:03:45', null, null, null, '', '2011-03-31 17:24:17', '', '0', '1');
INSERT INTO `survey` VALUES ('5', '1', 'fds', 'fsa', 'fsa', null, '', '2011-03-30 00:00:00', null, null, null, '', '2011-04-29 00:00:00', '', '0', '0');

-- ----------------------------
-- Table structure for templet
-- ----------------------------
DROP TABLE IF EXISTS `templet`;
CREATE TABLE `templet` (
  `templet_id` bigint(18) NOT NULL AUTO_INCREMENT,
  `templet_name` varchar(100) DEFAULT NULL,
  `templet_top` text,
  `templet_body` text,
  `templet_bottom` text,
  `templet_default` bit(1) DEFAULT NULL,
  PRIMARY KEY (`templet_id`)
)  AUTO_INCREMENT=3 ;

-- ----------------------------
-- Records of templet
-- ----------------------------
INSERT INTO `templet` VALUES ('1', '默认模板', null, null, '1', null);
INSERT INTO `templet` VALUES ('2', '新模板', null, null, '0', null);

-- ----------------------------
-- Table structure for text
-- ----------------------------
DROP TABLE IF EXISTS `text`;
CREATE TABLE `text` (
  `t_id` bigint(18) NOT NULL AUTO_INCREMENT,
  `q_id` bigint(18) NOT NULL,
  `t_content` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`t_id`),
  KEY `pk_fk` (`q_id`),
  CONSTRAINT `pk_fk` FOREIGN KEY (`q_id`) REFERENCES `question` (`q_id`) ON DELETE CASCADE ON UPDATE CASCADE
)  ;

-- ----------------------------
-- Records of text
-- ----------------------------
