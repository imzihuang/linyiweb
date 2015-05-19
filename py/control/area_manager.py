#!/usr/bin/python
# -*- coding: UTF-8 -*-
from manager import Manager
from py.dal.base_dal import AreaDALC

class AreaManager(Manager):
    def __init__(self):
        self.dal=AreaDALC()

    #获取parent的子地区
    def get_sub_area(self,parent='0'):
        data=self.getData(key='sFatherCode',value=parent)
        return data

    #根据名称或者编号获取具体地区
    #name可模糊查询
    def get_area(self,name=None,code=None):
        pass