#!/usr/bin/python
# -*- coding: UTF-8 -*-

import random
#通用方法

def create_vercode():
    #生成4位数验证码
    val_code = ''.join((str(random.randint(0, 9)) for _ in xrange(4)))
    return val_code