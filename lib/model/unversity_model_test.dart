// // To parse this JSON data, do
// //
// //     final universityModel = universityModelFromMap(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<UniversityModel> universityModelFromMap(String str) =>
//     List<UniversityModel>.from(
//         json.decode(str).map((x) => UniversityModel.fromMap(x)));

// String universityModelToMap(List<UniversityModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

// class UniversityModel {
//   UniversityModel({
//     required this.alphaTwoCode,
//     required this.name,
//     required this.country,
//     required this.webPages,
//     // required this.stateProvince,
//     // required this.domains,
//   });

//   String alphaTwoCode;
//   String name;
//   String country;
//   List<String> webPages;
//   // dynamic stateProvince;
//   // List<String> domains;

//   factory UniversityModel.fromMap(Map<String, dynamic> json) => UniversityModel(
//         alphaTwoCode: json["alpha_two_code"],
//         name: json["name"],
//         country: json["country"],
//         webPages: List<String>.from(json["web_pages"].map((x) => x)),
//         // stateProvince: json["state-province"],
//         // domains: List<String>.from(json["domains"].map((x) => x)),
//       );

//   Map<String, dynamic> toMap() => {
//         "alpha_two_code": alphaTwoCode,
//         "name": name,
//         "country": country,
//         "web_pages": List<dynamic>.from(webPages.map((x) => x)),
//         // "state-province": stateProvince,
//         // "domains": List<dynamic>.from(domains.map((x) => x)),
//       };
// }

// // enum AlphaTwoCode { IQ }

// // final alphaTwoCodeValues = EnumValues({
// //     "IQ": AlphaTwoCode.IQ
// // });

// // enum Country { IRAQ }

// // final countryValues = EnumValues({
// //     "Iraq": Country.IRAQ
// // });

// // class EnumValues<T> {
// //     Map<String, T> map;
// //     Map<T, String> reverseMap;

// //     EnumValues(this.map);

// //     Map<T, String> get reverse {
// //         if (reverseMap == null) {
// //             reverseMap = map.map((k, v) => new MapEntry(v, k));
// //         }
// //         return reverseMap;
// //     }
// // }
