import 'package:flutter/material.dart';
import 'package:library_app/common/color_extantion.dart';


class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "حول التطبيق",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
               ),
          ),
          centerTitle: true,
          backgroundColor: TColor.primary),
      body: Column(children: [
        const SizedBox(
          height: 15,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 220,
          width: 600,
          child: Image.asset("assets/images/about.jpg", fit: BoxFit.cover),
          
        ),
        const Text(
          'مرحبا بكم في تطبيق مكتبتي',
          style: TextStyle(
              fontFamily: 'amiri',
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Color.fromARGB(255, 38, 129, 41)),
        ),
        const SizedBox(
          height: 26,
        ),
        const Text(
          ' مجمع الثقافة والعلم والمعرفة',
          style: TextStyle(
              fontFamily: 'amiri', fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: const Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              'مكتبتي هي مكتبة الالكترونية خاصة بجامعة طرابلس، قمنا بتطوير هذا التطبيق لهدف مساعدة طلاب وموظفين الجامعة في البحث عن الكتب ومشاريع التخرج والمجلات العلمية وتسهيل عملية استعارتهم كما يتيح لهم تحميل بعض هذه الموارد.',
            style: TextStyle(
              // fontFamily: 'NotoNaskhArabic',
              fontSize: 18),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.copyright),
            Text(
              '2024حقوق النشر محفوظة',
              style:
                  TextStyle( fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ]),
    );
  }
}
