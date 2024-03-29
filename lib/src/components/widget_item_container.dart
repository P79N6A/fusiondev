import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './widget_item.dart';
import '../config/index.dart';
// import '../routers/application.dart';
// import '../widgets/index.dart';

class WidgetItemContainer extends StatelessWidget {
  final int columnCount; //一行几个
  final List<dynamic> categories;
  final bool isWidgetPoint;

  final Function(BuildContext,dynamic) onTap;

  // 所有的可用demos;
  final List widgetDemosList = [];//new WidgetDemoList().getDemos();

  WidgetItemContainer(
      {Key key,
      @required this.categories,
      @required this.columnCount,
      @required this.isWidgetPoint,
      this.onTap})
      : super(key: key);

  List<Widget> _buildColumns(context) {
    List<Widget> _listWidget = [];
    List<Widget> _listRows = [];
    int addI;
    for (int i = 0, length = categories.length; i < length; i += columnCount) {
      _listRows = [];
      for (int innerI = 0; innerI < columnCount; innerI++) {
        addI = innerI + i;
        if (addI < length) {
          dynamic item = categories[addI];
          _listRows.add(
            Expanded(
              flex: 1,
              child: WidgetItem(
                icon: item.icon,
                title: item.name,
                onTap: () {
                  if(onTap!=null){
                    onTap(context,item);
                  }else{
                    // if (isWidgetPoint) {
                    // String targetName = item.name;
                    String targetRouter = '/category/error/404';
                    targetRouter = item.routerName;
                    // widgetDemosList.forEach((item) {
                    //   if (item.name == targetName) {
                    //     targetRouter = item.routerName;
                    //   }
                    // });
                    QMApp.router.navigateTo(context, "$targetRouter", transition: TransitionType.inFromRight);
                  // } else {
                  //   QMApp.router
                  //       .navigateTo(context, "/category/${item.name}", transition: TransitionType.inFromRight);
                  // }
                  }
                  
                },
                index: addI,
                totalCount: length,
                rowLength: columnCount,
                textSize: isWidgetPoint ? 'middle' : 'small',
              ),
            ),
          );
        } else {
          _listRows.add(
            Expanded(
              flex: 1,
              child: Container(),
            ),
          );
        }
      }
      _listWidget.add(
        Row(
          children: _listRows,
        ),
      );
    }
    return _listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildColumns(context),
    );
  }
}
