import 'package:ehsan_project/core/router/router.dart';
import 'package:ehsan_project/view/home/home_view.dart';
import 'package:ehsan_project/view/login/components/organization_column.dart';
import 'package:ehsan_project/view/login/components/text_button_row.dart';
import 'package:ehsan_project/view/login/controller/login_cubit.dart';
import 'package:ehsan_project/view/login/components/login_text.dart';
import 'package:ehsan_project/widgets/loading_widget.dart';
import 'package:ehsan_project/widgets/main_button.dart';
import 'package:ehsan_project/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/logo_image.dart';
import 'components/person_column.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {}
          },
          builder: (context, state) {
            final cubit = LoginCubit.get(context);
            return Form(
              key: cubit.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  const LogoImage(),
                  const LoginText(),
                  const Divider(color: Colors.black),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RoundedButton(
                          text: 'فرد',
                          onPressed: () {
                            if (!cubit.isPersonSelected) {
                              cubit.changeSelectedButton();
                            }
                          },
                          isSelected: !cubit.isPersonSelected),
                      Text('أو', style: Theme.of(context).textTheme.headline6),
                      RoundedButton(
                          text: 'مؤسسة',
                          onPressed: () {
                            if (cubit.isPersonSelected) {
                              cubit.changeSelectedButton();
                            }
                          },
                          isSelected: cubit.isPersonSelected),
                    ],
                  ),
                  cubit.isPersonSelected ? PersonColumn(cubit: cubit) : OrganizationColumn(cubit: cubit),
                  const TextButtonRow(),
                  const SizedBox(height: 32.0),
                  state is LoginLoadingState
                      ? const LoadingWidget()
                      : MainButton(
                          text: "تسجيل الدخول",
                          horizontalPadding: 0,
                          onPressed: () async {
                            if (cubit.formKey.currentState!.validate()) {
                              MagicRouter.navigateAndPopAll(const HomeView());
                            }
                          },
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
