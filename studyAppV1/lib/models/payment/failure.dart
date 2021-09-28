import 'package:flutter/material.dart';
import 'package:studyapp/homepage/homepage.dart';

class Failureresponce extends StatelessWidget {
  final String failureresponce;
  Failureresponce({this.failureresponce});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('payment failed'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('Opps! something went wrong'),
            FlatButton(
              child: Text('Please Try Again'),
              //color: Colors.red,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
              },
            ),
            Text(failureresponce),
          ],
        ),
      ),
    );
  }
}
