import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:stars/route/route.dart';
import 'package:stars/control/control.dart';
import 'package:date_format/date_format.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool _isExpanded_1 = false;
  bool _isExpanded_2 = false;
  bool _isExpanded_3 = false;
  @override
  void initState() {
    super.initState();
    loading();
  }

  Future loading() async {
    var data = await getMessage();

    if (data != null) {
      receiveInfo.clear();
      for (dynamic item in data) {
        setState(() {
          //wishNo.清空数组
          receiveInfo.add({
            "name": item["name"],
            "content": item["content"],
            "time": item["time"] * 1000,
            "avatar": item["avatar"],
          });
        });
      }
    }
    //print(receiveInfo);
  }

  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        //color: Colors.cyan,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                //渐变位置
                begin: Alignment.topCenter, //右上
                end: Alignment.bottomCenter, //左下
                stops: [
              0.0,
              1.0
            ], //[渐变起始点, 渐变结束点]
                //渐变颜色[始点颜色, 结束颜色]
                colors: [
              Color.fromRGBO(112, 225, 245, 1),
              Color.fromRGBO(255, 210, 149, 1),
            ])),
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(140, 204, 202, 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  width: double.maxFinite,
                  //color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: UserAccountsDrawerHeader(
                            accountName: Text(
                              my == null ? "111" : my["name"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            accountEmail: Text(
                              my == null ? "222" : my["phone"],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            currentAccountPicture: CircleAvatar(
                              backgroundImage: NetworkImage(my == null
                                  ? "http://172.20.10.13:9001/static/avatarImg/2020-11-15_15281470929.png"
                                  : my["avatar"]),
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.white.withOpacity(0.5),
                                      BlendMode.color),
                                  image: NetworkImage(my == null
                                      ? "http://172.20.10.13:9001/static/avatarImg/2020-11-15_15281470929.png"
                                      : my["avatar"]),
                                  fit: BoxFit.cover),
                            ),
                          ))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 70, 0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                //color: Color.fromRGBO(140, 204, 202, 1),
                                //color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: ExpansionPanelList(
                                // 点击折叠按钮实现面板的伸缩
                                expansionCallback:
                                    (int panelIndex, bool isExpanded) {
                                  setState(() {
                                    _isExpanded_1 = !isExpanded;
                                  });
                                },
                                children: [
                                  ExpansionPanel(
                                    headerBuilder: (BuildContext context,
                                        bool isExpanded) {
                                      return Container(
                                        //color: Colors.cyan,
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            child: Icon(
                                              Icons.adb,
                                              color: Colors.white,
                                            ),
                                            backgroundColor: Color.fromRGBO(
                                                167, 219, 208, 1),
                                          ),
                                          title: Text("系统消息"),
                                        ),
                                      );
                                    },
                                    body: Container(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: receiveInfo.length,
                                          itemBuilder: (context, index) {
                                            return FlipCard(
                                                front: Container(
                                                  height: 50,
                                                  child: Card(
                                                    child: Container(
                                                        //color: Colors.cyan,
                                                        child: Text(
                                                            receiveInfo == []
                                                                ? "程程"
                                                                : receiveInfo[
                                                                        index]
                                                                    ["name"])),
                                                  ),
                                                ),
                                                back: Container(
                                                  height: 50,
                                                  child: Card(
                                                    child: Container(
                                                      child: Text(receiveInfo ==
                                                              []
                                                          ? "程程"
                                                          : receiveInfo[index]
                                                              ["content"]),
                                                    ),
                                                  ),
                                                ));
                                          }),
                                    ),
                                    isExpanded:
                                        _isExpanded_1, // 设置面板的状态，true展开，false折叠
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                //color: Color.fromRGBO(140, 204, 202, 1),
                                //color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: ExpansionPanelList(
                                // 点击折叠按钮实现面板的伸缩
                                expansionCallback:
                                    (int panelIndex, bool isExpanded) {
                                  setState(() {
                                    _isExpanded_2 = !isExpanded;
                                  });
                                },
                                children: [
                                  ExpansionPanel(
                                    headerBuilder: (BuildContext context,
                                        bool isExpanded) {
                                      return Container(
                                        //color: Colors.cyan,
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Color.fromRGBO(
                                                182, 218, 198, 1),
                                            child: Icon(
                                              Icons.people,
                                              color: Colors.white,
                                            ),
                                          ),
                                          title: Text("邀请消息"),
                                        ),
                                      );
                                    },
                                    body: Container(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: receiveInfo.length,
                                          itemBuilder: (context, index) {
                                            return FlipCard(
                                                front: Container(
                                                  height: 65,
                                                  child: Card(
                                                    color: Color.fromRGBO(
                                                        254, 245, 238, 1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    child: Container(
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            height: 50,
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    5, 0, 0, 0),
                                                            child: ClipOval(
                                                              //radius: 25,
                                                              child:
                                                                  Image.network(
                                                                receiveInfo[
                                                                        index]
                                                                    ["avatar"],
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    3, 3, 3, 3),
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child: Text(receiveInfo ==
                                                                          []
                                                                      ? "程程"
                                                                      : receiveInfo[
                                                                              index]
                                                                          [
                                                                          "name"]),
                                                                ),
                                                                SizedBox(
                                                                  height: 3,
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                    receiveInfo ==
                                                                            []
                                                                        ? "xxx"
                                                                        : formatDate(
                                                                            DateTime.fromMillisecondsSinceEpoch(receiveInfo[index]["time"]),
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
                                                                    // receiveInfo[
                                                                    //         index]
                                                                    //     [
                                                                    //     "time"]
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                back: Container(
                                                  height: 65,
                                                  child: Card(
                                                    color: Color.fromRGBO(
                                                        254, 245, 238, 1),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    child: Container(
                                                        child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Text(
                                                              receiveInfo == []
                                                                  ? "Hello World"
                                                                  : receiveInfo[
                                                                          index]
                                                                      [
                                                                      "content"]),
                                                        ),
                                                        // SizedBox(
                                                        //   height: 5,
                                                        // ),
                                                        Container(
                                                          height: 22,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: <Widget>[
                                                              Container(
                                                                child:
                                                                    RaisedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  child: Text(
                                                                      "接受"),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                  color: Colors
                                                                      .blue,
                                                                  splashColor:
                                                                      Colors
                                                                          .red,
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    RaisedButton(
                                                                  onPressed:
                                                                      () {},
                                                                  child: Text(
                                                                      "拒绝"),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                  color: Colors
                                                                      .red,
                                                                  splashColor:
                                                                      Colors
                                                                          .blue,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                                  ),
                                                ));
                                          }),
                                    ),
                                    isExpanded:
                                        _isExpanded_2, // 设置面板的状态，true展开，false折叠
                                  ),
                                ],
                              ),
                            ),
                            // ExpansionPanelList(
                            //   // 点击折叠按钮实现面板的伸缩
                            //   expansionCallback:
                            //       (int panelIndex, bool isExpanded) {
                            //     setState(() {
                            //       _isExpanded_2 = !isExpanded;
                            //     });
                            //   },
                            //   children: [
                            //     ExpansionPanel(
                            //       headerBuilder:
                            //           (BuildContext context, bool isExpanded) {
                            //         return ListTile(
                            //           leading: CircleAvatar(
                            //             child: Icon(Icons.people),
                            //           ),
                            //           title: Text("邀请消息"),
                            //         );
                            //       },
                            //       body: Container(
                            //         padding: EdgeInsets.all(16.0),
                            //         width: double.infinity,
                            //         child: Text('Content for Panel A.'),
                            //       ),
                            //       isExpanded:
                            //           _isExpanded_2, // 设置面板的状态，true展开，false折叠
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 5,
                            ),
                            ExpansionPanelList(
                              // 点击折叠按钮实现面板的伸缩
                              expansionCallback:
                                  (int panelIndex, bool isExpanded) {
                                setState(() {
                                  _isExpanded_3 = !isExpanded;
                                });
                              },
                              children: [
                                ExpansionPanel(
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor:
                                            Color.fromRGBO(199, 216, 187, 1),
                                        child: Icon(Icons.feedback,
                                            color: Colors.white),
                                      ),
                                      title: Text("私人消息"),
                                    );
                                  },
                                  body: Container(
                                    padding: EdgeInsets.all(16.0),
                                    width: double.infinity,
                                    child: Text('Content for Panel A.'),
                                  ),
                                  isExpanded:
                                      _isExpanded_3, // 设置面板的状态，true展开，false折叠
                                ),
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
