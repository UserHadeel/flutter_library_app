import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:library_app/models/auth.dart';
import 'package:library_app/repositories/Auth_Repository.dart';
import 'package:library_app/screens/main_tab/main_tab_view.dart';

class AuthController extends GetxController {
  var auth = <Auth>[].obs;
  RxBool isLoading = false.obs;
  var repo = Auth_Repository();

  login(String email, String password) async {
    try {
      isLoading.value = true;

      auth.clear();

      var report = await repo.login(email, password);
      print(report);

      if (report != null) {
        auth.add(report);
        update();
        print(report);

        isLoading.value = false;

        Get.snackbar("صح", "تم الدخول بنجاح",
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.to(const MainTabView());
       
      } else {
        Get.snackbar("خطأ", "يرجى التأكد من حالة الحساب أو من إسم المستخدم وكلمة المرور",
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
  

}