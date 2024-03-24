import 'package:demo_busi/busiGoogleMapAreas.dart';
import 'package:flutter/material.dart';
import 'package:demo_busi/busiAppBarWidget.dart';
import 'package:demo_busi/widgets/busiCardsWidgets.dart';
import 'package:demo_busi/BusiGoogleMap.dart';

class BusiBusAreasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000388),
        //هذي عشان نسوي لها زاويه من اليمين واليسار
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
        leading: BackButton(
          color: Colors.white,
        ),
        //use onPressed to go back (previouce page)
      ),
      body: Stack(
        children: [
          Container(
            child: BusiGoogleMapAreas(),
          ),
          Align(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 20),
              child: BusiBusCardWidget(
                width: 371,
                height: 131,
                color: Colors.white,
                busiStackBottomAndText: BusiStackBottomAndText(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
