


import 'package:flutter/material.dart';

import 'customshapclipper.dart';
//import '../services/auth.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  
  @override
  //final AuthService _auth = AuthService();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  color: Colors.amber,
                  height: 200,
                  width: 400,
                ),
              ),
              Positioned(
                // width: 350,
                top: MediaQuery.of(context).size.height / 13,
                child: Container(
                    //  padding: EdgeInsets.fromLTRB(10, 20, 200,10),
                    //color: Colors.green,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Student Name',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
              ),
              // Positioned(
              //   right: 30,
              //   bottom: 30,
              //   child: Container(
              //     margin: EdgeInsets.only(left: 250),
              //     width: 100.0,
              //     height: 100.0,
              //     decoration: BoxDecoration(
              //         color: Colors.red,
              //         image: DecorationImage(
              //             image: AssetImage('assets/images/tom.jpeg'),
              //             fit: BoxFit.cover
              //             // image: NetworkImage(
              //             //     'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
              //             // fit: BoxFit.cover),
              //             ),
              //         borderRadius: BorderRadius.all(Radius.circular(75.0)),
              //         boxShadow: [
              //           BoxShadow(blurRadius: 7.0, color: Colors.black)
              //         ]),
              //   ),
              // ),
              // Positioned(
              //   bottom: 10,
              //   right: 20,
              //   child: IconButton(
              //       icon: Icon(Icons.edit),
              //       onPressed: () {
              //          //Navigator.of(context).pushNamed('/MyCourse');
              //         // Navigator.push(
              //         //   context,
              //         //   MaterialPageRoute(builder: (context) => UploadProfPic()),
              //         // );
              //       }),
              // ),
            ],
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
                  'Account Details',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      fontFamily: 'Montserrat'),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.call), onPressed: () {}),
                    Text('9876543210'),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Profile Details',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20,
                            fontFamily: 'Montserrat'),
                      ),
                      //IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.person), onPressed: () {}),
                    Text('Student Name'),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.email), onPressed: () {}),
                    Text('Student Email'),
                  ],
                ),
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.category), onPressed: () {}),
                    Text('My Courses'),
                  ],
                ),
              ),
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
                  onPressed: (){}, 
                  // async {
                  //   await _auth.signOut();
                  // },
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
    );
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

