import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/screens/Welcome/welcome_screen.dart';

import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}
// void main() =>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primaryColor: TColor.primary,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.tajawalTextTheme()
      ), 
      home: const WelcomeScreen(),
      
    );
  }
}
