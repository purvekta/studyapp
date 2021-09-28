/*
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studyapp/Screens/suceespage.dart';

class CoursePayment extends StatefulWidget {
  final String courseName;
  final String coursePrice;
  final String offerPrice;
  CoursePayment({this.courseName, this.coursePrice, this.offerPrice});
  @override
  _CoursePaymentState createState() => _CoursePaymentState();
}

class _CoursePaymentState extends State<CoursePayment> {
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

  void openCheckOut(var _totalamount) async {
    var options = {
      'key': 'rzp_test_Of6iZlY1XSVoIF',
      'amount': _totalamount * 100,
      'name': 'Study App',
      'description': 'Test payment',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSucess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: 'SUCCESS:' + response.paymentId);
    //paymentresponce = response.toString();
    //print(paymentresponce);
    ///for sucess page
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Sucessresponce()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'ERROR:' + response.code.toString() + '  ' + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: 'EXTERNAL WALLET:' + response.walletName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Raju'));
  }
}
*/
