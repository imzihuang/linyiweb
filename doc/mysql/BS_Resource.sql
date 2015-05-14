-- 资源管理表 BS_Resource
DROP TABLE IF EXISTS `BS_Resource`;
Create TABLE `BS_Resource` (
`Id` int(11) NOT NULL AUTO_INCREMENT,-- 自增
`sCode` varchar(25) UNIQUE not NULL,-- 批发城编号
`sName` varchar(50) not NULL,-- 名称
`sDescription` varchar(200) DEFAULT NULL, -- 描述
`nType` int(11) DEFAULT 0, -- 资源类型。0:图片；1:文件
`sUrl` varchar(100) DEFAULT NULL, -- 路径地址
`dtCreate` datetime not NULL,-- 创建日期
`bCancel` bit DEFAULT 0, -- 是否作废，默认不作废
`sRemark` varchar(500) DEFAULT NULL,-- 备注
PRIMARY KEY (`Id`)-- 设为主键
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


INSERT INTO `BS_Resource` (`sCode`,`sName`,`sDescription`,`nType`,`sUrl`,`dtCreate`)
VALUES ('R00000001','图片1','店铺营业执照',0,'images/product/imgtmp-product.jpg','2014-12-30 14:34:31');

INSERT INTO `BS_Resource` (`sCode`,`sName`,`sDescription`,`nType`,`sUrl`,`dtCreate`)
VALUES ('R00000002','图片2','店铺logo',0,'images/product/imgtmp-product.jpg','2014-12-30 14:34:31');