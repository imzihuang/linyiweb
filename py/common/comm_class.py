#coding:utf-8
import simplejson
from datetime import datetime

# 公共类
class DateJsonEncoder(simplejson.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.__str__()
        return simplejson.JSONEncoder.default(self, obj)