import 'package:ehsan_project/constants/app_colors.dart';
import 'package:ehsan_project/core/router/router.dart';
import 'package:ehsan_project/view/home/home_view.dart';
import 'package:ehsan_project/view/interests/interests_view.dart';
import 'package:ehsan_project/view/login/components/organization_column.dart';
import 'package:ehsan_project/view/login/components/text_button_row.dart';
import 'package:ehsan_project/view/login/controller/login_cubit.dart';
import 'package:ehsan_project/view/login/components/login_text.dart';
import 'package:ehsan_project/widgets/loading_widget.dart';
import 'package:ehsan_project/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/logo_image.dart';
import '../../widgets/solid_color_button.dart';
import '../register/register_view.dart';
import 'components/person_column.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7ED0CF),
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
                  const Divider(color: AppColors.darkBlue, thickness: 2.0),
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
                      Text('أو', style: Theme.of(context).textTheme.headline6!.copyWith(color: AppColors.darkBlue)),
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
                  TextButtonRow(
                    text: 'ليس لديك حساب؟ سجل الان',
                    onPressed: () => MagicRouter.navigateTo(
                      const RegisterView(),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  state is LoginLoadingState
                      ? const LoadingWidget()
                      : SolidColorButton(
                          text: "تسجيل الدخول",
                          horizontalPadding: 0,
                          onPressed: () async {
                            if (cubit.formKey.currentState!.validate()) {
                              MagicRouter.navigateAndPopAll(const InterestsView());
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
