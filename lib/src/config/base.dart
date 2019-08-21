
import 'package:flutter/material.dart';

import 'dart:async';



import 'package:fusion_dev/src/utils/sql.dart';

mixin QMBaseConfig{


// 请求地址
String get baseURL;


bool get isDebug;


int themeColor = 0xFF28a5e3;

// Widget get home;

List get routers;

//   static QMBaseConfig config;

//   QMBaseConfig(){
//     if(config == null){
//     QMBaseConfig.config = new QMBaseConfig();
//   }
//     print('QMBaseConfig<<<<<');
//   }

// // 请求地址
// @protected
// @mustCallSuper
// String baseURL = "fusion url";

// QMBaseConfig(){
//   print('constructor:');
// }

// @protected
// @mustCallSuper

// // 请求地址
// String baseURL = "fusion url";

//  // 工厂模式
//   factory QMBaseConfig() =>_getInstance();
//   static QMBaseConfig get instance => _getInstance();
//   static QMBaseConfig _instance;
//   QMBaseConfig._internal() {
//     // 初始化
//   }
//   static QMBaseConfig _getInstance() {
//     print('test is ok');
//     if (_instance == null) {
//       _instance = new QMBaseConfig._internal();
//     }
//     return _instance;
//   }

}



mixin QMBase{

static QMRouterItem getRouter(BuildContext context){}

}


abstract class WidgetInterface {
  int get id;

  //组件英文名
  String get name;

  //组件中文名
  String get cnName;

  //组件截图
  String get image;

  //组件markdown 文档
  String get doc;

  //类目 id
  int get catId;
}

class QMRouterItem implements WidgetInterface {
  int id;

  //组件英文名
  String name;

  //组件中文名
  String cnName;

  //组件截图
  String image;

  // 路由地址
  String routerName;

  //组件markdown 文档
  String doc;

  //组件 demo ，多个以 , 分割
  String demo;

  //类目 id
  int catId;
  final WidgetBuilder buildRouter;

  QMRouterItem(
      {this.id,
      this.name,
      this.cnName,
      this.image,
      this.doc,
      this.catId,
      this.routerName,
      this.buildRouter});

  QMRouterItem.fromJSON(Map json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        cnName = json['cnName'],
        routerName = json['routerName'],
        doc = json['doc'],
        catId = json['catId'],
        buildRouter = json['buildRouter'];

  String toString() {
    return '(QMRouterItem $name)';
  }

  Object toMap() {
    return {
      'id': id,
      'name': name,
      'cnName': cnName,
      'image': image,
      'doc': doc,
      'catId': catId
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

class WidgetControlModel {
  final String table = 'widget';
  Sql sql;

  WidgetControlModel() {
    sql = Sql.setTable(table);
  }

  // 获取Widget不同条件的列表
  Future<List<QMRouterItem>> getList(QMRouterItem widgetPoint) async {
    List listJson =
        await sql.getByCondition(conditions: widgetPoint.toSqlCondition());
    List<QMRouterItem> widgets = listJson.map((json) {
      return new QMRouterItem.fromJSON(json);
    }).toList();
    // print("widgets $widgets");
    return widgets;
  }

  // 通过name获取Cat对象信息
  Future<QMRouterItem> getCatByName(String name) async {
    List json = await sql.getByCondition(conditions: {'name': name});
    if (json.isEmpty) {
      return null;
    }
    return new QMRouterItem.fromJSON(json.first);
  }
  Future<List<QMRouterItem>> search(String name) async {
    List json = await sql.search(conditions: {'name': name});

    if (json.isEmpty) {
      return [];
    }

    List<QMRouterItem> widgets = json.map((json) {
      return new QMRouterItem.fromJSON(json);
    }).toList();

    return widgets;
  }
}
