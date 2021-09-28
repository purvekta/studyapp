/*
import 'package:flutter/material.dart';

import 'customshapclipper.dart';
import 'OTPverfiy.dart';
import 'OTPLogin.dart';

class OTPSignUp extends StatefulWidget {
  @override
  _OTPSignUpState createState() => _OTPSignUpState();
}

class _OTPSignUpState extends State<OTPSignUp> {
  final formKey = new GlobalKey<FormState>();
  String phoneNo, verificationId, smsCode, userName, emailId;

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
                        'SignUp',
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
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(hintText: 'Enter Name'),
                      onChanged: (val) {
                        setState(() {
                          this.userName = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.phone,
                  //     decoration:
                  //         InputDecoration(hintText: 'Enter the OTP here'),
                  //     onChanged: (val) {
                  //       setState(() {
                  //         //this.smsCode= val;
                  //       });
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:
                          InputDecoration(hintText: 'Enter the EmailID'),
                      onChanged: (val) {
                        setState(() {
                          this.emailId = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: RaisedButton(
                      color: Colors.deepPurple,
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPverify(smsCode:smsCode)));
                        // verifyPhone(phoneNo);
                      },
                      child: Center(
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Have an account?'),
                      SizedBox(width: 20),
                      RaisedButton(
                        color: Colors.deepPurple,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginOtp()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/