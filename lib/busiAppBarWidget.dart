import 'package:flutter/material.dart';

class BusiDrawer extends StatelessWidget {
  BusiDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
}

class BusiAppBar extends StatelessWidget {
  BusiAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff000388),
      //هذي عشان نسوي لها زاويه من اليمين واليسار
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      )),
      leading: BackButton(
        onPressed: (() {
          Navigator.pushNamed(context, '/busiBusCardPage');
        }),
      ),

      //use onPressed to go back (previouce page)
    );
  }
}
