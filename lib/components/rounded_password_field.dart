import 'package:flutter/material.dart';
import 'package:library_app/common/color_extantion.dart';
import 'package:library_app/components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged; 
    final TextEditingController controller;

  const RoundedPasswordField({
    super.key, required this.onChanged, required this.controller,
  });

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Directionality(
        textDirection: TextDirection.rtl,
      child: TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscured,
      focusNode: textFieldFocusNode,
        onChanged: widget.onChanged,
        controller: widget.controller,
        // obscureText: true,
        decoration: InputDecoration(
          // obscureText: true,
          hintText: "كلمة السر",
          icon: Icon(
            Icons.lock, 
            color: TColor.primary,
            ),
            suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: GestureDetector(
            onTap: _toggleObscured,
            child: Icon(
              _obscured
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              size: 24,
            ),
          ),
        ),
            border: InputBorder.none,
          ),
      ),
      ),
      );
  }
}