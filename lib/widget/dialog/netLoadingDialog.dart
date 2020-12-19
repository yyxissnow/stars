import 'package:flutter/material.dart';
import 'package:stars/widget/wiget/myWidget.dart';

class NetLoadingDialog extends StatefulWidget {
  String loadingText;
  bool outsideDismiss;
  Function dismissCallback;
  Future<dynamic> requestCallBack;

  NetLoadingDialog(
      {Key key,
      this.loadingText = "loading...",
      this.outsideDismiss = true,
      this.dismissCallback,
      this.requestCallBack})
      : super(key: key);

  @override
  State<NetLoadingDialog> createState() => _LoadingDialog();
}

class _LoadingDialog extends State<NetLoadingDialog> {
  _dismissDialog() {
    if (widget.dismissCallback != null) {
      widget.dismissCallback();
    }
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    if (widget.requestCallBack != null) {
      widget.requestCallBack.then((value) {
        Navigator.pop(context, value);
      }).timeout(Duration(milliseconds: 15000), onTimeout: () {
        showMsg("网络连接超时");
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: widget.outsideDismiss ? _dismissDialog : null,
      child: Material(
        type: MaterialType.transparency,
        child: new Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/loading.gif',
                  width: 16,
                  height: 16,
                ),
                Text(
                  widget.loadingText,
                  style: new TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          // child: new SizedBox(
          //   width: 120.0,
          //   height: 120.0,
          //   child: new Container(
          //     decoration: ShapeDecoration(
          //       color: Color(0xffffffff),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(8.0),
          //         ),
          //       ),
          //     ),
          //     child: new Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: <Widget>[
          //         new CircularProgressIndicator(),
          //         new Padding(
          //           padding: const EdgeInsets.only(
          //             top: 20.0,
          //           ),
          //           child: new Text(
          //             widget.loadingText,
          //             style: new TextStyle(fontSize: 12.0),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
