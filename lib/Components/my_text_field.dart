import 'package:flutter/material.dart';

import '../Style/constant.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? control;
  final String label;
  final String hint;
  final IconData? icon;
  final TextInputAction textInputAction;
  final Function(String?)? onsave;
  final String? Function(String?)? validator;
  final double? radius;
  final Function()? suffixPressed;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? max;
  final double width;
  final double height;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;

  const MyTextField({
    Key? key,
    this.control,
    required this.label,
    required this.hint,
    this.icon,
    required this.textInputAction,
    required this.onsave,
    this.validator,
    this.radius,
    this.suffixPressed,
    required this.keyboardType,
    this.obscureText = false,
    required this.width,
    required this.height,
    this.max,
    this.enabledBorder, // ممرر الحدود المخصصة لحالة التمكين
    this.focusedBorder, // ممرر الحدود المخصصة لحالة التركيز
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: widget.width,
      height: screenSize.height * 0.09,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextFormField(
        textDirection: TextDirection.rtl,
        controller: widget.control,
        onChanged: widget.onsave,
        validator: widget.validator,
        obscureText: _obscureText,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        maxLines: widget.max ?? 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: widget.label,
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          enabledBorder: widget.enabledBorder ??
              UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
          focusedBorder: widget.focusedBorder ??
              UnderlineInputBorder(
                borderSide: BorderSide(color: buttonColor),
              ),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
