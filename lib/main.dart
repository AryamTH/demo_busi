import 'package:demo_busi/busiGoogleMapAreas.dart';
import 'package:demo_busi/school/Buses/BusiaddBusesPage.dart';
import 'package:demo_busi/school/Buses/BusibusAreasPage.dart';
import 'package:demo_busi/school/Buses/busiBusCardPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: '/busiBusCardPage',
      routes: {
        '/busiBusCardPage': (context) => BusiBusCardPage(),
        '/busiAddBusesPage': (context) => const BusiAddBusesPage(),
        '/busiBusAreasPage': (context) => BusiBusAreasPage(),
      },
    ),
  );
}


/*
class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 

      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
      ),
    );
    // home: Home(),
  }
}
*/