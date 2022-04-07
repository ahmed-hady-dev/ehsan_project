// ignore_for_file: implementation_imports

import 'package:ehsan_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onFieldSubmitted,
    required this.obscureText,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final Function(String) onFieldSubmitted;
  final bool obscureText;
  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return "يجب ألا تكون كلمة المرور فارغة";
        } else if (value.length < 6) {
          return "يجب أن تتكون كلمة المرور من 6 أرقام على الأقل";
        } else if (value.contains(' ')) {
          return "لا يمكن أن تحتوي كلمة المرور على مسافة.";
        } else {
          return null;
        }
      },
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        prefixIcon: const Icon(
          Icons.lock_outlined,
          size: 24.0,
          color: AppColors.blue6,
        ),
        suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: AppColors.blue6,
            )),
      ),
    );
  }
}
