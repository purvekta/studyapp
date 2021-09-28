import 'package:flutter/material.dart';
import 'package:studyapp/Screens/Mainscreens/aboutus.dart';
import 'package:studyapp/Screens/Mainscreens/allcourses.dart';
import 'package:studyapp/blog/Bloglist.dart';
import 'package:studyapp/Screens/Mainscreens/mainscreen.dart';
import 'package:studyapp/myprofile/mycourselist.dart';
import 'package:studyapp/myprofile/profilepage.dart';
import 'package:studyapp/services/auth.dart';
import 'package:studyapp/Screens/notification.dart';
import 'package:provider/provider.dart';
import '../services/usermanagement.dart';
import 'package:studyapp/models/users.dart';
import 'package:studyapp/services/userData.dart';
import 'package:studyapp/sharing/loading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studyapp/models/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
//import 'package:share/share.dart';
//import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: UserManagement(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Study App'),
                actions: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.whatsapp),
                    onPressed: () {
                      _lanuchWhatsApp();
                      // FlutterOpenWhatsapp.sendSingleMessage(
                      //     clientMobNo, clientMsg);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationPage(),
                        ),
                      );
                    },
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
                      UserAccountsDrawerHeader(
                        accountEmail: Text(userData.emailId),
                        accountName: Text(userData.displayname),
                        arrowColor: Colors.teal,
                        decoration: BoxDecoration(color: Colors.teal),
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
                      // ListTile(
                      //   title: Text('Dashboard'),
                      //   leading: Icon(Icons.person_pin_circle),
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => RDProfilePage(),
                      //       ),
                      //     );
                      //   },
                      // ),
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
                      //               ListTile(
                      //                 title: Text('RT Course'),
                      //                 leading: Icon(Icons.list),
                      //                 onTap: () {
                      //                   Navigator.push(
                      //                     context,
                      //                     MaterialPageRoute(
                      //                       builder: (context) => RTMycourseListScreen(),
                      //                     ),
                      //                   );
                      // //                  Navigator.of(context).pop();
                      //                 },
                      //               ),
                      //               ListTile(
                      //                 title: Text('RTD Course'),
                      //                 leading: Icon(Icons.list),
                      //                 onTap: () {
                      //                   Navigator.push(
                      //                     context,
                      //                     MaterialPageRoute(
                      //                       builder: (context) => RTCourseList(),
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
                                builder: (context) =>
                                    CDCourseList(userid: userData.uid),
                              ));
                          //  CDCourseList();
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
                      ListTile(
                        title: Text('Notifications'),
                        leading: Icon(Icons.notification_important),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationPage(),
                            ),
                          );
                        },
                      ),

                      // ListTile(
                      //   title: Text('Blog'),
                      //   leading: Icon(Icons.access_alarms),
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => BlogPage(),
                      //       ),
                      //     );
                      //   },
                      // ),
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
          } else {
            return Loading();
          }
        });
  }

  void _lanuchWhatsApp() async {
    int phone = clientMobNo;
    String url() {
      if (Platform.isIOS) {
        return 'whatsapp://wa.me/$phone/?text=${Uri.parse(clientMsg)}';
      } else {
        return 'whatsapp://send?   phone=$phone&text=${Uri.parse(clientMsg)}';
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }
}
