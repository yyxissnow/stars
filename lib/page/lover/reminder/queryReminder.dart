import 'package:flutter/material.dart';
import 'package:stars/class/myClass.dart';
import 'package:date_format/date_format.dart';
import 'package:stars/route/route.dart';
import 'package:stars/widget/dialog/netLoadingDialog.dart';
import 'package:stars/widget/wiget/myWidget.dart';

class QueryReminder extends StatefulWidget {
  final arguments;
  QueryReminder({Key key, this.arguments}) : super(key: key);

  @override
  _QueryReminderState createState() => _QueryReminderState();
}

class _QueryReminderState extends State<QueryReminder> {
  TextEditingController _title;
  TextEditingController _content;
  dynamic arguments;
  String _new_content;
  String _new_title;
  void initState() {
    super.initState();
    arguments = widget.arguments;
    _title = new TextEditingController(
        text: arguments == null ? "" : arguments["title"]);
    _content = new TextEditingController(
        text: arguments == null ? "" : arguments["content"]);
  }

  _verify() async {
    if (_content != null && _title != null) {
      showDialog(
          context: context,
          builder: (context) {
            return NetLoadingDialog(
              //requestCallBack: addReminder(_title, _content),
              outsideDismiss: false,
            );
          }).then((body) {
        if (body != null && body["code"] == 20000) {
          showMsg("发表成功");
          Navigator.pushNamed(context, "/reminder");
        }
      });
    } else {
      showMsg("请输入标题和内容");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          // backgroundColor: Color.fromRGBO(255, 210, 149, 1),
          backgroundColor: Colors.white,
          titleSpacing: 0,
          title: Container(
            alignment: Alignment.centerLeft,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.orange[300],
                        size: 19,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "备忘录",
                        style:
                            TextStyle(fontSize: 19, color: Colors.orange[300]),
                        maxLines: 1,
                      ),
                    ),
                  ],
                )),
          ),
          actions: <Widget>[
            Container(
              child: InkWell(
                child: Icon(
                  Icons.delete_outline,
                  size: 22,
                  color: Colors.orange[300],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: InkWell(
                child: Icon(
                  Icons.save,
                  size: 22,
                  color: Colors.orange[300],
                ),
                onTap: _verify,
              ),
            ),

            // Container(
            //     padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            //     //margin: EdgeInsets.only(right: 10),
            //     child: InkWell(
            //       child: Container(
            //         width: SizeConfig.screenWidth * 0.18,
            //         // decoration: BoxDecoration(
            //         //     borderRadius: BorderRadius.circular(10),
            //         //     color: Colors.blue[200]),
            //         alignment: Alignment.center,
            //         child: Text(
            //           "完成",
            //           maxLines: 1,
            //           style: TextStyle(fontSize: 19, color: Colors.orange[300]),
            //         ),
            //       ),
            //       //onTap: _verify,
            //     ))
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.grey[100],
          child: Column(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                color: Colors.white,
                child: Text(
                  arguments == null
                      ? ""
                      : formatDate(
                          DateTime.fromMillisecondsSinceEpoch(
                              arguments["time"]),
                          [
                              yyyy,
                              '年',
                              m,
                              '月',
                              d,
                              '日 ',
                              HH,
                              ':',
                              nn,
                              ':',
                              ss
                            ]), //两个mm和dd就是保留两位数
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  controller: _title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    //labelText: "标题",
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  onChanged: (value) {
                    _new_title = value;
                    //print(_new_title);
                  },
                ),
              ),
              Container(
                height: SizeConfig.screenHeight * 0.3,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  controller: _content,
                  style: TextStyle(
                      color: Colors.black54,
                      // fontWeight: FontWeight.bold,
                      fontSize: 18),
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "内容",
                  ),
                  maxLines: null,
                  onChanged: (value) {
                    _new_content = value;
                    //print(_new_content);
                  },
                ),
              ),
              Container(
                color: Colors.white,
                height: SizeConfig.screenHeight * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100],
                      ),
                      margin: EdgeInsets.fromLTRB(
                          10, 0, SizeConfig.screenWidth * 0.25, 0),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2),
                            child: Text("南充 顺庆区"),
                          )
                        ],
                      ),
                    ),

                    //
                    Container(
                      //alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100],
                      ),
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(Icons.camera,
                                color: Colors.orange, size: 18),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2),
                            child: Text("分享"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ))),
      ),
    );
  }
}
