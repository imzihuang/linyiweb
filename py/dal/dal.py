#!/usr/bin/python
# -*- coding: UTF-8 -*-
from py.common.config.config_ini import Config_INI
import torndb

_conf=Config_INI('configs/mysql/mysql.ini')
_dic_con=_conf.get_fields('hx_zx')

mysql_db = torndb.Connection(**_dic_con)

class DALC(object):#数据操作类
    def __init__(self):
        self.table = ""#子类中必须定义table
        self.view = ""
        self.columns = ()
        self._init()

    def _init(self):
        if not self.view:
            self.view = self.table


    def exec_query(self,query, *parameters, **kwparameters):
        #执行一个查询语句
        return mysql_db.query(query, *parameters, **kwparameters)

    def getMaxValue(self,column,pre=""):
        if not column.strip():
            column="sCode"#如果为空，取默认sCode列
        if not pre.strip():
            sql = "select max({0}) from {1}".format(column,self.view)
        else:
            npre = len(pre)
            sql = "select max({0}) from {1} where substring({0},1,{2})= '{3}' and IsNum(substring({0},{4},length({0})-{2}))".format(column,self.table,npre,pre,npre+1)
            #"select max("+column+") from "+self.table+" where substring("+column+",1,"+str(npre)+")= '"+pre+"' and IsNum(substring("+column+","+str(npre+1)+",length("+column+")-"+str(npre)+"))"
        dt=self.exec_query(sql)
        if dt==((None,),):
            return ""
        return dt[0][0]

    def query(self,condition, sn =0, mn = 1000):
        if not condition.strip():
            condition="1=1"
        if not self.columns:
            sql = "select * from {0} where {1} limit {2},{3}".format(self.view, condition, sn, mn)
            #"select * from "+self.table+" where " + condition + " limit " + max_num
        else:
            strcolumns = ', '.join(self.columns)
            sql = "select {0} from {1} where {2} limit {3},{4}".format(strcolumns, self.view, condition, sn, mn)
            # "select %s from %s where %s limit %s"%(strcolumns,self.table,condition,max_num)
        return self.exec_query(sql)

    def queryNum(self,condition):
        """
        根据条件获取数据的行数
        :param condition:
        :return:
        """
        if not condition.strip() or not condition:
            condition="1=1"
        sql="select count(0) from "+self.view+" where "+condition
        dt=self.exec_query(sql)
        return dt[0].get('count(0)')

    def insert(self,params,values):
        sql="insert into {0} ({1}) values({2})".format(self.view,params,values)
        mysql_db.insert(sql)

    def update(self,updatevaules,condition):
        sql='update '+self.view+' set '+updatevaules+' where '+condition
        mysql_db.update(sql)

    def delete(self,condition):
        sql="delete from "+self.view+" where "+condition
        mysql_db.execute(sql)
