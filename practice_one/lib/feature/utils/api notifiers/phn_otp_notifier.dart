import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/feature/utils/apis/phn_otp_api.dart';


// !-----------------------------Create NotifierClass-----------------------------
class PhnOtpNotifier extends StateNotifier<String> {
  final PhnOtpApi _api;
  PhnOtpNotifier({required PhnOtpApi api})
  :_api = api,
   super('');
  
  // ^--------------Fetch Otp-------------------
  Future<String> fetchOtp(String phnNum) async{
    final result = await _api.getOtpNum(phnNum);
   return result.match(
    (left) {
      // print(left);
      return 'Error Creating Otp $left';
    }, 
    (right){
      // print(right);
      return right;
    }
    );
  }

// ^--------------------Confirm Otp-------------------------
  Future<String> fetchConfirmOtp(String otp, String phnNum) async{
    final result = await _api.confirmOtp(otp, phnNum);
    return result.match(
      (left) {
        // print(left);
        return left;
      }, 
      (right) {

        // print(right);
        return right;
      }
      );
  }
}

// &----------------Phn Otp Notifier Provier--------------------------------------

final phnOtpNotifierProvider = StateNotifierProvider<PhnOtpNotifier, String>((ref) {
  final api = ref.read(otpApiProvider);
  return PhnOtpNotifier(api: api);
});