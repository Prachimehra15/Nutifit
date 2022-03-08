import 'package:flutter/material.dart';
import 'dietreq.dart';
import 'objective.dart';
class Phyact extends StatefulWidget {
  const Phyact({Key? key}) : super(key: key);

  @override
  _PhyactState createState() {
    return _PhyactState();
  }
}

class Tech
{
  String label;
  Color color;
  Tech(this.label, this.color);
}

class _PhyactState extends State<Phyact> {

  int selectedIndex =0;
  List<Tech> _chipsList = [
    Tech(" Fitness 3-5 times a week", Colors.white),
    Tech("Fitness 1-2 times a week", Colors.white),
    Tech("Barely any activity", Colors.white),
    Tech("Fitness 5-7 times a week", Colors.white)
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
                context,MaterialPageRoute(builder: (context)=> Objec()) );
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
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(70),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text("How physically active are you?",
                      style: TextStyle(color: Color(0xffffffff),fontFamily:'Lora',fontSize: 30)
                  ),
                ),
                SizedBox(height: 60,),
                Wrap(
                  spacing: 10,
                  direction: Axis.horizontal,
                  children: techChips(),
                ),
                SizedBox(height: 150,),
                go,
              ],

            ),
          ),
        ),
      )


    );
  }

  List<Widget> techChips () {
    List<Widget> chips = [];
    for (int i=0; i< _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left:10, right: 5),
        child: ChoiceChip(
          label: Text(_chipsList[i].label),
          labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
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
