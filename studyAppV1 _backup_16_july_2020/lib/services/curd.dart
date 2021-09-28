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
    if (isLoggedIn()) {
      Firestore.instance
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
}
