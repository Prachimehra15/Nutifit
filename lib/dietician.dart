import 'package:flutter/material.dart';
class Dietician extends StatefulWidget {
  const Dietician({Key? key}) : super(key: key);

  @override
  _DieticianState createState() => _DieticianState();
}

class _DieticianState extends State<Dietician> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 100.0,
                    backgroundImage: AssetImage('assets/images/app logo.png'),
                  ),
                  Text(
                    'Renu Sharma',
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Dietician',
                    style: TextStyle(
                      fontFamily: 'Lora',
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.lightBlueAccent,
                      ),
                      title: Text(
                        '+91 95 xx 999 xxx',
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontFamily: 'Lora',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.alternate_email,
                        color: Colors.lightBlueAccent,
                      ),
                      title: Text(
                        'abc@gmail.com',
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontFamily: 'Lora',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            fontSize: 20.0),
                      ),
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
