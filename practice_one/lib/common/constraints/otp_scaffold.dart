import 'package:flutter/material.dart';
import 'package:practice_one/common/constraints/media_quri_size.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';

class OtpScaffold {
  
  static otpScaffoldMsg({required BuildContext context, required String msg}){
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg, // Use the fetched OTP message or error
          style: TextStyle(color: ColorsClass.white),
        ),
        backgroundColor: msg.startsWith("Error") ? ColorsClass.redLigt: ColorsClass.greenDark,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 90, left: 16, right: 16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static otpScaffoldMsgCon({required BuildContext context, required String msg, required Color color}){
    final Size size = mediaSize(context: context);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg, // Use the fetched OTP message or error
          style: TextStyle(color: ColorsClass.white),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 90, left: 16, right: 16),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}