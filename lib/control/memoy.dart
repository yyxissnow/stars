import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

//获取项目文件
Future<File> assetFile(String assetPath, String fileName) async {
  //获取二进制文件
  ByteData byteData = await rootBundle.load(assetPath);

  //获取文档目录
  final appDocDir = await getApplicationDocumentsDirectory();
  String filePath = appDocDir.path + "/" + fileName;
  File file = new File(filePath);

  try {
    //文件是否存在
    bool exists = await file.exists();
    //文件不存在则写入文件
    if (!exists) {
      file.writeAsBytes(byteData.buffer.asInt8List(0));
    }
  } catch (err) {
    print(err);
  }

  return file;
}
