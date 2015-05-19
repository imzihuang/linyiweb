DROP TABLE IF EXISTS `BS_User`;
CREATE TABLE `BS_User`(
	`ID` int(11) NOT NULL AUTO_INCREMENT, -- 自增id
	`sCode` varchar(25) UNIQUE NOT NULL, -- 用户编号
	`sName` varchar(50) DEFAULT NULL,      -- 个人姓名
	`sNickName` varchar(50) DEFAULT NULL,    -- 用户名，昵称
	`sPwd` varchar(50) DEFAULT NULL,   --  登录密码
	`nSex` int(5) NOT NULL, -- 性别
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

INSERT into BS_User(sCode,sName,sNickName,sPwd,nSex,dtBirthday,sAddress,sTelephone,sMobile,sQQ,sMSN,sWeixin,sEmail,dtCreate,bCancel,sRemark) values('U00000001','fuwenqing1','wenqing','123456',0,'19900723','山东省济南市','5012345','18911536590','249890219','111','wenqing0988','fuwenqing0988@163.com','2015-04-26 18:00:00',0,'');
INSERT into BS_User(sCode,sName,sNickName,sPwd,nSex,dtBirthday,sAddress,sTelephone,sMobile,sQQ,sMSN,sWeixin,sEmail,dtCreate,bCancel,sRemark) values('U00000002','fuwenqing2','wenqing','123456',0,'19900723','山东省济南市','5012345','18911536590','249890219','111','wenqing0988','fuwenqing0988@163.com','2015-04-27 19:22:15',0,'');
INSERT into BS_User(sCode,sName,sNickName,sPwd,nSex,dtBirthday,sAddress,sTelephone,sMobile,sQQ,sMSN,sWeixin,sEmail,dtCreate,bCancel,sRemark) values('U00000003','fuwenqing3','wenqing','123456',0,'19900723','山东省济南市','5012345','18911536590','249890219','111','wenqing0988','fuwenqing0988@163.com','2015-04-28 09:22:15',0,'');
INSERT into BS_User(sCode,sName,sNickName,sPwd,nSex,dtBirthday,sAddress,sTelephone,sMobile,sQQ,sMSN,sWeixin,sEmail,dtCreate,bCancel,sRemark) values('U00000004','fuwenqing4','wenqing','123456',0,'19900723','山东省济南市','5012345','18911536590','249890219','111','wenqing0988','fuwenqing0988@163.com','2015-04-29 00:22:15',0,'');
INSERT into BS_User(sCode,sName,sNickName,sPwd,nSex,dtBirthday,sAddress,sTelephone,sMobile,sQQ,sMSN,sWeixin,sEmail,dtCreate,bCancel,sRemark) values('U00000005','fuwenqing5','wenqing','123456',0,'19900723','山东省济南市','5012345','18911536590','249890219','111','wenqing0988','fuwenqing0988@163.com','2015-04-30 19:12:15',1,'');
INSERT into BS_User(sCode,sName,sNickName,sPwd,nSex,dtBirthday,sAddress,sTelephone,sMobile,sQQ,sMSN,sWeixin,sEmail,dtCreate,bCancel,sRemark) values('U00000006','fuwenqing6','wenqing','123456',0,'19900723','山东省济南市','5012345','18911536590','249890219','111','wenqing0988','fuwenqing0988@163.com','2015-05-08 19:00:15',0,'');
