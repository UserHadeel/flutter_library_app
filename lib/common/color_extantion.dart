
import 'package:flutter/material.dart';

class TColor {
  static Color get primary => const Color(0xFF5ABD8C);
  static Color get primaryLightColor =>const Color(0xFFE2F5EA);
  // static Color get primary => const Color(0xFF6F35A5);
  // static Color get primaryLightColor => Color.fromARGB(255, 223, 201, 251);
  static Color get primaryLight =>const Color(0xFF8A5AC9);
  static Color get text => const Color(0xff212121);
  static Color get wtext => const Color(0xFFFFFCFC);
static Color get subTitle => const Color(0xff212121).withOpacity(0.4);
static Color get textbox => const Color(0xffEFEFEF).withOpacity(0.6);

  

  static List<Color> get button => const [  Color(0xff5ABD8C), Color(0xff00FF81), ];

  static List<Color> get searchBGColor => const [
        Color(0xffB7143C),
        Color(0xffE6A500),
         Color(0xffEF4C45),
        Color(0xffF46217),
         Color(0xff09ADE2),
        Color(0xffD36A43),
                //  Color.fromARGB(255, 244, 247, 243),

      ];
}

class DarkTColor {
  static Color get primary => const Color(0xFF07040A);
  static Color get primaryLightColor => const Color(0xFF434246);
  static Color get text => const Color(0xFFFFFFFF);
  static Color get wtext =>const Color(0xFF0A0A0A);
  static Color get subTitle => const Color(0xFFFFFFFF).withOpacity(0.4);
  static Color get textbox => const Color(0xFF000000).withOpacity(0.6);

   static List<Color> get searchBGColor => const [
        Color(0xffB7143C),
        Color(0xffE6A500),
         Color(0xffEF4C45),
        Color(0xffF46217),
         Color(0xff09ADE2),
        Color(0xffD36A43),
      ];
}