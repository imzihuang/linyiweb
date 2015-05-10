
#coding:utf-8
from tornado.web import RequestHandler
import simplejson
from py.common.config.config_ini import Config_INI
from py.common.response_entity import res_entity
from py.control.user_manager import UserManager
from py.common.myexception import MyException
from py.common.convert import bs2utf8

common_conf = Config_INI('configs/common.ini')

class AccountHandler(RequestHandler):
    """
    用户账号
    """
    def post(self, method):
        _user_man = UserManager()
        if method == 'login':
            # 登录
            username = bs2utf8(self.get_argument('username'))
            pwd=bs2utf8(self.get_argument('pwd'))
            try:
                userinfo = _user_man.login(username,pwd)
                result = res_entity.getSuccessEntity(userinfo)
                if userinfo:
                    max_age_time = common_conf.get('cookie_time','max_time') #超时时间
                    self.set_secure_cookie("linyi_user",userinfo.get('sName'), max_age = max_age_time)
            except MyException,error:
                result = res_entity.getFaildMessage(error.message)
            except Exception,error:
                result = res_entity.getErrorEntity(error)
            finally:
                self.finish(result)

        if method == 'signin':
            # 注册
            userinfo = simplejson.loads(self.get_argument('userinfo'))
            try:
                message = _user_man.register(userinfo)
                result = res_entity.getSuccessMessage(message)
                max_age_time = common_conf.get('cookie_time','max_time') #超时时间
                self.set_secure_cookie("linyi_user",userinfo.get('sName'), max_age = max_age_time)
            except MyException,error:
                result = res_entity.getFaildMessage(error.message)
            except Exception,error:
                result = res_entity.getErrorEntity(error)
            finally:
                self.finish(result)

        if method == 'logout':
            # 注销
            self.clear_cookie("hx_user")
            self.finish(res_entity.getSuccessEntity('退出成功！'))

