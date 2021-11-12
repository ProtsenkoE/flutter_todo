import 'dart:ui';
import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color lightBlueColor = hexToColor('#56AAFF');
  static Color moreLightBlueColor = hexToColor('#E1F4FF');
  static Color darkBlueColor = hexToColor('#3C5CA5');
  static Color moreDarkBlueColor = hexToColor('#3B5BA4');
  static Color blueColor = hexToColor('#5E92F3');
  static Color blueColor2 = hexToColor('#387AC7');

  static Color lightOrangeColor = hexToColor('#EB7407');
  static Color orangeColor = hexToColor('#F84007');

  static Color creamColor = hexToColor('#FFF9F9');
  static Color mintColor = hexToColor('#46E7B6');

  static Color lightMintColor = hexToColor('#6BE5AB');
}
