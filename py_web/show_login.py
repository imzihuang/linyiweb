#!/usr/bin/python
# -*- coding: UTF-8 -*-

from tornado.web import RequestHandler

class ShowLoginHandler(RequestHandler):
    def get(self):
        self.render('login.html')