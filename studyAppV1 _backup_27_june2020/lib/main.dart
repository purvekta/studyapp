
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/Screens/videoplayer/videoplayer.dart';

import 'Screens/coursescreen.dart';
import 'Screens/homepage.dart';
import 'Screens/subscribe.dart';

import 'Screens/subsciption.dart';
import './authenticate/authenticate.dart';
import 'models/users.dart';
import 'services/auth.dart';
import './Screens/signuppage.dart';
void main() {
  //  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.blueAccent,
  //   ),
  // );
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<User>.value(
          value: AuthService().user,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
       //home: HomePage(),
        home: Authenticate(),
        routes: <String, WidgetBuilder>{
             '/signup': (BuildContext context) => SignupPage(),
             '/HomePage': (BuildContext context) => HomePage(),
            // '/LandingPage': (BuildContext context) => LandingPage(),
            // '/MyProfile': (BuildContext context) => ProfilePage(),
            '/MyCourse': (BuildContext context) => DetailsScreen(),
            '/sub1': (BuildContext context) => DetailsScreen(courseName: 'Biology',coursePrice:'2500'),
            '/sub2': (BuildContext context) => DetailsScreen(courseName: 'Physics',coursePrice:'3500'),
            '/sub3': (BuildContext context) => DetailsScreen(courseName: 'Maths',coursePrice:'3500'),
            '/sub4': (BuildContext context) => DetailsScreen(courseName: 'chemistry',coursePrice:'3500'),
            '/sub5': (BuildContext context) => DetailsScreen(courseName: 'JEE',coursePrice:'3500'),
            '/sub6': (BuildContext context) => DetailsScreen(courseName: '11thSciMaths',coursePrice:'3500'),
             '/PlayVideo': (BuildContext context) => VideoPlayer(),
            // '/SelectProfilepic': (BuildContext context) => ProfilePage(),,
            '/Subscribe': (BuildContext context) => Subscribe(),
         //   '/Subscribedetails': (BuildContext context) =>  PaymentDetail(),
            '/tempPayment': (BuildContext context) =>Subsciption(),
            

        },
      ),
    );
  }
}

