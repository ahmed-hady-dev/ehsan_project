import 'package:flutter/material.dart';

import '../../../widgets/email_text_field.dart';
import '../../../widgets/password_text_field.dart';
import '../controller/login_cubit.dart';

class OrganizationColumn extends StatelessWidget {
  final LoginCubit cubit;

  const OrganizationColumn({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EmailTextField(
            hintText: "إسم الجمعية",
            controller: cubit.emailController,
            onFieldSubmitted: (value) {
              if (cubit.formKey.currentState!.validate()) {}
            }),
        const SizedBox(height: 12.0),
        PasswordTextField(
          hintText: "الكود السري",
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
