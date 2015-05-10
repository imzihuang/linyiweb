#coding:utf-8

EMAIL_REG_VAL = 'gen:email:reg:val' # 邮箱注册验证码

def gen_ttl_key(key):
    assert key and isinstance(key,str)
    return 'ttl',key


def set_email_reg_val(email, val):
    assert email and isinstance(email, str)
    assert val and isinstance(val, str)
    key = ':'.join((EMAIL_REG_VAL, email))
    return ('set', key, val), ('expire', key, 900)

def get_email_reg_val(email):
    assert email and isinstance(email, str)
    key = ':'.join((EMAIL_REG_VAL, email))
    return 'get', key

def gen_email_ttl_key(email):
    assert email and isinstance(email,str)
    key = ':'.join((EMAIL_REG_VAL, email))
    return gen_ttl_key(key)