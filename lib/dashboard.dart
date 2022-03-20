import 'package:flutter/material.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'surya.dart';
import 'yoga.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
            Navigator.push(
                context,MaterialPageRoute(builder: (context)=> Yoga()) );
          },

          child: Icon(Icons.food_bank_rounded,size: 140,color:Colors.blueAccent,)


        )
    );
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
                context,MaterialPageRoute(builder: (context)=> Yoga()) );
          },

            child: Icon(Icons.food_bank_rounded,size: 140,color:Colors.blueAccent,)



        )
    );
    final move3 = Material(
        elevation: 5,

        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          height: 215,
          minWidth: MediaQuery.of(context).size.width,
          //minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.push(
                context,MaterialPageRoute(builder: (context)=> Surya()) );
          },

         // child: Image.asset("assets/images/yoga.png",height: 200,width: 140),


        )
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                SizedBox(width: 25),
                move1,
                SizedBox(width: 25),
                move2,

              ],
            ),
          ),

        ),
      ),


    );
  }
}
