import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/common/hero_section.dart';
import 'package:practice_one/common/keybord_input_section.dart';
import 'package:practice_one/common/navigator.dart';
import 'package:practice_one/common/normal_btn.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/common/useful_methode.dart';
import 'package:practice_one/pages/personal_info_name_screen.dart';
import 'package:practice_one/feature/utils/normal%20provider/inpute_check_provider.dart';

class PasswordCreateScreen extends ConsumerStatefulWidget {
  const PasswordCreateScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordCreateScreenState();
}

class _PasswordCreateScreenState extends ConsumerState<PasswordCreateScreen> {

    final _formKey = GlobalKey<FormState>();
    final passwordTextEditingController = TextEditingController();
    final conPasswordTextEditingController = TextEditingController();

    @override
    void dispose() {
      passwordTextEditingController.dispose();
      conPasswordTextEditingController.dispose();
      super.dispose();
    }

    void updatePasswordCheckState() {
    final passwordValue = passwordTextEditingController.text;
    final confirmPasswordValue = conPasswordTextEditingController.text;

    ref.read(passwordCheckProvider.notifier).updateHeight(passwordValue, confirmPasswordValue);
  }

  @override
  Widget build(BuildContext context) {
    double size = ref.watch(passwordCheckProvider);
    // print("build");
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
         backgroundColor: ColorsClass.white,
      ),
       backgroundColor: ColorsClass.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeroSection(
                  heroMsg: "আপনার পাসওয়ার্ড প্রদান করুন",
                  msgWeight: 300,
                  msgHeight: 90),
                  const SizedBox( height: 100,),
                SizedBox(
                  width: 400,
                  child: KeybordInputSection(
                    inputTextEditorController: passwordTextEditingController, 
                    hintText: 'পাসওয়ার্ড দিন',
                    isPasswordFeild: true,
                    validator: (value) {
                      updatePasswordCheckState();
                  return validator(value, 'আপনার পাসওয়ার্ড দিন"');
                },
                    ),
                ) ,
              const SizedBox(height: 20,),
                SizedBox(
                  width: 400,
                  child: KeybordInputSection(
                    inputTextEditorController: conPasswordTextEditingController, 
                    hintText: 'পাসওয়ার্ড নিশ্চিত করুন',
                    isPasswordFeild: true,
                    validator: (value) {
                      updatePasswordCheckState();
                  return validator(value, "আপনার পাসওয়ার্ড দিন");
                },
                  ),
                ) ,


              SizedBox(
              // height: ref.watch(passwordCheckProvider),
              height: size,
            ),

            CustomBtn(
                btnName:  "এগিয়ে যান", 
                backgroundColor: const Color(0xff15803D),
                foregroundColor: Colors.white,
                minimumSize: const Size(370, 0),
                padding: const EdgeInsets.symmetric(vertical: 12),
                elevation: 5,
                onPressed: (){
                  if (_formKey.currentState?.validate() ?? false) {
                      // navigatePush(context, OptRegScreen());
                      navigatePush(context, const PersonalInfoNameScreen());
                      return;
                    }
              
                }
                )
            
            ],
            ),
          ),
        ),
      ),
      
      // persistentFooterButtons: [
      //   CustomBtn(
      //           btnName:  "এগিয়ে যান", 
      //           backgroundColor: const Color(0xff15803D),
      //           foregroundColor: Colors.white,
      //           minimumSize: const Size(370, 0),
      //           padding: const EdgeInsets.symmetric(vertical: 12),
      //           elevation: 5,
      //           onPressed: (){
      //             if (_formKey.currentState?.validate() ?? false) {
      //                 // navigatePush(context, OptRegScreen());
      //                 return;
      //               }
              
      //           }
      //           ),
      // ],
    );
  }
}