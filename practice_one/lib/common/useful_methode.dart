import 'package:flutter/material.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/common/keybord_input_section.dart';

// !---------------------------------------------------------------------------------------

validator(String? value, String msg) {
  if (value == null || value.isEmpty) {
    return msg;
  }
  return null;
}

// !----------------------------------Phone Number check-----------------------------------

bool isValidBDPhoneNumber(String phoneNumber) {
  final RegExp bdPhoneRegExp = RegExp(r'^(?:\+8801|01)[3-9]\d{8}$');
  return bdPhoneRegExp.hasMatch(phoneNumber);
}


validatorPhnNum(String? value, String msg) {
  
  if (!isValidBDPhoneNumber(value!)) {
    return msg;
  }
  return null;
}

// !---------------------------------------------------------------------------------------

OutlineInputBorder myBorderStyle() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 1, color: Colors.black));
}

// !---------------------------------------------------------------------------------------

TextStyle myTextStyle({double fontSize = 20}) {
  return TextStyle(
      fontFamily: 'Kalpurush', color: Colors.black, fontSize: fontSize);
}

// !---------------------------------------------------------------------------------------

TextStyle formPageTextStyle(
    {
      double fontSize = 18, 
      fontWeight = FontWeight.w600, 
      Color color = Colors.black,
      String fontFamily = 'NotoSerifBengali'
      }) {
  return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      wordSpacing: 2,
      color: color
      
      );
}

// !---------------------------------------------------------------------------------------

Widget formInfoSection({
  required String infoHeaterText,
  required TextEditingController controller,
  double textFieldHeight = 60
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        infoHeaterText,
        style: formPageTextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
          height: textFieldHeight,
          child: FormCheckTextFeild(
            controller: controller,
            readOnly: true,
          )),
    ],
  );
}

// !--------------------------------------------------------------------------------------------------
Widget complainStatusRows({required Size size, required Color colorFirst, required String textFirst, required Color colorSecond, required String textSecond}){
  return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: size.height/ 9,
                          width: size.width * 0.35,
                          decoration: BoxDecoration(
                            color: colorFirst,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text(
                              textFirst,
                              style: formPageTextStyle(color: ColorsClass.white),
                              softWrap: true,
                              textAlign: TextAlign.center,
                              maxLines: null,
                              
                            ),
                          ),
                        ),
                        Container(
                          height: size.height/ 9,
                          width: size.width * 0.35,
                          decoration: BoxDecoration(
                            color: colorSecond,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text(
                              textSecond,
                              style: formPageTextStyle(color: ColorsClass.white),
                              softWrap: true,
                              textAlign: TextAlign.center,
                              maxLines: null,
                              
                            ),
                          ),
                        ),
                      ],
                    );
}


