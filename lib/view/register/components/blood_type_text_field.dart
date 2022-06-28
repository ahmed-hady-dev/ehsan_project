import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class BloodTypeTextField extends StatelessWidget {
  const BloodTypeTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);
  final String hintText;
  final FocusNode? focusNode;

  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "برجاء إدخال فصيلة الدم";
        } else {
          return null;
        }
      },
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
