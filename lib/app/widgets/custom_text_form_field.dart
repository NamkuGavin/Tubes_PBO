import 'package:flutter/material.dart';

import '../common/constant/color_value.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final bool autocorrect;
  final bool enableSuggestions;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final double borderRadius;
  final int maxLines;
  final Function(String?)? onChanged;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.validator,
      this.borderRadius = 8,
      this.obscureText = false,
      this.autocorrect = false,
      this.enableSuggestions = false,
      this.suffixIcon,
      required this.maxLines,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      maxLines: maxLines,
      keyboardType: textInputType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12, color: MyColor.neutral900.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 1,
            color: MyColor.neutral900,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 1,
            color: MyColor.neutral900,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 2,
            color: MyColor.mainBlue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 2,
            color: MyColor.mainRed,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: 2,
            color: MyColor.mainRed,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
