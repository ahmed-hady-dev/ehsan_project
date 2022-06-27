import 'package:ehsan_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String headerText;
  final String buttonText;
  final VoidCallback onPressed;
  final bool showButton;
  const SectionHeader({
    Key? key,
    required this.headerText,
    required this.buttonText,
    required this.onPressed,
    this.showButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            headerText,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.blue6,
                  fontWeight: FontWeight.w100,
                ),
          ),
          showButton
              ? TextButton(
                  onPressed: onPressed,
                  child: Text(buttonText,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.blue6, decoration: TextDecoration.underline, fontWeight: FontWeight.normal)),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
