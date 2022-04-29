import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {

  //get

  Future<Map<String, dynamic>> getUserDetail({required String uid})async{
final ref = FirebaseFirestore.instance.collection('users').doc(uid);
return await ref.get().then((value) {
  print('======>> ${value.data()!['state']}');
  return value.data()!;
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
        .set(userState, SetOptions(merge: true))
        .then((value) => print('Pushed $userState'))
        .catchError((e) {
      print('Error ==>> $e');
    });
  }

  Future<void> pushUserGender(
      {required String uid, required String gender})async{
    Map<String, dynamic> userGender = {
      "gender": gender,
    };
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(userGender, SetOptions(merge: true))
        .then((value) => print('Pushed $userGender'))
        .catchError((e) {
      print('Error ==>> $e');
    });
}

  Future<void> pushUserDietary(
      {required String uid, required String dietary})async{
    Map<String, dynamic> userDietary = {
      "dietary": dietary,
    };
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(userDietary, SetOptions(merge: true))
        .then((value) => print('Pushed $userDietary'))
        .catchError((e) {
      print('Error ==>> $e');
    });
  }

}
