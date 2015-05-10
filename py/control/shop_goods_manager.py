# coding:utf-8

from manager import Manager
from py.dal.base_dal import Shop_GoodsDALC

class PFSCManager(Manager):
    def __init__(self):
        self.dal = Shop_GoodsDALC()

    def getShopCode(self, goods_code):
        """
        根据商品编号获取所有对应商铺编号(列表)
        :return:
        """
        if not goods_code:
            return
        data=self.getData(key='sGoodsCode',value=goods_code,list_data=True)
        if not data:
            return
        result = []
        for info in data:
            result.append(info.get('sShopCode'))
        return result

    def getGoodsCode(self,shop_code):
        """
        根据商店编号获取所有对应商铺编号(列表)
        :param shop_code:
        :return:
        """
        if not shop_code:
            return
        data=self.getData(key='sShopCode',value=shop_code,list_data=True)
        if not data:
            return
        result = []
        for info in data:
            result.append(info.get('sGoodsCode'))
        return result

