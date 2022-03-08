import 'package:flutter/material.dart';
import 'objective.dart';
import 'phyact.dart';
import 'hw.dart';
class Describe extends StatefulWidget {
  const Describe({Key? key}) : super(key: key);

  @override
  _DescribeState createState() {
    return _DescribeState();
  }
}

class Tech
{
  String label;
  Color color;
  Tech(this.label, this.color);
}

class _DescribeState extends State<Describe> {

  int selectedIndex =0;
  List<Tech> _chipsList = [
    Tech("I feel that my body does not lose weight easily", Colors.white),
    Tech("I eat a lot of junk food and rely on food deliveries & eating out", Colors.white),
    Tech("I try to avoid carbohydrates in my diet", Colors.white),
    Tech("I do not like restrictive diets", Colors.white),
    Tech("I usually male healthy eating choices but I eat big quantities", Colors.white),
    Tech("I can't commit to a daily plan, I need days off and cheat meals", Colors.white)
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
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(70),
        child: Column(
          children: <Widget>[
            Container(
              child: Text("Which of the following statements best describes you?",
                  style: TextStyle(color: Color(0xffffffff),fontFamily:'Lora',fontSize: 25)
              ),
            ),
            SizedBox(height: 30,),
            Expanded(child:Wrap(
              spacing: 3,
              direction: Axis.horizontal,
              children: techChips(),
            ),
            ),

            SizedBox(height: 40,),
            go,
          ],

        ),
      ),

    );
  }

  List<Widget> techChips () {
    List<Widget> chips = [];
    for (int i=0; i< _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.all(1),
        child: ChoiceChip(
          label: Text(_chipsList[i].label,
              softWrap: true,
              maxLines: 2,
              overflow:TextOverflow.clip),
          labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17),
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
      SizedBox(width: 5);
      chips.add(item);
    }
    return chips;
  }
}
