import 'package:flutter/material.dart';
import 'dietreq.dart';
class Gen extends StatefulWidget {
  const Gen({Key? key}) : super(key: key);

  @override
  _GenState createState() {
    return _GenState();
  }
}
class Gender
{
  String name;
  IconData icon;
  bool isSelected;
  Gender(this.name, this.icon, this.isSelected);
}

class _GenState extends State<Gen> {
  List<Gender> genders = <Gender>[];

  @override
  Widget build(BuildContext context) {
    final go = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(
                context,MaterialPageRoute(builder: (context)=> Diereq()) );
          },
          child: Text("Continue", textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xffd417bc),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        )
    );
    return Scaffold(
      body:Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(70),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text("What is your gender?",
                      style: TextStyle(color: Color(0xffffffff),fontFamily:'Lora',fontSize: 44)
                  ),
                ),
                SizedBox(height: 60,),

                SizedBox(height: 135,),
                go,
              ],

            ),
          ),
        ),
      )


    );
  }

}


