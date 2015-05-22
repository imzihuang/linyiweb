-- 创建店铺与商品关系表 BS_Shop_Goods
DROP TABLE IF EXISTS `BS_Shop_Goods`;
Create TABLE `BS_Shop_Goods` (
`Id` int(11) NOT NULL AUTO_INCREMENT,-- 自增
`sCode` varchar(25) UNIQUE not NULL,-- 关系编号
`sShopCode` varchar(50) not NULL,-- 店铺编号
`sGoodsCode` varchar(100) DEFAULT NULL,-- 商品编号
`dtCreate` datetime not NULL,-- 创建日期
`dRetailPrice` decimal(15,2) DEFAULT 0, -- 建议零售价
`dActivePrice` decimal(15,2) DEFAULT 0,-- 活动价格
`bCancel` bit DEFAULT 0,-- 是否取消
`sRemark` varchar(500) DEFAULT NULL,-- 备注
PRIMARY KEY (`Id`)-- 设为主键
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;