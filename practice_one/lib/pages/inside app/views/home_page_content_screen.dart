import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practice_one/common/constraints/asset_svg_constraints.dart';
import 'package:practice_one/common/constraints/home_page_ui_constrant.dart';
import 'package:practice_one/common/constraints/ui_constrant.dart';
import 'package:practice_one/common/normal_btn.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/common/useful_methode.dart';
import 'package:practice_one/feature/normal%20provider/complain_providers.dart';
import 'package:practice_one/model/dummy%20data/complain_dummy_data.dart';

class HomePageContentScreen extends ConsumerStatefulWidget {
  const HomePageContentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomePageContentScreenState();
}

class _HomePageContentScreenState extends ConsumerState<HomePageContentScreen> {
// & ---------------------------------------------------------------------------------------------------------------------------
// ~--------------------------------Variables And Data--------------------------------------------------------
  late List<Map<String, dynamic>> complainLists;

// * -------------------------------------Methodes-------------------------------------------------------


  @override
  void initState() {
    super.initState();
    complainLists = ComplainDummyData.complainListsModified;
    final Map<String, dynamic> testMap = ComplainDummyData.infoList;
    // print(complainLists.length);

    Future.delayed(Duration.zero, () {
      ref.read(totalComplainProvider.notifier).state = testMap['total'];
      ref.read(progressingComplainProvider.notifier).state = testMap['progress'];
      ref.read(completeComplainProvider.notifier).state = testMap['complete'];
      ref.read(hearingComplainProvider.notifier).state = testMap['hearing'];

      // print(ref.read(totalComplainProvider));
    });
  }

// & ---------------------------------------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ref.watch(totalComplainProvider);

    return Scaffold(
      backgroundColor: ColorsClass.white,
      body: SingleChildScrollView(

        padding: const EdgeInsets.all(12),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - kToolbarHeight -  MediaQuery.of(context).padding.top,
            ),

          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ^ -------------------------------Complain Btn-----------------------------------------
            
                Center(
                  child: SizedBox(
                    width: size.width * 0.8,
                    child: CustomSqureBtn(
                        btnName: 'অভিযোগ দায়ের করুন',
                        foregroundColor: ColorsClass.white,
                        backgroundColor: ColorsClass.green,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        iconWidth: 15,
                        icon: SvgPicture.asset(
                          AssetSvgConstraints.formComplain,
                          colorFilter:
                              ColorFilter.mode(ColorsClass.white, BlendMode.srcIn),
                        ),
                        elevation: 3,
                        onPressed: () {}),
                  ),
                ),
            
                // ^ -------------------------------Complain Btn-----------------------------------------
            
                // ~ -----------------------------Complain Status-------------------------------------------
            
                SizedBox(
                  height: size.height * 0.02,
                ),
            
                Card(
                  elevation: 4,
                  color: ColorsClass.blueVeryLight,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    width: size.width * 0.9,
                    height: size.height * 0.32,
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'অভিযোগের ইতিবৃত্তান্ত',
                          style: formPageTextStyle(),
                        ),
                        Consumer(builder: (context, ref, child) {
                          {
                            return complainStatusRows(
                                size: size,
                                colorFirst: ColorsClass.blue,
                                textFirst:
                                    "মোট অভিযোগ\n${ref.watch(totalComplainProvider)} টি",
                                colorSecond: ColorsClass.green,
                                textSecond:
                                    "প্রক্রিয়াধীন\n${ref.watch(progressingComplainProvider)} টি");
                          }
                        }),
                        Consumer(builder: (context, ref, child) {
                          return complainStatusRows(
                              size: size,
                              colorFirst: ColorsClass.greayBrown,
                              textFirst:
                                  "নিষ্পত্তি\n${ref.watch(completeComplainProvider)}টি",
                              colorSecond: ColorsClass.orange,
                              textSecond:
                                  "শুনানি\n${ref.watch(hearingComplainProvider)} টি");
                        }),
                      ],
                    ),
                  ),
                ),
            
                // ~ -----------------------------Complain Status-------------------------------------------
            
                // ^ ----------------------------Recent Complains Section------------------------------------
                SizedBox(
                  height: size.height * 0.02,
                ),

                Center(
                  child: Text(
                    'সাম্প্রতিক অভিযোগ সমূহ',
                    style: formPageTextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: size.width * 0.02,
                ),

                (ref.read(totalComplainProvider) != 0) ?
                SizedBox(
                  height: size.height * 0.4,
                  
                  child: ListView.builder(
                    itemCount: complainLists.length,
                    itemBuilder: (context, index) {
                      return HomePageUiConstrant.cardListTileRecComplement(size: size, dataMap: complainLists, index: index);
                    }
                    ),
                ) :
            
                UIConstrant.emptyComplainCard(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
