#!/usr/bin/python
# -*- coding: UTF-8 -*-

import datetime

from manager import Manager
from py.dal.base_dal import UserDALC
from py.common.myexception import MyException
from py.common.regexp import verifyEamil, verifySpecialChar, verifyPhone, verifyMobile
from py.common.encrypt.encrypt_md5 import get_md5
from py.common.convert import bs2utf8

#用户操作
class UserManager(Manager):
    def __init__(self):
        self.dal = UserDALC()

    def register(self, dicuser):
        # 注册
        dicuser["dtCreate"] = datetime.datetime.now()  # 取当前日期
        dicuser["dtModify"] = datetime.datetime.now()  # 取当前日期
        # 验证数据
        self.verifyRegisterInfo(dicuser)
        # 创建用户编号
        dicuser["sCode"] = self.CreateCode("sCode", "US" + dicuser["sType"] + datetime.datetime.now().strftime('%Y%m%d'))
        # 密码加密
        dicuser['sPassword'] = get_md5(dicuser.get('sPassword'))
        self.insert(dicuser)
        return "注册成功"

    def login(self, username,pwd):
        # 登录
        assert username and pwd
        dicuser = {'sName':username,'sEmail':username}
        userInfo = self.getInfo(dicuser, andor = False)
        if not userInfo:
            raise MyException("用户不存在或密码错误")
        if get_md5(pwd) !=userInfo.get('sPassword'):
            raise MyException("密码错误")
        return userInfo


    def verifyRegisterInfo(self, dicuserinfo):
        #邮箱不能重复，必须满足格式
        if verifyEamil(bs2utf8(dicuserinfo.get("sEmail"))) == False:
            raise MyException("邮箱：%s格式不正确" % dicuserinfo.get("sEmail"))
        if self.Exist("sEmail", dicuserinfo.get("sEmail")):
            raise MyException("邮箱：%s已经被注册" % dicuserinfo.get("sEmail"))
        #用户名不能重复，不允许有特殊字符，长度不能超过15位
        if self.Exist("sName", dicuserinfo.get("sName")):
            raise MyException("用户名：%s" % dicuserinfo.get("sName"))
        #密码不允许有特殊字符，长度不能超过15位
        if len(dicuserinfo.get("sPassword")) > 15:
            raise MyException("密码不允许超过15位")
        if verifySpecialChar(dicuserinfo.get("sPassword")):
            raise MyException("密码不允许存在特殊字符")
        # 电话号码允许为空，但不为空必须满足格式
        # if verifyMobile(dicuserinfo.get("sMobile")) == False:
            # raise MyException("移动号码：%s格式不正确" % str(dicuserinfo.get("sMobile"]))
