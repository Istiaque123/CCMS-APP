import 'package:flutter_riverpod/flutter_riverpod.dart';

final totalComplainProvider = StateProvider<int>((ref) {
  return 0;
});
final progressingComplainProvider = StateProvider<int>((ref) {
  return 0;
});
final completeComplainProvider = StateProvider<int>((ref) {
  return 0;
});
final hearingComplainProvider = StateProvider<int>((ref) {
  return 0;
});
