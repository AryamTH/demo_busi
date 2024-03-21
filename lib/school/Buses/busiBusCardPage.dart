// WRAPPER
import 'package:flutter/material.dart';
import 'package:demo_busi/Widgets/busiCardsWidgets.dart';

class BusiBusCardPage extends StatelessWidget {
  BusiBusCardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return either auth or stay here

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: BusiBusCardWidget(),
          ),
        ],
      ),
    );
  }
}
