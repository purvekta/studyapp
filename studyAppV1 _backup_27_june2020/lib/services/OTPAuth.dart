/*

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:studyapp/Screens/homepage.dart';
import 'package:studyapp/Screens/loginPage.dart';

class OTPAuthService {
 handleAuth() {
   return StreamBuilder(
     stream: FirebaseAuth.instance.onAuthStateChanged,
     builder: (BuildContext context, snapshot) {
       if(snapshot.hasData)
       {
         return HomePage();
         
       }
       else {
         return LoginPage();
       }
     },

     );
 }
}
*/