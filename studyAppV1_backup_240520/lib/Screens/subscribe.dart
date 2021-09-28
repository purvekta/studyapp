import  'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:studyapp/models/constants.dart';
import 'payment.dart';
import 'subsciption.dart';
import 'modified_payment.dart';
import 'customshapclipper.dart';
//import 'subscriptiondetails.dart';

class Subscribe extends StatefulWidget {
  @override
  _SubscribeState createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  String courseName = eleSciMaths;
  var coursePrice;

  

//      var formatter = new DateFormat('yyyy-MM-dd');
      var formatter = new DateFormat('dd-MMMM-yyyy');
     
  @override
  Widget build(BuildContext context) {
  //var expDate1 = now.add(Duration(days:30));
//print(courseName);
//String updated = formatted.add(Duration(days: 90);

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
              width: 300,
              height: 100,
              color: Colors.blueAccent,
              child: OutlineButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Subsciption(courseName:courseName,expDate:updatedEleSciencNow,coursePrice: course1Price,)));
                 //  Navigator.of(context).pushNamed('/Subscribedetails');
                  // Navigator.of(context).pushNamed('/tempPayment');
               //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Modi_PaymentDetail(totalamount: coursePrice)));
                },
                child:RichText(
   text: TextSpan(
   //  text: '11th Science -NEET (3 months plan) \n Rs: 2500 ',
    text: eleSciMaths,
    // style: DefaultTextStyle.of(context).style,
     children: <TextSpan>[
       TextSpan(text: course1Price.toString()),
      // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.normal)),
       TextSpan(text: validity),
       TextSpan(text: '$updatedEleSciencNow'),
       TextSpan(text: ' \n subscribe Now'),
     ],
   ),
 ), 
                
                ),
              ),
              SizedBox(height: 30),
            Container(
              width: 300,
              height: 100,
              color: Colors.blueAccent,
              child: OutlineButton(
                onPressed: (){
             //     Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentDetail(courseName:jeeSciMaths,expDate:updatedJeeSciencNow)));
    //               Navigator.push(context, MaterialPageRoute(builder: (context)=> Subsciption(courseName:jeeSciMaths,expDate:updatedJeeSciencNow)));
     // Navigator.push(context, MaterialPageRoute(builder: (context)=> Modi_PaymentDetail(totalamount: coursePrice)));           
                 //  Navigator.of(context).pushNamed('/Subscribedetails');
                //    Navigator.of(context).pushNamed('/tempPayment');
       Navigator.push(context, MaterialPageRoute(builder: (context)=> Subsciption(courseName:courseName,expDate:updatedEleSciencNow,coursePrice: course2Price,)));
                 },
                child:RichText(
   text: TextSpan(
     text: jeeSciMaths,
    // style: DefaultTextStyle.of(context).style,
     children: <TextSpan>[
        TextSpan(text: course2Price.toString()),
      // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.normal)),
       TextSpan(text: ' your Plan is valid till $updatedJeeSciencNow'),
       TextSpan(text: ' \n subscribe Now'),
     ],
   ),
 ), 
                
                ),
              ),
              SizedBox(height: 30),
            Container(
              width: 300,
              height: 100,
              color: Colors.blueAccent,
              child: OutlineButton(
                onPressed: (){
              //     Navigator.of(context).pushNamed('/Subscribedetails');
//             Navigator.push(context, MaterialPageRoute(builder: (context)=> Subsciption(courseName:neetSciMaths,expDate:updatedJeeSciencNow)));
 // Navigator.push(context, MaterialPageRoute(builder: (context)=> Modi_PaymentDetail(totalamount: coursePrice)));                   
   Navigator.push(context, MaterialPageRoute(builder: (context)=> Subsciption(courseName:courseName,expDate:updatedEleSciencNow,coursePrice: course3Price,)));
                },
                child:RichText(
   text: TextSpan(
     text: neetSciMaths,
    // style: DefaultTextStyle.of(context).style,
     children: <TextSpan>[
 TextSpan(text: course3Price.toString()),
      // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.normal)),
       TextSpan(text: ' your Plan is valid till $updatedNeetSciencNow'),
       TextSpan(text: ' \n subscribe Now'),
     ],
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