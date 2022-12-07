import 'package:flutter/material.dart';
import 'package:university/model/university_model.dart';
import 'package:university/model/unversity_model_test.dart';
import 'package:university/service/university_http_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UniversityHttpService universityHttpService = UniversityHttpService();

  var items = [
    'iraq',
    'iran',
    'poland',
    'turkey',
    'germany',
    'italy',
    'spain',
    'egypt',
    'tunsia',
    'morroco',
    'qatar',
  ];

  String dropDownValue = 'iraq';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          DropdownButton(
            value: dropDownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropDownValue = newValue!;
              });
            },
          ),
          // DropdownButton(
          //     value: dropDownValue,
          //     hint: const Text("Select Country"),
          //     items: items
          //         .map((String item) => DropdownMenuItem(child: Text(item)))
          //         .toList(),
          //     onChanged: (String value) {
          //       setState(() {
          //         dropDownValue = value;
          //       });
          //     }),
          FutureBuilder<List<UniversityModel>>(
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
        ],
      ),
    );
  }
}
