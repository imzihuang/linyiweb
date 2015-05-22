-- 创建视图

-- 店铺信息
drop view if exists v_shop;
CREATE VIEW v_shop AS SELECT sp.*,r1.sUrl as sBL_Url,r2.sUrl as sLoge_Url,sg.sGoodsCode  FROM BS_Shop as sp
left join BS_Resource as r1 on sp.sBL_Img_Code = r1.sCode
left join BS_Resource as r2 on sp.sShopLogoCode = r2.sCode
left join BS_Shop_Goods as sg on sp.sCode = sg.sShopCode;