import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stars/control/control.dart';
import 'package:stars/page/lover/wish/query.dart';
import 'package:stars/route/route.dart';
import 'package:stars/widget/wiget/myWidget.dart';
import 'package:stars/class/myClass.dart';

class WishQueryNo extends StatefulWidget {
  WishQueryNo({Key key}) : super(key: key);

  @override
  _WishQueryNoState createState() => _WishQueryNoState();
}

class _WishQueryNoState extends State<WishQueryNo> {
  @override
  void initState() {
    super.initState();
    loading();
  }

  Future getList() async {
    var data = await wishNoGet(my["love_id"]);
    if (data != null) {
      wishNo.clear();
      for (dynamic item in data) {
        setState(() {
          //wishNo.清空数组
          wishNo.add({
            "id": item["id"],
            "content": item["content"],
            "time": item["time"] * 1000
          });
        });
      }
      // print(wishNo);
    }
  }

  void loading() {
    getList().then((value) {
      setState(() {});
    }).timeout(Duration(milliseconds: 15000), onTimeout: () {
      setState(() {
        //displayText = true;
      });
    });
  }

  Widget wishNoTig() {
    return Container(
      child: Center(
        child: Text(
          "还没有未完成心愿，记得添加哦！",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return wishNo.length == 0
        ? wishNoTig()
        : Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
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
                PrivateTopBar(),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 8),
                    child: ListView.builder(
                        itemCount: wishNo.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            child: wishInfoCard(
                                context,
                                false,
                                wishNo[index]["id"],
                                wishNo[index]["content"],
                                wishNo[index]["time"]),
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
                        }),
                  ),
                )
              ],
            ));
  }
}
