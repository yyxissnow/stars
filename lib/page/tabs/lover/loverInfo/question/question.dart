import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  Question({Key key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                "TOP  Q1",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(255, 210, 149, 1),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(135, 0, 0, 0),
                              child: Image.asset(
                                "images/say_bg_1.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 5, 6),
                      child: Text(
                        "你的男(女)朋友为你做过最让你感动的事情是什么?",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.speaker_notes,
                                color: Color.fromRGBO(255, 210, 149, 1),
                              ),
                              Text(
                                "1314个回答",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Color.fromRGBO(255, 210, 149, 1),
                              ),
                              Text(
                                "352喜欢",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                "TOP  Q2",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(255, 210, 149, 1),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(135, 0, 0, 0),
                              child: Image.asset(
                                "images/say_bg_2.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 5, 6),
                      child: Text(
                        "这一生中最让你难忘的一天?",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.speaker_notes,
                                color: Color.fromRGBO(255, 210, 149, 1),
                              ),
                              Text(
                                "1203个回答",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Color.fromRGBO(255, 210, 149, 1),
                              ),
                              Text(
                                "428喜欢",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                "TOP  Q3",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(255, 210, 149, 1),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(135, 0, 0, 0),
                              child: Image.asset(
                                "images/say_bg_1.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 5, 6),
                      child: Text(
                        "你哪个时刻最心疼你的男(女)朋友?",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.speaker_notes,
                                color: Color.fromRGBO(255, 210, 149, 1),
                              ),
                              Text(
                                "1023个回答",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Color.fromRGBO(255, 210, 149, 1),
                              ),
                              Text(
                                "569喜欢",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                "TOP  Q4",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(255, 210, 149, 1),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(135, 0, 0, 0),
                              child: Image.asset(
                                "images/say_bg_2.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 5, 6),
                      child: Text(
                        "你有没有为一个人拼过命？",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.speaker_notes,
                                color: Color.fromRGBO(255, 210, 149, 1),
                              ),
                              Text(
                                "999个回答",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Color.fromRGBO(255, 210, 149, 1),
                              ),
                              Text(
                                "241喜欢",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                "TOP  Q5",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(255, 210, 149, 1),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(135, 0, 0, 0),
                              child: Image.asset(
                                "images/say_bg_1.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 5, 6),
                      child: Text(
                        "男(女)朋友生气的时候应该做什么？",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.speaker_notes,
                                color: Color.fromRGBO(255, 210, 149, 1),
                              ),
                              Text(
                                "236个回答",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Color.fromRGBO(255, 210, 149, 1),
                              ),
                              Text(
                                "58喜欢",
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
