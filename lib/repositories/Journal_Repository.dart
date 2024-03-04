import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:library_app/models/journal_model.dart';

class JournalRepository {

  
  static getJournal() async {
    var response = await http.get(
      Uri.parse("http://10.0.2.2:8000/api/Journals"),
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