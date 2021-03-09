import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:stars/page/tabs/home/loverHome.dart';
import 'package:stars/page/tabs/home/menu.dart';
import 'package:stars/page/tabs/home/singleHome.dart';
//import 'package:stars/page/tabs/Person.dart';
import 'package:stars/route/route.dart';
//import 'package:stars/control/control.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void initState() {
  //   loading();
  //   super.initState();
  // }

  // void loading() {
  //   // infoGet().then((data) {
  //   //   if (data != null) {
  //   //     String avatar = data["avatar"];
  //   //     avatar = avatar.substring(5, avatar.length);
  //   //     my = new Map();
  //   //     if (data["actor"] == 1) {
  //   //       my["day"] = data["day"].toString();
  //   //       my["lover_name"] = data["lover_name"];
  //   //     }
  //   //     setState(() {
  //   //       //my = new Map();
  //   //       my["avatar"] = "http://172.20.10.13:8080/static" + avatar;
  //   //       my["name"] = data["name"];
  //   //       my["id"] = data["id"];
  //   //       my["phone"] = data["phone"];
  //   //       my["gender"] = data["gender"];
  //   //       my["age"] = data["age"].toString();
  //   //       my["actor"] = data["actor"];
  //   //       print(my);
  //   //     });
  //   //   }
  //   // });
  // }

  Container test() {
    //print(my);
    return Container(
      child: Text("出错了"),
    );
  }

  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
      menu: Menu(),
      //menu: new Container(),
      screenSelectedBuilder: (position, controller) {
        return Scaffold(
          // body: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Center(
          //       child: Text("当前页面$position"),
          //     ),
          //     Center(
          //       child: FlatButton(
          //         child: Text("打开抽屉"),
          //         onPressed: () {
          //           controller.toggle();
          //         },
          //       ),
          //     )
          //   ],
          // ),

          body: my == null
              ?
              //loverHome(context, controller)
              //Navigator.pushNamed(context, "/")

              build(context)

              // Container(
              //     child: Center(
              //       child: Text("请访问别处看看"),
              //     ),
              //   )
              : my["actor"] == 0
                  ? singleHome(context, controller)
                  : loverHome(context, controller),

          //body: loverHome(context, controller),
        );
      },
    );
    // return Scaffold(
    //   body: my == null
    //       ? Container(
    //           child: Center(
    //             child: Text("出错了"),
    //           ),
    //         )
    //       : my["actor"] == 0
    //           ? singleHome(context, null)
    //           : loverHome(context, null),
    //   //body: singleHome(context),
    // );
  }
}

// ignore: non_constant_identifier_names
Container HomePages(context, controller) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("images/timg1.gif"),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            child: Container(
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: InkWell(
                    child: Icon(
                      Icons.email,
                      size: 30,
                      color: Colors.grey[100],
                    ),
                    onTap: () {
                      controller.toggle();
                      //DrawerPerson();
                    },
                  )),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                    Container(
                      child: Text(
                          my["actor"] == null
                              ? "待定ing"
                              : my["actor"] == 0 ? "单身ing" : "热恋ing",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.done,
                  size: 30,
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
        )),
        Expanded(
            child: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      my == null ? "boy" : my["name"],
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                  Container(
                    child: Text(
                      my == null ? "girl" : my["lover_name"],
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "已经在一起",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: Text(
                      my == null ? "1" : my["day"],
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      "天",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
        Expanded(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(14, 0, 0, 1),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "双方连续登陆1天",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.place,
                          color: Colors.white,
                        ),
                      ),
                      Text("南充",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.border_color,
                                size: 30,
                                color: Colors.pink[100],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text("写日记"),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.message,
                                size: 30,
                                color: Colors.blue[100],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text("悄悄话"),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/wish/query");
                        },
                        child: Container(
                          height: 100,
                          width: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Icon(
                                  Icons.loyalty,
                                  size: 30,
                                  color: Colors.green[100],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text("心愿单"),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/wish/query");
                        },
                        child: Container(
                          height: 100,
                          width: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Icon(
                                  Icons.content_paste,
                                  size: 30,
                                  color: Colors.purple[100],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text("纪念日"),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
