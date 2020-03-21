import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  primaryColor: HexColor.fromHex('#183D6F'),
  backgroundColor: Colors.white
);

class HexColor {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}