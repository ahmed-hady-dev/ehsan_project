// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class LastNameTextField extends StatelessWidget {
  final String hintText;
  final FocusNode? focusNode;

  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;

  const LastNameTextField(
      {Key? key, required this.hintText, required this.controller, this.focusNode, required this.onFieldSubmitted})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return "لا يجب أن يكون الاسم الاخير فارغ";
        } else {
          return null;
        }
      },
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(
            Icons.person_outlined,
            color: AppColors.blue6,
          )),
    );
  }
}
