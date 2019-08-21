import 'package:flutter/material.dart';

class QMListView extends StatefulWidget{
  @override
  _QMListViewState createState() {
    // TODO: implement createState
    return _QMListViewState();
  }

}
class _QMListViewState extends State<QMListView>{
  int itemCount;
  String title_content;
  String subTitle_content;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

}