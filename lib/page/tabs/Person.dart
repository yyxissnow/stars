import 'package:flutter/material.dart';
import 'package:stars/route/route.dart';
//import 'package:stars/control/control.dart';

class PersonPage extends StatefulWidget {
  PersonPage({Key key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  // void initState() {
  //   loading();
  //   super.initState();
  // }

  // void loading() {
  //   infoGet().then((data) {
  //     if (data != null) {
  //       String avatar = data["avatar"];
  //       avatar = avatar.substring(5, avatar.length);
  //       setState(() {
  //         my = new Map();
  //         my["avatar"] = "http://172.20.10.13:8080/static" + avatar;
  //         my["name"] = data["name"];
  //         my["id"] = data["id"];
  //         my["phone"] = data["phone"];
  //         my["gender"] = data["gender"];
  //         my["age"] = data["age"].toString();
  //       });
  //     }
  //   });
  // }

  Widget _list(int number, String subtitle) {
    return Expanded(
      flex: 1,
      child: InkWell(
          highlightColor: Color.fromRGBO(0, 0, 0, 0),
          splashColor: Color.fromRGBO(0, 0, 0, 0),
          child: ListTile(
            title: Text(
              "$number",
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black87, fontSize: 13),
            ),
          ),
          onTap: () {
            // Navigator.pushNamed(context, '/relationship',
            //     arguments: {"title": subtitle}).then((value) {
            //   loading();
            // });
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          //color: Color.fromRGBO(140, 204, 202, 1),
          image: DecorationImage(
              image: AssetImage("images/cc.png"),
              alignment: Alignment.topCenter),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    child: Text(
                      "恋爱打卡",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    onTap: () {
                      print("签到成功");
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    child: Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.white,
                    ),
                    onTap: () {
                      print("设置");
                    },
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 35, 8, 0),
              child: Card(
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.only(top: 10),
                      height: 90,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    child: ClipOval(
                                      //自动圆形组件
                                      child: Image.network(
                                          my == null
                                              ? "http://10.110.162.24:9001/static/avatarImg/2020-11-15_15281470929.png"
                                              : my["avatar"],
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    //alignment: Alignment.center,
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          my == null ? "snow" : my["name"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: "XiaoBai",
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 5,
                                        // ),
                                        Text(
                                          my == null
                                              ? "Age:20"
                                              : "Age:${my["age"]}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          // Expanded(
                          //   flex: 1,
                          //   child: Container(
                          //     alignment: Alignment.center,
                          //     //margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
                          //     child: Column(
                          //       children: <Widget>[
                          //         Text(
                          //           my == null ? "snow" : my["name"],
                          //           style: TextStyle(
                          //             color: Colors.black,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 25,
                          //             fontFamily: "XiaoBai",
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: 5,
                          //         ),
                          //         Text(
                          //           my == null ? "Age:20" : "Age:${my["age"]}",
                          //           style: TextStyle(
                          //               fontSize: 16,
                          //               fontWeight: FontWeight.w300),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              //margin: EdgeInsets.fromLTRB(40, 30, 0, 0),
                              alignment: Alignment.center,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "个人空间",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.keyboard_arrow_right),
                                      onPressed: null)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          // _list(my["attentionNum"], "我的赞"),
                          // _list(my["fansNum"], "文章评论"),
                          // _list(my["footprintNum"], "最近来访"),
                          // _list(my["visitNum"], "历史足迹")
                          _list(30, "我的赞"),
                          _list(18, "文章评论"),
                          _list(7, "最近来访"),
                          _list(32, "历史足迹")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 15, 8, 0),
              child: Card(
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    Icons.stars,
                                    size: 30,
                                    //color: Colors.red[200],
                                    //color: Color.fromRGBO(245, 149, 149, 1),
                                    color: Color.fromRGBO(140, 204, 202, 1),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("成为会员"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    Icons.markunread,
                                    size: 30,
                                    //color: Colors.red[200],
                                    color: Color.fromRGBO(140, 204, 202, 1),
                                    //color: Color.fromRGBO(245, 149, 149, 1)
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("我的消息"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    Icons.import_contacts,
                                    size: 30,
                                    //color: Colors.red[200],
                                    color: Color.fromRGBO(140, 204, 202, 1),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("我的贴子"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    Icons.camera,
                                    size: 30,
                                    //color: Colors.red[200],
                                    color: Color.fromRGBO(140, 204, 202, 1),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("我的收藏"),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    Icons.monetization_on,
                                    size: 30,
                                    //color: Colors.red[200],
                                    color: Color.fromRGBO(140, 204, 202, 1),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("我的钱包"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    Icons.donut_small,
                                    size: 30,
                                    //color: Colors.red[200],
                                    color: Color.fromRGBO(140, 204, 202, 1),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("游戏天地"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    Icons.collections,
                                    size: 30,
                                    color: Color.fromRGBO(140, 204, 202, 1),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("智能相册"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Icon(
                                    Icons.local_grocery_store,
                                    size: 30,
                                    // color: Colors.red[200],
                                    color: Color.fromRGBO(140, 204, 202, 1),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text("礼物商城"),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(13, 8, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      "我的文章",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text("更多文章"),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      child: Card(
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.fromLTRB(8, 5, 0, 0),
                                    child: ClipOval(
                                      child: Image.network(
                                          my == null
                                              ? "http://192.168.223.1:8080/static/avatarImg/2020-09-14_5f5ee3b340af86ddf1f7f4fe.png"
                                              : my["avatar"],
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 8, 0, 0),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          my == null
                                              ? "热恋期间的恋爱小技巧"
                                              : my["name"],
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(8, 0, 3, 5),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "同样秒回消息，显示尊重。 如果一个男孩子总是会秒回你的消息，时时刻刻关心你的生活，经常都会主动找你聊天，就算是有一搭没一搭的陪着你说话，那他的心里一定是有你的。 那么，你作为女生同样也应该第一时间",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(fontFamily: "XiaoBai"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.favorite,
                                          color:
                                              Color.fromRGBO(140, 204, 202, 1),
                                        ),
                                        Text(
                                          "35",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "666 评论",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: Container(
                      child: Card(
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.fromLTRB(8, 5, 0, 0),
                                    child: ClipOval(
                                      child: Image.network(
                                          my == null
                                              ? "http://192.168.223.1:8080/static/avatarImg/2020-09-14_5f5ee3b340af86ddf1f7f4fe.png"
                                              : my["avatar"],
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 8, 0, 0),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          my == null
                                              ? "什么样的恋爱陌生最舒服"
                                              : my["name"],
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(8, 0, 3, 5),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "给对方神秘感 在喜欢的人面前保留最完美的样子是一件必须去维持的事情，就像是谈恋爱永远不要太快，感情和人是一样的，永远要保留神秘感。 不要一开始就把所有扑到对方身上，以至于在后来的相处过程中好感慢慢",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(fontFamily: "XiaoBai"),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.favorite,
                                          color:
                                              Color.fromRGBO(140, 204, 202, 1),
                                        ),
                                        Text(
                                          "65",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "527 评论",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class DrawerPerson extends StatefulWidget {
  DrawerPerson({Key key}) : super(key: key);

  @override
  _DrawerPersonState createState() => _DrawerPersonState();
}

class _DrawerPersonState extends State<DrawerPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人"),
      ),
      body: Text("个人信息页"),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: UserAccountsDrawerHeader(
                  accountName: Text(
                    my == null ? "111" : my["name"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  accountEmail: Text(
                    my == null ? "222" : my["phone"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        NetworkImage(my == null ? "" : my["avatar"]),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(my == null ? "" : my["avatar"]),
                        fit: BoxFit.cover),
                  ),
                ))
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text("我的空间"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text("用户中心"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("设置中心"),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
