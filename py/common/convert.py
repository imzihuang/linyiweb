#!/usr/bin/python
# -*- coding: UTF-8 -*-

import simplejson
from urlparse import urlparse
from types import GeneratorType, NoneType

from comm_class import DateJsonEncoder

def resolve_redis_url(url, with_channel=False):
    """解析redis字符串
    :param url: redis://<ip>:<port>/db,db,db?pwd=xxx#channel
    """
    url = urlparse(url)
    ip, port = url.netloc.split(':')


    tup = url.path[1:].partition('?')
    query, _, pwd = tup
    if url.query:
        pwd=url.query

    pwd, _, channel = pwd.partition('#')
    db = tuple((int(x) for x in query.split(',')))
    db = db[0] if 1 == len(db) else db
    if not pwd:
        if not with_channel:
            return ip, int(port), db
        return ip, int(port), db, channel

    pwd = pwd.partition('=')[-1]
    if not with_channel:
        return ip, int(port), db, pwd
    return ip, int(port), db, pwd, channel


def combine_redis_cmds(*args):
    # 至少要求有一个
    if not args:
        raise ValueError('args at least 1')
    if not isinstance(args[0], (str, tuple, list, GeneratorType)):
        raise ValueError('actual is {0}'.format(type(args[0])))

    default = ()
    for x in args:
        if isinstance(x, GeneratorType):
            x = tuple(x)
        if isinstance(x[0], str):
            x = (x, )
        if not isinstance(x, tuple):
            x = tuple(x)
        default += x
    return default

def bs2utf8(bs):
    if isinstance(bs, basestring):
        return bs.encode('utf-8') if isinstance(bs, unicode) else bs
    return bs

def json_dumps_time(json,**kwargs):
    return simplejson.dumps(json,cls = DateJsonEncoder,**kwargs)

def json_load(str_json):
    return simplejson.loads(str_json)