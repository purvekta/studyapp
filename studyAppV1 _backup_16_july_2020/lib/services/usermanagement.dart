import 'package:cloud_firestore/cloud_firestore.dart';
import './userData.dart';

class UserManagement{
  final String uid;
  UserManagement({this.uid});
  //sstore the data in the firebase collection  database
  final CollectionReference userCollection =Firestore.instance.collection('/users');

  Future updateUserDData(String emailId,String displayName,String photoUrl,var mobNo) async{

    return await userCollection.document(uid).setData({
          'emailid' : emailId,
          'Nick name': displayName,
          'avatar': photoUrl,
          'Mobile No' :mobNo,
    });
    
    

  }
  ////retrive the data from the firebase for particluar user
    UserData  _userDataFromSnapshot(DocumentSnapshot snapshot){
        return UserData(
          uid: uid,
          emailId: snapshot.data['emailid'],
          displayname: snapshot.data['Nick name'],
          photoUrl: snapshot.data['avatar'],
          mobNo: snapshot.data['Mobile No'],


        );
    }
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

  
  

  
}

