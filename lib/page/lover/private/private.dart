import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stars/route/route.dart';
import 'package:stars/control/control.dart';
import 'package:stars/widget/dialog/privateDiaglog.dart';

class PrivateChat extends StatefulWidget {
  PrivateChat({Key key}) : super(key: key);

  @override
  _PrivateChatState createState() => _PrivateChatState();
}

class _PrivateChatState extends State<PrivateChat> {
  @override
  void initState() {
    super.initState();
    getPrivate();
  }

  Future getPrivate() async {
    // if (my["love_id"] is String) {
    //   print("object");
    // }
    var data = await privateChatGet(my["love_id"]);
    if (data != null) {
      //print(data);
      private.clear();
      for (dynamic item in data) {
        setState(() {
          String avatar = item["avatar"];
          avatar = avatar.substring(5, avatar.length);
          private.add({
            "id": item["id"],
            "name": item["name"],
            "avatar": address + ":8101/static" + avatar,
            "content": item["content"],
            "time": item["time"] * 1000
          });
        });
      }
      //print(private);
    }
  }

  Widget privateNoTig() {
    return Container(
      child: Center(
        child: Text(
          "还没有悄悄话，记得添加哦！",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(211, 243, 198, 1),
          title: Container(
            child: Text("悄悄话"),
          ),
          centerTitle: true,
          leading: Container(
              child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            onPressed: () {
              // Navigator.pop(context); // 关闭当前页面
              Navigator.pushNamed(context, "/");
            },
          )),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "这是个tag_private",
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return PrivateAddDialog();
                });
          },
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Color.fromRGBO(242, 209, 147, 1),
        ),
        body: private.length == 0 ? privateNoTig() : privatePage(context));
  }
}

Widget privatePage(context) {
  return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height,
      //height: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/chou_bo_ji.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: private.length,
          itemBuilder: (context, index) {
            return Slidable(
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 3, 8, 3),
                child: Card(
                  shadowColor: Color.fromRGBO(253, 253, 255, 0.9),
                  //color: Color.fromRGBO(253, 253, 255, 0.9),
                  color: Colors.transparent,
                  //color: Color.fromRGBO(254, 245, 238, 1),
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
                                    private == null
                                        ? "http://172.20.10.13:9001/static/avatarImg/2020-11-15_17381366118.png"
                                        : private[index]["avatar"],
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 8, 0, 0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      private == null
                                          ? "snow"
                                          : private[index]["name"],
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      formatDate(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              private[index]["time"]),
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
                                        color: Colors.black45,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(8, 12, 3, 7),
                          alignment: Alignment.topLeft,
                          child: Text(
                            private == null
                                ? "这是一个小秘密哦"
                                : private[index]["content"],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actionPane: SlidableScrollActionPane(),
              //actionExtentRatio: 0.25,
              secondaryActions: <Widget>[
                //右侧按钮列表
                IconSlideAction(
                  caption: '编辑',
                  color: Colors.blue[200],
                  icon: Icons.more_horiz,
                  onTap: () => null,
                ),
                IconSlideAction(
                  caption: '删除',
                  color: Colors.red[200],
                  icon: Icons.delete,
                  closeOnTap: false,
                  onTap: () {},
                ),
              ],
            );
          },
        ),
      )
      // child: Container(
      //   margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      //   child: Column(
      //     children: <Widget>[
      //       InkWell(
      //         child: Container(
      //           child: Card(
      //             shadowColor: Color.fromRGBO(253, 253, 255, 0.9),
      //             //color: Color.fromRGBO(253, 253, 255, 0.9),
      //             color: Colors.transparent,
      //             //color: Color.fromRGBO(254, 245, 238, 1),
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10)),
      //             child: Container(
      //               child: Column(
      //                 children: <Widget>[
      //                   Row(
      //                     children: <Widget>[
      //                       Container(
      //                         alignment: Alignment.topLeft,
      //                         margin: EdgeInsets.fromLTRB(8, 5, 0, 0),
      //                         child: ClipOval(
      //                           child: Image.network(
      //                               my == null
      //                                   ? "http://172.20.10.13:9001/static/avatarImg/2020-11-15_17381366118.png"
      //                                   : my["avatar"],
      //                               height: 30,
      //                               width: 30,
      //                               fit: BoxFit.cover),
      //                         ),
      //                       ),
      //                       Container(
      //                         margin: EdgeInsets.fromLTRB(10, 8, 0, 0),
      //                         child: Column(
      //                           children: <Widget>[
      //                             Text(
      //                               my == null ? "snow" : my["name"],
      //                               style: TextStyle(
      //                                 color: Colors.black54,
      //                                 fontSize: 15,
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Container(
      //                     margin: EdgeInsets.fromLTRB(8, 12, 3, 7),
      //                     alignment: Alignment.topLeft,
      //                     child: Text(
      //                       "等你研究生毕业",
      //                       overflow: TextOverflow.ellipsis,
      //                       maxLines: 3,
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 18,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 15,
      //       ),
      //     ],
      //   ),
      // ),
      );
}
