import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/Screens/mycourse/mycoursescreen_old.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'package:studyapp/sharing/loading.dart';
//import 'package:studyapp/services/curd.dart';

class RTSucessRes extends StatefulWidget {
  String courseid;
  String paymentid;
  String courseImg;
  String courseName;

  RTSucessRes({this.courseid, this.paymentid, this.courseImg, this.courseName});
  @override
  _RTSucessResState createState() => _RTSucessResState();
}

class _RTSucessResState extends State<RTSucessRes> {
  Future<TransData> _futureTrans;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sucess'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Smapled data'),
            Text(widget.courseid),
            Text(widget.paymentid),
            Text(widget.courseImg),
            Text(widget.courseName),
            Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                        child: Text('data'),
                        onPressed: () {
                          setState(() {
                            _futureTrans = addRTData(
                                widget.courseid,
                                widget.paymentid,
                                widget.courseName,
                                widget.courseImg);
                            //   _futureTrans = addTransaction(
                            //       widget.courseid,
                            //       widget.paymentid,
                            //       widget.courseName,
                            //       widget.courseImg);
                          });
                        })
                  ],
                )),
            RaisedButton(
                child: Text('MyCourse'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MycourseScreen(
                              courseid: widget.courseid,
                              paymentid: widget.paymentid)));
                })
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
  // Future<TransData> addTransaction(String courseid, String payid,
  //     String courseName, String courseImg) async {
  //   const payurl = 'https://stduyapp.firebaseio.com/transdata.json';
  //   await http.post(payurl,
  //       body: json.encode(<String, String>{
  //         'courseid': courseid,
  //         'payid': payid,
  //         'courseName': courseName,
  //         'courseimg': courseImg,
  //       }));
  //   //.then((response) => {});
  // }

  Future<TransData> addRTData(String courseid, String payid, String courseName,
      String courseImg) async {
    final fb = FirebaseDatabase.instance;
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final ref = fb.reference().child('users').child(user.uid).child('courses');

    await ref.child(user.uid).set({
      'courseid': courseid,
      'payid': payid,
      'courseName': courseName,
      'courseImg': courseImg,
    });
    return TransData(
        courseImg: courseImg,
        courseName: courseName,
        courseid: courseid,
        payid: payid);
  }
}

class TransData {
  String courseName;
  String courseid;
  String payid;
  String courseImg;
  TransData({this.courseImg, this.courseName, this.courseid, this.payid});

  factory TransData.fromJson(Map<String, dynamic> json) {
    return TransData(
        courseid: json['courseid'],
        courseName: json['courseName'],
        courseImg: json['courseImg'],
        payid: json['payid']);
  }
}
