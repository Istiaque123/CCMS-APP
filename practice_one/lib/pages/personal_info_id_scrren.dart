import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/feature/common/hero_section.dart';
import 'package:practice_one/feature/common/keybord_input_section.dart';
import 'package:practice_one/feature/common/navigator.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/feature/common/theme.dart';
import 'package:practice_one/feature/common/useful_methode.dart';
import 'package:practice_one/pages/address_screen.dart';

class PersonalInfoIdScrren extends ConsumerStatefulWidget {
  const PersonalInfoIdScrren({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PersonalInfoIdScreenState();
}

class _PersonalInfoIdScreenState extends ConsumerState<PersonalInfoIdScrren> {
  final _formKey = GlobalKey<FormState>();
  final nationalIDTextEditingColtroller = TextEditingController();
  String? selectId;
  bool numSection = false;
  final List<String> idSelection = [
    'জাতীয় পরিচয় পত্রের নাম্বার',
    'জন্মনিবন্ধন সনদের নাম্বার',
    'পাসপোর্টের নাম্বার*'
  ];

  // --------------------------------------------------------------------------------------------------

  @override
  void dispose() {
    nationalIDTextEditingColtroller.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorsClass.green,
         backgroundColor: ColorsClass.white,
      ),
       backgroundColor: ColorsClass.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
                    heroMsg: "ব্যাক্তিগত তথ্য প্রদান করুন",
                    msgWeight: 300,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ID Selection Option

                      SizedBox(
                        width: 400,
                        // height: 80,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField2<String>(
                            // borderRadius: BorderRadius.circular(10),

                            value: selectId,
                            // iconDisabledColor: Colors.grey,
                            // iconEnabledColor: Colors.green,
                            decoration: InputDecoration(
                                hintText: 'পরিচয় তথ্য নির্বাচন',
                                hintStyle: myTextStyle(),
                                // labelText: 'পরিচয় তথ্য নির্বাচন',
                                label: RichText(
                                  text: TextSpan(
                                    text: 'পরিচয় তথ্য নির্বাচন',
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

                            items: idSelection
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
                                selectId = value;
                                numSection = true;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 400,
                        child: (numSection)
                            ? KeybordInputSection(
                                inputTextEditorController:
                                    nationalIDTextEditingColtroller,
                                hintText: selectId!,
                                // isEnabled: true,
                                keyboardType: TextInputType.text,
                                isRequired: true,
                                validator: (value) {
                                  // updateHeightCheck();
                                  return validator(value, selectId!);
                                },
                              )
                            : null,
                      ),
                    ],
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
                          navigatePush(context,  const AddressScreen());
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
