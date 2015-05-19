#!/usr/bin/python
# -*- coding: UTF-8 -*-
from dal import DALC

class UserDALC(DALC):
    #用户基础数据类
    def __init__(self):
        super(UserDALC, self).__init__()
        self.table="BS_User"
        self.columns=(
            'sCode',
            'sName',
            'sNickName',
            'sPwd',
            'nSex',
            'dtBirthday',
            'sAddress',
            'sTelephone',
            'sMobile',
            'sQQ',
            'sMSN',
            'sWeixin',
            'sEmail',
            'dtCreate',
            'bCancel',
            'sRemark'
        )

class PFSCDALC(DALC):
    # 批发城
    def __init__(self):
        super(PFSCDALC,self).__init__()
        self.table="BS_PFSC"
        self.columns=(
            'sCode',
            'sName',
            'sAddress',
            'sTelephone',
            'sDescription',
            'dtCreate',
            'bCancel',
            'sRemark'
        )

class ShopDALC(DALC):
    # 商铺
    def __init__(self):
        super(ShopDALC,self).__init__()
        self.table='v_shop'
        self.columns=(
            'sCode',
            'sName',
            'sUserCode',
            'sPFSCCode',
            'sAddress',
            'sTelephone',
            'sMobile',
            'sQQ',
            'sQQ1',
            'sMSN',
            'sWeixin',
            'sBusinessLicense',
            'sBL_Img_Code',
            'sClassCode',
            'nScale',
            'dtCreate',
            'dtCheckIn',
            'bCancel',
            'sRemark',
            'sBL_Url',
            'sLoge_Url'
        )

class Shop_GoodsDALC(DALC):
    # 店铺与商品关系
    def __init__(self):
        super(Shop_GoodsDALC,self).__init__()
        self.table='BSShop_Goods'
        self.columns=(
            'sCode',
            'sShopCode',
            'sGoodsCode',
            'dtCreate',
            'bCancel',
            'sRemark'
        )

class Shop_BrandDALC(DALC):
    # 店铺与品牌关系
    def __init__(self):
        super(Shop_BrandDALC,self).__init__()
        self.table='BS_Shop_Brand'
        self.columns=(
            'sCode',
            'sShopCode',
            'sBrandCode',
            'dtCreate',
            'bCancel',
            'sRemark'
        )


class ResourceDALC(DALC):
    # 资源管理
    def __init__(self):
        super(ResourceDALC,self).__init__()
        self.columns=(
            'sCode',
            'sName',
            'sDescription',
            'nType',
            'sUrl',
            'dtCreate',
            'bCancel',
            'sRemark'
        )

class AreaDALC(DALC):
    #地区数据类
    def __init__(self):
        super(AreaDALC, self).__init__()
        self.table="BS_AreaNew"
        self.columns=('ID','sCode','sName','sFatherCode','bValid')