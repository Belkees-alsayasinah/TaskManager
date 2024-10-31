import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onsave;
  final double radius;
  final double width;
  final double height;
  final String text;
  final Color color;
  final Color textColor;
  final double fontSize;

  const MyButton({
    Key? key,
    required this.onsave,
    required this.width,
    required this.height,
    required this.text,
    required this.color,
    required this.textColor,
    required this.radius,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onsave,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontFamily: 'font1',
            fontSize: fontSize,
          ),
          textDirection: TextDirection.rtl,
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),

          elevation: 10,
          shadowColor: Colors.grey,
        ),
      ),
    );
  }
}
