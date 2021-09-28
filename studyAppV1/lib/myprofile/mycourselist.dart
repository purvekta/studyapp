//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import '../services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studyapp/Screens/mycourse/PaidcourseScreen.dart';

class CDCourseList extends StatelessWidget {
  String userid;
  CDCourseList({this.userid});
  //final AuthService _auth = AuthService();
  bool coursePayStatus = true;
  //Sucessresponce _sucessresponce;

  @override
  Widget build(BuildContext context) {
    //coursePayStatus = _sucessresponce.checkstatus();
    //print(userid);
    // final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Course'),
        backgroundColor: Colors.teal,
      ),
      body: Container(child: mycourseList()),
    );
  }

  Widget mycourseList() {
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .document(userid)
            .collection('transcationData')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading');
          }
          var coursedata = snapshot.data;
          print(coursedata);
          return ListView(
              children: snapshot.data.documents.map<Widget>((document) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaidcourseScreen(
                            courseName: document['courseName'],
                            courseImg: document['courseImg'],
                            courseid: document['courseid'],
                          )),
                );
              },
              child: Card(
                child: ListTile(
                  leading: Image.network(document['courseImg']),
                  title: Text(document['courseName']),
                  subtitle: Text('Start Now'),
                ),
              ),
            );
          }).toList());

          // print(coursedata['courseName']);
          //var userDocument = snapshot.data;
          // PaymentData paymentData = snapshot.data;
        },
      ),
    );
  }
}
