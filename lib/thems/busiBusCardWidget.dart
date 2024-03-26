import 'package:demo_busi/thems/busiButtonDarkWidget.dart';
import 'package:flutter/material.dart';

class BusiBusCardWidget extends StatelessWidget {
  double? width;
  double? height;
  Color? color;
  // VoidCallback? onChanged;

  BusiButtonDarkWidget? busiButtonDarkWidget;
  BusiButtonLightWidgit? busiButtonLightWidgit;
  Column? column;
  BusiStackBottomAndText? busiStackBottomAndText;
  //Widget? BusiStackBottomAndText();

  BusiBusCardWidget({
    this.width,
    this.height,
    this.color,
    this.busiButtonDarkWidget,
    this.busiButtonLightWidgit,
    this.column,
    this.busiStackBottomAndText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 324,
      height: height ?? 167,
      child: Card(
        child: busiStackBottomAndText ?? null,
        color: color ?? Color(0xffC7D8F3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          //set border radius more than 50% of height and width to make circle
        ),
      ),
    );
  }
}

// widget for define the area for bus page
class BusiStackBottomAndText extends StatelessWidget {
  const BusiStackBottomAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 10),
            child: BusiButtonDarkWidget(
              textOnButton: ('اضافه'),
              onPressed: () {
                Navigator.pushNamed(context, '/busiAddBusesPage');
              },
            ),
          ),
        ),
        Align(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'رقم الباص: 89 ',
              style: TextStyle(
                fontSize: 15,
              ),
              selectionColor: Color(0xff000388),
            ),
          ),
        ),
      ],
    );
  }
}
//371 & 131 & FFFFF
// اضيف الازرار + التكست + الصوره