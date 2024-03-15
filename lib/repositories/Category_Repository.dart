import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:library_app/models/category_model.dart';

import '../constants.dart';

class CategoryRepository {
  static getCategory() async {
    var response = await http.get(
      Uri.parse(api_base+"api/category"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    // print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return CategoryModels.categoryModelsFromJson(jsonData);
    } else {
      throw Exception('Failed to fetch book');
    }
  }


  
}

