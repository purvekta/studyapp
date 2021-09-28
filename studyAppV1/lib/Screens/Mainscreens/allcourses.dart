import 'package:flutter/material.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:studyapp/Screens/Widgets/CourseList.dart';
//import 'package:studyapp/Screens/courseScreen/adminCourseUrl.dart';
//import 'package:studyapp/sharing/loading.dart';

class AllCoursePage extends StatelessWidget {
  final String courseName;
  final String courseImg;
  String offerPrice;
  String coursePrice;
  String courseid;
  AllCoursePage(
      {this.courseid,
      this.coursePrice,
      this.offerPrice,
      this.courseImg,
      this.courseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('All Courses'),
        ),
        body: CourseList());
  }

/*
  Container buildCourseList() {
    return Container(
      child: FutureBuilder(
          future: fetchAllCourse(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map allCourse = snapshot.data[index];
                    courseName = allCourse['course_name'];
                    coursePrice = allCourse['course_price'];
                    offerPrice = allCourse['offer_price'];
                    courseImg = allCourse['course_img'];

                    return Card(
                      child: ListTile(
                        leading: Image.network(courseImg),
                        title: Text(
                          //allCourse['course_name'],
                          courseName,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Text(
                              '₹$offerPrice',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '₹$coursePrice',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  decoration: TextDecoration.lineThrough),
                            )
                          ],
                        ),
                        onTap: () {
                          //   Navigator.of(context).pushNamed('/sub5',arguments: DetailsScreen(courseName: 'chemistry',coursePrice:'2500'));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminCourseUrl(
                                      courseName: allCourse['course_name'],
                                      courseImg: allCourse['course_img'],
                                      coursePrice: allCourse['course_price'],
                                      offerPrice: allCourse['offer_price'],
                                      courseid: allCourse['id'],
                                    )),
                          );
                          // Navigator.of(context).pushNamed('/MyCourse');
                        }, // trailing: ,
                      ),
                    );
                  });
            } else {
              return Center(child: Loading());
            }
          }),
    );
  }
*/
}
