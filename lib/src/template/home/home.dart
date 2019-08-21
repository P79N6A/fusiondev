

import 'package:flutter/material.dart';
import '../../config/index.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

abstract class QMHome extends StatefulWidget{

  // List<Widget> pages ;

  // List<Widget> titles;

  List<QMTab> get tabs;
  List<QMTabItem> get items;

  const QMHome({Key key}) : super(key: key);
  @override
  _QMHomeState createState() => new _QMHomeState();

}

class _QMHomeState extends State<QMHome> with SingleTickerProviderStateMixin{
  int currentPage = 0;
  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(vsync: this, length:4);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {


    return new Scaffold(
    
      body: 
      // Container(
      //   child: Center(
      //     child: widget.tabs[currentPage],
      //   ),
      // ),
      
      new TabBarView(
        controller:controller,
        children: widget.tabs,
        
      ),
      
      bottomNavigationBar: FancyBottomNavigation(
          tabs: widget.items,
    //     [
    //     QMTabItem(iconData: Icons.home, title: "Home"),
    //     QMTabItem(iconData: Icons.search, title: "Search"),
    //     QMTabItem(iconData: Icons.shopping_cart, title: "Basket")
    // ],
    onTabChangedListener: (position) {
        setState(() {
        // currentPage = position;
        controller.index = position;
        });
    },
)
      
      // new Material(
      //   color: Colors.white70,//.primaries[5],
      //   child: new TabBar(
      //     controller: controller,
      //     labelColor: Colors.grey,
      //     labelStyle: TextStyle(color: QMApp.primary),
      //       // preferredSize: const Size.fromHeight(48.0),
      //     tabs: widget.items,
      //   ),
      // ),
    );
  }
}

abstract class QMTab extends Widget {


  QMTab(Widget wdg){
  }
  // String path;

  // Widget page; 

  // Tab item;


  /// 获取tab标签的名称和图标，例如
  /// Widget getItem() {
  ///  return new Tab(text: '个人中心',icon: new Icon(Icons.person));
  /// }
  // Widget getItem();

  // QMPageItem({this.page, this.item});
}

class QMTabItem extends TabData{
  
QMTabItem({@required this.iconData, @required this.title, this.onclick}):super(iconData: iconData,title: title, onclick:onclick);

  IconData iconData;
  String title;
  Function onclick;
  final UniqueKey key = UniqueKey();

  // const Tab({
    // Key key,
    // this.text,
    // this.icon,
    // this.child,
  // })
}

