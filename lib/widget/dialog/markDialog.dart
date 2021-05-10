import 'package:stars/widget/dialog/netLoadingDialog.dart';
import 'package:flutter/material.dart';
import 'package:stars/route/route.dart';
import 'package:stars/class/myClass.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:stars/control/control.dart';

bool _markDayType = true;
int _type = 0;
Color _diary = Colors.red;
Color _remind = Colors.grey;

class MarkDialog extends Dialog {
  dynamic arguments;
  MarkDialog({this.arguments});

  String _content;
  int _index = 0;
  List<int> _days = List(5000);

  Future showMyDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              "确认创建",
              textAlign: TextAlign.center,
            ),
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text("取消"),
                      ),
                    ),
                    Expanded(
                        child: FlatButton(
                            onPressed: () async {
                              arguments = new Map();

                              arguments["content"] = _content;

                              arguments["day"] = _index;

                              arguments["type"] = _type;

                              arguments["phone"] = my["phone"];
                              arguments["love_id"] = my["love_id"];
                              Navigator.pop(context, true);
                            },
                            child: Text("确认")))
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(context) {
    SizeConfig().init(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: SizeConfig.screenHeight * 0.50,
            width: SizeConfig.screenWidth * 0.85,
            //color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Stack(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Text("增加你们的纪念日",
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          child: Icon(Icons.close),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  child: StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Container(
                          height: 50,
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: TextField(
                              //maxLength: 11,
                              decoration: InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                                hintText: "\t\t请输入你们的纪念内容",
                              ),
                              onChanged: (value) {
                                // setState(() {
                                //   _wishName = value;
                                // });
                                _content = value;
                                // print(value);
                                setState(() {
                                  _content = value;
                                });
                                //print(_wishName);
                              },
                            ),
                          ));
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text("请选择时间"),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.03,
                ),
                Container(
                  width: double.maxFinite,
                  height: 50,
                  child: Swiper(
                    index: 0,
                    viewportFraction: 0.33,
                    itemCount: _days.length,
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
                                      color:
                                          Color.fromRGBO(139, 139, 139, 1))));
                    },
                    onIndexChanged: (int index) {
                      _index = index;
                    },
                  ),
                ),
                markState(),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    height: 30,
                    width: 120,
                    child: RaisedButton(
                      child: Text(
                        "提交",
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.blue[200],
                      textColor: Colors.white,
                      splashColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        if (_type == 0) {
                          showMyDialog(context).then(
                            (value) {
                              if (value) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return NetLoadingDialog(
                                        requestCallBack: diaryAdd(arguments),
                                        outsideDismiss: false,
                                      );
                                    }).then((data) {
                                  // showMsg("发表成功");
                                  Navigator.pushReplacementNamed(
                                      context, '/memorialize');
                                });
                              }
                            },
                          );
                        } else {
                          showMyDialog(context).then(
                            (value) {
                              if (value) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return NetLoadingDialog(
                                        requestCallBack: remindAdd(arguments),
                                        outsideDismiss: false,
                                      );
                                    }).then((data) {
                                  // showMsg("发表成功");
                                  Navigator.pushReplacementNamed(
                                      context, '/memorialize');
                                });
                              }
                            },
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class markState extends StatefulWidget {
  markState({Key key}) : super(key: key);

  @override
  _markStateState createState() => _markStateState();
}

class _markStateState extends State<markState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Text(
              "纪念日",
              style: TextStyle(fontSize: 18, color: _diary),
            ),
          ),
          Container(
              child: Switch(
                  activeColor: Colors.white,
                  activeTrackColor: Color.fromRGBO(255, 88, 88, 1),
                  value: _markDayType,
                  onChanged: (value) async {
                    if (_markDayType == false) {
                      setState(() {
                        _markDayType = true;
                        _type = 0;
                        _diary = Colors.red;
                        _remind = Colors.grey;
                      });
                    } else {
                      setState(() {
                        _markDayType = false;
                        _type = 1;
                        _diary = Colors.grey;
                        _remind = Colors.red;
                      });
                    }
                  })),
          Container(
            child: Text(
              "提醒日",
              style: TextStyle(fontSize: 18, color: _remind),
            ),
          ),
        ],
      ),
    );
  }
}
