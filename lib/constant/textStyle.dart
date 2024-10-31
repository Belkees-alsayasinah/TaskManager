import 'package:flutter/material.dart';

import 'colors.dart';

class TextStyles {
  static const double _baseFontSize = 16.0;
  static TextStyle headingStyle = TextStyle(
    fontSize: _baseFontSize * 1.5,
    fontWeight: FontWeight.bold,
    fontFamily: 'font1',
    color: black,
  );

  static TextStyle headingStyle2 = TextStyle(
    fontSize: _baseFontSize * 1.2,
    fontWeight: FontWeight.bold,
    fontFamily: 'font1',
    color: black,
  );

  static TextStyle bodyStyle = TextStyle(
    fontSize: _baseFontSize,
    fontWeight: FontWeight.normal,
    color: black,
  );

  static TextStyle smallTextStyle = TextStyle(
    fontSize: _baseFontSize * 0.875,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  static TextStyle textButton = TextStyle(
    fontSize: _baseFontSize,
    fontWeight: FontWeight.bold,
    color: buttonColor,
  );
}
