import 'package:flutter/material.dart';
import 'package:demo_busi/Widgets/busiCardsWidgets.dart';

class BusiCardPage extends StatelessWidget {
  BusiCardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            BusiBusCardWidget(),
          ],
        ),
      ),
    );
  }
}
