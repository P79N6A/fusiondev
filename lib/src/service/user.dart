import 'package:json_annotation/json_annotation.dart'; 
  
part 'user.g.dart';


@JsonSerializable()
  class QMUser extends Object {

  @JsonKey(name: 'msg')
  Msg msg;

  @JsonKey(name: 'companyDesc')
  String companyDesc;

  @JsonKey(name: 'chineseCharLen')
  int chineseCharLen;

  @JsonKey(name: 'language')
  String language;

  @JsonKey(name: 'sessionID')
  String sessionID;

  @JsonKey(name: 'favoriteMenu')
  List<dynamic> favoriteMenu;

  @JsonKey(name: 'userID')
  int userID;

  @JsonKey(name: 'companyID')
  int companyID;

  @JsonKey(name: 'loginTime')
  int loginTime;

  @JsonKey(name: 'loginName')
  String loginName;

  @JsonKey(name: 'client')
  String client;

  @JsonKey(name: 'isTenent')
  bool isTenent;

  @JsonKey(name: 'recent')
  List<Recent> recent;

  @JsonKey(name: 'companyCode')
  String companyCode;

  @JsonKey(name: 'menuList')
  List<MenuList> menuList;

  @JsonKey(name: 'showAuthButton')
  bool showAuthButton;

  @JsonKey(name: 'wflInfo')
  List<WflInfo> wflInfo;

  @JsonKey(name: 'companyType')
  String companyType;

  @JsonKey(name: 'Menu_Content')
  String menuContent;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'moduleMap')
  ModuleMap moduleMap;

  @JsonKey(name: 'system')
  System system;

  @JsonKey(name: 'addUrlMap')
  AddUrlMap addUrlMap;

  @JsonKey(name: 'backendVersion')
  String backendVersion;

  QMUser(this.msg,this.companyDesc,this.chineseCharLen,this.language,this.sessionID,this.favoriteMenu,this.userID,this.companyID,this.loginTime,this.loginName,this.client,this.isTenent,this.recent,this.companyCode,this.menuList,this.showAuthButton,this.wflInfo,this.companyType,this.menuContent,this.userName,this.moduleMap,this.system,this.addUrlMap,this.backendVersion,);

  factory QMUser.fromJson(Map<String, dynamic> srcJson) => _$QMUserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$QMUserToJson(this);

}

  
@JsonSerializable()
  class Msg extends Object {

  @JsonKey(name: 'address')
  String address;

  @JsonKey(name: 'appid')
  String appid;

  @JsonKey(name: 'token')
  String token;

  Msg(this.address,this.appid,this.token,);

  factory Msg.fromJson(Map<String, dynamic> srcJson) => _$MsgFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MsgToJson(this);

}

  
@JsonSerializable()
  class Recent extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'forShort')
  String forShort;

  @JsonKey(name: 'BizTranPath')
  String bizTranPath;

  @JsonKey(name: 'module')
  String module;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'hasChild')
  bool hasChild;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'submodule')
  String submodule;

  @JsonKey(name: 'childList')
  List<dynamic> childList;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'openType')
  String openType;

  Recent(this.code,this.forShort,this.bizTranPath,this.module,this.origin,this.hasChild,this.name,this.icon,this.submodule,this.childList,this.url,this.openType,);

  factory Recent.fromJson(Map<String, dynamic> srcJson) => _$RecentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecentToJson(this);

}

  
@JsonSerializable()
  class MenuList extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'BizTranPath')
  String bizTranPath;

  @JsonKey(name: 'module')
  String module;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'hasChild')
  bool hasChild;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'childList')
  List<dynamic> childList;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'openType')
  String openType;

  MenuList(this.code,this.bizTranPath,this.module,this.origin,this.hasChild,this.name,this.icon,this.childList,this.url,this.openType,);

  factory MenuList.fromJson(Map<String, dynamic> srcJson) => _$MenuListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MenuListToJson(this);

}

  
@JsonSerializable()
  class WflInfo extends Object {

  @JsonKey(name: 'submitButton')
  String submitButton;

  @JsonKey(name: 'wflId')
  String wflId;

  @JsonKey(name: 'menuCode')
  String menuCode;

  @JsonKey(name: 'page')
  String page;

  @JsonKey(name: 'params')
  List<String> params;

  WflInfo(this.submitButton,this.wflId,this.menuCode,this.page,this.params,);

  factory WflInfo.fromJson(Map<String, dynamic> srcJson) => _$WflInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WflInfoToJson(this);

}

  
@JsonSerializable()
  class ModuleMap extends Object {

  @JsonKey(name: 'SRE')
  String sRE;

  @JsonKey(name: 'FBR')
  String fBR;

  @JsonKey(name: 'IDE')
  String iDE;

  @JsonKey(name: 'SYS')
  String sYS;

  @JsonKey(name: 'TMW')
  String tMW;

  ModuleMap(this.sRE,this.fBR,this.iDE,this.sYS,this.tMW,);

  factory ModuleMap.fromJson(Map<String, dynamic> srcJson) => _$ModuleMapFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModuleMapToJson(this);

}

  
@JsonSerializable()
  class System extends Object {

  @JsonKey(name: 'full_name')
  String fullName;

  @JsonKey(name: 'system_id')
  String systemId;

  @JsonKey(name: 'system_version')
  String systemVersion;

  @JsonKey(name: 'appID')
  String appID;

  @JsonKey(name: 'system_code')
  String systemCode;

  @JsonKey(name: 'short_name')
  String shortName;

  @JsonKey(name: 'project_name')
  String projectName;

  @JsonKey(name: 'environment_info')
  String environmentInfo;

  System(this.fullName,this.systemId,this.systemVersion,this.appID,this.systemCode,this.shortName,this.projectName,this.environmentInfo,);

  factory System.fromJson(Map<String, dynamic> srcJson) => _$SystemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SystemToJson(this);

}

  
@JsonSerializable()
  class AddUrlMap extends Object {

  AddUrlMap();

  factory AddUrlMap.fromJson(Map<String, dynamic> srcJson) => _$AddUrlMapFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AddUrlMapToJson(this);

}

  
