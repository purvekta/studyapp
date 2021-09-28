//import 'dart:wasm';
/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/models/users.dart';
import 'package:studyapp/services/auth.dart';
import './homepage.dart';

import 'OTPSignUp.dart';
import 'customshapclipper.dart';

/*

class OTPLogin extends StatefulWidget {
  @override
  _OTPLoginState createState() => _OTPLoginState();
}

class _OTPLoginState extends State<OTPLogin> {
  final formKey = new GlobalKey<FormState>();
  String phoneNo, verificationId,smsCode;
  bool codeSent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.deepPurple,
        body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                    Stack(
            children: <Widget>[
              ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  color: Colors.deepPurple,
                  height: 200,
                  width: 400,
                  child: Center(
                    child: Text(
                      //'Welcome\n $usernickName',
                      'Login',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
                    Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration:
                        InputDecoration(hintText: 'Enter the Phone Number'),
                    onChanged: (val) {
                      setState(() {
                        this.phoneNo = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration:
                        InputDecoration(hintText: 'Enter the OTP here'),
                    onChanged: (val) {
                      setState(() {
                        this.smsCode= val;
                      });
                    },
                  ),
                ),
                SizedBox(height:20),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: RaisedButton(
                    color: Colors.deepPurple,
                    onPressed: () {
                      verifyPhone(phoneNo);
                    },
                    child: Center(
                      child: Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                      
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('New user'),
                RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPSignUp()));
                  },
                  child: Text('SignUp',
                  style: TextStyle(
                    color: Colors.white),),
                ),
              ],
            ),
          ),
                  ],)
        ),
        );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      //to do
      AuthService().signInWithOTP(authResult);
      //FirebaseUser user = authResult.user
      // FirebaseUser user = result.user;
    };
    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      // 
//       smsCodeDialog(context).then((value) {
// print('signin');
//       },
      
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeOut = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 10),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeOut);


  }
  // Future<bool> smsCodeDialog (BuildContext context){
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context ) {
  //       return new AlertDialog(
  //         title: Text('Enter the SMS code'),
  //         content : TextField(
  //           cursorWidth:4 ,
  //           onChanged: (val) {
  //             this.smsCode= val;
  //           },),
  //           contentPadding: EdgeInsets.all(10.0),
  //           actions: <Widget>[
  //             new FlatButton(
  //               onPressed: (){
  //                 FirebaseAuth.instance.currentUser().then((user) {
  //                   if(user != null)
  //                   {
  //                     Navigator.of(context).pop();
  //                     Navigator.of(context).pushReplacementNamed('/HomePage');
  //                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                  
  //                   }
  //                   else {
  //                  Navigator.of(context).pop();
  //                  //signInWithOTP();
  //                   // AuthService().signInWithOTP(authResult); 
  //                   }
  //                 });
  //               },
  //               child: Text('Done'),
  //               ),
  //           ],

  //       );

  //     }
  //     );
      

  // }
//   singIn() {
// FirebaseAuth.instance.signInWithCredential()
//       }
}
*/
class LoginOtp extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);
           
            final FirebaseUser currentUser = await _auth.currentUser();    
         // assert(result.uid == currentUser.uid);  
          FirebaseUser user = result.user;

          if (user != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  //  builder: (context) => HomePage(user: user,)
                  builder: (context) => HomePage(),
                ));
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);

                        AuthResult result =
                            await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // builder: (context) => HomeScreen(user: user,)
                                  builder: (context) => HomePage()));
                        } else {
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    color: Colors.deepPurple,
                    height: 200,
                    width: 400,
                    child: Center(
                      child: Text(
                        //'Welcome\n $usernickName',
                        'Login',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(32),
              child: Form(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Center(
                    //   child: Text(
                    //     "Login",
                    //     style: TextStyle(
                    //         color: Colors.lightBlue,
                    //         fontSize: 36,
                    //         fontWeight: FontWeight.w500),
                    //   ),
                    // ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[200])),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[300])),
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Mobile Number with Country Code",
                      ),
                      controller: _phoneController,
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        child: Text("LOGIN"),
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(16),
                        onPressed: () {
                          final phone = _phoneController.text.trim();

                          loginUser(phone, context);
                        },
                        //color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Text('New user'),
              SizedBox(width: 20),
            RaisedButton(
              color: Colors.deepPurple,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OTPSignUp()));
              },
              child: Text(
                'SignUp',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ],),
            
          ],
        ),
      ),
    );
  }
}
*/