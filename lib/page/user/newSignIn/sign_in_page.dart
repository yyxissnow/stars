import 'package:flutter/material.dart';
import 'package:stars/class/myClass.dart';
import 'package:stars/control/control.dart';
import 'package:stars/page/Tabs.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stars/page/user/newSignIn/theme.dart' as theme;
import 'package:stars/route/route.dart';
import 'package:stars/widget/wiget/myWidget.dart';
import 'package:stars/widget/dialog/netLoadingDialog.dart';

/**
 *注册界面
 */
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => new _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  /**
   * 利用FocusNode和FocusScopeNode来控制焦点
   * 可以通过FocusNode.of(context)来获取widget树中默认的FocusScopeNode
   */
  String _name;
  String _password;
  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusScopeNode focusScopeNode = new FocusScopeNode();

  GlobalKey<FormState> _signInFormKey = new GlobalKey();

  bool isShowPassWord = false;

  Future _loading() async {
    var body = await login(_name, _password);
    if (body["code"] == 20000) {
      phone = body["data"]["phone"];
      //print(phone);
      await infoGet(phone).then((data) {
        //设置等待await 不然会使得_loading销毁的时候infoGet还没有执行完，在setState会报错
        if (data != null) {
          print(data);
          String avatar = data["avatar"];
          avatar = avatar.substring(5, avatar.length);
          my = new Map();
          if (data["actor"] == 1) {
            my["day"] = data["day"].toString();
            my["lover_name"] = data["lover_name"];
          }
          setState(() {
            //my = new Map();
            my["avatar"] = address + ":8005/static" + avatar;
            my["name"] = data["name"];
            my["id"] = data["id"];
            my["phone"] = data["phone"];
            my["gender"] = data["gender"];
            my["age"] = data["age"].toString();
            my["actor"] = data["actor"];
            my["love_id"] = data["love_id"];
            my["lover_id"] = data["lover_id"];
            my["day"] = data["day"].toString();
          });
          // if (my["lover_id"] is String) {
          //   print("lover is string");
          // }
        }
      });

      //sleep(Duration(seconds: 1));
      // const timeout = const Duration(seconds: 5);
      // print('currentTime=' + DateTime.now().toString()); // 当前时间
      // Timer(timeout, null);
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return new Container(
      padding: EdgeInsets.only(top: 23),
      child: new Stack(
        alignment: Alignment.center,
//        /**
//         * 注意这里要设置溢出如何处理，设置为visible的话，可以看到孩子，
//         * 设置为clip的话，若溢出会进行裁剪
//         */
//        overflow: Overflow.visible,
        children: <Widget>[
          new Column(
            children: <Widget>[
              //创建表单
              buildSignInTextForm(),

              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.1),
                child: new Text(
                  "忘记密码?",
                  style: new TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                ),
              ),

              /**
               * Or所在的一行
               */
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: new Row(
//                          mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      height: 1,
                      width: 80,
                      decoration: BoxDecoration(
                          gradient: new LinearGradient(colors: [
                        Colors.white10,
                        Colors.white,
                      ])),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: new Text(
                        "第三方登录",
                        style: new TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    new Container(
                      height: 1,
                      width: 80,
                      decoration: BoxDecoration(
                          gradient: new LinearGradient(colors: [
                        Colors.white,
                        Colors.white10,
                      ])),
                    ),
                  ],
                ),
              ),

              /**
               * 显示第三方登录的按钮
               */
              new SizedBox(
                height: 10,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new IconButton(
                        icon: Icon(
                          IconData(0xe73e, fontFamily: 'MyIcons'),
                          color: Colors.blue,
                          size: 30,
                          //Icons.ac_unit
                          //FontAwesomeIcons.facebookF,
                          //color: Color(0xFF0084ff),
                        ),
                        onPressed: null),
                  ),
                  new SizedBox(
                    width: 40,
                  ),
                  new Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new IconButton(
                        icon: Icon(
                          IconData(0xe61a, fontFamily: 'MyIcons'),
                          color: Colors.green,
                          size: 30,
                          //Icons.access_alarm
                          //FontAwesomeIcons.google,
                          //color: Color(0xFF0084ff),
                        ),
                        onPressed: null),
                  ),
                ],
              )
            ],
          ),
          new Positioned(
            child: buildSignInButton(),
            top: SizeConfig.screenHeight * 0.26,
          )
        ],
      ),
    );
  }

  /**
   * 点击控制密码是否显示
   */
  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  /**
   * 创建登录界面的TextForm
   */
  Widget buildSignInTextForm() {
    return new Container(
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      // width: 300,
      // height: 190,
      height: SizeConfig.screenHeight * 0.25,
      width: SizeConfig.screenWidth * 0.85,
      /**
       * Flutter提供了一个Form widget，它可以对输入框进行分组，
       * 然后进行一些统一操作，如输入内容校验、输入框重置以及输入内容保存。
       */
      child: new Form(
        key: _signInFormKey,
        //开启自动检验输入内容，最好还是自己手动检验，不然每次修改子孩子的TextFormField的时候，其他TextFormField也会被检验，感觉不是很好
//        autovalidate: true,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 15, bottom: 10),
                child: new TextFormField(
                  //关联焦点
                  focusNode: emailFocusNode,
                  onEditingComplete: () {
                    if (focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(passwordFocusNode);
                  },

                  decoration: new InputDecoration(
                      icon: new Icon(
                        Icons.phone_android,
                        color: Colors.black,
                      ),
                      hintText: "电话号码",
                      border: InputBorder.none),
                  style: new TextStyle(fontSize: 16, color: Colors.black),
                  //验证

                  validator: (value) {
                    if (value.isEmpty || value.length != 11) {
                      return "请输入11位电话号码";
                    }
                  },
                  onChanged: (value) {
                    _name = value;
                  },
                  // onSaved: (value) {
                  //   _name = value;
                  // },
                ),
              ),
            ),
            new Container(
              height: 1,
              width: 250,
              color: Colors.grey[400],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                child: new TextFormField(
                  focusNode: passwordFocusNode,
                  decoration: new InputDecoration(
                      icon: new Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: "密码",
                      border: InputBorder.none,
                      suffixIcon: new IconButton(
                          icon: new Icon(
                            Icons.remove_red_eye,
                            color: Colors.black,
                          ),
                          onPressed: showPassWord)),
                  //输入密码，需要用*****显示
                  obscureText: !isShowPassWord,
                  style: new TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "请输入密码";
                    }
                  },
                  onChanged: (value) {
                    _password = value;
                  },
                  // onSaved: (value) {
                  //   _password = value;
                  // },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /**
   * 创建登录界面的按钮
   */
  Widget buildSignInButton() {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: theme.Theme.primaryGradient,
        ),
        child: new Text(
          "进 入",
          style: new TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      onTap: () async {
        // print(_name);
        // print(_password);
        /**利用key来获取widget的状态FormState
              可以用过FormState对Form的子孙FromField进行统一的操作
           */
        if (_signInFormKey.currentState.validate()) {
          //如果输入都检验通过，则进行登录操作
          // Scaffold.of(context)
          //     .showSnackBar(new SnackBar(content: new Text("执行登录操作")));
          // //调用所有自孩子的save回调，保存表单内容
          // _SignInFormKey.currentState.save();

          showDialog(
              context: context,
              builder: (context) {
                return NetLoadingDialog(
                  requestCallBack: _loading(),
                  outsideDismiss: false,
                );
              }).then((value) {
            if (value) {
              //print("5555");
              // 登录以后 清空路由
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => TabBars()),
                  (routers) => routers == null);
            } else {
              showMsg("用户名或密码错误");
            }
          });
        }
//          debugDumpApp();

        // showDialog(
        //     context: context,
        //     builder: (context) {
        //       return NetLoadingDialog(
        //         requestCallBack: _loading(),
        //         outsideDismiss: false,
        //       );
        //     }).then((value) {
        //   if (value) {
        //     print("5555");
        //     // 登录以后 清空路由
        //     Navigator.of(context).pushAndRemoveUntil(
        //         MaterialPageRoute(builder: (context) => TabBars()),
        //         (routers) => routers == null);
        //   } else {
        //     showMsg("用户名或密码错误");
        //   }
        // });
      },
    );
  }
}
