import 'package:flutter/material.dart';
import 'package:stars/page/lover/markday/queryDiary.dart';
import 'package:stars/page/lover/markday/queryRemind.dart';
import 'package:stars/widget/dialog/markDialog.dart';

class MarkDayQuery extends StatefulWidget {
  MarkDayQuery({Key key}) : super(key: key);

  @override
  _MarkDayQueryState createState() => _MarkDayQueryState();
}

class _MarkDayQueryState extends State<MarkDayQuery>
    with TickerProviderStateMixin {
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
                          "纪念日",
                          style: TextStyle(
                              fontSize: 20, color: Colors.orange[300]),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "提醒日",
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
            heroTag: "这是个tag_mark",
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return MarkDialog();
                  });
            },
            child: Icon(
              Icons.add,
            ),
            backgroundColor: Colors.orange[200],
          ),
          body: TabBarView(
            children: <Widget>[DiaryDayQuery(), RemindDayQuery()],
          ),
        ));
  }
}
