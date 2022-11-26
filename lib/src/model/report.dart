import 'dart:convert';

import 'reporter.dart';
import 'location.dart';

class Report {
  final Reporter reporter;
  final Location location;

  const Report({
    required this.reporter,
    required this.location,
  });

  Report copyWith({
    Reporter? reporter,
    Location? location,
  }) {
    return Report(
      reporter: reporter ?? this.reporter,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'reporter': reporter.toMap()});
    result.addAll({'location': location.toMap()});
  
    return result;
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      reporter: Reporter.fromMap(map['reporter']),
      location: Location.fromMap(map['location']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) => Report.fromMap(json.decode(source));

  @override
  String toString() => 'Report(reporter: $reporter, location: $location)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Report &&
      other.reporter == reporter &&
      other.location == location;
  }

  @override
  int get hashCode => reporter.hashCode ^ location.hashCode;
}