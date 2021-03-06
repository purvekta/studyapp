import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studyapp/Screens/customshapclipper.dart';
import 'package:studyapp/Screens/videoplayer/videoplayer.dart';
import 'package:studyapp/models/constants.dart';
import 'package:studyapp/sharing/loading.dart';
import 'package:studyapp/models/CourseUrlData.dart';

String courseUrl = 'http://ckp.pukemy.com/api/courses/';

class AdminCourseUrl extends StatefulWidget {
  final String courseName;
  final String coursePrice;
  final String vLink;
  final String offerPrice;
  final String courseImg;
  final String courseid;

  AdminCourseUrl(
      {this.courseImg,
      this.courseid,
      this.offerPrice,
      this.courseName,
      this.coursePrice,
      this.vLink});
  @override
  _AdminCourseUrlState createState() => _AdminCourseUrlState();
}

class _AdminCourseUrlState extends State<AdminCourseUrl> {
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
              title: Text(widget.courseName),
              background: Image.network(widget.courseImg,
                  //   'https://img-a.udemycdn.com/course/750x422/2638042_ea2c_5.jpg',
                  fit: BoxFit.cover),
            ),
          ),
          SliverFillRemaining(
            child: FutureBuilder(
                future: fetchCoursecontents(),
                builder: (context, snapshot) {
                  //    print(snapshot.data);
                  if (snapshot.hasData) {
                    List courseTopics = snapshot.data.topic;
                    print(courseTopics);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Course Contents'),
                        Expanded(
                          child: Container(
                            height: 550,
                            child: ListView.builder(
                              itemCount: courseTopics == null
                                  ? 0
                                  : courseTopics.length,
                              itemBuilder: (BuildContext context, int index) {
                                var val = courseTopics[index].isLocked;
                                bool ispaid;
                                if (val == 'true') {
                                  ispaid = true;
                                } else {
                                  ispaid = false;
                                }
                                print('boolean$val');
                                print('money$ispaid');
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
                                    trailing: ispaid
                                        ? Icon(Icons.lock, color: Colors.purple)
                                        : Text(''),
                                    onTap: () {
                                      if (!(ispaid)) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoPlayer(
                                                        vlink:
                                                            (courseTopics[index]
                                                                .link))));
                                      }
                                      //else {}

                                      // Navigator.of(context).pushNamed('/PlayVideo');
                                    },
                                  ),

                                  //Text(courseTopics[index].title)
                                );
                              },
                            ),
                          ),
                        ),

                        ///add to card and buy Now Button
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 170,
                                height: 60,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '???${snapshot.data.offerPrice.toString()}',
                                      // 'ADD TO CART',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '???${snapshot.data.coursePrice.toString()}',
                                      // 'ADD TO CART',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ],
                                ),
                              ),
                              Container(padding: EdgeInsets.only(left: 10)),
                              SizedBox(
                                width: 170,
                                height: 60,
                                child: RaisedButton(
                                  onPressed: () {},
                                  color: Colors.teal,
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
                        ),
                        //Rowbutton(),
                      ],
                    );
                  } else {
                    return Center(child: Loading());
                  }
                }),
          ),
        ],
      ),
    );
  }

  Future<CourseUrlData> fetchCoursecontents() async {
    final courseContentResponse = await http.get(courseUrl + widget.courseid,
        headers: {"accept": "application/json"});
    print(courseUrl + widget.courseid);
    print(CourseUrlData.fromJson(json.decode(courseContentResponse.body)));
    return (CourseUrlData.fromJson(json.decode(courseContentResponse.body)));
  }
}
