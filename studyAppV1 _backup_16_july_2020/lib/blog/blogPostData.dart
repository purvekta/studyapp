import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';
import 'package:studyapp/sharing/loading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final blogPostUrl = 'https://www.pukemy.com/wp-json/wplms/v1/blog/';

class BlogPostData extends StatefulWidget {
  final String blogPageName;
  final String blogid;
  BlogPostData({this.blogPageName, this.blogid});
  @override
  _BlogPostDataState createState() => _BlogPostDataState();
}

class _BlogPostDataState extends State<BlogPostData> {
  Future<PostData> futurePostData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // futurePostData = fetchPostData();
  }

  @override
  Widget build(BuildContext context) {
    // final String blogpostid =widget.blogid;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.red,
          expandedHeight: 200.0,
          // floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.blogPageName),
            //background: Image.network('https://neilpatel.com/wp-content/uploads/2018/10/blog.jpg',
            //// fit: BoxFit.cover),
          ),
        ),
        SliverFillRemaining(
          child: Center(
              child: FutureBuilder<PostData>(
            future: fetchPostData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //  return Text(snapshot.data.content);
                return Text(
                  parse(snapshot.data.content.toString()).documentElement.text,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                );
              }
              // else if (snapshot.error){
              //   return Text('${snapshot.error}');
              // }
              else {
                return Center(child: Loading());
              }
            },
          )),
        ),
      ],
    ));
  }

  Future<PostData> fetchPostData() async {
    final response = await http.get(blogPostUrl + widget.blogid.toString(),
        headers: {"accept": "application/json"});

    print(PostData.fromJson(json.decode(response.body)));
    return PostData.fromJson(json.decode(response.body));

    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   //var conterts =json.decode(response.body);
    //   //var contentData = PostData.fromJson(json.decode(response.body);
    //   //print(contentData);
    //   print(PostData.fromJson(json.decode(response.body)));
    //   return PostData.fromJson(json.decode(response.body));
    //     //return contentData;
    // } else {
    //   print('error');
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load album');
    // }
  }
}

class PostData {
  final String postid;
  final String title;
  final String content;
  PostData({this.postid, this.content, this.title});
  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      postid: json['id'].toString(),
      content: json['content'],
      title: json['title'],
    );
  }
}
