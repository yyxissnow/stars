import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stars/class/myClass.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stars/control/control.dart';
import 'package:stars/widget/dialog/netLoadingDialog.dart';
import 'package:stars/widget/wiget/myWidget.dart';
import 'package:stars/widget/wiget/switchWidget.dart';
import 'package:date_format/date_format.dart';
import 'package:like_button/like_button.dart';
import 'package:stars/route/route.dart';

// ignore: must_be_immutable
class ArticleComment extends StatefulWidget {
  dynamic arguments;
  ArticleComment({Key key, this.arguments}) : super(key: key);

  @override
  _ArticleCommentState createState() => _ArticleCommentState();
}

class _ArticleCommentState extends State<ArticleComment> {
  dynamic arguments;
  PanelController panel = new PanelController();
  String _content;
  // void main() async {
  //   // ignore: close_sinks
  //   //String s = "{id:1,userid:2,dstid:3,cmd:10,media:1,content:\"hello\"}";
  //   Map<String, dynamic> m1 = {
  //     "id": 1,
  //     "userid": 3,
  //     "recv_user_id": 3,
  //     "cmd": 10,
  //     "media": 1,
  //     "content": "hello"
  //   };
  //   WebSocket _webSocket = await WebSocket.connect(
  //       "ws://172.16.1.5:8009/privateChat/chat?phone=17381366118");
  //   //监听函数
  //   _webSocket.listen(_onReceive, onDone: () {
  //     print('连接关闭时响应');
  //   }, onError: (error) {
  //     print('发生错误');
  //   }, cancelOnError: true);
  //   _webSocket.add(jsonEncode(m1));
  // }

  // void _onReceive(data) {
  //   print("收到服务器数据:" + data);
  // }

  _ArticleCommentState();
  @override
  void initState() {
    //main();
    super.initState();
    arguments = widget.arguments;
    //print(arguments);
    loading();
  }

  Future getComment() async {
    var data = await getArticleComment(arguments["id"]);
    articleComment.clear();
    if (data != null) {
      for (dynamic item in data) {
        setState(() {
          articleComment.add({
            "user_avatar": item["user_avatar"],
            "user_id": item["user_id"],
            "user_name": item["user_name"],
            "content": item["content"],
            "time": item["time"] * 1000,
            "likes": item["likes"],
            //"islike": item["is_like"],
          });
        });
        //print(articleComment);
      }
    }
  }

  _verify() async {
    if (_content != null) {
      showDialog(
          context: context,
          builder: (context) {
            return NetLoadingDialog(
              requestCallBack: commentArticle(arguments["id"], 0, _content),
              outsideDismiss: false,
            );
          }).then((body) {
        if (body != null && body["code"] == 20000) {
          // showMsg("发表成功");
          Navigator.pushReplacementNamed(context, "/articleComment",
              arguments: {
                "id": arguments["id"],
                "user_avatar": arguments["user_avatar"],
                "user_name": arguments["user_name"],
                "content": arguments["content"],
                "time": arguments["time"],
                "likes": arguments["likes"],
                "islike": arguments["islike"],
                "comments": arguments["comments"] + 1,
                "picture": arguments["picture"],
                "phone": arguments["phone"],
                "lines": arguments["linns"],
                "isOpen": true
              });
        }
      });
    } else {
      showMsg("请输入评论内容");
    }
  }

  void loading() {
    getComment().then((value) {
      setState(() {});
    }).timeout(Duration(milliseconds: 15000), onTimeout: () {
      setState(() {
        //displayText = true;
      });
    });
  }

  Future<bool> onLikeButtonTap(bool isLiked, int id) {
    final Completer<bool> completer = new Completer<bool>();
    likeArticle(id);
    // Timer(const Duration(milliseconds: 200), () {});
    completer.complete(isLiked == true ? isLiked = false : isLiked = true);
    return completer.future;
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Container(
          alignment: Alignment.centerLeft,
          child: InkWell(
              onTap: () {
                articleComment.clear();
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 19,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "返回",
                      style: TextStyle(fontSize: 19, color: Colors.orange[300]),
                      maxLines: 1,
                    ),
                  ),
                ],
              )),
        ),
        actions: <Widget>[
          Container(
            child: InkWell(
              child: Icon(
                Icons.group_add,
                size: 22,
                color: Colors.orange[300],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "参与",
              style: TextStyle(color: Colors.orange[300], fontSize: 15),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: InkWell(
              child: Icon(
                Icons.more_horiz,
                size: 22,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: SlidingUpPanel(
        controller: panel,
        minHeight: 0,
        maxHeight: SizeConfig.screenHeight * 0.8,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        backdropEnabled: true,
        backdropOpacity: 0.5,
        defaultPanelState:
            arguments["isOpen"] == true ? PanelState.OPEN : PanelState.CLOSED,
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(12, 5, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "春天来了，夏天还会远吗？",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(12, 5, 0, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "星辰缘.  1314个回答",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 13),
                color: Colors.grey[200],
                height: 1,
              ),

              //
              Container(
                margin: EdgeInsets.fromLTRB(18, 18, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: ClipOval(
                              child: Image.network(
                                  arguments == null
                                      ? "images/boji_girl.png"
                                      : arguments["user_avatar"],
                                  height: SizeConfig.screenHeight * 0.06,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              arguments == null
                                  ? "Snow"
                                  : arguments["user_name"],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 13),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200]),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.add,
                                color: Colors.orange[400],
                              ),
                            ),
                            Container(
                              child: Text(
                                "关注",
                                style: TextStyle(
                                    color: Colors.orange[400], fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //
              Expanded(
                  child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(18, 18, 18, 0),
                    child: Text(
                      arguments == null
                          ? "images/boji_girl.png"
                          : arguments["content"],
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  arguments["picture"] == ""
                      ? Container()
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          height: SizeConfig.screenHeight * 0.2,
                          margin: EdgeInsets.fromLTRB(13, 10, 13, 5),
                          child: Image.network(
                            address + ":8004/static/" + arguments["picture"],
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      formatDate(
                          DateTime.fromMillisecondsSinceEpoch(
                              arguments["time"]),
                          [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn]),
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              )),

              Container(
                color: Colors.grey[200],
                height: 1,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    5, 8, 0, SizeConfig.screenHeight * 0.14),
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
                              // onChanged: (vakue) {},
                              decoration: new InputDecoration(
                                  hintText: "写下你的评论吧",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  border: InputBorder.none),
                            ),
                          )),
                    ),
                    Expanded(
                        flex: 3,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100]),
                              child: Text(
                                "发出",
                                style: TextStyle(color: Colors.orange[300]),
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                      flex: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Column(
                              children: <Widget>[
                                LikeButton(
                                  isLiked: arguments["islike"],
                                  //countPostion: CountPostion.bottom,
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.favorite,
                                      color: isLiked
                                          ? Color.fromRGBO(255, 210, 149, 1)
                                          : Colors.grey,
                                    );
                                  },
                                  countBuilder:
                                      (int count, bool isLiked, String text) {
                                    var color = isLiked
                                        ? Colors.pink[200]
                                        : Colors.grey;
                                    Widget result;
                                    result = Text(
                                      text,
                                      style:
                                          TextStyle(color: color, fontSize: 12),
                                    );
                                    return result;
                                  },
                                  likeCount: arguments["likes"],
                                  onTap: (bool isLiked) {
                                    return onLikeButtonTap(
                                        isLiked, arguments["id"]);
                                  },
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              panel.open();
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Icon(
                                      Icons.chat_bubble,
                                      color: Color.fromRGBO(255, 210, 149, 1),
                                      size: 23,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      arguments["comments"].toString(),
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        panel: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.only(left: SizeConfig.screenWidth * 0.4),
                        child: Text(
                          "全部评论",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 13),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                panel.close();
                              },
                              child: Icon(
                                Icons.clear,
                                color: Color.fromRGBO(68, 68, 68, 1),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                //

                Container(
                  margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "评论 " + arguments["comments"].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        child: ToggleSwitch(
                            initialLabelIndex: 1,
                            minWidth: SizeConfig.screenWidth * 0.1,
                            cornerRadius: 20,
                            activeBgColor: Color.fromRGBO(255, 210, 149, 1),
                            activeTextColor: Colors.white,
                            inactiveBgColor: Color(0xffF3F4F5),
                            inactiveTextColor: Color(0xff999999),
                            labels: ['默认', '最新'],
                            onToggle: (index) {
                              print('switched to: $index');
                            }),
                      )
                    ],
                  ),
                ),
                //

                articleComment.length == 0
                    ? Expanded(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: Text(
                                "暂无评论哦，快去抢沙发吧!",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ))
                    : Expanded(
                        child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: ListView.builder(
                              itemCount: articleComment.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.fromLTRB(10, 5, 8, 10),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: CircleAvatar(
                                              child: Image.network(
                                                  articleComment == null
                                                      ? "images/boji_girl.png"
                                                      : articleComment[index]
                                                          ["user_avatar"],
                                                  //height: SizeConfig.screenHeight * 0.06,
                                                  fit: BoxFit.cover),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 10,
                                          child: Container(
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Container(
                                                        child: Text(
                                                          articleComment == null
                                                              ? "images/boji_girl.png"
                                                              : articleComment[
                                                                      index]
                                                                  ["user_name"],
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Icon(
                                                            Icons.more_horiz),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 3, 0, 3),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    articleComment == null
                                                        ? "images/boji_girl.png"
                                                        : articleComment[index]
                                                            ["content"],
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          formatDate(
                                                              DateTime.fromMillisecondsSinceEpoch(
                                                                  articleComment[index]["time"]),
                                                              [
                                                                yyyy,
                                                                '-',
                                                                mm,
                                                                '-',
                                                                dd,
                                                                ' ',
                                                                HH,
                                                                ':',
                                                                nn
                                                              ]),
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: Colors
                                                                    .grey[300],
                                                                size: 18,
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(15,
                                                                      0, 10, 0),
                                                              child: Icon(
                                                                Icons
                                                                    .chat_bubble_outline,
                                                                color: Colors
                                                                    .grey[300],
                                                                size: 18,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              },
                            ))
                          ],
                        ),
                      )),

                //
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                                      hintText: "评论千万条，友善第一条",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none),
                                ),
                              )),
                        ),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                _verify();
                              },
                              child: Container(
                                child: Icon(
                                  Icons.send,
                                  color: Color.fromRGBO(255, 210, 149, 1),
                                ),
                              ),
                            ))
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
