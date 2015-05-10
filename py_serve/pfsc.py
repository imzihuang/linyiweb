#coding:utf-8

from tornado.web import RequestHandler
from py.control.pfsc_manager import PFSCManager
from py.common.response_entity import res_entity

class PFSCHandler(RequestHandler):
    """
    批发商城
    """
    def get(self):
        _pfsc = PFSCManager()
        code=self.get_argument('code')
        try:
            data = _pfsc.getDataByCode(code)
            result = res_entity.getSuccessEntity(data)
        except Exception,error:
            result = res_entity.getErrorEntity(error)
        finally:
            self.finish(result)