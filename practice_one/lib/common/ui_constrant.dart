import 'package:flutter/material.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/pages/inside%20app/views/home_page_content_screen.dart';

class UIConstrant {
  // ! -------------------------AppBar-------------------------------
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

  // !--------------------------List Of Widget---------------------------------
  static List<Widget> bottomTabBarPages = [
    Text('List Screen'),
    Text('profile Screen'),
    HomePageContentScreen(),
    Text('notification Screen'),
    Text('Settings Screen'),
  ];


}

