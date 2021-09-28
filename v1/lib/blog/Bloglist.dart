import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:studyapp/Screens/customshapclipper.dart';
import 'package:studyapp/sharing/loading.dart';
//import './blogcontents.dart';
import 'package:html/parser.dart';
import 'package:studyapp/blog/blogPostData.dart';

final blogPageUrl = 'https://www.pukemy.com/wp-json/wplms/v1/blog/';

class BlogPage extends StatelessWidget {
  String blogPageName;
  String blogid;
  BlogPage({this.blogPageName, this.blogid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.red,
            expandedHeight: 200.0,
            // floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Blog'),
              background: Image.network(
                  'https://neilpatel.com/wp-content/uploads/2018/10/blog.jpg',
                  fit: BoxFit.cover),
            ),
          ),
          SliverFillRemaining(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Container _buildContent() {
    return Container(
      height: 500,
      child: FutureBuilder(
          future: fetchWpPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map wppost = snapshot.data[index];
                  return Card(
                    child: GestureDetector(
                      onTap: () {
                        //courseName= wpPopularCourses['data']['name'];
                        blogPageName = wppost['title'];
                        blogid = wppost['id'].toString();
                        // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CourseSyllabus(courseName:courseName)),);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (ctx) => BlogPostData(
                                  blogPageName: blogPageName, blogid: blogid)),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            wppost['title'],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan,
                            ),
                          ),
                          // RaisedButton(onPressed: null)

                          // Text(
                          //   wppost['excerpt'],
                          //   style: TextStyle(
                          //     fontSize: 22,
                          //     fontWeight: FontWeight.w300,
                          //     color: Colors.red,

                          //   ),

                          // ),

                          Text(
                            parse(wppost['excerpt'].toString())
                                .documentElement
                                .text,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: Loading());
          }),
    );
  }
}

Future<List> fetchWpPosts() async {
  final blogPageResponse =
      await http.get(blogPageUrl, headers: {"accept": "application/json"});
  var conversionDatajson = jsonDecode(blogPageResponse.body);
  //print(conversionDatajson);
  return conversionDatajson;
}
