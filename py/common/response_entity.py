#!/usr/bin/python
# -*- coding: UTF-8 -*-
__author__ = 'imzihuang'

import simplejson
from convert import json_dumps_time


class ResponseEntity:#自定义返回值
    def getErrorEntity(self,error):#获取异常返回结果
        dic = {"status":0,"message":'%s'%error}
        return simplejson.dumps(dic, ensure_ascii=False)

    def getSuccessEntity(self,dicdata):
        dic = {"status":1, "message":json_dumps_time(dicdata,ensure_ascii=False)}
        return simplejson.dumps(dic, ensure_ascii=False)

    def getSuccessMessage(self,message):
        dic = {"status":1, "message":message}
        return simplejson.dumps(dic, ensure_ascii=False)

    def getFaildMessage(self,message):
        dic = {"status":0, "message":message}
        return simplejson.dumps(dic, ensure_ascii=False)


res_entity = ResponseEntity()