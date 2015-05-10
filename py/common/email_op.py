#coding:utf-8

import smtplib
from email.mime.text import MIMEText

from py.common.config.config_ini import Config_INI

def send_mail(to_list,sub,content):
    """
    :param to_list: 要发送得邮箱,["316191270@qq.com"]
    :param sub: 主题
    :param content: 内容
    :return:
    """
    assert not None and isinstance(to_list,list)
    assert isinstance(sub,str)
    assert content and isinstance(content,str)


    _conf=Config_INI('configs/email.ini')
    _dic_con=_conf.get_fields('hx_zx')
    mail_host=_dic_con.get('host') #设置服务器
    mail_user=_dic_con.get('user') #用户名
    mail_password=_dic_con.get('pwd') #口令
    mail_postfix=_dic_con.get('postfix') #发件箱的后缀

    me="装修之家"+"<"+mail_user+"@"+mail_postfix+">"
    msg = MIMEText(content,_subtype='plain',_charset='utf-8')
    msg['Subject'] = sub
    msg['From'] = me
    msg['To'] = ";".join(to_list)
    try:
        server = smtplib.SMTP()
        server.connect(mail_host)
        server.starttls()#启动TLS模式，Gmail要求
        server.login(mail_user,mail_password)
        server.sendmail(me, to_list, msg.as_string())
        server.close()
        return True
    except Exception, e:
        return False
