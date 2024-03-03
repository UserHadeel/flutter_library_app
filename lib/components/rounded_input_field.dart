import 'package:flutter/material.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedInputField({
    super.key, 
    required this.hintText, 
    this.icon= Icons.person, 
    required this.onChanged,
    required this.controller,
    
  });

  @override
  Widget build(BuildContext context) {
    return  TextFieldContainer(
      child: Directionality(
        textDirection: TextDirection.rtl,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            color:TColor.primary,
            Icons.person 
            ),
          hintText:"الريد الألكتروني",
          border: InputBorder.none
          ) ,
      ),
      ),
      );
  }
}
