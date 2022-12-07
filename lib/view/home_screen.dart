import 'package:flutter/material.dart';
import 'package:university/model/university_model.dart';
import 'package:university/model/unversity_model_test.dart';
import 'package:university/service/university_http_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  UniversityHttpService universityHttpService = UniversityHttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<UniversityModel>>(
        future: universityHttpService.fetchUniversityList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data == null) {
            return const Center(
              child: Text("No data"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final university = snapshot.data![index];

              return ExpansionTile(title: Text(university.name));
            },
          );
        },
      ),
    );
  }
}
