import 'dart:convert';

class DistirctAddress {
  final String district;
  final String districtBn;
  DistirctAddress({
    required this.district,
    required this.districtBn,
  });

  DistirctAddress copyWith({
    String? district,
    String? districtBn,
  }) {
    return DistirctAddress(
      district: district ?? this.district,
      districtBn: districtBn ?? this.districtBn,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'district': district});
    result.addAll({'districtbn': districtBn});
  
    return result;
  }

  factory DistirctAddress.fromMap(Map<String, dynamic> map) {
    return DistirctAddress(
      district: map['district'] ?? '',
      districtBn: map['districtbn'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DistirctAddress.fromJson(String source) => DistirctAddress.fromMap(json.decode(source));

  @override
  String toString() => 'DistirctAddress(district: $district, districtbn: $districtBn)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DistirctAddress &&
      other.district == district &&
      other.districtBn == districtBn;
  }

  @override
  int get hashCode => district.hashCode ^ districtBn.hashCode;
}
