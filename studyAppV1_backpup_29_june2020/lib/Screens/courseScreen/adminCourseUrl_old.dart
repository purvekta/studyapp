/*
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studyapp/Screens/customshapclipper.dart';
import 'package:studyapp/Screens/videoplayer/videoplayer.dart';
import 'package:studyapp/models/constants.dart';
import 'package:studyapp/sharing/loading.dart';

String courseUrl = 'http://ckp.pukemy.com/api/courses/7';

class AdminCourseUrl extends StatefulWidget {
  // final String courseName;
  // final String coursePrice;
  // final String vLink;

  // AdminCourseUrl({this.courseName, this.coursePrice,this.vLink});
  @override
  _AdminCourseUrlState createState() => _AdminCourseUrlState();
}

class _AdminCourseUrlState extends State<AdminCourseUrl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Ram'),
        // ),
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
                    'widget.courseName',
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
        Text('Course Contents'),
        Column(
          children: <Widget>[
            Container(
              // height: 600,
              child: FutureBuilder(
                  future: fetchCoursecontents(),
                  builder: (context, snapshot) {
                    print(snapshot.data);
                    if (snapshot.hasData) {
                      // var data  = snapshot.data.content.toString();
                      //print(data);
                      List courseTopics = snapshot.data.topic;
                      //   print(courseTopics);
                      //Image.network(snapshot.data.courseImg.toString()),
                      //     //Text(snapshot.data.coursePrice.toString()),
                      //     //Text(snapshot.data.courseName.toString()),
                      //return
                      return Column(
                        children: <Widget>[
                          Rowbutton(),

                          //  Image.network(snapshot.data.courseImg.toString()),
                          Text(snapshot.data.coursePrice.toString()),
                          Text(snapshot.data.courseName.toString()),
                          Container(
                            height: 550,
                            child: ListView.builder(
                              itemCount: courseTopics == null
                                  ? 0
                                  : courseTopics.length,
                              itemBuilder: (BuildContext context, int index) {
                                //   bool islocked = courseTopics[index].isLocked;
                                return Card(
                                  child: ListTile(
                                    leading: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kGreenColor.withOpacity(1),
                                      ),
                                      child: Icon(Icons.play_arrow,
                                          color: Colors.white),
                                    ),
                                    title: Text(courseTopics[index].title),
                                    // trailing: (Bool.valueOf(courseTopics[index].isLocked))
                                    //     ? Icon(Icons.lock, color: Colors.purple)
                                    //     : Text(''),
                                  ),
                                  //Text(courseTopics[index].title)
                                );
                                // return Text(courseTopics[index]['title'] ?? '');
                              },
                            ),
                          ),

                          // Container(
                          //   height: 300,
                          //   child: Text('courseTopics'),
                          // ),
                          // Container(
                          //   height: 300,
                          //   child: ListView.builder(
                          //     itemCount: snapshot.data.topic.length,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       print(snapshot.data.topic['courseId']);
                          //       //List topics = snapshot.data.topic;
                          //       return Card(
                          //         child: Text('topics'),
                          //       );
                          //     },
                          //   ),
                          // ),
                          // Column(
                          //   children: <Widget>[

                          //     // Container(
                          //     //   height: 200,
                          //     //   child: Text(snapshot.data.topic['title']),
                          //     // )
                          //   ],
                          // ),
                        ],
                      );
                    } else {
                      return Center(child: Loading());
                    }
                    //  var data = json.decode(snapshot.data.toString());
                  }),
            ),
          ],
        ),
      ],
    )));
  }

  Future<CourseUrlData> fetchCoursecontents() async {
    final courseContentResponse =
        await http.get(courseUrl, headers: {"accept": "application/json"});
    //var conversionDatajson=CourseUrlData.fromJson(json.decode(courseContentResponse.body));

    //print(CourseUrlData.fromJson(json.decode(courseContentResponse.body)));
    return (CourseUrlData.fromJson(json.decode(courseContentResponse.body)));
    //var conversionDatajson = jsonDecode(courseContentResponse.body);
    //    print(conversionDatajson);
    //  return conversionDatajson;
  }
}
/*
class CourseUrlData {
  final String courseId;
  final String title;
  final String content;
  final String course_image;
  final String topic;
  CourseUrlData(
      {this.topic, this.content, this.title, this.courseId, this.course_image});
  factory CourseUrlData.fromJson(Map<String, dynamic> json) {
    return CourseUrlData(
      courseId: json['id'].toString(),
      title: json['course_name'],
      course_image:json['course_img'], 
      //   topic: json['topic']
    );
  }
}
*/

class CourseUrlData {
  String id;
  String createDate;
  String courseName;
  String coursePrice;
  String courseImg;
  String offerPrice;
  String isPaid;
  String lastUpdated;
  List<Topic> topic;

  CourseUrlData(
      {this.id,
      this.createDate,
      this.courseName,
      this.coursePrice,
      this.courseImg,
      this.offerPrice,
      this.isPaid,
      this.lastUpdated,
      this.topic});

  CourseUrlData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDate = json['create_date'];
    courseName = json['course_name'];
    coursePrice = json['course_price'];
    courseImg = json['course_img'];
    offerPrice = json['offer_price'];
    isPaid = json['is_paid'];
    lastUpdated = json['last_updated'];
    if (json['topic'] != null) {
      topic = new List<Topic>();
      json['topic'].forEach((v) {
        topic.add(new Topic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['create_date'] = this.createDate;
    data['course_name'] = this.courseName;
    data['course_price'] = this.coursePrice;
    data['course_img'] = this.courseImg;
    data['offer_price'] = this.offerPrice;
    data['is_paid'] = this.isPaid;
    data['last_updated'] = this.lastUpdated;
    if (this.topic != null) {
      data['topic'] = this.topic.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Topic {
  String id;
  String createDate;
  String title;
  String link;
  String courseId;
  String isLocked;
  String lastUpdated;

  Topic(
      {this.id,
      this.createDate,
      this.title,
      this.link,
      this.courseId,
      this.isLocked,
      this.lastUpdated});

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDate = json['create_date'];
    title = json['title'];
    link = json['link'];
    courseId = json['course_id'];
    isLocked = json['is_locked'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['create_date'] = this.createDate;
    data['title'] = this.title;
    data['link'] = this.link;
    data['course_id'] = this.courseId;
    data['is_locked'] = this.isLocked;
    data['last_updated'] = this.lastUpdated;
    return data;
  }
}

Container Rowbutton() {
  return Container(
    padding: EdgeInsets.only(top: 20),
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 170,
          height: 60,
          child: RaisedButton(
            onPressed: () {},
            color: Colors.red,
            child: Text(
              'ADD TO CART',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Container(padding: EdgeInsets.only(left: 10)),
        SizedBox(
          width: 170,
          height: 60,
          child: RaisedButton(
            onPressed: () {},
            color: Colors.red,
            child: Text(
              'Buy Now',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
*/
