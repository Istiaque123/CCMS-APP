import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordStateNotifier extends StateNotifier<double> {
  PasswordStateNotifier(): super(200);

  void updateHeight(String firstValue, String secondValue){
    if (firstValue.isEmpty && secondValue.isEmpty) {
      state = 160;
    } else if (firstValue.isEmpty || secondValue.isEmpty) {
      state = 180;
    } else {
      state = 200;
    }
  }
  
}

final passwordCheckProvider = StateNotifierProvider<PasswordStateNotifier, double>((ref) {
  return PasswordStateNotifier();
});

//----------------------------------------------------------------------------------------------∏
// class NamesStateNotifier extends StateNotifier<double> {
//   NamesStateNotifier(): super(270);

//   void updateHeight(String name, String father, String mother, String gender, String date){
//     List<String>? names = [name, father, mother, gender, date];
//     int count = 0;
//     for (String value in names) {
//       print(value);
//       if (value.isEmpty) {
//         count++;
//       }
//     }
//     print('count is: $count');
    
//      if(count >= 4){
//       state = 210;
//     }
//     else if(count == 3){
//       state = 230;
    
//     }else if(count == 2){
//       state = 230;
//     }else if(count == 1){
//       state = 250;
//     }else{
//       state = 270;
//     }
//   }
// }

// final namesPageProvider = StateNotifierProvider<NamesStateNotifier, double>((ref) {
//   return NamesStateNotifier();
// });