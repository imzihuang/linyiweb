#!/usr/bin/python
# -*- coding: UTF-8 -*-

from tornado.web import RequestHandler

class ShowSigninHandelr(RequestHandler):
    def get(self):
        self.render('signin.html')