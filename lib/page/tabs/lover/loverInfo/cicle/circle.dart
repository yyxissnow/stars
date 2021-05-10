import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:stars/class/myClass.dart';
import 'package:stars/control/control.dart';
import 'package:stars/route/route.dart';

class Circle extends StatefulWidget {
  int user_id;
  Circle(this.user_id);

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  int user_id;
  @override
  void initState() {
    user_id = widget.user_id;
    getRecommend();
    super.initState();
    //phone = widget.user_phone;
    //print(phone);
    //getRecommend();
  }

  Future getRecommend() async {
    var data = await getOneselfArticledGet(user_id);
    if (data != null) {
      oneselfArticle.clear();
      for (dynamic item in data) {
        setState(() {
          oneselfArticle.add({
            "user_avatar": item["user_avatar"],
            "user_name": item["user_name"],
            "content": item["content"],
            "time": item["time"] * 1000,
            "likes": item["like_num"],
            "comments": item["comment_num"],
            "picture": item["picture"],
            "lines": item["line_num"]
          });
        });
        //print(recommendArticle);
      }
    }
  }

  // void loading() {
  //   getRecommend();
  //   // getRecommend().then((value) {
  //   //   setState(() {});
  //   // }).timeout(Duration(milliseconds: 15000), onTimeout: () {
  //   //   setState(() {
  //   //     //displayText = true;
  //   //   });
  //   // });
  // }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "这是个tag_1",
        onPressed: () {
          Navigator.pushNamed(context, "/addArticle");
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color.fromRGBO(255, 210, 149, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: oneselfArticle.length,
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
                                    12, SizeConfig.screenHeight * 0.01, 0, 0),
                                child: ClipOval(
                                  child: Image.network(
                                      oneselfArticle == null
                                          ? "images/boji_girl.png"
                                          : oneselfArticle[index]
                                              ["user_avatar"],
                                      height: SizeConfig.screenHeight * 0.06,
                                      //height: 50,
                                      //width: 50,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              onTap: () {
                                //Navigator.pushNamed(context, "/userInfo");
                              },
                            ),
                          ),
                          //
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                5, SizeConfig.screenHeight * 0.01, 0, 0),
                            alignment: Alignment.centerLeft,
                            //height: SizeConfig.screenHeight * 0.1,
                            width: SizeConfig.screenWidth * 0.48,
                            //margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  //alignment: Alignment.centerLeft,
                                  child: Text(
                                    oneselfArticle == null
                                        ? "Snow"
                                        : oneselfArticle[index]["user_name"],
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
                                            oneselfArticle[index]["time"]),
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
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: Text(
                        oneselfArticle == null
                            ? "这是一个标题"
                            : oneselfArticle[index]["content"],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    oneselfArticle[index]["lines"] > 3
                        ? Container(
                            margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "……查看全文",
                              style: TextStyle(
                                  color: Colors.orange,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        : Container(),
                    oneselfArticle[index]["picture"] == ""
                        ? Container()
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            height: SizeConfig.screenHeight * 0.2,
                            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                            child: Image.network(
                              recommendArticle[index]["picture"],
                              fit: BoxFit.cover,
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height * 0.1,
                            ),
                          ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      //margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Color.fromRGBO(255, 210, 149, 1),
                              ),
                              Text(
                                "0",
                                style: TextStyle(color: Colors.black87),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "0评论",
                                style: TextStyle(color: Colors.black87),
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
    );
  }
}
