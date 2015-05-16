#!/usr/bin/python
# -*- coding: UTF-8 -*-

from manager import Manager
from py.dal.dimension_dal import *
from py.common.myexception import MyException
from py.common.convert import bs2utf8

#案例分类
class D_GoodsManager(Manager):
    def __init__(self):
        self.dal=D_GoodsDALC()

class D_MerchantTypeManager(Manager):
    # 材料商品
    def __init__(self):
        self.dal = D_GoodsDALC()

    def initData(self):
        #初始化数据,三层类型数据
        # [{'sCode':'00001','sName':'abc','sParentCode':''},{'sCode':'00002','sName':'xyz','sParentCode':'00001'}] =>
        # {'sCode':'00001','sName':'abc','subdata':[{'sCode':'00002','sName':'xyz'}]}
        alldata = self.getData()
        mylist = []
        mylist = self.createData(mylist,alldata) # 获取主类型

        for mydata in mylist:
            # 第二层类型数据
            sublist = self.createData(mydata,alldata)
            if sublist.get('subdata'):
                for mydata_3 in sublist.get('subdata'):
                    # 获取第三层类型数据
                    self.createData(mydata_3,alldata)
        return mylist

    def createData(self,goal,source):
        if not source:
            raise MyException("init data error:source is none")

        if not goal:
            goal = []
            for data in source:
                if not data.get('sParentCode') or data.get('sParentCode') == '':
                    goal.append(data)
            return goal
        for data in source:
            if goal.get('sCode') == data.get('sParentCode'):
                if not goal.get('subdata'):
                    goal['subdata']=[]
                goal['subdata'].append(data)
        return goal

    def getDataByCode(self,mylist,code,only=False):
        """
        根据编号获取数据
        :param mylist: 根据initData生成的数组数据
        :param code:
        :return:
        """
        if not code:
            return None
        if not mylist or not isinstance(mylist,list):
            return None

        for data in mylist:
            cu_code = bs2utf8(data.get('sCode'))
            if cu_code == bs2utf8(code):
                return data
            if data.get('subdata'):
                subdata = self.getDataByCode(data.get('subdata'),code)
                if subdata:
                    return subdata

        return None #code 不存在

    def getParentDataByCode(self,mylist,code,ismain=False):
        """
        获取父数据。如果父数据不存在，返回自身数据
        :param mylist: 根据initData生成的数组数据
        :param ismain: 为True时候，获取主数据（最上层）
        :return:
        """
        cur_data = self.getDataByCode(mylist,code)
        if not cur_data.get('sParentCode'):
            return cur_data
        if not ismain:
            return self.getDataByCode(mylist,cur_data.get('sParentCode'))
        return self.getParentDataByCode(mylist,cur_data.get('sParentCode'),True)


