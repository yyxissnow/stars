import 'package:flutter/material.dart';
import 'package:stars/route/route.dart';

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
                                Container(
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
                                            "369",
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
                              color: Color.fromRGBO(237, 248, 254, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            )),
                        //

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
                                    child: Icon(Icons.event_note),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(234, 175, 111, 1)),
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
                                            "67",
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
                      ],
                    ),
                    //
                    SizedBox(
                      height: 10,
                    ),
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
                                    child: Icon(Icons.people_outline),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 153, 219, 1)),
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(0, 2, 20, 2),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "访客",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "48",
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
                              color: Colors.pink[50],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            )),
                        //
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
                                            "67",
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
                          "我的文章",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(children: <Widget>[
                        Container(
                            child: Text(
                          "更多",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        )),
                        Container(
                          child: Icon(Icons.arrow_right),
                        )
                      ]),
                    )
                  ],
                ),
              ),
              //
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        child: Card(
                          color: Color.fromRGBO(254, 245, 238, 1),
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
                                                ? "http://172.20.10.13:9001/static/avatarImg/2020-11-15_17381366118.png"
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
                                  margin: EdgeInsets.fromLTRB(8, 5, 3, 5),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "同样秒回消息，显示尊重。 如果一个男孩子总是会秒回你的消息，时时刻刻关心你的生活，经常都会主动找你聊天，就算是有一搭没一搭的陪着你说话，那他的心里一定是有你的。 那么，你作为女生同样也应该第一时间",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
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
                                            color: Color.fromRGBO(
                                                140, 204, 202, 1),
                                          ),
                                          Text(
                                            "35",
                                            style: TextStyle(
                                                color: Colors.black54),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "666 评论",
                                            style: TextStyle(
                                                color: Colors.black54),
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
                          color: Color.fromRGBO(254, 245, 238, 1),
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
                                                ? "http://172.20.10.13:9001/static/avatarImg/2020-11-15_17381366118.png"
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
                                  margin: EdgeInsets.fromLTRB(8, 5, 3, 5),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "给对方神秘感 在喜欢的人面前保留最完美的样子是一件必须去维持的事情，就像是谈恋爱永远不要太快，感情和人是一样的，永远要保留神秘感。 不要一开始就把所有扑到对方身上，以至于在后来的相处过程中好感慢慢",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
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
                                            color: Color.fromRGBO(
                                                140, 204, 202, 1),
                                          ),
                                          Text(
                                            "65",
                                            style: TextStyle(
                                                color: Colors.black54),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "527 评论",
                                            style: TextStyle(
                                                color: Colors.black54),
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
      ),
    ));
  }
}
