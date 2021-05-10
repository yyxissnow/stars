import 'package:flutter/material.dart';
import 'package:stars/page/tabs/lover/loverInfo/cicle/circle.dart';
import 'package:stars/route/route.dart';
import 'package:stars/class/myClass.dart';
import 'package:stars/widget/wiget/myWidget.dart';

class NewPersonPage extends StatefulWidget {
  NewPersonPage({Key key}) : super(key: key);

  @override
  _NewPersonPageState createState() => _NewPersonPageState();
}

class _NewPersonPageState extends State<NewPersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
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
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                      child: InkWell(
                        child: Icon(
                          Icons.format_list_bulleted,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      // alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(top: 50),
                      child: ClipOval(
                        child: Image.network(
                          my == null
                              ? "http://172.20.10.13:9001/static/avatarImg/2020-11-15_17381366118.png"
                              : my["avatar"],
                          height: 70,
                          width: 70,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7),
                      child: Text(
                        my == null ? "Snow" : my["name"],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(13, 0, 13, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Icon(Icons.favorite_border),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(104, 240, 230, 1)),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/get_like");
                                  },
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 2, 20, 2),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              "点赞",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              "0",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                                Container(
                                  child: Icon(Icons.keyboard_arrow_right),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(237, 248, 254, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            )),
                        //

                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/get_comment");
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Icon(Icons.event_note),
                                    ),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(234, 175, 111, 1)),
                                  ),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 2, 20, 2),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              "评论",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              "0",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          )
                                        ],
                                      )),
                                  Container(
                                    child: Icon(Icons.keyboard_arrow_right),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(254, 245, 215, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                        )
                      ],
                    ),
                    //
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, "/get_caller");
                            showDialog(
                                context: context,
                                builder: (context) {
                                  SizeConfig().init(context);
                                  return SimpleDialog(
                                    children: <Widget>[
                                      GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          // 触摸收起键盘
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                        },
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: Center(
                                            child: Container(
                                              height: SizeConfig.screenHeight *
                                                  0.29,
                                              width:
                                                  SizeConfig.screenWidth * 0.85,
                                              //color: Colors.white,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 4),
                                                              child: Text(
                                                                  "恋爱邀请",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                  )),
                                                            )),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: InkWell(
                                                            child: Icon(
                                                                Icons.close),
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(),
                                                  Container(
                                                    child: StatefulBuilder(
                                                      builder:
                                                          (BuildContext context,
                                                              setState) {
                                                        return Container(
                                                            height: 50,
                                                            margin:
                                                                EdgeInsets
                                                                    .fromLTRB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        0),
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey[200],
                                                                borderRadius:
                                                                    BorderRadius.all(
                                                                        Radius.circular(
                                                                            10))),
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(5,
                                                                      0, 5, 0),
                                                              child: TextField(
                                                                //maxLength: 11,
                                                                decoration:
                                                                    InputDecoration(
                                                                  counterText:
                                                                      "",
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "\t\t请输入邀请人电话号码",
                                                                ),
                                                                onChanged:
                                                                    (value) {},
                                                              ),
                                                            ));
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 0, 10),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5),
                                                      alignment:
                                                          Alignment.center,
                                                      height: 30,
                                                      width: 120,
                                                      child: RaisedButton(
                                                        child: Text(
                                                          "发送",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                        color: Colors.blue[200],
                                                        textColor: Colors.white,
                                                        splashColor: Colors.red,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        onPressed: () {
                                                          showMsg("发送成功");
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Icon(Icons.people_outline),
                                    ),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(255, 153, 219, 1)),
                                  ),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 2, 20, 2),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              "邀请",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                          // Container(
                                          //   child: Text(
                                          //     "",
                                          //     style: TextStyle(fontSize: 13),
                                          //   ),
                                          // )
                                        ],
                                      )),
                                  Container(
                                    child: Icon(Icons.keyboard_arrow_right),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.pink[50],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                        ),
                        //
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/get_caller");
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Icon(Icons.directions_bike),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(99, 207, 90, 1)),
                                  ),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 2, 20, 2),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              "足迹",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              "0",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          )
                                        ],
                                      )),
                                  Container(
                                    child: Icon(Icons.keyboard_arrow_right),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(231, 251, 224, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
              //
              Container(
                margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(231, 251, 224, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                        child: Text(
                          "我的空间",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/userInfo", arguments: {
                          "name": my["name"],
                          "avatar": my["avatar"],
                          "phone": phone,
                        });
                      },
                      child: Container(
                        child: Row(children: <Widget>[
                          Container(
                              child: Text(
                            "进入",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )),
                          Container(
                            child: Icon(Icons.arrow_right),
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              ),
              //
              //
              Container(
                child: Card(
                  shadowColor: Color.fromRGBO(253, 253, 255, 0.15),
                  color: Colors.transparent,
                  margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    width: SizeConfig.screenWidth * 0.9,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 5, 5, 3),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Icon(
                                        Icons.account_circle,
                                        color: Colors.orange[300],
                                      ),
                                    ),
                                    Container(
                                      child: Text("浏览统计"),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "昨日阅读量",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                                      child: Text(
                                        "0",
                                        style: TextStyle(fontSize: 28),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "较上日 0 ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.black87,
                                height: 30,
                                width: 1,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 5, 20, 5),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "昨日点赞数",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                                      child: Text(
                                        "0",
                                        style: TextStyle(fontSize: 28),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "较上日 0 ",
                                        style: TextStyle(color: Colors.grey),
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
                ),
              ),
              Container(
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/agreement");
                    },
                    child: Text(
                      "隐私政策和用户协议",
                      style: TextStyle(
                        color: Colors.blue[400],
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
