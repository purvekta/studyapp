//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studyapp/models/constants.dart';
import 'package:studyapp/models/users.dart';
import 'package:studyapp/services/userData.dart';
import 'RDmyProfile.dart';
import '../services/auth.dart';
import '../Screens/Widgets/customshapclipper.dart';
import 'package:studyapp/models/payment/suceespage.dart';
//import '../models/constants.dart';
import 'package:provider/provider.dart';
import '../services/usermanagement.dart';
//import '../services/userData.dart';
///import './homepage.dart';
import 'package:studyapp/sharing/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CDCourseList extends StatelessWidget {
  String userid;
  CDCourseList({this.userid});
  final AuthService _auth = AuthService();
  bool coursePayStatus = true;
  //Sucessresponce _sucessresponce;

  @override
  Widget build(BuildContext context) {
    //coursePayStatus = _sucessresponce.checkstatus();
    //print(userid);
    // final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('mycourse'),
      ),
      body: Container(child: MycourseList()),
    );
  }

  Widget MycourseList() {
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
          if (snapshot.hasData) {
            var coursedata = snapshot.data;
            print(coursedata);
            return ListView(
                children: snapshot.data.documents.map<Widget>((document) {
              return Card(
                child: ListTile(
                  leading: Image.network(document['courseImg']),
                  title: Text(document['courseName']),
                  subtitle: Text('Start Now'),
                ),
              );
            }).toList());
          }

          // print(coursedata['courseName']);
          //var userDocument = snapshot.data;
          // PaymentData paymentData = snapshot.data;
        },
      ),
    );
  }
}
