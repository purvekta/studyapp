import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:studyapp/Screens/mycourse/paidCourseScreen.dart';
import 'package:studyapp/models/payment/suceespage.dart';
import 'package:studyapp/Screens/videoplayer/videoplayer.dart';
import 'package:studyapp/models/constants.dart';
import 'package:studyapp/sharing/loading.dart';
import 'package:studyapp/models/CourseUrlData.dart';
import 'package:studyapp/services/curd.dart';

String courseUrl = 'http://ckp.pukemy.com/api/courses/';

class MycourseScreen extends StatefulWidget {
  final String courseName;
  final String coursePrice;
  final String vLink;
  final String offerPrice;
  final String courseImg;
  final String courseid;
  final String paymentid;

  MycourseScreen(
      {this.courseImg,
      this.courseid,
      this.offerPrice,
      this.courseName,
      this.coursePrice,
      this.paymentid,
      this.vLink});
  @override
  _MycourseScreenState createState() => _MycourseScreenState();
}

class _MycourseScreenState extends State<MycourseScreen> {
  QuerySnapshot transData;

  CrudMethods crudObj = new CrudMethods();

  @override
  void initState() {
    crudObj.getData().then((results) {
      setState(() {
        transData = results;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.teal,
            expandedHeight: 200.0,
            // floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('My Course'),
              // background: Image.network(
              //     //widget.courseImg,
              //     'https://img-a.udemycdn.com/course/750x422/2638042_ea2c_5.jpg',
              //     fit: BoxFit.cover),
            ),
          ),
          SliverFillRemaining(
              child: Container(
                  height: 400,
                  child: Column(
                    children: <Widget>[
                      Text('Course'),
                      Container(
                          //height: 300,
                          child: RaisedButton(
                              onPressed: () => listPaidCourses(),
                              child: Text('Your Courses'))),
                    ],
                  ))
              // child: Container(
              //     child: Column(
              //   children: <Widget>[
              //     Text('raja'),
              //     Text(widget.courseid),
              //     Text(widget.paymentid),
              //     Container(
              //       child: FutureBuilder(
              //         future: fetchcourseinfo(widget.courseid),
              //         builder: (context, snapshot) {
              //           if (snapshot.hasData) {
              //             return GestureDetector(
              //               child: Container(
              //                   child: Column(
              //                 children: <Widget>[
              //                   ClipRRect(
              //                       borderRadius: BorderRadius.circular(20),
              //                       child: Container(
              //                         width: 150,
              //                         height: 100,
              //                         decoration: BoxDecoration(
              //                             color: Colors.red,
              //                             image: DecorationImage(
              //                                 image: NetworkImage(
              //                                     snapshot.data.courseImg),
              //                                 fit: BoxFit.cover)),
              //                       )),
              //                   Text(snapshot.data.courseName),
              //                 ],
              //               )),
              //               onTap: () {
              //                 //   Navigator.of(context).pushNamed('/sub5',arguments: DetailsScreen(courseName: 'chemistry',coursePrice:'2500'));
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) => PaidcourseScreen(
              //                             courseName: snapshot.data.courseName,
              //                             courseImg: snapshot.data.courseImg,
              //                             coursePrice: snapshot.data.coursePrice,
              //                             offerPrice: snapshot.data.offerPrice,
              //                             courseid: widget.courseid,
              //                           )),
              //                 );
              //                 // Navigator.of(context).pushNamed('/MyCourse');
              //               },
              //             );
              //           } else
              //             return Loading();
              //         },
              //       ),
              //     ),
              //   ],
              // )),

              // child: FutureBuilder(
              //     future: fetchCoursecontents(),
              //     builder: (context, snapshot) {
              //       //    print(snapshot.data);
              //       if (snapshot.hasData) {
              //         List courseTopics = snapshot.data.topic;
              //         print(courseTopics);
              //         return Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             Text('Course Contents'),
              //             Expanded(
              //               child: Container(
              //                 height: 550,
              //                 child: ListView.builder(
              //                   itemCount: courseTopics == null
              //                       ? 0
              //                       : courseTopics.length,
              //                   itemBuilder: (BuildContext context, int index) {
              //                     // var val = courseTopics[index].isLocked;
              //                     // bool ispaid;
              //                     // if (val == 'true') {
              //                     //   ispaid = true;
              //                     // } else {
              //                     //   ispaid = false;
              //                     // }
              //                     // print('boolean$val');
              //                     // print('money$ispaid');
              //                     return Card(
              //                       child: ListTile(
              //                         leading: Container(
              //                           margin: EdgeInsets.only(left: 20),
              //                           height: 30,
              //                           width: 30,
              //                           decoration: BoxDecoration(
              //                             shape: BoxShape.circle,
              //                             color: kGreenColor.withOpacity(1),
              //                           ),
              //                           child: Icon(Icons.play_arrow,
              //                               color: Colors.white),
              //                         ),
              //                         title: Text(courseTopics[index].title),
              //                         // trailing: ispaid
              //                         //     ? Icon(Icons.lock, color: Colors.purple)
              //                         //     : Text(''),
              //                         onTap: () {
              //                           {
              //                             Navigator.push(
              //                                 context,
              //                                 MaterialPageRoute(
              //                                     builder: (context) =>
              //                                         VideoPlayer(
              //                                             vlink:
              //                                                 (courseTopics[index]
              //                                                     .link))));
              //                           }
              //                           //else {}

              //                           // Navigator.of(context).pushNamed('/PlayVideo');
              //                         },
              //                       ),

              //                       //Text(courseTopics[index].title)
              //                     );
              //                   },
              //                 ),
              //               ),
              //             ),

              //             ///add to card and buy Now Button

              //             //Rowbutton(),
              //           ],
              //         );
              //       } else {
              //         return Center(child: Loading());
              //       }
              //     }),
              ),
        ],
      ),
    );
  }

  Widget listPaidCourses() {
    if (transData != null) {
      print(transData);
      return ListView.builder(
          itemCount: transData.documents.length,
          padding: EdgeInsets.all(5.0),
          itemBuilder: (context, i) {
            return new ListTile(
              title: Text(transData.documents[i].data['paymentid']),
              subtitle: Text(transData.documents[i].data['courseid']),
            );
          });
    } else {
      return Text('Loading Please wait....');
    }
  }
}

Future<CourseUrlData> fetchcourseinfo(String courseid) async {
  final courseContentResponse = await http
      .get(courseUrl + courseid, headers: {"accept": "application/json"});
  print(courseUrl + courseid);
  print(CourseUrlData.fromJson(json.decode(courseContentResponse.body)));
  return (CourseUrlData.fromJson(json.decode(courseContentResponse.body)));
}
