import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/common/hero_section.dart';
import 'package:practice_one/common/keybord_input_section.dart';
import 'package:practice_one/common/navigator.dart';
import 'package:practice_one/common/normal_btn.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/common/useful_methode.dart';
import 'package:practice_one/pages/personal_info_id_scrren.dart';   

class PersonalInfoNameScreen extends ConsumerStatefulWidget {
  const PersonalInfoNameScreen({super.key});

  @override
  ConsumerState<PersonalInfoNameScreen> createState() => _PersonalInfoNameScreenState();
}

class _PersonalInfoNameScreenState extends ConsumerState<PersonalInfoNameScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameTextEditingController = TextEditingController();
  final fatherNameTextEditingController = TextEditingController();
  final motherNameTextEditingController = TextEditingController();

  String? selectedGender;
  DateTime? selectedDate;
  final List<String> genders = ['পুরুষ', 'নারী', 'অন্যান্য'];

  @override
  void dispose() {
    nameTextEditingController.dispose();
    fatherNameTextEditingController.dispose();
    motherNameTextEditingController.dispose();
    super.dispose();
  }
// *******************************************************************************************************
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate){
      setState(() {
        selectedDate = picked;
      }
    );
    }
  }


   

  // void updateHeightCheck(){
  //   final name = nameTextEditingController.text;
  //   final father = fatherNameTextEditingController.text;
  //   final mother = motherNameTextEditingController.text;
  //   final gender = selectedGender ?? '';
  //   final String birthday = selectedDate != null
  //     ? "${selectedDate!.toLocal()}".split(' ')[0]
  //     : '';
  

  //   ref.read(namesPageProvider.notifier).updateHeight(name, father, mother, gender, birthday);
    
  // }



// **********************************************************************************************
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
              Positioned(
                top: 0,
                left: 5,
                right: 5,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HeroSectionNoLogo(
                    heroMsg: "ব্যাক্তিগত তথ্য প্রদান করুন",
                    msgWeight: 300,
                  ),
                  const SizedBox(height: 50),
                  // Name Field
                  SizedBox(
                    width: 400,
                    child: KeybordInputSection(
                      inputTextEditorController: nameTextEditingController,
                      hintText: 'আপনার নাম',
                      keyboardType: TextInputType.text,
                      isRequired: true,
                      validator: (value) {
                        // updateHeightCheck();
                        return validator(value, 'আপনার নাম');
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Father's Name Field
                  SizedBox(
                    width: 400,
                    child: KeybordInputSection(
                      inputTextEditorController: fatherNameTextEditingController,
                      hintText: 'আপনার পিতার নাম',
                      keyboardType: TextInputType.text,
                      isRequired: true,
                      validator: (value) {
                        // updateHeightCheck();
                        return validator(value, "আপনার পিতার নাম");
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Mother's Name Field
                  SizedBox(
                    width: 400,
                    child: KeybordInputSection(
                      inputTextEditorController: motherNameTextEditingController,
                      hintText: 'আপনার মাতার নাম',
                      keyboardType: TextInputType.text,
                      isRequired: true,
                      
                      validator: (value) {
                        // updateHeightCheck();
                        return validator(value, "আপনার মাতার নাম");
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Gender and Date of Birth in Row
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      
                        // Gender Dropdown
                        SizedBox(
                          width: 150,
                          height: 80,
                          
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField2<String>(
                              value: selectedGender,
                              iconStyleData: const IconStyleData(
                                icon: Icon(Icons.arrow_downward),
                                iconEnabledColor: Colors.green
                              ),
                              decoration: InputDecoration(
                                  hintText: 'লিঙ্গ',
                                  hintStyle: myTextStyle(),
                                
                                border: myBorderStyle(),
                                enabledBorder: myBorderStyle(),
                                focusedBorder: myBorderStyle()
                            
                              ),
                            alignment: Alignment.topCenter,
                              items: genders.map(
                                (gender) => DropdownMenuItem<String>(
                                  value: gender,
                                  child: Text(
                                    gender,
                                  style: myTextStyle(),)
                                  )).toList(),
                              
                                                  
                              onChanged: (value) {
                                
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                              validator: (value) {
                                // updateHeightCheck();
                                return validator(value, 'লিঙ্গ নির্বাচন করুন');
                              },
                            ),
                          ),
                        ),
                        // Date of Birth Picker
                        SizedBox(
                          width: 230,
                          height: 80,
                          child: TextFormField(
                            
                            
                            controller: (selectedDate != null) ?
                            TextEditingController(
                              
                              text: "${selectedDate!.toLocal()}".split(' ')[0]) :
                              null,
                            decoration: InputDecoration(
                              
                              // contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                              hintText: 'জন্ম তারিখ',
                              label: RichText(
                                text: TextSpan(
                                  text: 'জন্ম তারিখ',
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
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today_sharp),
                                onPressed: () => _selectDate(context),
                              ),
                            ),
                            readOnly: true,
                            onTap: () => _selectDate(context),
                            validator: (value) {
                              // updateHeightCheck();
                              return validator(value, 'তারিখ নির্বাচন করুন');
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                      

                      
                  
                  // SizedBox(height: ref.watch(namesPageProvider)),
                  // Submit Button
                  
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
                        navigatePush(context,  const PersonalInfoIdScrren());
                      }
                    },
                  ),
                ),)
            
            
            
            
            ]
          ),
        ),
      ),
    );
  }
}
