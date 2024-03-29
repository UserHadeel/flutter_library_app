import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:library_app/models/book_model.dart';

import '../constants.dart';

class BookRepository {

  
  static getBook() async {
    var response = await http.get(
      Uri.parse(api_base+"api/book"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

      // print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return BookModels.bookModelsFromJson(jsonData);
    } else {
      throw Exception('Failed to fetch book');
    }
  }



  static getBooksByCategory(String catName) async {
  var response = await http.get(
    Uri.parse(api_base+"api/book/$catName"),
    headers: <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    var jsonData = response.body;
    print(jsonData);
    return BookModels.bookModelsFromJson(jsonData);
  } else {
    throw Exception('Failed to fetch books by category');
  }
}

}

