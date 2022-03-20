import 'package:flutter/material.dart';
import 'dietreq.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Gen extends StatefulWidget {
  const Gen({Key? key}) : super(key: key);

  @override
  _GenState createState() {
    return _GenState();
  }
}

class Gender {
  String name;
  IconData icon;
  bool isSelected;
  Gender(this.name, this.icon, this.isSelected);
}

class _GenState extends State<Gen> {
  List<Gender> genders = <Gender>[];

  @override
  void initState() {
    super.initState();
    genders.add(Gender("Male", MdiIcons.genderMale, false));
    genders.add(Gender("Female", MdiIcons.genderFemale, false));
    genders.add(Gender("Others", MdiIcons.genderTransgender, false));
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
                context, MaterialPageRoute(builder: (context) => Diereq()));
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
                    child: Text("What is your gender?",
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
                        itemCount: genders.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: Colors.pinkAccent,
                            onTap: () {
                              setState(() {
                                genders.forEach((gender) => gender.isSelected = false);
                                genders[index].isSelected = true;
                              });
                            },
                            child: CustomRadio(genders[index]),
                          );

                        }),
                  ),
                  SizedBox(
                    height: 135,
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
  Gender _gender;

  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _gender.isSelected ? Colors.deepPurple : Colors.lightBlueAccent,
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
              _gender.icon,
              color: _gender.isSelected ? Colors.white : Colors.black,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(
              _gender.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _gender.isSelected ? Colors.white : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}