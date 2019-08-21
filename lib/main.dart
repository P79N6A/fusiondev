import 'package:flutter/material.dart';
import 'package:fusion_dev/config/main.config.dart';

import 'package:fusion_dev/index.dart';
import 'package:fusion_dev/pages/demopg01.dart';
import 'package:fusion_dev/src/template/login/login.dart';
import 'package:fusion_dev/src/template/login/userInfo.dart';

import 'views/home_page.dart';


void main() => {

 QMApp.init(MainConfig()),
  runApp(MyApp())
};

class MyApp extends StatelessWidget{

_login(BuildContext context,UserInfo user) async{
         await QMAuth.login(name: user.userName,pass: user.password).then((onValue){
          Navigator.push(context,
            new MaterialPageRoute(builder: (context) => Home()),
          );
         }).catchError((onError){
           Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => Home()),
          );
         });
    }

    Future gotoLogin(BuildContext context) async {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => QMLogin(callback: _login,)),
      );
    }

    _gotoMainPG(BuildContext context) async {
      await gotoLogin(context);
    }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fusion 3.0.0 移动框架 示例',
      debugShowCheckedModeBanner: true,
//      theme: QMApp.theme,
      home:
      // Text('test is ok')
      //new DemoPage()
      // new DemoPage()
         new QMSplashScreen(
       appName: '一汽轿车驾驶舱',
       description: '       整合业务数据 \n 体现一汽轿车运营状态',
       callback: _gotoMainPG,
     ),
    );
  }

}


