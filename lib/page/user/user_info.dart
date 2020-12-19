import 'package:flutter/material.dart';
import 'package:stars/page/tabs/lover/loverInfo/cicle/circle.dart';
import 'package:stars/page/tabs/lover/loverInfo/question/question.dart';
import 'package:stars/route/route.dart';

class UserInfo extends StatefulWidget {
  UserInfo({Key key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> with TickerProviderStateMixin {
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg_4.jpg"), fit: BoxFit.cover)),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        size: 40,
                        color: Color.fromRGBO(140, 204, 202, 1),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 90, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: ClipOval(
                          child: Image.network(
                              my == null
                                  ? "images/boji_girl.png"
                                  : my["avatar"],
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 8),
                        child: Image.asset(
                          "images/love_jian.png",
                          fit: BoxFit.cover,
                          height: 50,
                          width: 150,
                        ),
                      ),
                      Container(
                        child: ClipOval(
                          child: Image.network(
                              my == null ? "images/boji_boy.png" : my["avatar"],
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 160, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Jupiter",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.cake,
                                color: Colors.pink,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "5月13日",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                "关注 8",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Text(
                                "粉丝 20",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(8, 0, 8, 10),
            child: TabBar(
              indicator: BoxDecoration(
                color: Color.fromRGBO(140, 204, 202, 1),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              unselectedLabelColor: Colors.black,
              labelColor: Colors.green[100],
              indicatorColor: Colors.green[100],
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  text: "她的主页",
                ),
                Tab(
                  text: "她的Q&A",
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Container(
                  child: Circle(),
                ),
                Container(
                  child: Question(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
