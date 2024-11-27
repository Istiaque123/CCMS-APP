import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/common/useful_methode.dart';
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

  // ! ----------------------------Empty Complain Card---------------------------
  static Widget emptyComplainCard(Size size){
    return Card(
                elevation: 5,
                color: ColorsClass.cardColor,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              child: Container(
                width: size.width *0.9,
                height: size.height *0.2,
                padding: EdgeInsets.all(size.height*0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/search-alt.svg',
                      width: size.width * 0.1,
                      height: size.height * 0.07,
                      ),

                      SizedBox(height: size.height *0.02,),
                      Expanded(
                        child: SizedBox(
                          width: size.width *0.6,
                          child: Text(
                            'বর্তমানে আপনার কোনো প্রক্রিয়াধীন অভিযোগ নেই',
                            style: formPageTextStyle(fontSize: size.width*0.04),
                            textAlign: TextAlign.center,
                          ),
                      ))
                    
                  ],
                ),
              ),
              );
  }

}

