import 'package:flutter/material.dart';
class Yoga extends StatefulWidget {
  const Yoga({Key? key}) : super(key: key);

  @override
  _YogaState createState() => _YogaState();
}

class _YogaState extends State<Yoga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.pink,
                    Colors.deepPurple,
                  ],
                  stops: [
                    0.3,
                    0.7,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.all(70),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text("How old are you?",
                        style: TextStyle(color: Color(0xffffffff),fontFamily:'Lora',fontSize: 45)
                    ),
                  ),

                ],

              ),
            ),
          ),
        )


    );
  }
}
