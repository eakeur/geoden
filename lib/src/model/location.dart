import 'dart:convert';

class Location {
  final String state;
  final String city;
  final String region;

  const Location({
    required this.state, 
    required this.city, 
    required this.region,
  });

  Location copyWith({
    String? state,
    String? city,
    String? region,
  }) {
    return Location(
      state: state ?? this.state,
      city: city ?? this.city,
      region: region ?? this.region,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'state': state});
    result.addAll({'city': city});
    result.addAll({'region': region});
  
    return result;
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      state: map['state'] ?? '',
      city: map['city'] ?? '',
      region: map['region'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source));

  @override
  String toString() => 'Location(state: $state, city: $city, region: $region)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Location &&
      other.state == state &&
      other.city == city &&
      other.region == region;
  }

  @override
  int get hashCode => state.hashCode ^ city.hashCode ^ region.hashCode;
}
