#!/usr/bin/python
# -*- coding: UTF-8 -*-

from tornado.web import RequestHandler
from py.common.response_entity import res_entity
from py.control.shop_manager import ShopManager
import simplejson
from py.common.convert import json_dumps_time

def create_shoplist(_man, typ, code, sn, mn):
    try:
        shoplist = _man.getShop(typ, code , sn=sn, mn=mn)
        shopnum = _man.getShopNum(typ, code)
        result = {
            "total": shopnum,
            "data":shoplist
        }
        return json_dumps_time(result,ensure_ascii=False)
    except Exception,ex:
        print(ex)


class ShopHandler(RequestHandler):
    """
    店铺
    """
    def get(self,method):
        _man = ShopManager()
        if method == 'shoplist':
            typ = int(self.get_argument('typ','0'))
            code = self.get_argument('code','')
            page = int(self.get_argument('page','1'))
            page = 1 if page<1 else page
            mn = int(self.get_argument('rows','10'))
            sn = (page-1)*mn
            result = create_shoplist(_man,typ,code,sn,mn)
            self.finish(result)
