import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:ehsan_project/view/register/components/date_text_field.dart';
import 'package:ehsan_project/widgets/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ehsan_project/constants/app_colors.dart';
import 'package:ehsan_project/view/register/Controller/register_cubit.dart';
import 'package:ehsan_project/view/register/Controller/register_state.dart';
import 'package:ehsan_project/widgets/confirm_password_text_field.dart';
import 'package:ehsan_project/widgets/email_text_field.dart';
import 'package:ehsan_project/widgets/loading_widget.dart';
import 'package:ehsan_project/widgets/main_button.dart';
import 'package:ehsan_project/widgets/first_name_text_field.dart';
import 'package:ehsan_project/widgets/password_text_field.dart';
import 'package:ehsan_project/widgets/phone_text_field.dart';
import 'package:ehsan_project/widgets/last_name_text_field.dart';

import 'components/address_text_field.dart';
import 'components/blood_type_text_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: AppColors.blue6),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            // if (state is RegisterSuccessState) {
            //   if (state.userModel.tokenType == 'bearer') {
            //     Fluttertoast.showToast(msg: "register.success".tr());
            //     MagicRouter.navigateAndPopAll(const HomeView());
            //   } else if (state.userModel.errors!.email != null) {
            //     Fluttertoast.showToast(msg: state.userModel.errors!.email!.join());
            //   } else if (state.userModel.errors!.phone != null) {
            //     Fluttertoast.showToast(msg: state.userModel.errors!.phone!.join());
            //   }
            // }
          },
          builder: (context, state) {
            final cubit = RegisterCubit.get(context);
            return Form(
              key: cubit.formKey,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  const LogoImage(topPadding: 0, bottomPadding: 48.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: FirstNameTextField(
                            hintText: "الإسم الأول",
                            controller: cubit.firstNameController,
                            focusNode: cubit.firstNameFocusNode,
                            onFieldSubmitted: (_) => cubit.lastNameFocusNode.requestFocus(),
                          )),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 1,
                        child: LastNameTextField(
                          hintText: "الإسم الأخير",
                          controller: cubit.lastNameController,
                          focusNode: cubit.lastNameFocusNode,
                          onFieldSubmitted: (_) => cubit.emailFocusNode.requestFocus(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  EmailTextField(
                    hintText: "البريد الإلكتروني",
                    controller: cubit.emailController,
                    focusNode: cubit.emailFocusNode,
                    onFieldSubmitted: (_) => cubit.passwordFocusNode.requestFocus(),
                  ),
                  const SizedBox(height: 12.0),
                  PasswordTextField(
                      hintText: "كلمة السر",
                      controller: cubit.passwordController,
                      focusNode: cubit.passwordFocusNode,
                      onFieldSubmitted: (_) => cubit.confirmPasswordFocusNode.requestFocus(),
                      obscureText: cubit.isPassword,
                      onPressed: () => cubit.changePasswordVisibility(),
                      icon: cubit.suffix),
                  const SizedBox(height: 12.0),
                  ConfirmPasswordTextField(
                      hintText: "تأكيد كلمة السر",
                      controller: cubit.confirmPasswordController,
                      focusNode: cubit.confirmPasswordFocusNode,
                      onFieldSubmitted: (_) => cubit.phoneFocusNode.requestFocus(),
                      obscureText: cubit.isPasswordConfirm,
                      onPressed: () => cubit.changeConfirmPasswordVisibility(),
                      icon: cubit.suffixConfirm),
                  const SizedBox(height: 12.0),
                  PhoneTextField(
                      hintText: "رقم الهاتف",
                      controller: cubit.phoneController,
                      focusNode: cubit.phoneFocusNode,
                      onFieldSubmitted: (_) => cubit.bloodTypeFocusNode.requestFocus()),
                  const SizedBox(height: 12.0),
                  BloodTypeTextField(
                      hintText: "فصيلة الدم",
                      controller: cubit.bloodTypeController,
                      focusNode: cubit.bloodTypeFocusNode,
                      onFieldSubmitted: (_) => cubit.addressFocusNode.requestFocus()),
                  const SizedBox(height: 12.0),
                  AddressTextField(
                      hintText: "العنوان",
                      controller: cubit.addressController,
                      focusNode: cubit.addressFocusNode,
                      onFieldSubmitted: (_) => cubit.registerWithEmail()),
                  const SizedBox(height: 12.0),
                  state is RegisterLoadingState
                      ? const LoadingWidget()
                      : MainButton(
                          text: 'إنشاء حساب',
                          onPressed: () => cubit.registerWithEmail(),
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
