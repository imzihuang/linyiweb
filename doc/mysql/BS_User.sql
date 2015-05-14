-- 创建用户信息表
DROP TABLE IF EXISTS `BS_User`;
CREATE TABLE `BS_User`(
	`ID` int(11) NOT NULL AUTO_INCREMENT, -- 自增id
	`sCode` varchar(25) UNIQUE NOT NULL, -- 用户编号
	`sName` varchar(50) DEFAULT NULL,      -- 个人姓名
	`sNickName` varchar(50) DEFAULT NULL,    -- 用户名，昵称
	`sPwd` varchar(50) DEFAULT NULL,   --  登录密码
	`nSex` int(11) NOT NULL, -- 性别
	`dtBirthday` datetime DEFAULT NULL,   -- 出生日期
	`sAddress` varchar(100) DEFAULT NULL,
	`sTelephone` varchar(25) DEFAULT NULL,
	`sMobile` varchar(25) DEFAULT NULL,
	`sQQ` varchar(25) DEFAULT NULL,
	`sMSN` varchar(25) DEFAULT NULL,
	`sWeixin` varchar(25) DEFAULT NULL,     -- 用户个人微信
	`sEmail` varchar(50) DEFAULT NULL, -- 邮箱
	`dtCreate` datetime not NULL,-- 创建日期
	`bCancel` bit DEFAULT 0, -- 是否作废，默认不作废
	`sRemark` varchar(500) DEFAULT NULL,-- 备注
	PRIMARY KEY (`ID`) -- 设为主键
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


INSERT INTO `BS_User` (`sCode`,`sName`,`sNickName`,`sPwd`,`nSex`,`dtBirthday`,`sAddress`,`sTelephone`,`sMobile`,`sQQ`,`sMSN`,`sWeixin`,`sEmail`,`dtCreate`)
VALUES ('BS00000001','测试用户1','用户昵称','0',0,'2014-12-30 14:34:31','临沂','18767665654','17876889304','12345678','12345678','12345678','lin@gamil.com','2014-12-30 14:34:31');
