import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
    return Card(
        color: _gender.isSelected ? Colors.deepPurple: Colors.lightBlueAccent,
        child: Container(gi
          width: 50,
          height: 50,
          alignment: Alignment.center,
          margin: new EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              )
            ],
          ),
        ));
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
    genders.add(Gender("Male", MdiIcons.genderMale, false));
    genders.add(Gender("Female", MdiIcons.genderFemale, false));
    genders.add(Gender("Others", MdiIcons.genderTransgender, false));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: genders.length,
        itemBuilder: (context, index) {
          return Material(
            child: InkWell(
              splashColor: Colors.pinkAccent,
              onTap: () {
                setState(() {
                  genders.forEach((gender) => gender.isSelected = false);
                  genders[index].isSelected = true;
                });
              },
              child: CustomRadio(genders[index]),
            )
            );

        });
  }
}