import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_one/feature/common/hero_section.dart';
import 'package:practice_one/feature/common/navigator.dart';
import 'package:practice_one/feature/common/normal_btn.dart';
import 'package:practice_one/feature/common/theme.dart';
import 'package:practice_one/pages/personal_info_check.dart';

class ProfileImgTakeScreen extends ConsumerStatefulWidget {
  const  ProfileImgTakeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ProfileImgTakeScreenState();
}

class ProfileImgTakeScreenState extends ConsumerState<ProfileImgTakeScreen> {
  final _formKey = GlobalKey<FormState>();

// * * --------------------------------------------------------------------------------------

  File? image;
  XFile? _pickedImg;

  // Methode for gallary Image
  Future<void> _pickedImgFromGallary() async {
    try {
      _pickedImg = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (kDebugMode) {
        print(_pickedImg.runtimeType);
      }

      setImage(_pickedImg);
    } catch (e) {
      if (kDebugMode) {
        print('Error picking img: $e');
      }
    }
  }

  // Methode for Camera Image
  Future<void> _pickedImgFromCamera() async {
    try {
      _pickedImg = await ImagePicker().pickImage(source: ImageSource.camera);

      setImage(_pickedImg);
    } catch (e) {
      if (kDebugMode) {
        print('Error picking img: $e');
      }
    }
  }

  // Methode for set image

  void setImage(final pickedImg) {
    if (pickedImg != null) {
      setState(() {
        image = File(pickedImg.path);
      });
    } else {
      if (kDebugMode) {
        print('No Image Selected');
      }
    }
  }

// * * --------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
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
                      heroMsg: 'প্রোফাইলের ছবি যোগ করুন',
                      msgWeight: 250,
                    )),

// ! -------------------------------------------- Img Section -------------------------------------------------------------------
                Positioned(
                    left: 5,
                    right: 5,
                    top: 150,
                    child: CircleAvatar(
                      minRadius: 50,
                      maxRadius: 80,
                      backgroundColor: ColorsClass.white,
                      backgroundImage: image != null ? FileImage(image!) : null,
                      child: image == null
                          ? Image.asset(
                              'assets/images/profile.png',
                              fit: BoxFit.contain,
                            )
                          : null,
                    )),

                Positioned(
                  top: 350, // Adjust this based on your design
                  left: 5,
                  right: 5,
                  child: SizedBox(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 190,
                            // height: 80,
                            child: CustomSqureBtn(
                              btnName: 'ছবি তুলুন',
                              foregroundColor: ColorsClass.black,
                              backgroundColor: ColorsClass.white,
                              // minimumSize: const Size(double.infinity, 0),
                              elevation: 5,
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              borderSide: true,
                              onPressed: _pickedImgFromCamera,
                            ),
                          ),
                          SizedBox(
                            width: 190,
                            // height: 80,
                            child: CustomSqureBtn(
                              btnName: 'আপলোড',
                              foregroundColor: ColorsClass.white,
                              backgroundColor: ColorsClass.green,
                              // minimumSize: const Size(double.infinity, 0),
                              elevation: 5,
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              borderSide: false,
                              onPressed: _pickedImgFromGallary,
                            ),
                          ),
                        ],
                      )),
                ),

// ! -------------------------------------------- Img Section -------------------------------------------------------------------
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

                        if (image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(
                            content: Text(
                              'দয়া করে একটি প্রোফাইল ছবি যোগ করুন',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(bottom: 100, left: 16, right: 16),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                        }


                        if (_formKey.currentState?.validate() ?? false) {
                          // Perform action (e.g., navigate to another page)

                          navigatePush(context, const PersonalInfoCheck());
                          return;
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
