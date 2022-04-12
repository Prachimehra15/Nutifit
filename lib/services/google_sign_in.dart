import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/location.dart';
import 'package:fitness/services/firebase.dart';
import 'package:flutter/material.dart';

import '../dashboard.dart';
import 'auth.dart';

Auth service = Auth();

Future<void> signInGoogle(BuildContext context) async {
  try {
    await service.signInWithGoogle().then((value) {
      FireStore().getUserState(uid: value.uid).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          ); // if existing user logs in
      }).onError((error, stackTrace) {
        print('===> errror $error');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Location()),
        );
      });
    });
  } catch (e) {
    print(e);
    if (e is FirebaseAuthException) {
      print('Firebase Login error => ${e.message!}');
    }
  }
}

Future<void> signOut() async {
  try {
    await service.signOut();
  } catch (e) {
    print('cant even log out => $e');
  }
}
