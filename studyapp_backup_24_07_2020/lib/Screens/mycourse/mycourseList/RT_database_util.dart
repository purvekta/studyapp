import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:studyapp/Screens/mycourse/mycourseList/coursemodel.dart';

class RTDataBaseUtil {
  DatabaseReference _counterRef;
  DatabaseReference _userRef;
  StreamSubscription<Event> _counterSubscription;
  StreamSubscription<Event> _messageSubscription;
  FirebaseDatabase database = new FirebaseDatabase();
  int _counter;
  DatabaseError error;
  static final RTDataBaseUtil _instance = new RTDataBaseUtil.internal();
  RTDataBaseUtil.internal();
  factory RTDataBaseUtil() {
    return _instance;
  }
  void initState() {
    _counterRef = FirebaseDatabase.instance.reference().child('counter');

    //demostrate the firebase data directly
    _userRef = database.reference().child('chandresh');
    database.reference().child('counter').once().then((DataSnapshot snapshot) {
      print('conntecte dto second database  and read ${snapshot.value}');
    });
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    _counterRef.keepSynced(true);
    _counterSubscription = _counterRef.onValue.listen((Event event) {
      error = null;
      _counter = event.snapshot.value ?? 0;
    }, onError: (Object o) {
      error = o;
    });
  }

  DatabaseError getError() {
    return error;
  }

  int getCounter() {
    return _counter;
  }

  DatabaseReference getUser() {
    return _userRef;
  }

  addRTTransData(RTCourseListModel rtCourseListModel) async {
    final TransactionResult transactionResult =
        await _counterRef.runTransaction((MutableData mutableData) async {
      mutableData.value = (mutableData.value ?? 0) + 1;

      return mutableData;
    });
    if (transactionResult.committed) {
      _userRef.push().set(<String, String>{
        'courseName': '' + rtCourseListModel.courseName,
        'payid': '' + rtCourseListModel.payid,
        'courseid': '' + rtCourseListModel.courseid,
        'courseImg': '' + rtCourseListModel.courseImg,
      }).then((_) => print('transcation commited'));
    } else {
      print('transcation not commited');
      if (transactionResult.error != null) {
        print(transactionResult.error.message);
      }
    }
  }
  //  void deleteUser(RTCourseListModel rtCourseListModel) async {
  //   await _userRef.child(user.id).remove().then((_) {
  //     print('Transaction  committed.');
  //   });
  // }

  // void updateUser(RTCourseListModel rtCourseListModel) async {
  //   await _userRef.child(user.id).update({
  //     "name": "" + user.name,
  //     "age": "" + user.age,
  //     "email": "" + user.email,
  //     "mobile": "" + user.mobile,
  //   }).then((_) {
  //     print('Transaction  committed.');
  //   });
  // }

  void dispose() {
    //_messagesSubscription.cancel();
    _counterSubscription.cancel();
  }
}
