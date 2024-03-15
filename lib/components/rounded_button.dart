import 'package:flutter/material.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/constants.dart';


class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    super.key, 
    required this.text,
     required this.press,
      this.color = const Color(0xFF5ABD8C), 
      this.textColor = Colors.white, required Null Function() onPressed,
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 17),
      width: size.width * 0.8,
      child: ClipRRect(
        child: ElevatedButton(
          style:ElevatedButton.styleFrom(
         // primary: TColor.primary,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal:40 )
          
          // elevation: 4,
                ),
          onPressed: press as void Function(),
           child: Text(
           text,
           style: TextStyle(color: textColor),
           ),
           ),
      ),
    );
  }
}