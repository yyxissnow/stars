import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stars/class/myClass.dart';
import 'package:stars/route/route.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> with TickerProviderStateMixin {
  String _content;
  WebSocket _webSocket;

  void main() async {
    // ignore: close_sinks
    //String s = "{id:1,userid:2,dstid:3,cmd:10,media:1,content:\"hello\"}";
    // Map<String, dynamic> m1 = {
    //   "id": 1,
    //   "userid": 3,
    //   "recv_user_id": 3,
    //   "cmd": 10,
    //   "media": 1,
    //   "content": "hello"
    // };

    // ignore: close_sinks
    _webSocket = await WebSocket.connect(
        "ws://49.235.16.118:8009/stars/privateChat/chat?id=" + id.toString());
    //监听函数
    _webSocket.listen(_onReceive, onDone: () {
      print('连接关闭时响应');
    }, onError: (error) {
      print('发生错误');
    }, cancelOnError: true);
    // _webSocket.add(jsonEncode(m1));
  }

  void _onReceive(data) {
    Map<String, dynamic> res = jsonDecode(data);
    // print(data);
    Map<String, dynamic> m = {
      "name": res["send_user_name"],
      // "userid": 3,
      "avatar": my["lover_avatar"],
      // "recv_user_id": 3,
      "content": res["content"]
    };
    setState(() {
      chatMessage.add(m);
    });
    print("收到服务器数据:" + m.toString() + " " + my["name"]);
  }

  // AnimationController controller;
  // Animation<double> animation;
  // final TextEditingController _textController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    main();
    // controller =
    //     AnimationController(vsync: this, duration: Duration(seconds: 2));
    // animation = Tween<double>(begin: 0, end: 150).animate(controller);
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          // backgroundColor: Color.fromRGBO(255, 210, 149, 1),
          backgroundColor: Colors.white,
          titleSpacing: 0,
          title: Container(
            child: Text(
              "悄悄话",
              style: TextStyle(color: Colors.orange[300]),
            ),
          ),
          centerTitle: true,

          leading: Container(
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.orange[300],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  })),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: Text(
                "留言",
                style: TextStyle(color: Colors.grey[600], fontSize: 17),
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   heroTag: "这是个tag_private",
        //   onPressed: () {
        //     Navigator.pushNamed(context, "/addReminder");
        //   },
        //   child: Icon(
        //     Icons.add,
        //   ),
        //   backgroundColor: Colors.orange[200],
        // ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // 触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 0.2,
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        itemCount: chatMessage.length,
                        itemBuilder: (context, index) {
                          return chatMessage[index]["name"] == my["name"]
                              ? isMyPrivate(chatMessage[index])
                              : noMyPrivate(chatMessage[index]);
                        },
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: Container(
                                margin: EdgeInsets.only(left: 5),
                                height: SizeConfig.screenHeight * 0.05,
                                width: SizeConfig.screenWidth * 0.9,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(245, 246, 250, 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: TextFormField(
                                    onChanged: (vakue) {
                                      _content = vakue;
                                    },
                                    decoration: new InputDecoration(
                                        icon: new Icon(
                                          Icons.edit,
                                          color: Colors.grey,
                                          size: 20,
                                        ),
                                        hintText: "写个悄悄话吧…",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400]),
                                        border: InputBorder.none),
                                  ),
                                )),
                          ),
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    chatMessage.add({
                                      "name": my["name"],
                                      "avatar": my["avatar"],
                                      "content": _content,
                                    });
                                  });
                                  // _textController.clear();
                                  Map<String, dynamic> m = {
                                    "user_id": my["id"],
                                    "recv_user_id": my["lover_id"],
                                    "send_user_name": my["name"],
                                    "cmd": 10,
                                    "media": 1,
                                    "content": _content,
                                  };
                                  _webSocket.add(jsonEncode(m));
                                  // _content = "";
                                  // setState(() {
                                  //   chatMessage.add({
                                  //     "name": my["name"],
                                  //     "content": _content,
                                  //   });
                                  // });
                                  // controller.forward();
                                  //verify(_content, context);
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.sms,
                                    color: Color.fromRGBO(153, 157, 178, 1),
                                  ),
                                ),
                              ))
                        ],
                      )),
                ],
              )),
        ));
  }

//   Widget chat(context) {
//     SizeConfig().init(context);
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTap: () {
//         // 触摸收起键盘
//         FocusScope.of(context).requestFocus(FocusNode());
//       },
//       child: Container(
//           width: double.maxFinite,
//           height: MediaQuery.of(context).size.height,
//           color: Colors.white,
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 0.2,
//                 child: Container(
//                   color: Colors.black12,
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 10),
//                   child: ListView.builder(
//                     itemCount: chatMessage.length,
//                     itemBuilder: (context, index) {
//                       return chatMessage[index]["name"] != my["name"]
//                           ? noMyPrivate(chatMessage[index])
//                           : isMyPrivate(chatMessage[index]);
//                     },
//                   ),
//                 ),
//               ),
//               Container(
//                   margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(
//                         flex: 10,
//                         child: Container(
//                             margin: EdgeInsets.only(left: 5),
//                             height: SizeConfig.screenHeight * 0.05,
//                             width: SizeConfig.screenWidth * 0.9,
//                             decoration: BoxDecoration(
//                               color: Color.fromRGBO(245, 246, 250, 1),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Container(
//                               margin: EdgeInsets.only(left: 10),
//                               child: TextFormField(
//                                 onChanged: (vakue) {
//                                   //_content = vakue;
//                                 },
//                                 decoration: new InputDecoration(
//                                     icon: new Icon(
//                                       Icons.edit,
//                                       color: Colors.grey,
//                                       size: 20,
//                                     ),
//                                     hintText: "写个悄悄话吧…",
//                                     hintStyle:
//                                         TextStyle(color: Colors.grey[400]),
//                                     border: InputBorder.none),
//                               ),
//                             )),
//                       ),
//                       Expanded(
//                           flex: 1,
//                           child: InkWell(
//                             onTap: () {
//                               setState(() {
//                                 chatMessage
//                                     .add({"name": "Snow", "content": "lalala"});
//                               });

//                               //verify(_content, context);
//                             },
//                             child: Container(
//                               child: Icon(
//                                 Icons.sms,
//                                 color: Color.fromRGBO(153, 157, 178, 1),
//                               ),
//                             ),
//                           ))
//                     ],
//                   )),
//             ],
//           )),
//     );
//   }
// }

  Widget noMyPrivate(dynamic chat) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        children: <Widget>[
          // Container(
          //   child: Text(
          //       displayTime(DateTime.fromMillisecondsSinceEpoch(chat["time"]))),
          // ),
          Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 2, 0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(chat["avatar"]),
                      radius: 15,
                    ),
                  ),
                  Card(
                    shadowColor: Color.fromRGBO(253, 253, 255, 0.5),
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(8, 5, 5, 5),
                      alignment: Alignment.topLeft,
                      child: Text(
                        chat["content"],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget isMyPrivate(dynamic chat) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 10, 8),
      child: Column(
        children: <Widget>[
          // Container(
          //   child: Text(
          //       displayTime(DateTime.fromMillisecondsSinceEpoch(chat["time"]))),
          // ),
          Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Card(
                    shadowColor: Color.fromRGBO(253, 253, 255, 0.5),
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(8, 5, 5, 5),
                      alignment: Alignment.topLeft,
                      child: Text(
                        chat["content"],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 2, 0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(chat["avatar"]),
                      radius: 15,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
