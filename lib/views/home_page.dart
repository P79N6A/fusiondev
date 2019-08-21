



import 'package:flutter/material.dart';
import 'package:fusion_dev/index.dart';
import 'package:fusion_dev/pages/tmw03.dart';

import 'package:fusion_dev/views/contacts_page.dart';
import 'package:fusion_dev/views/index_page.dart';
import 'package:fusion_dev/views/message_page.dart';
import 'package:fusion_dev/views/person_page.dart';

class Home extends QMHome{
  @override
  List<QMTab> get tabs =>  [
    new MessagePage(),
    new IndexPage(),
    new TMWPage03(),//ContactsPage(),
    new PersonPage()
  ];

  @override
  List<QMTabItem> get items => [
    QMTabItem(iconData: Icons.pie_chart, title: "概览"),
    QMTabItem(iconData: Icons.apps, title: "功能"),
    QMTabItem(iconData: Icons.import_contacts, title: "联系人"),
    QMTabItem(iconData: Icons.person, title: "我")
  ];

}