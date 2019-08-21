// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QMReq _$QMReqFromJson(Map<String, dynamic> json) {
  return QMReq(
      json['serviceName'] as String,
      json['methodName'] as String,
      json['client'] as String,
      json['userName'] as String,
      json['tran'] as String,
      json['language'] as String,
      json['sessionID'] as String,
      json['loginTime'] as int,
      json['backendVersion'] as String,
      json['actionID'] as String,
      json['guid'] as String,
      json['paraValues']);
}

Map<String, dynamic> _$QMReqToJson(QMReq instance) => <String, dynamic>{
      'serviceName': instance.serviceName,
      'methodName': instance.methodName,
      'client': instance.client,
      'userName': instance.userName,
      'tran': instance.tran,
      'language': instance.language,
      'sessionID': instance.sessionID,
      'loginTime': instance.loginTime,
      'backendVersion': instance.backendVersion,
      'actionID': instance.actionID,
      'guid': instance.guid,
      'paraValues': instance.paraValues
    };
