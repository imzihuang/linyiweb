#!/usr/bin/python
# -*- coding: UTF-8 -*

from tornado.web import RequestHandler

class TestHandelr(RequestHandler):
    def get(self):
        self.render('home.html')