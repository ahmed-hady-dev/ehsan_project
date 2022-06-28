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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(right: 12.0, bottom: 8.0),
          child: Text('البريد الإلكتروني', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
        ),
        EmailTextField(
            hintText: " اكتب البريد الإلكتروني",
            controller: cubit.emailController,
            onFieldSubmitted: (value) {
              if (cubit.formKey.currentState!.validate()) {}
            }),
        const SizedBox(height: 8.0),
        const Padding(
          padding: EdgeInsets.only(right: 8.0, bottom: 8.0),
          child: Text('كلمة المرور', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
        ),
        PasswordTextField(
          hintText: "اكتب كلمة المرور",
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
