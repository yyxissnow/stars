import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stars/route/route.dart';

class Reminder extends StatefulWidget {
  Reminder({Key key}) : super(key: key);

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(211, 243, 198, 1),
          title: Container(
            child: Text("备忘录"),
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
                  //return PrivateAddDialog();
                  return null;
                });
          },
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Color.fromRGBO(242, 209, 147, 1),
        ),
        body: reminder.length == 0 ? reminderNoTig() : reminderPage(context));
  }
}

Widget reminderPage(context) {
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
          itemCount: reminder.length,
          itemBuilder: (context, index) {
            return Slidable(
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 3, 8, 3),
                child: Card(
                  shadowColor: Color.fromRGBO(253, 253, 255, 0.9),
                  //color: Color.fromRGBO(253, 253, 255, 0.9),
                  color: Colors.transparent,
                  margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(50, 5, 0, 5),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  reminder[index]["content"],
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "记录时间  ",
                                        style: TextStyle(
                                          color: Colors.grey[200],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        //"时间截止  $time",
                                        formatDate(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                reminder[index]["time"]),
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
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
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
