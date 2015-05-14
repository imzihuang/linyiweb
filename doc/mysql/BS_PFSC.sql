-- 创建批发城表BS_PFSC
DROP TABLE IF EXISTS `BS_PFSC`;
Create TABLE `BS_PFSC` (
`Id` int(11) NOT NULL AUTO_INCREMENT,-- 自增
`sCode` varchar(25) UNIQUE not NULL,-- 批发城编号
`sName` varchar(50) not NULL,-- 名称
`sAddress` varchar(100) DEFAULT NULL,-- 批发城地址
`sTelephone` varchar(25) DEFAULT NULL,-- 批发城联系方式
`sDescription` varchar(200) DEFAULT NULL, -- 描述
`dtCreate` datetime not NULL,-- 创建日期
`bCancel` bit DEFAULT 0, -- 是否作废，默认不作废
`sRemark` varchar(500) DEFAULT NULL,-- 备注
PRIMARY KEY (`Id`)-- 设为主键
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO `BS_PFSC` (`sCode`,`sName`,`sAddress`,`sTelephone`,`sDescription`,`dtCreate`)
VALUES ('PF00000001','临沂批发城1','临沂','18787667564','批发城描述','2014-12-30 14:34:31');