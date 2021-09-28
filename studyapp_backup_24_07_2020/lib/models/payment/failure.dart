import 'package:flutter/material.dart';

class Failureresponce extends StatelessWidget {
  final String failureresponce;
  Failureresponce({this.failureresponce});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Container(
        child: Text(failureresponce),
      ),
    );
  }
}
