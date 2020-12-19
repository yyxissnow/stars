import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Theme {
  /**
   * 登录界面，定义渐变的颜色
   */
  // static const Color loginGradientStart = const Color(0xFFfbab66);
  // static const Color loginGradientEnd = const Color(0xFFf7418c);
  static const Color loginGradientStart =
      const Color.fromRGBO(232, 227, 240, 1);
  static const Color loginGradientEnd = const Color.fromRGBO(222, 197, 253, 1);

  static const LinearGradient primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
