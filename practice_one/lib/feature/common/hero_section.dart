import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final String heroMsg;
  final double msgHeight;
  const HeroSection({super.key, required this.heroMsg, required this.msgHeight});

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
        Text(
          heroMsg,
          textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
        ),
      ],
    );
  }
}
