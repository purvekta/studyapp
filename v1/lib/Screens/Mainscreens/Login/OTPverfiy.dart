import 'package:flutter/material.dart';
class OTPverify extends StatefulWidget {
  final String smsCode;
  OTPverify({this.smsCode});
  @override
  _OTPverifyState createState() => _OTPverifyState();
}

class _OTPverifyState extends State<OTPverify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children:<Widget> [
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            maxLength: 4,
            cursorWidth: 4,

            onChanged: (val) {
                      setState(() {
                   //     this.{Widget.smsCode} = val;
                      });
                    },
          )),
        ]
      ),
    );
  }
}