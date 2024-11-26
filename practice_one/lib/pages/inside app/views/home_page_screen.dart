import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/feature/common/theme_colors.dart';
import 'package:practice_one/feature/common/dncrp_appbar_theme.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
// ^ --------------------------------------------------------------------------------
      appBar: DncrpAppbarTheme.buildAppBar(),
      backgroundColor: ColorsClass.white,
// ^ ---------------------------------- Body Section ----------------------------------------------

      body: Container(),

      //
    );
  }
}
