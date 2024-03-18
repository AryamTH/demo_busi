import 'package:demo_busi/Widgets/busiCardsWidgets.dart';
import 'package:demo_busi/school/Buses/BusiBusCardPage.dart';
import 'package:demo_busi/school/Buses/BusiaddBusesPage.dart';
import 'package:demo_busi/school/Buses/BusibusAreasPage.dart';
import 'package:flutter/material.dart';
import 'package:demo_busi/busiAppBarWidget.dart';
import 'package:demo_busi/widgets/busiButtonsWidgets.dart';
import 'package:flutter/widgets.dart';
import 'package:demo_busi/BusiGoogleMap.dart';
import 'package:demo_busi/widgets/busiTextWidgets.dart';
import 'BusiGoogleMapAreas.dart';

main() {
  runApp(Map());
}

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp( 
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff000388),
            //هذي عشان نسوي لها زاويه من اليمين واليسار
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
            leading: BackButton(),
            //use onPressed to go back (previouce page)
          ),
          body: Text('kkkkkkkkkkkkkkkkkkkk'),

         ),
    );
    // home: Home(),
  }
}
