import 'package:flutter/material.dart';

import 'coursescreen.dart';

class AllCoursePage extends StatefulWidget {
  @override
  _AllCoursePageState createState() => _AllCoursePageState();
}

class _AllCoursePageState extends State<AllCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('All Courses'),
      ),
        body: Container(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Card(
            child: GestureDetector(
              onTap: () {
Navigator.of(context).pushNamed('/sub1',arguments: DetailsScreen(courseName: 'Bilology',coursePrice:'2500'));
              },
              child: ListTile(
                leading: Image.asset('assets/course/biology.jpg'),
                title: Text('Biology'),
                subtitle: Text('11th Science'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: GestureDetector(
              onTap: () {
 Navigator.of(context).pushNamed('/sub2',arguments: DetailsScreen(courseName: 'Bilology',coursePrice:'2500'));
              },
              child: ListTile(
                leading: Image.asset('assets/course/physics.png'),
                title: Text('physics'),
                subtitle: Text('11th Science'),
              ),
            ),
          ),
          SizedBox(height: 20),
           Card(
            child: GestureDetector(
              onTap: () {
Navigator.of(context).pushNamed('/sub3',arguments: DetailsScreen(courseName: 'Bilology',coursePrice:'2500'));
              },
              child: ListTile(
                leading: Image.asset('assets/course/maths.jpg'),
                title: Text('Maths'),
                subtitle: Text('12th Science'),
              ),
            ),
          ),
         
          SizedBox(height: 20),
            Card(
            child: GestureDetector(
              onTap: () {
Navigator.of(context).pushNamed('/sub5',arguments: DetailsScreen(courseName: 'Bilology',coursePrice:'2500'));
              },
              child: ListTile(
                leading: Image.asset('assets/course/jee.png'),
                title: Text('JEE'),
                subtitle: Text('11th Science'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: GestureDetector(
              onTap: () {
Navigator.of(context).pushNamed('/sub4',arguments: DetailsScreen(courseName: 'Bilology',coursePrice:'2500'));
              },
              child: ListTile(
                leading: Image.asset('assets/course/chemistry.jpg'),
                title: Text('chemistry'),
                subtitle: Text('12th Science'),
              ),
            ),
          ),
          Card(
            child: GestureDetector(
              onTap: () {
               Navigator.of(context).pushNamed('/sub1',arguments: DetailsScreen(courseName: 'Bilology',coursePrice:'2500'));
              },
              child: ListTile(
                leading: Image.asset('assets/course/biology.jpg'),
                title: Text('Biology'),
                subtitle: Text('11th Science'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: GestureDetector(
              onTap: () {
Navigator.of(context).pushNamed('/sub2',arguments: DetailsScreen(courseName: 'Bilology',coursePrice:'2500'));
              },
              child: ListTile(
                leading: Image.asset('assets/course/physics.png'),
                title: Text('physics'),
                subtitle: Text('11th Science'),
              ),
            ),
          ),
          Card(
            child: GestureDetector(
              onTap: () {
Navigator.of(context).pushNamed('/sub1',arguments: DetailsScreen(courseName: 'Bilology',coursePrice:'2500'));
              },
              child: ListTile(
                leading: Image.asset('assets/course/biology.jpg'),
                title: Text('Biology'),
                subtitle: Text('11th Science'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: GestureDetector(
              onTap: () {
Navigator.of(context).pushNamed('/sub2',arguments: DetailsScreen(courseName: 'Bilology',coursePrice:'2500'));
              },
              child: ListTile(
                leading: Image.asset('assets/course/physics.png'),
                title: Text('physics'),
                subtitle: Text('11th Science'),
              ),
            ),
          ),
          Card(
            child: GestureDetector(
              onTap: () {
Navigator.of(context).pushNamed('/sub1',arguments: DetailsScreen(courseName: 'Bilology',coursePrice:'2500'));
              },
              child: ListTile(
                leading: Image.asset('assets/course/biology.jpg'),
                title: Text('Biology'),
                subtitle: Text('11th Science'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: GestureDetector(
              onTap: () {
Navigator.of(context).pushNamed('/sub2',arguments: DetailsScreen(courseName: 'Bilology',coursePrice:'2500'));
              },
              child: ListTile(
                leading: Image.asset('assets/course/physics.png'),
                title: Text('physics'),
                subtitle: Text('11th Science'),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
