import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/feature/common/hero_section.dart';
import 'package:practice_one/feature/common/keybord_input_section.dart';
import 'package:practice_one/feature/common/navigator.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/feature/common/useful_methode.dart';
import 'package:practice_one/pages/profession_screen.dart';
import 'package:practice_one/utils/normal%20provider/adress_provider.dart';

class AddressScreen extends ConsumerStatefulWidget {
  const AddressScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddressScreenState();
}

class _AddressScreenState extends ConsumerState<AddressScreen> {
  final addressTextEditingCntroller = TextEditingController();
  final pastelCodeTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? divition;

// -----------------------------------------------------------------------------------------------

  @override
  void dispose() {
    // TODO: implement dispose
    addressTextEditingCntroller.dispose();
    pastelCodeTextEditingController.dispose();
    super.dispose();
  }

// -----------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    divition = ref.watch(divisionProvider);
    final district = ref.watch(districtsProvider);

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
                        width: 400,
                        child: KeybordInputSection(
                          inputTextEditorController:
                              addressTextEditingCntroller,
                          hintText: 'সম্পুর্ণ ঠিকানা',
                          isRequired: true,
                          validator: (value)=> validator(value, 'সম্পুর্ণ ঠিকানা'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      
                      SizedBox(
                        width: 400,
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 10, // Add spacing between widgets
                          runSpacing: 10, // Add spacing between rows of widgets
                          alignment: WrapAlignment.spaceBetween, // Align items in the center
                          
                          children: [
                            // Divition Dropdown
                            SizedBox(
                              width: 190, // Adjust width as per requirement
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField2(
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(Icons.arrow_downward),
                                  ),
                                  dropdownStyleData: const DropdownStyleData(
                                    maxHeight: 200,
                                  ),
                                  value: divition,
                                  decoration: InputDecoration(
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
                                  items: divisionsAndDistricts.keys
                                      .map(
                                        (div) => DropdownMenuItem<String>(
                                          value: div,
                                          child: Text(
                                            div,
                                            style: myTextStyle(),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    ref.read(divisionProvider.notifier).state =
                                        value;
                                    ref.read(districtsProvider.notifier).state =
                                        value != null
                                            ? divisionsAndDistricts[value]!
                                            : [];
                                  },
                                ),
                              ),
                            ),

                            // District Dropdown
                            SizedBox(
                              width: 190, // Adjust width as per requirement
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField2(
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(Icons.arrow_downward),
                                    iconEnabledColor: Colors.green,
                                    iconDisabledColor: Colors.grey,
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
                                      validator(value, 'জেলা'),
                                  items: district
                                      .map(
                                        (dist) => DropdownMenuItem<String>(
                                          value: dist,
                                          child: Text(
                                            dist,
                                            style: myTextStyle(),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {},
                                ),
                              ),
                            ),

                            // Postal Code Input
                            SizedBox(
                              width: 190, // Adjust width as per requirement
                              child: KeybordInputSection(
                                inputTextEditorController: pastelCodeTextEditingController,
                                hintText: 'পোস্টাল কোড',
                                isRequired: true,
                                validator: (value) => validator(value, 'পোস্টাল কোড'),
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
                          navigatePush(context,  const ProfessionScreen());
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
