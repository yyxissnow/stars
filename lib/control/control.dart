import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stars/route/route.dart';

String address = "http://10.110.198.38";
//172.20.10.13
//49.235.16.118
//10.67.212.191
//172.16.1.189
//登录
dynamic login(String name, String pwd) async {
  var url = address + ":8101/register/login";
  var dio = new Dio();
  var result = await dio.post(url, data: {"phone": name, "password": pwd});

  if (result.statusCode == 200) {
    return result.data;
  } else {
    return null;
  }
}

Future infoGet(String phone) async {
  var url = address + ":9000/information/getOneself";
  var dio = new Dio();
  //var result = await dio.post(url, options: Options(headers: {"token": token}));
  var result = await dio.post(url, data: {"phone": phone});
  if (result.statusCode == 200) {
    var body = result.data;
    if (body["code"] == 20000) {
      return body["data"];
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取未完成心愿单
Future wishNoGet(String phone, dynamic lover_id) async {
  var url = address + ":9000/wishList/queryNoWish";
  var dio = new Dio();
  var result =
      await dio.post(url, data: {"phone": phone, "lover_id": lover_id});

  if (result.statusCode == 200) {
    var body = result.data;
    if (body["code"] == 20000) {
      return body["data"];
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取完成心愿单
Future wishYesGet(String phone, dynamic lover_id) async {
  var url = address + ":9000/wishList/queryYesWish";
  var dio = new Dio();
  var result =
      await dio.post(url, data: {"phone": phone, "lover_id": lover_id});

  if (result.statusCode == 200) {
    var body = result.data;
    if (body["code"] == 20000) {
      return body["data"];
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//创建心愿单
Future wishAdd(dynamic arguments) async {
  var url = address + ":9000/wishList/add";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "lover_id": arguments["love_id"],
      "phone": arguments["phone"],
      "content": arguments["wishName"],
      "accomplish": arguments["wishAccomplish"],
      "time": arguments["wishTime"]
    },
    //options: Options(headers: {"token": token}),
  );

  if (result.statusCode == 200) {
    var body = result.data;
    if (body["code"] == 20000) {
      return body["data"];
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//查看消息
Future getMessage() async {
  var url = address + ":9000/message/receiveInviteMsg";
  var dio = new Dio();
  var result = await dio.post(url, data: {"phone": phone});

  if (result.statusCode == 200) {
    var body = result.data;
    if (body["code"] == 20000) {
      return body["data"];
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取动态文章
Future recommendArticledGet() async {
  var url = address + ":8102/article/query";
  //var url = address + ":8005/api";
  var dio = new Dio();
  var result = await dio.post(url);
  // var result = await dio.post(url, data: {
  //   "language": "Golang",
  //   "data":
  //       "{\"server_addr\":\"api.stars.com.article\",\"path\":\"/article/query\",\"msg\":\"Hello World\"}"
  // });

  if (result.statusCode == 200) {
    var body = result.data;
    //print(bodys);
    //Map<String, dynamic> body = json.decode(bodys);
    //print(body);
    if (body["code"] == 20000) {
      //print(body["code"]);
      return body["data"];
    } else {
      print(body);
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
  var url = address + ":8102/article/add";
  var dio = new Dio();

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

//注册
dynamic register(File image, String phone, String password, String names,
    int age, bool sex) async {
  var name;
  var path;
  var url = address + ":8101/register/create";
  var dio = new Dio();

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
}

//获取我的动态文章
Future getOneselfArticledGet() async {
  var url = address + ":8102/article/getOneself";
  var dio = new Dio();
  var result = await dio.post(url, data: {"phone": phone});

  if (result.statusCode == 200) {
    var body = result.data;
    if (body["code"] == 20000) {
      return body["data"];
    } else {
      return null;
    }
  } else {
    return null;
  }
}

//获取悄悄话
Future privateChatGet(String lover_id) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  // var result =
  //     await dio.post(url, data: {"phone": phone, "lover_id": lover_id});

  var result = await dio.post(url, data: {
    "server_addr": "api.stars.com.private",
    "path": "/privateChat/query",
    "msg": "{\"lover_id\":\"$lover_id\"}"
  });

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

//增加悄悄话
Future privateAdd(String user_id, String lover_id, String content) async {
  var url = address + ":9001/api";
  var dio = new Dio();
  var result = await dio.post(
    url,
    data: {
      "server_addr": "api.stars.com.private",
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
