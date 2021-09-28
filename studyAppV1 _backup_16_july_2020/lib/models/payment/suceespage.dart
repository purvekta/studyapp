import 'package:flutter/material.dart';
import 'package:studyapp/Screens/mycourse/mycoursescreen_old.dart';
import 'package:studyapp/services/curd.dart';

class Sucessresponce extends StatefulWidget {
  String courseid;
  String paymentid;
  Sucessresponce({this.courseid, this.paymentid});

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
                  Map<String, dynamic> transcationData = <String, dynamic>{
                    'paymentid': this.widget.paymentid,
                    'courseid': this.coid
                  };
                  curObj.addData(transcationData).then((result) {
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                              'Congratulations You Have Sucessfully Purchased the Course'),
                          Text(widget.courseid),
                          Text(widget.paymentid),
                        ],
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

// if(paymentresponce != 'null') {
//                   print('payment sucessfull');
//               }
//               else {
//                 print('payment failed');
//               }
