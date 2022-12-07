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

    return universityListModel;
  }
}
