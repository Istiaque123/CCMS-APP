import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:practice_one/feature/utils/constrains/log_reg_api_constrains.dart';

// !---------------------Abstruct Class-----------------------------
abstract class IRegLogApi {
  Future<Either<String, String>> complinerRegtistration(
      {required String username, required String password});
}

// !-----------------------Log Reg Api------------------------------
class RegLogApi implements IRegLogApi {
  @override
  Future<Either<String, String>> complinerRegtistration(
      {required String username, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse(LogRegApiConstrains.comRegUrl),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(
            {
              "password": password, 
              "username": username
            }
          ));

          if (response.statusCode == 201) {
            final Map<String, dynamic> resData = jsonDecode(response.body);
            return right('successfully');
          }

      return left('Username has already been used');
    } catch (e) {
      return left('Invlide User ${e.toString()}');
    }
  }
}


// ^------------------------Api Provider----------------------------
final logRegApiProvider = StateProvider<RegLogApi>((ref) {
  return RegLogApi();
});
