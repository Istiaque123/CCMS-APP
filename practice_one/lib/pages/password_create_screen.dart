import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/common/constraints/media_quri_size.dart';
import 'package:practice_one/common/constraints/otp_scaffold.dart';
import 'package:practice_one/common/general_app_bar.dart';
import 'package:practice_one/common/hero_section.dart';
import 'package:practice_one/common/keybord_input_section.dart';
import 'package:practice_one/common/navigator.dart';
import 'package:practice_one/common/normal_btn.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/common/useful_methode.dart';
import 'package:practice_one/feature/normal%20provider/opt_time_provider.dart';
import 'package:practice_one/feature/utils/api%20notifiers/log_reg_notifier.dart';
import 'package:practice_one/pages/personal_info_name_screen.dart';

class PasswordCreateScreen extends ConsumerStatefulWidget {

  const PasswordCreateScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordCreateScreenState();
}

class _PasswordCreateScreenState extends ConsumerState<PasswordCreateScreen> {
// ^--------------------Variables and Attributes--------------------------------
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController passwordTextEditingController;
  late final TextEditingController conPasswordTextEditingController;

// ^--------------------Variables and Attributes--------------------------------

// &------------------------Methods----------------------------------------
  @override
  void dispose() {
    passwordTextEditingController.dispose();
    conPasswordTextEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    passwordTextEditingController = TextEditingController();
    conPasswordTextEditingController = TextEditingController();
    passwordTextEditingController.text = '';
    conPasswordTextEditingController.text = '';
    super.initState();
  }

  String? validatePasswords({
    required String password,
    required String confirmPassword,
  }) {
    if (password.isEmpty || confirmPassword.isEmpty) {
      return 'পাসওয়ার্ড এবং নিশ্চিত পাসওয়ার্ড প্রয়োজন';
    }
    if (password.length < 6) {
      return 'পাসওয়ার্ড অন্তত ৬ অক্ষরের হতে হবে';
    }
    if (password != confirmPassword) {
      return 'পাসওয়ার্ড মিলছে না';
    }
    return null;
  }

  void _onpressedRegPassword() async {
    if (_formKey.currentState?.validate() ?? false) {

      final String username = ref.read(phoneNumProvider); 
      final String result = await ref.read(logRegNotifierProvider.notifier)
      .complinerRegtistrationStatus(username: username, password: passwordTextEditingController.text);

      if (result == 'successfully') {
        OtpScaffold.otpScaffoldMsgCon(
            context: context,
            msg: 'complainer register successfully',
            color: ColorsClass.greenDark);
        navigatePush(context, const PersonalInfoNameScreen());
        return;
      }
      OtpScaffold.otpScaffoldMsgCon(
          context: context, msg: result, color: ColorsClass.redLigt);
      
    }
  }

// &------------------------Methods----------------------------------------

// *---------------------build function
  @override
  Widget build(BuildContext context) {
    // print("build");
    final Size size = mediaSize(context: context);

    return Scaffold(
      appBar: GeneralAppBar.buildAppBar(),
      backgroundColor: ColorsClass.white,

      //  *---------------body-----------------------------------
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(size.height * 0.018),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: HeroSection(
                    heroMsg: "আপনার পাসওয়ার্ড প্রদান করুন",
                    msgWidth: size.width * 0.6,
                    msgHeight: size.height * 0.09),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: size.height * 0.35,
                child: SizedBox(
                  width: size.width,
                  child: KeybordInputSection(
                    inputTextEditorController: passwordTextEditingController,
                    hintText: 'পাসওয়ার্ড দিন',
                    isPasswordFeild: true,
                    validator: (value) {
                      if (validator(value, 'আপনার পাসওয়ার্ড দিন') != null) {
                        return 'আপনার পাসওয়ার্ড দিন';
                      }
                      if (value!.length < 6) {
                        return 'পাসওয়ার্ড অন্তত ৬ অক্ষরের হতে হবে';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: size.height * 0.44,
                child: SizedBox(
                  width: size.width,
                  child: KeybordInputSection(
                    inputTextEditorController: conPasswordTextEditingController,
                    hintText: 'পাসওয়ার্ড নিশ্চিত করুন',
                    isPasswordFeild: true,
                    validator: (value) {
                      return validatePasswords(
                        password: passwordTextEditingController.text,
                        confirmPassword: value ?? '',
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: size.height * 0.03,
                child: CustomBtn(
                    btnName: "এগিয়ে যান",
                    backgroundColor: const Color(0xff15803D),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(370, 0),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    elevation: 5,
                    onPressed: _onpressedRegPassword
                    ),
              )
            ],
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
