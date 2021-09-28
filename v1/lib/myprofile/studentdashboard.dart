/*
this code is related to student dashbpard based on realtime database
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/Screens/mycourse/mycourselist.dart';
import 'package:studyapp/models/RT_user_Profile_util_.dart';
//import 'package:studyapp/myprofile/addStudentData.dart';
import 'package:studyapp/myprofile/studentinfo.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard>
    implements AddUserCallback {
  bool _anchorToBottom = false;

  RT_User_Profile databaseUtil;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseUtil = new RT_User_Profile();
    databaseUtil.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    databaseUtil.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Profile'),
        actions: <Widget>[
          // _buildActions(),
        ],
      ),
      body: Container(
        // color: Colors.blue,
        child: Column(
          children: <Widget>[
            RaisedButton(child: Text('Add the Data'), onPressed: () {}),
            SizedBox(height: 30),
            RaisedButton(child: Text('Show ProfileData'), onPressed: () {}),
            Flexible(
              child: Container(
                color: Colors.blue,
                child: new FirebaseAnimatedList(
                  key: new ValueKey<bool>(_anchorToBottom),
                  query: databaseUtil.getUser(),
                  reverse: _anchorToBottom,
                  sort: _anchorToBottom
                      ? (DataSnapshot a, DataSnapshot b) =>
                          b.key.compareTo(a.key)
                      : null,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    return new SizeTransition(
                      sizeFactor: animation,
                      child: showUser(snapshot),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showUser(DataSnapshot res) {
    RTUser rtuser = RTUser.fromSnapshot(res);

    var item = new Card(
      child: new Container(
          child: new Center(
            child: new Row(
              children: <Widget>[
                new CircleAvatar(
                  radius: 30.0,
                  child: new Text(getShortName(rtuser)),
                  backgroundColor: const Color(0xFF20283e),
                ),
                new Expanded(
                  child: new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          rtuser.nickname,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          rtuser.emailId,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                        new Text(
                          rtuser.mobileNo,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.amber),
                        ),
                      ],
                    ),
                  ),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: const Color(0xFF167F67),
                      ),
                      onPressed: () {},
                      //  onPressed: () => showEditWidget(rtuser, true),
                    ),
                    // new IconButton(
                    //   icon: const Icon(Icons.delete_forever,
                    //       color: const Color(0xFF167F67)),
                    //   onPressed: () => deleteUser(user),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
    );

    return item;
  }

  String getShortName(RTUser rtuser) {
    String shortName = "";
    if (!rtuser.nickname.isEmpty) {
      shortName = rtuser.nickname.substring(0, 1);
    }
    return shortName;
  }

  // // Display popup in user info update mode.
  // showEditWidget(RTUser rtuser, bool isEdit) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) =>
  //         new AddUserDialog().buildAboutDialog(context, this, isEdit, rtuser),
  //   );
  // }
  // Delete a entry from the Firebase console.
  // deleteUser(RTUser rtuser) {
  //   setState(() {
  //     databaseUtil.deleteUser(rtuser);
  //   });
  // }
}
*/
