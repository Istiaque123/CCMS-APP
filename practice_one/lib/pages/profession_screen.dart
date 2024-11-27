import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/common/hero_section.dart';
import 'package:practice_one/common/navigator.dart';
import 'package:practice_one/common/normal_btn.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/common/useful_methode.dart';
import 'package:practice_one/pages/profile_img_take_screen.dart';

class ProfessionScreen extends ConsumerStatefulWidget {
  const ProfessionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfessionScreenState();
}

class _ProfessionScreenState extends ConsumerState<ProfessionScreen> {

  final _formKey = GlobalKey<FormState>();

  String? profession;

  final List<String> professionSection = [
    'শিক্ষার্থী',
    'ব্যবসায়ী',
    'চাকুরীজীবী',
    'গৃহিণী',
    'কৃষক',
    'অন্যান্য'
  ];



// --------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorsClass.green,
         backgroundColor: ColorsClass.white,
      ),
       backgroundColor: ColorsClass.white,

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
                      heroMsg: 'পেশাগত তথ্য প্রদান করুন',
                      msgWeight: 300,
                    )),

                    Positioned(
                      left: 5,
                      right: 5,
                      top: 250,
                      child: SizedBox(
                          width: 400,
                          // height: 80,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField2<String>(
                              // borderRadius: BorderRadius.circular(10),
                      
                              value: profession,
                              // iconDisabledColor: Colors.grey,
                              // iconEnabledColor: Colors.green,
                              iconStyleData: const IconStyleData(
                                          icon: Icon(Icons.arrow_downward),
                                          iconDisabledColor: Colors.grey,
                                          iconEnabledColor: Colors.green
                                        ),
                              
                              decoration: InputDecoration(
                                  hintText: 'আমি একজন ',
                                  hintStyle: myTextStyle(),
                                  // labelText: 'পরিচয় তথ্য নির্বাচন',
                                  label: RichText(
                                    text: TextSpan(
                                      text: 'আমি একজন ',
                                      style: myTextStyle(),
                                      children: const [
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  border: myBorderStyle(),
                                  enabledBorder: myBorderStyle(),
                                  focusedBorder: myBorderStyle()),
                      
                              validator: (value) =>
                                  validator(value, 'পরিচয় তথ্য নির্বাচন'),
                      
                              items: professionSection
                                  .map((id) => DropdownMenuItem(
                                      value: id,
                                      child: Text(
                                        id,
                                        style: myTextStyle(),
                                      )))
                                  .toList(),
                      
                              onChanged: (value) {
                                if (_formKey.currentState?.validate() == false) {
                                  setState(() {
                                    // Trigger a re-render and remove any error
                                  return;
                                  });
                                }
                      
                                setState(() {
                                  profession = value;
                                });
                              },
                            ),
                          ),
                        ),
                    ),








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
                          navigatePush(context, const ProfileImgTakeScreen());
                        }
                      },
                    ),
                  ),
                )

            ],

          )
          ),

      ),


    );
  }
}