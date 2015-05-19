#!/usr/bin/python
# -*- coding: UTF-8 -*-
__author__ = 'imzihuang'


import re

def verifyEamil(email):#验证邮箱
    #com=re.compile(r"^[^_]\w+@\w+\.\w+")
    if not email or not isinstance(email, basestring):
        return False
    com=re.compile(r'^(?P<name>[a-zA-Z\d][_\.a-zA-Z\d]*)@(?P<domain>[a-zA-Z\d.]+\.[a-z]{2,4})$')
    return com.search(email)

def verifyPhone(phone):#验证固定电话
    if not phone or not isinstance(phone, basestring):
        return False
    com=re.compile(r"^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$")
    return com.search(phone)

def verifyMobile(mobile):#验证移动号码
    if not mobile or not isinstance(mobile, basestring):
        return False
    com=re.compile(r"^1[358]\d{9}$|^147\d{8}")
    return com.search(mobile)

def verifySpecialChar(s):#验证特殊字符
    if not s or not isinstance(s, str):
        return False
    com=re.compile(r'\'|!|@|#|\$|%|\^|&|\*｜\(|\)')
    return com.search(str)

def is_date(v):
    """
    20140424( 12:34:56)
    year, month, day, hour, minute, sec
    """
    com = re.compile(
    r'^(?P<year>20[123]\d)-(?P<month>0[1-9]|1[012])-(?P<day>\d{1,2})(?:\s(?P<hour>[01][0-9]|2[0-3]):(?P<minute>[0-5][0-9]):(?P<sec>[0-5][0-9]))?$')
    if not v or not isinstance(v, str):
        return False
    m = com.search(v)
    if not m:
        return False

    month = int(m.groupdict().get('month'))
    day = int(m.groupdict().get('day'))
    if 2 == month and day > 29:
        return False
    return m