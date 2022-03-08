
import 'package:fitness/start.dart';
import 'package:flutter/material.dart';
import 'start.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NUTRIFIT',
      theme: ThemeData(
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Color(0xffE91C4C)
      ),


      home:Start(),
    );
  }
}

