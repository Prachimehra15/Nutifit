import 'package:flutter/material.dart';
import 'surya.dart';
import 'bridge.dart';
import 'childpose.dart';
import 'corpse.dart';
import 'downdog.dart';
import 'halfmoon.dart';
import 'mountain.dart';
import 'plank.dart';
import 'revotriangle.dart';
import 'tree.dart';
import 'upwarddog.dart';
import 'warrior.dart';

class Yoga extends StatefulWidget {
  const Yoga({Key? key}) : super(key: key);

  @override
  _YogaState createState() => _YogaState();
}

class _YogaState extends State<Yoga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Yoga Plan',
                        style: TextStyle(fontFamily: 'Lora', fontSize: 30)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('No of asan',
                            style: TextStyle(fontFamily: 'Lora', fontSize: 15)),
                        Spacer(),
                        Text('Sets',
                            style: TextStyle(fontFamily: 'Lora', fontSize: 15)),
                        Spacer(),
                        Text('Reps',
                            style: TextStyle(fontFamily: 'Lora', fontSize: 15)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/thumnails/bridge.jpeg'),
                            colorFilter: ColorFilter.linearToSrgbGamma(),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bridge()));
                          },
                          child: Text(
                            "Bridge Asan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/thumnails/childpose.jpg'),
                            colorFilter: ColorFilter.linearToSrgbGamma(),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Childpose()));
                          },
                          child: Text(
                            "Child's pose Asan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/thumnails/corpse.jpg'),
                            colorFilter: ColorFilter.linearToSrgbGamma(),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Corpse()));
                          },
                          child: Text(
                            "Corpse Asan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/thumnails/downgdog.jpg'),
                            colorFilter: ColorFilter.linearToSrgbGamma(),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Downdog()));
                          },
                          child: Text(
                            "Downward Facing Dog Asan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Halfmoon()));
                          },
                          child: Text(
                            "Half Moon Asan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffd417bc),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mountain()));
                          },
                          child: Text(
                            "Mountain Asan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffd417bc),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Plank()));
                          },
                          child: Text(
                            "Plank",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffd417bc),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Revotriangle()));
                          },
                          child: Text(
                            "Revolved Triangle Asan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffd417bc),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Surya()));
                          },
                          child: Text(
                            "Suryanamaskar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffd417bc),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Tree()));
                          },
                          child: Text(
                            "Tree Asan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffd417bc),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Upwarddog()));
                          },
                          child: Text(
                            "Upward Dog Asan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffd417bc),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          height: 215,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Warrior()));
                          },
                          child: Text(
                            "Warrior-I Asan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffd417bc),
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                      ),
                    ],
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
