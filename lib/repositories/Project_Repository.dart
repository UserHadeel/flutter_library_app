import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:library_app/models/project_model.dart';

import '../constants.dart';

class ProjectRepository {

  
  static getProject() async {
    var response = await http.get(
      Uri.parse(api_base+"api/project"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

      // print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return ProjectModels.projectModelsFromJson(jsonData);
    } else {
      throw Exception('Failed to fetch projects');
    }
  }



  static getProjectByDepartment(String depName) async {
  var response = await http.get(
  Uri.parse(api_base+"api/project/$depName"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    var jsonData = response.body;
    return ProjectModels.projectModelsFromJson(jsonData);
  } else {
    throw Exception('Failed to fetch project by department');
  }
}

}

