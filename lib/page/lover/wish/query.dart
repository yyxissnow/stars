import 'package:flutter/material.dart';
import 'package:stars/page/lover/wish/queryNo.dart';
import 'package:stars/page/lover/wish/queryYes.dart';
import 'package:stars/widget/dialog/wishDialog.dart';

class WishQuery extends StatefulWidget {
  WishQuery({Key key}) : super(key: key);

  @override
  _WishQueryState createState() => _WishQueryState();
}

class _WishQueryState extends State<WishQuery> with TickerProviderStateMixin {
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Container(
                child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.orange[300],
                size: 20,
              ),
              onPressed: () {
                //Navigator.pop(context); // 关闭当前页面
                Navigator.pushNamed(context, "/");
              },
            )),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Row(
              children: <Widget>[
                Expanded(
                    child: TabBar(
                  indicatorColor: Colors.orange[100],
                  tabs: <Widget>[
                    Tab(
                      child: Container(
                        child: Text(
                          "进行中",
                          style: TextStyle(
                              fontSize: 20, color: Colors.orange[300]),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "已完成",
                          style: TextStyle(
                              fontSize: 20, color: Colors.orange[300]),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: "这是个tag_wish",
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return WishAddDialog();
                  });
            },
            child: Icon(
              Icons.add,
            ),
            backgroundColor: Colors.orange[200],
          ),
          body: TabBarView(
            children: <Widget>[WishQueryNo(), WishQueryYes()],
          ),
        ));
  }
}

Widget PrivateTopBar() {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
    child: Row(
      children: <Widget>[
        Expanded(
            flex: 6,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      "旅游",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(245, 246, 250, 1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      "生活",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(245, 246, 250, 1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      "美食",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(245, 246, 250, 1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      "想要做的事",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(245, 246, 250, 1),
                  ),
                ),
              ],
            )),
        Expanded(
            flex: 1,
            child: Container(
              child: Icon(
                Icons.apps,
                color: Colors.orange[300],
              ),
            ))
      ],
    ),
  );
}
