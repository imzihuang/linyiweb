

-- 创建店铺等级表D_ShopClass
DROP TABLE IF EXISTS `D_ShopClass`;
Create TABLE `D_ShopClass` (
`Id` int(11) NOT NULL,
`sCode` varchar(25) UNIQUE not NULL,-- 店铺等级编号
`sName` varchar(50) not NULL,-- 名称
`sDescribe` varchar(100) DEFAULT NULL,-- 描述
`bVaild` bit DEFAULT 1,-- 是否有效
PRIMARY KEY (`Id`)-- 设为主键
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


-- 创建品牌表D_Brand
DROP TABLE IF EXISTS `D_Brand`;
Create TABLE `D_Brand` (
`Id` int(11) NOT NULL,
`sCode` varchar(25) UNIQUE not NULL,-- 品牌编号
`sName` varchar(50) not NULL,-- 名称
`sDescribe` varchar(100) DEFAULT NULL,-- 描述
`bVaild` bit DEFAULT 1,-- 是否有效
PRIMARY KEY (`Id`)-- 设为主键
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;


-- 创建店铺与品牌的关系表 BS_Shop_Brand
DROP TABLE IF EXISTS `BS_Shop_Brand`;
Create TABLE `BS_Shop_Brand` (
`Id` int(11) NOT NULL AUTO_INCREMENT,-- 自增
`sCode` varchar(25) UNIQUE not NULL,-- 关系编号
`sShopCode` varchar(50) not NULL,-- 店铺编号
`sBrandCode` varchar(100) DEFAULT NULL,-- 品牌编号
`dtCreate` datetime not NULL,-- 创建日期
`bCancel` bit DEFAULT 0,-- 是否取消
`sRemark` varchar(500) DEFAULT NULL,-- 备注
PRIMARY KEY (`Id`)-- 设为主键
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

