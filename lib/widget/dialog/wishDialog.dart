import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:stars/class/myClass.dart';
import 'package:stars/route/route.dart';
import 'package:stars/widget/dialog/netLoadingDialog.dart';
import 'package:stars/control/control.dart';

DateTime dateWishTime = new DateTime.now();
bool _wishAccomplish = false;
String _wishState = "未完成";

DateTime zeroTime(DateTime time) {
  return DateTime(time.year, time.month, time.day);
}

class WishAddDialog extends Dialog {
  dynamic arguments;
  WishAddDialog({this.arguments});

  String _wishName;

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

                              arguments["wishName"] = _wishName;

                              arguments["wishTime"] =
                                  ((dateWishTime.millisecondsSinceEpoch) / 1000)
                                      .toInt();

                              arguments["wishAccomplish"] = _wishAccomplish;

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
            height: SizeConfig.screenHeight * 0.45,
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
                            child: Text("增加属于你们的心愿",
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
                                hintText: "\t\t请输入你们的心愿",
                              ),
                              onChanged: (value) {
                                // setState(() {
                                //   _wishName = value;
                                // });
                                _wishName = value;
                                // print(value);
                                setState(() {
                                  _wishName = value;
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
                wishTime(),
                wishState(),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    height: 30,
                    width: 120,
                    child: RaisedButton(
                      child: Text(
                        "提交心愿",
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.blue[200],
                      textColor: Colors.white,
                      splashColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        showMyDialog(context).then((value) {
                          if (value) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return NetLoadingDialog(
                                    requestCallBack: wishAdd(arguments),
                                    outsideDismiss: false,
                                  );
                                }).then((data) {
                              Navigator.pushReplacementNamed(
                                  context, '/wish/query');
                            });
                          }
                        });
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

class wishTime extends StatefulWidget {
  wishTime({Key key}) : super(key: key);

  @override
  _wishTimeState createState() => _wishTimeState();
}

class _wishTimeState extends State<wishTime> {
  @override
  void _showDate() {
    DateTime time = zeroTime(DateTime.now());

    DatePicker.showDatePicker(context,
        maxDateTime: time.add(Duration(days: 7)).subtract(Duration(minutes: 1)),
        minDateTime: time,
        initialDateTime: dateWishTime,
        dateFormat: 'yyyy年M月d日  EEE,H时:m分',
        pickerMode: DateTimePickerMode.datetime,
        locale: DateTimePickerLocale.zh_cn, onCancel: () {
      print("onCancel");
    }, onConfirm: (dateTime, List<int> index) {
      this.setState(() {
        dateWishTime = dateTime;
        //print(dateWishTime.millisecondsSinceEpoch);
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Text("选择截止时间",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  )),
            ),
            Container(
              child: Text(
                formatDate(
                    dateWishTime, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn]),
              ),
            )
          ],
        ),
        onTap: _showDate,
      ),
    );
  }
}

class wishState extends StatefulWidget {
  wishState({Key key}) : super(key: key);

  @override
  _wishStateState createState() => _wishStateState();
}

class _wishStateState extends State<wishState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Text(
              "愿望是否完成",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
              child: Switch(
                  activeColor: Colors.white,
                  activeTrackColor: Color.fromRGBO(255, 88, 88, 1),
                  value: _wishAccomplish,
                  onChanged: (value) async {
                    if (_wishAccomplish == false) {
                      setState(() {
                        _wishAccomplish = true;
                        _wishState = "已完成";
                      });
                    } else {
                      setState(() {
                        _wishAccomplish = false;
                        _wishState = "未完成";
                      });
                    }
                  })),
          Container(
            child: Text("$_wishState"),
          )
        ],
      ),
    );
  }
}
