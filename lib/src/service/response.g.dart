// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QMRsp _$QMRspFromJson(Map<String, dynamic> json) {
  return QMRsp(
      json['result'] == null
          ? null
          : QMResult.fromJson(json['result'] as Map<String, dynamic>),
      json['exMessage'] as String,
      json['resultState'] as dynamic,
      json['upTime'] as int,
      json['downTime'] as int,
      json['serviceDistribute'] as String);
}

Map<String, dynamic> _$QMRspToJson(QMRsp instance) => <String, dynamic>{
      'result': instance.result,
      'exMessage': instance.exMessage,
      'resultState': instance.resultState,
      'upTime': instance.upTime,
      'downTime': instance.downTime,
      'serviceDistribute': instance.serviceDistribute
    };

QMResult _$QMResultFromJson(Map<String, dynamic> json) {
  return QMResult(json['errorField'] as String, json['rowIndex'] as int,
      json['resultObj'] as dynamic);
}

Map<String, dynamic> _$QMResultToJson(QMResult instance) => <String, dynamic>{
      'errorField': instance.errorField,
      'rowIndex': instance.rowIndex,
      'resultObj': instance.resultObj
    };
