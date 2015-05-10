#coding:utf-8

def span_bits(i, b, e):
    """
    提取二进制比特位
    :param i: 整数
    :param b：开始比特位
    :param e：最后比特位
    """
    if not isinstance(i, (int, long)):
        raise ValueError('i should be int, actual is {0}'.format(i))

    assert isinstance(b, int)
    assert isinstance(e, int)
    assert b >= e

    offset = b - e + 1
    v = i >> e
    v &= 2 ** offset - 1

    r = [int(x) for x in bin(v)[2:]]
    return tuple([0, ] * (offset - len(r)) + r)


def cal_bits(i, b, e):
    """
    计算比特位
    :param i: 整数
    :param b：开始比特位
    :param e：最后比特位
    """
    if not isinstance(i, (int, long)):
        raise ValueError('i should be int, actual is {0}'.format(i))

    assert isinstance(b, int)
    assert isinstance(e, int)
    assert b >= e

    offset = b - e + 1
    v = i >> e
    v &= 2 ** offset - 1
    return v