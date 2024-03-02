import 'package:flutter/material.dart';

// First Button: Drak Blue
class BusiButtonDarkWidget extends StatelessWidget {
  //Parameters + Functions
  VoidCallback? onPressed;
  double? width;
  double? heigh;
  String? textOnButton;

  //Constructur that we call it as widget
  BusiButtonDarkWidget({
    required this.textOnButton,
    required this.onPressed,
    this.width,
    this.heigh,
    super.key,
  });

  //The widget characters
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 93,
      height: heigh ?? 37,
      child: ElevatedButton(
        //STYLE THE BUTTON
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            //to set border radius to button
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Color(0Xff000388),
        ),
        //Required (must but it in theElevatedButton widget!)
        child: Text(
          textOnButton ?? 'Add Text!',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

// Secound Button: Light Blue
class BusiButtonLightWidgit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 116,
      height: 46,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            //to set border radius to button
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Color(0XffEAEFFF),
        ),
        //Required (must but it !)

        child: Text(''),
        onPressed: () {},
      ),
    );
  }
}
