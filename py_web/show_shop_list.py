#!/usr/bin/python
# -*- coding: UTF-8 -*

from tornado.web import RequestHandler

class ShowShoplistHandelr(RequestHandler):
    def get(self):
        self.render('shoplist.html')