import 'package:flutter/material.dart';

void navigateReplacement(BuildContext context, Widget widget){
  Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => widget), 
          );
}

void navigatePush(BuildContext context, Widget widget){
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => widget)
    );
}

void navigatePushUntillRoot(BuildContext context, Widget widget){
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => widget), 
    (route) => false,
    );
}