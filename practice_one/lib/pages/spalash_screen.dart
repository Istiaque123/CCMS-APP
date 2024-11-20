import 'package:flutter/material.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/pages/my_home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

// route sector
  static route() => MaterialPageRoute(
    builder: (context) => const SplashScreen()
    );
// --------------------------------------------------------


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: bodyWidget(context),
      ),
    );
  }

// ----------------------------------------------
  // Body Widget
  Widget bodyWidget(var context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xff15803D),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(top: 200)),
          const Text(
            "জাতীয় ভোক্তা অধিকার সংরক্ষন অধিদপ্তরে অফিসিয়াল এপ্লিকেশনে আপনাকে স্বাগতম",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 36,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(
              "assets/images/spalsh_logo.png",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "CCMS",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
              color: Colors.white,
            ),
          ),
          const Spacer(), 
          CustomBtn(
            btnName: "শুরু করুন",
            backgroundColor: Colors.white,
            foregroundColor: Colors.black, 
            onPressed: (){
              Navigator.pushReplacement(context, MyHomeScreen.route());
            },
            ),
          const SizedBox(height: 40), 
        ],
      ),
    );
  }
}
