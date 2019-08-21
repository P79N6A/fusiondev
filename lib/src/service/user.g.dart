// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QMUser _$QMUserFromJson(Map<String, dynamic> json) {
  return QMUser(
      json['msg'] == null
          ? null
          : Msg.fromJson(json['msg'] as Map<String, dynamic>),
      json['companyDesc'] as String,
      json['chineseCharLen'] as int,
      json['language'] as String,
      json['sessionID'] as String,
      json['favoriteMenu'] as List,
      json['userID'] as int,
      json['companyID'] as int,
      json['loginTime'] as int,
      json['loginName'] as String,
      json['client'] as String,
      json['isTenent'] as bool,
      (json['recent'] as List)
          ?.map((e) =>
              e == null ? null : Recent.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['companyCode'] as String,
      (json['menuList'] as List)
          ?.map((e) =>
              e == null ? null : MenuList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['showAuthButton'] as bool,
      (json['wflInfo'] as List)
          ?.map((e) =>
              e == null ? null : WflInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['companyType'] as String,
      json['Menu_Content'] as String,
      json['userName'] as String,
      json['moduleMap'] == null
          ? null
          : ModuleMap.fromJson(json['moduleMap'] as Map<String, dynamic>),
      json['system'] == null
          ? null
          : System.fromJson(json['system'] as Map<String, dynamic>),
      json['addUrlMap'] == null
          ? null
          : AddUrlMap.fromJson(json['addUrlMap'] as Map<String, dynamic>),
      json['backendVersion'] as String);
}

Map<String, dynamic> _$QMUserToJson(QMUser instance) => <String, dynamic>{
      'msg': instance.msg,
      'companyDesc': instance.companyDesc,
      'chineseCharLen': instance.chineseCharLen,
      'language': instance.language,
      'sessionID': instance.sessionID,
      'favoriteMenu': instance.favoriteMenu,
      'userID': instance.userID,
      'companyID': instance.companyID,
      'loginTime': instance.loginTime,
      'loginName': instance.loginName,
      'client': instance.client,
      'isTenent': instance.isTenent,
      'recent': instance.recent,
      'companyCode': instance.companyCode,
      'menuList': instance.menuList,
      'showAuthButton': instance.showAuthButton,
      'wflInfo': instance.wflInfo,
      'companyType': instance.companyType,
      'Menu_Content': instance.menuContent,
      'userName': instance.userName,
      'moduleMap': instance.moduleMap,
      'system': instance.system,
      'addUrlMap': instance.addUrlMap,
      'backendVersion': instance.backendVersion
    };

Msg _$MsgFromJson(Map<String, dynamic> json) {
  return Msg(json['address'] as String, json['appid'] as String,
      json['token'] as String);
}

Map<String, dynamic> _$MsgToJson(Msg instance) => <String, dynamic>{
      'address': instance.address,
      'appid': instance.appid,
      'token': instance.token
    };

Recent _$RecentFromJson(Map<String, dynamic> json) {
  return Recent(
      json['code'] as String,
      json['forShort'] as String,
      json['BizTranPath'] as String,
      json['module'] as String,
      json['origin'] as String,
      json['hasChild'] as bool,
      json['name'] as String,
      json['icon'] as String,
      json['submodule'] as String,
      json['childList'] as List,
      json['url'] as String,
      json['openType'] as String);
}

Map<String, dynamic> _$RecentToJson(Recent instance) => <String, dynamic>{
      'code': instance.code,
      'forShort': instance.forShort,
      'BizTranPath': instance.bizTranPath,
      'module': instance.module,
      'origin': instance.origin,
      'hasChild': instance.hasChild,
      'name': instance.name,
      'icon': instance.icon,
      'submodule': instance.submodule,
      'childList': instance.childList,
      'url': instance.url,
      'openType': instance.openType
    };

MenuList _$MenuListFromJson(Map<String, dynamic> json) {
  return MenuList(
      json['code'] as String,
      json['BizTranPath'] as String,
      json['module'] as String,
      json['origin'] as String,
      json['hasChild'] as bool,
      json['name'] as String,
      json['icon'] as String,
      json['childList'] as List,
      json['url'] as String,
      json['openType'] as String);
}

Map<String, dynamic> _$MenuListToJson(MenuList instance) => <String, dynamic>{
      'code': instance.code,
      'BizTranPath': instance.bizTranPath,
      'module': instance.module,
      'origin': instance.origin,
      'hasChild': instance.hasChild,
      'name': instance.name,
      'icon': instance.icon,
      'childList': instance.childList,
      'url': instance.url,
      'openType': instance.openType
    };

WflInfo _$WflInfoFromJson(Map<String, dynamic> json) {
  return WflInfo(
      json['submitButton'] as String,
      json['wflId'] as String,
      json['menuCode'] as String,
      json['page'] as String,
      (json['params'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$WflInfoToJson(WflInfo instance) => <String, dynamic>{
      'submitButton': instance.submitButton,
      'wflId': instance.wflId,
      'menuCode': instance.menuCode,
      'page': instance.page,
      'params': instance.params
    };

ModuleMap _$ModuleMapFromJson(Map<String, dynamic> json) {
  return ModuleMap(json['SRE'] as String, json['FBR'] as String,
      json['IDE'] as String, json['SYS'] as String, json['TMW'] as String);
}

Map<String, dynamic> _$ModuleMapToJson(ModuleMap instance) => <String, dynamic>{
      'SRE': instance.sRE,
      'FBR': instance.fBR,
      'IDE': instance.iDE,
      'SYS': instance.sYS,
      'TMW': instance.tMW
    };

System _$SystemFromJson(Map<String, dynamic> json) {
  return System(
      json['full_name'] as String,
      json['system_id'] as String,
      json['system_version'] as String,
      json['appID'] as String,
      json['system_code'] as String,
      json['short_name'] as String,
      json['project_name'] as String,
      json['environment_info'] as String);
}

Map<String, dynamic> _$SystemToJson(System instance) => <String, dynamic>{
      'full_name': instance.fullName,
      'system_id': instance.systemId,
      'system_version': instance.systemVersion,
      'appID': instance.appID,
      'system_code': instance.systemCode,
      'short_name': instance.shortName,
      'project_name': instance.projectName,
      'environment_info': instance.environmentInfo
    };

AddUrlMap _$AddUrlMapFromJson(Map<String, dynamic> json) {
  return AddUrlMap();
}

Map<String, dynamic> _$AddUrlMapToJson(AddUrlMap instance) =>
    <String, dynamic>{};
