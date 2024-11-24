import 'dart:convert';

class DivisionAddress {
  final String division;
  final String divisionBn;

  DivisionAddress({
    required this.division,
    required this.divisionBn,
  });

  DivisionAddress copyWith({
    String? division,
    String? divisionBn,
  }) {
    return DivisionAddress(
      division: division ?? this.division,
      divisionBn: divisionBn ?? this.divisionBn,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'division': division});
    result.addAll({'divisionbn': divisionBn});
  
    return result;
  }

  factory DivisionAddress.fromMap(Map<String, dynamic> map) {
    return DivisionAddress(
      division: map['division'] ?? '',
      divisionBn: map['divisionbn'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DivisionAddress.fromJson(String source) => DivisionAddress.fromMap(json.decode(source));

  @override
  String toString() => 'DivisionAddress(division: $division, divisionbn: $divisionBn)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DivisionAddress &&
      other.division == division &&
      other.divisionBn == divisionBn;
  }

  @override
  int get hashCode => division.hashCode ^ divisionBn.hashCode;
}
