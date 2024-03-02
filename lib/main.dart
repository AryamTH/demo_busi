import 'package:demo_busi/school/Buses/BusiBusCardPage.dart';
import 'package:demo_busi/school/Buses/BusiaddBusesPage.dart';
import 'package:demo_busi/school/Buses/BusibusAreasPage.dart';
import 'package:flutter/material.dart';
import 'package:demo_busi/busiAppBarWidget.dart';
import 'package:demo_busi/widgets/busiButtonsWidgets.dart';
import 'package:flutter/widgets.dart';
import 'package:demo_busi/BusiGoogleMap.dart';

main() {
  runApp(Map());
}

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: BusiBusAreasPage()),
    );
    // home: Home(),
  }
}
