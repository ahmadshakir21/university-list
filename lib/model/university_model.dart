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

  // List<UniversityModel> fromJson(String source) {
  //   List result = json.decode(source) as List<Map<String, dynamic>>;
  //   List<UniversityModel> universities =
  //       result.map((e) => UniversityModel.fromMap(e)).toList();
  //   return universities;
  // }

  @override
  String toString() {
    return 'Universitymodel(alpha_two_code: $alpha_two_code, name: $name, country: $country)';
  }
}
