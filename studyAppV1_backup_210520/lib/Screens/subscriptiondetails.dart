import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studyapp/Screens/paymentdetail_updated.dart';
import 'package:studyapp/models/constants.dart';

import 'customshapclipper.dart';
import 'payment.dart';

class SubscribeDetails extends StatelessWidget {
  //PaymentDetailState _paymentDetailState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    color: Colors.amber,
                    height: 200,
                    width: 400,
                    child: Center(
                      child: Text(
                        'Subscription Details',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                //SvgPicture.asset("assets/icons/arrow-left.svg"),
                Positioned(
                  width: 30,
                  top: 50,
                  left: 10,
                  child: GestureDetector(
                    child: SvgPicture.asset("assets/icons/arrow-left.svg"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.white,
              child: RichText(
                //color: Color.
                text: TextSpan(
                  text: '11th Science -NEET (3 months plan) \n Rs: 2500 ',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  // style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.normal)),
                    TextSpan(text: ' your Plan is valid till'),
                    TextSpan(text: ' \n subscribe Now'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => PaymentDetail()));
           //  Navigator.push(context,MaterialPageRoute(builder: (context) => RazorPayDetails()));

           //  _paymentDetailState.openCheckOut();
              },
              child: Container(
                alignment: Alignment.center,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: kBlueColor,
                ),
                child: Text(
                  "Pay Now",
                  style: kSubtitleTextSyule.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Container(
            //     width: 100,
            //     height: 50,
            //     color: Colors.amberAccent,
            //     child: RaisedButton(
            //       onPressed: () {},
            //       color: Colors.red,
            //       child: Text('PayNow'),
            //     ),
            //     ),
          ],
        ),
      ),
    );
  }
}
