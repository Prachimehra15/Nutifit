import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dietreq.dart';
class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}

class CustomRadio extends StatelessWidget {
  Gender _gender;

  CustomRadio(this._gender);

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
              color: _gender.isSelected ? Colors.white : Colors.grey,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(
              _gender.name,
              style: TextStyle(
                  color: _gender.isSelected ? Colors.white : Colors.grey),
            ),

          ],
        ),

      ),
    );
  }
}

class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  List<Gender> genders = <Gender>[];

  @override
  void initState() {
    super.initState();
    genders.add(Gender("Male", MdiIcons.food, false));
    genders.add(Gender("Female", MdiIcons.fish, false));
    genders.add(Gender("Others", MdiIcons.genderTransgender, false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: genders.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.pinkAccent,
                  onTap: () {
                    setState(() {
                      for (var gender in genders) {
                        gender.isSelected = false;
                      }
                      genders[index].isSelected = true;
                    });
                  },
                  child: CustomRadio(genders[index]),
                );
              }),
        ),
      ),
    );
  }
}