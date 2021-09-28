import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import './userData.dart';

class UserManagement {
  final String uid;
  UserManagement({this.uid});
  //sstore the data in the firebase collection  database
  final CollectionReference userCollection =
      Firestore.instance.collection('/users');
  //  CollectionReference paymentCollection = Firestore.instance.collection('/users').document(uid).collection('payment')
  final fb = FirebaseDatabase.instance;
  Future updateUserDData(
      String emailId, String displayName, String photoUrl, var mobNo) async {
    return await userCollection.document(uid).setData({
      'emailid': emailId,
      'Nick name': displayName,
      'avatar': photoUrl,
      'Mobile No': mobNo,
    });
  }

  /// update payment information in user profiel
  Future updateUserPaymentData(String courseName, String courseId, String payid,
      String courseImage) async {
    return await userCollection
        .document(uid)
        .collection('payment')
        .document()
        .setData({
      'coursename': courseName,
      'courseimage': courseImage,
      'payid': payid,
      'courseId': courseId
    });
  }

  //retrive the payment data form the firebase for particular user

  ////retrive the data from the firebase for particluar user
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      emailId: snapshot.data['emailid'],
      displayname: snapshot.data['Nick name'],
      photoUrl: snapshot.data['avatar'],
      mobNo: snapshot.data['Mobile No'],
    );
  }

  // PaymentData _paymentDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return PaymentData(
  //       courseId: snapshot.data['courseId'],
  //       courseName: snapshot.data['coursename'],
  //       courseimage: snapshot.data['courseimage'],
  //       payid: snapshot.data['payid'],
  //       uid: uid);
  // }
  // PaymentData _paymentDataFromQuerySnapshot(QuerySnapshot snapshot){
  //   return List<PaymentData> paymentData =snapshot.documents.map((documentSnapshot) => PaymentData.fromMap(documentSnapshot.data)).toList();
  // }

  // Stream<PaymentData> get paymentData {
  //   return userCollection
  //       .document(uid)
  //       .collection('transcationData')
  //       .snapshots()
  //       .map(_paymentDataFromSnapshot);
  // }

  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
