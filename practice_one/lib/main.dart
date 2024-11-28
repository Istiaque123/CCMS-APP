import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/common/constraints/media_size_pad.dart';
import 'package:practice_one/pages/address_screen.dart';
import 'package:practice_one/pages/inside%20app/views/home_page_screen.dart';
import 'package:practice_one/pages/log_reg_select_screen.dart';
import 'package:practice_one/pages/opt_reg_screen.dart';
import 'package:practice_one/pages/password_create_screen.dart';
import 'package:practice_one/pages/personal_info_check.dart';
import 'package:practice_one/pages/personal_info_id_scrren.dart';
import 'package:practice_one/pages/personal_info_name_screen.dart';
import 'package:practice_one/pages/phone_num_reg_screen.dart';
import 'package:practice_one/pages/profession_screen.dart';
import 'package:practice_one/pages/profile_img_take_screen.dart';



import 'package:practice_one/pages/spalash_screen.dart';

void main() {
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

// Commit check
  // This widget is the root of your application. check
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        screenSizeProvider.overrideWithValue(MediaQuery.of(context).size)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const OptRegScreen()
      ),
    );
  }
}
