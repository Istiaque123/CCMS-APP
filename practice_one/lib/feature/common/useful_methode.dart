import 'package:flutter/material.dart';

validator(String? value, String msg) {
  
  if (value == null || value.isEmpty) {
    return msg;
  }
  return null;
}

OutlineInputBorder myBorderStyle(){
    return const OutlineInputBorder(
      
      borderRadius: BorderRadius.all(Radius.circular(10)),
      
      borderSide: BorderSide(
        width: 1,
        color: Colors.black
      ));
  }

  TextStyle myTextStyle(){
    return const TextStyle(
            fontFamily: 'Kalpurush',
            color: Colors.black,
            fontSize: 20
          );
  }