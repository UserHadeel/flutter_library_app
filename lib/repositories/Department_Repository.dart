import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:library_app/models/department_model.dart';

class DepartmentRepository {
  static getDepartment() async {
    var response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/department"),
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

