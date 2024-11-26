import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/feature/common/hero_section.dart';
import 'package:practice_one/feature/common/keybord_input_section.dart';
import 'package:practice_one/feature/common/navigator.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/feature/common/theme_colors.dart';
import 'package:practice_one/feature/common/useful_methode.dart';
import 'package:practice_one/pages/opt_reg_screen.dart';
import 'package:practice_one/utils/normal%20provider/height_provider.dart';

class PhoneNumRegScreen extends ConsumerStatefulWidget {
  const PhoneNumRegScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhoneNumRegScreenState();
}

class _PhoneNumRegScreenState extends ConsumerState<PhoneNumRegScreen> {

  final _formKey = GlobalKey<FormState>(); 

  final phoneTextEditorController = TextEditingController();

  @override
  void dispose() {
    phoneTextEditorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorsClass.green,
         backgroundColor: ColorsClass.white,
      ),
       backgroundColor: ColorsClass.white,
      body: SingleChildScrollView(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, child) {

            return bodyWidget(context, ref);
          } 
          ),

      ),
    );
  }

  //--------------------------- Body Weidget ------
  Widget bodyWidget(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeroSection(
              heroMsg: "আপনার মোবাইল নাম্বার প্রদান করুন", 
              msgHeight: 90,
              msgWeight: 300,
              ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 400,
              child: KeybordInputSection(
              inputTextEditorController: phoneTextEditorController,
              keyboardType: TextInputType.phone,
              hintText: "মোবাইল নাম্বার লিখুন",
              validator: (value) => validator(value, "আপনার মোবাইল নাম্বার প্রদান করুন"),
               ),
            ),

            SizedBox(
              height: ref.watch(bottomHeightProvider),
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
                    navigatePush(context, OptRegScreen());
                    return;
                  }
                  ref.read(bottomHeightProvider.notifier).state = 260;
              }
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