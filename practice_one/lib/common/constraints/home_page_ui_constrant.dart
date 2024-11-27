import 'package:flutter/material.dart';
import 'package:practice_one/common/constraints/theme_colors.dart';
import 'package:practice_one/common/useful_methode.dart';

// * ----------------------------------------------------------------------------------------------
class HomePageUiConstrant {
  // !--------------------------------Row of Card--------------------------------------------------
  static Widget rowOfCard(
      {required String keyString, required String valueString}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          keyString,
          style: formPageTextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          valueString,
          style: formPageTextStyle(
              // fontFamily: 'Kalpurush',
              fontSize: 16,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  // !-------------------------------------Row of Card Complains----------------------------------------------

  static Widget rowOfCardComplainStatus(
      {required String keyString,
      required String valueString,
      required Size size}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          keyString,
          style: formPageTextStyle(fontWeight: FontWeight.w500),
        ),
        statusBox(
          size: size,
          text: (valueString == 'hearing') ? 'progress' : valueString,
          color: (valueString == 'pending')
              ? ColorsClass.orange
              : ((valueString == 'progress' || valueString == 'hearing')
                  ? ColorsClass.greenDark
                  : ColorsClass.black),
        ),
      ],
    );
  }

  static Widget statusBox({
    required Size size,
    required String text,
    required Color color,
  }) {
    return Container(
        width: size.width * 0.3,
        height: size.height * 0.04,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.02),
            border: Border.all(
              width: 1,
              color: color,
            )),
        child: Center(
            child: Text(
          text,
          style: formPageTextStyle(
              fontSize: 16, color: color, fontWeight: FontWeight.w500),
        )));
  }


  // !----------------------------------------Recent Complain List---------------------------------------------------------
  static Widget cardListTileRecComplement({
    required Size size,
    required List<Map<String, dynamic>> dataMap,
    required int index,
    
  }) {
    final bool pending = dataMap[index]['pending'] ?? false;
    final bool complete = dataMap[index]['complete'] ?? false;
    bool isExpansionTile = dataMap[index]['hearing'] ?? false;

    return Card(
      elevation: 3,
      color: ColorsClass.blueVeryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: size.height * 0.25,
        padding: EdgeInsets.all(size.width * 0.04),
        child: isExpansionTile
            ? ExpansionTile(
              showTrailingIcon: false,
              maintainState: true,
                title: _cardContent(
                  size: size,
                  dataMap: dataMap,
                  index: index,
                  pending: pending,
                  complete: complete,
                ),
              )
            : ListTile(
                title: _cardContent(
                  size: size,
                  dataMap: dataMap,
                  index: index,
                  pending: pending,
                  complete: complete,
                ),
              ),
      ),
    );
  }

// **********************************************************************
  static Widget _cardContent({
    required Size size,
    required List<Map<String, dynamic>> dataMap,
    required int index,
    required bool pending,
    required bool complete,
  }) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomePageUiConstrant.rowOfCard(
            keyString: 'ট্র্যাকিং নাম্বারঃ',
            valueString: '${dataMap[index]['ট্র্যাকিং নাম্বারঃ']}',
          ),
          HomePageUiConstrant.rowOfCard(
            keyString: 'দায়েরের তারিখঃ',
            valueString: '${dataMap[index]['দায়েরের তারিখঃ']}',
          ),
          HomePageUiConstrant.rowOfCard(
            keyString: 'অভিযোগকারীর নামঃ',
            valueString: '${dataMap[index]['অভিযোগকারীর নামঃ']}',
          ),
          HomePageUiConstrant.rowOfCard(
            keyString: 'অভিযুক্ত প্রতিষ্ঠানঃ',
            valueString: '${dataMap[index]['অভিযুক্ত প্রতিষ্ঠানঃ']}',
          ),
          HomePageUiConstrant.rowOfCardComplainStatus(
            keyString: 'অভিযোগের অবস্থাঃ',
            size: size,
            valueString: pending
                ? 'pending'
                : complete
                    ? 'complete'
                    : 'progress',
          ),
        ],
      ),
    );
  }
}
  // !----------------------------------------Recent Complain List---------------------------------------------------------
