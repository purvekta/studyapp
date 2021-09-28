import 'package:firebase_database/firebase_database.dart';

class TransRealData {
  String _userid;
  String _courseid;
  String _payid;
  String _courseimg;
  String _courseName;
  TransRealData(this._userid, this._courseName, this._courseid, this._courseimg,
      this._payid);

  String get userid => _userid;
  String get courseName => _courseName;
  String get courseid => _courseid;
  String get payid => _payid;
  String get courseimg => _courseimg;
  TransRealData.fromsnapshot(DataSnapshot snapshot) {
    _userid = snapshot.key;
    _courseName = snapshot.value['courseName'];
    _courseid = snapshot.value['courseid'];
    _courseimg = snapshot.value['courseimg'];
    _payid = snapshot.value['payid'];
  }
}
