import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/services/auth.dart';
import 'package:fitness/services/firebase.dart';
import 'package:flutter/material.dart';

class DietPlan extends StatefulWidget {
  const DietPlan({Key? key}) : super(key: key);

  @override
  State<DietPlan> createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
  String dietary = 'Veg';
  String state = 'Goa';

  @override
  void initState() {
    super.initState();
    getDietary(uid: Auth().currentUser!.uid);
  }

  Future<String> getDietary({required String uid}) async {
    await FireStore().getUserDetail(uid: uid).then((value) {
      print("Data from firebase => ${value.toString()}");
      setState(() {
        dietary = value['dietary'];
        state = value['state'];
      });
    });
    return dietary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("diet")
              .doc(state)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            // print('===============>>>>>>>>>> ${snapshot.data!.docs.toString()}');
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            Map<String, dynamic> plans =
                snapshot.data!.data() as Map<String, dynamic>;
            var veg_time = [];
            var veg_food = [];
            var nonveg_time = [];
            var nonveg_food = [];
            plans['Veg'].forEach((key, value) => veg_time.add(key));
            plans['Veg'].forEach((key, value) => veg_food.add(value));
            plans['Non-Veg'].forEach((key, value) => nonveg_time.add(key));
            plans['Non-Veg'].forEach((key, value) => nonveg_food.add(value));
            return Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.2,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  children: [
                    dietary != "Veg"
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(dietary,
                                style: TextStyle(
                                    fontFamily: 'Lora', fontSize: 30)),
                          ),
                    dietary != "Veg"
                        ? SizedBox()
                        : Expanded(
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: veg_time.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              Color.fromARGB(85, 255, 255, 255),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                veg_time[index].toString(),
                                                softWrap: true,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                veg_food[index].toString(),
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                    dietary != "Non-Veg"
                        ? SizedBox()
                        : Text('Non Veg',
                            style: TextStyle(fontFamily: 'Lora', fontSize: 30)),
                    dietary != "Non-Veg"
                        ? SizedBox()
                        : Expanded(
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: nonveg_time.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              Color.fromARGB(85, 255, 255, 255),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                nonveg_time[index].toString(),
                                                softWrap: true,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                nonveg_food[index].toString(),
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
