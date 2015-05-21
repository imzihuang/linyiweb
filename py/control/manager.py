#!/usr/bin/python
# -*- coding: UTF-8 -*-
from py.common.comm import *
class Manager(object):
    def _init_condition_dic(self,dic , key = "", value=""):
        if not dic:
            dic = {}
        if key and isinstance(key,str):
            dic.update({
                key:value
            })
        return dic

    def getData(self, dic = None, key="", value="", andor=True,sn =0, mn = 1000):#获取数据集合
        dic = self._init_condition_dic(dic,key,value)
        condition = getConditionForDic(dic,andor)
        data = self.dal.query(condition, sn=sn, mn=mn)
        return data

    def getInfo(self, dic=None, key="", value="", andor=True,mn=1):#获取实体，存在取第一个
        dic = self._init_condition_dic(dic,key,value)
        data=self.getData(dic, key, value, andor=andor, mn=mn)#用户基本信息
        if not data:
            return None   #返回空
        info = data[0] #默认取第一个
        return info

    def getNumber(self, dic=None, key="", value="", andor=True):
        """
        根据条件获取数据的行数
        :param dicdata:
        :param key:
        :param value:
        :param andor:
        :return:
        """
        dic = self._init_condition_dic(dic,key,value)
        condition = getConditionForDic(dic,andor)
        count = self.dal.queryNum(condition)
        return count


    def insert(self,dic):
        params = getKeyForDic(dic,self.dal.columns)
        values = getValueForDic(dic,self.dal.columns)
        self.dal.insert(params,values)

    def update(self,dicValue,dicCondition):
        _u = getUpdateVauleForDic(dicValue)
        _c = getConditionForDic(dicCondition)
        self.dal.update(_u,_c)

    def CreateCode(self,column,pre="",inum=6):
        if pre == "":
            maxcode = self.dal.getMaxValue(column)
        else:
            maxcode = self.dal.getMaxValue(column,pre)
        if maxcode == "":
            nMax = 0
        else:
            nMax = int(maxcode[len(pre):len(maxcode)])
        sMax = str(nMax+1)
        # lenMax=len(sMax)
        sMax.zfill(14) #位数不满inum，自动补满0
        # for i in range(lenMax,inum):#位数不满inum，自动补满0
        #     sMax="0"+sMax
        result = pre+"%s"%sMax
        return result

    def Exist(self, column, value):#判断值是否已经存在，value是string型
        condition = column + "=\'%s\'"%value
        rows = self.dal.queryNum(condition)
        return rows >= 1
