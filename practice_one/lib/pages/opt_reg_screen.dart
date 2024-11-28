import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/common/constraints/media_quri_size.dart';
import 'package:practice_one/common/constraints/otp_scaffold.dart';
import 'package:practice_one/common/general_app_bar.dart';
import 'package:practice_one/common/hero_section.dart';
import 'package:practice_one/common/navigator.dart';
import 'package:practice_one/common/normal_btn.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/feature/utils/api%20notifiers/phn_otp_notifier.dart';
import 'package:practice_one/pages/password_create_screen.dart';
import 'package:practice_one/feature/utils/auth/otp_auth.dart';
import 'package:practice_one/feature/normal%20provider/opt_time_provider.dart';

class OptRegScreen extends ConsumerStatefulWidget {
  const OptRegScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OptRegScreenState();
}

class _OptRegScreenState extends ConsumerState<OptRegScreen> {
  // ^-------------------------------Variable Attributs---------------------------------------

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController optTextEditingController;

// &------------------------------------Methodes----------------------------------------------

  @override
  void dispose() {
    optTextEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    optTextEditingController = TextEditingController();
    optTextEditingController.text = '';
  }

// * ---------Methode for Reset Otp--------------------------------------
  void _resetOtpCode( WidgetRef ref) async {
    final result = await ref
        .read(phnOtpNotifierProvider.notifier)
        .fetchOtp(ref.read(phoneNumProvider));

    if (!mounted) return;

    OtpScaffold.otpScaffoldMsg(
      context: context, 
      msg: result);

    optTextEditingController.text = '';

    ref.refresh(timeStremProvider);
  }

//  *----------------------Methode for Confirm Otp-------------------
  void _confirmOtpCode(WidgetRef ref) async {
    final phnNum = ref.read(phoneNumProvider);
    final otp = optTextEditingController.text;

    if (_formKey.currentState?.validate() ?? false) {
      final result = await ref
          .read(phnOtpNotifierProvider.notifier)
          .fetchConfirmOtp(otp, phnNum);
      if (!mounted) return;

      if (result == 'false') {
        OtpScaffold.otpScaffoldMsgCon(
            context: context,
            msg: 'OTP validation succssful',
            color: ColorsClass.greenDark);
        navigatePush(context, const PasswordCreateScreen());
        return;
      }
      OtpScaffold.otpScaffoldMsgCon(
          context: context, msg: result, color: ColorsClass.redLigt);
    }
  }

// !-------------------build Methode----------------------------------------------
  @override
  Widget build(BuildContext context) {

    final Size size = mediaSize(context: context);


    return Scaffold(
      appBar: GeneralAppBar.buildAppBar(),

      backgroundColor: ColorsClass.white,
      // ^ body section
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding:  EdgeInsets.all(size.height * 0.018),
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
               Positioned(
                top: 0,
                right: 0,
                left: 0,
                 child: HeroSection(
                  heroMsg: 'OTP প্রদান করুন', 
                  msgHeight: size.height * 0.09),
               ),
              // const SizedBox(
              //   height: 80,
              // ),
              Positioned(
                left: 0,
                right: 0,
                top: size.height * 0.35,
                child: SizedBox(
                    width: size.width * 0.03,
                    child: OtpAuth(
                      height: size.height *0.07,
                      width: size.width *0.2,
                      optTextEditingController: optTextEditingController,
                    )),
              ),

              Positioned(
                top: size.height *0.42,
                right: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25, top: 25),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Consumer(builder: (context, ref, child) {
                        return ref.watch(timeStremProvider).when(
                            data: (data) {
                              return Text(
                                "সময়ঃ ${data.toStringAsFixed(2)} মিনিট",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.grey),
                              );
                            },
                            error: (error, stackTrace) =>
                                Text(error.toString()),
                            loading: () => SizedBox(
                                height: size.height *0.04,
                                width: size.width * 0.09,
                                child: CircularProgressIndicator(
                                  color: ColorsClass.redLigt,
                                )));
                      })),
                ),
              ),

              // const SizedBox(
              //   height: 210,
              // ),
              Positioned(
                left: 0,
                right: 0,
                bottom: size.height *0.1,
                child: NormalBtn(
                    btnName: "OTP নিশ্চিত করুন",
                    backgroundColor: const Color(0xff15803D),
                    foregroundColor: Colors.white,
                    borderSide: false,
                    onPressed: () {
                      _confirmOtpCode(ref);
                    }),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              Positioned(
                left: 0,
                right: 0,
                bottom: size.height *0.03,
                child: NormalBtn(
                    btnName: "পুনরায় OTP পাঠান",
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    borderSide: true,
                    onPressed: () {
                      _resetOtpCode(ref);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
