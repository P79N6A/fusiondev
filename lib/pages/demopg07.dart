import 'package:flutter/material.dart';

import 'package:fusion_dev/index.dart';


class Launcher extends QMStatelessWidget{ 


    _gotoMainPG(BuildContext context) async {
      QMApp.router.navigateTo(context, 'home');
    }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fusion 3.0.0 移动框架 示例',
      debugShowCheckedModeBanner: true,
      theme: QMApp.theme,
      home: //new DemoPage()
      // new DemoPage()
          new QMSplashScreen(
        appName: '一汽轿车驾驶舱',
        description: '       整合业务数据 \n 体现一汽轿车运营状态',
        callback: _gotoMainPG,
      ),
    );
  }

}


