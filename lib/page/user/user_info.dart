import 'package:flutter/material.dart';
import 'package:stars/page/tabs/lover/loverInfo/cicle/circle.dart';
import 'package:stars/page/tabs/lover/loverInfo/question/question.dart';
import 'package:stars/route/route.dart';

class UserInfo extends StatefulWidget {
  final arguments;
  UserInfo({Key key, this.arguments}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> with TickerProviderStateMixin {
  TabController _tabController;
  dynamic arguments;
  void initState() {
    super.initState();
    arguments = widget.arguments;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          //
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/person_bg_top.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                        child: InkWell(
                          child: Icon(
                            Icons.format_list_bulleted,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 30),
                  child: ClipOval(
                    child: Image.network(
                      arguments == null ? "" : arguments["avatar"],
                      // my == null
                      //     ? "http://172.20.10.13:9001/static/avatarImg/2020-11-15_17381366118.png"
                      //     : my["avatar"],
                      height: 60,
                      width: 60,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 7),
                  child: Text(
                    arguments == null ? "xxx" : arguments["name"],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        decoration: BoxDecoration(
                          color: Colors.orange[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.person_add),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Text("添加关注"),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        decoration: BoxDecoration(
                          color: Colors.orange[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.wc),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Text("恋爱邀请"),
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
          //
          Container(
            margin: EdgeInsets.fromLTRB(8, 0, 8, 10),
            child: TabBar(
              indicator: BoxDecoration(
                color: Color.fromRGBO(224, 252, 226, 1),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              unselectedLabelColor: Colors.black54,
              labelColor: Colors.black,
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
                  child: Circle(arguments["phone"]),
                ),
                Container(
                  child: Question(),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
