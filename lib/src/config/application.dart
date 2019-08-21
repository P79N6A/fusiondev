

import 'package:flutter/material.dart';
import 'package:fusion_dev/index.dart';
import 'package:fusion_dev/src/model/search_history.dart';
import 'package:fusion_dev/src/utils/provider.dart';
import 'package:fusion_dev/src/utils/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../index.dart';
import 'package:fluro/fluro.dart';
SpUtil sp;
var db;

class QMApp {
  static QMBaseConfig config;
  static QMUser user;

  static Router router;

    static Map<String, String> github = {
    'widgetsURL':'https://github.com/wo2888/fusionapp.git',
  };

  static init(config) async{

    setConfig(config as QMBaseConfig);
    final provider = new Provider();
    await provider.init(true);
    sp = await SpUtil.getInstance();
    new SearchHistoryList(sp);
    db = Provider.db;
    router = new Router();
    QMRoutes.configureRoutes(router);
  }

  static setConfig(QMBaseConfig config){
    QMApp.config = config;
  }

  static QMBaseConfig getConfig(){
    if(QMApp.config == null){
      print('ERROR:请先配置QMBaseConfig!');
    }
    return QMApp.config;
  }


  // 设置当前用户
  static setUser(QMUser user){
    QMApp.user = user;
  }

  // 获取用户信息
  static QMUser getUser(){
    return QMApp.user;
  }

  static int getThemeColor(){
    return QMApp.getConfig().themeColor;
  }
  static get primary{
    return Color(getConfig().themeColor);
  }

  // static Color getColor(){
  //   if(QMApp.primary == null){
  //     QMApp.primary = Color(getConfig().bgColor);
  //   }
  //   return QMApp.primary;
  // }


  // 获取URL
  static String getBaseURL(){
    if(QMApp.getConfig().baseURL == null || QMApp.getConfig().baseURL == ''){
      print('ERROR:请先配置基础访问地址baseURL!');
    }
    return QMApp.getConfig().baseURL;
  }

  static openWeb(BuildContext context, String title, String url){
    QMApp.router.navigateTo(context,
              '${QMRoutes.webViewPage}?title=${Uri.encodeComponent(title)}&&url=${Uri.encodeComponent(url)}');
  }
  static openLaunch(String url)async{
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'could not launch $url';
    }
  }
  static get theme{
    return QMTheme.theme;
  }
}