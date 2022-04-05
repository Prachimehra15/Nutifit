import 'package:fitness/describe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'phyact.dart';
import 'hw.dart';
class Objec extends StatefulWidget {
  const Objec({Key? key}) : super(key: key);

  @override
  _ObjecState createState() {
    return _ObjecState();
  }
}

class Tech
{
  String label;
  Color color;
  Tech(this.label, this.color);
}

class _ObjecState extends State<Objec> {

  int selectedIndex =0;
  List<Tech> _chipsList = [

    Tech("Gain Weight", Colors.white),

    Tech("Weight Loss", Colors.white)
  ];

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
                context,MaterialPageRoute(builder: (context)=> Hw()) );
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
      body: Center(
        child: SingleChildScrollView(
          child:Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(70),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text("What is your objective?",
                      style: TextStyle(color: Color(0xffffffff),fontFamily:'Lora',fontSize: 44)
                  ),
                ),
                SizedBox(height: 60,),
                Wrap(
                  spacing: 10,
                  direction: Axis.horizontal,
                  children: techChips(),
                ),
                SizedBox(height: 110,),
                go,
              ],

            ),
          ),
        ),
      ),


    );
  }

  List<Widget> techChips () {
    List<Widget> chips = [];
    for (int i=0; i< _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left:10, right: 5),
        child: ChoiceChip(
          label: Text(_chipsList[i].label,
            softWrap: true,
            maxLines: 2,
            overflow:TextOverflow.clip),

          labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
          backgroundColor: Colors.lightBlueAccent,
          selectedColor: Colors.deepPurple,
          selected: selectedIndex == i,
          onSelected: (bool value)
          {
            setState(() {
              selectedIndex = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
