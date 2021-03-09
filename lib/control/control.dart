import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stars/route/route.dart';

String address = "http://172.16.1.5";
//172.20.10.13
//49.235.16.118
//10.67.212.191
//172.16.1.189
//192.168.2.18
//10.67.82.12

//登录
dynamic login(String name, String pwd) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.register",
    "path": "/register/login"
  });
  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"phone": name, "password": pwd});
    if (results.statusCode == 200) {
      return results.data;
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取个人信息
Future infoGet(String phone) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.information",
    "path": "/information/getOneselfInfo"
  });
  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
    var dio = new Dio();
    //var result = await dio.post(url, options: Options(headers: {"token": token}));
    var results = await dio.post(url, data: {"phone": phone});
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
Future wishNoGet(String phone, dynamic lover_id) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.wishList",
    "path": "/wishList/queryNoWish"
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
}

//获取完成心愿单
Future wishYesGet(String phone, dynamic lover_id) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.wishList",
    "path": "/wishList/queryYesWish"
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
}

//创建心愿单
Future wishAdd(dynamic arguments) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.wishList",
    "path": "/wishList/addWishList"
  });
  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {
      "lover_id": arguments["love_id"],
      "phone": arguments["phone"],
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
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.message",
    "path": "/message/receiveInviteMsg"
  });
  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"phone": phone});
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
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.article",
    "path": "/article/query"
  });
  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"phone": phone});
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
dynamic addArticle(File image, int len, String phone, String content) async {
  var name;
  var path;
  var url = address + ":9001/api";
  var dio = new Dio();
  var results = await dio.post(url, data: {
    "server_addr": "golang.api.stars.article",
    "path": "/article/add"
  });
  if (results.statusCode == 200) {
    var body = results.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
    var dio = new Dio();
    //var result = await dio.post(url, options: Options(headers: {"token": token}));
    if (image != null) {
      path = image.path;
      name = path.substring(path.lastIndexOf("/") + 1, path.length);

      FormData formData = new FormData.fromMap({
        "article_Img": await MultipartFile.fromFile(path, filename: name),
        "len": len,
        "data": '{"phone":"$phone","content":"$content"}',
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
      "data": '{"phone":"$phone","content":"$content"}',
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
  var url = address + ":9001/api";
  var dio = new Dio();
  var results = await dio.post(url, data: {
    "server_addr": "golang.api.stars.register",
    "path": "/register/create"
  });
  if (results.statusCode == 200) {
    var body = results.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
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
Future getOneselfArticledGet(String user_phone) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.article",
    "path": "/article/getOneself"
  });
  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
    var dio = new Dio();
    //var result = await dio.post(url, options: Options(headers: {"token": token}));
    var results = await dio.post(url, data: {"phone": user_phone});
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
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.privateChat",
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
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.reminder",
    "path": "/reminder/query"
  });
  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
    var dio = new Dio();
    var results = await dio.post(url, data: {"phone": phone});
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
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.reminder",
    "path": "/reminder/add"
  });
  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
    var dio = new Dio();
    var results = await dio
        .post(url, data: {"phone": phone, "title": title, "content": content});
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

//添加备忘录
Future addPrivateChat(String content) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(url, data: {
    "server_addr": "golang.api.stars.privateChat",
    "path": "/privateChat/add"
  });
  if (result.statusCode == 200) {
    var body = result.data;
    Map<String, dynamic> data = json.decode(body);
    url = data["url"];
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
