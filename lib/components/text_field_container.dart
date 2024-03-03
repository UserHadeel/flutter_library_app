import 'package:flutter/material.dart';
import 'package:library_app/common/color_extantion.dart';
class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size; //this size provide us total height and width of our screen
    return Container(
      margin: const EdgeInsets.symmetric(vertical:5 ),
      padding: const EdgeInsets.symmetric(horizontal:20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: TColor.primaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child ,
    );
  }
}
