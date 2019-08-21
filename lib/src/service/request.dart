import '../../index.dart';
import 'package:json_annotation/json_annotation.dart'; 
  
part 'request.g.dart';


@JsonSerializable()
  class QMReq extends Object {

  @JsonKey(name: 'serviceName')
  String serviceName;

  @JsonKey(name: 'methodName')
  String methodName;

  @JsonKey(name: 'client')
  String client = '800';

  @JsonKey(name: 'userName')
  String userName = "SUPER";

  @JsonKey(name: 'tran')
  String tran;

  @JsonKey(name: 'language')
  String language;

  @JsonKey(name: 'sessionID')
  String sessionID;

  @JsonKey(name: 'loginTime')
  int loginTime;

  @JsonKey(name: 'backendVersion')
  String backendVersion;

  @JsonKey(name: 'actionID')
  String actionID;

  @JsonKey(name: 'guid')
  String guid;

  @JsonKey(name: 'paraValues')
  dynamic paraValues;

  params(Map<String, dynamic> srcJson){
    this.paraValues = srcJson;
  }
  method(String method){
    this.userName = 'SUPER';
    if(this.serviceName == null || this.serviceName == ''){
      this.serviceName = 'FusionCoreService';
    }
    QMUser user = QMApp.getUser();
    if(user != null){
      this.sessionID = user.sessionID;
    }
    this.methodName = method;
  }
  service(String serviceName){
    this.serviceName = serviceName;
  }


  QMReq(this.serviceName,this.methodName,this.client,this.userName,this.tran,this.language,this.sessionID,this.loginTime,this.backendVersion,this.actionID,this.guid,this.paraValues,);

  factory QMReq.fromJson(Map<String, dynamic> srcJson) => _$QMReqFromJson(srcJson);

  Map<String, dynamic> toJson() => _$QMReqToJson(this);

}

  

  
