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
      queryParameters: {'country': 'greece'});
  Future<List<UniversityModel>> fetchUniversityList() async {
    http.Response response = await http.get(uri);

    List result = json.decode(response.body) as List;
    List<UniversityModel> universityListModel =
        result.map((e) => UniversityModel.fromMap(e)).toList();

    // Map result = json.decode(response.body) as Map;
    // List listResult = result["data"] as List;
    // List<UniversityModel> universityListModel =
    //     listResult.map((e) => UniversityModel.fromMap(e)).toList();

    // Post.fromJson(jsonDecode(response.body))

    // List jsonResponse = json.decode(response.body);
    // return jsonResponse
    //     .map((data) => UniversityModelTest.fromJson(data))
    //     .toList();

    // var streetsFromJson = parsedJson['streets'];
    // List<String> streetsList = new List<String>.from(streetsFromJson);

    return universityListModel;
  }
}
