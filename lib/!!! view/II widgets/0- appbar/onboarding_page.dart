import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  String headLine;
  String imageLink;
  String summary;
  Color backgroundColor;
  Color textColor;
  OnBoardingPage(
      {super.key,
      required this.headLine,
      required this.imageLink,
      required this.summary,
      required this.backgroundColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          ClipRRect(
            child: Image.asset(
              'assets/images/' + imageLink,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              headLine,
              style: TextStyle(
                  fontSize: 24, color: textColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            summary,
            style: TextStyle(fontSize: 20, color: textColor),
          )
        ],
      ),
    );
  }
}
