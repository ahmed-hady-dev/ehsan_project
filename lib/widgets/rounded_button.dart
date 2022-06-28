import 'package:ehsan_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isSelected;
  final double borderRadius = 22;

  const RoundedButton({required this.text, required this.onPressed, Key? key, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(isSelected ? AppColors.darkBlue : Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: isSelected ? const BorderSide(color: Colors.transparent) : const BorderSide(color: AppColors.blue6),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: isSelected ? Colors.white : AppColors.darkBlue, fontSize: 24.0),
        ),
      ),
    );
  }
}
