import 'package:flutter/material.dart';
import 'package:practice_one/feature/common/hero_section.dart';
import 'package:practice_one/feature/common/navigator.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/feature/common/theme.dart';
import 'package:practice_one/pages/phone_num_reg_screen.dart';

class LogRegSelectScreen extends StatefulWidget {
  const LogRegSelectScreen({super.key});
  @override
  State<LogRegSelectScreen> createState() => LogRegSelectScreenState();
}

class LogRegSelectScreenState extends State<LogRegSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
         backgroundColor: ColorsClass.white,
      ),
       backgroundColor: ColorsClass.white,
      body: SingleChildScrollView(
        child: bodyWidget(),
      ),
    );
  }

// ! -------------------------------- Body Widget -----------------------
  Widget bodyWidget(){
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 

          const HeroSection(
            heroMsg:'জাতীয় ভোক্তা অধিকার সংরক্ষন অধিদপ্তর', 
            msgHeight:  80),
            const SizedBox(
              height: 150,
            ),
            // ---------------------Reg BTN-------------------------
            SizedBox(
              width: 370,
              child: CustomBtn(
                btnName: 'রেজিস্ট্রেশন', 
                backgroundColor: const Color(0xff15803D),
                foregroundColor: Colors.white,
                minimumSize: const Size(300, 0),
                elevation: 5,
                onPressed: (){
                  navigatePush(context, const PhoneNumRegScreen());
                }
                ),
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

              NormalBtn(
                btnName: "লগইন", 
                backgroundColor: Colors.white, 
                foregroundColor: Colors.black, 
                borderSide: true, 
                onPressed: (){
                  //----------------------------------------------------
                    // Task to be done
                }
                ),
                const SizedBox(height: 30,),
                NormalBtn(
                  btnName: "এডমিন হিসেবে লগইন করুন", 
                  backgroundColor: Colors.white, 
                  foregroundColor: const Color(0xff15803D), 
                  borderSide: true, 
                  borderColor: const Color(0xff15803D), 
                  onPressed: (){
                    //----------------------------------------------------
                    // Task to be done
                  }
                  ),
                  const SizedBox(height: 80,),
        ],
      ),
    );
  }

  
}