

import 'package:flutter/material.dart';
import 'package:fusion_dev/index.dart';
import '../../components/widget_item_container.dart';

class QMGrid {
  
  static Widget getWidget(QMGridCfg config) {
    List<QMRouterItem> widgetPoints = [];
    WidgetItemContainer wiContaienr = WidgetItemContainer(
      columnCount: config.columnCount ?? 3,
      categories: config.items,
      isWidgetPoint:false,
      onTap: config.onTap,
    );
    if (widgetPoints.length > 0) {
      wiContaienr = WidgetItemContainer(
        categories: widgetPoints,
        columnCount:  config.columnCount ?? 3,
        isWidgetPoint:true,
        onTap: config.onTap,
      );
    }
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/paimaiLogo.png'),
            alignment: Alignment.bottomRight),
      ),
      child: wiContaienr,
    );
  }
}

class QMGridCfg{
  final List<dynamic> items;
  final int columnCount;
  final Function(BuildContext, dynamic) onTap;
  QMGridCfg({this.items,this.columnCount,this.onTap});
}