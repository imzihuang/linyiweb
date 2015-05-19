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


INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000001','第一家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');


INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000002','第二家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');



INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000003','第三家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');


INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000004','第四家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000005','第五家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');


INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000006','第六家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000007','第七家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000008','第八家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000009','第九家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');


INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000010','第十家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000011','第十一家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000012','第十二家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000013','第十三家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000014','第十四店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000015','第十五店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000016','第十六家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000017','第十七家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000018','第十八家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000019','第十九家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000020','第二十家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

INSERT INTO `BS_Shop` (`sCode`,`sName`,`sUserCode`,`sPFSCCode`,`sAddress`,`sTelephone`,`sMobile`,`sMobile1`,`sQQ`,`sQQ1`,`sMSN`,`sWeixin`,`sBusinessLicense`,`sBL_Img_Code`,`sShopLogoCode`,`sClassCode`,`nScale`,`dtCreate`,`dtCheckIn`)
VALUES ('SP00000021','第二十一家店','U00000001','PF00000001','临沂','17686554678','17678339402','17678339402','1234556','23575','3543256','2343w3','er34567','R00000001','R00000002','SC000001',2,'2014-12-30 14:34:31','2014-12-30 14:34:31');

