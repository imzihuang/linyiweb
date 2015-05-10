-- 创建商品表D_Goods
DROP TABLE IF EXISTS `D_Goods`;
Create TABLE `D_Goods` (
`Id` int(11) NOT NULL AUTO_INCREMENT,
`sCode` varchar(25) UNIQUE not NULL,-- 商品编号
`sParentCode` varchar(25) DEFAULT NULL,-- 商品父编号
`sName` varchar(50) not NULL,-- 名称
`sDescribe` varchar(100) DEFAULT NULL,-- 描述
`nNumber` int(11) DEFAULT 0,-- 商品总数,通过脚本计算
`bVaild` bit DEFAULT 1,-- 是否有效
PRIMARY KEY (`Id`)-- 设为主键
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;



INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM100000',NULL,'建材','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM200000',NULL,'家具','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM300000',NULL,'家饰','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM400000',NULL,'家纺','',0,1);

-- 建材
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101000','DM100000','五金工具','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102000','DM100000','装饰材料','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103000','DM100000','电工电料','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM104000','DM100000','墙地面材料','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105000','DM100000','厨房卫浴','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106000','DM100000','灯饰照明','',0,1);

-- 家具
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM201000','DM200000','卧室','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM202000','DM200000','客厅','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM203000','DM200000','餐厅','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM204000','DM200000','书房','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM205000','DM200000','户外','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM206000','DM200000','商业办公','',0,1);

-- 家饰
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM301000','DM300000','相框/画片','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM302000','DM300000','挂饰贴饰','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM303000','DM300000','家居摆件','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM304000','DM300000','植物花卉','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM305000','DM300000','工艺饰品','',0,1);

-- 家纺
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM401000','DM400000','床上用品','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM402000','DM400000','门窗帘幕','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM403000','DM400000','布艺家纺','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM404000','DM400000','日用家居','',0,1);

-- 五金工具
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101001','DM101000','法兰','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101002','DM101000','电动机','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101003','DM101000','扳手','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101004','DM101000','弹簧','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101005','DM101000','铆钉','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101006','DM101000','紧固件','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101007','DM101000','导轨','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101008','DM101000','冲击钻','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101009','DM101000','胶带','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101010','DM101000','手电钻','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101011','DM101000','锯片','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101012','DM101000','锁具','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101013','DM101000','滑轨','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101014','DM101000','测量工具','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM101015','DM101000','起重工具','',0,1);

-- 装饰材料
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102001','DM102000','门','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102002','DM102000','吊顶','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102003','DM102000','浴霸','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102004','DM102000','石材','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102005','DM102000','暖气片','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102006','DM102000','楼梯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102007','DM102000','钢材','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102008','DM102000','板材','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102009','DM102000','窗','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102010','DM102000','壁炉','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102011','DM102000','壁柜','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102012','DM102000','采暖炉','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM102013','DM102000','门窗配件','',0,1);

-- 电工电料
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103001','DM103000','变压器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103002','DM103000','继电器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103003','DM103000','传感器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103004','DM103000','开关','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103005','DM103000','断路器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103006','DM103000','电线电缆','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103007','DM103000','插座','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103008','DM103000','蓄电池','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103009','DM103000','稳压器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103010','DM103000','配电箱','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103011','DM103000','电源转换器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103012','DM103000','插头','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103013','DM103000','温控器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM103014','DM103000','节电器','',0,1);

-- 墙地面材料
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM104001','DM104000','墙纸','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM104002','DM104000','硅藻泥','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM104003','DM104000','瓷砖','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM104004','DM104000','地板','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM104005','DM104000','涂料','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM104006','DM104000','腻子粉','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM104007','DM104000','金箔','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM104008','DM104000','隔音棉','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM104009','DM104000','管材','',0,1);

-- 厨房卫浴
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105001','DM105000','橱柜','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105002','DM105000','马桶','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105003','DM105000','龙头','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105004','DM105000','浴室柜','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105005','DM105000','浴缸','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105006','DM105000','淋浴房','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105007','DM105000','地漏','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105008','DM105000','水槽','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105009','DM105000','角阀','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105010','DM105000','花洒','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105011','DM105000','挂钩','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105012','DM105000','妇洗器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105013','DM105000','置物架','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105014','DM105000','拖把池','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105015','DM105000','蹲便器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105016','DM105000','洗手盆','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105017','DM105000','小便器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105018','DM105000','皂液器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105019','DM105000','烘手器','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM105020','DM105000','配件','',0,1);

-- 灯饰照明
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106001','DM106000','LED灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106002','DM106000','台灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106003','DM106000','吊灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106004','DM106000','日光灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106005','DM106000','射灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106006','DM106000','吸顶灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106007','DM106000','筒灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106008','DM106000','壁灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106009','DM106000','镜前灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106010','DM106000','小夜灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106011','DM106000','落地灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106012','DM106000','应急灯','',0,1);
INSERT into D_Goods(sCode,sParentCode,sName,sDescribe,nNumber,bVaild) values('DM106013','DM106000','户外灯','',0,1);