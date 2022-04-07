import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:ehsan_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
      child: AutoSizeText(
        'تسجيل الدخول',
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6!.copyWith(color: AppColors.blue6, fontSize: 24),
      ),
    );
  }
}
