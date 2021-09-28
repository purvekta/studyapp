//import 'package:flutter/material.dart';
class UserData {
  final String emailId;
  final String displayname;
  final String mobNo;
  final String photoUrl;
  final String uid;
  UserData(
      {this.displayname, this.emailId, this.mobNo, this.photoUrl, this.uid});
}

//import 'package:flutter/material.dart';
// class RDUserData {
//   final String emailId;
//   final String displayname;
//   final String mobNo;
//   final String photoUrl;
//   final String uid;
//   RDUserData(
//       {this.displayname, this.emailId, this.mobNo, this.photoUrl, this.uid});
// }

class PaymentData {
  String courseName;
  String courseId;
  String payid;
  String courseimage;
  String uid;
  PaymentData(
      {this.uid, this.courseId, this.courseName, this.courseimage, this.payid});
}
