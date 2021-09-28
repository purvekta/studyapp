import 'package:flutter/material.dart';
import './Screens/homepage.dart';
import 'Screens/coursescreen.dart';
import 'Screens/subscribe.dart';
import 'Screens/subscriptiondetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: <String, WidgetBuilder>{
          // '/signup': (BuildContext context) => SignupPage(),
          // '/HomePage': (BuildContext context) => HomePage(),
          // '/LandingPage': (BuildContext context) => LandingPage(),
          // '/MyProfile': (BuildContext context) => ProfilePage(),
          '/MyCourse': (BuildContext context) => DetailsScreen(),
          // '/PlayVideo': (BuildContext context) => ChewieDemo(),
          // '/SelectProfilepic': (BuildContext context) => ProfilePage(),,
          '/Subscribe': (BuildContext context) => Subscribe(),
          '/Subscribedetails': (BuildContext context) =>  SubscribeDetails(),
          

      },
    );
  }
}

