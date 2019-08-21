

import 'package:flutter/material.dart';
import '../../index.dart';

class QMTheme {

  static ThemeData curTheme;

  static get theme{
    if(QMTheme.curTheme == null){
      QMTheme.curTheme = new ThemeData(
        primaryColor: QMApp.primary,
        backgroundColor: QMApp.primary,
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: QMApp.primary,
          size: 35.0,
        ),
      );
    }
    return QMTheme.curTheme;
  }
}

