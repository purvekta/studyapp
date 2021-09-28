/*
import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'package:studyapp/Screens/customshapclipper.dart';
//import 'package:studyapp/sharing/loading.dart';
//import './blogcontents.dart';
//import 'package:html/parser.dart';
//import 'package:studyapp/blog/blogPostData.dart';


class OneUpdatedCourseScreen extends StatelessWidget {
  // String courseName;
  // UpdatedCourseScreen(this.courseName);
  List data;
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
                future: DefaultAssetBundle.of(context).loadString('assets/loded_json/subject1.json'),
                builder: (context, snapshot) {
                  //decode json data
            //      var mydata = JSON.decode(snapshot.data.toString());
               var mydata = json.decode(snapshot.data.toString());
               print(mydata);
               return ListView.builder(
                 itemBuilder: (BuildContext context,int index){
                    return  Card(
                      child: Column(
                        children:<Widget> [
                              //print(+mydata[index]['data']);
                         Text('title:' + mydata[index]['title']),
                          //  Text('Name :'+mydata[index]['data']['subjectname'] ),
                        ],
                      ),
                    );
                 },
                 itemCount: mydata == null?0:mydata.length,
               );
                }
                
                ),
            ),

      ],),
    );
  }
}

*/
