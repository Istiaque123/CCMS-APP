import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeStremProvider = StreamProvider<double>((ref) {
  return getTime();
});

Stream<double> getTime(){
  return Stream<double>.periodic(
    const Duration(seconds: 1),
    (count) => 2.00 - count * 0.0167
  ).takeWhile((time) => time > 0);
}

final phoneNumProvider = StateProvider<String>((ref) {
  return '';
});