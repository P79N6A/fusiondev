import 'package:flutter/material.dart';
import 'package:fusion_dev/index.dart';
import 'package:fusion_dev/pages/tmw00.dart';
// import 'package:fusion_dev/pages/demo0.dart';
import 'package:fusion_dev/pages/tmw01.dart';
import 'package:fusion_dev/service/service.dart';

// import 'package:fusion_dev/template/person/person.dart';

class MessagePage extends StatefulWidget implements QMTab {
  @override
  MessagePageState createState() => new MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  Map<String, dynamic> overview = new Map<String, dynamic>();
  Map<String, dynamic> warning = new  Map<String, dynamic>();
  int totalCount = 0;

  @override
  initState() {
    loadOverview();
    loadTaskWarning();
  }

  loadOverview() {
    Future<QMRsp> rsp = TMWService.loadTaskOverview();
    rsp.then((onValue) {
      setState(() {
        overview = onValue.getData();
        if (overview['TaskSum'] != null) {
          totalCount = int.parse(overview['TaskSum']);
        } else {
          totalCount = 0;
        }
      });
    });
  }
  loadTaskWarning(){
    Future<QMRsp> rsp = TMWService.loadTaskWarning();
    rsp.then((onValue){
      setState(() {
        warning = onValue.getData();
      });
    });
  }




List<Widget> buildGridTileList(int number) {
      List<Widget> widgetList = new List();
      widgetList.add(TMWPage00.withTMWData(overview));
      
      widgetList.add(TMWPage01.withTMWidget(warning));
      return widgetList;
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(color: Colors.white70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[ 
                  Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5)),
                  new Expanded(
                    child: new GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20.0),
                        mainAxisSpacing: 8.0, //竖向间距
                        crossAxisCount: 1, //横向Item的个数
                        crossAxisSpacing: 8.0, //横向间距
                        children: buildGridTileList(4)),

                   
                  )
                ],
              ),
            )
          ],
        ),
    );
  }

}


