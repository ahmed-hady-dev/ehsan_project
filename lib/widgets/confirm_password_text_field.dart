import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onFieldSubmitted,
    required this.obscureText,
    required this.onPressed,
    required this.icon,
    this.focusNode,
  }) : super(key: key);

  final String hintText;
  final TextEditingController? controller;
  final Function(String) onFieldSubmitted;
  final bool obscureText;
  final Function() onPressed;
  final IconData icon;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'لا يمكن أن يكون الحقل فارغ';
        } else if (value.length < 6) {
          return "لا يمكن أن يكون أقل من 6 حروف";
        } else if (value.contains(' ')) {
          return "لا يمكن أن يحتوي علي مسافات";
        } else {
          return null;
        }
      },
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
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
