import 'dart:convert';

// import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:library_app/models/auth.dart';


class Auth_Repository {

  login(String email , String password) async {
    try{

      http.Response response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/login"),
        headers: <String, String>{
          "Content-Type" : "application/json",
          "Accept" : "application/json",
        },
        body: jsonEncode(
            {
              "email": email,
              "password" : password,
            }
        ),

      );

      print(response.body.toString());
      var auth = Auth.fromJson(jsonDecode(response.body));
      

      return auth;
    }catch(e){

    }
  }
  

}
