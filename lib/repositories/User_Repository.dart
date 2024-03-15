import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:library_app/controllers/AuthController.dart';
import 'package:library_app/models/user_model.dart';

import '../constants.dart';

class User_Repository {



  Future<User> userUpdate(String username, String email, String password, String passwordConfirm) async {
    var authController = Get.find<AuthController>();
    String userId = authController.auth.isNotEmpty
        ? authController.auth[0].data?.id.toString() ?? ""
        : "";

    try {
      http.Response response = await http.put(
        Uri.parse(api_base+"api/profile/update/$userId"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(
          {
            "name": username,
            "email": email,
            "password": password,
            "password_confirmation": passwordConfirm,
          },
        ),
      );

    
      var jsonData = User.fromJson(jsonDecode(response.body));
        print(jsonData);

      return jsonData;
    } catch (e) {
      // يمكنك إضافة معالجة الأخطاء هنا
      throw e;
    }
  }


  userDelete(String user_id , String password) async {
    try{

      http.Response response = await http.post(
        Uri.parse(api_base+"api/profile/disable"),
        headers: <String, String>{
          "Content-Type" : "application/json",
          "Accept" : "application/json",
        },
        body: jsonEncode(
            {
              "id":user_id,
              "password":password
            }
        ),

      );

      var user = User.fromJson(jsonDecode(response.body));

      return user;

    }catch(e){

    }
  }


}




// Future<User> userUpdate(String username, String email, String password, String passwordConfirm) async {
//   var authController = Get.find<AuthController>();
//   String userId = authController.auth.isNotEmpty
//       ? authController.auth[0].data?.id.toString() ?? ""
//       : "";

//   try {
//     Map<String, dynamic> requestBody = {
//       "name": username,
//       "email": email,
//     };

//     if (password.isNotEmpty && passwordConfirm.isNotEmpty) {
//       requestBody["password"] = password;
//       requestBody["password_confirmation"] = passwordConfirm;
//     }

//     http.Response response = await http.put(
//       Uri.parse("http://10.0.2.2:8000/api/profile/update/$userId"),
//       headers: <String, String>{
//         "Content-Type": "application/json",
//         "Accept": "application/json",
//       },
//       body: jsonEncode(requestBody),
//     );

//     var jsonData = User.fromJson(jsonDecode(response.body));
//     print(jsonData);

//     return jsonData;
//   } catch (e) {
//     // يمكنك إضافة معالجة الأخطاء هنا
//     throw e;
//   }
// }