#!/usr/bin/python
# -*- coding: UTF-8 -*-
__author__ = 'imzihuang'

class MyException(Exception):#自定义异常
    def __init__(self,message):
        self.message = message