/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

//import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:studyapp/Screens/suceespage.dart';
import 'package:studyapp/models/constants.dart';
import 'subsciption.dart';

import 'customshapclipper.dart';

class PaymentDetail extends StatefulWidget {
//   String courseName;
//   String expDate;
// PaymentDetail({this.courseName,this.expDate});
//   @override
  PaymentDetailState createState() => PaymentDetailState();
}

class PaymentDetailState extends State<PaymentDetail> {

//PaymentDetailState({this.expDate,this.courseName}); 
 String paymentresponce ='';
 
 //var currentTime = DateTime.now();
  //int _totalAmount =0;
  //int _totalAmount =  num.parse(2);

 Razorpay _razorpay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSucess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

void openCheckOut() async {
var options ={
  'key' : 'rzp_test_Of6iZlY1XSVoIF',
  'amount' : 1*100,
  'name' : 'Study App',
  'description': 'Test payment',
  'prefill': { 'contact': '', 'email': ''},
  'external': {
    'wallets': ['paytm']
  }

};
try{
  _razorpay.open(options);
}
catch(e)
{
  debugPrint(e);
}
}

void _handlePaymentSucess(PaymentSuccessResponse response){
  Fluttertoast.showToast(msg: 'SUCCESS:'+ response.paymentId);
  //paymentresponce = response.toString();
  //print(paymentresponce);
  

}
void _handlePaymentError (PaymentFailureResponse response){

Fluttertoast.showToast(msg: 'ERROR:'+ response.code.toString() + '  '+ response.message);

}

void _handleExternalWallet (ExternalWalletResponse response){
  
    Fluttertoast.showToast(msg: 'EXTERNAL WALLET:'+ response.walletName);
}
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('payment'),
        // ),
        body: SingleChildScrollView(
                  child: Column(
                    children: <Widget> [
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
            // Container(
            //   color:Colors.cyan,
            //   height: 300,
            //   child: Subsciption(courseName:courseName,expDate:expDate)),
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
                    TextSpan(text: ' your Plan is valid till '),
                    TextSpan(text: ' \n subscribe Now'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
                       Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // LimitedBox(
              //   maxWidth: 150,
              //               child: TextField(
              //     keyboardType: TextInputType.number,
              //     decoration: InputDecoration(
              //       hintText: 'enter the amount',
              //     ),
              //     onChanged: (value) {
              //       setState(() {
              //         _totalAmount =  num.parse(value);
              //       });
              //     },
              //   ),
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              GestureDetector(
              onTap: () {
              openCheckOut();
              
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


            ////sucess code starts
//            Sucessresponce(),

            
            /// sucees code ends
              // RaisedButton(
              //   color: Colors.white,
              //   onPressed: (){
                   
              //   },
              //   child: Text('make payment',
              //   style: TextStyle(
              //     color: Colors.teal,
                  
              //   ),),
              //   ),
            

            ],
          ),
                    ],
             
          ),
        ));
  }
}
*/