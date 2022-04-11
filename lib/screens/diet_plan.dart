import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DietPlan extends StatefulWidget {
  const DietPlan({Key? key}) : super(key: key);

  @override
  State<DietPlan> createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("diet").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            // print('===============>>>>>>>>>> ${snapshot.data!.docs.toString()}');
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot  document) {
                Map<String, dynamic>  plans = document.data()! as  Map<String, dynamic> ;
                print('===============>>>>>>>>>> $plans');
                return Container(
                  child: Center(child: Text(plans['veg'].toString())),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
