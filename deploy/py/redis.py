#coding:utf-8

import sys
import socket
from common.config.config_ini import Config_INI
from common.convert import resolve_redis_url


def gen_redis_conf(template_file):
    redis_cfg = Config_INI('../configs/redis.ini')

    sections = redis_cfg.get_sections()
    for section in sections:
        url = redis_cfg.get(section, 'url')
        if not url:
            continue

        host, port, db, pwd = resolve_redis_url(url)
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            s.bind((host, port))
        except Exception,e:
            print e
            continue

        mem_size = redis_cfg.get(section, 'mem_size', int)
        mem_size *= 1024 * 1024

        table = {
            'name': section,
            'port': port,
            'max_mem_size': mem_size,
            'password': pwd
        }

        template = open(template_file, 'r').read()
        open('redis_' + section + '.conf', 'w').write(template.format(**table))


if __name__ == '__main__':
    gen_redis_conf(sys.argv[1])