# coding:utf-8

from manager import Manager
from py.dal.base_dal import ShopDALC

class ShopManager(Manager):
    def __init__(self):
        self.dal = ShopDALC()

    def getData(self,typ,code):
        """
        获取商店信息
        :param typ: 条件类型。 0:商铺编号；1:批发城；2:商品编号；3:品牌编号
        :param code: 条件值
        :return:
        """
        if not code:
            return
        if typ == 0:
            data=self.getData(key='sCode',value=code,list_data=True)
        if typ == 1:
            data=self.getData(key='sPFSCCode',value=code,list_data=True)
        if typ == 2:
            data = self.getDataByGoods(code)
        return data

    def getDataByGoods(self,code):

        pass


