
import 'package:flutter/material.dart';
import 'package:fusion_dev/service/service.dart';

import '../../../index.dart';

// class QMSearchHelp extends StatelessWidget{
//   Widget buildTextField(){
//     return Theme(
//       data: new ThemeData(primaryColor: Colors.grey),
//       child: new TextField(
//         cursorColor: Colors.grey,
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
//           border: InputBorder.none,
//           icon: Icon(Icons.search),
//           hintText: "搜索帮助",
//           hintStyle: new TextStyle(
//             fontSize: 14,
//             color: Color.fromARGB(50, 0, 0, 0)
//           ),
//         ),
//         style: new TextStyle(
//           fontSize: 14,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: new BoxDecoration(
//         borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
//       ),
//       alignment: Alignment.center,
//       height: 36,
//       padding: EdgeInsets.fromLTRB(10.0, 0,10.0, 0),
//       child: buildTextField(),
//     );
//   }

// }
class QMSearchHelp extends StatefulWidget{
  final String SEARCH_URL;
  final param;
  final loginName;
  final title_refrence;
  final subtitle_refrence;
  const QMSearchHelp({Key key, this.SEARCH_URL, this.param, @required this.loginName,@required this.title_refrence,@required this.subtitle_refrence}) : super(key: key);
  @override
  _QMSearchHelpState createState() => _QMSearchHelpState(search_url: SEARCH_URL,param: param,login_name: loginName,title_refrence: title_refrence,subtitle_refrence: subtitle_refrence);

}
class _QMSearchHelpState extends State<QMSearchHelp>{
  List _result;
  String search_url = "user";
  List _curShowData;
  int _curPageNum = 1;
  int _pageSize = 20;
  var param;
  String login_name;
  List _head;
  String title_refrence;
  String subtitle_refrence;
  int _showSize;
  ScrollController _scrollController = ScrollController();
  _QMSearchHelpState({this.search_url,this.param,this.login_name,this.title_refrence,this.subtitle_refrence}){

    _getResultData(login_name, null);
    _scrollController.addListener((){
      if(_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent){
            _curPageNum++;
            // getData();
            _getMore();
      }
    });
    // if(search_url == "user"){
    //   Future<QMRsp> rsp = TMWService.systemUsers(
    //     userName: "XUEFC"
    //   ).then((data){
    //     print(data.toString());
    //   });
    // }else if(search_url == "proj"){

    // }
  }
  void _getResultData(String userName,String condition){
    // TMWService.systemUsers(
    //   userName: userName,
    //   search_param: condition == null ? "" : condition
    // ).then((data){
    //   _result = data.getData()["SearchResult"];
    //   _head = _result[1];
    //   _result = _result.sublist(2);
    //   _refreshData();

    //   // print(_result["SearchResult"]);
    //   // print(_result.sublist(2,12));
    // });
    TMWService.sourceProjects(
      userName: userName,
      search_param: condition == null ? "" : condition,
    ).then((data){
      init(data);
      // _result = data.getData()["SearchResult"];
      // _head = _result[1];
      // _result = _result.sublist(2);
      // _refreshData();
    });
  }
  void init(data){
    _result = data.getData()["SearchResult"];
      _head = _result[1];
      _result = _result.sublist(2);
      // _refreshData();
      getData();
  }
  Widget buildTextField(){
    return Theme(
      data: new ThemeData(primaryColor: Colors.grey),
      child: new TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          border: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: "搜索帮助",
          hintStyle: new TextStyle(
            fontSize: 14,
            color: Color.fromARGB(50, 0, 0, 0)
          ),
        ),
        style: new TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        onSubmitted: (value){
          // print("onSubmitted:" + value);
          _getResultData(this.login_name, value);
          if(value == ""){
            _showSize = _pageSize;
          }
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
  Widget _showSHList(){
    return new Expanded(
      child: RefreshIndicator(
        onRefresh: (){
          // _refreshData();
        },
        child: ListView.separated(
          itemCount: _showSize== null ? _pageSize : _showSize,
          separatorBuilder: (BuildContext context,int index){
            return Divider(color: Colors.blue,);
          },
          itemBuilder: (BuildContext context,int index){
            return ListTile(
              title: Text(_curShowData == null ? "" : _curShowData[index][_head.indexOf(this.title_refrence == null ? "" : this.title_refrence)] == null ? "" : _curShowData[index][_head.indexOf(this.title_refrence == null ? "" : this.title_refrence)]),
              subtitle: Text(_curShowData == null ? "" : _curShowData[index][_head.indexOf(this.subtitle_refrence == null ? "" : this.subtitle_refrence)] == null ? "" : _curShowData[index][_head.indexOf(this.subtitle_refrence == null ? "" : this.subtitle_refrence)]),
              // subtitle: Text(_curShowData == null ? "" : _curShowData[index].length > 6 ? _curShowData[index][7] : _curShowData[index][4]),
              onTap: (){
                Navigator.pop(context,_curShowData[index]);
                print("bring " + _curShowData[index].toString());
              },
            );
          },
          controller: _scrollController,
        ),
      )
      ,
    );
  }
  // @override
  // void initState() {
  //   super.initState();
  //   getData();

  // }
  void getData() {
    // await Future.delayed(Duration(seconds:0),(){
      setState(() {
        // int _resultLength = _result.length;
        // int _curMaxShowSize = _curPageNum * _pageSize;
        // int start = (_curPageNum - 1) * _pageSize;
        // int end = 0;
        // if(_resultLength > _curMaxShowSize ){
        //   end = _curMaxShowSize;
        // }else{
        //   end = _resultLength;
        //   _pageSize = _resultLength;
        // }
        _curShowData = _operateData(load_type: "replace");
      });
    // });
  }
  List _operateData({String load_type}){
    int _resultLength = _result.length;
    int _curMaxShowSize = _curPageNum * _pageSize;
    int start = (_curPageNum - 1) * _pageSize;
    int end = 0;
    
    if(_resultLength > _curMaxShowSize ){
        end = _curMaxShowSize;
    }else{
      end = _resultLength;
      if(load_type == "replace"){
        _showSize = _resultLength;
      }
    }
    if(load_type == "add"){
      _showSize += end - start;
    }
    if(_showSize == null){
      _showSize = _pageSize;
    }
    // if(load_type == "add"){
    //   if(_resultLength > _curMaxShowSize ){
    //     end = _curMaxShowSize;
    //   }else{
    //     end = _resultLength;
    //   }
    //   _pageSize += end - start;
    // }else if(load_type == "replace"){
    //   if(_resultLength > _curMaxShowSize ){
    //     end = _curMaxShowSize;
    //   }else{
    //     end = _resultLength;
    //     _pageSize = _resultLength;
    //   }
    // }
    return _result.sublist(start,end);
  }
  Future _getMore()async{
    await Future.delayed(Duration(seconds:0),(){
      setState(() {
        _curShowData.addAll(_operateData(load_type: "add"));
      });
    });
  }
  Future<Null> _refreshData() async{
    // await Future.delayed(Duration(seconds: ),(){
      // setState(() {
       getData(); 
      // });
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索帮助"),
      ),
      body: Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
        ),
        alignment: Alignment.center,
        // height: 136,
        // padding: EdgeInsets.fromLTRB(10.0, 0,10.0, 0),
        child:Column(
          children: [
            buildTextField(),
            // RefreshIndicator(
            //   onRefresh: _refreshData(),
            //   child: _showSHList(),
            // ),
            _showSHList(),
          ]),
      ),
    );
    // return Container(
    //   decoration: new BoxDecoration(
    //     borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
    //   ),
    //   alignment: Alignment.center,
    //   height: 36,
    //   padding: EdgeInsets.fromLTRB(10.0, 0,10.0, 0),
    //   child: buildTextField(),
    // );
    
  }

}