import 'dart:convert';

import 'package:intl/intl.dart';

class Reporter {
  final String cpf;
  final String fullName;
  final String email;
  final String birthDate;

  const Reporter({
    required this.cpf,
    required this.fullName,
    required this.email,
    required this.birthDate,
  });

  Reporter.fromDate({
    required this.cpf,
    required this.fullName,
    required this.email,
    required DateTime birthDate,
  }) : birthDate = DateFormat('yyyyMMdd').format(birthDate);

  Reporter copyWith({
    String? cpf,
    String? fullName,
    String? email,
    String? birthDate,
  }) {
    return Reporter(
      cpf: cpf ?? this.cpf,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'cpf': cpf});
    result.addAll({'fullName': fullName});
    result.addAll({'email': email});
    result.addAll({'birthDate': birthDate});
  
    return result;
  }

  factory Reporter.fromMap(Map<String, dynamic> map) {
    return Reporter(
      cpf: map['cpf'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      birthDate: map['birthDate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Reporter.fromJson(String source) => Reporter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Reporter(cpf: $cpf, fullName: $fullName, email: $email, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Reporter &&
      other.cpf == cpf &&
      other.fullName == fullName &&
      other.email == email &&
      other.birthDate == birthDate;
  }

  @override
  int get hashCode {
    return cpf.hashCode ^
      fullName.hashCode ^
      email.hashCode ^
      birthDate.hashCode;
  }

  static String? validateCPF(String? cpf) {
    if (cpf == null) {
      return "";
    }

    if (cpf.length != 11) {
      return "O CPF informado deve ter 11 caracteres";
    }

    return null;
  }
}
