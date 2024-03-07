import 'package:flutter/material.dart';

class BusiTextWidget extends StatelessWidget {
  const BusiTextWidget({
    super.key,
    required this.text,
    this.size,
    this.fontWeight,
  });

  final String? text;
  final double? size;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'Add text!',
      style: TextStyle(
        color: Color(0xff000388),
        fontSize: size ?? 12,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}
