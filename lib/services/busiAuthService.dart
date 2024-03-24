// 1 enable auth in our project
// hold signIn and SignIn and LogOut

import 'package:firebase_auth/firebase_auth.dart';

import '../models/busiUser.dart';

class BusiAuthService {
  // instanse of my auth
  // allows accsse to all method and proporites in auth
  final FirebaseAuth _busiAuth = FirebaseAuth.instance;

  //create user obj based on firbase user obj + we will return it
  BusiUser? _busiUserFromFirebaseUser(User? user) {
    // default not null                            if not true it's null
    return user != null ? BusiUser(uid: user.uid) : null;
  }

  //__________________________________________________

  //__________________________________________________

  // signIn anonFuture
  Future signInAnon() async {
    //could end with error so we use catch and try
    try {
      // we wanna try get auth reslt by make request and we must wait because it takes time
      UserCredential result = await _busiAuth.signInAnonymously();
      // result have accsse to user object !
      User? busiUser = result.user;
      //return user to sign in widget
      return _busiUserFromFirebaseUser(busiUser);

      // if there error will return it here!
    } catch (e) {
      print(e.toString());
      //we can do something with this
      return null;
    }
  }
}

// signIn with email & password

// redister with email & passowrd

// logout

//we wanna we recive  auth convert it into obj can we limit the info we want.
