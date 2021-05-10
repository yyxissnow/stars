// Container(
//       child: SlidingUpPanel(
//         controller: panel,
//         minHeight: 0,
//         maxHeight: SizeConfig.screenHeight * 0.7,
//         //parallaxOffset: 0.5,
//         backdropOpacity: 0.5,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24.0),
//           topRight: Radius.circular(24.0),
//         ),
//         body: GestureDetector(
//           behavior: HitTestBehavior.translucent,
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 Expanded(
//                   child: ListView(
//                     //shrinkWrap: true,
//                     //controller: _scrollController,
//                     children: <Widget>[
//                       // SizedBox(
//                       //   height: 10,
//                       // ),
//                       Container(
//                         child: Container(
//                           margin: EdgeInsets.fromLTRB(7, 10, 7, 10),
//                           child: Container(
//                               height: SizeConfig.screenHeight * 0.05,
//                               width: SizeConfig.screenWidth * 0.6,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Container(
//                                 margin: EdgeInsets.only(left: 10),
//                                 child: TextFormField(
//                                   decoration: new InputDecoration(
//                                       icon: new Icon(
//                                         Icons.search,
//                                         color: Colors.grey,
//                                       ),
//                                       hintText: "大家都在搜",
//                                       border: InputBorder.none),
//                                 ),
//                               )),
//                         ),
//                       ),
//                       hotSerch(),
//                       Container(
//                         //height: SizeConfig.screenHeight * 1,
//                         margin: EdgeInsets.only(top: 10),
//                         child: ListView.builder(
//                           //controller: _scrollController,
//                           shrinkWrap: true, //指定高度可扩张
//                           itemCount: recommendArticle.length,
//                           physics: NeverScrollableScrollPhysics(), //禁止滑动
//                           itemBuilder: (context, index) {
//                             return Container(
//                               margin: EdgeInsets.fromLTRB(8, 3, 8, 3),
//                               child: Card(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Column(
//                                   children: <Widget>[
//                                     Container(
//                                       height: SizeConfig.screenHeight * 0.09,
//                                       child: Row(
//                                         //crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: <Widget>[
//                                           Container(
//                                             //alignment: Alignment.center,
//                                             //width: SizeConfig.screenWidth * 0.2,
//                                             child: InkWell(
//                                               child: Container(
//                                                 alignment: Alignment.topLeft,
//                                                 margin: EdgeInsets.fromLTRB(
//                                                     12,
//                                                     SizeConfig.screenHeight *
//                                                         0.01,
//                                                     0,
//                                                     0),
//                                                 child: ClipOval(
//                                                   child: Image.network(
//                                                       recommendArticle == null
//                                                           ? "images/boji_girl.png"
//                                                           : recommendArticle[
//                                                                   index]
//                                                               ["user_avatar"],
//                                                       height: SizeConfig
//                                                               .screenHeight *
//                                                           0.06,
//                                                       //height: 50,
//                                                       //width: 50,
//                                                       fit: BoxFit.cover),
//                                                 ),
//                                               ),
//                                               onTap: () {
//                                                 Navigator.pushNamed(
//                                                     context, "/userInfo",
//                                                     arguments: {
//                                                       "name": recommendArticle[
//                                                           index]["user_name"],
//                                                       "avatar":
//                                                           recommendArticle[
//                                                                   index]
//                                                               ["user_avatar"],
//                                                       "phone": recommendArticle[
//                                                           index]["phone"],
//                                                     });
//                                               },
//                                             ),
//                                           ),
//                                           //
//                                           Container(
//                                             margin: EdgeInsets.fromLTRB(
//                                                 5,
//                                                 SizeConfig.screenHeight * 0.01,
//                                                 0,
//                                                 0),
//                                             alignment: Alignment.centerLeft,
//                                             //height: SizeConfig.screenHeight * 0.1,
//                                             width:
//                                                 SizeConfig.screenWidth * 0.48,
//                                             //margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                                             child: Column(
//                                               children: <Widget>[
//                                                 Container(
//                                                   //alignment: Alignment.centerLeft,
//                                                   child: Text(
//                                                     recommendArticle == null
//                                                         ? "Snow"
//                                                         : recommendArticle[
//                                                             index]["user_name"],
//                                                     style: TextStyle(
//                                                       color: Colors.black87,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 18,
//                                                       fontFamily: "XiaoBai",
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 2,
//                                                 ),
//                                                 Container(
//                                                   child: Text(
//                                                     formatDate(
//                                                         DateTime.fromMillisecondsSinceEpoch(
//                                                             recommendArticle[index]["time"]),
//                                                         [
//                                                           yyyy,
//                                                           '-',
//                                                           mm,
//                                                           '-',
//                                                           dd,
//                                                           ' ',
//                                                           HH,
//                                                           ':',
//                                                           nn
//                                                         ]),
//                                                     style: TextStyle(
//                                                       fontSize: 13,
//                                                       //fontWeight: FontWeight.w300,
//                                                       color: Colors.grey,
//                                                     ),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           ),

//                                           Container(
//                                             //margin: EdgeInsets.fromLTRB(90, 0, 0, 0),
//                                             child: Image.asset(
//                                               "images/say_bg_1.jpg",
//                                               fit: BoxFit.cover,
//                                               width:
//                                                   SizeConfig.screenWidth * 0.25,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       width: double.maxFinite,
//                                       alignment: Alignment.topLeft,
//                                       margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
//                                       child: Text(
//                                         recommendArticle == null
//                                             ? "这是一个标题"
//                                             : recommendArticle[index]
//                                                 ["content"],
//                                         style: TextStyle(
//                                           fontSize: 17,
//                                           color: Colors.black87,
//                                         ),
//                                         maxLines: 3,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ),
//                                     recommendArticle[index]["lines"] > 3
//                                         ? Container(
//                                             margin: EdgeInsets.fromLTRB(
//                                                 12, 0, 0, 0),
//                                             alignment: Alignment.centerLeft,
//                                             child: Text(
//                                               "……查看全文",
//                                               style: TextStyle(
//                                                   color: Colors.orange,
//                                                   decoration:
//                                                       TextDecoration.underline),
//                                             ),
//                                           )
//                                         : Container(),
//                                     recommendArticle[index]["picture"] == ""
//                                         ? Container()
//                                         : Container(
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             height:
//                                                 SizeConfig.screenHeight * 0.2,
//                                             margin: EdgeInsets.fromLTRB(
//                                                 10, 5, 10, 0),
//                                             child: Image.network(
//                                               address +
//                                                   ":8004/static/" +
//                                                   recommendArticle[index]
//                                                       ["picture"],
//                                               fit: BoxFit.cover,
//                                               width: double.maxFinite,
//                                               height: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   0.1,
//                                             ),
//                                           ),
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               0.05,
//                                       //margin: EdgeInsets.only(bottom: 5),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: <Widget>[
//                                           LikeButton(
//                                             isLiked: recommendArticle[index]
//                                                 ["islike"],
//                                             likeBuilder: (bool isLiked) {
//                                               return Icon(
//                                                 Icons.favorite,
//                                                 color: isLiked
//                                                     ? Color.fromRGBO(
//                                                         255, 210, 149, 1)
//                                                     : Colors.grey,
//                                               );
//                                             },
//                                             countBuilder: (int count,
//                                                 bool isLiked, String text) {
//                                               var color = isLiked
//                                                   ? Colors.pink[200]
//                                                   : Colors.grey;
//                                               Widget result;
//                                               result = Text(
//                                                 text,
//                                                 style: TextStyle(
//                                                     color: color, fontSize: 20),
//                                               );
//                                               return result;
//                                             },
//                                             likeCount: recommendArticle[index]
//                                                 ["likes"],
//                                             onTap: (bool isLiked) {
//                                               return onLikeButtonTap(
//                                                   isLiked,
//                                                   recommendArticle[index]
//                                                       ["id"]);
//                                             },
//                                           ),
//                                           InkWell(
//                                             onTap: () {
//                                               setState(() {
//                                                 id = recommendArticle[index]
//                                                     ["id"];
//                                               });

//                                               panel.open();
//                                             },
//                                             child: Row(
//                                               children: <Widget>[
//                                                 Text(
//                                                   recommendArticle == null
//                                                       ? "666"
//                                                       : recommendArticle[index]
//                                                               ["comments"] +
//                                                           " 评论",
//                                                   style: TextStyle(
//                                                       color: Colors.black87),
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           //xxxxxxxx
//           //xxxxxxxx
//           //xxxxxxxx
//           onTap: () {
//             panel.close();
//             FocusScope.of(context).requestFocus(FocusNode());
//           },
//         ),
//         backdropEnabled: true,
//         onPanelOpened: () {
//           print(panel.isPanelOpen());
//           print(id);
//         },

//         //renderPanelSheet: false,
//         panel: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//           },
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Container(
//                         margin:
//                             EdgeInsets.only(left: SizeConfig.screenWidth * 0.4),
//                         child: Text(
//                           "全部评论",
//                           style: TextStyle(fontSize: 20, color: Colors.black),
//                         ),
//                       ),
//                       Container(
//                           margin: EdgeInsets.only(right: 13),
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: Colors.grey[300],
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: InkWell(
//                               onTap: () {
//                                 panel.close();
//                               },
//                               child: Icon(
//                                 Icons.clear,
//                                 color: Color.fromRGBO(68, 68, 68, 1),
//                               ),
//                             ),
//                           )),
//                     ],
//                   ),
//                 ),
//                 //

//                 Container(
//                   margin: EdgeInsets.fromLTRB(7, 5, 7, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Container(
//                         child: Text(
//                           "评论 0",
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                       Container(
//                         child: ToggleSwitch(
//                             initialLabelIndex: 1,
//                             minWidth: SizeConfig.screenWidth * 0.1,
//                             cornerRadius: 20,
//                             activeBgColor: Color.fromRGBO(255, 210, 149, 1),
//                             activeTextColor: Colors.white,
//                             inactiveBgColor: Color(0xffF3F4F5),
//                             inactiveTextColor: Color(0xff999999),
//                             labels: ['默认', '最新'],
//                             onToggle: (index) {
//                               print('switched to: $index');
//                             }),
//                       )
//                     ],
//                   ),
//                 ),
//                 //

//                 Container(
//                   child: ArticleComment(
//                     article_id: id,
//                   ),
//                 ),

//                 //
//                 Container(
//                     margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                           flex: 10,
//                           child: Container(
//                               margin: EdgeInsets.only(left: 5),
//                               height: SizeConfig.screenHeight * 0.05,
//                               width: SizeConfig.screenWidth * 0.9,
//                               decoration: BoxDecoration(
//                                 color: Color.fromRGBO(245, 246, 250, 1),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Container(
//                                 margin: EdgeInsets.only(left: 10),
//                                 child: TextFormField(
//                                   onChanged: (vakue) {
//                                     // _content = vakue;
//                                   },
//                                   decoration: new InputDecoration(
//                                       hintText: "评论千万条，友善第一条",
//                                       hintStyle:
//                                           TextStyle(color: Colors.grey[400]),
//                                       border: InputBorder.none),
//                                 ),
//                               )),
//                         ),
//                         Expanded(
//                             flex: 1,
//                             child: InkWell(
//                               onTap: () {
//                                 // verify(_content, context);
//                               },
//                               child: Container(
//                                 child: Icon(
//                                   Icons.send,
//                                   color: Color.fromRGBO(255, 210, 149, 1),
//                                 ),
//                               ),
//                             ))
//                       ],
//                     )),
//               ],
//             ),
//             // child: Center(
//             //   child: Text("评论区",
//             //       style: TextStyle(
//             //           color: Colors.grey,
//             //           fontSize: 16,
//             //           fontWeight: FontWeight.normal,
//             //           decoration: TextDecoration.none)),
//             // ),
//           ),
//         ),
//       ),
//     );
