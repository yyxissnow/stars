import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stars/route/route.dart';
import 'package:stars/control/control.dart';
import 'package:stars/widget/dialog/netLoadingDialog.dart';
import 'package:stars/widget/dialog/privateDialog.dart';

import 'package:stars/class/myClass.dart';
import 'package:stars/widget/dialog/netLoadingDialog.dart';
import 'package:stars/widget/wiget/myWidget.dart';

class PrivateChat extends StatefulWidget {
  PrivateChat({Key key}) : super(key: key);

  @override
  _PrivateChatState createState() => _PrivateChatState();
}

class _PrivateChatState extends State<PrivateChat> {
  @override
  void initState() {
    super.initState();
    getPrivate();
  }

  Future getPrivate() async {
    // if (my["love_id"] is String) {
    //   print("object");
    // }
    var data = await privateChatGet(my["love_id"]);
    if (data != null) {
      //print(data);
      private.clear();
      for (dynamic item in data) {
        setState(() {
          String avatar = item["avatar"];
          avatar = avatar.substring(5, avatar.length);
          private.add({
            "id": item["id"],
            "name": item["name"],
            "avatar": address + ":8005/static" + avatar,
            "content": item["content"],
            "time": item["time"] * 1000,
            "isMy": item["name"] == my["name"] ? true : false
          });
        });
      }
      //print(private);
    }
  }

  Widget privateNoTig() {
    return Container(
      child: Center(
        child: Text(
          "还没有悄悄话，记得添加哦！",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          // backgroundColor: Color.fromRGBO(255, 210, 149, 1),
          backgroundColor: Colors.white,
          titleSpacing: 0,
          title: Container(
            child: Text(
              "悄悄话",
              style: TextStyle(color: Colors.black),
            ),
          ),
          centerTitle: true,

          leading: Container(
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  })),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: Text(
                "留言",
                style: TextStyle(color: Colors.grey[600], fontSize: 17),
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   heroTag: "这是个tag_private",
        //   onPressed: () {
        //     Navigator.pushNamed(context, "/addReminder");
        //   },
        //   child: Icon(
        //     Icons.add,
        //   ),
        //   backgroundColor: Colors.orange[200],
        // ),
        body: private.length == 0 ? privateNoTig() : privatePage(context));
  }
}

//零点时间
DateTime zeroTime(DateTime time) {
  return DateTime(time.year, time.month, time.day);
}

//显示时间
String displayTime(DateTime date) {
  var now = zeroTime(DateTime.now());
  var diff = now.difference(zeroTime(date));

  //今天显示 时间
  if (diff.inDays < 1) {
    return formatDate(date, [HH, ':', nn]);
  } //昨天显示 昨天+时间
  else if (diff.inDays == 1) {
    return "昨天 " + formatDate(date, [HH, ':', nn]);
  } //一周内显示 星期+时间
  else if (diff.inDays <= 7) {
    return formatDate(date, [DD, ' ', HH, ':', nn]);
  } //同一年内显示 月+日+时间
  else if (date.year == now.year) {
    return formatDate(date, [mm, '-', dd, ' ', HH, ':', nn]);
  } //不同年显示 年+月+日+时间
  else {
    return formatDate(date, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn]);
  }
}

Future verify(String content, context) {
  if (content != null) {
    showDialog(
        context: context,
        builder: (context) {
          return NetLoadingDialog(
            requestCallBack: addPrivateChat(content),
            outsideDismiss: false,
          );
        }).then((body) {
      if (body != null && body["code"] == 20000) {
        // showMsg("发表成功");
        Navigator.pushNamed(context, "/private");
      }
    });
  } else {
    showMsg("请输入标题和内容");
  }
}

Widget privatePage(context) {
  String _content;
  SizeConfig().init(context);
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      // 触摸收起键盘
      FocusScope.of(context).requestFocus(FocusNode());
    },
    child: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 0.2,
              child: Container(
                color: Colors.black12,
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: Container(
                          margin: EdgeInsets.only(left: 5),
                          height: SizeConfig.screenHeight * 0.05,
                          width: SizeConfig.screenWidth * 0.9,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(245, 246, 250, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              onChanged: (vakue) {
                                _content = vakue;
                              },
                              decoration: new InputDecoration(
                                  icon: new Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  hintText: "写个悄悄话吧…",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  border: InputBorder.none),
                            ),
                          )),
                    ),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            verify(_content, context);
                          },
                          child: Container(
                            child: Icon(
                              Icons.sms,
                              color: Color.fromRGBO(153, 157, 178, 1),
                            ),
                          ),
                        ))
                  ],
                )),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: private.length,
                  itemBuilder: (context, index) {
                    return private[index]["isMy"] == true
                        ? noMyPrivate(private[index])
                        : isMyPrivate(private[index]);
                  },
                ),
              ),
            )
          ],
        )),
  );
}

Widget isMyPrivate(dynamic chat) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
    child: Column(
      children: <Widget>[
        Container(
          child: Text(
              displayTime(DateTime.fromMillisecondsSinceEpoch(chat["time"]))),
        ),
        Container(
            margin: EdgeInsets.only(right: 15),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 2, 0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(chat["avatar"]),
                    radius: 15,
                  ),
                ),
                Card(
                  shadowColor: Color.fromRGBO(253, 253, 255, 0.5),
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 5, 5, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      chat["content"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}

Widget noMyPrivate(dynamic chat) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
    child: Column(
      children: <Widget>[
        Container(
          child: Text(
              displayTime(DateTime.fromMillisecondsSinceEpoch(chat["time"]))),
        ),
        Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Card(
                  shadowColor: Color.fromRGBO(253, 253, 255, 0.5),
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 5, 5, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      chat["content"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 2, 0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(chat["avatar"]),
                    radius: 15,
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}

Future showDeletePrivateDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            "确认删除",
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
