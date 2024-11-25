import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/feature/common/hero_section.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/feature/common/theme.dart';

class ProfileImgTakeScreen extends ConsumerStatefulWidget {
  const ProfileImgTakeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ProfileImgTakeScreenState();
}

class ProfileImgTakeScreenState extends ConsumerState<ProfileImgTakeScreen> {
  final _formKey = GlobalKey<FormState>();

// --------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Stack(
              children: [
                const Positioned(
                    top: 0,
                    left: 5,
                    right: 5,
                    child: HeroSectionNoLogo(
                      heroMsg: 'প্রোফাইলের ছবি যোগ করুন',
                      msgWeight: 250,
                    )),

// -------------------------------------------- Img Section -------------------------------------------------------------------
                Positioned(
                    left: 5,
                    right: 5,
                    top: 150,
                    child: CircleAvatar(
                      minRadius: 50,
                      maxRadius: 80,
                      backgroundColor: ColorsClass.white,

                      child: Image.asset(
                        'assets/images/profile.png',
                       fit: BoxFit.contain,
                       
                      ),
                    )),

                Positioned(
                  top: 350, // Adjust this based on your design
                  left: 5,
                  right: 5,
                  child: SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 190,
                          // height: 80,
                          child: CustomSqureBtn(
                            btnName: 'ছবি তুলুন', 
                            foregroundColor: ColorsClass.black,
                            backgroundColor: ColorsClass.white,
                            // minimumSize: const Size(double.infinity, 0),
                            elevation: 5,
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            borderSide: true,
                            onPressed: (){},
                            ),



                        ),


                        SizedBox(
                          width: 190,
                          // height: 80,
                          child:  CustomSqureBtn(
                            btnName: 'আপলোড', 
                            foregroundColor: ColorsClass.white,
                            backgroundColor: ColorsClass.green,
                            // minimumSize: const Size(double.infinity, 0),
                            elevation: 5,
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            borderSide: false,
                            onPressed: (){},
                            ),


                        ),




                      ],
                    )
                  ),
                ),

// -------------------------------------------- Img Section -------------------------------------------------------------------
                Positioned(
                  bottom: 35,
                  left: 5,
                  right: 5,
                  child: SizedBox(
                    width: 400,
                    child: CustomBtn(
                      btnName: "এগিয়ে যান",
                      backgroundColor: const Color(0xff15803D),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(370, 0),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 5,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Perform action (e.g., navigate to another page)

                          // navigatePush(context, const ProfessionScreen());
                        }
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
