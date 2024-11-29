import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/feature/utils/apis/reg_log_api.dart';




// !----------------------Log Reg Notifier-------------------
class LogRegNotifier extends StateNotifier<String> {
  
  final RegLogApi _api;
  LogRegNotifier({required RegLogApi api}):
  _api = api,
  super('');

// ^-----------------Complete Compliner Reg----------------------------
  Future<String> complinerRegtistrationStatus({required String username, required String password}) async{
    final result = await _api.complinerRegtistration(username: username, password: password);

    return result.match(
      (failedValue) => failedValue, 
      (successValue) => successValue
      );
  }
  
}

// &--------------Log Reg NotifierProvider-------------------
final logRegNotifierProvider = StateNotifierProvider<LogRegNotifier, String>((ref) {
  final api = ref.read(logRegApiProvider);
  return LogRegNotifier(api: api);
});

