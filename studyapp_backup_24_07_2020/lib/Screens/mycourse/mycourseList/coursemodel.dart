import 'package:firebase_database/firebase_database.dart';

class RTCourseListModel {
  String _id;
  String _courseName;
  String _payid;
  String _uid;
  String _courseImg;
  String _courseid;
  RTCourseListModel(this._courseImg, this._courseName, this._courseid, this._id,
      this._payid, this._uid);
  String get id => _id;
  String get courseName => _courseName;
  String get payid => _payid;
  String get uid => _uid;
  String get courseImg => _courseImg;
  String get courseid => _courseid;

  RTCourseListModel.fromsnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _courseName = snapshot.value['courseName'];
    _payid = snapshot.value['payid'];
    _uid = snapshot.value['uid'];
    _courseid = snapshot.value['courseid'];
    _courseImg = snapshot.value['courseImg'];
  }
}
