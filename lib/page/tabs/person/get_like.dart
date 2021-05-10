import 'package:flutter/material.dart';

class GetLike extends StatefulWidget {
  GetLike({Key key}) : super(key: key);

  @override
  _GetLikeState createState() => _GetLikeState();
}

class _GetLikeState extends State<GetLike> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          titleSpacing: 0,
          title: Container(
            child: Text(
              "点赞",
              style: TextStyle(color: Colors.orange[300]),
            ),
          ),
          centerTitle: true,
          leading: Container(
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.orange[300],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  })),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: Icon(
                Icons.view_headline,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: Text(
              "暂无点赞",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ));
  }
}
