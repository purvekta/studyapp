import 'package:flutter/material.dart';
import './Screens/homepage.dart';
import 'Screens/coursescreen.dart';
import 'Screens/subscribe.dart';
import 'Screens/payment.dart';
import 'Screens/subsciption.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String, WidgetBuilder>{
          // '/signup': (BuildContext context) => SignupPage(),
          // '/HomePage': (BuildContext context) => HomePage(),
          // '/LandingPage': (BuildContext context) => LandingPage(),
          // '/MyProfile': (BuildContext context) => ProfilePage(),
          '/MyCourse': (BuildContext context) => DetailsScreen(),
          '/sub1': (BuildContext context) => DetailsScreen(courseName: 'Biology',coursePrice:'2500'),
          '/sub2': (BuildContext context) => DetailsScreen(courseName: 'Physics',coursePrice:'3500'),
          '/sub3': (BuildContext context) => DetailsScreen(courseName: 'Maths',coursePrice:'3500'),
          '/sub4': (BuildContext context) => DetailsScreen(courseName: 'chemistry',coursePrice:'3500'),
          '/sub5': (BuildContext context) => DetailsScreen(courseName: 'JEE',coursePrice:'3500'),
          '/sub6': (BuildContext context) => DetailsScreen(courseName: '11thSciMaths',coursePrice:'3500'),
          // '/PlayVideo': (BuildContext context) => ChewieDemo(),
          // '/SelectProfilepic': (BuildContext context) => ProfilePage(),,
          '/Subscribe': (BuildContext context) => Subscribe(),
          '/Subscribedetails': (BuildContext context) =>  PaymentDetail(),
          '/tempPayment': (BuildContext context) =>Subsciption(),
          

      },
    );
  }
}

