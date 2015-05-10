# coding:utf-8

from manager import Manager
from py.dal.base_dal import PFSCDALC
from py.common.convert import bs2utf8

class PFSCManager(Manager):
    def __init__(self):
        self.dal = PFSCDALC()

    def getDataByCode(self, sCode):
        """
        获取批发商城信息
        :return:
        """
        if not sCode:
            # 获取所有
            data = self.getData(list_data=True)
            return  data
        data=self.getData(key='sCode',value=sCode,list_data=True)
        return data