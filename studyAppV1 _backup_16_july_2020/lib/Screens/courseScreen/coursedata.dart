import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:studyapp/Screens/coursecontents.dart';
import 'package:studyapp/Screens/customshapclipper.dart';
import 'package:studyapp/Screens/videoplayer/videoplayer.dart';
import 'package:studyapp/models/constants.dart';

class CourseData extends StatefulWidget {
  final String courseName;
  final String coursePrice;
  final String vLink;

  CourseData({this.courseName, this.coursePrice,this.vLink});
  @override
  _CourseDataState createState() => _CourseDataState();
}

class _CourseDataState extends State<CourseData> {

  @override
  Widget build(BuildContext context) {
      String courseUrl ='assets/loded_json/${widget.courseName}.json';
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
        Text('Course Contents'),
        Container(
          height: 500,
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString(courseUrl),
              builder: (context, snapshot) {
                //decode json data
                //      var mydata = JSON.decode(snapshot.data.toString());
                var mydata = json.decode(snapshot.data.toString());
                print(mydata);
                return ListView.builder(
                  itemCount: mydata == null ? 0 : mydata.length,
                  itemBuilder: (BuildContext context, int index) {
                    //bool islocked= mydata[index]['isLocked'] ;
                    String videoid = mydata[index]['link'] ;
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
                          child: Icon(Icons.play_arrow, color: Colors.white),
                        ),
                        title: Text(mydata[index]['title']),
                        subtitle: Text('this is subtitle'),
                        trailing: (mydata[index]['islocked']) ? Icon(Icons.lock, color: Colors.purple):Text(''),
                          isThreeLine: true,
                      onTap:() {
                        if(!(mydata[index]['islocked'])){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoPlayer(vlink:(mydata[index]['link']))));
                          }
                          //else {}
                           
                       // Navigator.of(context).pushNamed('/PlayVideo');
                      }, 
                      ),
                      
                      // child: Text( mydata[index]['title']),
                    );
                  },
                );
              }),
        ),
      ],
    )));
  }
}
