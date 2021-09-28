import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/Screens/CourseList.dart';
import 'package:studyapp/Screens/Rowcourse.dart/courseinRow.dart';
//import 'package:studyapp/Screens/courseScreen/coursedata.dart';
import 'package:studyapp/models/users.dart';
import 'package:studyapp/services/userData.dart';
import 'package:studyapp/sharing/loading.dart';
import 'package:studyapp/Screens/courseScreen/adminCourseUrl.dart';
//import 'courscreen_updated.dart';
//import 'coursescreen.dart';
import 'customshapclipper.dart';
//import '../models/constants.dart';
import '../services/usermanagement.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: UserManagement(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipPath(
                        clipper: CustomShapeClipper(),
                        child: Container(
                          color: Colors.amber,
                          height: 200,
                          width: 400,
                          child: Center(
                            child: Text(
                              //'Welcome\n $usernickName',
                              userData.displayname,
                              //'Student Name',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      color: Colors.amberAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Top Courses',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(width: 30),
                          Text('See All',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ],
                      )),

                  ///details about the three rows
                  CourseInRow(courseid1: '8', courseid2: '9'),
                  SizedBox(height: 20),
                  CourseInRow(courseid1: '4', courseid2: '3'),

                  ///ends
                  ///out of the stack

                  SizedBox(height: 30),
                  Text(
                    'Popular Videos',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 400,
                    //  color: Colors.redAccent,
                    child: Container(
                      width: 350,
                      height: 100,
                      child: FutureBuilder(
                          future: fetchAllCourse(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              //return ListView.builder(
                              return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Map allCourse = snapshot.data[index];

                                    return Container(
                                      child: GestureDetector(
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              width: 150,
                                              height: 100,
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(17),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      allCourse['course_img']),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              //child: Text('raje')
                                            ),
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    allCourse['course_name'],
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        '₹${(allCourse['offer_price'])}',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      Text(
                                                        '₹${(allCourse['course_price'])}',
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black87,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AdminCourseUrl(
                                                      courseName: allCourse[
                                                          'course_name'],
                                                      courseImg: allCourse[
                                                          'course_img'],
                                                      coursePrice: allCourse[
                                                          'course_price'],
                                                      offerPrice: allCourse[
                                                          'offer_price'],
                                                      courseid: allCourse['id'],
                                                    )),
                                          );
                                          // Navigator.of(context).pushNamed('/MyCourse');
                                        },
                                      ),
                                    );
                                  });
                            } else {
                              return Loading();
                            }
                          }),
                    ),
                  ),
                  Container(
                    color: Colors.teal,
                    height: 30,
                    width: 400,
                    child: RaisedButton(
                      color: Colors.amber,
                      child: Text(
                        'Share with Others',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      onPressed: () {
                        // final RenderBox box = context.findRenderObject();
                        // Share.share(text,
                        //     subject: subject,
                        //     sharePositionOrigin:
                        //         box.localToGlobal(Offset.zero) & box.size);

                        // Share.share('check out my website https://www.pukemy.com');
                      },
                    ),
                  ),
                  Text('share'),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
