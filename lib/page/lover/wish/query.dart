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
            leading: Container(
                // 绘制返回键
                //margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                //margin: EdgeInsets.all(10), // 设置边距
                // decoration: BoxDecoration(
                //   boxShadow: <BoxShadow>[
                //     BoxShadow(
                //       offset: Offset(1, 2), // 阴影起始位置
                //       blurRadius: 5, // 阴影面积
                //       color: Colors.grey.withOpacity(.4), // 阴影透明度
                //     )
                //   ],
                //   color: Color.fromRGBO(120, 232, 214, 1), // Container背景色
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(100.0), // Container设置为圆形
                //   ),
                // ),
                child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
              onPressed: () {
                //Navigator.pop(context); // 关闭当前页面
                Navigator.pushNamed(context, "/");
              },
            )),
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromRGBO(211, 243, 198, 1),
            title: Row(
              children: <Widget>[
                Expanded(
                    child: TabBar(
                  indicatorColor: Colors.green[100],
                  tabs: <Widget>[
                    Tab(
                      child: Container(
                        child: Text(
                          "进行中",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Text(
                          "已完成",
                          style: TextStyle(fontSize: 20),
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
            backgroundColor: Color.fromRGBO(242, 209, 147, 1),
          ),
          body: TabBarView(
            children: <Widget>[WishQueryNo(), WishQueryYes()],
          ),
          // body: Column(
          //   children: <Widget>[
          //     // SizedBox(
          //     //   height: 30,
          //     // ),
          //     // Row(
          //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     //   children: <Widget>[
          //     //     Container(
          //     //       child: IconButton(
          //     //           icon: Icon(
          //     //             Icons.chevron_left,
          //     //             size: 40,
          //     //             color: Color.fromRGBO(140, 204, 202, 1),
          //     //           ),
          //     //           onPressed: () {
          //     //             Navigator.pop(context);
          //     //           }),
          //     //     ),
          //     //     Container(
          //     //       height: 50,
          //     //       width: 150,
          //     //       child: Center(
          //     //         child: Text(
          //     //           "心愿单",
          //     //           style: TextStyle(
          //     //               fontSize: 20, color: Color.fromRGBO(140, 204, 202, 1)),
          //     //         ),
          //     //       ),
          //     //       decoration: BoxDecoration(
          //     //         border: Border.all(
          //     //           color: Color.fromRGBO(140, 204, 202, 1),
          //     //           width: 3,
          //     //         ),
          //     //         borderRadius: BorderRadius.circular(10),
          //     //       ),
          //     //     ),
          //     //     Container(
          //     //       margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
          //     //       height: 35,
          //     //       width: 35,
          //     //       decoration: BoxDecoration(
          //     //         shape: BoxShape.circle,
          //     //         border: Border.all(
          //     //           color: Color.fromRGBO(140, 204, 202, 1),
          //     //           width: 3,
          //     //         ),
          //     //       ),
          //     //       child: Center(
          //     //         child: InkWell(
          //     //           onTap: () {
          //     //             showDialog(
          //     //                 context: context,
          //     //                 builder: (context) {
          //     //                   return WishAddDialog();
          //     //                 });
          //     //           },
          //     //           child: Icon(
          //     //             Icons.add,
          //     //             color: Color.fromRGBO(140, 204, 202, 1),
          //     //           ),
          //     //         ),
          //     //       ),
          //     //     )
          //     //   ],
          //     // ),
          //     SizedBox(
          //       height: 25,
          //     ),
          //     Container(
          //       margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
          //       child: TabBar(
          //         //indicatorSize: TabBarIndicatorSize.label,
          //         //indicatorWeight: 5,
          //         //indicatorWeight: 5,
          //         indicator: BoxDecoration(
          //           color: Color.fromRGBO(140, 204, 202, 1),
          //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
          //         ),
          //         unselectedLabelColor: Colors.black,
          //         labelColor: Colors.green[100],
          //         indicatorColor: Colors.green[100],
          //         controller: _tabController,
          //         tabs: <Widget>[
          //           Tab(
          //             text: "进行中",
          //           ),
          //           Tab(
          //             text: "已完成",
          //           ),
          //         ],
          //       ),
          //     ),
          //     Expanded(
          //       child: TabBarView(
          //         controller: _tabController,
          //         children: <Widget>[
          //           Container(
          //             child: WishQueryNo(),
          //           ),
          //           Container(
          //             child: WishQueryYes(),
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // ),
        ));
  }
}
