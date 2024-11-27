import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpAuth extends StatelessWidget {
  OtpAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return otpPin();
  }

  Widget otpPin(){
    return Pinput(
      length: 6,
      defaultPinTheme: _defaultPinTheme,
      keyboardType: TextInputType.number,
    );
  }

  final _defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: const TextStyle(
      fontSize: 26,
      color: Colors.grey,
    ),
    
     decoration: BoxDecoration(
      
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black)
     )
  );
}