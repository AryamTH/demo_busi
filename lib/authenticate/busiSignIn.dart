import 'package:demo_busi/services/busiAuthService.dart';
import 'package:flutter/material.dart';
import 'package:demo_busi/Widgets/busiCardsWidgets.dart';
import 'package:demo_busi/widgets/BusiTextFieldsWidgets.dart';
import 'package:demo_busi/widgets/busiButtonsWidgets.dart';
import 'package:demo_busi/widgets/busiTextWidgets.dart';

//stateFul
class busiSignIn extends StatefulWidget {
  const busiSignIn({super.key});

  @override
  State<busiSignIn> createState() => _busiSignInState();
}

class _busiSignInState extends State<busiSignIn> {
  // so i can use it
  final BusiAuthService _busiAuth = BusiAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: ElevatedButton(
        //becaouse we will bas async function (sign in)
        onPressed: () async {
          // we say what we want to happen here
          // accses signIn here to linke it tofether
          // must er eait fot _busiAuth
          // store it in var -> dynamic because can be null
          dynamic result = await _busiAuth.signInAnon();
          // if nul (not login) - else not null (login)
          if (result == null) {
            print('error');
          } else {
            print('signed in');
            print(result.uid);
          }
        },
        child: Text('signIn'),
      ),
    ));
  }
}
