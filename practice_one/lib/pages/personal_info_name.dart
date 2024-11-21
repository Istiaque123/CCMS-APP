import 'package:flutter/material.dart';
import 'package:practice_one/feature/common/hero_section.dart';
import 'package:practice_one/feature/common/keybord_input_section.dart';
import 'package:practice_one/feature/common/navigator.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/feature/common/useful_methode.dart';

class PersonalInfoName extends StatefulWidget {
  const PersonalInfoName({super.key});

  @override
  State<PersonalInfoName> createState() => _PersonalInfoNameState();
}

class _PersonalInfoNameState extends State<PersonalInfoName> {
  final _formKey = GlobalKey<FormState>();
  final nameTextEditingController = TextEditingController();
  final fatherNameTextEditingController = TextEditingController();
  final motherNameTextEditingController = TextEditingController();

  String? selectedGender;
  DateTime selectedDate = DateTime.now();
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


   OutlineInputBorder borderStyle(){
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.black
      ));
  }

  TextStyle textStyle(){
    return const TextStyle(
            fontFamily: 'Kalpurush',
            color: Colors.black,
            fontSize: 20
          );
  }
// **********************************************************************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
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
                    validator: (value) => validator(value, "আপনার নাম"),
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
                    validator: (value) => validator(value, "আপনার পিতার নাম"),
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
                    validator: (value) => validator(value, "আপনার মাতার নাম"),
                  ),
                ),
                const SizedBox(height: 20),
                // Gender and Date of Birth in Row
                SizedBox(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      
                      // Gender Dropdown
                      SizedBox(
                        width: 150,
                        height: 60,
                        child: DropdownButtonFormField<String>(
                          value: selectedGender,
                          
                          decoration: InputDecoration(
                              hintText: 'লিঙ্গ',
                              hintStyle: textStyle(),
                            
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle()
                        
                          ),
                        alignment: Alignment.center,
                          items: genders.map(
                            (gender) => DropdownMenuItem<String>(
                              value: gender,
                              child: Text(
                                gender,
                              style: textStyle(),)
                              )).toList(),
                          icon: const Icon(
                            Icons.arrow_downward_sharp,
                            ),
                            iconEnabledColor: Colors.green,

                          

                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                          validator: (value) => validator(value, 'লিঙ্গ নির্বাচন করুন'),
                        ),
                      ),



                      // Date of Birth Picker
                      SizedBox(
                        width: 220,
                        
                        child: TextFormField(
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                            contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                            hintText: 'জন্ম তারিখ',
                            label: RichText(
                              text: TextSpan(
                                text: 'জন্ম তারিখ',
                                style: textStyle(),
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
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today_sharp),
                              onPressed: () => _selectDate(context),
                            ),
                          ),
                          readOnly: true,
                          onTap: () => _selectDate(context),
                          validator: (value) =>
                              value == null || value.isEmpty ? 'তারিখ নির্বাচন করুন' : null,
                        ),
                      ),
                    ],
                  ),
                ),



                
                const SizedBox(height: 270),
                // Submit Button
                SizedBox(
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
                        // navigatePush(context, const PersonalInfoName());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
