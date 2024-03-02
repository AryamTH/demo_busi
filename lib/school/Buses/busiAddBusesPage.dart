import 'package:demo_busi/widgets/BusiTextFieldsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:demo_busi/BusiGoogleMap.dart';

class BusiAddBusesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            BusiTextFieldWidget(),
          ],
        ),
      ),
    );
  }
}
