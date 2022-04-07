import 'package:ehsan_project/view/login/controller/login_cubit.dart';
import 'package:flutter/material.dart';

import '../../../widgets/email_text_field.dart';
import '../../../widgets/password_text_field.dart';

class PersonColumn extends StatelessWidget {
  final LoginCubit cubit;
  const PersonColumn({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EmailTextField(
            hintText: "البريد الإلكتروني",
            controller: cubit.emailController,
            onFieldSubmitted: (value) {
              if (cubit.formKey.currentState!.validate()) {}
            }),
        const SizedBox(height: 12.0),
        PasswordTextField(
          hintText: "كلمة المرور",
          controller: cubit.passwordController,
          onFieldSubmitted: (value) {
            if (cubit.formKey.currentState!.validate()) {}
          },
          obscureText: cubit.isPassword,
          onPressed: () => cubit.changePasswordVisibility(),
          icon: cubit.suffix,
        ),
      ],
    );
  }
}
