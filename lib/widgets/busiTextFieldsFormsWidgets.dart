import 'package:flutter/material.dart';


  InputDecorationTheme inputDecorationTheme() {
    decoration:
    InputDecoration(
      filled: true,
      fillColor: Color(0xffE9EEFE),
      //  border for enabled state (default) "قبل يبدا اليوزر يكتب"
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffE9EEFE)),
        borderRadius: BorderRadius.circular(30),
      ),
      //  border for focused state (اذا ضغط عليها اليوزر وبدا يكتب)
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Color(0xff000388)),
        borderRadius: BorderRadius.circular(30),
      ),
      // for more action in textField: https://www.kindacode.com/article/customize-borders-of-textfield-textformfield-in-flutter/
    );
      throw Exception("Method not implemented");
  }
