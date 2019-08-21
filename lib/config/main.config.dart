
import 'package:flutter/material.dart';
import 'package:fusion_dev/index.dart';
import 'package:fusion_dev/pages/approve.dart';
import 'package:fusion_dev/pages/demopg01.dart';
import 'package:fusion_dev/pages/demopg02.dart';
import 'package:fusion_dev/pages/demopg03.dart';
import 'package:fusion_dev/pages/demopg04.dart';
import 'package:fusion_dev/pages/demopg05.dart';
import 'package:fusion_dev/pages/demopg06.dart';
import 'package:fusion_dev/pages/demopg07.dart';
import 'package:fusion_dev/src/widget/search_help/searchhelp.dart';
import 'package:fusion_dev/views/home_page.dart';
import 'package:fusion_dev/views/task_page.dart';

class MainConfig with QMBaseConfig {
  @override
  // String get baseURL => 'http://paas.qm.cn/QMERP/RemoteCallManager?fromClient=QMBS&ModuleName=SYS&service=FusionCoreService';
  String get baseURL => 'http://10.133.92.168/QMERP/RemoteCallManager?fromClient=QMBS&ModuleName=TMW';

  @override
  bool get isDebug => true;



  @override
  List get routers => [
      QMRouterItem(
        name: '欢迎页面',
        routerName: '/launch',
        buildRouter: (BuildContext context)=>Launcher()),
      QMRouterItem(
        name: '主页模板',
        routerName: '/home',
        buildRouter: (BuildContext context)=>Home()),
      QMRouterItem(
        name: '个人中心模板',
        routerName: '/DemoPersonPage',
        buildRouter: (BuildContext context)=>DemoPersonPage()),
      QMRouterItem(
        name: '任务管理',
        routerName: '/task_page',
        buildRouter: (BuildContext context)=>QMTaskPage()),
      QMRouterItem(
        name: 'demo1',
        routerName: '/demo1',
        buildRouter: (BuildContext context)=>DemoPage()),
      QMRouterItem(
        name: 'demo2',
        routerName: '/demo2',
        buildRouter: (BuildContext context)=>DemoPage1()),
      QMRouterItem(
        name: 'demo3',
        routerName: '/demo3',
        buildRouter: (BuildContext context)=>DemoPage2()),
      QMRouterItem(
        name: 'demo4',
        routerName: '/demo4',
        buildRouter: (BuildContext context)=>DemoPage3()),
      QMRouterItem(
        name: 'demo5',
        routerName: '/demo5',
        buildRouter: (BuildContext context)=>DemoPage4()),
      QMRouterItem(
        name: 'approve',
        routerName: '/approve',
        buildRouter: (BuildContext context)=>Approve()),
      QMRouterItem(
        name: 'searchHelp',
        routerName: '/searchHelp',
        //项目搜索帮助
        buildRouter: (BuildContext context)=>QMSearchHelp(loginName: QMApp.getUser().loginName,title_refrence: "VProjectName",subtitle_refrence: "VDesc",)),
        //用户搜索帮助
        // buildRouter: (BuildContext context)=>QMSearchHelp(loginName: QMApp.getUser().loginName,title_refrence: "UserName",subtitle_refrence: "Name",)),

      
  ];


  // @override
  // String baseURL = 'http://10.133.92.168/QMERP/RemoteCallManager?fromClient=QMBS&ModuleName=SYS&service=FusionCoreService';

  // @override
  // bool isDebug = false;

  // @override

  // int bgColor = 0xFF28a5e3;
  // int bgColor = 0xFF28a588;
  // int bgColor = 0xFF448AFF;
  // int bgColor = 0xFFFF5252;
  // int themeColor = 0xFFFF5252;
  


}
