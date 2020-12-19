import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stars/class/myClass.dart';
import 'package:stars/control/control.dart';
import 'package:stars/page/tabs/NewPerson.dart';
import 'package:stars/route/route.dart';
import 'tabs/home/Home.dart';
import 'tabs/lover/Lover.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key, this.index = 0}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  List _pageList = [HomePage(), LovePage(), NewPersonPage()];
  // void initState() {
  //   getRecommend();
  //   super.initState();
  //   //getRecommend();
  // }

  // Future getRecommend() async {
  //   var data = await getOneselfArticledGet();
  //   if (data != null) {
  //     //oneselfArticle.clear();
  //     for (dynamic item in data) {
  //       setState(() {
  //         oneselfArticle.add({
  //           "user_avatar": address + ":9002/static/" + item["user_avatar"],
  //           //my["avatar"] = address + ":9001/static" + avatar;
  //           "user_name": item["user_name"],
  //           "content": item["content"],
  //           "time": item["time"] * 1000,
  //           "likes": item["likes"],
  //           "comments": item["comments"],
  //           "picture": item["picture"],
  //         });
  //       });
  //       //print(recommendArticle);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._pageList[this._currentIndex],
      floatingActionButton: Container(
        height: 68,
        width: 68,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.red),
        child: FloatingActionButton(
          child: Icon(Icons.favorite),
          onPressed: () {
            setState(() {
              this._currentIndex = 1;
            });
          },
          backgroundColor: this._currentIndex == 1
              ? Color.fromRGBO(245, 149, 149, 1)
              : Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 30,
        fixedColor: Color.fromRGBO(245, 149, 149, 1),
        // selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "我们",
                style: TextStyle(
                  fontFamily: "XiaoBai",
                ),
              )),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("广场",
                style: TextStyle(
                  fontFamily: "XiaoBai",
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("个人",
                style: TextStyle(
                  fontFamily: "XiaoBai",
                )),
          )
        ],
      ),
    );
  }
}

class TabBars extends StatefulWidget {
  TabBars({Key key}) : super(key: key);

  @override
  _TabBarsState createState() => _TabBarsState();
}

class _TabBarsState extends State<TabBars> with SingleTickerProviderStateMixin {
  TabController tabController;

  List _pageList = [HomePage(), LovePage(), NewPersonPage()];
  List colors = [
    Color.fromRGBO(255, 210, 149, 1),
    Color.fromRGBO(255, 210, 149, 1),
    Color.fromRGBO(255, 210, 149, 1),
  ];
  Color color_a = Color.fromRGBO(245, 149, 149, 1);
  Color color_b;
  Color color_c;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3)
      ..addListener(() {
        setState(() {
          currentIndex = tabController.index;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          //buttonBackgroundColor: Color.fromRGBO(245, 149, 149, 1),
          //height: 50,
          height: SizeConfig.screenHeight * 0.085,
          backgroundColor: colors[currentIndex],
          index: currentIndex,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 45,
              color: color_a,
            ),
            Icon(
              Icons.favorite,
              size: 45,
              color: color_b,
            ),
            Icon(
              Icons.account_circle,
              size: 45,
              color: color_c,
            ),
          ],
          onTap: (index) {
            //Handle button tap
            setState(() {
              currentIndex = index;
              if (index == 0) {
                color_a = Color.fromRGBO(245, 149, 149, 1);
              } else {
                color_a = Colors.black;
              }
              if (index == 1) {
                color_b = Color.fromRGBO(245, 149, 149, 1);
              } else {
                color_b = Colors.black;
              }
              if (index == 2) {
                color_c = Color.fromRGBO(245, 149, 149, 1);
              } else {
                color_c = Colors.black;
              }
            });
            tabController.animateTo(index,
                duration: Duration(milliseconds: 100), curve: Curves.ease);
          },
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            _pageList[0],
            _pageList[1],
            _pageList[2],
            // Container(
            //   color: colors[0],
            // ),
            // Container(
            //   color: colors[1],
            // ),
            // Container(
            //   color: colors[2],
            // )
          ],
        ));
  }
}
