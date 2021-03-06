// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
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
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'لا يمكن أن يكون الحقل فارغ';
        } else if (!value.contains('@')) {
          return "يجب أن يكون الايميل الاكتروني صحيح";
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
