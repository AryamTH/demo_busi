import 'package:demo_busi/Widgets/busiCardsWidgets.dart';
import 'package:demo_busi/school/Buses/BusiaddBusesPage.dart';
import 'package:demo_busi/school/Buses/BusibusAreasPage.dart';
import 'package:demo_busi/school/Buses/busiBusCardPage.dart';
import 'package:demo_busi/school/schoolAccount.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:demo_busi/busiAppBarWidget.dart';
import 'package:demo_busi/widgets/busiButtonsWidgets.dart';
import 'package:flutter/widgets.dart';
import 'package:demo_busi/BusiGoogleMap.dart';
import 'package:demo_busi/widgets/busiTextWidgets.dart';
import 'BusiGoogleMapAreas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Map());
}

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
    // home: Home(),
  }
}
