import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class OffersCoursal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 200,
      width: 400,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/offers/offers1.jpg'),
          AssetImage('assets/offers/offers2.jpg'),
          AssetImage('assets/offers/offers3.jpg'),
          AssetImage('assets/offers/offers4.jpg'),
        ],
      ),
    );
  }
}
