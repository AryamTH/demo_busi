import 'package:demo_busi/busiGoogleMapAreas.dart';
import 'package:demo_busi/pages/school/Buses/busiAddBusesPage.dart';
import 'package:demo_busi/pages/school/Buses/busiBusCardPage.dart';
import 'package:demo_busi/pages/school/Buses/BusibusAreasPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

/*class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BusiGoogleMapAreas(
            //use onPressed to go back (previouce page)
            ),
      ),
    );
    // home: Home(),
  }
}
*/