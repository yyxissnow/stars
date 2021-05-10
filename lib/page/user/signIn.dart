import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
import 'package:stars/page/Tabs.dart';
//import 'package:stars/page/tabs/Home.dart';
import 'package:stars/widget/wiget/myWidget.dart';
import 'package:stars/widget/dialog/netLoadingDialog.dart';
import '../../control/control.dart';
import '../../route/route.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _name;
  String _password;

  // dynamic _loading() {
  //   var body = login(_name, _password);
  //   if (body["code"] == 20000) {
  //     phone = body["data"]["phone"];
  //     infoGet(phone).then((data) {
  //       if (data != null) {
  //         //print(data);
  //         String avatar = data["avatar"];
  //         avatar = avatar.substring(5, avatar.length);
  //         my = new Map();
  //         if (data["actor"] == 1) {
  //           my["day"] = data["day"].toString();
  //           my["lover_name"] = data["lover_name"];
  //         }
  //         setState(() {
  //           //my = new Map();
  //           my["avatar"] = address + ":9001/static" + avatar;
  //           my["name"] = data["name"];
  //           my["id"] = data["id"];
  //           my["phone"] = data["phone"];
  //           my["gender"] = data["gender"];
  //           my["age"] = data["age"].toString();
  //           my["actor"] = data["actor"];
  //           my["love_id"] = data["love_id"];
  //           my["lover_id"] = data["lover_id"];
  //           my["day"] = data["day"].toString();
  //         });
  //         //print(my);
  //       }
  //     });

  //     //sleep(Duration(seconds: 1));
  //     // const timeout = const Duration(seconds: 5);
  //     // print('currentTime=' + DateTime.now().toString()); // 当前时间
  //     // Timer(timeout, null);
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future _loading() async {
    var body = await login(_name, _password);
    if (body["code"] == 20000) {
      await infoGet(id).then((data) {
        //设置等待await 不然会使得_loading销毁的时候infoGet还没有执行完，在setState会报错
        if (data != null) {
          //print(data);
          my = new Map();
          if (data["actor"] == 1) {
            my["day"] = data["day"].toString();
            my["lover_name"] = data["lover_name"];
          }
          setState(() {
            //my = new Map();
            my["avatar"] = data["avatar"];
            my["name"] = data["name"];
            my["id"] = data["id"];
            my["phone"] = data["phone"];
            my["gender"] = data["gender"];
            my["age"] = data["age"].toString();
            my["actor"] = data["actor"];
            my["love_id"] = data["love_id"];
            my["lover_id"] = data["lover_id"];
            my["day"] = data["day"].toString();
          });
          //print(my);
        }
      });

      //sleep(Duration(seconds: 1));
      // const timeout = const Duration(seconds: 5);
      // print('currentTime=' + DateTime.now().toString()); // 当前时间
      // Timer(timeout, null);
      return true;
    } else {
      return false;
    }
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: AnimatedBackground()),
          onBottom(AnimatedWave(
            height: 180,
            speed: 1.0,
          )),
          onBottom(AnimatedWave(
            height: 120,
            speed: 0.9,
            offset: pi,
          )),
          onBottom(AnimatedWave(
            height: 220,
            speed: 1.2,
            offset: pi / 2,
          )),
          Positioned.fill(
            child: Container(
              width: double.maxFinite,
              child: AspectRatio(
                aspectRatio: 2.08 / 3,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment(0, -0.6),
                      child: Container(
                        child: Text(
                          "星辰缘",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment(0, 0.05),
                        child: Container(
                          width: double.maxFinite,
                          child: Image.asset(
                            "images/denglu.png",
                            fit: BoxFit.fitWidth,
                          ),
                        )),
                    Align(
                      alignment: Alignment(0, -0.2),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: double.maxFinite,
                        child: TextField(
                          maxLength: 11,
                          decoration: InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                            icon: Icon(Icons.person_outline),
                            hintText: "请输入你的手机号",
                          ),
                          onChanged: (value) {
                            _name = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment(0, 0.2),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: double.maxFinite,
                        decoration: BoxDecoration(),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.lock_outline),
                            hintText: "请输入你的密码",
                          ),
                          onChanged: (value) {
                            _password = value;
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.475),
                      child: InkWell(
                        child: Container(
                          width: 180,
                          height: 80,
                          child: RaisedButton(
                            child: Text(
                              "登录",
                              style: TextStyle(fontSize: 20),
                            ),
                            color: Colors.blue[200],
                            textColor: Colors.white,
                            splashColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return NetLoadingDialog(
                                      requestCallBack: _loading(),
                                      outsideDismiss: false,
                                    );
                                  }).then((value) {
                                if (value) {
                                  // 登录以后 清空路由
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => TabBars()),
                                      (routers) => routers == null);
                                } else {
                                  showMsg("用户名或密码错误");
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedWave extends StatelessWidget {
  final double height;
  final double speed;
  final double offset;

  AnimatedWave({this.height, this.speed, this.offset = 0.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: height,
        width: constraints.biggest.width,
        child: ControlledAnimation(
            playback: Playback.LOOP,
            duration: Duration(milliseconds: (5000 / speed).round()),
            tween: Tween(begin: 0.0, end: 2 * pi),
            builder: (context, value) {
              return CustomPaint(
                foregroundPainter: CurvePainter(value + offset),
              );
            }),
      );
    });
  }
}

class CurvePainter extends CustomPainter {
  final double value;

  CurvePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = Colors.white.withAlpha(60);
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(
        Duration(seconds: 3),
        ColorTween(begin: Colors.yellow[100], end: Colors.green[100]),
        // ColorTween(begin: Color(0xffD38312), end: Colors.lightBlue.shade900),
      ),
      Track("color2").add(
        Duration(seconds: 3),
        //ColorTween(begin: Color(0xffA83279), end: Colors.blue.shade600),
        ColorTween(
            begin: Color.fromRGBO(254, 179, 123, 1),
            end: Color.fromRGBO(255, 127, 96, 1)),
      )
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}
