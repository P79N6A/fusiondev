import 'package:flutter/material.dart';
import 'package:fusion_dev/service/service.dart';

import '../components/list.dart';
import 'package:fusion_dev/index.dart';

class TMWPage03 extends StatefulWidget implements QMTab {
  @override
  TMWPage03State createState() => new TMWPage03State();
}

class TMWPage03State extends State<TMWPage03> {
  ScrollController _scrollController = ScrollController(); //listview的控制器
  List tList = new List();
  int pageIndex = 0;
  Future taskList() async {
    Future<QMRsp> rsp = TMWService.taskList(
        pageIndex * 20, (pageIndex + 1) * 20, QMApp.user.userName);
    rsp.then((onValue) {
      setState(() {
        tList.addAll((onValue.getData() as List));
        pageIndex++;
      });
    });
  }

  Image getIcon(state) {
    String val;
    if (state == "10") {
      val = "assets/images/new.png";
    } else if (state == "20") {
      val = "assets/images/dev.png";
    } else if (state == "30") {
      val = "assets/images/over.png";
    } else if (state == "40") {
      val = "assets/images/test.png";
    } else if (state == "50") {
      val = "assets/images/check.png";
    } else if (state == "60") {
      val = "assets/images/ready.png";
    } else if (state == "70") {
      val = "assets/images/release.png";
    } else if (state == "80") {
      val = "assets/images/close.png";
    } else if (state == "90") {
      val = "assets/images/nouse.png";
    } else {
      val = "assets/images/nouse.png";
    }
    return Image.asset(val, width: 50, height: 50);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        taskList();
      }
    });
    taskList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('任务'),
        ),
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
              itemBuilder: _renderRow,
              itemCount: tList.length,
              controller: _scrollController),
        ));
  }

  /**
   * 下拉刷新方法,为list重新赋值
   */
  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
      Future<QMRsp> rsp = TMWService.taskList(
          pageIndex * 20, (pageIndex + 1) * 20, QMApp.user.userName);
      rsp.then((onValue) {
        pageIndex = 0;
        setState(() {
          tList = (onValue.getData() as List);
        });
      });
    });
  }

  /**
   * 抽取item项
   */
  Widget _renderRow(BuildContext context, int index) {
    return new ListTile(
//       显示在title之前
      leading: getIcon(tList[index][9]), //new Icon(icon),
//        显示在title之后
      // trailing: new Icon(icon),
      title: new Text(
        tList[index][8],
        style: TextStyle(fontSize: 17),
      ),
      subtitle: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text('${tList[index][7]} ${tList[index][5]}'),
          new Text('${tList[index][4]}')
        ],
      ),
    );
  }
}
