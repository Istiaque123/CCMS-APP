import 'package:flutter/material.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/pages/phone_num_reg_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

// routeSector
  static route() => MaterialPageRoute(
    builder: (cotext) => const MyHomeScreen()
    );
// -----------------------------------

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: bodyWeiget(),
      ),
    );
  }

  Widget bodyWeiget(){
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
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
          const SizedBox(height: 150,),
          const Text(
            'জাতীয় ভোক্তা অধিকার সংরক্ষন অধিদপ্তর',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
            ),
            const SizedBox(
              height: 100,
            ),
            // ---------------------Reg BTN-------------------------
            CustomBtn(
              btnName: 'রেজিস্ট্রেশন', 
              backgroundColor: const Color(0xff15803D),
              foregroundColor: Colors.white,
              minimumSize: const Size(370, 0),
              elevation: 5,
              onPressed: (){
                Navigator.push(context, PhoneNumRegScreen.route());
              }
              ),
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                        
                      )
                    ),
                  ),
                   
                  const SizedBox(width: 15,),
                  const Text(
                    'অথবা',
                    style: TextStyle(
                      fontSize: 15
                    ),
                    ),
                  const SizedBox(width: 15,),
                   Container(
                    width: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 20,),
              const Text(
                'ইতঃমধ্যে রেজিস্ট্রেশন করেছেন?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
                ),
              ),

              const SizedBox(height: 15,),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 50),
              //   child: button("লগইন",  Colors.white, Colors.black, true, (){}),
              // ),
              NormalBtn(
                btnName: "লগইন", 
                backgroundColor: Colors.white, 
                foregroundColor: Colors.black, 
                borderSide: true, 
                onPressed: (){}
                ),
                const SizedBox(height: 30,),
                NormalBtn(
                  btnName: "এডমিন হিসেবে লগইন করুন", 
                  backgroundColor: Colors.white, 
                  foregroundColor: const Color(0xff15803D), 
                  borderSide: true, 
                  borderColor: const Color(0xff15803D), 
                  onPressed: (){}
                  ),
                  const SizedBox(height: 80,),
        ],
      ),
    );
  }

  
}