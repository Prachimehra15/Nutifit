import 'dart:ui';

import 'package:fitness/screens/diet_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/raised_button.dart';
import 'package:flutter/src/widgets/image_icon.dart';
import 'login.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NUTRIFIT'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset(
                  "assets/images/app logo.png",
                  height: 500,
                ),
              ),
            ),
            Container(
                width: 300,
                height: 40,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    textColor: Colors.white,
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.fromLTRB(100, 4, 4, 4),
                              child: Text(
                                'GET STARTED',
                                style: TextStyle(
                                  color: Color(0xffd417bc),
                                  fontFamily: 'Lora',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                              child: Icon(
                                Icons.play_arrow,
                                color: Color(0xffd417bc),
                                size: 40,
                              ),
                            ),
                          ],
                        ))))
          ],
        ),
      ),
    );
  }
}
