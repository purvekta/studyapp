import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:studyapp/Screens/courseScreen/adminCourseUrl.dart';
import 'package:studyapp/models/CourseUrlData.dart';
import 'package:studyapp/models/constants.dart';
import 'package:studyapp/sharing/loading.dart';

class CourseInRow extends StatelessWidget {
  final String courseid1;
  final String courseid2;
  CourseInRow({this.courseid1, this.courseid2});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: FutureBuilder(
              future: fetchcourseinfo(courseid1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GestureDetector(
                    child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(snapshot.data.courseImg),
                                      fit: BoxFit.cover)),
                            ))),
                    onTap: () {
                      //   Navigator.of(context).pushNamed('/sub5',arguments: DetailsScreen(courseName: 'chemistry',coursePrice:'2500'));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminCourseUrl(
                                  courseName: snapshot.data.courseName,
                                  courseImg: snapshot.data.courseImg,
                                  coursePrice: snapshot.data.coursePrice,
                                  offerPrice: snapshot.data.offerPrice,
                                  courseid: courseid1,
                                )),
                      );
                      // Navigator.of(context).pushNamed('/MyCourse');
                    },
                  );
                } else
                  return Loading();
              },
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            child: FutureBuilder(
              future: fetchcourseinfo(courseid2),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GestureDetector(
                    child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(snapshot.data.courseImg),
                                      fit: BoxFit.cover)),
                            ))),
                    onTap: () {
                      //   Navigator.of(context).pushNamed('/sub5',arguments: DetailsScreen(courseName: 'chemistry',coursePrice:'2500'));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminCourseUrl(
                                  courseName: snapshot.data.courseName,
                                  courseImg: snapshot.data.courseImg,
                                  coursePrice: snapshot.data.coursePrice,
                                  offerPrice: snapshot.data.offerPrice,
                                  courseid: courseid1,
                                )),
                      );
                      // Navigator.of(context).pushNamed('/MyCourse');
                    },
                  );
                } else
                  return Loading();
              },
            ),
          ),
        ],
      ),
    );
  }
}

//final String courseid = '9';
Future<CourseUrlData> fetchcourseinfo(String courseid) async {
  final courseContentResponse = await http
      .get(courseUrl + courseid, headers: {"accept": "application/json"});
  print(courseUrl + courseid);
  print(CourseUrlData.fromJson(json.decode(courseContentResponse.body)));
  return (CourseUrlData.fromJson(json.decode(courseContentResponse.body)));
}
