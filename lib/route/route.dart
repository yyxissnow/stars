import 'package:flutter/material.dart';
import 'package:stars/page/Tabs.dart';
import 'package:stars/page/lover/memorialize/memorialize.dart';
import 'package:stars/page/lover/private/private.dart';
import 'package:stars/page/lover/reminder/addReminder.dart';
import 'package:stars/page/lover/reminder/queryReminder.dart';
import 'package:stars/page/lover/reminder/reminder.dart';
import 'package:stars/page/lover/wish/query.dart';
import 'package:stars/page/lover/wish/queryNo.dart';
import 'package:stars/page/tabs/NewPerson.dart';
import 'package:stars/page/tabs/home/Home.dart';
import 'package:stars/page/tabs/lover/Lover.dart';
import 'package:stars/page/tabs/Person.dart';
import 'package:stars/page/tabs/lover/loverInfo/cicle/circle.dart';
import 'package:stars/page/tabs/lover/loverInfo/recommend/addArticle.dart';
import 'package:stars/page/tabs/lover/loverInfo/recommend/recommend.dart';
import 'package:stars/page/user/newSignIn/newSignIn.dart';
import 'package:stars/page/user/newSignIn/sign_up_page_2.dart';
import 'package:stars/page/user/signIn.dart';
import 'package:stars/page/user/user_info.dart';

//全局变量token
String token;
//电话
String phone;
//我的信息
var my;
//资源
var arguments = {};
//未完成心愿单列表
List wishNo = [];
//已完成心愿单列表
List wishYes = [];
//收到邀请信息列表
List receiveInfo = [];
//推荐文章列表
List recommendArticle = [];
//个人文章
List oneselfArticle = [];
//悄悄话
List private = [];
//备忘录
List reminder = [];
//纪念日
List memorialize = [
  {"id": 1, "content": "第一次吃火锅", "time": 1607846651000},
  {"id": 2, "content": "第一次一起做蛋糕", "time": 1607846651000},
  {"id": 3, "content": "第一次看电影", "time": 1607846651000}
];

final Map<String, WidgetBuilder> routes = {
  //'/signIn': (context) => SignIn(),
  "/": (context) => TabBars(),
  "/home": (context) => HomePage(),
  "/love": (context) => LovePage(),
  "/person": (context) => PersonPage(),
  '/userInfo': (context, {arguments}) => UserInfo(arguments: arguments),
  "/wish/query": (context) => WishQuery(),
  "/wish/query_no": (context) => WishQueryNo(),
  "/private": (context) => PrivateChat(),
  "/newSignIn": (context) => NewSignIn(),
  "/addArticle": (context) => AddArticle(),
  "/signUp_2": (context) => Sign_up_page_2(),
  "/reminder": (context) => Reminder(),
  "/memorialize": (context) => Memorialize(),
  "/addReminder": (context) => AddReminder(),
  "/queryReminder": (context, {arguments}) =>
      QueryReminder(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
