import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:library_app/models/department_model.dart';

import '../constants.dart';

class DepartmentRepository {
  static getDepartment() async {
    var response = await http.get(
      Uri.parse(api_base+"api/department"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return DepartmentModels.departmentModelsFromJson(jsonData);
    } else {
      throw Exception('Failed to fetch book');
    }
  }


  
}

