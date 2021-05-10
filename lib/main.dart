import 'package:flutter/material.dart';
import 'package:stars/route/route.dart';

void main() {
  runApp(MyApp());
}

///newSignIn
///userInfo
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          highlightColor: Color.fromRGBO(0, 0, 0, 0),
          splashColor: Color.fromRGBO(0, 0, 0, 0),
          fontFamily: "MuYao",
          accentColor: Colors.red),
      initialRoute: '/newSignIn',
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
