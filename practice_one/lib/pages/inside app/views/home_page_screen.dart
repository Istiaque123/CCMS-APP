import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/common/constraints/ui_constrant.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageScreenState();
}
 
class _HomePageScreenState extends ConsumerState<HomePageScreen> {

  late int _pageIndex;



// * --------------------------------------------------------------------------------
  @override
  void initState() {
    _pageIndex = 2;
    super.initState();
  }


  void _onItemTaped(int index){

    setState(() {
      _pageIndex = index;
      
    });
  }
// * --------------------------------------------------------------------------------



  @override
  Widget build(BuildContext context) {
    return Scaffold(
// ^ --------------------------------------------------------------------------------
      appBar: UIConstrant.buildAppBar(),
      backgroundColor: ColorsClass.white,
// ^ ---------------------------------- Body Section ----------------------------------------------

      body: IndexedStack(
        index: _pageIndex,
        children: UIConstrant.bottomTabBarPages,
      ),

// ^ ---------------------------------- Body Section ----------------------------------------------

// & ----------------------------- Bottom Navigation Section --------------------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsClass.appBarColor,
        selectedItemColor: ColorsClass.greenDark,
        unselectedItemColor: ColorsClass.greenLight,
        iconSize: 35,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

        currentIndex: _pageIndex,
        onTap: _onItemTaped,
        
        
        type: BottomNavigationBarType.fixed,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news), 
            label: 'তালিকা'
            ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_crop_circle), 
            label: 'প্রোফাইল'),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home), 
            label: 'হোম'),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell), 
            label: 'নোটিফিকেশন'),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings), 
            label: 'সেটিংস'),
          
        ]
      ),
      //
    );
  }
}
