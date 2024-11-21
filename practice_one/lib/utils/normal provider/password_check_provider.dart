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