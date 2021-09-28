/*
import 'package:flutter/material.dart';
import 'package:studyapp/Screens/allcourses.dart';
//import 'package:studyapp/Screens/courseScreen/adminCourseUrl.dart';
import 'package:studyapp/blog/Bloglist.dart';
//import 'allcourses_old.dart';
//import 'mainscreen_old.dart';
import 'profilepage.dart';
import 'package:studyapp/Screens/mainscreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Material(
            color: Colors.teal,
            child: TabBar(
              controller: tabController,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.menu),
                ),
                Tab(
                  icon: Icon(Icons.more),
                ),
                Tab(
                  icon: Icon(Icons.people),
                ),
              ],
            )),
        body: TabBarView(controller: tabController, children: <Widget>[
          MainScreen(),
          AllCoursePage(),
          //  Center(child: Text('All Courses')),
          //   AdminCourseUrl(),
          BlogPage(),
          //NotificationPage(),
          //Center(child: Text('Push Notifications')),
          //Center(child: Text('Profile Page')),
          ProfilePage(),
          //VideoPlayer(),
        ]));
  }
}
*/
