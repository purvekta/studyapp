import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import '../services/auth.dart';

//final AuthService _auth = AuthService();
// Colors
const kTextColor = Color(0xFF0D1333);
const kBlueColor = Color(0xFF6E8AFA);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);

// My Text Styles
const kHeadingextStyle = TextStyle(
  fontSize: 28,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);
const kSubheadingextStyle = TextStyle(
  fontSize: 24,
  color: Color(0xFF61688B),
  height: 2,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

const kSubtitleTextSyule = TextStyle(
  fontSize: 18,
  color: kTextColor,
  // fontWeight: FontWeight.bold,
);

const eleSciMaths = """11th Science -NEET (3 months plan) \n """;
const neetSciMaths = '12th Science -NEET (12 months plan) \n ';
const jeeSciMaths = '12th Science -JEE (12 months plan) \n  ';
const course1Price = 2500;
const course2Price = 6000;
const course3Price = 7000;

const validity = ' your Plan is valid till';
const subscribe = 'subscribe Now';

var formatter = new DateFormat('dd-MMMM-yyyy');
var eleSciencNow = new DateTime.now().add(Duration(days: 90));
var jeeSciencNow = new DateTime.now().add(Duration(days: 365));
var neetSciencNow = new DateTime.now().add(Duration(days: 365));

String updatedEleSciencNow = formatter.format(eleSciencNow);
String updatedJeeSciencNow = formatter.format(jeeSciencNow);
String updatedNeetSciencNow = formatter.format(neetSciencNow);

String courseUrl = 'http://ckp.pukemy.com/api/courses/';
//bool coursePayStatus = false;

//String usernickName = _auth.studentName ;
//String userEmailId =_auth.studentEmail;
