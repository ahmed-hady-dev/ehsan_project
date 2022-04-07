import 'package:flutter/material.dart';
import 'package:ehsan_project/core/router/router.dart';
import 'package:ehsan_project/view/register/register_view.dart';

class TextButtonRow extends StatelessWidget {
  const TextButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TextButton(
          onPressed: () => MagicRouter.navigateTo(const RegisterView()),
          child: Text('ليس لديك حساب؟ إنشاء حساب', style: Theme.of(context).textTheme.subtitle1),
        ),
      ],
    );
  }
}
