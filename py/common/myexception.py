__author__ = 'imzihuang'
#coding:utf-8
class MyException(Exception):#自定义异常
    def __init__(self,message):
        self.message = message