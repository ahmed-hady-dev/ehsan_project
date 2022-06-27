import 'package:ehsan_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FirstNameTextField extends StatelessWidget {
  final String hintText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;

  const FirstNameTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onFieldSubmitted,
    this.focusNode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return "لا يجب أن يكون الاسم الاول فارغ";
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
        ),
      ),
    );
  }
}
