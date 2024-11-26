import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/feature/common/hero_section.dart';
import 'package:practice_one/feature/common/navigator.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/feature/common/theme_colors.dart';
import 'package:practice_one/pages/password_create_screen.dart';
import 'package:practice_one/utils/auth/otp_auth.dart';
import 'package:practice_one/utils/normal%20provider/opt_time_provider.dart';

class OptRegScreen extends ConsumerWidget {
  OptRegScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorsClass.green,
         backgroundColor: ColorsClass.white,
      ),
       backgroundColor: ColorsClass.white,
      body: SingleChildScrollView(
        child:Container(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeroSection(heroMsg: 'OTP প্রদান করুন', msgHeight: 90),
            const SizedBox(
              height: 80,
            ),
            SizedBox(width: 400, child: OtpAuth()),
            Padding(
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
                        error: (error, stackTrace) => Text(error.toString()),
                        loading: () => const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator()
                          ));
                  })),
            ),
            const SizedBox(
              height: 210,
            ),
            NormalBtn(
                btnName: "OTP নিশ্চিত করুন",
                backgroundColor: const Color(0xff15803D),
                foregroundColor: Colors.white,
                borderSide: false,
                onPressed: () {
                  navigatePush(context, const PasswordCreateScreen());
                }),
            const SizedBox(
              height: 20,
            ),
            NormalBtn(
                btnName: "পুনরায় OTP পাঠান",
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                borderSide: true,
                onPressed: () {
                  // Reset the counter 
                  ref.refresh(timeStremProvider);
                }
                ),
          ],
        ),
      ),
    ),
      ),
    );
  }
}