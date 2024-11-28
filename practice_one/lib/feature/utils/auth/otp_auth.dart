import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpAuth extends StatelessWidget {
  final TextEditingController optTextEditingController;
  final double width;
  final double height;
  OtpAuth({
    super.key,
    required this.height,
    required this.width,
    required this.optTextEditingController
    });

  @override
  Widget build(BuildContext context) {

    return otpPin();
  }

  Widget otpPin(){
    return Pinput(
      length: 6,
      controller: optTextEditingController,
      defaultPinTheme: _defaultPinTheme(),
      keyboardType: TextInputType.number,
    );
  }

  PinTheme _defaultPinTheme ()=> PinTheme(
    
    width: width,
    height: height,
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