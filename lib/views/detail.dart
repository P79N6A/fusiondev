import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(new DetailApp());

class DetailApp extends StatelessWidget {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}
class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  bool checked = false;
  var _time;
  Future<File> _imgFile;
  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if(i.isOdd){
          return new Divider();
        }
        final index = i ~/ 2;
        if(index >=_suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  

  Widget _buildRow(WordPair pair){
    final alreadySaved =_saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style:_biggerFont
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite :Icons.favorite_border,
        color: alreadySaved ? Colors.red : null
      ),
      onTap: (){
        setState(() {
         if(alreadySaved){
           _saved.remove(pair);
         } else{
           _saved.add(pair);
         }
        });
      }
    );
  }

  Widget _itemWithRedStar(String item,bool redFlag){
      List<TextSpan> children = new List<TextSpan>();
      children.add(TextSpan(text:item));
      if(redFlag){
        children.add(TextSpan(text:'*',style: TextStyle(color: Colors.red)));
      }
      // children.add(TextSpan(text: ":"));
      TextSpan result = new TextSpan(children: children,style: new TextStyle(height: 1.5));
      return Text.rich(result);
  }
  Widget _itemF(String item,bool redFlag){
    Widget itemD =_itemWithRedStar(item, redFlag);
    return new Expanded(child: itemD,);
  }
  _showDatePicker() async {
    Locale myLocale = Localizations.localeOf(context);
    var picker = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2016), 
      lastDate: DateTime(2030), 
      locale: myLocale
    );
    setState(() {
      _time = picker.toString().substring(0,10);
      });
  }

  Widget _travelDtail(){
    return new Container(
      padding:EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Center(
            child: new Text(
              '行程1',
              style: new TextStyle(
                fontSize: 18.0
              )
            ),
          ),
          // _itemWithRedStar('差旅人', true),
          new Row(
            children: [
              _itemF('差旅人', true),
              new Text(
                '张三'
              )
            ],
          ),
          new Row(
            children: [
              new Expanded(child: new Text('长春')),
              new Expanded(flex:10,child:new Icon(Icons.airplanemode_active)),
              new Padding(padding: EdgeInsets.only(right: 0),child: new Text('北京'))
            ],
          ),
          new Row(
            children: [
              new Expanded(
                flex: 3,
                // child: RaisedButton(
                //   child: Text(_time == null ? '选择日期':_time),
                //   onPressed: (){
                //     _showDatePicker();
                //   },
                // ),
                child: Text('2019-03-25'),
              ),
              new Padding(
                padding: EdgeInsets.only(right: 0),
                child: new Text('2019-03-25'),
              )
            ],
          ),
          new Row(
            children: [
              _itemF('交通费用', false),
              new Text('￥1380')
            ],
          ),

        ],
      )
    );
  }
  Widget _detailDemo(){
    return new Container(
      padding: const EdgeInsets.all(8.0),
      child: 
      // new Row(
        // children: [
        //   new Expanded(
            // child:
             new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Row(
                  children: [
                    // new Expanded(
                    //   child: _itemWithRedStar('差旅类型',true),
                    // ),
                    _itemF('差旅类型',true),
                    new Text(
                      '一般差旅'
                    ),
                    new Icon(
                      Icons.chevron_right
                    )
                    
                  ],
                ),
                new Row(
                  children: [
                    _itemF('申请日期',true),
                    new Text('2019-03-25')
                  ],
                ),
                // _itemWithRedStar('申请日期',true),
                new Row(
                  children: [
                    _itemF('差旅原因',true),
                    new Text(
                      '其他'
                    ),
                    new Icon(Icons.chevron_right)
                  ],
                ),
                // _itemWithRedStar('业务范围',true),
                _itemWithRedStar('差旅原因',true),
                new Text('参加会议',style: TextStyle(height: 1.5,fontWeight: FontWeight.bold),),
                new Row(
                  children: [
                    _itemF('显示费用',false),
                    new Switch(
                      value: checked,
                      activeColor: Colors.blue,
                      onChanged: (bool value){
                        this.setState((){
                          this.checked = value;
                        });
                      }

                    )
                  ],
                ),
                // _itemWithRedStar('显示费用',false),
                _travelDtail(),
                new Row(
                  children: [
                    new RaisedButton(
                      onPressed: (){
                        this._imgFile = ImagePicker.pickImage(source:ImageSource.camera);
                      },
                      child: new Text('调用相机'),
                    ),
                  ],
                ),
                new Row(
                  children: [
                    new RaisedButton(
                      onPressed: (){
                        this._imgFile = ImagePicker.pickImage(source:ImageSource.gallery);
                      },
                      child: new Text('调用相册'),
                    ),
                  ],
                ),


           ],
            ),
        //   )
        // ],
      // ),
    );
    
  }
  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          final tiles =_saved.map(
            (pair){
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style:_biggerFont
                ),
              );
            }
          );
          final divided =ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
            
          );
        }
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(
          child: new Text('差旅申请'),
        ),
        actions: <Widget>[
          new Center(
            child:new Text("完成")
          )
        ],
      ),
      // body:_buildSuggestions(),
      body: _detailDemo(),
      bottomNavigationBar: new BottomAppBar(
        child: new Container(
          height: 50,
          child: new Column(
            children: [
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  new Text('总计:￥3580'),
                ],
              ),
              new Row(
                children: [
                  new Icon(Icons.add_box),
                  new Expanded(
                    child: new Text('添加行程')
                  ),
                  new Icon(Icons.computer),
                  new Text('计算补助')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
