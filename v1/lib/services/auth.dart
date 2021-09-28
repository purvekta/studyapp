import 'package:studyapp/services/RDusermanagement.dart';

import './usermanagement.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/users.dart';
//import '../models/constants.dart';

class AuthService {
  String studentName;
  String studentEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

  //  getCurrentUser() async{
  //   FirebaseUser currentUser =await FirebaseAuth.instance.currentUser();
  //   print(currentUser);
  //   if(currentUser!=null) {
  //     return currentUser;
  //   }
  //   else {
  //     return null;
  //     };
  // }
  /// create a user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
    //.map(getCurrentUser());
  }

  // guest  user with annoy method

  Future sigInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// signin user with email and password

  Future signInwithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// register user with email and password and stores it in the cloud firestore
  Future registerwithEmailAndPassword(
      String email, String password, String nickName, var mobNo) async {
    try {
      // AuthResult result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      //FirebaseUser user = result.user;
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nickName;
      userUpdateInfo.photoUrl =
          'https://en.wikipedia.org/wiki/Irrfan_Khan#/media/File:Irrfan_Khan_May_2015.jpg';
      var usermobNo = mobNo;
      FirebaseUser user = result.user;
      user.updateProfile(userUpdateInfo);
      //create a new document when new user registers with the uid
      //await UserManagement(uid:user.uid).updateUserDData('emailid','name');
      await UserManagement(uid: user.uid).updateUserDData(email,
          userUpdateInfo.displayName, userUpdateInfo.photoUrl, usermobNo);
      //studentName = userUpdateInfo.displayName;
      // studentEmail =  email;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  ///register the user with email and passoword and store it in the realtime database
  // Future registerwithRD(
  //     String email, String password, String nickName, var mobNo) async {
  //   try {
  //     AuthResult result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     var userUpdateInfo = UserUpdateInfo();
  //     userUpdateInfo.displayName = nickName;
  //     userUpdateInfo.photoUrl =
  //         'https://en.wikipedia.org/wiki/Irrfan_Khan#/media/File:Irrfan_Khan_May_2015.jpg';
  //     var usermobNo = mobNo;

  //     FirebaseUser user = result.user;
  //     user.updateProfile(userUpdateInfo);
  //     await RDUserManagement(uid: user.uid).updateRDUserDData(email,
  //         userUpdateInfo.displayName, userUpdateInfo.photoUrl, usermobNo);
  //     //studentName = userUpdateInfo.displayName;
  //     // studentEmail =  email;
  //     return _userFromFirebaseUser(user);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

////singin with the Otp
  signInWithOTP(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  /// signout method
  ///

  Future signOut() async {
    try {
      //getCurrentUser();
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future forgetPassWord(String email) async {
    try {
      return _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }
}
