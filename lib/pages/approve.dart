import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Approve extends StatefulWidget{
  @override
  ApproveState createState() =>new ApproveState();

}
class ApproveState extends State<Approve>{
  @override
  void initState(){
    super.initState();
    _doShowText(true);
  }
  
  String _textFieldWord = '审批意见';
  List<Widget> _widgetList = new List();
  _doShowText(bool flag){
    _widgetList.clear();
    _widgetList.add(
      new TextField(
        maxLines: 3,
        decoration: InputDecoration(
          labelText: _textFieldWord,
          border: OutlineInputBorder(),
        ),
      )
    );
    if(!flag){
      _widgetList.add(
      new TextField(
        maxLines: 3,
        decoration: InputDecoration(
          labelText: '请再描述一遍驳回意见',
          border: OutlineInputBorder(),
        ),
      )
    );
    }
  }
  //遍历widgetList显示
  Widget _showText(){
    return new Column(
      children: _widgetList,
    );
  }
  Widget _approveDemo(){
    return new Container(
      child: new Column(
        children:[
          new Row(
            children: [
              new PopupMenuButton(
                icon: new Icon(Icons.access_time),
                onSelected: (String value){
                  setState(() {
                    _textFieldWord = value;
                    if(value == '驳回意见'){
                      _doShowText(false);
                    }else{
                      _doShowText(true);
                    }
                  });
                },
                itemBuilder: (BuildContext context)=><PopupMenuItem<String>>[
                  new PopupMenuItem(
                    value:'同意意见',
                    child: new Text('同意'),
                  ),
                  new PopupMenuItem(
                    value: '驳回意见',
                    child: new Text('驳回'),
                  )
                ],
              ),
            ],
          ),
          
          
        ]
        
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('审批联动'),
      ),
      body: new Column(
        children: [
          _approveDemo(),
          _showText(),
        ],
      )
    );
  }

}