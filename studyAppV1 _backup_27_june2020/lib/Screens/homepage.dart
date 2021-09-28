import 'package:flutter/material.dart';
import 'package:studyapp/blog/Bloglist.dart';
import 'allcourses.dart';
import 'mainscreen.dart';
//import 'notification.dart';
import 'profilepage.dart';

 
 class HomePage extends StatefulWidget {
  
   @override
   _HomePageState createState() => _HomePageState();
 }
 
 class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
   TabController tabController;
   
   @override
   void initState (){
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
               ],)
           ),
           body: TabBarView(
             controller: tabController,
             children: <Widget>[
               MainScreen(),
              AllCoursePage(),
             //  Center(child: Text('All Courses')),
               BlogPage(),
               //NotificationPage(),
               //Center(child: Text('Push Notifications')),
               //Center(child: Text('Profile Page')),
              ProfilePage(),
                //VideoPlayer(),
             ])

         );
    
      
       
     
   }
 }