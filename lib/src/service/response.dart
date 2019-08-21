import 'package:json_annotation/json_annotation.dart'; 
  
part 'response.g.dart';


@JsonSerializable()
  class QMRsp extends Object {

  @JsonKey(name: 'result')
  QMResult result;

  @JsonKey(name: 'exMessage')
  String exMessage;

  @JsonKey(name: 'resultState')
  dynamic resultState;

  @JsonKey(name: 'upTime')
  int upTime;

  @JsonKey(name: 'downTime')
  int downTime;

  @JsonKey(name: 'serviceDistribute')
  String serviceDistribute;

  dynamic getData(){
    if(result ==null || result.resultObj == null){return {};}
    return result.resultObj;
  }

  QMRsp(this.result,this.exMessage,this.resultState,this.upTime,this.downTime,this.serviceDistribute,);

  factory QMRsp.fromJson(Map<String, dynamic> srcJson) => _$QMRspFromJson(srcJson);

  Map<String, dynamic> toJson() => _$QMRspToJson(this);

}

  
@JsonSerializable()
  class QMResult extends Object {

  @JsonKey(name: 'errorField')
  String errorField;

  @JsonKey(name: 'rowIndex')
  int rowIndex;

  @JsonKey(name: 'resultObj')
  dynamic resultObj;

  QMResult(this.errorField,this.rowIndex,this.resultObj,);

  factory QMResult.fromJson(Map<String, dynamic> srcJson) => _$QMResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$QMResultToJson(this);

}

  



// @JsonSerializable()
//   class QMRsp<T> extends Object {

//   @JsonKey(name: 'result')
//   Result result;

//   @JsonKey(name: 'exMessage')
//   String exMessage;

//   @JsonKey(name: 'resultState')
//   int resultState;

//   @JsonKey(name: 'upTime')
//   int upTime;

//   @JsonKey(name: 'downTime')
//   int downTime;

//   @JsonKey(name: 'serviceDistribute')
//   String serviceDistribute;

//   QMRsp(this.result,this.exMessage,this.resultState,this.upTime,this.downTime,this.serviceDistribute,);

//   factory QMRsp.fromJson(Map<String, dynamic> srcJson) => _$QMRspFromJson(srcJson);

//   Map<String, dynamic> toJson() => _$QMRspToJson(this);

// }

  
// @JsonSerializable()
//   class Result extends Object {

//   @JsonKey(name: 'errorField')
//   String errorField;

//   @JsonKey(name: 'rowIndex')
//   int rowIndex;

//   @JsonKey(name: 'resultObj')
//   Map<String, dynamic> resultObj;

//   Result(this.errorField,this.rowIndex,this.resultObj,);

//   factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

//   Map<String, dynamic> toJson() => _$ResultToJson(this);

// }

  