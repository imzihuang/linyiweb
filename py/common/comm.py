__author__ = 'imzihuang'
# encoding=utf-8

#公共方法
#遍历字典dic所有key，用逗号拼接
def getKeyForDic(dic, tup=()):  #k属于元组tup
    params = ''
    for k in dic:
        if tup == ():
            params += k + ','
        elif k in tup:
            params += k + ','
    if (params != ''):  #去掉最后一个字符
        params = params[:-1]
    return params


#遍历字典dic所有value，用逗号拼接
#char为特殊字符，在拼接value前后一起拼接
def getValueForDic(dic, tup=()):  #k属于元组tup
    values = ''
    for k in dic:
        if tup == ():
            if isinstance(dic[k], int) or isinstance(dic[k], float):
                values += '%s,' % dic[k]
            else:
                values += '\'%s\',' % dic[k]
        elif k in tup:
            if isinstance(dic[k], int) or isinstance(dic[k], float):
                values += '%s,' % dic[k]
            else:
                values += '\'%s\',' % dic[k]
    if (values != ''):  #去掉最后一个字符
        values = values[:-1]
    return values


def removeDicKey(dic, key):  #移除字典中某个key
    if key in dic:
        dic.pop(key)


def getUpdateVauleForDic(dic):
    updatevalues = ''
    for k in dic:
        list = (k, dic[k])
        if isinstance(dic[k], int) or isinstance(dic[k], float):
            updatevalues = '%s=%s ,' % list
        else:
            updatevalues = '%s=\'%s\' ,' % list
    if (updatevalues != ''):  #去掉最后
        updatevalues = updatevalues[:-1]
    return updatevalues


def getConditionForDic(dic, andor=True):
    if not dic:
        return ''
    condition, sset = '', 'or'
    if andor:
        sset = 'and'
    for k in dic:
        list = (k, dic[k], sset)
        if isinstance(dic[k], int) or isinstance(dic[k], float):
            condition += '%s=%s %s ' % list
        else:
            condition += '%s=\'%s\' %s ' % list  #k+'=\''+dic[k]+'\' '+sset+' '
    if (condition != ''):  #去掉最后
        condition = condition[:-len(sset) - 1]
    return condition









