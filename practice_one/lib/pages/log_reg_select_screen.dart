import 'package:flutter/material.dart';
import 'package:practice_one/common/general_app_bar.dart';
import 'package:practice_one/common/hero_section.dart';
import 'package:practice_one/common/constraints/media_quri_size.dart';
import 'package:practice_one/common/navigator.dart';
import 'package:practice_one/common/normal_btn.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/pages/phone_num_reg_screen.dart';

class LogRegSelectScreen extends StatefulWidget {
  const LogRegSelectScreen({super.key});
  @override
  State<LogRegSelectScreen> createState() => LogRegSelectScreenState();
}

class LogRegSelectScreenState extends State<LogRegSelectScreen> {

  // ^-------------------------------Variables Attributes------------------------------------


  // ^-------------------------------Variables Attributes------------------------------------

  // &----------------build Methode------------------------------
  @override
  Widget build(BuildContext context) {
    final Size size = mediaSize(context: context);





    return Scaffold(
      appBar: GeneralAppBar.buildAppBar(),

      backgroundColor: ColorsClass.white,
      body: SingleChildScrollView(
        child: bodyWidget(size: size),
      ),
    );
  }

// ! -------------------------------- Body Widget -----------------------
  Widget bodyWidget({required final Size size}){
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 

          HeroSection(
            heroMsg:'জাতীয় ভোক্তা অধিকার সংরক্ষন অধিদপ্তর', 
            msgHeight:  size.height* 0.08
            ),
             SizedBox(
              height: size.height * 0.18,
            ),
            // ---------------------Reg BTN-------------------------
            SizedBox(
              width: size.width * 0.85,
              child: CustomBtn(
                btnName: 'রেজিস্ট্রেশন', 
                backgroundColor: const Color(0xff15803D),
                foregroundColor: Colors.white,
                elevation: 5,
                onPressed: (){
                  navigatePush(context, const PhoneNumRegScreen());
                }
                ),
            ),
               SizedBox(height: size.height * 0.02,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width *0.2,
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
                    width: size.width *0.2,
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