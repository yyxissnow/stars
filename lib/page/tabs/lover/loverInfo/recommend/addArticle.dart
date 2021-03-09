import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stars/class/myClass.dart';
import 'package:stars/control/control.dart';
import 'package:stars/route/route.dart';
import 'package:stars/widget/wiget/myWidget.dart';
import 'package:stars/widget/dialog/netLoadingDialog.dart';

class AddArticle extends StatefulWidget {
  AddArticle({Key key}) : super(key: key);

  @override
  _AddArticleState createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  File _image;
  int len = 0;
  String _content;

  // void initState() {
  //   super.initState();
  //   setState(() {
  //     _image:
  //     _getLocalFile();
  //   });
  // }

  // Future<File> _getLocalFile() async {
  //   // 获取文档目录的路径
  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   String dir = appDocDir.path;
  //   File file = new File('$dir/demo.txt');
  //   // print(file);
  //   return file;
  // }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      if (_image == null) {
        print("555");
        _image = new File("images/cc.png");
      } else {
        print("444");
        print(_image.path);
        len = 1;
      }
      //print(_image.path);
    });
  }

  _verify() async {
    if (_content != null) {
      showDialog(
          context: context,
          builder: (context) {
            return NetLoadingDialog(
              requestCallBack: addArticle(_image, len, phone, _content),
              outsideDismiss: false,
            );
          }).then((body) {
        if (body != null && body["code"] == 20000) {
          showMsg("发表成功");
          Navigator.pushNamed(context, "/love");
          //showMsg("发表成功");
          //Navigator.pushReplacementNamed(context, '/article/recommend');
          //Navigator.pop(context, true);
        }
      });
    } else {
      showMsg("发表失败");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(255, 210, 149, 1),
          title: Container(
            child: Text(
              "写说说",
              style: TextStyle(color: Colors.black),
            ),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "取消",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          actions: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                margin: EdgeInsets.only(right: 10),
                child: InkWell(
                  child: Container(
                    width: SizeConfig.screenWidth * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[200]),
                    alignment: Alignment.center,
                    child: Text(
                      "发表",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  onTap: _verify,
                ))
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.grey[100],
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "分享新鲜事",
                  ),
                  maxLines: null,
                  onChanged: (value) {
                    _content = value;
                    //print(_content);
                  },
                ),
              ),
              Container(
                height: 40,
                width: double.maxFinite,
                color: Colors.white,
              ),
              Container(
                height: SizeConfig.screenHeight * 0.18,
                width: SizeConfig.screenWidth,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                        child: InkWell(
                      onTap: getImage,
                      child: Container(
                        height: 110,
                        width: 120,
                        child: Column(
                          children: <Widget>[
                            Container(
                                //color: Colors.white,
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                    //alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    color: Color.fromRGBO(243, 245, 248, 1),
                                    height: 70,
                                    width: 120,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Icon(
                                        Icons.insert_photo,
                                        color: Color.fromRGBO(153, 157, 178, 1),
                                        size: 70,
                                      ),
                                    ))),
                            Container(
                              //color: Colors.white,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left: 10),
                                height: 40,
                                width: 120,
                                color: Color.fromRGBO(243, 245, 248, 1),
                                child: Text(
                                  "照片/视频",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromRGBO(153, 157, 178, 1),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 110,
                      width: 110,
                      //color: Colors.red,
                      child: _image == null
                          ? Container()
                          : Image.file(
                              _image,
                              fit: BoxFit.fill,
                            ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: SizeConfig.screenHeight * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100],
                      ),
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.local_offer,
                              size: 16,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2),
                            child: Text("添加标签"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100],
                      ),
                      margin:
                          EdgeInsets.only(right: SizeConfig.screenWidth * 0.25),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.location_on,
                              size: 16,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2),
                            child: Text("添加地点"),
                          )
                        ],
                      ),
                    ),

                    //
                    Container(
                      //alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100],
                      ),
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.public,
                                color: Colors.orange, size: 18),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2),
                            child: Text("公开"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: SizeConfig.screenHeight * 0.05,
                margin: EdgeInsets.only(top: 5),
                //color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        IconData(0xe73e, fontFamily: 'MyIcons'),
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(right: SizeConfig.screenWidth * 0.65),
                      child: Icon(
                        IconData(0xe61a, fontFamily: 'MyIcons'),
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.watch_later,
                        color: Colors.grey[300],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ))),
      ),
    );
  }
}
