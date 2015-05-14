-- 创建视图

-- 店铺信息
CREATE VIEW v_shop AS SELECT sp.*,r1.sUrl as sBL_Url,r2.sUrl as sLoge_Url  FROM BS_Shop as sp
inner join BS_Resource as r1 on sp.sBL_Img_Code = r1.sCode
inner join BS_Resource as r2 on sp.sShopLogoCode = r2.sCode;