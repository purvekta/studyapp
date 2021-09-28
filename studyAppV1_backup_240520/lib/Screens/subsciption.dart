import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:studyapp/Screens/payment.dart';
import 'package:studyapp/models/constants.dart';
import 'modified_payment.dart';

import 'customshapclipper.dart';
/*
class Subsciption extends StatefulWidget {
  String expDate;
  final String courseName;
Subsciption({this.expDate,this.courseName});
  @override
  SubsciptionState createState() => SubsciptionState(expDate,courseName);
}

class SubsciptionState extends State<Subsciption> {

String expDate =expDate;
  String courseName= courseName;
  // var eleSciencNow = new DateTime.now().add(Duration(days:90));
  //   var jeeSciencNow = new DateTime.now().add(Duration(days:365));
  //     var neetSciencNow = new DateTime.now().add(Duration(days:365));

//      var formatter = new DateFormat('yyyy-MM-dd');
      var formatter = new DateFormat('dd-MMMM-yyyy');
     

  @override
  Widget build(BuildContext context) {
//     String updatedEleSciencNow = formatter.format(eleSciencNow);
// String updatedJeeSciencNow = formatter.format(jeeSciencNow);
// String updatedNeetSciencNow = formatter.format(neetSciencNow);
//String expdDate =expDate;
  

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Column(children:<Widget>[
        Container(
          height: 300,
          color: Colors.blue,
          child: RichText(
   text: TextSpan(
   //  text: '11th Science -NEET (3 months plan) \n Rs: 2500 ',
    text: courseName,
    // style: DefaultTextStyle.of(context).style,
     children: <TextSpan>[
       
      // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.normal)),
       TextSpan(text: validity),
       TextSpan(text: '${expDate.toString()}'),
       TextSpan(text: ' \n subscribe Now'),
     ],
   ),
 ),
        ),
      ]),

    );
  }
}
*/
class Subsciption extends StatelessWidget {
//PaymentDetailState paymentDetailState;
  String expDate;
  final String courseName;
  var coursePrice;
Subsciption({this.expDate,this.courseName,this.coursePrice});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
                      child: Column(

        children: <Widget> [
          Stack(children: <Widget>[
              ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      color: Colors.amber,
                      height: 200,
                      width: 400,
                      child: Center(
                        child: Text(
                           'Subscription',
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

            ],),
            Container(
              height: 300,
              color:Colors.cyan,
              width: 300,
              child: RichText(
   text: TextSpan(
   //  text: '11th Science -NEET (3 months plan) \n Rs: 2500 ',
        text: courseName,
        // style: DefaultTextStyle.of(context).style,
         children: <TextSpan>[
               
              // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.normal)),
               TextSpan(text: validity),
               TextSpan(text: '${expDate}'),
               TextSpan(text: ' \n subscribe Now'),
         ],
   ),
 ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Modi_PaymentDetail(totalamount: coursePrice)));                
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
        ]
      ),
          ),
    );

    
  }
}