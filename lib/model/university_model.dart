import 'dart:convert';

import 'package:flutter/foundation.dart';

class UniversityModel {
  final String alpha_two_code;
  final String name;
  final String country;

  UniversityModel({
    required this.alpha_two_code,
    required this.name,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'alpha_two_code': alpha_two_code,
      'name': name,
      'country': country,
    };
  }

  factory UniversityModel.fromMap(Map<String, dynamic> map) {
    return UniversityModel(
      alpha_two_code: map['alpha_two_code'] as String,
      name: map['name'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UniversityModel.fromJson(String source) =>
      UniversityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Universitymodel(alpha_two_code: $alpha_two_code, name: $name, country: $country)';
  }
}
