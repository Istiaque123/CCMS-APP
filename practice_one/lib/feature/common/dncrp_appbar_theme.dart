import 'package:flutter/material.dart';
import 'package:practice_one/feature/common/theme_colors.dart';

class DncrpAppbarTheme {
  static AppBar buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          'assets/images/spalsh_logo.png',
          fit: BoxFit.contain,
        ),
      ),
      leadingWidth: 130,
      title: const Text(
        'DNCRP - CCMS',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          wordSpacing: 3,
        ),
      ),
      backgroundColor: ColorsClass.appBarColor,
    );
  }
}
