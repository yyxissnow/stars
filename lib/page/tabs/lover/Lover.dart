import 'package:flutter/material.dart';
import 'package:stars/control/control.dart';
import 'package:stars/page/tabs/lover/loverInfo/cicle/circle.dart';
import 'package:stars/page/tabs/lover/loverInfo/question/question.dart';
import 'package:stars/page/tabs/lover/loverInfo/recommend/recommend.dart';
import 'package:stars/route/route.dart';

class LovePage extends StatefulWidget {
  LovePage({Key key}) : super(key: key);

  @override
  _LovePageState createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {
  var tab_shadow = Shadow(
      color: Colors.black, //颜色
      blurRadius: 2, //虚化
      offset: Offset(1, 1) //偏移
      );
  // @override
  // void initState() {
  //   getRecommend();
  //   super.initState();
  //   //getRecommend();
  // }

  // Future getRecommend() async {
  //   var data = await getOneselfArticledGet();
  //   if (data != null) {
  //     //oneselfArticle.clear();
  //     for (dynamic item in data) {
  //       setState(() {
  //         oneselfArticle.add({
  //           "user_avatar": address + ":9002/static/" + item["user_avatar"],
  //           //my["avatar"] = address + ":9001/static" + avatar;
  //           "user_name": item["user_name"],
  //           "content": item["content"],
  //           "time": item["time"] * 1000,
  //           "likes": item["likes"],
  //           "comments": item["comments"],
  //           "picture": item["picture"],
  //         });
  //       });
  //       //print(recommendArticle);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
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
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromRGBO(255, 210, 149, 1),
            title: Row(
              children: <Widget>[
                Expanded(
                    child: TabBar(
                  indicatorColor: Color.fromRGBO(245, 149, 149, 0.5),
                  tabs: <Widget>[
                    Tab(
                      child: Container(
                        child: Text(
                          "动态",
                          style: TextStyle(
                            fontSize: 20,
                            shadows: [tab_shadow],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "圈子",
                          style: TextStyle(
                            fontSize: 20,
                            shadows: [tab_shadow],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "Q&A",
                          style: TextStyle(
                            fontSize: 20,
                            shadows: [tab_shadow],
                          ),
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[Recommend(), Circle(phone), Question()],
          ),
        ));
  }
}
