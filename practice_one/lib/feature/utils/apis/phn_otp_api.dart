import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// !--------------------------Abstruct Class----------------------------------------
import 'package:fpdart/fpdart.dart';
import 'package:practice_one/feature/utils/constrains/phne_otp_constrains.dart';

abstract class IPhnOTPApi {
  Future<Either<String, String>> getOtpNum(String phnNum);
  Future<Either<String, String>> confirmOtp(String otp, String phnNum);
}

// ^------------------------Api Class Provider ------------------------------------
final otpApiProvider = StateProvider<PhnOtpApi>((ref) {
  return PhnOtpApi();
});

// !----------------------------Otp Api Create---------------------------------------
class PhnOtpApi implements IPhnOTPApi {
  // & _________Methode For Creating OTP________________________
  @override
  Future<Either<String, String>> getOtpNum(String phnNum) async {
    try {
      final response = await http
          .post(Uri.parse(PhneOtpUrl.phnOtpUrl), 
          body: {
            'phoneNumber': phnNum
            });

      if (response.statusCode == 202) {
        final Map<String, dynamic> resMap = jsonDecode(response.body);
        final Map<String, dynamic> dataMap = resMap['data'];
        return right('Otp is ${dataMap['otpCode']}');
      }

      return left('Error Creating Otp');
    } catch (e) {
      return left('Error creating Otp : ${e.toString()}');
    }
  }

// &__________________Methode For Confirm Otp_________________________
  @override
  Future<Either<String, String>> confirmOtp(String otp, String phnNum) async {
    try {
      final response = await http.post(Uri.parse(PhneOtpUrl.otpConUrl),
          headers: {
            "Content-Type": "application/json",
          },
          
          body: jsonEncode({
            "otpCode": int.parse(otp), 
            "phoneNumber": phnNum
            }) 
        );
      if (response.statusCode == 202) {
        final Map<String, dynamic> resMap = jsonDecode(response.body);


        if (!resMap['error']) {
          return right(resMap['error'].toString());
        }
      }

      return left('Otp is wrong!!');
    } catch (e) {
      return left('Otp Is Wrong : ${e.toString()}');
    }
  }
}
