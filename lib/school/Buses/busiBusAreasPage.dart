import 'package:flutter/material.dart';
import 'package:demo_busi/busiAppBarWidget.dart';
import 'package:demo_busi/widgets/busiCardsWidgets.dart';
import 'package:demo_busi/BusiGoogleMap.dart';

class BusiBusAreasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              child: BusiGoogleMap(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                child: BusiBusCardWidget(
                  width: 371,
                  height: 131,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
