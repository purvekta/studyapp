/*
import 'package:flutter/material.dart';
import 'package:studyapp/Screens/mycourse/paidCourseScreen.dart';
//import 'package:studyapp/models/payment/suceespage.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:studyapp/models/constants.dart';
// import 'package:studyapp/sharing/loading.dart';
// import 'package:studyapp/models/CourseUrlData.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:studyapp/models/transDataclass.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:studyapp/models/firebase_database_util.dart';

class RTMycourseListScreen extends StatefulWidget {
  @override
  _RTMycourseListScreenState createState() => _RTMycourseListScreenState();
}

class _RTMycourseListScreenState extends State<RTMycourseListScreen>
    implements AddUserCallback {
  bool _anchorToBottom = false;
  FirebaseDatabaseUtil databaseUtil;

  @override
  void initState() {
    super.initState();
    databaseUtil = new FirebaseDatabaseUtil();
    databaseUtil.initState();
  }

  @override
  void dispose() {
    super.dispose();
    databaseUtil.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My course'),
        ),
        body: Text('Hello'));
  }
  //It will display a item in the list of users.

  Widget showUser(DataSnapshot res) {
    // User user = User.fromSnapshot(res);
    TransRealData transRealData = TransRealData.fromsnapshot(res);
    var item = new Card(
      child: GestureDetector(
        child: new Container(
            child: new Center(
              child: new Row(
                children: <Widget>[
                  new Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      image: DecorationImage(
                        image: NetworkImage(transRealData.courseimg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            transRealData.courseName,
                            style: TextStyle(
                                color: Colors.black87, fontSize: 25.0),
                          ),
                          new Text(
                            'Start the Course',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaidcourseScreen(
                    courseImg: transRealData.courseimg,
                    courseName: transRealData.courseName,
                    courseid: transRealData.courseid)),
          );
        },
      ),
    );

    return item;
  }
  //Get first letter from the name of user

  String getShortName(TransRealData transRealData) {
    String shortName = "";
    if (!transRealData.courseName.isEmpty) {
      shortName = transRealData.courseName.substring(0, 1);
    }
    return shortName;
  }
}

abstract class AddUserCallback {
  //void addUser(User user);

  //void update(User user);
}
*/
