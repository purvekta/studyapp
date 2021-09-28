//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studyapp/models/users.dart';
import 'package:studyapp/services/userData.dart';
import 'mycourselist.dart';
import '../services/auth.dart';
import '../Screens/Widgets/customshapclipper.dart';
//import '../models/constants.dart';
import 'package:provider/provider.dart';
import '../services/usermanagement.dart';
//import '../services/userData.dart';
///import './homepage.dart';
import 'package:studyapp/sharing/loading.dart';

class ProfilePage extends StatelessWidget {
  //final FirebaseUser user;

  // ProfilePage({this.user});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    //AuthService().user user  = Provider.of<FirebaseUser>(context);
    //final user = Provider.of<UserData>(context);

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: UserManagement(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('My Profile'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 180,
                      color: Colors.teal,
                      child: Center(
                        child: Text(
                          userData.displayname,
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),

                    /// out of the stack widjets

                    // SizedBox(height: 25.0),
                    Container(
                      color: Colors.white,
                      width: 400,
                      height: 362,
                      child: Column(children: <Widget>[
                        Container(
                          child: Text(
                            'Profile Details',
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                        Container(
                          width: 340,
                          child: OutlineButton(
                            child: Text('My Course'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CDCourseList(userid: userData.uid),
                                  ));
                              //  CDCourseList();
                            },
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.call), onPressed: () {}),
                              Text(userData.mobNo.toString()),
                              //  Text(userData.mobNo),
                              // Text('9876543210'),
                            ],
                          ),
                        ),
                        // Expanded(
                        //   child: Container(
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //       children: <Widget>[
                        //         // Text(
                        //         //   'Profile Details',
                        //         //   style: TextStyle(
                        //         //       color: Colors.teal,
                        //         //       fontSize: 20,
                        //         //       fontFamily: 'Montserrat'),
                        //         // ),
                        //         //IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        // SizedBox(
                        //   height: 30,
                        // ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.person), onPressed: () {}),
                              // Text('Student Name'),
                              Text(userData.displayname)
                              // Text('$usernickName'),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.email), onPressed: () {}),
                              Text(userData.emailId),
                              //Text('Student Email'),
                            ],
                          ),
                        ),

                        // Container(
                        //   child: Row(
                        //     children: <Widget>[
                        //       IconButton(
                        //           icon: Icon(Icons.category),
                        //           onPressed: () {
                        //             Navigator.push(
                        //                 context,
                        //                 MaterialPageRoute(
                        //                   builder: (context) => CDCourseList(
                        //                       userid: userData.uid),
                        //                 ));
                        //             //  CDCourseList();
                        //           }
                        //           ),
                        //       Text('My Courses'),
                        //     ],
                        //   ),
                        // ),
                        //

                        //     Container(
                        //   height: 30.0,
                        //   width: 95.0,
                        //   child: Material(
                        //       borderRadius: BorderRadius.circular(20.0),
                        //       shadowColor: Colors.redAccent,
                        //       color: Colors.red,
                        //       elevation: 7,
                        //       child: GestureDetector(
                        //           onTap: () {},
                        //           child: Center(
                        //             child: Text('LogOut'),
                        //           ))),
                        // ),

                        SizedBox(height: 40),
                        Container(
                          //color: Colors.teal,
                          width: 340,
                          child: OutlineButton(
                            padding: EdgeInsets.all(10),
                            onPressed: () async {
                              await _auth.signOut();
                            },
                            child: Text('Logout'),
                          ),
                        ),
                      ]),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: <Widget>[
                    //     Container(
                    //         height: 30.0,
                    //         width: 95.0,
                    //         child: Material(
                    //           borderRadius: BorderRadius.circular(20.0),
                    //           shadowColor: Colors.greenAccent,
                    //           color: Colors.green,
                    //           elevation: 7.0,
                    //           child: GestureDetector(
                    //             onTap: () {},
                    //             child: Center(
                    //               child: Text(
                    //                 'Edit Name',
                    //                 style: TextStyle(
                    //                     color: Colors.white, fontFamily: 'Montserrat'),
                    //               ),
                    //             ),
                    //           ),
                    //         )),
                    //     // SizedBox(height: 25.0),
                    //   ],
                    // ),
                    // SizedBox(height: 90.0),
                    // Text(
                    //   'Tom Cruise',
                    //   style: TextStyle(
                    //       fontSize: 30.0,
                    //       fontWeight: FontWeight.bold,
                    //       fontFamily: 'Montserrat'),
                    // ),
                    //SizedBox(height: 15.0),
                    // Container(
                    //     height: 30.0,
                    //     width: 95.0,
                    //     child: Material(
                    //       borderRadius: BorderRadius.circular(20.0),
                    //       shadowColor: Colors.greenAccent,
                    //       color: Colors.green,
                    //       elevation: 7.0,
                    //       child: GestureDetector(
                    //         onTap: () {},
                    //         child: Center(
                    //           child: Text(
                    //             'My Course',
                    //             style: TextStyle(
                    //                 color: Colors.white, fontFamily: 'Montserrat'),
                    //           ),
                    //         ),
                    //       ),
                    //     )), // Text(
                    //   'Subscribe guys',
                    //   style: TextStyle(
                    //       fontSize: 17.0,
                    //       fontStyle: FontStyle.italic,
                    //       fontFamily: 'Montserrat'),
                    // ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}

/*
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
*/
