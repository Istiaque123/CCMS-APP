import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final String heroMsg;
  final double msgHeight;
  final double msgWidth;


  const  HeroSection({
    super.key, required this.heroMsg, 
    required this.msgHeight,
    this.msgWidth = 350.00
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              "assets/images/spalsh_logo.png",
              fit: BoxFit.contain, 
            ),
          ),
        ),
        SizedBox(height: msgHeight,),
        SizedBox(
          width: msgWidth,
          child: Text(
            heroMsg,
            textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                fontFamily: 'Kalpurush',
                color: Colors.black
              ),
          ),
        ),
      ],
    );
  }
}

class HeroSectionNoLogo extends StatelessWidget {
  final String heroMsg;
  final double msgWeight;
  final double fontSize;
  const HeroSectionNoLogo({
    super.key,
    required this.heroMsg,
    this.msgWeight = 350.00,
    this.fontSize = 36.00
    });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
            width: msgWeight,
            child: Text(
              heroMsg,
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Kalpurush',
                  color: Colors.black
                ),
            ),
          ),
    );
  }
}