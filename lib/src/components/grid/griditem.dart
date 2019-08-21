
import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/sql.dart';

abstract class QMItemInterface{
    int get id;
    //类目名称
    String get name;
    //描述
    String get desc;
    //第几级类目，默认 1
    int get depth;
    //父类目id，没有为 0
    int get parentId;

    String get routerName;
}

class QMItem implements QMItemInterface {
  int id;
  Icon icon;
  String name;
  String desc;
  int depth;
  int parentId;
  String routerName;

  QMItem({this.id, this.icon, this.name, this.desc, this.depth, this.parentId, this.routerName});

  QMItem.fromJSON(Map json)
      : id = json['id'],
        name = json['name'],
        desc = json['desc'],
        depth = json['depth'],
        parentId = json['parentId'],
        routerName = json['routerName'],
        icon = json['icon'];

  String toString() {
    return '(QMItem $name)';
  }

  Map toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'depth': depth,
      'parentId': parentId,
      'routerName': routerName,
      'icon': icon
    };
  }
  Map toSqlCondition() {
    Map _map = this.toMap();
    Map condition = {};
    _map.forEach((k, value) {

      if (value != null) {

        condition[k] = value;
      }
    });

    if (condition.isEmpty) {
      return {};
    }

    return condition;
  }
}


class CatControlModel{
  final String table = 'QMItem';
  Sql sql;
  CatControlModel() {
    sql = Sql.setTable(table);
  }

  /// 获取一级类目
  Future<List> mainList() async{
    List listJson =  await sql.getByCondition(conditions: {'parentId': 0});
    List<QMItem> cats = listJson.map((json) {
        return new QMItem.fromJSON(json);
    }).toList();
    return cats;
  }

  // 获取Cat不同深度与parent的列表
  Future<List<QMItem>> getList([QMItem item]) async{


    if (item == null) {
      item = new QMItem(depth: 1, parentId: 0);
    }
    // print("QMItem in getList ${QMItem.toMap()}");
    List listJson =  await sql.getByCondition(conditions: item.toSqlCondition());
    List<QMItem> cats = listJson.map((json) {
      return new QMItem.fromJSON(json);
    }).toList();
    return cats;
  }

  // 通过name获取Cat对象信息
  Future<QMItem> getCatByName(String name) async {
    List json = await sql.getByCondition(conditions: {'name': name});
    if (json.isEmpty) {
      return null;
    }
    return new QMItem.fromJSON(json.first);
  }

}
