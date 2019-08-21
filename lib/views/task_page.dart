

import 'package:flutter/material.dart';
import 'package:fusion_dev/index.dart';


class QMTaskPage extends StatefulWidget implements QMBase {
  @override
  QMTaskPageState createState() => new QMTaskPageState();

}




class QMTaskPageState extends State<QMTaskPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('demo1'),
          onPressed: () {
            Navigator.of(context).pushNamed('demo1');
          },
        ),
      ),
    );
  }
}

// class QMTaskPage extends StatefulWidget implements QMBase{



//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Home'),
//       ),
//       body: new Center(
//         child: new RaisedButton(
//           child: new Text('demo1'),
//           onPressed: () {
//             Navigator.of(context).pushNamed('demo1');
//           },
//         ),
//       ),
//     );
//   }

//   static QMRouterItem router(BuildContext context) {
//     return QMRouterItem(
//       name: '任务管理',
//       routerName: '/task_page',
//       buildRouter: (BuildContext context)=>QMTaskPage()
//       );
//   }

//   // @override
//   // QMRouterItem getRouter(BuildContext context) {
//   //   return QMRouterItem(
//   //     name: '任务管理',
//   //     routerName: '/task_page',
//   //     buildRouter: (BuildContext context)=>QMTaskPage()
//   //     );
//   // }


// }