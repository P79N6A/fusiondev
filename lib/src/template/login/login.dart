
import 'package:flutter/material.dart';
import './userInfo.dart';
class QMLogin extends StatelessWidget {
  final String title;//标题
  final String subTitle;//副标题
  final String imgUrl;//图片路径
  final requestUrl;
  @required
  final void Function(BuildContext,UserInfo) callback;//跳转扩展方法
  const QMLogin({
    Key key, 
    this.title,
    this.subTitle,
    this.imgUrl,
    this.requestUrl,
    this.callback,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage(imgUrl == null ? 'assets/images/launch_image.png' : imgUrl)
              )
            ),
          ),
          // Image.asset('assets/images/launch_image.png',fit: BoxFit.cover,),
          ListView(
            padding: const EdgeInsets.all(55),
            children:<Widget>[
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title == null ? '' : title,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(subTitle == null ? '' : subTitle,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 25,
                      height: 1.5,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              ),

              SizedBox(height: 120),
              new InputEdtextNameWiget(InputEdTextController.userNameController),
              SizedBox(height: 20,),
              new InputEdtextPassWordWiget(InputEdTextController.passwordController),
              SizedBox(height: 30,),
              new LoginButtonWidget((ctx,user){
                user.userName = 'XUEFC';
                user.password = '1234qwer';
                callback(ctx,user);
                }),
            ]
          )
        ],
      )
      
    )
    ;
  }
}

class InputEdTextController{
  static TextEditingController userNameController = TextEditingController();//用户名控制
  static TextEditingController passwordController = TextEditingController();//密码控制
}
//输入用户名
class InputEdtextNameWiget extends StatefulWidget {
  TextEditingController userNameController;
  InputEdtextNameWiget(TextEditingController userNameController){
    this.userNameController = userNameController;
  }
  @override
  _InputEdtextNameWigetState createState() => _InputEdtextNameWigetState(userNameController);
}

class _InputEdtextNameWigetState extends State<InputEdtextNameWiget> {
  TextEditingController userNameController;
  _InputEdtextNameWigetState(TextEditingController userNameController){
    this.userNameController = userNameController;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SizedBox(
      child: new Container(
        padding: EdgeInsets.fromLTRB(20, 2, 8, 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: TextField(
          controller: userNameController,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: '用户名',
            border: InputBorder.none,
            suffixIcon: new IconButton(
              icon: new Icon(Icons.clear,color: Colors.black45),
              onPressed: ()=>userNameController.clear(),
            ),

          ),
        ),
      ),
    );
  }
}
//输入密码
class InputEdtextPassWordWiget extends StatefulWidget {
  TextEditingController passwordController;
  InputEdtextPassWordWiget(TextEditingController passwordController){
    this.passwordController = passwordController;
  }
  @override
  _InputEdtextPassWordWigetState createState() => _InputEdtextPassWordWigetState(passwordController);
}

class _InputEdtextPassWordWigetState extends State<InputEdtextPassWordWiget> {
  TextEditingController passwordController;
  _InputEdtextPassWordWigetState(TextEditingController passwordController){
    this.passwordController = passwordController;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SizedBox(
      child: new Container(
        padding: EdgeInsets.fromLTRB(20, 2, 8, 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: TextField(
          controller: passwordController,
          obscureText: true,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: '密码',
            border: InputBorder.none,
            suffixIcon: new IconButton(
              icon: new Icon(Icons.clear,color: Colors.black45,),
              onPressed: ()=>passwordController.clear(),
            ),
          ),
        ),
      ),
    );
  }
}
//登录按钮
class LoginButtonWidget extends StatefulWidget {
  Function(BuildContext,UserInfo) callback;
  LoginButtonWidget(Function(BuildContext,UserInfo) callback){
    this.callback = callback;
  }

  @override
  _LoginButtonWidgetState createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(
      padding: EdgeInsets.fromLTRB(2, 15, 2, 15),
      color: Colors.deepOrangeAccent,
      child: Text('登录'),
      textColor: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      onPressed: (){
        var userNameController = InputEdTextController.userNameController;
        var passwordController = InputEdTextController.passwordController;
        var userName = userNameController.text;
        var password = passwordController.text;
        widget.callback(context,new UserInfo(userName:userName, password:password));
      },
    );
    // return new SizedBox(
    //   child: new Container(
    //     padding: EdgeInsets.fromLTRB(2, 15, 2, 15),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(30),
    //       color: Colors.deepOrangeAccent,
    //     ),
    //     alignment: Alignment.center,
    //     child: Text(
    //       '登录',
    //       textAlign: TextAlign.center,
    //       style: TextStyle(letterSpacing: 20,
    //       fontWeight: FontWeight.bold,
    //       color: Colors.white70),
    //     )
    //   ),
    // );
  }
}
