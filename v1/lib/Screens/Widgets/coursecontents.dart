

import 'package:flutter/material.dart';
import 'package:studyapp/models/constants.dart';

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  final bool isFree;
  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
    this.isFree = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Text(
              number,
              style: kHeadingextStyle.copyWith(
                color: kTextColor.withOpacity(.15),
                fontSize: 32,
              ),
            ),
            SizedBox(width: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$duration mins\n",
                    style: TextStyle(
                      color: kTextColor.withOpacity(.5),
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: title,
                    style: kSubtitleTextSyule.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            //Spacer(),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 30,
              width: 30,
              //color: Colors.black87,
              child: isFree ? Text('Free') : Text(''),
            ),
            // Spacer(),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreenColor.withOpacity(isDone ? 1 : .5),
              ),
              child: Icon(Icons.play_arrow, color: Colors.white),
            )
          ],
        ),
        onTap: () {
          Navigator.of(context).pushNamed('/PlayVideo');
        },
      ),
    );
  }
}