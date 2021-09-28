import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:studyapp/models/payment/suceespage.dart';
import 'package:studyapp/Screens/Widgets/videoplayer/videoplayer.dart';
import 'package:studyapp/models/constants.dart';
import 'package:studyapp/models/payment/failure.dart';
import 'package:studyapp/models/payment/suceespage_Real_Time_DB.dart';
import 'package:studyapp/sharing/loading.dart';
import 'package:studyapp/models/CourseUrlData.dart';

String courseUrl = 'http://ckp.pukemy.com/api/courses/';

class AdminCourseUrl extends StatefulWidget {
  final String courseName;
  final String coursePrice;
  final String vLink;
  final String offerPrice;
  final String courseImg;
  final String courseid;
  String paymentResponce;

  AdminCourseUrl(
      {this.courseImg,
      this.courseid,
      this.offerPrice,
      this.courseName,
      this.coursePrice,
      this.vLink});
  @override
  _AdminCourseUrlState createState() => _AdminCourseUrlState();
}

class _AdminCourseUrlState extends State<AdminCourseUrl> {
  int counter = 0;
  Razorpay _razorpay;
  @override
  void initState() {
    // TODO: implement initState
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSucess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear();
    // TODO: implement dispose
    super.dispose();
  }

  void openCheckOut(var _totalamount, var _courseName) async {
    var options = {
      'key': 'rzp_test_Of6iZlY1XSVoIF',
      'amount': _totalamount * 100,
      'name': _courseName,
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
    widget.paymentResponce = response.toString();
    print(widget.paymentResponce);
    print(response);

    if ((widget.paymentResponce) == null) {
      counter = 0;
    } else {
      counter = counter + 1;
    }

    ///for sucess page
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Sucessresponce(
                  courseid: (widget.courseid),
                  paymentid: response.paymentId,
                  courseImg: (widget.courseImg),
                  counter: counter,
                  courseName: (widget.courseName),
                )));
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => RTSucessRes(
    //             courseid: (widget.courseid),
    //             paymentid: response.paymentId,
    //             courseImg: (widget.courseImg),
    //             courseName: (widget.courseName))));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'ERROR:' + response.code.toString() + '  ' + response.message);
    print(response.message);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Failureresponce(failureresponce: response.message)));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: 'EXTERNAL WALLET:' + response.walletName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.teal,
            expandedHeight: 200.0,
            // floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.courseName),
              background: Image.network(widget.courseImg,
                  //   'https://img-a.udemycdn.com/course/750x422/2638042_ea2c_5.jpg',
                  fit: BoxFit.cover),
            ),
          ),
          SliverFillRemaining(
            child: FutureBuilder(
                future: fetchCoursecontents(),
                builder: (context, snapshot) {
                  //    print(snapshot.data);
                  if (snapshot.hasData) {
                    List courseTopics = snapshot.data.topic;
                    print(courseTopics);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Course Contents'),
                        Expanded(
                          child: Container(
                            height: 550,
                            child: ListView.builder(
                              itemCount: courseTopics == null
                                  ? 0
                                  : courseTopics.length,
                              itemBuilder: (BuildContext context, int index) {
                                var val = courseTopics[index].isLocked;
                                bool ispaid;
                                if (val == 'true') {
                                  ispaid = true;
                                } else {
                                  ispaid = false;
                                }
                                print('boolean$val');
                                print('money$ispaid');
                                return Card(
                                  child: ListTile(
                                    leading: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kGreenColor.withOpacity(1),
                                      ),
                                      child: Icon(Icons.play_arrow,
                                          color: Colors.white),
                                    ),
                                    title: Text(courseTopics[index].title),
                                    trailing: ispaid
                                        ? Icon(Icons.lock, color: Colors.purple)
                                        : Text(''),
                                    onTap: () {
                                      if (!(ispaid)) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoPlayer(
                                                        vlink:
                                                            (courseTopics[index]
                                                                .link))));
                                      }
                                      //else {}

                                      // Navigator.of(context).pushNamed('/PlayVideo');
                                    },
                                  ),

                                  //Text(courseTopics[index].title)
                                );
                              },
                            ),
                          ),
                        ),

                        ///add to card and buy Now Button
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 170,
                                height: 60,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      '₹${snapshot.data.offerPrice.toString()}',
                                      // 'ADD TO CART',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '₹${snapshot.data.coursePrice.toString()}',
                                      // 'ADD TO CART',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ],
                                ),
                              ),
                              Container(padding: EdgeInsets.only(left: 10)),
                              SizedBox(
                                width: 170,
                                height: 60,
                                child: RaisedButton(
                                  onPressed: () {
                                    // openCheckOut((snapshot.data.offerPrice));
                                    openCheckOut((int.parse(widget.offerPrice)),
                                        (widget.courseName));
                                  },
                                  color: Colors.teal,
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Rowbutton(),
                      ],
                    );
                  } else {
                    return Center(child: Loading());
                  }
                }),
          ),
        ],
      ),
    );
  }

  Future<CourseUrlData> fetchCoursecontents() async {
    final courseContentResponse = await http.get(courseUrl + widget.courseid,
        headers: {"accept": "application/json"});
    print(courseUrl + widget.courseid);
    print(CourseUrlData.fromJson(json.decode(courseContentResponse.body)));
    return (CourseUrlData.fromJson(json.decode(courseContentResponse.body)));
  }
}
