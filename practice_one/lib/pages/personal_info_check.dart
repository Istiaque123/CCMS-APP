import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/feature/common/theme.dart';
import 'package:practice_one/feature/common/useful_methode.dart';

class PersonalInfoCheck extends ConsumerStatefulWidget {
  const PersonalInfoCheck({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PersonalInfoCheckState();
}

class _PersonalInfoCheckState extends ConsumerState<PersonalInfoCheck> {
  // ? -----------------------------------------------------------------------------
  String? name;
  File? image;
  bool? checkTik;
  final TextEditingController fatherTextEditingController =
      TextEditingController();
  final TextEditingController motherTextEditingController =
      TextEditingController();
  final TextEditingController birthDayTextEditingController =
      TextEditingController();
  final TextEditingController genderTextEditingController =
      TextEditingController();
  final TextEditingController idTextEditingController = TextEditingController();
  final TextEditingController districtTextEditingController =
      TextEditingController();
  final TextEditingController divisionTextEditingController =
      TextEditingController();
  final TextEditingController pastleCodeTextEditingController =
      TextEditingController();
  final TextEditingController professionTextEditingController =
      TextEditingController();

  // *****************************************************************************************
  @override
  void initState() {
    super.initState();

    name = 'আরাফাত ইসলাম';
    fatherTextEditingController.text = 'মোহাম্মদ শারাফাত ইসলাম';
    motherTextEditingController.text = 'আয়েশা খাতুন';
    birthDayTextEditingController.text = '7 Febuary 1996';
    genderTextEditingController.text = 'পুরুষ';
    districtTextEditingController.text = 'নারায়নগঞ্জ';
    divisionTextEditingController.text = 'ঢাকা';
    pastleCodeTextEditingController.text = '১৪১২';
    professionTextEditingController.text = 'চাকুরীজীবী';
    idTextEditingController.text = '9154999057';
    checkTik = false;
  }

  // ? ---------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorsClass.green,
        title: const Padding(
          padding:
              EdgeInsets.only(top: 20), // Add top padding for better alignment
          child: Text(
            'আপনার ব্যক্তিগত তথ্য যাচাই করুন',
            style: TextStyle(
              fontFamily: 'Kalpurush',
              fontSize: 24, // Adjust font size if needed
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 2, // Allows multiline text
            overflow: TextOverflow.ellipsis, // Prevents overflow issues
          ),
        ),
        centerTitle: true, // Keeps the title centered
        backgroundColor: Colors.white, // Optional: Adjust background color
      ),


      
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - kToolbarHeight -
              MediaQuery.of(context).padding.top, // Ensures the Stack is scrollable
          ),
          child: IntrinsicHeight(
            child: Stack(
              children: [
                // ! Main Section Start Here --------------------------------
                Positioned(
                    top: 0,
                    left: 0,
                    // right: 0,
                    child: SizedBox(
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // * Person Header
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  minRadius: 10,
                                  maxRadius: 30,
                                  backgroundColor: ColorsClass.white,
                                  backgroundImage:
                                      image != null ? FileImage(image!) : null,
                                  child: image == null
                                      ? Image.asset(
                                          'assets/images/profile.png',
                                          fit: BoxFit.contain,
                                        )
                                      : null,
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(name!, style: formPageTextStyle()),
                              ],
                            ),
                          ),
        
                          // ** Info section
                          const SizedBox(
                            height: 15,
                          ),
                          formInfoSection(
                              infoHeaterText: "পিতার নাম",
                              controller: fatherTextEditingController),
                          // const SizedBox(height: 2,),
                          formInfoSection(
                              infoHeaterText: 'মাতার নাম',
                              controller: motherTextEditingController),
                          // const SizedBox(height: 2,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 250,
                                child: formInfoSection(
                                    infoHeaterText: 'জন্মতারিখ',
                                    controller: birthDayTextEditingController),
                              ),
                              SizedBox(
                                width: 140,
                                child: formInfoSection(
                                    infoHeaterText: 'লিঙ্গ',
                                    controller: genderTextEditingController),
                              )
                            ],
                          ),
                          // const SizedBox(height: 2,),
                          formInfoSection(
                              infoHeaterText: 'NID',
                              controller: idTextEditingController),
                          // const SizedBox(height: 3,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 190,
                                child: formInfoSection(
                                    infoHeaterText: 'জেলা',
                                    controller: districtTextEditingController),
                              ),
                              SizedBox(
                                width: 190,
                                child: formInfoSection(
                                    infoHeaterText: 'বিভাগ',
                                    controller: divisionTextEditingController),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 190,
                                child: formInfoSection(
                                    infoHeaterText: 'পোস্টাল কোড',
                                    controller:
                                        pastleCodeTextEditingController),
                              ),
                              SizedBox(
                                width: 190,
                                child: formInfoSection(
                                    infoHeaterText: 'পেশা',
                                    controller:
                                        professionTextEditingController),
                              )
                            ],
                          ),
        
                          // ? ========================================= Check Btn Section ================================
                          Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align items to the top
                            children: [
                              // Checkbox
                              Checkbox(
                                value:
                                    checkTik, // Change this to a state variable (e.g., isChecked)
                                onChanged: (value) {
                                  setState(() {
                                    checkTik = value!;
                                  });
                                },
                              ),
        
                              // Condition text
                              Expanded(
                                // Ensures the text wraps to the next line
                                child: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'আমি ভোক্তা অধিকার সংরক্ষণ অধিদপ্তরের সকল আইনের উপর সম্মতি প্রদান করে আমার ব্যক্তিগত তথ্য প্রদান করলাম।',
                                      style: formPageTextStyle(
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      checkTik = !checkTik!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
        
                          // ** Info section
        
        // ? ------------------------------Btn Section ---------------------------------
                          const SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 180,
                                child: CustomSqureBtn(
                                    btnName: 'এডিট করুন', 
                                    onPressed: () {},
                                    borderSide: true,
                                    borderColor: ColorsClass.green,
                                    elevation: 3,
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    icon: const Icon(CupertinoIcons.arrow_left),
                                    ),
                              ),
                              SizedBox(
                                width: 180,
                                child: CustomSqureBtn(
                                    btnName: 'প্রোফাইল সম্পন্ন',
                                     onPressed: () {},
                                     foregroundColor: ColorsClass.white,
                                     backgroundColor: ColorsClass.green,
                                     elevation: 3,
                                     padding: const EdgeInsets.symmetric(vertical: 10)
                                     ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    )),
                // *! Main Section End Here --------------------------------
        
                //  ** Button Section
              ],
            ),
          ),
        ),
      ),
    );
  }
}
