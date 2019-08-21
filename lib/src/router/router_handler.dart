import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../template/web/web.dart';
import '../template/home/home.dart';
import '../template/404.dart';


// import 'package:flutter_go/components/category.dart';

import '../components/full_screen_code_dialog.dart';




// app的首页
// var homeHandler = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     return new QMHome();
//   },
// );

// var categoryHandler = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     String name = params["type"]?.first;

//     return new CategoryHome(name);
//   },
// );



var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WidgetNotFound();
});

var fullScreenCodeDialog = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String path = params['filePath']?.first;
  // return new FullScreenCodeDialog(
  //   filePath: path,
  // );
});

var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String title = params['title']?.first;
  String url = params['url']?.first;
  return new WebViewPage(url, title);
});
