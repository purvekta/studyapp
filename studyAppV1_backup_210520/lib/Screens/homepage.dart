import 'package:flutter/material.dart';

import 'mainscreen.dart';
 
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
           Center(child: Text('ram')),
           Center(child: Text('ram')),
           Center(child: Text('ram')),

         ])

     );
   }
 }