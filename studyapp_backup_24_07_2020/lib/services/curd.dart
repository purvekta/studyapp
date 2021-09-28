import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(transactionData) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    if (isLoggedIn()) {
      Firestore.instance
          .collection('users')
          .document(user.uid)
          .collection('transcationData')
          .add(transactionData)
          .catchError((e) {
        print(e);
      });
    } else {
      print('First Purchase the course');
    }
  }

  getData() async {
    return await Firestore.instance
        .collection('transcationData')
        .getDocuments();
  }

  getPaymentData(String uid) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return Firestore.instance
        .collection('users')
        .document(user.uid)
        .collection('transcationData')
        .getDocuments();
  }
}
