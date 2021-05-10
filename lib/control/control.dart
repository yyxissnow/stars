import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stars/route/route.dart';

String address = "http://49.235.16.118";
//172.20.10.13
//49.235.16.118
//10.67.212.191
//172.16.1.189
//192.168.2.18
//10.67.82.12

//登录
dynamic login(String name, String pwd) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.account-api",
    "path": "/stars/account/login"
  });
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"phone": name, "password": pwd});
    if (results.statusCode == 200) {
      token = results.data["data"]["token"];
      id = results.data["data"]["user_id"];
      return results.data;
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取个人信息
Future infoGet(int id) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.account-api",
      "path": "/stars/account/get_info"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data["data"];
    url = body["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"id": id});
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取未完成心愿单
Future wishNoGet(dynamic lover_id) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.wishList-api",
      "path": "/stars/wishList/query_no_wish"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"id": id, "lover_id": lover_id});
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取完成心愿单
Future wishYesGet(dynamic lover_id) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.wishList-api",
      "path": "/stars/wishList/query_yes_wish"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"id": id, "lover_id": lover_id});
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//创建心愿单
Future wishAdd(dynamic arguments) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.wishList-api",
      "path": "/stars/wishList/add_wish_list"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {
      "lover_id": arguments["love_id"],
      "id": id,
      "content": arguments["wishName"],
      "accomplish": arguments["wishAccomplish"],
      "time": arguments["wishTime"]
    });
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//查看消息
Future getMessage() async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.message-api",
      "path": "/stars/message/receive_invite_msg"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"id": id});
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取动态文章
Future recommendArticledGet() async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.article-api",
      "path": "/stars/article/query"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"id": id});
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//发表文章
dynamic addArticle(File image, int len, String content) async {
  var name;
  var path;
  var url = address + ":9001/stars";
  var dio = new Dio();
  var results = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.article-api",
      "path": "/stars/article/add"
    },
    options: Options(headers: {"token": token}),
  );
  if (results.statusCode == 200) {
    var body = results.data;
    url = body["data"]["url"];
    var dio = new Dio();
    if (image != null) {
      path = image.path;
      name = path.substring(path.lastIndexOf("/") + 1, path.length);

      FormData formData = new FormData.fromMap({
        "article_Img": await MultipartFile.fromFile(path, filename: name),
        "len": len,
        "data": '{"id":$id,"content":"$content"}',
      });

      var result = await dio.post(
        url,
        data: formData,
      );

      if (result.statusCode == 200) {
        var body = result.data;
        return body;
      } else {
        return null;
      }
    }
    //没有文件时

    FormData formData = new FormData.fromMap({
      "len": len,
      "data": '{"id":$id,"content":"$content"}',
    });

    var result = await dio.post(
      url,
      data: formData,
    );

    if (result.statusCode == 200) {
      var body = result.data;
      return body;
    } else {
      return null;
    }
  }
}

//注册
dynamic register(File image, String phone, String password, String names,
    int age, bool sex) async {
  var name;
  var path;
  var url = address + ":9001/stars";
  var dio = new Dio();
  var results = await dio.post(url, data: {
    "server_addr": "golang.api.stars.account-api",
    "path": "/stars/account/create"
  });
  if (results.statusCode == 200) {
    var body = results.data;
    url = body["data"]["url"];
    path = image.path;
    name = path.substring(path.lastIndexOf("/") + 1, path.length);

    FormData formData = new FormData.fromMap({
      "ID_Img": await MultipartFile.fromFile(path, filename: name),
      "data":
          '{"name":"$names","phone":"$phone","password":"$password","gender":$sex,"age":$age}',
    });

    var result = await dio.post(
      url,
      data: formData,
    );

    if (result.statusCode == 200) {
      var body = result.data;
      return body;
    } else {
      return null;
    }
  } else {
    return null;
  }

  //
  // var name;
  // var path;
  // var url = address + ":8101/register/create";
  // var dio = new Dio();

  // path = image.path;
  // name = path.substring(path.lastIndexOf("/") + 1, path.length);

  // FormData formData = new FormData.fromMap({
  //   "ID_Img": await MultipartFile.fromFile(path, filename: name),
  //   "data":
  //       '{"name":"$names","phone":"$phone","password":"$password","gender":$sex,"age":$age}',
  // });

  // var result = await dio.post(
  //   url,
  //   data: formData,
  // );

  // if (result.statusCode == 200) {
  //   var body = result.data;
  //   return body;
  // } else {
  //   return null;
  // }
}

//获取我的动态文章
Future getOneselfArticledGet(int user_id) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.article-api",
      "path": "/stars/article/get_single"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"id": id, "user_id": user_id});
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取悄悄话
Future privateChatGet(int lover_id) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.privateChat-api",
    "path": "/privateChat/query"
  });
  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
    var dio = new Dio();
    var results =
        await dio.post(url, data: {"phone": phone, "lover_id": lover_id});
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }

  // var url = address + ":9001/api";
  // var dio = new Dio();
  // // var result =
  // //     await dio.post(url, data: {"phone": phone, "lover_id": lover_id});

  // var result = await dio.post(url, data: {
  //   "server_addr": "golang.api.stars.private",
  //   "path": "/privateChat/query",
  //   "msg": "{\"lover_id\":\"$lover_id\"}"
  // });

  // if (result.statusCode == 200) {
  //   var body = result.data;
  //   Map<String, dynamic> data = json.decode(body);
  //   if (data["code"] == 20000) {
  //     return data["data"];
  //   } else {
  //     return null;
  //   }
  // } else {
  //   return null;
  // }
}

//增加悄悄话
Future privateAdd(String user_id, String lover_id, String content) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "python.api.stars.private",
      "path": "/privateChat/add",
      "msg":
          "{\"user_id\":\"$user_id\",\"lover_id\":\"$lover_id\",\"content\":\"$content\"}"
    },
  );

  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    if (data["code"] == 20000) {
      return data["data"];
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//删除悄悄话
Future privateDelete(String id) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "python.api.stars.private",
      "path": "/privateChat/delete",
      "msg": "{\"private_id\":\"$id\"}"
    },
  );

  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    if (data["code"] == 20000) {
      return data["data"];
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//改悄悄话
Future privateAlter(String id, String content) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "python.api.stars.private",
      "path": "/privateChat/alter",
      "msg": "{\"private_id\":\"$id\",\"content\":\"$content\"}"
    },
  );

  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    if (data["code"] == 20000) {
      return data["data"];
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取备忘录
Future getReminder(String phone) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.reminder-api",
      "path": "/stars/reminder/query"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"id": id});
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//添加备忘录
Future addReminder(String title, String content) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.reminder-api",
      "path": "/stars/reminder/add"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio
        .post(url, data: {"id": id, "title": title, "content": content});
    if (results.statusCode == 200) {
      var body = results.data;
      // if (body["code"] == 20000) {
      //   return body["data"];
      // } else {
      //   return null;
      // }
      return body;
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//悄悄话聊天
Future addPrivateChat(String content) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.privateChat",
      "path": "/stars/privateChat/add"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url,
        data: {"phone": phone, "lover_id": my["love_id"], "content": content});
    if (results.statusCode == 200) {
      var body = results.data;
      // if (body["code"] == 20000) {
      //   return body["data"];
      // } else {
      //   return null;
      // }
      return body;
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//点赞
Future likeArticle(int article_id) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.article-api",
      "path": "/stars/article/like"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {
      "id": id,
      "article_id": article_id,
    });
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取文章评论
Future getArticleComment(int article_id) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.article-api",
      "path": "/stars/article/query_comment"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {
      "id": id,
      "article_id": article_id,
    });
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//评论文章
Future commentArticle(int article_id, comment_id, String content) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.article-api",
      "path": "/stars/article/comment_article"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {
      "id": id,
      "article_id": article_id,
      "comment": content,
      "comment_id": comment_id
    });
    if (results.statusCode == 200) {
      var body = results.data;
      // if (body["code"] == 20000) {
      //   return body["data"];
      // } else {
      //   return null;
      // }
      return body;
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取纪念日
Future diaryDayGet(dynamic lover_id) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.markDay-api",
      "path": "/stars/markDay/query_diary"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"id": id, "lover_id": lover_id});
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取提醒日
Future remindDayGet(dynamic lover_id) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.markDay-api",
      "path": "/stars/markDay/query_reminder"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"id": id, "lover_id": lover_id});
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//创建纪念日
Future diaryAdd(dynamic arguments) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.markDay-api",
      "path": "/stars/markDay/add_diary"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {
      "id": id,
      "lover_id": arguments["love_id"],
      "content": arguments["content"],
      "day": arguments["day"],
    });
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//创建提醒日
Future remindAdd(dynamic arguments) async {
  var url = address + ":9001/stars";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "golang.api.stars.markDay-api",
      "path": "/stars/markDay/add_remind"
    },
    options: Options(headers: {"token": token}),
  );
  if (result.statusCode == 200) {
    var body = result.data;
    url = body["data"]["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {
      "id": id,
      "lover_id": arguments["love_id"],
      "content": arguments["content"],
      "countdown": arguments["day"],
    });
    if (results.statusCode == 200) {
      var body = results.data;
      if (body["code"] == 20000) {
        return body["data"];
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    return null;
  }
}
