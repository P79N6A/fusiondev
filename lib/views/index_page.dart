

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fusion_dev/src/components/grid/griditem.dart';
import 'package:fusion_dev/index.dart';
class IndexPage extends StatefulWidget implements QMTab{
  @override
  IndexPageState createState() => new IndexPageState();
}

class IndexPageState extends State<IndexPage>{

  onTap(BuildContext context,dynamic item){
    if(item.routerName == 'web'){
      String docUrl = 'https://www.baidu.com';// 'https://github.com/wo2888/fusionapp.git';
      String title = '百度';
      QMApp.openWeb(context, title, docUrl);
    }else if(item.routerName == 'launch'){
      String url = 'tel:13341587581';
      QMApp.openLaunch(url);
    }else{
      QMApp.router.navigateTo(context, item.routerName, transition: TransitionType.inFromRight);
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('功能'),
      ),
      body:
      
        new Container(
        child:
        QMGrid.getWidget(
          QMGridCfg(
            columnCount: 4,
            items: [
                  QMItem(name: '主页',routerName: 'home'),
                  QMItem(name: '个人中心',routerName: 'DemoPersonPage'),
                  QMItem(name: '欢迎页',routerName: 'launch',icon: Icon(Icons.launch)),
                  QMItem(name: '网页模板',routerName: 'web',icon: Icon(Icons.open_in_browser)),

                  QMItem(name: 'Demo1',routerName: 'demo1'),
                  QMItem(name: 'Demo2',routerName: 'demo2'),
                  QMItem(name: 'Demo3',routerName: 'demo3',icon: Icon(Icons.launch)),
                  QMItem(name: 'Demo4',routerName: 'demo4',icon: Icon(Icons.open_in_browser)),
                  QMItem(name: '审批',routerName: 'approve',icon: Icon(Icons.access_alarms)),
                  QMItem(name: 'launch',routerName: 'launch',icon: Icon(Icons.label_outline)),
                  QMItem(name: 'searchHelp',routerName: 'searchHelp',icon: Icon(Icons.search)),
                ],
                onTap:onTap))
    )
    );
  }

}