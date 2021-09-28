import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';

import 'customshapclipper.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget> [
                Stack(children: <Widget>[
              ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      color: Colors.amber,
                      height: 200,
                      width: 400,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Push Notification',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Get the Latest Information From Here',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //SvgPicture.asset("assets/icons/arrow-left.svg"),
                  // Positioned(
                  //   width: 30,
                  //   top: 50,
                  //   left: 10,
                  //   child: GestureDetector(
                  //     child: SvgPicture.asset("assets/icons/arrow-left.svg"),
                  //     onTap: () {
                  //       Navigator.pop(context);
                  //     },
                  //   ),
                  // ),

            ],
            ),
              ]
            ),

      ),
    );
  }
}