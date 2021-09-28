/*
this code is related to realtime database user profile

import 'package:firebase_database/firebase_database.dart';
import './userData.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RDUserManagement {
  final String uid;
  RDUserManagement({this.uid});
  //sstore the data in the firebase collection  database
  final fb = FirebaseDatabase.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future updateRDUserDData(
      String emailId, String displayName, String photoUrl, var mobNo) async {
    final ref = fb.reference().child('users').child('profile');
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return await ref.child(user.uid).set({
      'emailid': emailId,
      'Nick name': displayName,
      'avatar': photoUrl,
      'Mobile No': mobNo,
    });
  }

  Future fetchUserData() async {
    final ffb = FirebaseDatabase.instance.reference();
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    //RDUserData userData;
    return await ffb
        .child('users')
        .child('profile')
        .child(user.uid)
        .once()
        .then((DataSnapshot data) {
      RDUserData userData = RDUserData(
          displayname: data.value['Nick name'],
          emailId: data.value['emailid'],
          mobNo: data.value['Mobile No'],
          photoUrl: data.value['avatar']);
    });
  }
  //
  // retrive thedatafrom the firebase realtime for particlular user
  ///

//RDUserdata userdata

  ////retrive the data from the firebase for particluar user
  // UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(
  //     uid: uid,
  //     emailId: snapshot.data['emailid'],
  //     displayname: snapshot.data['Nick name'],
  //     photoUrl: snapshot.data['avatar'],
  //     mobNo: snapshot.data['Mobile No'],
  //   );
  // }

  // Stream<UserData> get userData {
  //   return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  // }
}
*/
