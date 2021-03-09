import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:stars/class/myClass.dart';
import 'package:stars/control/control.dart';
import 'package:stars/route/route.dart';

class Recommend extends StatefulWidget {
  Recommend({Key key}) : super(key: key);

  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  //ScrollController _scrollController;
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
            "user_avatar": address + ":8004/static/" + item["user_avatar"],
            //my["avatar"] = address + ":9001/static" + avatar;
            "user_name": item["user_name"],
            "content": item["content"],
            "time": item["time"] * 1000,
            "likes": item["likes"],
            "comments": item["comments"],
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

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        children: <Widget>[
          // Container(
          //   margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          //   child: Container(
          //       height: SizeConfig.screenHeight * 0.05,
          //       width: SizeConfig.screenWidth * 0.8,
          //       decoration: BoxDecoration(
          //         color: Colors.grey[300],
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Container(
          //         margin: EdgeInsets.only(left: 10),
          //         child: TextFormField(
          //           decoration: new InputDecoration(
          //               icon: new Icon(
          //                 Icons.search,
          //                 color: Colors.grey,
          //               ),
          //               hintText: "大家都在搜",
          //               border: InputBorder.none),
          //         ),
          //       )),
          // ),
          Expanded(
            child: ListView(
              //shrinkWrap: true,
              //controller: _scrollController,
              children: <Widget>[
                // SizedBox(
                //   height: 10,
                // ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                      height: SizeConfig.screenHeight * 0.05,
                      width: SizeConfig.screenWidth * 0.8,
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
                hotSerch(),
                Container(
                  //height: SizeConfig.screenHeight * 1,
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    //controller: _scrollController,
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
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      //alignment: Alignment.center,
                                      //width: SizeConfig.screenWidth * 0.2,
                                      child: InkWell(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.fromLTRB(
                                              12,
                                              SizeConfig.screenHeight * 0.01,
                                              0,
                                              0),
                                          child: ClipOval(
                                            child: Image.network(
                                                recommendArticle == null
                                                    ? "images/boji_girl.png"
                                                    : recommendArticle[index]
                                                        ["user_avatar"],
                                                height:
                                                    SizeConfig.screenHeight *
                                                        0.06,
                                                //height: 50,
                                                //width: 50,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/userInfo",
                                              arguments: {
                                                "name": recommendArticle[index]
                                                    ["user_name"],
                                                "avatar":
                                                    recommendArticle[index]
                                                        ["user_avatar"],
                                                "phone": recommendArticle[index]
                                                    ["phone"],
                                              });
                                        },
                                      ),
                                    ),
                                    //
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5,
                                          SizeConfig.screenHeight * 0.01, 0, 0),
                                      alignment: Alignment.centerLeft,
                                      //height: SizeConfig.screenHeight * 0.1,
                                      width: SizeConfig.screenWidth * 0.48,
                                      //margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            //alignment: Alignment.centerLeft,
                                            child: Text(
                                              recommendArticle == null
                                                  ? "Snow"
                                                  : recommendArticle[index]
                                                      ["user_name"],
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
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
                                                //fontWeight: FontWeight.w300,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    Container(
                                      //margin: EdgeInsets.fromLTRB(90, 0, 0, 0),
                                      child: Image.asset(
                                        "images/say_bg_1.jpg",
                                        fit: BoxFit.cover,
                                        width: SizeConfig.screenWidth * 0.25,
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
                                      : recommendArticle[index]["content"],
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
                                      margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
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
                                      height: SizeConfig.screenHeight * 0.2,
                                      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                                      child: Image.network(
                                        address +
                                            ":8004/static/" +
                                            recommendArticle[index]["picture"],
                                        fit: BoxFit.cover,
                                        width: double.maxFinite,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                    ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                //margin: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.favorite,
                                          color:
                                              Color.fromRGBO(255, 210, 149, 1),
                                        ),
                                        Text(
                                          "35",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "666 评论",
                                          style:
                                              TextStyle(color: Colors.black87),
                                        )
                                      ],
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
          // Expanded(
          //   //listview能被column包裹 要用expanded包裹
          //   child:
          // ),
        ],
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
