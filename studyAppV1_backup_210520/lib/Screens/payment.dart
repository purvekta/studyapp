
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

//import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentDetail extends StatefulWidget {
  @override
  PaymentDetailState createState() => PaymentDetailState();
}

class PaymentDetailState extends State<PaymentDetail> {
 
 
  int _totalAmount =0;

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
  'amount' : _totalAmount*100,
  'name' : 'chandresh',
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
        appBar: AppBar(
          title: Text('payment'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LimitedBox(
              maxWidth: 150,
                          child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'enter the amount',
                ),
                onChanged: (value) {
                  setState(() {
                    _totalAmount =  num.parse(value);
                  });
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              color: Colors.white,
              onPressed: (){
                 openCheckOut();
              },
              child: Text('make payment',
              style: TextStyle(
                color: Colors.teal,
                
              ),),
              ),

          ],
        )));
  }
}
