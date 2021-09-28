//
/* not used as because it uses http json data
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:studyapp/Screens/customshapclipper.dart';
import 'package:studyapp/sharing/loading.dart';
//import './blogcontents.dart';
import 'package:html/parser.dart';
import 'package:studyapp/blog/blogPostData.dart';

final coursePageUrl ='rseapp-c7db3.firebaseio.com/0/data/curriculum.json';

class UpdatedCourseScreen extends StatelessWidget {
  // String courseName;
  // UpdatedCourseScreen(this.courseName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('courseName'),
      ),
      body: Column(
        children: <Widget>[
            Text('Course Contents'),
            Container(
              height: 500,
              child:FutureBuilder(
                future: fetchCourseContent(),
                builder: (context, snapshot)
                {
                  return ListView.builder(
                        itemCount:snapshot.data.length, 
                        itemBuilder: (BuildContext context,int index){
                          Map courseTopic =snapshot.data[index];
                          print(courseTopic);
                          var unitName = courseTopic['curriculum'];
                          print(unitName);
                       // Map abcd =unitName.data[index];
                         //var topicName = unitName['title'];
                          //print(unitName);
                          return Card(
                            child: Text(unitName),
                          );

                        }
                        
                        );
                  // if(snapshot.data){
                  //     // return ListView.builder(
                  //     //   itemCount:snapshot.data.length, 
                  //     //   itemBuilder: (BuildContext context,int index){
                  //     //     Map courseTopic =snapshot.data[index];
                  //     //     print(courseTopic);
                  //     //     var topicName = courseTopic['data']['curriculum']['title'];
                  //     //     return Card(
                  //     //       child: Text(topicName),
                  //     //     );

                  //     //   }
                        
                  //     //   );
                  // }
                  // else{
                  //                 return Center(child: Loading());
                  // }
                })
            )

      ],),
    );
  }
}

Future<List> fetchCourseContent() async {
  final blogPageResponse = await http.get(
      coursePageUrl,
      headers: {"accept": "application/json"});
      var conversionDatajson = jsonDecode(blogPageResponse.body);
      print(conversionDatajson);
      return conversionDatajson;
}
*/