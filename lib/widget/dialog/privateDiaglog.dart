import 'package:flutter/material.dart';
import 'package:stars/class/myClass.dart';
import 'package:stars/control/control.dart';
import 'package:stars/route/route.dart';
import 'package:stars/widget/dialog/netLoadingDialog.dart';

class PrivateAddDialog extends Dialog {
  dynamic arguments;
  PrivateAddDialog({this.arguments});

  String _text;

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

                              arguments["content"] = _text;
                              arguments["user_id"] = my["id"];
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
            height: SizeConfig.screenHeight * 0.35,
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
                            child: Text("增加属于你们的悄悄话",
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
                          height: 70,
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: TextField(
                              maxLines: null,
                              decoration: InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                                hintText: "\t\t请输入你的悄悄话",
                              ),
                              onChanged: (value) {
                                // setState(() {
                                //   _wishName = value;
                                // });
                                _text = value;
                                // print(value);
                                setState(() {
                                  _text = value;
                                });
                                //print(_wishName);
                              },
                            ),
                          ));
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // wishTime(),
                // wishState(),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Container(
                      margin: EdgeInsets.only(top: 5),
                      alignment: Alignment.center,
                      // height: SizeConfig.screenHeight * 0.05,
                      // width: SizeConfig.screenWidth * 0.35,
                      child: Container(
                        height: SizeConfig.screenHeight * 0.08,
                        width: SizeConfig.screenWidth * 0.4,
                        child: RaisedButton(
                          child: Text(
                            "发出",
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
                                        requestCallBack: privateAdd(
                                          arguments["user_id"],
                                          arguments["love_id"],
                                          arguments["content"],
                                        ),
                                        outsideDismiss: false,
                                      );
                                    }).then((data) {
                                  Navigator.pushReplacementNamed(
                                      context, '/private');
                                });
                              }
                            });
                          },
                        ),
                      )),
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
