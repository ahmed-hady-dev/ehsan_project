import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class SolidColorButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double? verticalPadding;
  final double? horizontalPadding;
  const SolidColorButton(
      {required this.text, required this.onPressed, Key? key, this.verticalPadding = 12, this.horizontalPadding = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xffffffff);

    const double borderRadius = 18;

    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: verticalPadding!, horizontal: horizontalPadding!),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius), color: AppColors.darkBlue),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: accentColor, fontSize: 18),
          ),
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              alignment: Alignment.center,
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0)),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
              )),
        ));
  }
}
