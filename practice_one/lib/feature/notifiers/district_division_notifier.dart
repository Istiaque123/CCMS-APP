import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_one/model/distirct_address.dart';
import 'package:practice_one/model/division_address.dart';
import 'package:practice_one/feature/utils/apis/district_division_api.dart';



//--------------------------------------------------------------
final divisionNotifierProvider = StateNotifierProvider<DivisionNotifier, List<DivisionAddress>>((ref) {
  final api = ref.read(districtDevisionApiProvider);
  return DivisionNotifier(api: api);
});

final districtNotifierProvider = StateNotifierProvider<DistrictNotifier, List<DistirctAddress>>((ref) {
  final api = ref.read(districtDevisionApiProvider);
  return DistrictNotifier(api: api);
});

// ----------------------------------------------------------------------------------------------------



class DivisionNotifier extends StateNotifier<List<DivisionAddress>> {
  final DistrictDivisionAPI _api;

  DivisionNotifier({required DistrictDivisionAPI api})
      : _api = api,
        super([]);

  Future<void> fetchDivisionData() async {

    final result = await _api.fetchDivision();


    result.match(
      (failure) {
        if (kDebugMode) {
          print("Error fetching divisions: $failure");
        }
      },
      (divisions) {
        state = divisions;  // Update the state after fetching divisions
      },
    );
  }
}

// ______________________________________________________________________________

class DistrictNotifier extends StateNotifier<List<DistirctAddress>> {
  final DistrictDivisionAPI _api;

  DistrictNotifier({required DistrictDivisionAPI api})
      : _api = api,
        super([]);

  Future<void> fetchDistrictData(String divisionName) async {

    final result = await _api.fetchDistrict(divisionName);

    result.match(
      (failure) {
        if (kDebugMode) {
          print("Error fetching districts: $failure");
        }
      },
      (districts) {
        state = districts;  // Update the state with districts
      },
    );
  }
}

