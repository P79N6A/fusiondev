import 'package:flutter/material.dart';
import '../pages/demo1.dart';
import '../pages/demo0.dart';

class DemoPage extends StatefulWidget {
  @override
  DemoPageState createState() => new DemoPageState();
}

class DemoPageState extends State<DemoPage> {
  // String url =
  //     "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=495625508,"
  //     "3408544765&fm=27&gp=0.jpg";
  // Widget getItemWidget() {
  //   //BoxFit 可设置展示图片时 的填充方式
  //   return new Image(image: new NetworkImage(url), fit: BoxFit.cover);
  // }

  // Widget refreshPie(){
  //   return DatumLegendWithMeasures.withRandomData();
  // }

  void _handleButtonPress() {
    setState(() {});
  }

  List<Widget> buildGridTileList(int number) {
    List<Widget> widgetList = new List();
    widgetList.add(SimpleSeriesLegend.withRandomData());
    widgetList.add(DatumLegendWithMeasures.withRandomData());
    // for (int i = 0; i < number; i++) {
    //   widgetList.add(SimpleBarChart.withSampleData());//getItemWidget());
    // }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('营业收入'),
        ),
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
                        padding: const EdgeInsets.all(35.0),
                        mainAxisSpacing: 8.0, //竖向间距
                        crossAxisCount: 1, //横向Item的个数
                        crossAxisSpacing: 8.0, //横向间距
                        children: buildGridTileList(4)),

                    //     new GridView.builder(
                    //   gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                    //     //SliverGridDelegateWithFixedCrossAxisCount可以直接指定每行（列）显示多少个Item   SliverGridDelegateWithMaxCrossAxisExtent会根据GridView的宽度和你设置的每个的宽度来自动计算没行显示多少个Item
                    //     // crossAxisCount: 2,
                    //     crossAxisSpacing: 10.0,
                    //     mainAxisSpacing: 10.0,
                    //     maxCrossAxisExtent: 100.0,
                    //   ),
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return SimpleBarChart.withSampleData();
                    //   },
                    //   itemCount: 8,
                    // )
                    // new Stack(fit: StackFit.loose, children: <Widget>[
                    //   new Container(
                    //     height: 170,
                    //     child: SimpleBarChart.withSampleData(),
                    //   ),
                    // ]),
                  )
                ],
              ),
            )
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.refresh), onPressed: _handleButtonPress),
      );
  }
}
