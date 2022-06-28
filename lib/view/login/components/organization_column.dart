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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(right: 12.0, bottom: 8.0),
          child: Text('إسم الجمعية', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
        ),
        EmailTextField(
            hintText: "اكتب الاسم بالكامل",
            controller: cubit.emailController,
            onFieldSubmitted: (value) {
              if (cubit.formKey.currentState!.validate()) {}
            }),
        const SizedBox(height: 8.0),
        const Padding(
          padding: EdgeInsets.only(right: 8.0, bottom: 8.0),
          child: Text('الكود السري', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
        ),
        PasswordTextField(
          hintText: "اكتب كود المؤسسة",
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
