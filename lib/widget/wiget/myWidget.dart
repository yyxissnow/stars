import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:date_format/date_format.dart';

//提示消息框
void showMsg(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    timeInSecForIos: 1,
    textColor: Colors.white,
    backgroundColor: Colors.black.withOpacity(0.6),
    gravity: ToastGravity.CENTER,
    toastLength: Toast.LENGTH_LONG,
  );
}

AssetImage wishBg(con) {
  if (con == false) {
    return AssetImage("images/boji_boy.png");
  } else {
    return AssetImage("images/boji_girl.png");
  }
}

//心愿单卡片
Widget wishInfoCard(
    BuildContext context, bool con, int id, String content, int time) {
  return InkWell(
    child: Card(
      shadowColor: Color.fromRGBO(253, 253, 255, 0.7),
      //color: Color.fromRGBO(253, 253, 255, 0.9),
      color: Colors.transparent,
      margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(50, 5, 0, 5),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "$content",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "截止时间  ",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            //"时间截止  $time",
                            formatDate(
                                DateTime.fromMillisecondsSinceEpoch(time),
                                [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn]),
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            con == false
                ? Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Image.asset(
                      "images/wish_no_logo.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Image.asset(
                      "images/wish_yes_logo.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  )
          ],
        ),
      ),
    ),
    onTap: () {},
  );
}

//心愿单卡片
Widget markDayInfoCard(
    BuildContext context, int day, int id, String content, int time, int type) {
  return InkWell(
    child: Card(
      shadowColor: Color.fromRGBO(253, 253, 255, 0.5),
      color: Colors.transparent,
      margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 5, 0, 5),
                child: Container(
                  child: Text(
                    "$content",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            type == 0
                ? Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "已有",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[600]),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
                            child: Text(
                              day.toString(),
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              "天",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[600]),
                            ),
                          )
                        ],
                      ),
                    ))
                : Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "还剩",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[600]),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
                            child: Text(
                              day.toString(),
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Text(
                              "天",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[600]),
                            ),
                          )
                        ],
                      ),
                    ))
          ],
        ),
      ),
    ),
    onTap: () {},
  );
}
