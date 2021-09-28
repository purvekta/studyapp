import 'package:flutter/material.dart';
import 'package:studyapp/Screens/aboutus.dart';
import 'package:studyapp/Screens/allcourses.dart';
import 'package:studyapp/Screens/mycourse/mycoursescreen.dart';
//import 'package:studyapp/Screens/courseScreen/adminCourseUrl.dart';
import 'package:studyapp/blog/Bloglist.dart';
//import 'allcourses_old.dart';
//import 'mainscreen_old.dart';
import '../myprofile/profilepage.dart';
import 'package:studyapp/Screens/mainscreen.dart';
import '../services/auth.dart';
import 'package:studyapp/Screens/mycourse/mycourselist.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Study App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      drawer: SizedBox(
        width: 200,
        child: Drawer(
          elevation: 5,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Welcome'),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('My Profile'),
                leading: Icon(Icons.person_pin_circle),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
              ),
//               ListTile(
//                 title: Text('My Course'),
//                 leading: Icon(Icons.golf_course),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MycourseScreenNew(),
//                     ),
//                   );
// //                  Navigator.of(context).pop();
//                 },
//               ),
              ListTile(
                title: Text('My Course'),
                leading: Icon(Icons.list),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MycourseListScreen(),
                    ),
                  );
//                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('All Courses'),
                leading: Icon(Icons.access_alarm),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllCoursePage(),
                    ),
                  );

                  //AllCoursePage();
                },
              ),
              // ListTile(
              //   title: Text('Notifications'),
              //   leading: Icon(Icons.notification_important),
              //   onTap: () {},
              // ),
              ListTile(
                title: Text('Blog'),
                leading: Icon(Icons.access_alarms),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlogPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('About us'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Aboutus(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Sign Out'),
                leading: Icon(Icons.home),
                onTap: () async {
                  await _auth.signOut();
                },
              )
            ],
          ),
        ),
      ),
      body: MainScreen(),
    );
  }
}
