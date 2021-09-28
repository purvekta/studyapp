import  'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'customshapclipper.dart';
//import 'subscriptiondetails.dart';

class Subscribe extends StatelessWidget {
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
              width: 300,
              height: 100,
              color: Colors.blueAccent,
              child: OutlineButton(
                onPressed: (){
                   Navigator.of(context).pushNamed('/Subscribedetails');
                 
                },
                child:RichText(
   text: TextSpan(
     text: '11th Science -NEET (3 months plan) \n Rs: 2500 ',
    // style: DefaultTextStyle.of(context).style,
     children: <TextSpan>[
      // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.normal)),
       TextSpan(text: ' your Plan is valid till'),
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
                   Navigator.of(context).pushNamed('/Subscribedetails');
                 
                },
                child:RichText(
   text: TextSpan(
     text: '12th Science -JEE (12 months plan) \n Rs: 6000 ',
    // style: DefaultTextStyle.of(context).style,
     children: <TextSpan>[
      // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.normal)),
       TextSpan(text: ' your Plan is valid till'),
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
                   Navigator.of(context).pushNamed('/Subscribedetails');
                 
                },
                child:RichText(
   text: TextSpan(
     text: '12th Science -NEET (12 months plan) \n Rs: 6000 ',
    // style: DefaultTextStyle.of(context).style,
     children: <TextSpan>[
      // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.normal)),
       TextSpan(text: ' your Plan is valid till'),
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