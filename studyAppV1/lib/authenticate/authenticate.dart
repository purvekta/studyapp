import 'package:provider/provider.dart';
import '../Screens/Mainscreens/Login/loginPage.dart';
import 'package:studyapp/Homepage/homepage.dart';

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

    if (user == null) {
      return LoginPage();
    } else {
      return HomePage();
    }
  }
}
