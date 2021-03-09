import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stars/route/route.dart';
import 'package:stars/control/control.dart';
import 'package:stars/class/myClass.dart';

class Reminder extends StatefulWidget {
  Reminder({Key key}) : super(key: key);
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  void initState() {
    super.initState();
    //loading();
    getList();
  }

  Future getList() async {
    var data = await getReminder(my["phone"]);
    if (data != null) {
      reminder.clear();
      for (dynamic item in data) {
        setState(() {
          //wishNo.清空数组
          reminder.add({
            "id": item["id"],
            "title": item["title"],
            "content": item["content"],
            "time": item["time"] * 1000
          });
        });
      }
    }
  }

  // void loading() {
  //   getList().then((value) {
  //     setState(() {});
  //   }).timeout(Duration(milliseconds: 15000), onTimeout: () {
  //     setState(() {
  //       //displayText = true;
  //     });
  //   });
  // }

  @override
  Widget reminderNoTig() {
    return Container(
      child: Center(
        child: Text(
          "还没有备忘事，记得添加哦！",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  @override
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
            alignment: Alignment.centerLeft,
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.orange[300],
                        size: 19,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "首页",
                        style:
                            TextStyle(fontSize: 19, color: Colors.orange[300]),
                        maxLines: 1,
                      ),
                    ),
                  ],
                )),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.more_vert,
                size: 22,
                color: Colors.orange[300],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "这是个tag_private",
          onPressed: () {
            Navigator.pushNamed(context, "/addReminder");
          },
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Colors.orange[200],
        ),
        body: reminder.length == 0 ? reminderNoTig() : reminderPage(context));
  }
}

Widget reminderPage(context) {
  return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height,
      //height: double.maxFinite,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("images/chou_bo_ji.png"),
      //     fit: BoxFit.fill,
      //   ),
      // ),
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Container(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "备忘录",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Container(
                height: SizeConfig.screenHeight * 0.05,
                width: SizeConfig.screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        icon: new Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: "搜索",
                        border: InputBorder.none),
                  ),
                )),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: InkWell(
                    child: Icon(
                      Icons.view_list,
                      size: 25,
                      color: Colors.orange[300],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "按创建日期排序",
                          style: TextStyle(
                              color: Colors.orange[300], fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 22,
                            color: Colors.orange[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            //margin: EdgeInsets.only(top: 10),
            child: ListView.builder(
              shrinkWrap: true, //指定高度可扩张
              // physics: NeverScrollableScrollPhysics(),
              itemCount: reminder.length,
              itemBuilder: (context, index) {
                return Slidable(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Card(
                        shadowColor: Color.fromRGBO(253, 253, 255, 0.3),
                        //color: Color.fromRGBO(253, 253, 255, 0.9),
                        color: Colors.transparent,
                        margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/queryReminder",
                                arguments: {
                                  "id": reminder[index]["id"],
                                  "title": reminder[index]["title"],
                                  "content": reminder[index]["content"],
                                  "time": reminder[index]["time"],
                                });
                          },
                          child: Container(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Text(
                                      reminder[index]["title"],
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    //width: double.maxFinite,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            formatDate(
                                                DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        reminder[index]
                                                            ["time"]),
                                                [
                                                  yyyy,
                                                  '-',
                                                  mm,
                                                  '-',
                                                  dd,
                                                ]),
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text(
                                            reminder[index]["content"].trim(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[500],
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
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
          ))
        ],
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
