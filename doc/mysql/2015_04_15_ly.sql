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

-- 创建店铺表BS_Shop
DROP TABLE IF EXISTS `BS_Shop`;
Create TABLE `BS_Shop` (
`Id` int(11) NOT NULL AUTO_INCREMENT,-- 自增
`sCode` varchar(25) UNIQUE not NULL,-- 店铺编号
`sName` varchar(50) not NULL,-- 名称
`sUserCode` varchar(25) not NULL,-- 用户编号(店铺老板)
`sPFSCCode` varchar(25) not NULL,-- 批发城编号
`sAddress` varchar(100) DEFAULT NULL,-- 店铺地址
`sTelephone` varchar(25) DEFAULT NULL,-- 店铺联系方式
`sMobile` varchar(25) DEFAULT NULL,-- 店铺联系方式
`sMobile1` varchar(25) DEFAULT NULL,-- 店铺备用联系方式
`sQQ` varchar(25) DEFAULT NULL,-- 店铺联系qq
`sQQ1` varchar(25) DEFAULT NULL,-- 店铺备用联系qq
`sMSN` varchar(25) DEFAULT NULL,-- 店铺MSN
`sWeixin` varchar(25) DEFAULT NULL,-- 店铺联系微信
`sBusinessLicense` varchar(50) DEFAULT NULL,-- 店铺营业执照号码
`sBL_Img_Code` varchar(50) DEFAULT NULL,-- 店铺营业执照照片对应资源管理编号
`sShopLogoCode` varchar(50) DEFAULT Null, -- 店铺logo图片对应资源管理编号
`sClassCode` varchar(25) DEFAULT NULL,-- 店铺等级编号
`nScale` int(11) DEFAULT 1, -- 店铺规模
`dtCreate` datetime not NULL,-- 创建日期
`dtCheckIn` datetime not NULL,-- 入住商城日期
`bCancel` bit DEFAULT 0, -- 是否作废，默认不作废
`sRemark` varchar(500) DEFAULT NULL,-- 备注
PRIMARY KEY (`Id`)-- 设为主键
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

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

-- 创建店铺与商品关系表 BS_Shop_Goods
DROP TABLE IF EXISTS `BS_Shop_Goods`;
Create TABLE `BS_Shop_Goods` (
`Id` int(11) NOT NULL AUTO_INCREMENT,-- 自增
`sCode` varchar(25) UNIQUE not NULL,-- 关系编号
`sShopCode` varchar(50) not NULL,-- 店铺编号
`sGoodsCode` varchar(100) DEFAULT NULL,-- 商品编号
`dtCreate` datetime not NULL,-- 创建日期
`bCancel` bit DEFAULT 0,-- 是否取消
`sRemark` varchar(500) DEFAULT NULL,-- 备注
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