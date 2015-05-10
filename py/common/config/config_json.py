__author__ = 'imzihuang'
#coding:utf-8
import simplejson
from os import path

class Config_Json():
    def __init__(self,cfg_fn):
        assert cfg_fn and path.isfile(cfg_fn),'{0} not existed!'.format(cfg_fn)

        fp=open(cfg_fn,'r')
        self.data=simplejson.load(fp,encoding="utf-8")


    def get_dic(self):
        return self.data