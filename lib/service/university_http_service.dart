import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:university/model/university_model.dart';
// import 'package:university/model/unversity_model_test.dart';

class UniversityHttpService {
  //http://universities.hipolabs.com/search?country=iraq
  Uri uri = Uri(
      scheme: 'http',
      host: 'universities.hipolabs.com',
      path: 'search',
      queryParameters: {'country': 'iraq'});
  Future<UniversityModel> fetchUniversityList() async {
    http.Response response = await http.get(uri);

    UniversityModel universitymodel = UniversityModel.fromJson(response.body);

    // Post.fromJson(jsonDecode(response.body))

    // List jsonResponse = json.decode(response.body);
    // return jsonResponse
    //     .map((data) => UniversityModelTest.fromJson(data))
    //     .toList();

    // var streetsFromJson = parsedJson['streets'];
    // List<String> streetsList = new List<String>.from(streetsFromJson);

    return universitymodel;
  }
}
