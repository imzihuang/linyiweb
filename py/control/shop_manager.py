#!/usr/bin/python
# -*- coding: UTF-8 -*-

from manager import Manager
from py.dal.base_dal import ShopDALC

class ShopManager(Manager):
    def __init__(self):
        self.dal = ShopDALC()

    def getShop(self, typ, code='', sn=0, mn=1000):
        """
        获取商店信息
        :param typ: 条件类型。 0:商铺编号；1:批发城；2:商品编号；3:品牌编号
        :param code: 条件值。为空，无条件
        :return:
        """
        if not code:
            data = self.getData(sn=sn,mn=mn)
            return data
        if typ not in (0,1,2):
            return
        if typ == 0:
            data=self.getData(key='sCode',value=code,sn=sn,mn=mn)
        if typ == 1:
            data=self.getData(key='sPFSCCode',value=code,sn=sn,mn=mn)
        if typ == 2:
            data = self._getDataByGoods(code)
        return data

    def getShopNum(self, typ, code=''):
        """
        获取商店数量
        :param typ:
        :param code:
        :return:
        """
        if not code:
            num=self.getNumber()
            return num
        if typ not in (0,1,2):
            return 0
        if typ == 0:
            num=self.getNumber(key='sCode',value=code)
        if typ == 1:
            num=self.getData(key='sPFSCCode',value=code)
        if typ == 2:
            num = self._getNumByGoods(code)
        return num

    def _getDataByGoods(self,code):
        return

    def _getNumByGoods(self,code):
        return


