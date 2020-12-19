import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stars/class/myClass.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:stars/control/memoy.dart';
import 'package:stars/page/Tabs.dart';
import 'package:stars/route/route.dart';
import 'package:stars/control/control.dart';
import 'package:stars/widget/wiget/myWidget.dart';
import 'package:stars/widget/dialog/netLoadingDialog.dart';
// import 'package:stars/page/user/newSignIn/theme.dart' as theme;

class Sign_up_page_2 extends StatefulWidget {
  //Map<dynamic, dynamic> arguments;
  Sign_up_page_2();

  @override
  _Sign_up_page_2State createState() => _Sign_up_page_2State();
}

class _Sign_up_page_2State extends State<Sign_up_page_2> {
  // Map<dynamic, dynamic> arguments = {};
  File _image;
  String _name;
  bool _sex = true;
  bool _isChangeName = false;
  int _index = 18; //当前选择年龄
  List<int> _ages = List(100);
  GlobalKey<FormState> _signInFormKey = new GlobalKey();
  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = new TextEditingController();

  //_Sign_up_page_2State({this.arguments});

  void initState() {
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // arguments["path"] = appDocDir.path;
    // //print("${arguments["path"]}");
    // await assetFile("images/else/xgg.png", "xgg.png");
    // await assetFile("images/else/xjj.png", "xjj.png");
    //loadImag();
    _image = File('${arguments["path"]}/boji_boy.png');
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _isChangeName = false;
        });
      }
    });
    super.initState();
  }

  // loadImag() async {
  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   arguments["path"] = appDocDir.path;
  //   //print("${arguments["path"]}");
  //   await assetFile("images/boji_boy.png", "boji_boy.png");
  //   await assetFile("images/boji_girl.png", "boji_girl.png");
  // }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = image;
      }
    });
  }

  loading() async {
    if (_name == null || _name == "") {
      _name = _sex ? "帅气的小哥哥" : "漂亮的小姐姐";
    }
    setState(() {
      my["name"] = _name;
      my["gender"] = _sex;
      my["age"] = _index;
    });

    print(my);
    // print("object");
    // print("$my[phone]");
    showDialog(
        context: context,
        builder: (context) {
          return NetLoadingDialog(
            requestCallBack: register(_image, my["phone"], my["password"],
                my["name"], my["age"], my["gender"]),
            outsideDismiss: false,
          );
        }).then((body) async {
      if (body != null && body["code"] == 20000) {
        //showMsg("注册成功");

        await getinfo();

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => TabBars()),
            (routers) => routers == null);
      } else {
        showMsg("注册失败");
      }
    });
  }

  Future getinfo() async {
    await infoGet(my["phone"]).then((data) {
      print(data);
      //设置等待await 不然会使得_loading销毁的时候infoGet还没有执行完，在setState会报错
      if (data != null) {
        //print(data);
        String avatar = data["avatar"];
        avatar = avatar.substring(5, avatar.length);
        //my = new Map();
        if (data["actor"] == 1) {
          my["day"] = data["day"].toString();
          my["lover_name"] = data["lover_name"];
        }
        setState(() {
          my = new Map();
          my["avatar"] = address + ":8101/static" + avatar;
          my["name"] = data["name"];
          my["id"] = data["id"];
          my["phone"] = data["phone"];
          my["gender"] = data["gender"];
          my["age"] = data["age"].toString();
          my["actor"] = data["actor"];
          // my["love_id"] = data["love_id"];
          // my["lover_id"] = data["lover_id"];
          // my["day"] = data["day"].toString();
        });
        //print(my);
      }
    });
  }

// http://172.20.10.13:9001/static/avatarImg/2020-12-07_12345678915.png
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          body: SafeArea(
              child: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        //设置渐变的背景
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: SizeConfig.screenHeight * 0.36,
                width: SizeConfig.screenWidth,
                child: Container(
                    alignment: Alignment.topCenter,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "上一步",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "跳过",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Text("请修改名字"),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(
                          //       top: SizeConfig.screenHeight * 0.05),
                          //   child: Text(
                          //     "欢迎来到星辰缘",
                          //     style:
                          //         TextStyle(fontSize: 35, color: Colors.white),
                          //   ),
                          // ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: _isChangeName
                                      ? Container(
                                          width: 120,
                                          height: 30,
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: _controller,
                                            focusNode: _focusNode,
                                            style:
                                                TextStyle(color: Colors.white),
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "请输入您的昵称",
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              contentPadding:
                                                  EdgeInsets.only(bottom: 10),
                                            ),
                                            onChanged: (value) {
                                              _name = value;
                                            },
                                          ))
                                      : Container(
                                          //width: 120,
                                          child: Text(
                                            _name == null
                                                ? (_sex ? "帅气的小哥哥" : "漂亮的小姐姐")
                                                : _name,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  child: Icon(Icons.border_color),
                                  onTap: () {
                                    setState(() {
                                      _isChangeName = true;
                                    });
                                  },
                                ),
                                // Container(
                                //   child: Text("点击输入姓名"),
                                // )
                              ],
                            ),
                          ),
                          Container(
                            child: Text("请选择头像"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 65,
                            width: 65,
                            //alignment: Alignment.center,
                            child: InkWell(
                              child: _image == null
                                  ? Image.asset("images/boji_boy.png")
                                  : CircleAvatar(
                                      backgroundImage: FileImage(_image),
                                    ),
                              // child: CircleAvatar(
                              //   backgroundImage: FileImage(_image),
                              // ),
                              onTap: getImage,
                            ),
                          )
                        ],
                      ),
                    )),
                decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/cc.png"), fit: BoxFit.fill)),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.1),
              //   child: Text(
              //     "星辰缘",
              //     style: TextStyle(fontSize: 40),
              //   ),
              // ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Container(
                child: Text("请选择性别"),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _sex ? Colors.blue[400] : Colors.blue[200],
                        ),
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.flare,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              child: Text(
                                "男",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _sex = true;
                          _image = File('${arguments["path"]}/boji_boy.png');
                        });
                      },
                    ),
                    //
                    InkWell(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _sex ? Colors.red[200] : Colors.red[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.ac_unit,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              child: Text(
                                "女",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _sex = false;
                          _image = File('${arguments["path"]}/boji_girl.png');
                        });
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Container(
                child: Text("请选择年龄"),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Container(
                width: double.maxFinite,
                height: 50,
                child: Swiper(
                  index: 18,
                  viewportFraction: 0.33,
                  itemCount: _ages.length,
                  itemBuilder: (context, index) {
                    return _index == index
                        ? Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(index.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(24, 24, 24, 1))))
                        : Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(index.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(139, 139, 139, 1))));
                  },
                  onIndexChanged: (int index) {
                    _index = index;
                  },
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              InkWell(
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(225, 206, 249, 1),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "开始",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                onTap: loading,
              )
            ],
          ),
        ),
      ))),
    );
  }
}
