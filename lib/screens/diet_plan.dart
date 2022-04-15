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

  String dietary = 'veg';
  String state = 'Goa';

  @override
  void initState() {
    super.initState();
    getDietary(uid: Auth().currentUser!.uid);
  }

  Future<String> getDietary({required String uid})async{
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
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  children: [
                  dietary != "Veg" ? SizedBox() : Text(dietary),
                    dietary != "Veg" ? SizedBox() : Expanded(
                      child: ListView.builder(
                          itemCount: veg_time.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ],
                            );
                          }),
                    ),
                    dietary != "Non-Veg" ? SizedBox() : Text('Non Veg'),
                    dietary != "Non-Veg" ? SizedBox() : Expanded(
                      child: ListView.builder(
                          itemCount: nonveg_time.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              ],
                            );
                          }),
                    ),
                  ],
                ),
                // child: ListView(
                //   children:
                //       snapshot.data!.get('veg').map((DocumentSnapshot document) {
                //     Map<String, dynamic> plans =
                //         document.data()! as Map<String, dynamic>;
                //     var veg = [];
                //     // plans['maharashtra']['veg'].forEach((key, value) => veg.add(key));
                //     print('===============>>>>>>>>>> ${plans}');
                //     return Column(
                //       children: [
                //         Text('Veg'),
                //         // ListView(
                //         //   children: veg.map((data) {
                //         //     Map<String, dynamic> data =
                //         //         document.data()! as Map<String, dynamic>;
                //         //     return ListTile(
                //         //       title: Text(data[0]),
                //         //       subtitle: Text(data[1]),
                //         //     );
                //         //   }).toList(),
                //         // ),
                //         // Row(
                //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         //   children: [
                //         //     Text(
                //         //       veg[0].toString(),
                //         //       softWrap: true,
                //         //     ),
                //         //     Text(
                //         //       plans['veg'].toString(),
                //         //       softWrap: true,
                //         //     ),
                //         //   ],
                //         // ),
                //       ],
                //     );
                //   }).toList(),
                // ),
              ),
            );
          },
        ),
      ),
    );
  }
}
