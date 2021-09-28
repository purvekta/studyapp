import 'package:flutter/material.dart';
import 'package:studyapp/services/auth.dart';
import 'package:studyapp/sharing/loading.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmedpasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool _isLoading = false;
  String _nickName = '';
  var _mobNo;

  @override
  Widget build(BuildContext context) {
    return _isLoading?Loading(): Scaffold(
            backgroundColor:Colors.deepPurple,
            resizeToAvoidBottomPadding: false,
            body: SingleChildScrollView(
               child: Container(
                // decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //   colors: [Colors.blue, Colors.teal],
                //   // colors: [Colors.yellow, Colors.orange],
                //   begin: Alignment.topCenter,
                //   end: AlignmentDirectional.bottomCenter,
                // )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 40.0, 0.0, 0.0),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              top: 100.0, left: 20.0, right: 20.0),
                          child: Column(
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                child: Column(children: <Widget>[
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
                                        // hintText: 'EMAIL',
                                        // hintStyle: ,
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green))),
                                  ),
                                  SizedBox(height: 10.0),
                                  TextFormField(
                                    controller: passwordController,
                                    cursorColor: Colors.white,
                                    validator: (val) => val.length < 3
                                        ? 'Enter valid Password'
                                        : null,
                                    decoration: InputDecoration(
                                        labelText: 'PASSWORD ',
                                        labelStyle: TextStyle(
                                            //  fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white70),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green))),
                                    obscureText: true,
                                  ),
                                  SizedBox(height: 10.0),
                                  TextFormField(
                                    controller: confirmedpasswordController,
                                    cursorColor: Colors.white,
                                    validator: (val) {
                                      if (val.isEmpty) {
                                        return 'empty password';
                                      }
                                      if (val != passwordController.text) {
                                        return 'password not mathed';
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'CONFIRMED PASSWORD ',
                                        labelStyle: TextStyle(
                                            //fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white70),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.green))),
                                    obscureText: true,
                                  ),
                                  SizedBox(height: 20.0),
                                  TextField(
                                    //controller: confirmedpasswordController,
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      labelText: 'Nick Name ',
                                      labelStyle: TextStyle(
                                          //fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _nickName = value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 20.0),
                                  TextField(
                                    //controller: confirmedpasswordController,
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      labelText: 'Mobile No ',
                                      labelStyle: TextStyle(
                                          //fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _mobNo = value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 20.0),
                                  Container(
                                      height: 40.0,
                                      child: Material(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        shadowColor: Colors.greenAccent,
                                        color: Colors.green,
                                        elevation: 7.0,
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                              setState(() {
                                                _isLoading = true;
                                              });

                                              dynamic result = await _auth
                                                  .registerwithEmailAndPassword(
                                                      emailController.text,
                                                      passwordController.text,
                                                      _nickName,
                                                      _mobNo,
                                                      );
                                              Navigator.of(context).pushNamed('/HomePage');
                                              // var userUpdateInfo = UserUpdateInfo();
                                              // userUpdateInfo.displayName=_nickName;
                                              // userUpdateInfo.photoUrl ='https://en.wikipedia.org/wiki/Irrfan_Khan#/media/File:Irrfan_Khan_May_2015.jpg';
                                              // FirebaseAuth.instance.updateProfile(UserUpdateInfo);
                                              
                                              if (result == null) {
                                                setState(() {
                                                  error =
                                                      'please enter valid email id';
                                                  _isLoading = false;
                                                  //print(emailController.text);
                                                  //print(passwordController.text);
                                                });
                                              }
                                            }
                                          },
                                          child: Center(
                                            child: Text(
                                              'SIGNUP',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                //fontFamily: 'Montserrat'
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  SizedBox(height: 20.0),
                                  Text(error,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14.0,
                                      )),
                                  Container(
                                    height: 40.0,
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black,
                                              style: BorderStyle.solid,
                                              width: 1.0),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Center(
                                          child: Text('Go Back',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                //fontFamily: 'Montserrat'
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          )),
                      // SizedBox(height: 15.0),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Text(
                      //       'New to Spotify?',
                      //       style: TextStyle(
                      //         fontFamily: 'Montserrat',
                      //       ),
                      //     ),
                      //     SizedBox(width: 5.0),
                      //     InkWell(
                      //       child: Text('Register',
                      //           style: TextStyle(
                      //               color: Colors.green,
                      //               fontFamily: 'Montserrat',
                      //               fontWeight: FontWeight.bold,
                      //               decoration: TextDecoration.underline)),
                      //     )
                      //   ],
                      // )
                    ]),
              ),
            ));
  }
}