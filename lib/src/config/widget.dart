import 'package:flutter/material.dart';
import './index.dart';
import '../../index.dart';

abstract class QMStatelessWidget extends StatelessWidget {
  QMStatelessWidget() {
    QMBaseConfig config = QMApp.getConfig();
    print(' QMStatelessWidget constructor:'+config.baseURL);
    QMLogUtil.init(isDebug:config.isDebug,tag: "_fusion_");
  }
}
