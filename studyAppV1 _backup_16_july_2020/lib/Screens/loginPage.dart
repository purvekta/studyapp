//import 'package:courseapp/screens/profilepage.dart';
//import 'package:courseapp/sharing/loading.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/sharing/loading.dart';
//import './signin_outh.dart';
import '../services/auth.dart';
import '../myprofile/profilepage.dart';
//import 'oTPLogin.dart';
import 'customshapclipper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  ProfilePage profilePage;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.deepPurple,
            resizeToAvoidBottomPadding: false,
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipPath(
                        clipper: CustomShapeClipper(),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal[50])),
                      ),
                      SizedBox(height: 20.0),
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(16.0, 100.0, 0.0, 0.0),
                      //   child: Text('Starts Learning',
                      //       style: TextStyle(
                      //           fontSize: 20.0,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.teal[50])),
                      // )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(32),
                    // decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //   //colors: [Colors.blue, Colors.teal],
                    //   colors: [Colors.blue, Colors.blueAccent],
                    //   begin: Alignment.topCenter,
                    //   end: AlignmentDirectional.bottomCenter,
                    // ),
                    // ),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(
                                top: 35.0, left: 20.0, right: 20.0),
                            child: Column(
                              children: <Widget>[
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        controller: emailController,
                                        cursorColor: Colors.white,
                                        validator: (val) => val.isEmpty
                                            ? 'Enter Valid  Email ID'
                                            : null,
                                        decoration: InputDecoration(
                                            labelText: 'EMAIL',
                                            labelStyle: TextStyle(
                                                //    fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white70),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.green))),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                TextFormField(
                                  controller: passwordController,
                                  cursorColor: Colors.white,
                                  validator: (val) => val.length < 3
                                      ? 'Enter valid Password'
                                      : null,
                                  decoration: InputDecoration(
                                      labelText: 'PASSWORD',
                                      labelStyle: TextStyle(
//                              fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  obscureText: true,
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  alignment: Alignment(1.0, 0.0),
                                  padding:
                                      EdgeInsets.only(top: 15.0, left: 20.0),
                                  child: InkWell(
                                    onTap: () async
                                        // {
                                        //  // await _auth.forgetPassWord(emailController.text);
                                        // },
                                        {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) {
                                            var _registredEmailIDController;
                                            return AlertDialog(
                                              title: Text(
                                                  "Enter your Registred Email Id"),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  TextField(
                                                    controller:
                                                        _registredEmailIDController,
                                                  ),
                                                ],
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text("Confirm"),
                                                  textColor: Colors.white,
                                                  color: Colors.blue,
                                                  onPressed: () async {
                                                    final registredEmailId =
                                                        _registredEmailIDController
                                                            .text
                                                            .trim();
                                                    await _auth.forgetPassWord(
                                                        registredEmailId);
                                                    //Navigator. pop();
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          //                            fontFamily: 'Montserrat',
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  height: 40.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.greenAccent,
                                    color: Colors.green,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      onTap: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            _isLoading = true;
                                          });
                                          dynamic result = await _auth
                                              .signInwithEmailAndPassword(
                                                  emailController.text,
                                                  passwordController.text);
                                          if (result == null) {
                                            setState(() {
                                              error =
                                                  'enter correct credentials';
                                              _isLoading = false;
                                            });
                                          }

                                          print('valid');
                                          //print(passwordController.text);
                                        }
                                        // print(emailController.text);
                                        // print(passwordController.text);
                                        // setState(() {
                                        //   _isLoading = true;
                                        // });
                                        // signIn(emailController.text,passwordController.text);
                                      },
                                      child: Center(
                                        child: Text(
                                          'LOGIN',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          //                              fontFamily: 'Montserrat'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text(error,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14.0,
                                    )),
                              ],
                            )),
                        //SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'First Time User',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat'),
                            ),
                            SizedBox(width: 5.0),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.green,
                                    //                fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        //  RaisedButton(
                        //     onPressed: () async {
                        //     Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginOtp()));
                        //     },
                        //     child: Text('Login through Mobile No'),
                        //     ),
                        // RaisedButton(
                        //     onPressed: () async {
                        //       dynamic result = await _auth.sigInAnon();
                        //       if (result == null) {
                        //         print('error in sigin');
                        //       } else {
                        //         print('signin');
                        //         print(result.uid);
                        //       }
                        //     },
                        //     child: Text('Signin as Guest'))
                        ///for image picker
                        //  RaisedButton(
                        //    // onPressed: () => profilePage.getImage(),
                        //     onPressed: (){
                        //       Navigator.of(context).pushNamed('/MyProfile');
                        //     },
                        //     child: Text('upload an image'))
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
