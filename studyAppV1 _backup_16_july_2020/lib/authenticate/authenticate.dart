import 'package:provider/provider.dart';
import '../Screens/loginPage.dart';
import 'package:studyapp/Screens/homepage.dart';
//import '../Screens/homepage_old.dart';
import 'package:flutter/material.dart';
import '../models/users.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //print(user);
    if (user == null) {
      return LoginPage();
    } else {
      return HomePage();
    }
    // return Container(
    //   child: LoginPage(),

    // );
  }
}
