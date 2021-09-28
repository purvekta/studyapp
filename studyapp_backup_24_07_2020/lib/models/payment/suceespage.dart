import 'package:flutter/material.dart';
import 'package:studyapp/Screens/mycourse/mycoursescreen_old.dart';
import 'package:studyapp/models/constants.dart';
import 'package:studyapp/models/payment/suceespage_Real_Time_DB.dart';
import 'package:studyapp/services/curd.dart';

class Sucessresponce extends StatefulWidget {
  String courseid;
  String paymentid;
  String courseName;
  String courseImg;
  bool updateStatus;
  var counter;

  Sucessresponce(
      {this.courseImg,
      this.courseName,
      this.courseid,
      this.paymentid,
      this.counter});
  bool checkstatus() {
    if (counter) {
      return true;
    } else {
      return false;
    }
    //bool coursePayStatus = true;
    //return true;
  }

  @override
  _SucessresponceState createState() => _SucessresponceState();
}

class _SucessresponceState extends State<Sucessresponce> {
  dynamic coid;
  CrudMethods curObj = new CrudMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sucess'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[],
              ),
            ),
            RaisedButton(
                child: Text('MyCourseDetail'),
                onPressed: () {
                  coid = (widget.courseid).toString();
                  // Map transcationData = {
                  //   'paymentid': this.widget.paymentid,
                  //   'courseid': (this.widget.courseid).toString()
                  // };
                  //   bool status = checkstatus();
                  Map<String, dynamic> transcationData = <String, dynamic>{
                    'paymentid': this.widget.paymentid,
                    'courseid': this.coid,
                    'courseName': this.widget.courseName,
                    'courseImg': this.widget.courseImg
                  };
                  curObj.addData(transcationData).then((result) {
                    this.widget.updateStatus = true;
                    //TransData _transdata;
                    Container(
                      child: Column(children: <Widget>[
                        Text(
                            'Congratulations You Have Sucessfully Purchased {_transdata.courseName} the Course'),
                        Text(widget.courseid),
                        Text(widget.paymentid),
                      ]
                          //Text()
                          ),
                    );
                  }).catchError((e) {
                    print(e);
                  });
                }),
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
}
