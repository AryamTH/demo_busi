import 'package:demo_busi/widgets/busiButtonsWidgets.dart';
import 'package:flutter/material.dart';

class BusiBusCardWidget extends StatelessWidget {
  double? width;
  double? height;
  Color? color;
  BusiButtonDarkWidget? busiButtonDarkWidget;
  BusiButtonLightWidgit? busiButtonLightWidgit;
  Column? column;

  BusiBusCardWidget({
    this.width,
    this.height,
    this.color,
    this.busiButtonDarkWidget,
    this.busiButtonLightWidgit,
    this.column,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 324,
      height: height ?? 167,
      child: Card(
        child: Row(
          children: [
            Container(
              child: BusiButtonDarkWidget(
                textOnButton: ('اضافه'),
                onPressed: () {},
              ),
            ),
          ],
        ),
        color: color ?? Color(0xffC7D8F3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          //set border radius more than 50% of height and width to make circle
        ),
      ),
    );
  }
}
//371 & 131 & FFFFF
// اضيف الازرار + التكست + الصوره