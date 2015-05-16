#!/usr/bin/python
# -*- coding: UTF-8 -*-
# 所有维表

from dal import DALC

# 店铺等级
class D_ShopClassDALC(DALC):
    def __init__(self):
        super(D_ShopClassDALC, self).__init__()
        self.table = 'D_ShopClass'
        self.columns=('sCode','sName','sDescribe','bVaild')

# 商品表
class D_GoodsDALC(DALC):
    def __init__(self):
        super(D_GoodsDALC,self).__init__()
        self.table = 'D_Goods'
        self.columns=('sCode','sParentCode','sName','sDescribe','nNumber','bVaild')

# 品牌表
class D_BrandDALC(DALC):
    def __init__(self):
        super(D_BrandDALC,self).__init__()
        self.table='D_Brand'
        self.columns=('sCode','sName','sDescribe','bVaild')



