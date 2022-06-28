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

import '../../core/router/router.dart';
import '../../widgets/solid_color_button.dart';
import '../login/components/text_button_row.dart';
import '../login/login_view.dart';
import 'components/address_text_field.dart';
import 'components/blood_type_text_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7ED0CF),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, bottom: 4.0),
                    child: Text('سجل دخولك مجاناَ !',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColors.darkBlue, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0, bottom: 4.0),
                    child: Text('الإسم', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
                  ),
                  FirstNameTextField(
                    hintText: "اكتب الاسم بالكامل",
                    controller: cubit.firstNameController,
                    focusNode: cubit.firstNameFocusNode,
                    onFieldSubmitted: (_) => cubit.lastNameFocusNode.requestFocus(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0, bottom: 4.0),
                    child: Text('البريد الالكتروني', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
                  ),
                  EmailTextField(
                    hintText: "اكتب البريد الالكتروني",
                    controller: cubit.emailController,
                    focusNode: cubit.emailFocusNode,
                    onFieldSubmitted: (_) => cubit.passwordFocusNode.requestFocus(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0, bottom: 4.0),
                    child: Text('كلمة المرور', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
                  ),
                  PasswordTextField(
                      hintText: "اكتب كلمة المرور",
                      controller: cubit.passwordController,
                      focusNode: cubit.passwordFocusNode,
                      onFieldSubmitted: (_) => cubit.confirmPasswordFocusNode.requestFocus(),
                      obscureText: cubit.isPassword,
                      onPressed: () => cubit.changePasswordVisibility(),
                      icon: cubit.suffix),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0, bottom: 4.0),
                    child: Text('تأكيد كلمة المرور', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
                  ),
                  ConfirmPasswordTextField(
                      hintText: "تأكيد كلمة المرور",
                      controller: cubit.confirmPasswordController,
                      focusNode: cubit.confirmPasswordFocusNode,
                      onFieldSubmitted: (_) => cubit.phoneFocusNode.requestFocus(),
                      obscureText: cubit.isPasswordConfirm,
                      onPressed: () => cubit.changeConfirmPasswordVisibility(),
                      icon: cubit.suffixConfirm),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0, bottom: 4.0),
                    child: Text('رقم الهاتف', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
                  ),
                  PhoneTextField(
                      hintText: "اكتب رقم الهاتف",
                      controller: cubit.phoneController,
                      focusNode: cubit.phoneFocusNode,
                      onFieldSubmitted: (_) => cubit.bloodTypeFocusNode.requestFocus()),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0, bottom: 4.0),
                    child: Text('فصيلة الدم', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
                  ),
                  BloodTypeTextField(
                      hintText: "اكتب فصيلة الدم",
                      controller: cubit.bloodTypeController,
                      focusNode: cubit.bloodTypeFocusNode,
                      onFieldSubmitted: (_) => cubit.addressFocusNode.requestFocus()),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0, bottom: 4.0),
                    child: Text('العنوان', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
                  ),
                  AddressTextField(
                      hintText: "اكتب العنوان",
                      controller: cubit.addressController,
                      focusNode: cubit.addressFocusNode,
                      onFieldSubmitted: (_) => cubit.registerWithEmail()),
                  const SizedBox(height: 12.0),
                  state is RegisterLoadingState
                      ? const LoadingWidget()
                      : SolidColorButton(
                          text: 'إنشاء حساب',
                          onPressed: () => cubit.registerWithEmail(),
                        ),
                  Center(
                    child: TextButtonRow(
                      text: 'لديك حساب ؟ تسجيل الدخول',
                      onPressed: () => MagicRouter.navigateAndPopAll(
                        const LoginView(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
