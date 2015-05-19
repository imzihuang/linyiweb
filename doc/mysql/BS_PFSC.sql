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

INSERT into BS_PFSC(sCode,sName,sAddress,sTelephone,sDescription,dtCreate,bCancel,sRemark) values('PF001','临沂小商品城','琅琊王路与聚才路交汇处','05391234567','占地350亩，建筑面积22万平方米，总投资5亿元，容纳经营户2600户。其中商铺17万平方米，分为文体、纸张、化妆品、小商品四个区域，容纳客户1400户；大卖场5万平方米，共3层，1层经营办公用品、文化用品、体育用品、喜庆用品、洗涤用品、化妆用品、纸张及纸制品类等，2层经营饰品、工艺品、小电器、小五金等百货类商品，3层经营年画、字画、装饰画、日历台历、图片、期刊、美容美发用品工具等，容纳客户1200户。临沂小商品城经营商铺与大卖场的有机结合，为客户经营和消费者采购提供了极大的便利条件，也为市场向现代化经营模式过渡及快速繁荣奠定了基础。','2015-05-16 00:00:00',0,'');
INSERT into BS_PFSC(sCode,sName,sAddress,sTelephone,sDescription,dtCreate,bCancel,sRemark) values('PF002','临沂玩具批发市场','临西七路与水田路交汇处','05391234567','临沂永兴国际玩具专业批发城由山东兰山永兴集团投资3000万元兴建，2007年4月开业，临沂玩具批发-临沂玩具批发市场-临沂电动玩具批发-临沂毛绒玩具批发-临沂永兴国际玩具专业批发城市场占地面积10万平方米，建筑面积5万平方米，经营摊位600个，同时建有1万平方米的大型停车场，水、电、通讯、保卫、消防等配套设施一应俱全。临沂玩具批发-临沂玩具批发市场-临沂电动玩具批发-临沂毛绒玩具批发-临沂永兴国际玩具专业批发城主要经营范围：普通玩具、电动玩具、毛绒玩具、充气玩具,工艺礼品等。是临沂市人民政府批准的临沂唯一玩具专业批发市场，也是鲁南苏北最大的玩具专业市场，并将以其经营定位准确、经营品种丰富、经营环境优良、货物繁多充足、规划设计合理、功能组合齐全、配套设施完善的优势条件，成为广大玩具营销业户最理想的场所.','2015-05-16 00:00:00',0,'');
INSERT into BS_PFSC(sCode,sName,sAddress,sTelephone,sDescription,dtCreate,bCancel,sRemark) values('PF003','临沂五金批发市场','东兴路中段','05391234567','该市场于1987年10月建成开业，经过历年扩建改建，现累计投资8000余万元，占地面积20万平方米，建筑面积6.8万平方米，建有沿街营业大楼16000平方米，营业房1700间，水泥台3170米。目前该市场内共有经营户1665户，摊位1656个，日平均上市人数4.6万人。经营商品12大类，1100多个品种。2003年市场成交额已22亿元。该市场吸引大量外地产品，仅进驻市场做总经销、总代理的大型企业就达860多家。产品主要销往内蒙、山西、河北、苏、鲁、豫、皖及东北三省等，还出口俄罗斯、日本、韩国和东南亚等国家和地区','2015-05-16 00:00:00',0,'');
INSERT into BS_PFSC(sCode,sName,sAddress,sTelephone,sDescription,dtCreate,bCancel,sRemark) values('PF004','临沂永安汽车用品城','西临蒙山大道，北靠北园路','05391234567','地处临沂市批发市场中心，西临蒙山大道，北靠北园路，南北分别为水田汽车站、城北客运站，是目前山东省比较专业、大规模的市场，市场厂商云集，品牌众多，质优价廉。市场主要以批发为主，经营全国名优汽车音响、防盗器、倒车雷达中控锁、汽车美容、养护系列、座垫、座套、方向盘把套、防爆膜以及汽车充气泵，临沂汽车用品批发城尤其冬夏座垫为山东省大型集散地，各种花色齐全，具有价格优势。','2015-05-16 00:00:00',0,'');
INSERT into BS_PFSC(sCode,sName,sAddress,sTelephone,sDescription,dtCreate,bCancel,sRemark) values('PF005','临沂灯具城','育才路与王庄路交汇处','05391234567','临沂灯具城位于临沂市育才路与王庄路交汇处，距临沂机场10公里，紧邻小商品市场、家电厨卫城、摩配成、汽配城、澳龙际物流国际物流城和亚洲最大的汽车站—临沂新汽车站咫尺之遥，四通八达的商贸物流辐射全国近30个省市，交通便利、商机无限。 2006年，市委、市政府、区委、区政府提出了改造、提升传统批发市场、打造中国现代商贸城的发展思路。宋王庄社区、山东华强企业集团领导班子认为这是从根本上解决集团原有市场存在的问题，推动市场发展的良好机遇。新灯具城由投资兴建，总投资3.8亿元，规划占地面积330亩，经营面积26万平方米，容纳经营户800多户。新灯具城规划严整，布局合理，各项市场基础配套设施先进齐全，真正体现了市场提升改造的超前面貌。此外，新灯具城将以其经营定位准确、经营品种丰富、经营环境优良、整体规划设计合理、功能组合齐全、配套设施完善而为显著特色。','2015-05-16 00:00:00',0,'');
INSERT into BS_PFSC(sCode,sName,sAddress,sTelephone,sDescription,dtCreate,bCancel,sRemark) values('PF006','美多现代城','临西七路与前十街交汇处','05391234567','美多现代城是由山东美多集团投资开发，规划总建筑面积约320000平方米，地处临沂市政府大力发展的新商贸物流区中心，毗邻目前亚洲最大的汽车客运站——临沂新客运站，是临沂新商贸城十大重点项目之一。　　山东美多集团是集大型房地产开发、汽车行业、医药行业、精细化工行业经营于一体的大型集团公司，综合实力雄厚。此次斥巨资开发美多现代城，旨在倾力打造临沂市新商业地标，引领城市商业形象和新商贸潮流。临沂美多商贸城是美多现代城商业部分， 美多商贸城是专营洗化用品、钟表、日用百货、厨房用品、劳保用品、窗帘、饰品等的大型市场，总建筑面积近35万平方米，可容纳经营户1000余户。规划科学、商户云集，容易形成规模经济；另一方面，伴随商贸市场的逐步升级，美多商贸城作为行业中跃出的黑马，完善了新商圈的服务功能，未来发展无可限量，有望成为临沂最高端的商贸集散地。临沂美多商贸城是美多现代城商业部分，由山东美多集团有限公司投资、临沂市利群房产开发建设，是临沂最大的“一站式”批零市场。','2015-05-16 00:00:00',0,'');
INSERT into BS_PFSC(sCode,sName,sAddress,sTelephone,sDescription,dtCreate,bCancel,sRemark) values('PF007','临沂服装批发市场','解放路与通达路交汇处','05391234567','该区占地面积35000平方米，建筑面积58000平方米，建有楼房600余间，二层砖混、胶质结构精品屋810余间，水泥台（铁橱）3000米，二层玻璃钢瓦大棚5000平方米，其中楼下用于经营，楼上用于停车、饭场，大大增加了市场空间，缓解了市场压力，实有户数2260户，从业人员4500余人。该市场各期工程共计投资6600万元。服装市场是临沂市各类批发市场的龙头市场之一，开业早，规模大。摊位数、经营户数皆居其他市场首位。服装市场的发展变迁，见证着整个临沂批发市场成长的足迹。该市场日上市金额696万元，日上市人数40000人次，2001年市场成交额达15.7亿元。经营商品品种主要有：西装、童装、男女时装、妇女用品、衬衣、牛仔服等六大类上千个品种，商品主要来源于浙江、江苏、福建、河北及本省各地市，主要销往安徽、河南及本省。','2015-05-16 00:00:00',0,'');
INSERT into BS_PFSC(sCode,sName,sAddress,sTelephone,sDescription,dtCreate,bCancel,sRemark) values('PF008','临沂家电厨卫城','工业大道北段东侧','05391234567','临沂家电厨卫城由临沂瑞兴市场发展有限公司兴办，位于工业大道北段东侧，于2006年4月份由原兰田家电、厨具市场搬迁至现位置。项目总投资4亿元，占地300亩，建筑面积18万平方米，为框架式结构，三层商铺与大卖场科学搭配经营方式，经营商品涉及大家电、小家电、音响设备、通讯器材、照相器材、厨卫餐具等二十大类三千多个品种，商品来自国际、国内知名厂家。市场有摊位880个，经营户1200户，从业人员2600余人，日交易额350万元，年交易额12亿元。','2015-05-16 00:00:00',0,'');
INSERT into BS_PFSC(sCode,sName,sAddress,sTelephone,sDescription,dtCreate,bCancel,sRemark) values('PF009','临沂灯具城','育才路与王庄路交汇处','05391234567','临沂灯具城位于临沂市育才路与王庄路交汇处，距临沂机场10公里，紧邻小商品市场、家电厨卫城、摩配成、汽配城、澳龙际物流国际物流城和亚洲最大的汽车站—临沂新汽车站咫尺之遥，四通八达的商贸物流辐射全国近30个省市，交通便利、商机无限。 2006年，市委、市政府、区委、区政府提出了改造、提升传统批发市场、打造中国现代商贸城的发展思路。宋王庄社区、山东华强企业集团领导班子认为这是从根本上解决集团原有市场存在的问题，推动市场发展的良好机遇。新灯具城由投资兴建，总投资3.8亿元，规划占地面积330亩，经营面积26万平方米，容纳经营户800多户。新灯具城规划严整，布局合理，各项市场基础配套设施先进齐全，真正体现了市场提升改造的超前面貌。此外，新灯具城将以其经营定位准确、经营品种丰富、经营环境优良、整体规划设计合理、功能组合齐全、配套设施完善而为显著特色。','2015-05-16 00:00:00',0,'');
INSERT into BS_PFSC(sCode,sName,sAddress,sTelephone,sDescription,dtCreate,bCancel,sRemark) values('PF010','山东临沂汽摩配城','琅琊王路与聚才路交汇处','05391234567','山东临沂汽摩配城始建于1997年，隶属山东兰田集团，该市场历经十几年的发展，现已拥有金融，工商，质检，物流配送，电子商务，安全监控等为一体的设施完善的专业市场。市场占地450亩，建筑面积24万平方米，分八大经营批发区（微型轿车配件区，农机配件区，橡胶轮胎区，汽车配件区，油品区，摩配区，汽车用品区，摩托及电动车区），常年经营业户1000余户，日客流量6000余人，年成交额36亿元人民币，促进了临沂经济的发展。 该市场先后被山东省工商局，发改委授予“省级文明市场”，“山东十大专业批发市场”称号。 为应对市场竞争的新态势，结合现代经营理念，2006年集团公司投资6亿元，已完成了市场的升级改造。新的市场以超前的设计规划，完善的配套设施，一流的服务水平，已位居华东最大的机动车零配件集散贸易中心，经营品种涉及5000多种，商品远销苏，鲁，豫，皖，东北等10几个省市和地区。','2015-05-16 00:00:00',0,'');



