import 'dart:async';
// import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/controllers/AuthController.dart';
// import 'package:http/http.dart' as http;
import 'package:library_app/models/user_model.dart';
import 'package:library_app/repositories/User_Repository.dart';
import 'package:library_app/screens/Login/login_screen.dart';
import 'package:library_app/screens/profile/profile_screen.dart';

import '../screens/main_tab/main_tab_view.dart';

class UserController extends GetxController {
  var userList = <User>[].obs;
  RxBool isLoading = false.obs;
  var repo = User_Repository();

  AuthController _authController = Get.find();
  void userUpdate(String username, String email, String password, String passwordConfirm) async {
    try {

      isLoading.value = true;
      

      var updatedUser = await repo.userUpdate(username, email, password, passwordConfirm);
      // ignore: unnecessary_null_comparison
      if (updatedUser != null) {

        // userList.add(updatedUser);
        userList.assignAll([updatedUser]);
        update();

        isLoading.value = false;

        _authController.auth[0].data!.name = username ;
        Get.snackbar("صح", "تم تعديل البيانات بنجاح",
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.to( MainTabView(2));
      } else {
        Get.snackbar("خطأ", "حدث خطأ أثناء تحديث البيانات",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      }

    } on TimeoutException catch (_) {
      // التعامل مع استثناء TimeoutException هنا
    } on SocketException catch (_) {
      // التعامل مع استثناء SocketException هنا
    } catch (e) {
      // التعامل مع الاستثناءات الأخرى هنا
    } finally {
      isLoading.value = false;
    }
  }

  void userDelete(String password) async {
     var authController = Get.find<AuthController>();
     String user_id = authController.auth.isNotEmpty
      ? authController.auth[0].data?.id.toString() ?? ""
      : "";

     userList.clear();
    var user = await repo.userDelete(user_id , password);
    try {
      if (user != null) {
        isLoading.value = true;
        userList.add(user);

        Get.to(const LoginScreen());

        Get.snackbar("صح", "تم الحذف  بنجاح", backgroundColor: Colors.green, colorText: Colors.white);
       
        
      }else {
        Get.snackbar("خطأ", "حدث خطأ أثناء حذف الحساب",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } finally {
      isLoading.value = false;
    }
  }
}