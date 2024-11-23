import 'package:flutter_riverpod/flutter_riverpod.dart';


const divisionsAndDistricts = {
  'Dhaka': ['Dhaka', 'Gazipur', 'Narayanganj', 'Tangail'],
  'Chittagong': ['Chittagong', 'Cox\'s Bazar', 'Rangamati', 'Khagrachari'],
  'Rajshahi': ['Rajshahi', 'Natore', 'Naogaon', 'Pabna'],
  'Khulna': ['Khulna', 'Satkhira', 'Jessore', 'Kushtia'],
  'Sylhet': ['Sylhet', 'Moulvibazar', 'Habiganj', 'Sunamganj'],
  'Barisal': ['Barisal', 'Bhola', 'Pirojpur', 'Jhalokati'],
  'Rangpur': ['Rangpur', 'Dinajpur', 'Gaibandha', 'Thakurgaon'],
  'Mymensingh': ['Mymensingh', 'Netrokona', 'Jamalpur', 'Sherpur'],
};

final divisionProvider = StateProvider<String?>((ref) => null);

final districtsProvider = StateProvider<List<String>>((ref) => []);
