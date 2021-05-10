import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:stars/class/myClass.dart';
import 'package:stars/control/control.dart';
import 'package:stars/page/tabs/lover/Lover.dart';
import 'package:stars/page/tabs/lover/loverInfo/recommend/commment.dart';
import 'package:stars/route/route.dart';
import 'package:like_button/like_button.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stars/widget/wiget/switchWidget.dart';

class Recommend extends StatefulWidget {
  Recommend({Key key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  //ScrollController _scrollController;
  PanelController panel = new PanelController();

  @override
  void initState() {
    super.initState();
    loading();
    //getRecommend();
  }

  Future getRecommend() async {
    var data = await recommendArticledGet();
    if (data != null) {
      recommendArticle.clear();
      for (dynamic item in data) {
        setState(() {
          recommendArticle.add({
            "user_avatar": item["user_avatar"],
            "id": item["article_id"],
            "user_id": item["user_id"],
            "user_name": item["user_name"],
            "content": item["content"],
            "time": item["time"] * 1000,
            "likes": item["like_num"],
            "islike": item["is_like"],
            "comments": item["comment_num"],
            "picture": item["picture"],
            "phone": item["phone"],
            "lines": item["line_num"]
          });
        });
        //print(recommendArticle);
      }
    }
  }

  void loading() {
    getRecommend().then((value) {
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
    return Container(
      child: SlidingUpPanel(
        controller: panel,
        minHeight: 0,
        maxHeight: SizeConfig.screenHeight * 0.7,
        //parallaxOffset: 0.5,
        backdropOpacity: 0.5,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(7, 10, 7, 10),
                          child: Container(
                              height: SizeConfig.screenHeight * 0.05,
                              width: SizeConfig.screenWidth * 0.6,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  decoration: new InputDecoration(
                                      icon: new Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                      ),
                                      hintText: "大家都在搜",
                                      border: InputBorder.none),
                                ),
                              )),
                        ),
                      ),
                      hotSerch(),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: ListView.builder(
                          shrinkWrap: true, //指定高度可扩张
                          itemCount: recommendArticle.length,
                          physics: NeverScrollableScrollPhysics(), //禁止滑动
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(8, 3, 8, 3),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: SizeConfig.screenHeight * 0.09,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: InkWell(
                                              child: Container(
                                                alignment: Alignment.topLeft,
                                                margin: EdgeInsets.fromLTRB(
                                                    12,
                                                    SizeConfig.screenHeight *
                                                        0.01,
                                                    0,
                                                    0),
                                                child: ClipOval(
                                                  child: Image.network(
                                                      recommendArticle == null
                                                          ? "images/boji_girl.png"
                                                          : recommendArticle[
                                                                  index]
                                                              ["user_avatar"],
                                                      height: SizeConfig
                                                              .screenHeight *
                                                          0.06,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, "/userInfo",
                                                    arguments: {
                                                      "name": recommendArticle[
                                                          index]["user_name"],
                                                      "avatar":
                                                          recommendArticle[
                                                                  index]
                                                              ["user_avatar"],
                                                      "phone": recommendArticle[
                                                          index]["phone"],
                                                      "user_id":
                                                          recommendArticle[
                                                              index]["user_id"]
                                                    });
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                5,
                                                SizeConfig.screenHeight * 0.01,
                                                0,
                                                0),
                                            alignment: Alignment.centerLeft,
                                            width:
                                                SizeConfig.screenWidth * 0.48,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  child: Text(
                                                    recommendArticle == null
                                                        ? "Snow"
                                                        : recommendArticle[
                                                            index]["user_name"],
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      fontFamily: "XiaoBai",
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Container(
                                                  child: Text(
                                                    formatDate(
                                                        DateTime.fromMillisecondsSinceEpoch(
                                                            recommendArticle[index]["time"]),
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
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Image.asset(
                                              "images/say_bg_1.jpg",
                                              fit: BoxFit.cover,
                                              width:
                                                  SizeConfig.screenWidth * 0.25,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.maxFinite,
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                      child: Text(
                                        recommendArticle == null
                                            ? "这是一个标题"
                                            : recommendArticle[index]
                                                ["content"],
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black87,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    recommendArticle[index]["lines"] > 3
                                        ? Container(
                                            margin: EdgeInsets.fromLTRB(
                                                12, 0, 0, 0),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "……查看全文",
                                              style: TextStyle(
                                                  color: Colors.orange,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ),
                                          )
                                        : Container(),
                                    recommendArticle[index]["picture"] == ""
                                        ? Container()
                                        : Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            height:
                                                SizeConfig.screenHeight * 0.2,
                                            margin: EdgeInsets.fromLTRB(
                                                10, 5, 10, 0),
                                            child: Image.network(
                                              recommendArticle[index]
                                                  ["picture"],
                                              fit: BoxFit.cover,
                                              width: double.maxFinite,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                            ),
                                          ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          LikeButton(
                                            isLiked: recommendArticle[index]
                                                ["islike"],
                                            likeBuilder: (bool isLiked) {
                                              return Icon(
                                                Icons.favorite,
                                                color: isLiked
                                                    ? Color.fromRGBO(
                                                        255, 210, 149, 1)
                                                    : Colors.grey,
                                              );
                                            },
                                            countBuilder: (int count,
                                                bool isLiked, String text) {
                                              var color = isLiked
                                                  ? Colors.pink[200]
                                                  : Colors.grey;
                                              Widget result;
                                              result = Text(
                                                text,
                                                style: TextStyle(
                                                    color: color, fontSize: 20),
                                              );
                                              return result;
                                            },
                                            likeCount: recommendArticle[index]
                                                ["likes"],
                                            onTap: (bool isLiked) {
                                              return onLikeButtonTap(
                                                  isLiked,
                                                  recommendArticle[index]
                                                      ["id"]);
                                            },
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, "/articleComment",
                                                  arguments: {
                                                    "id":
                                                        recommendArticle[index]
                                                            ["id"],
                                                    "user_avatar":
                                                        recommendArticle[index]
                                                            ["user_avatar"],
                                                    "user_name":
                                                        recommendArticle[index]
                                                            ["user_name"],
                                                    "content":
                                                        recommendArticle[index]
                                                            ["content"],
                                                    "time":
                                                        recommendArticle[index]
                                                            ["time"],
                                                    "likes":
                                                        recommendArticle[index]
                                                            ["likes"],
                                                    "islike":
                                                        recommendArticle[index]
                                                            ["islike"],
                                                    "comments":
                                                        recommendArticle[index]
                                                            ["comments"],
                                                    "picture":
                                                        recommendArticle[index]
                                                            ["picture"],
                                                    "phone":
                                                        recommendArticle[index]
                                                            ["phone"],
                                                    "lines":
                                                        recommendArticle[index]
                                                            ["linns"],
                                                    "isOpen": true,
                                                  });
                                              //panel.open();
                                            },
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  recommendArticle == null
                                                      ? "666"
                                                      : recommendArticle[index]
                                                                  ["comments"]
                                                              .toString() +
                                                          " 评论",
                                                  style: TextStyle(
                                                      color: Colors.black87),
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
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //xxxxxxxx
          //xxxxxxxx
          //xxxxxxxx
          onTap: () {
            panel.close();
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ),
        backdropEnabled: true,
        onPanelOpened: () {
          print(panel.isPanelOpen());
        },

        //renderPanelSheet: false,
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
                  margin: EdgeInsets.fromLTRB(7, 5, 7, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "评论 0",
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

                // Container(
                //   child: ArticleComment(
                //     // article_id: id,
                //   ),
                // ),

                //
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                                    // _content = vakue;
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
                                // verify(_content, context);
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
            // child: Center(
            //   child: Text("评论区",
            //       style: TextStyle(
            //           color: Colors.grey,
            //           fontSize: 16,
            //           fontWeight: FontWeight.normal,
            //           decoration: TextDecoration.none)),
            // ),
          ),
        ),
      ),
    );
  }
}

Widget hotSerch() {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 0, 12, 0),
    child: Column(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.search,
                  color: Colors.red,
                ),
              ),
              Container(
                child: Text("星辰缘热搜"),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("喜欢一个怎么办"),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange),
                      child: Text(
                        "热",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 7,
                          ),
                          SizedBox(
                            height: 20,
                            width: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("异地恋的相处模式"),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red),
                      child: Text(
                        "新",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("女朋友生气了怎们办"),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red),
                      child: Text(
                        "新",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 7,
                          ),
                          SizedBox(
                            height: 20,
                            width: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("圣诞节怂什么好"),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red),
                      child: Text(
                        "新",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("如何表白"),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red),
                      child: Text(
                        "新",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 7,
                          ),
                          SizedBox(
                            height: 20,
                            width: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("一起做的100件事"),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue),
                      child: Text(
                        "荐",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("直男的行为"),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red),
                      child: Text(
                        "新",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 7,
                          ),
                          SizedBox(
                            height: 20,
                            width: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "更多热搜",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.orange,
                          size: 20,
                        )),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
