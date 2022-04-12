import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {

  //get

  Future<String> getUserState({required String uid})async{
final ref = FirebaseFirestore.instance.collection('users').doc(uid);
return await ref.get().then((value) {
  print('======>> ${value.data()!['state']}');
  return value.data()!['state'];
});
  }

  // push

  Future<void> pushUserState(
      {required String uid, required String state}) async {
    Map<String, dynamic> userState = {
      "state": state,
    };
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(userState, SetOptions(merge: false))
        .then((value) => print('Pushed $userState'))
        .catchError((e) {
      print('Error ==>> $e');
    });
  }
}
