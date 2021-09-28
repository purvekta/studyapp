import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: SpinKitWave(
        color: Colors.brown,
                type: SpinKitWaveType.center,
                size:50,
        ),
      
    );
  }
}