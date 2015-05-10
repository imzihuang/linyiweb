#encoding=utf-8

from py.common.comm import *
class Manager(object):
    def getData(self, dicdata = None, key = "", value = "", andor = True):#获取数据集合
        if not dicdata:
            dicdata = {}
        if key:
            dicdata[key] = value
        #dicdata=simplejson.loads(sdata)
        condition = getConditionForDic(dicdata,andor)
        data = self.dal.query(condition)
        return data

    def getInfo(self,dicdata = None, key = "", value = "", andor = True):#获取实体，存在取第一个
        if not dicdata:
            dicdata = {}
            dicdata[key]=value
        data=self.getData(dicdata,key,value,andor = andor)#用户基本信息
        if data == ((None,),) or (not data):
            return None   #返回空
        info = data[0] #默认取第一个
        return info

    def insert(self,dic):
        params = getKeyForDic(dic,self.dal.columns)
        values = getValueForDic(dic,self.dal.columns)
        self.dal.insert(params,values)#子类必须初始化dal

    def update(self,dicValue,dicCondition):
        updatevaules = getUpdateVauleForDic(dicValue)
        condition = getConditionForDic(dicCondition)
        self.update(updatevaules,condition)

    #def update(self,sUpdateValues,sCondition):
        #self.dal.update(sUpdateValues,sCondition)

    def CreateCode(self,column,pre="",inum=6):
        if pre == "":
            maxcode = self.dal.getMaxValue(column)
        else:
            maxcode = self.dal.getMaxValue(column,pre)
        if maxcode == "":
            nMax = 0
        else:
            nMax = int(maxcode[len(pre):len(maxcode)])
        sMax = str(nMax+1)
        # lenMax=len(sMax)
        sMax.zfill(14) #位数不满inum，自动补满0
        # for i in range(lenMax,inum):#位数不满inum，自动补满0
        #     sMax="0"+sMax
        result = pre+"%s"%sMax
        return result

    def Exist(self, column, value):#判断值是否已经存在，value是string型
        condition = column + "=\'%s\'"%value
        rows = self.dal.queryNum(condition)
        return rows >= 1

"""
class UserManager(Manager):#用户基本信息管理类
    def __init__(self):
        self.dal=ZMDALC.UserDALC()

    def register(self,sdata):#注册
        dicdata=simplejson.loads(sdata,encoding="utf-8")
        dicuser=dicdata["userInfo"]
        dicuser["dtCreate"]=datetime.datetime.now()#取当前日期
        dicuser["dtModify"]=datetime.datetime.now()#取当前日期
        dicdetail=dicdata["userDetailInfo"]
        #验证用户类型是否存在
        #验证数据
        self.verifyRegisterInfo(dicuser)
        #创建用户编号
        code=self.CreateCode("sCode","US"+dicuser["sType"]+datetime.datetime.now().strftime('%Y%m%d'))
        dicuser["sCode"]=code
        dicdetail["sCode"]=code
        self.insert(dicuser)
        self.saveDetailUserInfo(dicuser["sType"],dicdetail)
        return "注册成功"
        #return ZMComm.ResponseEntity().getSuccessMessage("注册成功")

    def login(self,sdata):#登录
        dicdata=simplejson.loads(sdata)
        self.verifyLoginInfo(dicdata)
        userInfo=self.getInfo(dicdata,"","")
        if userInfo==None:
            return ZMComm.ResponseEntity().getFaildMessage("用户不存在或密码错误")
        usertype=userInfo["sType"]#用户类型
        code=userInfo["sCode"]#用户名
        userDetailInfo=self.getDetailUserInfo(usertype,code)#用户具体信息
        result={"userInfo":userInfo,"userDetailInfo":userDetailInfo}
        return result
        #return ZMComm.ResponseEntity().getSuccessEntity(result)

    def verifyLoginInfo(self,dicdata):
        if not "sPassword" in dicdata:
            raise ZMComm.MyException("密码不存在")
        if dicdata["sPassword"]=="":
            raise ZMComm.MyException("密码不允许为空")
        if (not "sName" in dicdata) or (not "sEmail" in dicdata):
            raise ZMComm.MyException("用户名和邮箱至少要填写一个")


    def verifyRegisterInfo(self,dicuserinfo):#验证用户信息是否满足注册
        #邮箱不能重复，必须满足格式
        if ZMComm.Regular().verifyEamil(dicuserinfo["sEmail"])==False:
            raise ZMComm.MyException("邮箱：%s格式不正确"%str(dicuserinfo["sEmail"]))
        if self.Exist("sEmail",dicuserinfo["sEmail"]):
            raise ZMComm.MyException("邮箱：%s已经被注册"%str(dicuserinfo["sEmail"]))
        #用户名不能重复，不允许有特殊字符，长度不能超过15位
        if self.Exist("sName",dicuserinfo["sName"]):
            raise ZMComm.MyException("用户名：%s"%str(dicuserinfo["sName"]))
        #密码不允许有特殊字符，长度不能超过15位
        if len(dicuserinfo["sPassword"])>15:
            raise ZMComm.MyException("密码不允许超过15位")
        if ZMComm.Regular().verifySpecialChar(dicuserinfo["sPassword"]):
            raise ZMComm.MyException("密码不允许存在特殊字符")
        #电话号码允许为空，但不为空必须满足格式
        if dicuserinfo["sPhone"]!="" and ZMComm.Regular().verifyPhone(dicuserinfo["sPhone"])==False:
            raise ZMComm.MyException('固定电话：%s格式不正确'%str(dicuserinfo["sPhone"]))
        if dicuserinfo["sMobile"]!="" and ZMComm.Regular().verifyMobile(dicuserinfo["sMobile"])==False:
            raise ZMComm.MyException("移动号码：%s格式不正确"%str(dicuserinfo["sMobile"]))


    def saveDetailUserInfo(self,usertype,dic):#保存用户具体的信息
        if usertype=="UT001":#户主
            man=UserHouseManager()
            man.insert(dic)
        if usertype=="UT002":#装修公司
            man=UserDecorationManager()
            man.insert(dic)
        if usertype=="UT003":#建材公司
            man=UserMerchantManager()
            man.insert(dic)

    def getDetailUserInfo(self,usertype,code):#根据用户名获取用户具体信息
        if usertype=="UT001":#户主
            man=UserHouseManager()
            return man.getInfo({},"sCode",code)
        if usertype=="UT002":#装修公司
            man=UserDecorationManager()
            return man.getInfo({},"sCode",code)
        if usertype=="UT003":#建材公司
            man=UserMerchantManager()
            return man.getInfo({},"sCode",code)
        return None

class UserHouseManager(Manager):#户主详细信息管理类
    def __init__(self):
        self.dal=ZMDALC.UserHouseDALC()


class UserDecorationManager(Manager):#装修公司详细信息管理类
    def __init__(self):
        self.dal=ZMDALC.UserDecorationDALC()

class UserMerchantManager(Manager):#建材商详细信息管理类
    def __init__(self):
        self.dal=ZMDALC.UserMerchantDALC()


class DecorationDisplayManager(Manager):#装修展示管理类
    def __init__(self):
        self.dal=ZMDALC.DecorationDisplayDALC()

    def getDisplayInfo(self,sdata):
        dicdata=simplejson.loads(sdata)
        #验证查询条件
        displayInfo=self.getInfo(dicdata)
        return ZMComm.ResponseEntity().getSuccessEntity(displayInfo)

    def uploadDispalyInfo(self,sdata):#上传装修实例
        dicdata=simplejson.loads(sdata)
        dicdata["dtCreate"]=datetime.datetime.now()#取当前日期
        dicdata["dtModify"]=datetime.datetime.now()#取当前日期
        #验证产品名称
        dicdata["sCode"]=self.CreateCode("sCode","DED"+datetime.datetime.now().strftime('%Y%m%d'))
        self.insert(dicdata)
        return "上传实例成功"
        #return ZMComm.ResponseEntity().getSuccessMessage("上传成功")

class DecorationEvaluateManager(Manager):#装修展示评价管理类
    def __init__(self):
        self.dal=ZMDALC.DecorationEvaluateDALC()

    def getEvaluateInfo(self,sdata):
        dicdata=simplejson.loads(sdata)
        grade=1
        code=dicdata["sCode"]
        if "nGrade" in dicdata:
            grade=dicdata["nGrade"]
        if grade==1:
            return self.getInfo({},"sCode",code)
        if grade==2:
            return self.getInfo({},"sPreCode",code)
        if grade==3:
            return self.getInfo({},"sDisplayCode",code)
        return "查询等级异常"


    def uploadEvaluateInfo(self,sdata):
        dicdata=simplejson.loads(sdata)
        dicdata["dtCreate"]=datetime.datetime.now()#取当前日期
        self.verifyEvaluateExist(dicdata)
        dicdata["sCode"]=self.CreateCode("sCode","DEE"+datetime.datetime.now().strftime('%Y%m%d'))
        self.insert(dicdata)
        return "评价成功"
        #return ZMComm.ResponseEntity().getSuccessMessage("上传成功")

    def verifyEvaluateExist(self,dicevaluate):#判断装修产品号是否存在
        displayman= DecorationDisplayManager()
        if not displayman.Exist("sCode",dicevaluate["sDisplayCode"]):
            raise ZMComm.MyException("当前评论的主产品号不存在")
        if ("sPreCode" in dicevaluate) and dicevaluate["sPreCode"]!="":
            if not self.Exist("sCode",dicevaluate["sPreCode"]):
                raise ZMComm.MyException("当前评价的上级评论不存在")

class DecorationReleaseManager(Manager):#招标管理类
    def __init__(self):
        self.dal=ZMDALC.DecorationReleaseDALC()

    def uploadDRInfo(self,sdata):
        dicdata=simplejson.loads(sdata)
        dicreplease=dicdata["replease"]#招标信息
        dicreplease["dtCreate"]=datetime.datetime.now()#取当前日期
        dicreplease["dtModify"]=datetime.datetime.now()#取当前日期
        dicitems=dicdata["repleaseitems"]#招标子信息
        code=self.CreateCode("sCode","DR"+datetime.datetime.now().strftime('%Y%m%d'))#生成编号
        dicreplease["sCode"]=code
        dicitems["sParentCode"]=code
        self.insert(dicreplease)#将招标信息上传到数据库
        subman=DecorationSubManager()
        subman.uploadDRSInfo(dicitems)#将子招标信息上传到数据库
        return "上传招标成功，已推送100位装修公司，请耐心等待"


class DecorationSubManager(Manager):#招标子信息管理类
    def __init__(self):
        self.dal=ZMDALC.DecorationSubDALC()

    def uploadDRSInfo(self,sdata):
        dicdata=simplejson.loads(sdata)
        dicdata["dtCreate"]=datetime.datetime.now()#取当前日期
        dicdata["dtModify"]=datetime.datetime.now()#取当前日期
        code=self.CreateCode("sCode","DRS"+datetime.datetime.now().strftime('%Y%m%d'))#生成子招标编号
        dicdata["sCode"]=code
        self.insert(dicdata)#上传子招标信息
        return "上传子招标信息成功"
"""






