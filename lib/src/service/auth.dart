


import '../../index.dart';
import './response.dart';
class QMAuth{
  static const String TAG = "QMAuth";
  static Future<QMUser> login({name:'',pass:''}) async{
    // var param = {"serviceName":"FusionCoreService","methodName":"doLogin","paraValues":{"password":pass,"devMode":false,"ipAddress":'10.133.64.25',"client":"800","language":"zh_CN","userName":name} ,"client":800,"userName":"SUPER","tran":"TLogin","language":"zh_CN","sessionID":"SUPER","guid":"06e587a4-6329-4120-8849-e62394b919a7","backendVersion":""};
      QMReq req = QMReq.fromJson({});
      req.method('doLogin');
      req.params({
        "password":pass,
        "userName":name,
        "devMode":false
        });
      QMRsp rsp = await QMHttpService.post("",data:req);
      QMUser user = QMUser.fromJson(rsp.getData());
      QMApp.setUser(user);
      if(user != null){
        QMLogUtil.v("UserLogin:"+user.loginName,tag:QMAuth.TAG);
      }
      return user;
  }
}



// {"result":{"errorField":"","rowIndex":-1,"resultObj":{"msg":{"address":"http://im.qm.cn:8070/authen/","appid":"2c90d08f50eb633c0150eb6dbe640001","token":"2d302f6ea4f6da5c61621510949e23dd"},"companyDesc":"组件一室","chineseCharLen":2,"language":"zh_CN","sessionID":"10338373-421d-44e9-8bf0-2f284d84140a","favoriteMenu":[],"userID":20730,"companyID":26,"loginTime":1555382096060,"loginName":"ZHANGSX","client":"800","isTenent":false,"recent":[{"code":"tmw02","forShort":"rwgl","BizTranPath":"tmw/tmw02/tmw02.module#TMW02Module","module":"tmw","origin":"0","hasChild":false,"name":"任务管理","icon":"tasks","submodule":"tmw02","childList":[],"url":"tmw02","openType":"0"},{"code":"tmw027","forShort":"gzhb","BizTranPath":"tmw/tmw/tmw027/tmw027.module#Tmw027Module","module":"tmw","origin":"0","hasChild":false,"name":"工作汇报","icon":"wpforms","submodule":"tmw","childList":[],"url":"tmw027","openType":"0"},{"code":"sys010","forShort":"xtsz","BizTranPath":"@fusion/base/sys/sys010/sys010.module#Sys010Module","module":"base","origin":"0","hasChild":false,"name":"系统设置","submodule":"sys","childList":[],"url":"sys010","openType":"0"},{"code":"sys015","forShort":"zysl","BizTranPath":"@fusion/base/sys/sys015/sys015.module#Sys015Module","module":"base","origin":"0","hasChild":false,"name":"作业实例","submodule":"sys","childList":[],"url":"sys015","openType":"0"},{"code":"sys002","forShort":"jsgl","BizTranPath":"@fusion/base/sys/sys002/sys002.module","module":"base","origin":"0","hasChild":false,"name":"角色管理","submodule":"sys","childList":[],"url":"sys002","openType":"0"},{"code":"sys013","forShort":"bhgl","BizTranPath":"@fusion/base/sys/sys013/sys013.module#Sys013Module","module":"base","origin":"0","hasChild":false,"name":"编号管理","submodule":"sys","childList":[],"url":"sys013","openType":"0"},{"code":"sys031","forShort":"ylgl","BizTranPath":"@fusion/base/sys/sys031/sys031.module","module":"base","origin":"0","hasChild":false,"name":"用例管理","submodule":"sys","childList":[],"url":"sys031","openType":"0"},{"code":"sys005","forShort":"zzgl","BizTranPath":"@fusion/base/sys/sys005/sys005.module","module":"base","origin":"0","hasChild":false,"name":"组织管理","submodule":"sys","childList":[],"url":"sys005","openType":"0"},{"code":"sys008","forShort":"dysqys","BizTranPath":"@fusion/base/sys/sys008/sys008.module","module":"base","origin":"0","hasChild":false,"name":"定义授权元素","submodule":"sys","childList":[],"url":"sys008","openType":"0"},{"code":"sys003","forShort":"zdbgl","BizTranPath":"@fusion/base/sys/sys003/sys003.module","module":"base","origin":"0","hasChild":false,"name":"字典表管理","submodule":"sys","childList":[],"url":"sys003","openType":"0"}],"companyCode":"B010104","menuList":[{"code":"我的收藏夹","BizTranPath":"","module":"","origin":"","hasChild":true,"name":"我的收藏夹","icon":"star-o","childList":[],"url":"","openType":""},{"forShort":"PaaStyzj","icon":"cube","childList":[{"forShort":"DevOps","icon":"folder-o","childList":[{"code":"tmw001","forShort":"xmgl","BizTranPath":"tmw/tmw/tmw001/tmw001.module#TMW001Module","module":"tmw","origin":"0","hasChild":false,"name":"项目管理","icon":"map","submodule":"tmw","childList":[],"url":"tmw001","openType":"0"},{"code":"tmw02","forShort":"rwgl","BizTranPath":"tmw/tmw02/tmw02.module#TMW02Module","module":"tmw","origin":"0","hasChild":false,"name":"任务管理","icon":"tasks","submodule":"tmw02","childList":[],"url":"tmw02","openType":"0"},{"code":"tmw03","forShort":"sjfb","BizTranPath":"tmw/tmw03/tmw03.module#TMW03Module","module":"tmw","origin":"0","hasChild":false,"name":"升级发布","icon":"gavel","submodule":"tmw03","childList":[],"url":"tmw03","openType":"0"},{"code":"tmw020","forShort":"rwkb","BizTranPath":"tmw/tmw/tmw020/tmw020.module#Tmw020Module","module":"tmw","origin":"0","hasChild":false,"name":"任务看板","icon":"bar-chart","submodule":"tmw","childList":[],"url":"tmw020","openType":"0"},{"code":"tmw027","forShort":"gzhb","BizTranPath":"tmw/tmw/tmw027/tmw027.module#Tmw027Module","module":"tmw","origin":"0","hasChild":false,"name":"工作汇报","icon":"wpforms","submodule":"tmw","childList":[],"url":"tmw027","openType":"0"}],"url":"","hasChild":true,"name":"DevOps","folderBizCode":""},{"code":"paas-2","forShort":"lczx","BizTranPath":"http://paas.qm.cn:8087/lightWorkN/login/login.html?U={user_name}","module":"tmw","origin":"1","hasChild":false,"name":"流程中心","icon":"users","submodule":"tmw","childList":[],"url":"http://paas.qm.cn:8087/lightWorkN/login/login.html?U=SUPER","openType":"1"},{"code":"paas-4","forShort":"fwzx","BizTranPath":"http://paas.qm.cn:8088/ESBAPP/login.jsp?loginToken=^admin","module":"tmw","origin":"1","hasChild":false,"name":"服务总线","icon":"connectdevelop","submodule":"tmw","childList":[],"url":"http://paas.qm.cn:8088/ESBAPP/login.jsp?loginToken=^admin","openType":"1"},{"code":"paas-7","forShort":"yyjk","BizTranPath":"http://paas.qm.cn:8089/base/index.html?t=1","module":"tmw","origin":"1","hasChild":false,"name":"应用监控","icon":"file","submodule":"tmw","childList":[],"url":"http://paas.qm.cn:8089/base/index.html?t=1","openType":"1"},{"forShort":"jcfw","icon":"folder-o","childList":[{"code":"sys009","forShort":"gxhsz","BizTranPath":"@fusion/base/sys/sys009/sys009.module#Sys009Module","module":"base","origin":"0","hasChild":false,"name":"个性化设置","submodule":"sys","childList":[],"url":"sys009","openType":"0"},{"code":"sys003","forShort":"zdbgl","BizTranPath":"@fusion/base/sys/sys003/sys003.module","module":"base","origin":"0","hasChild":false,"name":"字典表管理","submodule":"sys","childList":[],"url":"sys003","openType":"0"},{"code":"sys008","forShort":"dysqys","BizTranPath":"@fusion/base/sys/sys008/sys008.module","module":"base","origin":"0","hasChild":false,"name":"定义授权元素","submodule":"sys","childList":[],"url":"sys008","openType":"0"},{"code":"sys031","forShort":"ylgl","BizTranPath":"@fusion/base/sys/sys031/sys031.module","module":"base","origin":"0","hasChild":false,"name":"用例管理","submodule":"sys","childList":[],"url":"sys031","openType":"0"},{"code":"sys005","forShort":"zzgl","BizTranPath":"@fusion/base/sys/sys005/sys005.module","module":"base","origin":"0","hasChild":false,"name":"组织管理","submodule":"sys","childList":[],"url":"sys005","openType":"0"},{"code":"sys013","forShort":"bhgl","BizTranPath":"@fusion/base/sys/sys013/sys013.module#Sys013Module","module":"base","origin":"0","hasChild":false,"name":"编号管理","submodule":"sys","childList":[],"url":"sys013","openType":"0"},{"code":"sys002","forShort":"jsgl","BizTranPath":"@fusion/base/sys/sys002/sys002.module","module":"base","origin":"0","hasChild":false,"name":"角色管理","submodule":"sys","childList":[],"url":"sys002","openType":"0"},{"code":"sys014","forShort":"zygl","BizTranPath":"@fusion/base/sys/sys014/sys014.module#Sys014Module","module":"base","origin":"0","hasChild":false,"name":"作业管理","submodule":"sys","childList":[],"url":"sys014","openType":"0"},{"code":"sys015","forShort":"zysl","BizTranPath":"@fusion/base/sys/sys015/sys015.module#Sys015Module","module":"base","origin":"0","hasChild":false,"name":"作业实例","submodule":"sys","childList":[],"url":"sys015","openType":"0"},{"code":"sys016","forShort":"zyjk","BizTranPath":"@fusion/base/sys/sys016/sys016.module#Sys016Module","module":"base","origin":"0","hasChild":false,"name":"作业监控","submodule":"sys","childList":[],"url":"sys016","openType":"0"},{"code":"sys017","forShort":"zyfwwh","BizTranPath":"@fusion/base/sys/sys017/sys017.module#Sys017Module","module":"base","origin":"0","hasChild":false,"name":"作业服务维护","submodule":"sys","childList":[],"url":"sys017","openType":"0"},{"code":"sys010","forShort":"xtsz","BizTranPath":"@fusion/base/sys/sys010/sys010.module#Sys010Module","module":"base","origin":"0","hasChild":false,"name":"系统设置","submodule":"sys","childList":[],"url":"sys010","openType":"0"},{"code":"sys003","forShort":"zdbgl","BizTranPath":"@fusion/base/sys/sys003/sys003.module","module":"base","origin":"0","hasChild":false,"name":"字典表管理","submodule":"sys","childList":[],"url":"sys003","openType":"0"},{"code":"sys013","forShort":"bhgl","BizTranPath":"@fusion/base/sys/sys013/sys013.module#Sys013Module","module":"base","origin":"0","hasChild":false,"name":"编号管理","submodule":"sys","childList":[],"url":"sys013","openType":"0"},{"code":"sys001","forShort":"yhgl","BizTranPath":"@fusion/base/sys/sys001/sys001.module","module":"base","origin":"0","hasChild":false,"name":"用户管理","submodule":"sys","childList":[],"url":"sys001","openType":"0"}],"url":"","hasChild":true,"name":"基础服务","folderBizCode":""}],"url":"","hasChild":true,"name":"PaaS通用组件","folderBizCode":"paas"}],"showAuthButton":true,"wflInfo":[{"submitButton":"bindings.save","wflId":"-1","menuCode":"sys013","page":"edit","params":["bindings.f.SeriNumRangeObj","bindings.f.Description"]}],"companyType":"bm","Menu_Content":"Desc+Name","userName":"张善旭","moduleMap":{"SRE":"BASE","FBR":"FBR","IDE":"BASE","SYS":"BASE","TMW":"TMW"},"system":{"full_name":"","system_id":"","system_version":"","appID":"f4c9242c-f589-424f-a602-7a00efb3c128","system_code":"","short_name":"","project_name":"TMW","environment_info":""},"addUrlMap":{},"backendVersion":""}},"exMessage":"","resultState":0,"upTime":7951583618,"downTime":7951583703,"serviceDistribute":"Y"}