// root auth widget
import 'package:demo_busi/authenticate/busiSignIn.dart';
import 'package:flutter/material.dart';

// StateFul becaouse we will use STATE here
class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: busiSignIn(),
    );
  }
}
