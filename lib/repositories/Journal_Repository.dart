import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:library_app/models/journal_model.dart';

import '../constants.dart';

class JournalRepository {

  
  static getJournal() async {
    var response = await http.get(
      Uri.parse(api_base+"api/Journals"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

      // print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return JournalModels.journalModelsFromJson(jsonData);
    } else {
      throw Exception('Failed to fetch Journals');
    }
  }


}