import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stars/control/memoy.dart';
import 'package:stars/page/user/newSignIn/theme.dart' as theme;
import 'package:stars/route/route.dart';
import 'package:stars/widget/wiget/myWidget.dart';

/**
 * 注册界面
 */
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _name;
  String _password;
  GlobalKey<FormState> _signInFormKey = new GlobalKey();
  bool isShowPassWord_1 = true;
  bool isShowPassWord_2 = true;
  bool _checkboxItemA = false;

  void initState() {
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // arguments["path"] = appDocDir.path;
    // //print("${arguments["path"]}");
    // await assetFile("images/else/xgg.png", "xgg.png");
    // await assetFile("images/else/xjj.png", "xjj.png");
    loadImag();

    super.initState();
  }

  loadImag() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    arguments["path"] = appDocDir.path;
    //print("${arguments["path"]}");
    await assetFile("images/boji_boy.png", "boji_boy.png");
    await assetFile("images/boji_girl.png", "boji_girl.png");
  }

  loading() {
    setState(() {
      my = new Map();
      my["phone"] = _name;
      my["password"] = _password;
    });
    print(my);
  }

  void showPassWord_1() {
    setState(() {
      isShowPassWord_1 = !isShowPassWord_1;
    });
  }

  void showPassWord_2() {
    setState(() {
      isShowPassWord_2 = !isShowPassWord_2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(top: 23),
        child: new Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: <Widget>[
            new Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                ),
                width: 300,
                height: MediaQuery.of(context).size.height * 0.35,
                child: buildSignUpTextForm()),
            new Positioned(
              child: InkWell(
                child: new Center(
                  child: new Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 42, right: 42),
                    decoration: new BoxDecoration(
                      gradient: theme.Theme.primaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: new Text(
                      "下一步",
                      style: new TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  if (_checkboxItemA) {
                    if (_signInFormKey.currentState.validate()) {
                      loading();
                      Navigator.pushNamed(context, "/signUp_2");
                    }
                  } else {
                    showMsg("请同意隐私政策和用户协议");
                  }
                },
              ),
              top: MediaQuery.of(context).size.height * 0.36,
            ),
            new Positioned(
                top: MediaQuery.of(context).size.height * 0.5,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Checkbox(
                          value: _checkboxItemA,
                          onChanged: (value) {
                            setState(() {
                              _checkboxItemA = value;
                            });
                          },
                          activeColor: Colors.orange[300],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text("已同意"),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/agreement");
                              },
                              child: Container(
                                child: Text(
                                  "《隐私政策和用户协议》",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }

  Widget buildSignUpTextForm() {
    return new Form(
        key: _signInFormKey,
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //用户名字
            // Expanded(
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
            //     child: new TextFormField(
            //       decoration: new InputDecoration(
            //           icon: new Icon(
            //             FontAwesomeIcons.user,
            //             color: Colors.black,
            //           ),
            //           hintText: "Name",
            //           border: InputBorder.none),
            //       style: new TextStyle(fontSize: 16, color: Colors.black),
            //     ),
            //   ),
            // ),
            // new Container(
            //   height: 1,
            //   width: 250,
            //   color: Colors.grey[400],
            // ),
            //邮箱
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child: new TextFormField(
                  decoration: new InputDecoration(
                      icon: new Icon(
                        Icons.phone_android,
                        color: Colors.black,
                      ),
                      hintText: "电话",
                      border: InputBorder.none),
                  style: new TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value.isEmpty || value.length != 11) {
                      return "请输入11位电话号码";
                    }
                  },
                  onChanged: (value) {
                    _name = value;
                  },
                ),
              ),
            ),
            new Container(
              height: 1,
              width: 250,
              color: Colors.grey[400],
            ),
            //密码
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child: new TextFormField(
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
                        onPressed: () {
                          showPassWord_1();
                        }),
                  ),
                  obscureText: isShowPassWord_1,
                  style: new TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "请输入密码";
                    }
                  },
                  onChanged: (value) {
                    _password = value;
                  },
                ),
              ),
            ),
            new Container(
              height: 1,
              width: 250,
              color: Colors.grey[400],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 15, bottom: 15),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    icon: new Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    hintText: "确认密码",
                    border: InputBorder.none,
                    suffixIcon: new IconButton(
                        icon: new Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          showPassWord_2();
                        }),
                  ),
                  obscureText: isShowPassWord_2,
                  style: new TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value != _password) {
                      return "两次密码不一样";
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
