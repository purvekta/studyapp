//this page shows the screen of the course

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Widgets/customshapclipper.dart';
import '../../models/constants.dart';
import '../Widgets/coursecontents.dart';

class DetailsScreen extends StatefulWidget {
  final String courseName;
  final String coursePrice;

  DetailsScreen({this.courseName, this.coursePrice});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                        widget.courseName,
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                //SvgPicture.asset("assets/icons/arrow-left.svg"),
                Positioned(
                  width: 30,
                  top: 50,
                  left: 10,
                  child: GestureDetector(
                    child: SvgPicture.asset("assets/icons/arrow-left.svg"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            //   Text('Subjects'),
            Column(
              children: <Widget>[
                Text("Course Content", style: kTitleTextStyle),
                SizedBox(height: 30),
                CourseContent(
                  number: "01",
                  duration: 5.35,
                  title: "Welcome to the Course",
                  isDone: true,
                  isFree: true,
                ),
                CourseContent(
                  number: '02',
                  duration: 19.04,
                  title: "Design Thinking - Intro",
                  isDone: true,
                  isFree: false,
                ),
                CourseContent(
                  number: '03',
                  duration: 15.35,
                  title: "Design Thinking Process",
                  isDone: true,
                ),
                CourseContent(
                  number: '04',
                  duration: 5.35,
                  title: "Customer Perspective",
                ),
                CourseContent(
                  number: "05",
                  duration: 5.35,
                  title: "Welcome to the Course",
                  isDone: true,
                ),
                CourseContent(
                  number: '06',
                  duration: 19.04,
                  title: "Design Thinking - Intro",
                  isDone: true,
                ),
                CourseContent(
                  number: '07',
                  duration: 15.35,
                  title: "Design Thinking Process",
                ),
                CourseContent(
                  number: '08',
                  duration: 5.35,
                  title: "Customer Perspective",
                ),

                // RaisedButton(
                //   onPressed: (){
                //       //   Navigator.push(context, MaterialPageRoute(builder: (context)=> PopularCourses()));
                // },
                // child: Text('Popularcourse')),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 50,
                        color: kTextColor.withOpacity(.1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      // Container(
                      //   padding: EdgeInsets.all(14),
                      //   height: 56,
                      //   width: 80,
                      //   decoration: BoxDecoration(
                      //     color: Color(0xFFFFEDEE),
                      //     borderRadius: BorderRadius.circular(40),
                      //   ),
                      //   child:
                      //       SvgPicture.asset("assets/icons/shopping-bag.svg"),
                      // ),
                      //  SizedBox(width: 20),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/Subscribe');
                          },
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: kBlueColor,
                                ),
                                child: Text(
                                  "Subscribe Now",
                                  style: kSubtitleTextSyule.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
