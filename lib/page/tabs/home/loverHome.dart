import 'package:flutter/material.dart';
import 'package:stars/class/myClass.dart';
import 'package:stars/route/route.dart';
import 'package:stars/widget/wiget/myWidget.dart';

//Color homne_font_color = Color.fromRGBO(r, g, b, 1);

Container loverHome(context, controller) {
  var shadow = Shadow(
      color: Colors.black, //颜色
      blurRadius: 1, //虚化
      offset: Offset(3, 3) //偏移
      );

  var boxshaow = BoxShadow(
      color: Colors.orange[200], //颜色
      blurRadius: 1, //虚化
      offset: Offset(2, 2) //偏移
      );
  SizeConfig().init(context);
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("images/bg_1.gif"),
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: InkWell(
                    child: Icon(
                      Icons.email,
                      size: 30,
                      color: Colors.grey[100],
                    ),
                    onTap: () {
                      controller.toggle();
                      //DrawerPerson();
                    },
                  )),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                    Container(
                      child: Text("热恋ing",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.done,
                  size: 30,
                  color: Colors.grey[100],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      my == null ? "boy" : my["name"],
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              color: Colors.black,
                              blurRadius: 1, //虚化
                              offset: Offset(2, 2) //偏移
                              )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                  Container(
                    child: Text(my == null ? "girl" : my["lover_name"],
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [shadow],
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "已经在一起",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [shadow],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: Text(
                      my == null ? "1" : my["day"],
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      "天",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [shadow],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(14, 0, 0, 1),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "双方连续登陆1天",
                    style: TextStyle(
                        fontSize: 15, color: Colors.white, shadows: [shadow]),
                  )),
              Container(
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.place,
                        color: Colors.white,
                      ),
                    ),
                    Text("南充",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            shadows: [shadow]))
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/reminder");
                      },
                      child: Container(
                        height: SizeConfig.screenHeight * 0.13,
                        width: SizeConfig.screenWidth * 0.2,
                        // height: 100,
                        // width: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.border_color,
                                size: 30,
                                color: Colors.pink[100],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "备忘录",
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [boxshaow]),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/chat");
                      },
                      child: Container(
                        height: SizeConfig.screenHeight * 0.13,
                        width: SizeConfig.screenWidth * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.message,
                                size: 30,
                                color: Colors.blue[100],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text("悄悄话"),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [boxshaow]),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/wish/query");
                      },
                      child: Container(
                        height: SizeConfig.screenHeight * 0.13,
                        width: SizeConfig.screenWidth * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.loyalty,
                                size: 30,
                                color: Colors.green[100],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text("心愿单"),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [boxshaow]),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //showMsg("功能暂未开放 敬请期待");
                        Navigator.pushNamed(context, "/memorialize");
                      },
                      child: Container(
                        height: SizeConfig.screenHeight * 0.13,
                        width: SizeConfig.screenWidth * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.content_paste,
                                size: 30,
                                color: Colors.purple[100],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text("纪念日"),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [boxshaow]),
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
  );
}
