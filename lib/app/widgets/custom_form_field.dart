import 'package:flutter/material.dart';

import '../common/utils/shared_code.dart';
import 'custom_text_form_field.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextInputType inputType;
  final String? Function(String?)? validate;
  const CustomFormField(
      {super.key,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.inputType,
      this.validate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        CustomTextFormField(
          borderRadius: 8,
          validator: validate,
          hintText: hintText,
          controller: controller,
          maxLines: 1,
          textInputType: inputType,
        ),
      ],
    );
  }
}
