import 'package:fitness/services/auth.dart';
import 'package:fitness/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'signup.dart';
import 'age.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late LocationPermission permission;
  String? state;
  List<String> _state = [
    'Andaman & Nicobar',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Chandigarh',
    'Daman & Diu',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu & Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Ladakh',
    'Lakshadweep',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Puducherry',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttarakhand',
    'Uttar Pradesh',
    'West Bengal'
  ];

  @override
  void initState() {
    getLocation().then((value) {
      getState(value);
    });
    super.initState();
  }

  Future<Position> getLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    setState(() {
      state = place.locality;
      print('==> state $state');
    });
    return await Geolocator.getCurrentPosition();
  }

  void getState(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    setState(() {
      state = place.administrativeArea;
      print('==> state ${place.toJson()}');
    });
  }

  String? _selectedstate;
  @override
  Widget build(BuildContext context) {
    final move = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_selectedstate != null) {
              FireStore()
                  .pushUserState(
                      uid: Auth().currentUser!.uid,
                      state: _selectedstate.toString())
                  .then(
                    (value) => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Age())),
                  );
            }else if(state != null){
              FireStore()
                  .pushUserState(
                  uid: Auth().currentUser!.uid,
                  state: state.toString())
                  .then(
                    (value) => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Age())),
              );
            }
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
            padding: EdgeInsets.all(50),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text("In which State do you live?",
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontFamily: 'Lora',
                          fontSize: 45)),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectedstate = value;
                      });
                    },
                    value: _selectedstate, // ?? state,

                    // Hide the default underline
                    underline: Container(),
                    hint: Center(
                        child: Text(
                      state.toString(),
                      style: TextStyle(color: Colors.black),
                    )),
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.black,
                      size: 20,
                    ),
                    isExpanded: true,

                    // The list of options
                    items: _state
                        .map((e) => DropdownMenuItem(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              value: e,
                            ))
                        .toList(),

                    // Customize the selected item
                    selectedItemBuilder: (BuildContext context) => _state
                        .map((e) => Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 250,
                ),
                move,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
