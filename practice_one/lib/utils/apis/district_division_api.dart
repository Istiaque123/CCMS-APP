import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:practice_one/model/distirct_address.dart';
import 'package:practice_one/model/division_address.dart';
import 'package:http/http.dart' as http;
import 'package:practice_one/utils/apis/base_api.dart';

// ------------------------------------------
final districtDevisionApiProvider = StateProvider<DistrictDivisionAPI>((ref) {
  return DistrictDivisionAPI();
});

final divisionNameProvider = StateProvider<String>((ref) {
  
  return '';
});

// ____________________________________________________

// ---------------------------------------------------------------------
abstract class IDistrictDivisionApi {
  Future<Either<String, List<DivisionAddress>>> fetchDivision();
  
  Future<Either<String, List<DistirctAddress>>> fetchDistrict(
      String divisionName);
}

// ----------------------------------------------------------------------

class DistrictDivisionAPI implements IDistrictDivisionApi {
  @override
  Future<Either<String, List<DivisionAddress>>> fetchDivision() async {
    try {


      final response =
          await http.get(Uri.parse('$districtDibisionBaseUrl/divisions'));


      if (response.statusCode == 200) {

        final Map<String, dynamic> responseJson = jsonDecode(response.body);

        final List<dynamic> data = responseJson['data'];

        List<DivisionAddress> divisions =
            data.map((json) => DivisionAddress.fromMap(json)).toList();

        return right(divisions);
      } else {

        return left('Error');
      }
    } catch (e) {

      return left('Error');
    }
  }

  @override
  Future<Either<String, List<DistirctAddress>>> fetchDistrict(
      String divisionName) async {
    try {
      final response = await http
          .get(Uri.parse('$districtDibisionBaseUrl/division/$divisionName'));

      print(response.statusCode);

      if (response.statusCode == 200) {
        // print(jsonDecode(response.body));

        final Map<String,dynamic> responseJson = jsonDecode(response.body);

        final List<dynamic> data = responseJson['data'];

        List<DistirctAddress> distirct =
            data.map((json) => DistirctAddress.fromMap(json)).toList();

        return right(distirct);
      } else {
        return left('Error left');
      }
    } catch (e) {
      return left("Eroor : ${e.toString()}");
    }
  }
}
