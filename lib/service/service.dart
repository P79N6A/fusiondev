
import 'package:fusion_dev/index.dart';


class TMWService{
  
  // 获取概要信息
  static Future<QMRsp> loadTaskOverview() async{
    QMReq req = QMReq.fromJson({});
    req.service('TMW019Service');
    req.method('loadTaskOverview');

    return await QMHttpService.post(QMApp.getBaseURL(),
                data: req);
  }

  // 获取预警信息
  static Future<QMRsp> loadTaskWarning() async{
    QMReq req = QMReq.fromJson({});
    req.service('TMW019Service');
    req.method('loadTaskWarning');
    return await QMHttpService.post(QMApp.getBaseURL(),
                data: req);



    // QMUser user = QMApp.getUser();
    // String sessionID;
    // if(user != null){
    //   sessionID = user.sessionID;
    // }
    // Map<String,dynamic> data = {
    //   'userName':'SUPER',
    //   'sessionID':sessionID,
    //   'methodName':'loadTaskWarning',
    //   'serviceName':'TMW019Service'
    // };
    // return await QMHttpService.doPost(QMApp.getBaseURL(),data: data);
  }

  // 获取任务列表
  static Future<QMRsp> taskList(int fromNum,int toNum, String userName) async{
    QMReq req = QMReq.fromJson({});
    req.service('TMW02Service');
    req.method('taskList');
    req.params({"param":{"fromNum": 0,
    "toNum": 20,
    "fieldName": "",
    "filterValue": "",
    "Device": "Mobile",
    "QueryClass": "B",
    "Args": {
      "PagingArgs": {
        "FromNum": 0,
        "ToNum": 20
      },
      "VHolder": "in ('薛福昌')"
    }
    }});
    
    return await QMHttpService.post(QMApp.getBaseURL(),
                data: req);
  }
  static Future<QMRsp> sourceProjects({String userName,String search_param}) async{
    QMReq req = QMReq.fromJson({});
    req.service("TMW02Service");
    req.method("doSearchSrourceProject");
    req.userName = userName;
    req.tran = "tmw02";
    if(search_param == ""){
      req.params({
        "SearchName": "TMWTaskSrourceProjectSH",
        "DefineCondition": "NotFined",
        "FixedConditions": "",
        "CustomActionUrl": "TMW02Service/doSearchSrourceProject",
        "RowCount": 500,
        "ActivityCondition": "\$",
        "type": "onSearch"
      });
    }else{
      req.params({
        "SearchName": "TMWTaskSrourceProjectSH",
        "DefineCondition": "NotFined",
        "FixedConditions": "",
        "CustomActionUrl": "TMW02Service/doSearchSrourceProject",
        "RowCount": 500,
        "ActivityCondition": "\$VProjectName_P^like upper('%$search_param%')",
        "type": "onSearch"
      });
    }
    String baseURL = "http://10.133.92.168/QMERP/RemoteCallManager?fromClient=QMBS&ModuleName=TMW&service=TMW02Service";
    return await QMHttpService.post(baseURL,data: req);
  }
  static Future<QMRsp> systemUsers({String userName,String search_param}) async{
    QMReq req = QMReq.fromJson({});
    req.service("FusionSearchHelpService");
    req.method("doSearch");
    req.userName = userName;
    req.tran = "tmw02";
    if(search_param == ""){
      req.params({
        "SearchName": "TMWSYSUserSH",
        "DefineCondition": "NotFined",
        "FixedConditions": "",
        "CustomActionUrl": "",
        "RowCount": 500,
        "ActivityCondition": "\$"
      });
    }else{
      req.params({
        "SearchName": "TMWSYSUserSH",
        "DefineCondition": "NotFined",
        "FixedConditions": "",
        "CustomActionUrl": "",
        "RowCount": 500,
        "ActivityCondition": "\$UserName_P^like upper('%$search_param%')"
      });
    }
    
    // String baseURL = "";
    // if(search_url == null){
    //   baseURL = QMApp.getBaseURL();
    // }else{
    //   baseURL = search_url;
    // }
    
    String baseURL = "http://10.133.92.168/QMERP/RemoteCallManager?fromClient=QMBS&ModuleName=TMW&service=FusionSearchHelpService";
    return await QMHttpService.post(baseURL,data: req);
  }
  



//   actionID	876bd7d1-9d6e-442d-9a93-89d858b779ce
// backendVersion	
// client	800
// guid	67ec9ee6-6696-4cc0-9008-8782e6218b1e
// language	zh_CN
// loginTime	1555982619433
// methodName	loadTaskWarning
// serviceName	TMW019Service
// sessionID	b76f8d43-4609-4dc8-afe7-8eb9aeafb501
// tran	welcome
// userName	ZHANGSX
}
// fromClient	QMBS
// ModuleName	SYS
// service	TMW019Service

// actionID	f4019656-ba9a-40e5-95be-6f61e80af7d1
// backendVersion	
// client	800
// guid	38c0383e-bcdf-422e-946f-6b96cc8111f5
// language	zh_CN
// loginTime	1555911758645
// methodName	loadTaskOverview
// serviceName	TMW019Service`
// sessionID	96405c92-bf42-460d-a56b-42d355754a9c
// tran	welcome
// userName	ZHANGSX