import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:studyapp/myprofile/profilepage.dart';

class RTUser {
  String _id;
  String _nickname;
  String _emailId;
  String _mobileNo;
  String _profilePic;
  RTUser(this._id, this._emailId, this._mobileNo, this._nickname,
      this._profilePic);
  String get id => _id;
  String get nickname => _nickname;
  String get emailId => _emailId;
  String get mobileNo => _mobileNo;
  String get profilepic => _profilePic;
  RTUser.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _nickname = snapshot.value['nickname'];
    _emailId = snapshot.value['emailId'];
    _mobileNo = snapshot.value['mobileNo'];
    _profilePic = snapshot.value['profilePic'];
  }
}
