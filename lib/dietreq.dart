import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'gender.dart';
import 'hw.dart';
class Direq extends StatefulWidget {
  const Direq({Key? key}) : super(key: key);

  @override
  _DireqState createState() {
    return _DireqState();
  }
}
class Diet {
  String name;
  IconData icon;
  bool isSelected;
  Diet(this.name, this.icon, this.isSelected);
}

class _DireqState extends State<Direq> {
  List<Diet> diets = <Diet>[];

  @override
  void initState() {
    super.initState();
    diets.add(Diet("Veg", MdiIcons.foodVariant, false));
    diets.add(Diet("Non-Veg", MdiIcons.fish, false));
  }
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
                context, MaterialPageRoute(builder: (context) => Hw()));
          },
          child: Text(
            "Continue",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xffd417bc),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ));
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(70),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text("What is your dietary requirement?",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontFamily: 'Lora',
                            fontSize: 44)),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 200,
                    child: GridView.builder(
                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3.0,
                          mainAxisSpacing: 3.0,
                        ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: diets.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: Colors.pinkAccent,
                            onTap: () {
                              setState(() {
                                diets.forEach((gender) => gender.isSelected = false);
                                diets[index].isSelected = true;
                              });
                            },
                            child: CustomRadio(diets[index]),
                          );

                        }),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  go,
                ],
              ),
            ),
          ),
        ));
  }
}
class CustomRadio extends StatelessWidget {
  Diet _diet;

  CustomRadio(this._diet);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _diet.isSelected ? Colors.deepPurple : Colors.lightBlueAccent,
      child: Container(
        width: 100,
        height: 50,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              _diet.icon,
              color: _diet.isSelected ? Colors.white : Colors.black,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(
              _diet.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:_diet.isSelected ? Colors.white : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}