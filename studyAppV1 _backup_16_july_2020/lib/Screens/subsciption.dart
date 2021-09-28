import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studyapp/models/payment/suceespage.dart';
import 'package:studyapp/models/constants.dart';
import 'customshapclipper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Subsciption extends StatefulWidget {
//PaymentDetailState paymentDetailState;
  final String expDate;
  final String courseName;
  final coursePrice;
  //var totalamount;
  Subsciption({this.expDate, this.courseName, this.coursePrice});

  @override
  _SubsciptionState createState() => _SubsciptionState();
}

class _SubsciptionState extends State<Subsciption> {
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
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
                      'Subscription Detail',
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
            height: 300,
            color: Colors.cyan,
            width: 300,
            child: RichText(
              text: TextSpan(
                //  text: '11th Science -NEET (3 months plan) \n Rs: 2500 ',
                text: widget.courseName,
                // style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: '${widget.coursePrice}'),
                  // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.normal)),
                  TextSpan(text: validity),
                  TextSpan(text: '${widget.expDate}'),
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
              openCheckOut(widget.coursePrice);
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
        ]),
      ),
    );
  }
}
