import 'package:flutter/material.dart';
import 'package:studyapp/Screens/Widgets/CourseList.dart';
import 'package:studyapp/Screens/Widgets/Rowcourse/courseinRow.dart';
import 'package:studyapp/sharing/loading.dart';
import 'package:studyapp/Screens/courseScreen/adminCourseUrl.dart';
import 'package:studyapp/Screens/Widgets/offers/offers.dart';
import 'package:studyapp/Screens/Mainscreens/allcourses.dart';
import 'package:share/share.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          OffersCoursal(),
          // Stack(
          //   children: <Widget>[
          //     ClipPath(
          //       clipper: CustomShapeClipper(),
          //       child: Container(
          //         color: Colors.amber,
          //         height: 200,
          //         width: 400,
          //         child: Center(
          //           child: Text(
          //             //'Welcome\n $usernickName',
          //             'userData.displayname',
          //             //'Student Name',
          //             style: TextStyle(
          //               fontSize: 20.0,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Container(
              color: Colors.teal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Top Courses',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllCoursePage(),
                        ),
                      );
                    },
                    child: Text('See All',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ],
              )),

          ///details about the three rows
          CourseInRow(courseid1: '8', courseid2: '9'),
          SizedBox(height: 20),
          CourseInRow(courseid1: '4', courseid2: '3'),

          ///ends
          ///out of the stack

          SizedBox(height: 30),
          Container(
              color: Colors.teal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Popular Courses',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllCoursePage(),
                        ),
                      );
                    },
                    child: Text('See All',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ],
              )),
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
                          itemBuilder: (BuildContext context, int index) {
                            Map allCourse = snapshot.data[index];

                            return Container(
                              child: GestureDetector(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 150,
                                      height: 100,
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(17),
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
                                                '???${(allCourse['offer_price'])}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                '???${(allCourse['course_price'])}',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black87,
                                                    decoration: TextDecoration
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
                                        builder: (context) => AdminCourseUrl(
                                              courseName:
                                                  allCourse['course_name'],
                                              courseImg:
                                                  allCourse['course_img'],
                                              coursePrice:
                                                  allCourse['course_price'],
                                              offerPrice:
                                                  allCourse['offer_price'],
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

          //SizedBox(height: 100),
          RaisedButton(
            color: Colors.teal,
            child: Text(
              'Invite a Friend',
              style: TextStyle(
                fontSize: 20,
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

              Share.share('check out my website https://www.pukemy.com');
            },
          ),
          //Text('share with Others and Get 10% Discount'),
        ],
      ),
    );
  }
}
