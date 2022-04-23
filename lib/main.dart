
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/start.dart';
import 'package:flutter/material.dart';
import 'start.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NUTRIFIT',
      theme: ThemeData(
          primaryColor: Color(0xffa957c6),
          scaffoldBackgroundColor: Color(0xffa957c6)
      ),


      home:Start(),
    );
  }
}
