import 'package:flutter/material.dart';
import 'package:practice_one/feature/common/keybord_input_section.dart';

validator(String? value, String msg) {
  if (value == null || value.isEmpty) {
    return msg;
  }
  return null;
}

OutlineInputBorder myBorderStyle() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 1, color: Colors.black));
}

TextStyle myTextStyle({double fontSize = 20}) {
  return TextStyle(
      fontFamily: 'Kalpurush', color: Colors.black, fontSize: fontSize);
}

TextStyle formPageTextStyle(
    {double fontSize = 18, fontWeight = FontWeight.w600}) {
  return TextStyle(
      fontFamily: 'NotoSerifBengali',
      fontSize: fontSize,
      fontWeight: fontWeight,
      wordSpacing: 2);
}

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


