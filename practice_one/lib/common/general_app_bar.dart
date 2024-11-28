import 'package:flutter/material.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';

class GeneralAppBar {
  static AppBar buildAppBar() {
    return AppBar(
      backgroundColor: ColorsClass.white,
      foregroundColor: ColorsClass.green,
    );
  }
}
