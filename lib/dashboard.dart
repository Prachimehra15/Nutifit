//import 'dart:html';

import 'package:fitness/screens/diet_plan.dart';
import 'package:fitness/services/auth.dart';
import 'package:fitness/services/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'surya.dart';
import 'yoga.dart';
import 'dietician.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //final _firebaseAuth = FirebaseAuth.instance;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    final move1 = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: 215,
            minWidth: 100,
            //minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DietPlan()));
            },
            child: Icon(
              Icons.food_bank_rounded,
              size: 140,
              color: Colors.blueAccent,
            )));
    final move2 = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: 215,
            minWidth: 100,
            //minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Yoga()));
            },
          child: Image.asset
            ("assets/images/yoga.png",height: 200,width: 140,
            color: Colors.blueAccent,)
        )
    );
    final move4 = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: 215,
            minWidth: 100,
            //minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Dietician()));
            },
            child: Icon(
              Icons.contacts_rounded,
              size: 140,
              color: Colors.blueAccent,
            )));
    final move3 = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          height: 100,
          minWidth: 100,
          //minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signOut().then((value) => Navigator.pop(context));
          },
child: Text('Log Out'),
          // child: Image.asset("assets/images/yoga.png",height: 200,width: 140),
        ));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                      height: 50,
                      child: Text('Welcome',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontFamily: 'Lora',
                              fontSize: 30))),
                  SizedBox(
                      height: 50,
                      child: Text(auth.currentUser!.displayName!,
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontFamily: 'Lora',
                              fontSize: 30))),
                  //Text( auth.currentUser!.displayName!),
                  SizedBox(height: 25),
                  move1,
                  SizedBox(height: 25),
                  move2,
                  SizedBox(height: 25),
                  move4,
                  SizedBox(height: 25),
                  move3,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
