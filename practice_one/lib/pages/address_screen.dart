import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/feature/common/hero_section.dart';
import 'package:practice_one/feature/common/keybord_input_section.dart';
import 'package:practice_one/feature/common/navigator.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/feature/common/theme.dart';
import 'package:practice_one/feature/common/useful_methode.dart';
import 'package:practice_one/feature/notifiers/district_division_notifier.dart';
import 'package:practice_one/pages/profession_screen.dart';
import 'package:practice_one/utils/apis/district_division_api.dart';

class AddressScreen extends ConsumerStatefulWidget {
  const AddressScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddressScreenState();
}

class _AddressScreenState extends ConsumerState<AddressScreen> {
  final addressTextEditingCntroller = TextEditingController();
  final pastelCodeTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? division;
  String? district;

// -----------------------------------------------------------------------------------------------

  @override
  void dispose() {
    addressTextEditingCntroller.dispose();
    pastelCodeTextEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ref.read(divisionNotifierProvider.notifier).fetchDivisionData();
    ref.read(districtNotifierProvider.notifier).fetchDistrictData(ref.read(divisionNameProvider));
  }

// -----------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final divisionState = ref.watch(divisionNotifierProvider);
    final districtState = ref.watch(districtNotifierProvider);
    ref.watch(divisionNameProvider);
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
                      heroMsg: 'ঠিকানা প্রদান করুন',
                      msgWeight: 300,
                    )),
                Positioned(
                  top: 250,
                  right: 5,
                  left: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: KeybordInputSection(
                          inputTextEditorController:
                              addressTextEditingCntroller,
                          hintText: 'সম্পুর্ণ ঠিকানা',
                          isRequired: true,
                          validator: (value) =>
                              validator(value, 'সম্পুর্ণ ঠিকানা'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 450,
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 5, // Add spacing between widgets
                          runSpacing: 20, // Add spacing between rows of widgets


                          children: [
                            // Divition Dropdown -----------------
                            SizedBox(
                              width: 200, 
                              
                              child: divisionState.isEmpty
                                  ? null
                                  : DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField2(

                                        buttonStyleData: const ButtonStyleData(
                                          height: 30
                                        ),
                                        alignment: Alignment.centerLeft,
                                        iconStyleData: const IconStyleData(
                                          icon: Icon(Icons.arrow_downward),
                                          iconDisabledColor: Colors.grey,
                                          iconEnabledColor: Colors.green
                                        ),
                                        dropdownStyleData:
                                            const DropdownStyleData(
                                          maxHeight: 200,
                                          // padding: EdgeInsets.symmetric(horizontal: 16)
                                        ),
                                        value: division,
                                        decoration: InputDecoration(
                                          hintText: 'বিভাগ',
                                          label: RichText(
                                            text: TextSpan(
                                              text: 'বিভাগ',
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
                                          focusedBorder: myBorderStyle(),
                                        ),
                                        validator: (value) =>
                                            validator(value, 'বিভাগ'),
                                        items: divisionState
                                            .map((division) =>
                                                DropdownMenuItem<String>(
                                                    value: division.division,
                                                    child: Text(
                                                      division.divisionBn,
                                                      style: myTextStyle(),
                                                    )))
                                            .toList(),
                                        onChanged: (value) {
                                          if (value != division) {
                                            // Only fetch if the value has changed
                                            setState(() {
                                              division = value as String;
                                              district =
                                                  null; // Reset district when division changes
                                            });
                                            ref
                                                .read(districtNotifierProvider
                                                    .notifier)
                                                .fetchDistrictData(ref.read(divisionNameProvider.notifier).state = value!);
                                          }
                                        },
                                      ),
                                    ),
                            ),

                            // District Dropdown ------------------------------
                            SizedBox(
                              width: 200, // Adjust width as per requirement
                              child:
                              districtState.isEmpty ? null :
                                      DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField2(
                                          value: district,
                                          iconStyleData: const IconStyleData(
                                            icon: Icon(Icons.arrow_downward),
                                            iconEnabledColor: Colors.green,
                                            iconDisabledColor: Colors.grey,
                                          ),
                                          dropdownStyleData: const DropdownStyleData(
                                            maxHeight: 200
                                          ),
                                          buttonStyleData: const ButtonStyleData(
                                            height: 30
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'জেলা',
                                            hintStyle: myTextStyle(),
                                            label: RichText(
                                              text: TextSpan(
                                                text: 'জেলা',
                                                style: myTextStyle(),
                                                children: const [
                                                  TextSpan(
                                                    text: ' *',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            border: myBorderStyle(),
                                            enabledBorder: myBorderStyle(),
                                            focusedBorder: myBorderStyle(),
                                          ),
                                          validator: (value) =>
                                              validator(value, 'জেলা'),
                                          items: districtState
                                              .map((district) =>
                                                  DropdownMenuItem<String>(
                                                      value: district.district,
                                                      child: Text(
                                                        district.districtBn,
                                                        style: myTextStyle(),
                                                      )))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              district = value as String;
                                            });
                                          },
                                        ),
                                      ),
                                      ),

                            // Postal Code Input
                            SizedBox(
                              width: 200, // Adjust width as per requirement
                              child: KeybordInputSection(
                                inputTextEditorController:
                                    pastelCodeTextEditingController,
                                hintText: 'পোস্টাল কোড',
                                isRequired: true,
                                validator: (value) =>
                                    validator(value, 'পোস্টাল কোড'),
                              ),
                            ),
                          ],
                        ),
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
                          navigatePush(context, const ProfessionScreen());
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
