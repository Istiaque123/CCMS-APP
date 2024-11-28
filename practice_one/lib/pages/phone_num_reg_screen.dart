import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/common/constraints/otp_scaffold.dart';
import 'package:practice_one/common/general_app_bar.dart';
import 'package:practice_one/common/hero_section.dart';
import 'package:practice_one/common/keybord_input_section.dart';
import 'package:practice_one/common/constraints/media_quri_size.dart';
import 'package:practice_one/common/navigator.dart';
import 'package:practice_one/common/normal_btn.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/common/useful_methode.dart';
import 'package:practice_one/feature/utils/api%20notifiers/phn_otp_notifier.dart';
import 'package:practice_one/feature/normal%20provider/opt_time_provider.dart';
import 'package:practice_one/pages/opt_reg_screen.dart';

class PhoneNumRegScreen extends ConsumerStatefulWidget {
  const PhoneNumRegScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PhoneNumRegScreenState();
}

class _PhoneNumRegScreenState extends ConsumerState<PhoneNumRegScreen> {
// ^-----------------------------Attribute or Variables---------------------------
  final _formKey = GlobalKey<FormState>();

  final phoneTextEditorController = TextEditingController();

// ^-----------------------------Attribute or Variables---------------------------

//  &----------------------------Methode Section--------------------------------
  @override
  void dispose() {
    phoneTextEditorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    phoneTextEditorController.text = '';
  }

  // * Onpressed methode
  void _onpressed() async {

  if (_formKey.currentState?.validate() ?? false) {
    ref.read(phoneNumProvider.notifier).state = phoneTextEditorController.text;
    final phnNum = ref.read(phoneNumProvider);
    
    // Fetch OTP and wait for result
    final result = await ref
        .read(phnOtpNotifierProvider.notifier)
        .fetchOtp(phnNum);

        if (!mounted) return;
    // Show the result in a SnackBar
     OtpScaffold.otpScaffoldMsg(context: context, msg: result);
    
    // Navigate to next screen
    if (!result.startsWith("Error")) {
      navigatePush(context, const OptRegScreen());
    }
  }
}


//  &----------------------------Methode Section--------------------------------

// ** ------------------------Build Methode--------------------------------------------

  @override
  Widget build(BuildContext context) {
    // ref.watch(phoneNumProvider);
    // ref
    //     .read(phnOtpNotifierProvider.notifier)
    //     .fetchOtp(ref.read(phoneNumProvider));

    final Size size = mediaSize(context: context);
    return Scaffold(
      appBar: GeneralAppBar.buildAppBar(),
      backgroundColor: ColorsClass.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Consumer(builder: (BuildContext context, WidgetRef ref, child) {
          return bodyWidget(context: context, ref: ref, size: size);
        }),
      ),
    );
  }

  // * --------------------------- Body Weidget ------......................
  Widget bodyWidget(
      {required BuildContext context,
      required WidgetRef ref,
      required Size size}) {
    return Container(
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
                heroMsg: "আপনার মোবাইল নাম্বার প্রদান করুন",
                msgHeight: size.height * 0.09,
                msgWidth: size.width * 0.6,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: size.height * 0.4,
              child: SizedBox(
                width: size.width,
                child: KeybordInputSection(
                  inputTextEditorController: phoneTextEditorController,
                  keyboardType: TextInputType.phone,
                  hintText: "মোবাইল নাম্বার লিখুন",
                  validator: (value) => validatorPhnNum(
                      value, "আপনার সঠিক মোবাইল নাম্বার প্রদান করুন"),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: size.height * 0.01,
              child: CustomBtn(
                  btnName: "এগিয়ে যান",
                  backgroundColor: const Color(0xff15803D),
                  foregroundColor: Colors.white,
                  // minimumSize: const Size(370, 0),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  elevation: 5,
                  onPressed: _onpressed),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
