import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({
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
      keyboardType: TextInputType.streetAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "يجب ألا يكون العنوان فارغ";
        } else {
          return null;
        }
      },
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(
            Icons.home_outlined,
            color: AppColors.blue6,
          )),
    );
  }
}
