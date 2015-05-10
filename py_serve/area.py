#coding:utf-8

from tornado.web import RequestHandler
from py.control.area_manager import AreaManager
from py.common.response_entity import res_entity

class AreaHandler(RequestHandler):
    def get(self,method):
        _area = AreaManager()
        try:
            if method == 'province':#省
                data = _area.get_sub_area()
            if method == 'city':#市
                parent_code = self.get_argument('code')
                data = _area.get_sub_area(parent_code)
            if method == 'county':#县
                parent_code = self.get_argument('code')
                data = _area.get_sub_area(parent_code)
            result = res_entity.getSuccessEntity(data)
        except Exception,error:
            result = res_entity.getErrorEntity(error)
        finally:
            self.finish(result)