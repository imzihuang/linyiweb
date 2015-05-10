#coding:utf-8

from tornado.web import RequestHandler

class TestHandelr(RequestHandler):
    def get(self):
        self.render('test.html')